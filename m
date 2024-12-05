Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65E4E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbNKfaOaUULeO+Hqb2B8/YMo5/oNy260ujCfeqa6Wyc=; b=wbYIEm5tJL/W3SGhcY9RkuPJve
	3XadHeyyx0F2rT9KxDcDj7VEDSWxvQqjsGCxZiXObIvA1JQzTKn6XI58QRKPpO17izFd5HIzB9J2e
	JMVw1Lrv16+HHQzimBuR2ihqgUa01xDLz6SlIrmrkFoDSRBcac7isTnSM9xVjUdyixAO3TXkqXcZ7
	dhWtF2tV7Sw3VlFagO9TavA1pTxL4Dq2R5NL64kMFHnG0caApz+dzXFYRw7oXDzn/GmoAX0mdf/QI
	AaXs06JfhraaaeTuUoAdjUCu172OT7r4qRoYbn7EnI8FehIe+mDrGhlUzUrOEGGAYoo3kALGXosys
	PiEzYFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB1A-0000000Fxrx-297X;
	Thu, 05 Dec 2024 12:31:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAwU-0000000FwPM-1jEv;
	Thu, 05 Dec 2024 12:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733401609;
	bh=g9tQsWZEgpAzauiZeojXOmlzi/LihZGmyZsC+hkQVQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SNpGXDmIAoC0TD0L9kg3VWYRWAwP4KJTgSTYwH8Lr1N/7sGp9O8i0exG+g4X66Arm
	 4L+iugIXkjSscNAMwoSKZMvCjChlWQ6gq8WhGjEccRaLnBmDpwNEG9kHPy9nby82rK
	 XL8O/QeZq9Oj3QJ42k1HCzYgj0ZHqa/8NH30onAnB/9ZovInivqb0DxzazmSEuyBSD
	 JeeDmihW+lMtSBVpkpTmEwGWaVeHBX/nFBLR9oTJXfhwIn2oLLT+fLGfk+SXnKMcFL
	 0Ruq0vc/oC62/1IJesNeUZQUiHGdR1JIkez0fZeXjtc0iZYCsjsYI5ZCLASgo43vfV
	 I4TS2OQ3nGHJQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B04E717E366D;
	Thu,  5 Dec 2024 13:26:48 +0100 (CET)
Message-ID: <ece47aeb-e9e2-4690-8103-a05a01ec7be5@collabora.com>
Date: Thu, 5 Dec 2024 13:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: mediatek: mt8516: fix wdt irq type
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241204190524.21862-1-val@packett.cool>
 <20241204190524.21862-3-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241204190524.21862-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042650_600326_21B63AAA 
X-CRM114-Status: GOOD (  13.89  )
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

Il 04/12/24 20:05, Val Packett ha scritto:
> The GICv2 does not support EDGE_FALLING interrupts, so the watchdog
> would refuse to attach due to a failing check coming from the GIC driver.
> 
> Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index 444429341302..098c32ebf678 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -206,7 +206,7 @@ watchdog@10007000 {
>   			compatible = "mediatek,mt8516-wdt",
>   				     "mediatek,mt6589-wdt";
>   			reg = <0 0x10007000 0 0x1000>;
> -			interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_FALLING>;
> +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
>   			#reset-cells = <1>;
>   		};
>   



