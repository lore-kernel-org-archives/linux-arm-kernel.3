Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239D8CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7yfMSKVog9zrx0IzSOm5CThV+YrzQFJbwE5ZBoSV/E=; b=0KVSM0l717hgB4fluUxUwkj2sU
	DV54h9+R+HFsATewbnRpCDL6AUeOKYrOfSzPIXKKxf6qMqQ8aD9rsMVH9CsjXjt0CROhd3TNBlrcc
	uiWVqfXcBpcErSFthLRUE5Q6pixAeZaU+Y2NMPzSgVqzBolPjb23DDN0Eo9qx/G555Nn4O6+xcc5/
	6G6yLmHTtM4WUqwxVvYQnfl98CunjrK3kYMxzmE3mzCtNfDWg9OBoTYlZ6HBJK7P0tC1gBuhKaE67
	8WVddB53BL+q/0qFTbnou8zruHYE/ue4oOAJ9eVZi0FTMUMGmqktzffa4DxgxCdGNy1TmwYHQyZ5+
	DXjvM6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kj-000000079Zo-3RYm;
	Sat, 30 Aug 2025 00:47:33 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us215-00000006PPP-0hH5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:31:56 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-24456ce0b96so25849475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756485114; x=1757089914;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7yfMSKVog9zrx0IzSOm5CThV+YrzQFJbwE5ZBoSV/E=;
        b=gvbe5PXmssWdowKahliYpSdRRkpWaqJX2MmsUuFTIed3kkAm8ojgv4UyckHrwp3xcv
         NVnIOo5Fv7xC49JrhvrlINJf7/woryMfvPQWSNBI933K+6kADk+VdL6rw5Bb1Om3Giha
         qAAXPw4GZCxszX9XKzzM/64tJ4fT13ur9OxYzA4ukSKJDe0h3msXuZiRYLJ1GrlaLmMl
         awIGtyTBTp0nwVzSpcjWdDnSBbSBSJK037LrGqxKzKFKRYe+eCCDu+kg+zLn5K1QWyWe
         /pmo0Id4wJ6+trAUdT3P8QjofxD7aL78Zhkfb/hNwqyniu8FbZ6dcGtSSadquI+0UyxV
         KDrA==
X-Forwarded-Encrypted: i=1; AJvYcCXTmqNUNU8btbXrj6hn0CSnrSQtwut2j3i5Ml2xHrgCuwkuJ5uHHgvdqGYTWW7O8u932suwHs6koMiHMmn8XKOo@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+XWbQA+elPB6Sii8eePP1x/iwCQrtzNz7rYt923YE5K0t15g
	Qli0UU2RwkOB7UE422+Vl82oYvaAnDS6quYyMPAGUVuY/e6X1FyzuDynsFWtvgIfv0xfMKBO8s0
	dxZWO5RURSn2qg4gMsJiFSd2Wo2/PnGWQnMSEz2KGgdr8q2sdCfGgHnHHf2fQjCZiqKUAnYDTQj
	M70KZpckOX1euTvDsW5jSXU+1reqoCf9caNJK0RjES6yofNLJpP/pRXJJjJtYO6DNmQkQ5GgD+7
	o7GGW49HuYASgJhRZJcoJvEAIR8cIoz3KQ=
X-Gm-Gg: ASbGncsaGVAhfYlqsR8rAkKZMGW0fox/gxAxQhdSmg/Wi0d29srSd8dc0XgrZ8KEbtx
	i0bdyCVI2W7jWTOGoIa69j175B0rk21PjUtpcuir+cnxmeV6l5F1K/ATSb7Rjq5cXGQhtP7IoET
	kcOXvcbSwV3WzTjNFGDr4Xn7szCl784vRrJFUhtgXMjvZhR3xuDGIQeDg+4umTfx8JaHkfPPPiA
	kyCcQoFmASekf28mYyk0fBlcub6HXcghdrMnyWk3+RMSnjhHdzjwsJPvnF5FjWq/rlBlpS1SYwu
	dNGGD7KTtVcSxbNWcsHpbeR4oBzgTHj2uLrtUb2/oAaUq9LBiu+qhBEM5ofq6/vSrgVnWDoTXTX
	OF/hVsse6Jo3Yn6OXa2IfW2pnSetYyQW7UQv7BdQYjboXRNjrSuM4Pm4UcYfvuSfTZAWIwj9O6y
	13KlSh
