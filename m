Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182CCC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdj+zoH4lFIbvlYYukY12hViRcNCFHIXiPCq2FExRIs=; b=XhQo8VtTSNVcVNpiB0yjXKMcYy
	zeZUEYwUwxRSRGAVLmWg7QS7Rrjma14nXGYQvPdplARBh9okRx1LLeX+jRWIdo0VLXOykz7+oczI8
	jCf/w16uD5C7fyFcn1ibmXYzgkrGDSgkRNsxEO1G5MQ2itYdrN/jJRQ6UPKYXtcygoob1L6rDoN2m
	OJX7cBLnyvmd3w5giKxXHeN2645G+mxPGWvgH7DY24f0rkgdl3BUppRzgMcDyznmqxv88ayLQCH0O
	V3mwMrUg5/L1m25FS2FdvyKjS4p3TUGpyXRgG8MAAxu1jbD+3UtkD54bsf6KKp3QoXDovX0Ye9fHY
	dmvslpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bFS-00000001lGx-2zLj;
	Sat, 26 Apr 2025 08:50:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8bDa-00000001l5q-3gK1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 08:49:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-440685d6afcso30449715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745657340; x=1746262140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mdj+zoH4lFIbvlYYukY12hViRcNCFHIXiPCq2FExRIs=;
        b=YcVi2BOOlVYNMFHwTD5cfjDJfSGzbwV1MYrj6ote1GeKBofynONu3qIVcdCAay/8LR
         e935zHWdc5dbTc2AmECV59i+sekcVpQxEe8tpjMqhFmU0hgaElx415BNXSNoxOmyTVhq
         hHLH0KVdSXqPIFsZLvWzMAYcql3Z4Il8VPddY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745657340; x=1746262140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mdj+zoH4lFIbvlYYukY12hViRcNCFHIXiPCq2FExRIs=;
        b=SobdGyjZxqPk5xJGgfMOEJID1fkfb+8PCyGrjljnccsbYSP4WXHbCM251eiSqS0/lV
         l5MHs4qsOCrCwzyhYj9+Hn1dA8ldDyoNMNHCAa6YvMKfQgzgcURuLCz3azSk8FKHrmVE
         SwOe3Zuo94R9A0+7fQVJ7SUjVDP9+9rwzYXQW0J2zxDTZqXGn2G4fGxjN9yeRMD9/KyN
         9gWi3eJOsY6zKbZTdBighLf4+RDVsgV9Z0kT2G4hwrfJXwk5GB6uEyv0SvP0w55vtEuu
         IQLw2W8eCMnYX3smg2fXObcaraaBLN8hmJSSUMTqsS8ym1bHXpslxWylfH3fOXpyy0Zl
         eeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUczdVhAgcBONQpEbGFa/GArfjSRtSmXV0MVhx5X6H/8zWb7JqZVK50BWF2x2X7fADOLvHkPBKmOlmVSVfBWq0j@lists.infradead.org
X-Gm-Message-State: AOJu0YzNbrLibyIdi0enPyQQE5aa/RNnPdzxNmpKTb8kZpB5mY5pYcDF
	eGh6yUT5uusK8xxzU2zzeLdHR8nbF8+AAEQpzYQhWV+MneKoyRtf2fwAT/S0ew==
X-Gm-Gg: ASbGnctzRYS2pRGEk9Nsd0J8zRqgXGEP4Zg41YGFetr4EF9TQ7pHUr/jNjvhdi97oVB
	OaEentERRlT6/i3F/xbrgU/fdcz1LzN5QXwIIyhvQVxftcsOhqc5D8qkQ/s0/+uUhFDPDcL2ZqC
	Br51DSwwlmDN5jIuCWzwiohcVqtxSKby7AS2xy0kRNFJyT6uZ17qvh7RWbu8TMqo+dO+tPQjmBx
	HVYg3sBKQ9JcD9xBcDTwFYjMEE5iETRsDErwoUqGYvVHx538MbIOVbaqdNqzYNbB8JubmAOoz6n
	MO5SUbzfih/bAnBh30tpoPzhLAJYrvtTjHaJRQD1k/EV8ueEBz5Z5GmdJagkCcGwoYzs1JYQxkg
	r2pppCfIb96GGl21pl/18ucM=
X-Google-Smtp-Source: AGHT+IHPZeKdxZvPYe2TepgSAn88bwYI7vcjTjP6rkOEVPWEl8fuLc+bJpWvPfDlNT6FlBQvkJudFg==
X-Received: by 2002:a05:600c:46cf:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-440ab871770mr18150425e9.30.1745657340509;
        Sat, 26 Apr 2025 01:49:00 -0700 (PDT)
Received: from [192.168.1.105] (88-187-52-200.subs.proxad.net. [88.187.52.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f89b2sm53032105e9.8.2025.04.26.01.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 01:48:59 -0700 (PDT)
Message-ID: <dc47e9ba-e23d-45d2-bae1-cac8bac2310b@broadcom.com>
Date: Sat, 26 Apr 2025 10:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] ARM: bcm: Add some BCMBCA peripherals
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Olivia Mackall
 <olivia@selenic.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
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
In-Reply-To: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_014903_063334_22B73B60 
X-CRM114-Status: GOOD (  25.17  )
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



On 4/6/2025 5:32 PM, Linus Walleij wrote:
> This adds a bunch peripherals to the Broadcom BRCMBCA
> SoC:s that I happened to find documentation for in some
> vendor header files.
> 
> It started when I added a bunch of peripherals for the
> BCM6846, and this included really helpful peripherals
> such as the PL081 DMA, for which I think the most common
> usecase is to be used as a memcpy engine to offload
> transfer of blocks from NAND flash to/from the NAND
> flash controller (at least this is how the STMicro
> FSMC controller was using it).
> 
> So I took a sweep and added all the stuff that has
> bindings to:
> 
> ARM:
> - BCM6846
> - BCM6855
> - BCM6878
> - BCM63138
> - BCM63148
> - BCM63178
> 
> ARM64:
> - BCM4908
> - BCM6856
> - BCM6858
> - BCM63158
> 
> There are several "holes" in this SoC list, I simply
> just fixed those that I happened to run into documentation
> for.
> 
> Unfortunately while very similar, some IP blocks vary
> slightly in version, the GPIO block is differently
> integrated on different systems, and the interrupt assignments
> are completely different, so it's safest to add these to each
> DTSI individually.
> 
> I add the interrupt binding for the RNG block in the
> process as this exists even if Linux isn't using the
> IRQ, and I put the RNG and DMA engines as default-enabled
> because they are not routed to the outside and should
> "just work" so why not.
> 
> I did a rogue patch adding some stuff to BCM6756 based
> on guessed but eventually dropped it. If someone has
> docs for this SoC I can add it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Linus can you resubmit a v3 addressing William's feedback? I will drop 
your series for now. Thanks!
-- 
Florian


