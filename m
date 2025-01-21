Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFDFC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lphuxEBOTKwaeIsn4ZxAyXhOMS7H5NX6cm7O5tAhiPY=; b=ZuouY5hplnUgQPlTHL9vIhkFlQ
	rLoqLpqD1mm7GHxZGzSQ4+HDrcJT3oqs609ogqOG+WGIT96b/Qa97xFpbaeQt75sllAbPDjCkfUzh
	iOaPjgWSKVMXnMWbMCOc3lG7KFRxgKa+uav6Zj//vFhySUWsLbLg7rhXbi0Lqyr6n/iHbu37t0MXZ
	yJgOt/IPEprBXs/Eu6j2oCcxfK1FHEYuUFXFNcQRi/AciV28IdfktE/VVs41wxaF7i3HtHQZ6ynxH
	RY+07RfD236EAoSf+uYwxZFelRjgqoDSq+edQVku5tFQzx3gyWLukiaFQbWlkksfZ0HptKLkFT8pD
	w0IPMavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taJ2A-00000008baK-2pgC;
	Tue, 21 Jan 2025 18:31:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIzq-00000008b9h-2C2g
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jan 2025 18:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lphuxEBOTKwaeIsn4ZxAyXhOMS7H5NX6cm7O5tAhiPY=; b=GYcfdueOlTcc6crpSzhS+ngwin
	MeXuR07t7tzXMDd1bOKTeRSs8/0Yo9CKsUc4f/bDe/TvhVj/3jP1oSxiLntKofxFQO6X2uI1sZIa1
	M2EKrLR5booN6X2hf28y8TOg4Pe5XsLrSudjamOECY6AmOak4DvnK2YOkxCbvNYya2PEN0qSJgjH8
	aLVkr3iNQR9HD0ON9b2N7NB9DPeuOiHailu1VUUMr7ECGkOgxg7KPVpA8oV3u1V7mbn+mchD/kOGI
	sPRBM02cxkxBJyPpJ5E96RCYNYJi7z/1KL2hpI2ykvkVdPXRHBiF8UJ4K06nYN+IR82NvelEr9Kh0
	FdHdoTbg==;
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIzn-0000000DL7J-1JNp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 18:29:05 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2b1f7406e49so1314984fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 10:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737484140; x=1738088940; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lphuxEBOTKwaeIsn4ZxAyXhOMS7H5NX6cm7O5tAhiPY=;
        b=K3+W1cieQh4C7XcS6qMYPbAvzzxVn0qagZ2X8/85dIcU1jv1tzhAIUTWl6cGPBls/E
         KGtQOSy7WFDwf1kBw1qwCG7TlzywDIusC/2RRsYKHA9hm8xaE/nSLM485BAUwKgmxJua
         HP/Vwi0LLyLC7KFwrFL4Q6VpXg3d7gJAOryDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484140; x=1738088940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lphuxEBOTKwaeIsn4ZxAyXhOMS7H5NX6cm7O5tAhiPY=;
        b=GjZ4J6+FZp9fi97j2yy2Y1KnU2J8E8XzUb592yMT69A1N+EQGYPoDIoIsSOmF9HjDE
         eSEM1y1yVUYjd+/6/KEOni+yCOxfAHxjDsYg+qERB4dHTorKa8YnRZHVHuRjg1Ip0Z6j
         rQgZIbUOzp1kkC8RL0wdkB6+qiNchXY1nMCL6KXiV7clyPiVZ1H79llv5ewKQgungrE4
         1Uwey1s/9shGYvX1+BV1AAzqQyVKTRewi6RiB8THA75MGniQKJqT/iOaD8XbTWJ7hv7o
         R+uM4dMdKiThZYSaZJ6GhR3AJjQe/SeHvPOVedI7cyaWpuZ63L2e9ZVD3qsPTIRTkLMk
         sxXw==
X-Forwarded-Encrypted: i=1; AJvYcCVNwGnsVpfOpkMINWYe4iKgnm3BWLuXZJmtG818fx5D/hg2H+Ca9I+Fbt+afX7MCGxf4rDp3SiYXLMFMNO3auCP@lists.infradead.org
X-Gm-Message-State: AOJu0YxUTqMeQ5JYQJtgcHbfyMep5s9IdcGQTQjf9+nxGO7d+j7QBanB
	q+t1cZ2ekEk73WuW0vCg0VvHt8kWF3gb8w15rqcpAHWF5mXCqYEY7n/3PoLwug==
X-Gm-Gg: ASbGncvmrCOUQX2ZoN2H9aPIPN+VJbW/0z57W6SEA8q70k6V4bQn45EEdBRlqNk1FPl
	bi1AuestsU6UNOgNblKlSqWbHmTwpRC4lkq/wbxRx508Ov8j7kVKuxk78MLloGSKm2mS0MbFSSl
	c6BK1qjrKyohVEeudwoG9/O73qj8ibe6jqqrqKj5XrD8+w4SSftfVvy0zqhJpn35ElY+xx24fzE
	T2ibVS9bp0bD3IDldXjcMqjR4mayPVhm6OvSDnT1LbsBznB/BIOMwFk8XL9IHrvMKd5d+oGlRJK
	bSaUXua/gZaAN10MPHmJQ186adf0JUJw9g==
X-Google-Smtp-Source: AGHT+IEMDQQA7uXEUvvs2Yxi9Rw/8/nVfXYv+l+nzcRAMtxy6O0OkHj5qGEgblrUmVLbE6CdOhZ2xQ==
X-Received: by 2002:a05:6870:9e49:b0:29e:18cc:276f with SMTP id 586e51a60fabf-2b1c0a24a1cmr10758963fac.11.1737484139842;
        Tue, 21 Jan 2025 10:28:59 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b1b900ec2fsm3814393fac.46.2025.01.21.10.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 10:28:59 -0800 (PST)
Message-ID: <7e42c339-aa12-47b1-a5a7-5d445459a489@broadcom.com>
Date: Tue, 21 Jan 2025 10:28:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 01/11] dt-bindings: interrupt-controller: Add
 bcm2712 MSI-X DT bindings
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-2-svarbanov@suse.de>
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
In-Reply-To: <20250120130119.671119-2-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_182903_651133_C6E6EB93 
X-CRM114-Status: UNSURE (   6.50  )
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

On 1/20/25 05:01, Stanimir Varbanov wrote:
> Adds DT bindings for bcm2712 MSI-X interrupt peripheral controller.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