X-Google-Smtp-Source: AGHT+IGpV/JKTgEZw+SEv5BweBWYozcoDmMZE8LncoSdPw5h3T1p82SV2kH+fWd2UADrD99RkuDSsF4NnwlR
X-Received: by 2002:a17:902:e883:b0:249:37b2:8630 with SMTP id d9443c01a7336-24937b28708mr5235435ad.5.1756485114326;
        Fri, 29 Aug 2025 09:31:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2490627c1fdsm2133515ad.62.2025.08.29.09.31.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Aug 2025 09:31:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e86f8f27e1so518334185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756485113; x=1757089913; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q7yfMSKVog9zrx0IzSOm5CThV+YrzQFJbwE5ZBoSV/E=;
        b=hX20N8eCS4rqhOl6494FiuHWaaqWTedJYxuJcL2PiQzQ/dmTAWklr7+XmFaz4m16gT
         JfJq+vRFPKtuUtLiGgcekNpNZmvAdfzVvDszcdoz08xk1dDP67q0Z6LJ3CVOJ7UeLtkO
         jb/Cp8dl2OjBLJUUoJS6Badn4SoxnGfKKaEZs=
X-Forwarded-Encrypted: i=1; AJvYcCXGCufXPsndGTAJ3xAuC4buzAjIPLC0GREckwUovchvTnIvihJTM7fstlOLWjZrovVj/7DhgeMEsh29S1C0HEaB@lists.infradead.org
X-Received: by 2002:a05:620a:46ab:b0:7f0:5524:477b with SMTP id af79cd13be357-7f58da36412mr1648510785a.3.1756485112950;
        Fri, 29 Aug 2025 09:31:52 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:7f0:5524:477b with SMTP id af79cd13be357-7f58da36412mr1648503985a.3.1756485112272;
        Fri, 29 Aug 2025 09:31:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fcbc17487bsm142438285a.27.2025.08.29.09.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 09:31:51 -0700 (PDT)
Message-ID: <c76ab4d7-37aa-4d99-888d-e0762deb2342@broadcom.com>
Date: Fri, 29 Aug 2025 09:31:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
 <aLF_DEu6YNSCSRxu@alpha.franken.de>
 <dcb0c746-62ed-48f6-9247-03bdf36c6e92@kernel.org>
 <60e55e14-7712-4f82-93af-6751009327fd@kernel.org>
 <aLHI7arPfcMDEhzM@alpha.franken.de>
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
In-Reply-To: <aLHI7arPfcMDEhzM@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_093155_273897_46E819C3 
X-CRM114-Status: GOOD (  16.21  )
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

On 8/29/25 08:36, Thomas Bogendoerfer wrote:
> On Fri, Aug 29, 2025 at 12:39:00PM +0200, Krzysztof Kozlowski wrote:
>> On 29/08/2025 12:37, Krzysztof Kozlowski wrote:
>>> On 29/08/2025 12:21, Thomas Bogendoerfer wrote:
>>>> On Tue, Jul 29, 2025 at 01:52:11PM -0700, Florian Fainelli wrote:
>>>>> This patch series updates the MIPS-based Broadcom STB chips to use a
>>>>> proper compatible string for their memory controller node(s) after
>>>>> 501be7cecec9 ("dt-bindings: memory-controller: Define fallback
>>>>> compatible").
>>>>>
>>>>> Florian Fainelli (2):
>>>>>    dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
>>>>>    MIPS: BMIPS: Properly define memory controller compatible
>>>>>
>>>>>   .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
>>>>>   arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
>>>>>   arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
>>>>>   arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
>>>>>   arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
>>>>>   arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
>>>>>   6 files changed, 18 insertions(+), 7 deletions(-)
>>>>
>>>> series applied to mips-next.
>>>
>>> Why entire series? You were notified two weeks ago that I already took
>>> the driver subsystem patch.
> 
> I haven't got a mail in this thread from you about taking the first patch.

That is curious, it was in response to patch #1 and you were copied:

https://lore.kernel.org/all/175508140104.40429.8279921018476182386.b4-ty@linaro.org/

> 
>> ...and you do not have even ack from memory-controllers for that patch.
> 
> sorry, I'll drop the patch then.

Thanks!
-- 
Florian

