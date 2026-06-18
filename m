Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83033CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdxvnHNhBcxBAvNVWg4iUTwWhk1g8ApNBvxiWkMn+Ak=; b=17XfhnnVTD+NsIPN6eeP/ZGm0J
	UQivzZrPJIP5FijkIDPGPR9lGPy5IFd15dIhY674FJDYJw5Vz+9XqjVLBRiJ6sMiZ6HVF8CcKonxk
	VUGpGDQAo/xWLcLyQgvUs4A4fTgCcszXosBN1glM7FCCAAPi9odc47C27fUnjRYIaJX7zDWczC0z/
	IwSBBiCnK1jcaRSVob3aNJ+4D+tYE+QqFcOqfVomsgVteGtoUExBCLRThWoJOOky+rvKxYJXmP52K
	LCB1aSysueXUoLfKTKBuNwC6u58Iof6r2nuP9Go5AWNB1s8Vdo475lr5kU8KqHNG+0AwO90+Fau3h
	0PlfPysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9v3-000000015t9-38Xd;
	Thu, 18 Jun 2026 10:24:21 +0000
Received: from mail-vk1-xa61.google.com ([2607:f8b0:4864:20::a61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9v1-000000015sd-2Ks5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 10:24:20 +0000
Received: by mail-vk1-xa61.google.com with SMTP id 71dfb90a1353d-59ebf30a91dso234367e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 03:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778257; x=1782383057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdxvnHNhBcxBAvNVWg4iUTwWhk1g8ApNBvxiWkMn+Ak=;
        b=XHytWgWW807voFAjFijN1l8XL/r/45VbrerxPHOkeDIrVF0DWFjVlGvZmu6JknZ1KC
         9um5GJjDSaQWdD4ImnOYFlWqRtcsdYdcYSF3NMZJ0v3ilQ88k1lzs6shtSKQ1V506Pay
         rX+GguJDRy6GAYXzn3qz9DF/k/oxGY27/Ots2wPFofn7npuHa6gLB9KE9CaLZRJcj6N9
         /sZcldxyoMCaUiQNp0ol+xI0Cyu3y68ILn3VYyW0oPkcTStUUzoDVpTOBYkVlgVJxrq/
         nSRC35+DW4vExW9mtPj3Lq2aP5wH3ZvdHM9ECfFE3Z/hlFErQ3e77j8CJHObfP4jiMBP
         wxag==
X-Forwarded-Encrypted: i=1; AFNElJ8MUcOUZbPchQRo7rggsB9FWGHH2UEGrZMznZmm8LrubLxMrPu3+MxGfSrD7ZazYUIgA5O+knhBacQfVq1Y2p3/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1SyYVNDO/6+1C7SnZRbYTeEn579Kji62YAwoFr+PuAdIVPklw
	KgIjwZTIS2UOOds0rt5uNS5mFpyN4qkmSU3OeEc5myJ86OONZhPWFtek2JVdxK3BXcpGm0q0p+b
	+an4q/KeXZXEqUQY0VWgM34z/z6WPZibYzxGhpkpW1NPn9TxiEHtSc4iMAbbIZF3JYwZv8GCOcJ
	GNSjSeoBvtTewTw6fyiemBnoe4Q8hGbwLZCwQuho0prCcGtpHkLPnV822sNvaI+Lbr1jp0wzPpA
	41KO7klZc0Ohq75SbPUKlUDsEjAEyq7b1/KOQ==
X-Gm-Gg: AfdE7clNNE00oHs7K8cC/JpWMZNGUZTlJUJ8dyd7pcUPEGTkW5JIS40OMe36DJrQQF3
	Ybk6eAfClorifMCOgMc50kqg8gLM28tYXnHkkOcpyrYcW9sptOMrpCoQc2xR9tTThsYiGY9QG5r
	JRLKpfEKaqPYALiIFozo0dfwpiSGQHAvEJ132BolFnElSG7eC9QhgSjZhsmki3h0llemUZeha3r
	qGxKG/WAOhtfK5flBwdflxpZtEyTlF95AVEcmCo22KZfwPPxitOI6iQBPCWC8MiCB/Zos3inwzQ
	b6CrO5hPwJNDI1aXVwI0DFDV0wW6FkZa59nMHLbG/uwo6FThnHIBvV3EHlqXOASKrx0uKqc0L1l
	iucJMXtABKHgPkKcjJkUKpiCP2G6BOyibQVtXje2XPVNveg7qRf+uJsxQ/UdKZEpUU/ic2ajO6m
	GV2PFWJ2gwvrnRfkRZsR+mJSOqauapE5sulNH9BRNb6RwuSR8rJQI=
X-Received: by 2002:a05:6102:a54:b0:6f0:3c5c:6ad with SMTP id ada2fe7eead31-727c6b528bfmr1644188137.21.1781778256656;
        Thu, 18 Jun 2026 03:24:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-72086c42916sm983758137.15.2026.06.18.03.24.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:24:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490b61243easo8506765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1781778254; x=1782383054; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pdxvnHNhBcxBAvNVWg4iUTwWhk1g8ApNBvxiWkMn+Ak=;
        b=AzPkwwKETmqTviJkI+muQ8VhgSmllWZGbdzDBEZS1yjCJceBlEvVZNuYH3ZeZso+wz
         GD40kp04zImmKZ/20LIPs4uCEnlq0VwzrKWVRD3qveZ/Muxuthlgt53HgTqpzqSONl84
         y6YT1/AxGC5bqtuW1U/q6TGOI+ivV9MZ3yk5A=
X-Forwarded-Encrypted: i=1; AFNElJ97H32Q6PMtp/9H8001Pho3nlA+EtAk94noqVvK8ZducprOdd0yIP0H3yZB2T6M2DbJk8Ej/bVdQ9/B0EMW2AT4@lists.infradead.org
X-Received: by 2002:a05:600c:3e1a:b0:490:e974:e01f with SMTP id 5b1f17b1804b1-492333ecb80mr132153645e9.28.1781778254343;
        Thu, 18 Jun 2026 03:24:14 -0700 (PDT)
X-Received: by 2002:a05:600c:3e1a:b0:490:e974:e01f with SMTP id 5b1f17b1804b1-492333ecb80mr132153045e9.28.1781778253884;
        Thu, 18 Jun 2026 03:24:13 -0700 (PDT)
Received: from [192.168.1.21] ([41.140.50.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49234daafc7sm117621445e9.10.2026.06.18.03.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:24:12 -0700 (PDT)
Message-ID: <4f4b2f95-e61b-4008-b54a-fdd3101dc492@broadcom.com>
Date: Thu, 18 Jun 2026 11:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Match DT helper types
To: "Rob Herring (Arm)" <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260612214939.1883911-1-robh@kernel.org>
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
In-Reply-To: <20260612214939.1883911-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_032419_616562_0618C576 
X-CRM114-Status: GOOD (  10.08  )
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



On 6/12/2026 2:49 PM, 'Rob Herring (Arm)' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> The affected pinctrl drivers either check for the presence of a standard
> property or read a property documented with an 8-bit cell encoding.
> Using boolean or u32 helpers for those cases disagrees with the binding.
> 
> Use a presence helper for "gpio-ranges" and read
> "microchip,spi-present-mask" with the u8 helper documented by the
> binding.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


