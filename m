Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70769CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+y8xiAhzmw08ETgEfxX8TrGytWnU7QehNrLVCufvbM=; b=bAu4N0MnT3i/H5KumweHiQ/Mah
	ZV+UeZ94ZAtP2NsyBkYiwCzRodSxXWVROrQRNUKNkeYXX//qZVujFY1BkYdJb6JWOa3kS9XK6quCI
	aKTS1knWFdMrVgbwEoTejqr3Hhi1l+tgXWu2ZBDEgUm/I+96TmBu/L5F1RWhZI6HU+whgL37JP9hr
	Ihklp01LB7cYqQdGZM86SIczo8bYrfySrroc6BwoFUhb0TzhRYbb01ilf91RlBJuoQaMxdbOekYOf
	Fhe+XD5PEIDtkobErhMt8mFcJrFTuTsjhatyHZC4/ifuRvW6PS+pGNfdsAbC59Hyw1DrAIDBcPSJ3
	pgDSbwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbOYS-000000048zB-0hT3;
	Sun, 21 Jun 2026 20:14:08 +0000
Received: from mail-vk1-xa61.google.com ([2607:f8b0:4864:20::a61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbOYP-000000048yJ-0aZ2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 20:14:06 +0000
Received: by mail-vk1-xa61.google.com with SMTP id 71dfb90a1353d-59d7db12342so1131890e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 13:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782072843; x=1782677643;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+y8xiAhzmw08ETgEfxX8TrGytWnU7QehNrLVCufvbM=;
        b=EkcY7/HIM0v9uT6+BXavurSFXO1N9RBUasGi8Hb1M/Rk8dynAo8iPmHiMmCqhfKuVs
         5lZyAEgs0iTuEJ9j8+4IS5HdPItKAY45IECpsQwBEL6SYBTmpNgiz/yLBxCvcQwj1sVV
         hwHmos95RxBOAmbyVjiisCJY6U3Lv/sTgQXFgsMu/KzF5+TOWWjsvuk18EZnDsyuV+f0
         9WaQ7nEW602dC3dliHTtup7CxMUpIeBugqcLAryxi/wmGvtmwyMGU0IyXrNF9Xy/ErRq
         LDC+y/gfe74EGm6EwVVBbMNpxFR09XM45ax5zmL0vumDnaYFNGj6qcQUyYmpoGDHqXjU
         wzRg==
X-Forwarded-Encrypted: i=1; AFNElJ8aR4w2WkojWFJjhtffE10R8tfU7aJDaCrr+PhVFW6yLGwF90oJ5mfNNbq7V7MT7J+xv2UXl37GgX4d0rxiskWr@lists.infradead.org
X-Gm-Message-State: AOJu0YzmeSz6ctUtiqpQIOjaXYkT+dAUHG4sq/BA8MW1WDKPb0Bkv8Xd
	/zObsP8tc7sRZtSI17wNwhZG9OHQ21l0GXLbsxKyTD1fbxLl2Ad8PFb+iBnV1pSJOJzUVuTiM57
	wGkq9NDZYi6WMz72/8tcj2v1s2o2Di8EFYwWP+NhExcxIMs69iqArrv6zbFHsUemT3N0i2sqPaO
	IBTOGleS3UsT7YV3HPxlFDquwjhhSPvn44tkYu/q2drbsmGtJHEqshbuuhhK1HyAL3jc2I7bAZs
	3Dw5mGtlhr+YP59UUMdPNMKaOtBRURpfsRN8A==
X-Gm-Gg: AfdE7cnUJQ0cQZTsWLxCzBtyfgUHoWH0PD9VAdjQxY/fyj9Ey1CNTiCif9l+mc574PQ
	KFKHTcyl31lFmI1oVRqGQU8QmeB2uO5cQAE/+iDPFgpXljKZBXbkG+GqaoXV2+IvgHPdQmt3KWD
	kxBH/RBsOXmsl/gohJKVUc00R0hIVG9eCFCWZQH/8gviP8VRujLiQ3yxPrInSKp330+u/F2QKTa
	BvGYXN+j/MyRa6fq4caR0rjQBFG66SnuY2zxUc5snETr9Qw20HKUQz+lU+BjUT0PAYrlpb51t9r
	0rSBBW/h6UAjTRhl+nccvEfL/RQl+gsNpXDHNH+ua09HuUDXmmSWbJthQMbUS/dxON+H5D2aC3L
	Y0g0nut7RPICbW2wlgX0fIUMjTltM9FHLtgCob71J3W1lhOYyNDhb1so839ZV5Mu2zImmwkNLdw
	emTIvaMJLQsKCe62ccK+coY/8cqYutbNFuftZQy2AK27YvO31se8VtlQ==
X-Received: by 2002:a05:6122:1805:b0:59e:6c31:5aae with SMTP id 71dfb90a1353d-5bbebb786dfmr5506994e0c.5.1782072843326;
        Sun, 21 Jun 2026 13:14:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-9670c23f967sm315389241.5.2026.06.21.13.14.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:14:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-465874136a7so1378750f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 13:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782072841; x=1782677641; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E+y8xiAhzmw08ETgEfxX8TrGytWnU7QehNrLVCufvbM=;
        b=EghE3jrdB2P9NB+nym+0UIVz+85MTOVgLPGqGmWxkSIo72X0xFIEXmsO5PplH+zB5D
         Mz2eUi8duilreK0v4ZIZ0T6DJB4tmWzLSfVOHaowWYhyvJR8Im14D9pL6Vhzg8uEQB9w
         q3k3UySvdeBHXiEA1raWR4/3a3dPC0TZ+0Kaw=
X-Forwarded-Encrypted: i=1; AHgh+Rp//Uh9riOGb7OKSMCFf2rnkSXaDRIFKHI55Z36ha5WPNFD2cuoIl2gQMtVKxH8cR+5xlYyM/3fg0z5yicSjt4A@lists.infradead.org
X-Received: by 2002:a05:6000:2881:b0:460:3a90:b2b6 with SMTP id ffacd0b85a97d-46660c10621mr12183882f8f.11.1782072841263;
        Sun, 21 Jun 2026 13:14:01 -0700 (PDT)
X-Received: by 2002:a05:6000:2881:b0:460:3a90:b2b6 with SMTP id ffacd0b85a97d-46660c10621mr12183847f8f.11.1782072840759;
        Sun, 21 Jun 2026 13:14:00 -0700 (PDT)
Received: from [10.225.97.41] (aerospot-mask5-183-2-inet.hub-one.net. [149.232.183.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5413sm20505403f8f.11.2026.06.21.13.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:14:00 -0700 (PDT)
Message-ID: <2f37b826-b760-4735-bc33-e1f167729d52@broadcom.com>
Date: Sun, 21 Jun 2026 22:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Raise ASB poll timeout to
 100us
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, Ulf Hansson <ulfh@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260530204636.1115120-1-mcanal@igalia.com>
 <deecc409-02c1-4393-bc06-1852fc06e4d1@gmx.net>
 <eba66b9e-520e-4afc-8973-d54b22919d2c@igalia.com>
 <4af63689-e08c-406e-9ec3-f56dcbfb6f91@igalia.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <4af63689-e08c-406e-9ec3-f56dcbfb6f91@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_131405_202916_5D6FD1B7 
X-CRM114-Status: GOOD (  18.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 6/19/2026 2:57 PM, Maíra Canal wrote:
> Hi,
> 
> On 31/05/26 09:18, Maíra Canal wrote:
>> Hi Stefan,
>>
>> On 31/05/26 07:41, Stefan Wahren wrote:
>>> Hi Maíra,
>>>
>>> Am 30.05.26 um 22:46 schrieb Maíra Canal:
>>>> Commit 18605b1b936b ("pmdomain: bcm: bcm2835-power: Increase ASB 
>>>> control
>>>> timeout") raised the ASB handshake polling budget from 1us to 5us.
>>>> Surveying the pmdomain subsystem, 5us is still one of the smallest 
>>>> polling
>>>> budgets by a wide margin. Comparable handshakes in other drivers use:
>>>>
>>>>    - 100us : starfive jh71xx-pmu, apple pmgr-pwrstate
>>>>    - 1ms   : renesas rcar-sysc, rmobile-sysc (power-on)
>>>>    - 10ms  : renesas rcar-gen4-sysc, sunxi sun55i-pck600
>>>>    - 1s    : mediatek mtk-pm-domains, mtk-scpsys
>>>>
>>>> Raise the BCM2835 timeout to 100us, matching analogous drivers. 
>>>> 100us is
>>>> still negligible relative to a power-domain transition and gives the 
>>>> V3D
>>>> master ASB substantially more headroom to drain under heavy workloads,
>>>> assuring us that the timeout is enough for any scenario.
>>> tbh I'm not convinced by this explanation. Starting with a timeout 
>>> comparison across different pmdomain driver looks strange to me.
>>>
>>> My expectation that the reason for such a patch is that there is some 
>>> kind of scenario to trigger unexpected timeouts.
>>> If this is the case, please provide more information about the 
>>> scenario (specific platform, scenario, link to the bug report).
>>
>> The context: I was debugging this issue [1] and initially I had the
>> intuition that it could be related to a timeout in the ASB polling loop.
>> As I don't have access to the BCM2835 SoC datasheet (the public one
>> doesn't have PM information), I started to check other driver's
>> handshake timeout to see if ours was comparable to similar drivers. As
>> you can see, our timeout is much smaller.
>>
>> In the end, issue [1] wasn't related to the pmdomain driver, so I don't
>> have a specific scenario to trigger this issue. Even though, I sent this
>> patch considering the comparison to other drivers with the goal to be
>> conservative and use a larger timeout that could accommodate an extreme
>> scenario. However, if you believe it's unreasonable, I'm okay dropping
>> this patch.
>>
>> Ideally, it would be great to have information from Broadcom on what's
>> the largest possible time required to perform a power transition. Maybe
>> Florian could help us with that?
>>
> 
> Gentle ping, any ideas about this?

I think it's reasonable in the sense that if there is a lot of traffic 
posted on the AXI asynchronous bridge it will take longer for the 
acknowledgement to come, I asked the designers whether 100us is 
reasonable or not and will get back to you as soon as I get an answer.
-- 
Florian


