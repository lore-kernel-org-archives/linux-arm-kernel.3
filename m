Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29BAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHRy52bGmNjppAKIKN7VBsH4+tXKv5hwh477dIVZ2+k=; b=SiAjmVfZRY8jvSU7c/YxkLGipL
	sGkA6f9C1CGPSbLlzyjSpY2X3/Da48QEgw22riwedKEYysarCHag4bUrrvWjv3sbW+0yLYAAsoNDG
	cPuXVnzMr6C2gd3RCVowGC4dBCCTokoCBFtc3kDBZiQV5CUEigywpeqrn/ER+ECT6dyMRNtdqs/mb
	5SZqV8K8+ILaHLBnQqSyOtrq1JRxkkqXMVrfrqGHlg3OzEOXTNOsC/w2+FRtKsD/WQz7hq09R9KiG
	BG7m4YCXZzfJhL77k96+wxL6XHNP61u4XWdh++QKXT/T0N0Ex79FptK8quUrYcALeK7vhMPYqPYt6
	OPkU0gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrPq-0000000Gdlo-2tdP;
	Tue, 25 Feb 2025 09:39:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqvK-0000000GWHC-24QG;
	Tue, 25 Feb 2025 09:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474496;
	bh=Rt19i2+WPrjhMWw0L7ggO+RczbXHL+wWVPfQJj2MLi0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FI0EFlj/DR6juAC8nxHr1jZWYOEnevyDTD5na0IxQCrUVQ7qXDy1sFxoKOEn+WyMn
	 QtB6pnmsMSFQM/eKLdZiruSvlyhgRhtaDen2iTW2HihNaE20nfMQy7ujX1aH0pbZKL
	 lfBBCGNn6iq+ADOBciGLXU2jvCfrw5gziqG40xVBdF32OPaMH0omkx7WNGv83p0S3q
	 BVPlKL72RwAZlHRoES1vdwXzxFQbbQEGlCgRaNFcUii60wQVwAm+SXJvsMs9MKvMh0
	 0c/A8dmdqR5WC6nuvraTygQqIiu2TqSc6Y1I1HsdUt7iAj4PNp2O5aeN8td1M9vbjO
	 1Ycmm3lHTWZCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 741A517E0866;
	Tue, 25 Feb 2025 10:08:16 +0100 (CET)
Message-ID: <9ba03e42-71a3-4443-be16-7ba82f76fa40@collabora.com>
Date: Tue, 25 Feb 2025 10:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: airoha: en7581: Add more nodes to
 EN7581 SoC evaluation board
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250221-en7581-dts-spi-pinctrl-v3-0-4719e2d01555@kernel.org>
 <20250221-en7581-dts-spi-pinctrl-v3-1-4719e2d01555@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250221-en7581-dts-spi-pinctrl-v3-1-4719e2d01555@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010818_682434_5D294277 
X-CRM114-Status: GOOD (  12.52  )
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

Il 21/02/25 09:01, Lorenzo Bianconi ha scritto:
> Introduce the following nodes to EN7581 SoC and EN7581 evaluation board:
> - rng controller
> - pinctrl
> - i2c controllers
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/airoha/en7581-evb.dts |  4 +++
>   arch/arm64/boot/dts/airoha/en7581.dtsi    | 60 +++++++++++++++++++++++++++++++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> index a4cdcadd1ae547cfc79553208f991767602705fd..d53b72d18242e3cee8b37c7b1b719d662fd6db8d 100644
> --- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
> +++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> @@ -64,3 +64,7 @@ reserved_bmt@7e00000 {
>   		};
>   	};
>   };
> +
> +&i2c0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
> index dbd296b049f99721186ab435d6e6b8dff73b73af..9a419796594d3a99e1187dcca622469bf5a888c3 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -3,6 +3,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/en7523-clk.h>
> +#include <dt-bindings/reset/airoha,en7581-reset.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -123,6 +124,12 @@ timer {
>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
> +	clk20m: clock-20000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <20000000>;
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		#address-cells = <2>;
> @@ -181,5 +188,58 @@ uart1: serial@1fbf0000 {
>   			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>   			clock-frequency = <1843200>;
>   		};
> +
> +		rng@1faa1000 {
> +			compatible = "airoha,en7581-trng";
> +			reg = <0x0 0x1faa1000 0x0 0xc04>;
> +			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		system-controller@1fbf0200 {
> +			compatible = "airoha,en7581-gpio-sysctl", "syscon",
> +				     "simple-mfd";
> +			reg = <0x0 0x1fbf0200 0x0 0xc0>;
> +
> +			en7581_pinctrl: pinctrl {
> +				compatible = "airoha,en7581-pinctrl";
> +
> +				interrupt-parent = <&gic>;
> +				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +			};
> +		};
> +
> +		i2c0: i2c@1fbf8000 {
> +			compatible = "mediatek,mt7621-i2c";
> +			reg = <0x0 0x1fbf8000 0x0 0x100>;
> +
> +			resets = <&scuclk EN7581_I2C2_RST>;
> +
> +			clocks = <&clk20m>;
> +			clock-frequency = <100000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@1fbf8100 {
> +			compatible = "mediatek,mt7621-i2c";
> +			reg = <0x0 0x1fbf8100 0x0 0x100>;
> +
> +			resets = <&scuclk EN7581_I2C_MASTER_RST>;
> +
> +			clocks = <&clk20m>;
> +			clock-frequency = <100000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +		};
>   	};
>   };
> 




