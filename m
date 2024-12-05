Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DEE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5P5bHrn5RCr3wOftUT/8wSxwU34ri/P1sgBLapJARpM=; b=InU0hA/obakvC/YZIQFzKWQ/yz
	uvgXJC/KLHWoDiU/m4CShCItYavhKquUAfKvzvgowaNozjaZom395Lhwl6O+2AgV0QfeS8mO0AlPE
	tMVqE35OfMrfNXjxFe7/glRZ14IjwwFd7bhar9oaLzSVIpZ7RkBXHdEapvjBf65NiH3Rz/UAQPv2f
	4QyGN0hfmcRJAbbIXQg4xzt5fj0L20/FufnUkXxOJX1k3uDN66nkYWHXgteBnSofw4TmTt7RVcj6+
	e3CP+oGtvg3kdxxT4D0LsZeMQnZj8zsUT1hrMfKBmbuxQS7trdnKZugZv8UGwWkLOPn3aH7txrTS5
	ns21svmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAyB-0000000Fx0v-3qXi;
	Thu, 05 Dec 2024 12:28:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAwK-0000000FwLV-4AAY;
	Thu, 05 Dec 2024 12:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733401599;
	bh=9c8Iav8aUNsHauiM1yyCeZeaUEqfzZZUSJNr9VK+H8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CG/svNwH8wKMZSECj0iDL44zQ9ywjg3SwpciUSnm3FrLTCK2Dg2azBak8u47LGZqa
	 wY3wGDg6vH1dyYLkdJCH+dRUJmZmIFgubfgGoWsypJb1NsR0eCM1WIFb6Vf6+LZFpU
	 3iadb1F9akZu2fI2PMhe50qwOCrgErodAJ4JWeVRaU3nEgNWKznNAhAtFWq7FQqffl
	 U0lEGhW9kQpSGgmcln1dZ3kNDhNv2iBjXvHdDiA0dA+dMZFcTma4xB9w2pEQyviOXU
	 gR+r5b6Z0K/GYbz4myLvTOv6fZZj8WtH6qanJtCk02vJ87tdlQeHIKo3OSAxIG51w2
	 AOI0W0cRXWuvg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1521417E35D8;
	Thu,  5 Dec 2024 13:26:39 +0100 (CET)
Message-ID: <6792791b-035c-4b50-809a-c561bfe21c1d@collabora.com>
Date: Thu, 5 Dec 2024 13:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8516: add keypad node
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241204190524.21862-1-val@packett.cool>
 <20241204190524.21862-6-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241204190524.21862-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042641_195069_3022B42F 
X-CRM114-Status: GOOD (  12.87  )
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
> Add a keypad matrix node for the MT8516/MT8167 SoC.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index e30623ebac0e..3beb9f74ec79 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -220,6 +220,16 @@ timer: timer@10008000 {
>   			clock-names = "clk13m", "bus";
>   		};
>   
> +		keypad: keypad@10002000 {
> +			compatible = "mediatek,mt6779-keypad";

Noupe, you have to add your SoC to the compatible list... both here and in the
binding for mediatek.mt6779-keypad.yaml

compatible = "mediatek,mt8516-keypad", "mediatek,mt6779-keypad"

for the binding, it's just a simple addition to an enum, nothing else.

Cheers,
Angelo

> +			reg = <0 0x10002000 0 0x1000>;
> +			wakeup-source;
> +			interrupts = <GIC_SPI 149 IRQ_TYPE_EDGE_FALLING>;
> +			clocks = <&clk26m>;
> +			clock-names = "kpd";
> +			status = "disabled";
> +		};
> +
>   		syscfg_pctl: syscfg-pctl@10005000 {
>   			compatible = "syscon";
>   			reg = <0 0x10005000 0 0x1000>;




