Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 22:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmAUQ7/+zUObwciiWZMTJrtfdcrbslFS3HzxJfkmp/E=; b=q92OzgVTu6dvfFQLlN9V/jPrJ5
	uIX9MCZ0cGDx0oi/Ll8ihrls4HV7aBI8/WF2thAPBBRTXs5PjYmExUKmLGgeeVraxIIBkCAX6mpXV
	WcLXbikWA3xdLKSjVBjVdBABeTPkuIIfJaO3wosrhXRlGASRPNAvSa+qFyx8oqlhCTkifKvrTRhI+
	TbY2ooscGItz92C8pygJelwrUDMvSi+Oze9NNQ8GgWIHpMaSReVeySDtKp7nJGpWCHrCo4qi75lcO
	NmJDP9DHdI83J4pPP7ABmvwVfhKfcYGyfnIHavf4anUThM/0UpeOGpWhKAoEsjoOf0NOKvC2DXKcd
	HI2kY56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPIm-0000000AWTH-45zD;
	Mon, 13 Jul 2026 22:39:05 +0000
Received: from mail-vs1-xe64.google.com ([2607:f8b0:4864:20::e64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPIk-0000000AWSu-0Bcf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 22:39:04 +0000
Received: by mail-vs1-xe64.google.com with SMTP id ada2fe7eead31-738cdd667ceso125770137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 15:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783982340; x=1784587140;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SmAUQ7/+zUObwciiWZMTJrtfdcrbslFS3HzxJfkmp/E=;
        b=alZr/YE0jIp0S5BuvYGKTr2QG+Ys/lBXJAuQX1VdGb2LjCVQFo6dFWGiYfX/g4yY4w
         g8PXuAEZ8kX7z0s6f7i936uF8dWXFKmcgYHe2J5MMnMNVMv90lgvUcl+xET9KE+Ju+t0
         JQNnIgleM76eJeqtR5ztClgRUBH23DRG5xFACNCZ3JrYNVJsYuw6AyaZuNAbrh5lL9Z3
         pkc+Wm8TLl8+eh9OkwvSyn2JuI9y9/s1IrkkPhtelC3oSB38karirQhitRNEDqfwVcFK
         dryXKAcGEbnOe1vVtSGhJE5zOC+xuj/DZuigSof0zYUpPhhTfWvamtP3AoNIsYAeDr8/
         Y+Eg==
X-Forwarded-Encrypted: i=1; AHgh+RolK6yGeo7MmHQwo+g34vVd0mhCc7kNSbl0hR1z5IN/5WKN1obV/BRVbIgJAHj1h41qk9Q7CL2GPNpFF0/XhwXH@lists.infradead.org
X-Gm-Message-State: AOJu0YzHfRxrR4RWBS1jCWRWUt1ccW8YLYdJ6qlYY/Qk15xXDs96gGJd
	ICSOgDlaUXW0uuQGV/hQwoxk35PQmezywO1jp29Lk2mHQaUQTg9QHOIkixnH2YccAehQVgO0wio
	4ffh5FrzRW4w2kHCSQzwviuDhXrkoXaR043DeJRqh5ovmKlsd2ULxtcpteuhWT6PBQZO3lXfLgq
	vLAOs7tr8iZKYjnvLVcWH+R0eXKc+1sSMBFiqsCuyEU5mzIhWG6oM1tHbMIhBSQbmq1+rnqiWpC
	mtaW68smdQMIo5LflTcKalWld0gyDfK8os=
X-Gm-Gg: AfdE7cn+FnnBR46AT62YLOcBR39E9TIsYn9B5G3F3PanHUyseqDeK/a0JYN1jaQZIpn
	3DdQF/IdkEy0vPMjP0Lj26aaeLl40Sp46oo4HHCPKN4cEj4K6QhIyUbMcsRw8OIQ6ree6MuLRF7
	ccc9m3Wy/TwJgCSy+dxqHurpGu6PHSFjr7tG69XpIuOD2J4h6QVEak6nikYj2ep/KF9kVoRR1/C
	UyJrt43goxWynr2/M5Cjg2UuQGLm4MPHR2BY/C8S5sNxDXfXI6ARNGOEkpY5scgPn+5ZgdELMSR
	Jc4KO+X44NZn5ecUXyZJp7dJiS3ePw4VCRNnwxcATvGXEoPq5seY23FNw0ljrPnGOpcXRpoBipA
	dzspYN9IYH2VeYqZqCSD26i1GF+gAl6NpWgtlbFcsbTN8ebPN0wFRQ041TxsJsFUvFg9F6+PilL
	P66BObC1royULPBtgj3C1uB9zH17fT/pEC7shbRdphsFHqtgF3
X-Received: by 2002:a05:6102:6442:b0:738:bd0b:7560 with SMTP id ada2fe7eead31-74533e065e0mr5428398137.23.1783982339822;
        Mon, 13 Jul 2026 15:38:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-74507010231sm975053137.8.2026.07.13.15.38.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2026 15:38:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so660519a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 15:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783982338; x=1784587138; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmAUQ7/+zUObwciiWZMTJrtfdcrbslFS3HzxJfkmp/E=;
        b=RUUmFT4hgKVN2tmUvix3iNufCgHQCFJoeJXkSjncbzpH2ZQl3KfE2BYrr47r53mQIK
         vY9xPv9sumoLC9Y9OAhe3b0EWwr0zokeKM+bv6JI1umaomt0TWn9hHII4oofjiL3H0UY
         jYB0M489Hso0m2ytCLjO/XS9i7maf1vEVrMy8=
X-Forwarded-Encrypted: i=1; AHgh+RpNlPhczTRz1+m8wcdTfq97NGGvZBVRYPIibpu0gMTY489rOCdGyOSB8vzn87Y4k7JPwlH9JfMULo7TCI7mYaW0@lists.infradead.org
X-Received: by 2002:a05:6a21:7486:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3c110774862mr11561267637.36.1783982338495;
        Mon, 13 Jul 2026 15:38:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:7486:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3c110774862mr11561246637.36.1783982338145;
        Mon, 13 Jul 2026 15:38:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm60964368eec.6.2026.07.13.15.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 15:38:57 -0700 (PDT)
Message-ID: <889e0c6e-0cdf-4598-8777-30ed643b8f87@broadcom.com>
Date: Mon, 13 Jul 2026 15:38:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Workaround bcm2712
 broken EL2 virtual timer
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 John <therealgraysky@proton.me>, Daniel Drake <dan@reactivated.net>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
References: <20260710080958.491620-1-maz@kernel.org>
 <1c23b437-609c-470a-8b14-34288cb5aaa3@broadcom.com>
 <877bmy63lm.wl-maz@kernel.org>
Content-Language: en-US, fr-FR
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
In-Reply-To: <877bmy63lm.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_153902_155618_24EF9FC6 
X-CRM114-Status: GOOD (  17.93  )
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

On 7/13/26 13:23, Marc Zyngier wrote:
> On Mon, 13 Jul 2026 17:15:35 +0100,
> Florian Fainelli <florian.fainelli@broadcom.com> wrote:
>>
>> On 7/10/26 01:09, Marc Zyngier wrote:
>>> It appears that the bcm2712 SoC found in the relatively popular
>>> RPi5 has a broken EL2 virtual timer.
>>>
>>> We do not know the reason why the timer isn't working (the timer
>>> is ticking, but the interrupt never fires), and the SoC vendor
>>> doesn't communicate on the reason why this isn't working, leaving
>>> users and maintainers in the dark.
>>>
>>> Paper over the issue by detecting the broken HW, falling back to
>>> the physical timer instead, and let the user know about it.
>>> Also taint the kernel as the machine is definitely not compliant
>>> with the spec, and we don't know what else is wrong with it.
>>>
>>> Reported-by: John <therealgraysky@proton.me>
>>> Reported-by: Daniel Drake <dan@reactivated.net>
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>
>> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>
>> We know why now: the virtual interrupt timer line was never connected
>> in the first place because it was not clarified that it was a
>> requirement.
> 
> Dangling wires coming out of the CPUs don't ring any alarm bell at
> integration time? Amazing. Makes you wonder what else they forgot to
> connect...
> 
> Is there an erratum number that we can refer to for documentation
> purposes?

There is not one, we only have an internal bug tracker entry for this issue.
-- 
Florian

