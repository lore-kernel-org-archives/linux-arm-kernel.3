Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B192BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZOmGUvVX3hMx9lamvWhLjBZWf9nK1zgBZONOXd3bnA=; b=b4ykWJBwmjzEKxO0k4BwbtZryh
	ZHIefeew1BoZw64F9uiY5yMmhJYDymIPdaZasb27MLe0HEC9ZPCoa3XvePWXkg4S+WHrwlvJKjcAy
	3C1+9F1KAxuhP7q30xx5+0xbT+nibqYUWexIIq6JAgi0vVsoqiR0y58i6++UWkPtzTeRSOESKtsDz
	675jK4FeoZ0Utt9lmST/N8gPwDJWMPYLSA0DoVcD7ThS3IX8ykIHm9bpzlCGJLyFNdSsfrBzR/ieq
	fBadWpo8zreTE0sWI8Y8n35AG+Ro7+WEO6kyGqS6C8R422KXcKhSqolVUPP7Fx63xOtI3xOtu45Kx
	4I7D7Xhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFal1-00000008eB9-3jBz;
	Sun, 02 Nov 2025 16:16:43 +0000
Received: from mail-io1-xd61.google.com ([2607:f8b0:4864:20::d61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaky-00000008eA3-2BY1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 16:16:41 +0000
Received: by mail-io1-xd61.google.com with SMTP id ca18e2360f4ac-943b8b69734so380336439f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 08:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762100199; x=1762704999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZOmGUvVX3hMx9lamvWhLjBZWf9nK1zgBZONOXd3bnA=;
        b=Kk2OyBWJr7O5r4X/r7IRoKl98JI5HJ3+g9I1YSrkaTHqekg5HumFjvTK0xMtZ0YYgq
         tCcnHbOHsSjcmPqRC9SuX11OKzPpl2Prr8G0hTqbKTnQ5yBt/QD1X90N/t1SlvBitr3K
         oAvL/48gNtaSIH3LUzBf+tFICfs6/g1egPT69Pjg15T/EeElOyI0dxb+7S6w3tBxTKWo
         tzZ8eYXw7KCHVODUAwFXvaINdJfFk2lhdnfnldFa/cZ06udSn9V83pjWy/D5QmWMryz5
         wrSfotkoKmtylhnRvhNnHcq1EdqRBULP867E8wjFV1sP6vVJ0ab9t38c1H1kWa16Tc1D
         TxaA==
X-Forwarded-Encrypted: i=1; AJvYcCUfltn+GqS0Yrm14t41ghP+d2z5f//0mFHMLh1yAFGqsanneDh6s7ZEMqhG5jm7ZuHF1AsYu3Sts/GY4q7UuDUV@lists.infradead.org
X-Gm-Message-State: AOJu0YyIbsSQBRrzunxld/1uNmjq2RU0VcdosoKLxRId5ueUlkhc2z4X
	Nch6tusAsqcvcBhlhfni9cOLbOaJLzllcmosOSdPDsBP5OjzcAFd1lq3G7a7Ct0avAiIn9x+5XK
	R9BGSQBBs8yovc9xD4S5CWPe+xjEWRFq3PwrfJaBOxGw23nunwG/61iFK1XyjALKl0AE5b/pGGG
	L/g6du8PmTO7Nn6xxSwEQOCUouKZzv7Gu/dvU7YYVps6xvd1OM9Ja5ekntjRpLHcIQPgW4MS7m2
	eYaREjm7U7ulBedtWyvDzUyUtFJQEkCadI=
X-Gm-Gg: ASbGncun7H6jkHKMrQFlPg9UhMh02PC89CNcG+cvNz4p45yQX4f373Z5AHDwbCfCgg+
	yXq4iNa52W+5wYGQAK9/8BfQ1AZvOrqp4G3ivD1AFJBFRvT1dsFJN1/nwM75JdRbk6jzXrLjoo4
	r4mXQMuhOS/1s7wbquzx6vqbGAkGUNLoxzhFDure/8ZTntNVP8T/kSDWMGul1QwO2iM+AS2MgdX
	eEE7KJ/3c5n+R/xXC0dTzpY6pU6blUMeh1zNc+uUnDGz+IBMVUG4MONsEC26ZPWrdTzfL6Kepuj
	DliMbrrh5iaYXB8N/p0lX3vTaEekvZBF3JgX9m1twdlh3T6pcAUY5ZyUBFNFyj+toJ3D1ekUD/1
	8+dICXxBZT5YJ2W3kM9RyCw84vqt8V6vGA/mKEtwMVNvyQwnqWj6zB3IxC1r+5K4iY66HYmp2h3
	1KC1ZBBzYRpLokqcyOe7QWhRokg2Qj3silETB9vwTULQ==
X-Google-Smtp-Source: AGHT+IFN9TjPjUjfEiiSEId2QY6ChlLWxTjkVKIdzJCQEZmreCcmJRi+TuedEcWew9JnrKP+nE4Uhoc/OE+Y
X-Received: by 2002:a05:6602:27c7:b0:941:d34:56be with SMTP id ca18e2360f4ac-94822a22c91mr1544805239f.18.1762100199106;
        Sun, 02 Nov 2025 08:16:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-94827bc776bsm57167139f.8.2025.11.02.08.16.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Nov 2025 08:16:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295592eb5dbso13805655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 08:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762100197; x=1762704997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XZOmGUvVX3hMx9lamvWhLjBZWf9nK1zgBZONOXd3bnA=;
        b=CTA8zsrKsd/pxpaS94awshw0jp1UVBsCy4HMWUN4z1r/RHMHOx/kzhCqZrTtL+KNq6
         kl7Yd1TpO2lu9vnXRFu+TlJ3K0QrqIukPrDg5X7X9ETz4Wm90fbF3T9PTI19lhMeh/JJ
         b+ZVnExcTmtioTioqbwTNDqHaLM3QYZNEdZqc=
X-Forwarded-Encrypted: i=1; AJvYcCXKbIQpxtBWElX8VzgNy8nPwq3nSqdflcrG9dUmwEpnRKJ2JFVCGHer63iAUwbeV0bmOQMrIEjt/JleNvV5JBfZ@lists.infradead.org
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id d9443c01a7336-2951a37a3d6mr139836845ad.16.1762100197314;
        Sun, 02 Nov 2025 08:16:37 -0800 (PST)
X-Received: by 2002:a17:903:185:b0:290:9a31:26da with SMTP id d9443c01a7336-2951a37a3d6mr139836665ad.16.1762100196962;
        Sun, 02 Nov 2025 08:16:36 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:ba1:a836:3070:f827:ce5b? ([2600:8802:b00:ba1:a836:3070:f827:ce5b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268cb73dsm89476675ad.44.2025.11.02.08.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 08:16:36 -0800 (PST)
Message-ID: <dafd904e-1216-4211-846b-5ad2b07f9111@broadcom.com>
Date: Sun, 2 Nov 2025 08:16:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0
 alias
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Phil Elwell <phil@raspberrypi.com>,
 Rob Herring <robh@kernel.org>, Stanimir Varbanov <svarbanov@suse.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
References: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
 <bfc2be91-dcf9-4b38-a3f3-a1cad6c6aef2@lunn.ch>
 <20251102154834.GB27255@pendragon.ideasonboard.com>
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
In-Reply-To: <20251102154834.GB27255@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_081640_577366_C2EA2C26 
X-CRM114-Status: GOOD (  15.90  )
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



On 11/2/2025 7:48 AM, Laurent Pinchart wrote:
> On Sun, Nov 02, 2025 at 04:35:30PM +0100, Andrew Lunn wrote:
>> On Sun, Nov 02, 2025 at 01:14:42PM +0200, Laurent Pinchart wrote:
>>> The RP1 ethernet controller DT node contains a local-mac-address
>>> property to pass the MAC address from the boot loader to the kernel. The
>>> boot loader does not fill the MAC address as the ethernet0 alias is
>>> missing. Add it.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>
>> Should this have a Fixes: tag?
> 
> I can add
> 
> Fixes: 43456fdfc014 ("arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5")
> 
> (or maybe Florian can when picking up this patch, if a v3 is not
> needed).

Yes I will add the tag while applying, thanks!

> 
>> What MAC address does it currently get?  Random?
> 
> The local-mac-address property is not currently filled by the boot
> loader, so it's all 0's. The kernel then assigns a random MAC address.
> 

Definitively a fix.
-- 
Florian


