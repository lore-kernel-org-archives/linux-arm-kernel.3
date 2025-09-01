Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17182CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HemR4kSrfP/7khlBRkJG8otPNKX3FGzo4p9L0pbKqM=; b=NhF9regSnWO6GxmzeHwK/aec98
	7AXvlWieuI0NhzeW/lIk72Iv3VKpsAdA8WMJpKl/z7KzVy9cc6E2YHtCQNaoZzSBuM9wPKG+p0rzN
	isNR5FHzVYK6zfsAOx4Kx+FvtK8zqkJZ5qMQI8bsVbrowrRo2O8Oye/XvRZy9z3R1QivJUZkUn86f
	6Pd1UvFcSnRg4OOeaVAHgIOi4099rTMAPp3oL9FmwaILVqk0lUpIR83NON4TAmUeLhg6EhSW1z2sX
	Bp0PlUkoeKt1it/tBfOfawqVKSQJ8rX5zekruh3uLLTEe571xnGn2u0OtxlQIZA/hUH5n4dnT91H7
	KsplKHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDh6-0000000EE4U-0Lal;
	Mon, 01 Sep 2025 23:12:12 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6p8-0000000DBbZ-0Voq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:52:03 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-327e5b65e2cso2589482a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741921; x=1757346721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HemR4kSrfP/7khlBRkJG8otPNKX3FGzo4p9L0pbKqM=;
        b=GZb5dBnni5FeDg/5j7H4SVc29+d4zOZ1BV21YbYcaJXa/wzNCtI0U/0PInRVp9UkK1
         wGCLtusPGrZLQhRx8NVtdS5rBtVBKpywKvZ25uEea8ZymlS46pUdUDc57PA6S7sFsDCe
         pxdnVbDetl+YDJGvQBBqChTnI+0vr4qOXbTUIuQYk1UuRNeiAfK0xqxl8UsIdExXFO8l
         /wJ14/tyjZBUjW7ETtgUKDJmBec8/CvEhbzmpYrbiH8smibNXdDA6GuCIJQK0HkZzNJ3
         5D8dQX3jevTYJxaicIGSWnpIGSJyQUmH+zOSF4Jyp2UUq6uPzBMn2SU4A3zvgXw7+eKE
         33zw==
X-Forwarded-Encrypted: i=1; AJvYcCXZj6POMmskr+neBrEc/xJOA5XAiM/cyg3S8XtDHwYDffLo5HoAe6qN3Vjot/skXuvR0KmfPFCLT/ACukBSYahv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd95VOM743wnzUsmKaZyOLdTfacO+IOnj62lW3yeV7K0EbwNhB
	Uc5g4FHMEBA+3kjkcUl0exdIqcWoxPlBtxEAsZhXMef1sOfZDxXpjOAJj5Y2AaRTH+LXobe+8t4
	Q95Pu2eBGbo3AdgclAUQAy5F/0WNoU1kgeVLiVfQnETk50hAFKyDVYlkGfOR4mj+RDz/4skjSZ0
	ipRE2N6UA2cbMZWmqeCB/RW33vSB+nj3Rs9nLAeIBw//UjsOQmu33m3NHb9sd8ITqiY40DoBQBQ
	MxNfA6km+H7snbOHxwmagEE8ThLrEFMngA=
X-Gm-Gg: ASbGncszMsGUgGtVChNPb/yt6+Evu8JSI5rVAC5V/bY1KjvIz9GBeM/nUkLYJRQgVy9
	/KGEqNWk0k5qJsKf9KfnFUZgo70UTSUxYrt5bqT2xrTDNyfh7zyttk0S+EkxZWXPL7IwnzRe2Ix
	sZv2Hi4wcp2RQWBsbV61Md7hvDO0zV6b58pbr2Zg63EUl1RDtczEiWxNYyWaYQ6XXxTUlvfN1VV
	+8rHUyV30ivTE9nT79qrLbpQTNX0XgbfakVnfTfe20OwLkjKWBNsfLRwS0XvXm19+HXVJCyzRfo
	o7YQ2yLwWq8VmLLH6AlwgwwjWZOgxDdEg0YxQ4ez2fvZNpGbU32zqeZX50fbapvPIemYQFHK195
	D1v852NMbCOHBCaHO3qIGnUFnuEZkE6vSZO9Xu17pT8OfjgeQX7FWMnYYV0ZqacOjpLXP/p5U8u
	cwDsIe
X-Google-Smtp-Source: AGHT+IH9E7umySvJW4FzGtxEuDqeGZPFPjwynIFh1lNXjAJj8fJNPVbW0QdniYUwvPCuRw4IEIj/8lQYSy3Y
X-Received: by 2002:a17:90b:3148:b0:327:4d3b:fc46 with SMTP id 98e67ed59e1d1-328156b9261mr13497952a91.17.1756741921230;
        Mon, 01 Sep 2025 08:52:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-327da8e70f5sm772236a91.8.2025.09.01.08.52.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:52:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-325e31cecd6so4382432a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756741920; x=1757346720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6HemR4kSrfP/7khlBRkJG8otPNKX3FGzo4p9L0pbKqM=;
        b=e5qOiIlwsA997cwXcmV9u7tt0ON0laY5NVsloAcnJJZqTp0prSxlXvHoWI3UT5EHkL
         6aomKQukL3GKTkr5SLupeStkK4Z/ZypDDnHZc7vp+R25j2TLVj0uWH5+QxqrfBEVYgW0
         GfBAdtT1fSgn2jKhhIahMfFrMRlbyvcbBKhx4=
X-Forwarded-Encrypted: i=1; AJvYcCWrTvk9mF3LzoM2SYjKzfvgY6jr/mf4VU/Wtzv2GbtaxhndNIR1pt9thVnIWq9KaK0z0d4lwX4GPgVTMhKiL5eY@lists.infradead.org
X-Received: by 2002:a17:90b:1848:b0:327:96dd:6293 with SMTP id 98e67ed59e1d1-328156cb806mr12019349a91.26.1756741919609;
        Mon, 01 Sep 2025 08:51:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1848:b0:327:96dd:6293 with SMTP id 98e67ed59e1d1-328156cb806mr12019311a91.26.1756741919133;
        Mon, 01 Sep 2025 08:51:59 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57b232sm17144343a91.2.2025.09.01.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:51:58 -0700 (PDT)
Message-ID: <f6938ed6-30cd-4bf3-9753-ae107b4b28d4@broadcom.com>
Date: Mon, 1 Sep 2025 08:51:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Linus Walleij <linus.walleij@linaro.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wahrenst@gmx.net, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
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
In-Reply-To: <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_085202_161921_E2579708 
X-CRM114-Status: GOOD (  17.79  )
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



On 9/1/2025 1:21 AM, Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>
>> This driver provide pin muxing and configuration functionality
>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>> instance of the one used in Broadcom STB  product line.
>>
>> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
>>
>> Cc: Jonathan Bell <jonathan@raspberrypi.com>
>> Cc: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
>> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Overall this feels merge class, I am looking over the requirement
> series from Bartosz to see if we can merge it all today.
> 
> I also looked in a vendor tree for the (by now 6 years old...)
> BCMBCA driver, but it appears to be a completely different
> beast, requiring some magic 0x21 to be written into a register
> to "commit" a pin control change.

Yeah, the BCA chips have a different controller for pin mux/control.
This driver submitted by Andrea is common to STB and CM product lines, 
although the CM chips also used the BCA block at some point in their 
history.
-- 
Florian


