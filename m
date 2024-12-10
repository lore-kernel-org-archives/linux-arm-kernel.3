Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63459E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwV717DZF6jBbGmMqY4Lay6suGsxDvolISQzDQbt+mE=; b=OP8Mq8PasJtpahDsPkjXDyXzwy
	n70oWBHtj7pesIUUEPFsxDmfu7y38yJK/OSOjlMAni7y5d5XcvkRYRGhSd+mtbvw9llzo/m9fmCEU
	hx2AZfhuT85iSQNEsiAubbH0KsGqLnDwPmUnr4Oel8XLXCxnydvwWzcPcTTa3o3QVYYTLbMHLkg9l
	4QdqK/SYj86q9vpHiijep93nchcPkGlZzbCRX/RRhqQ99gwAnOW/rz7lKe4VNPJXFvFT0xpC2kR4H
	k/m+M6xCik1uUr7A4JiG8L/GdoQbrCpuVxLogOPYSGhbhMHeR7jSLtyikc3gxScRfEqBXFRwV4MvB
	0cllbZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL61e-0000000CXIu-37mX;
	Tue, 10 Dec 2024 19:36:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL60a-0000000CX93-3lpX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:35:03 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso4366786a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733859300; x=1734464100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OwV717DZF6jBbGmMqY4Lay6suGsxDvolISQzDQbt+mE=;
        b=htl1+IhqJpUD32ERTOIRsw5tPU6EMW7yYxuX4NtDJFqOKW299I+f0+d+2za9WHUd45
         gTRfS3FFM3k/WTMwRu0knoJ+eB2mI9srjppkM4XPaVH7tBFPuc04282GOd4ID3Ws/s7M
         /Kbz+1HbrXJhkT+6o6Tg8kqygTHc922i2Z3uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859300; x=1734464100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwV717DZF6jBbGmMqY4Lay6suGsxDvolISQzDQbt+mE=;
        b=oIaY3MFxHNVVsmI+vdb7ul2OjELZ8my18JXudLZZewvIgZifmrDc3xL4dLwU55gJFw
         YuGR2qnu936c+x1Kj4KH7HoNdo5UMsyG4aC1xH71mPpiAkfuC/O5l/k8vV3iOqxTBw9v
         U95CSB0G4WAdrPZhx0aK8WVJFHLg+6ixLIpT3PrIYEOdg6pAh9f2DflUIfZ7KXi9cWOr
         mcyHdaWQIe1lycJ4UyonFaNsDhKtwWtxi59BE8VZQauXXuj610J88I1EVvOgazlVkJAP
         HOtVvgoy/WIz/0lBuoWm32XQicw9/dXv/yvtwNzMuvlbSvJZL0O3YeNLoJ9rVTkA4UJL
         lANw==
X-Forwarded-Encrypted: i=1; AJvYcCVLlj6bvkukrXB1pVf7+27tfv9BuwmIlxKY599pJI897g+4dQc3ih+SP+yNnGMkYNS+Va4mzZ46W7jM4yIlCqYc@lists.infradead.org
X-Gm-Message-State: AOJu0YxxXOUKUVzy7T9S9liUz5BEQ9iIlsq3qAuPLARYYlPrt+8bTic8
	JjXAVAYwvS9WogJyQysR9sZQQBnj2qnI/XlUngeQBQ8LupWFrOp+liaxHCBWFQ==
X-Gm-Gg: ASbGncs4VGdsMhKr2HG5MEqgPJKglG+0bUV8msVwAyUcIBslJAId5NdZHoQogUqmOLM
	csy3XKtRK6S9hLTZ2E56V9HRxAJuPIqDmgsOz2faYtXX022x96D9oI1qPjyrZbzQGDA/MLzq0PA
	XmvagKMtECTuUNY9H+7RfO7ugC1tQlucGSRyIYAix0npdXA2qN97RaM3D4eK6ZsBToGOaWjQymJ
	BRKepE4H66eIVqeYAKf+CHIirZumVSdZmLw8PNsE2xa40/je20H+Zhb31wdraSITxOdXLe+BV2p
	dC9/iRDIhVeKSG4VCg==
X-Google-Smtp-Source: AGHT+IFBOs/F/U4/hLKU6kyWf8O6LlmYbxeJeYss/dK1iAbYGZxIT+jEyZtSoRHQ4kvolIcl2McsnQ==
X-Received: by 2002:a17:90b:3a83:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2f12808c035mr266194a91.30.1733859299825;
        Tue, 10 Dec 2024 11:34:59 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f958d6sm10127971a91.17.2024.12.10.11.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 11:34:58 -0800 (PST)
Message-ID: <8a7bd584-d4e7-4a68-a562-08f2603ff49c@broadcom.com>
Date: Tue, 10 Dec 2024 11:34:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/9] net: dsa: add hook to determine whether EEE
 is supported
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ar__n__ __NAL <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
 <E1tL144-006cZD-El@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL144-006cZD-El@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_113501_361608_5FA9BFB4 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

On 12/10/24 06:18, Russell King (Oracle) wrote:
> Add a hook to determine whether the switch supports EEE. This will
> return false if the switch does not, or true if it does. If the
> method is not implemented, we assume (currently) that the switch
> supports EEE.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

