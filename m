Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF8D58E76
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXGdlsQ7Hsv5vDEbjVFIaOCmk48Ai9TT/F174ITXF/o=; b=qHZPv58lyPhZEq6vVheVocMoID
	GOmQx9lw/SljRysLgmubehapI7mWbL2bYICTKpxGhP6hQNEI2vdic/+cb0WXN5MQoV3CTjIIdUSuH
	YvplRQo6MMQjWxk9dsS9J9ioL4PqZZ41N3n3ITVp4PSUg/NNfQVFYb+sjjby34tYEOErMRkZvE5jp
	rUXCTJiSbuGrdp2QbkJylaLu6X2WVIORnbrJ6tNJMAzycCnILDVk4Eilp0MFKLvv+2bHWE4v/+fK1
	sjJPcexTHkl42pJHGdkUvVg9sSH2oKkO6jH0YdJCUWMVKxECYj67qz+FPPl/3b0bwcjBPVXNeFF1v
	nKFrAQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxeZ-0000000CPXA-4B09;
	Mon, 02 Mar 2026 07:25:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxeY-0000000CPWW-2FKW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96EA860018;
	Mon,  2 Mar 2026 07:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B29C19423;
	Mon,  2 Mar 2026 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772436317;
	bh=7gVoKDdC5aVPTpZDUql6knM+f5JpIj34CLV1tjGpOxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKhkESAVIg3bAHWkpKjB9O3rV9eK766cVLOVveUzBuBVA7dfZNKt0z9AFBxGbjwyH
	 YGxJw2U1FI40PLjSl9UdWh/HNYpH9D7zjoysyXjc8Va/zklHypgcWwro6xYZaoXz3Y
	 FfpyNsrbWTCcKabkXLleXMJV3qkwtTdXxGVYqsKLTnAp4MuiRQSPO/7+J9nmj7FUOq
	 1VDOJmHl68M1+j5XV2o32rBv9bZGhaIu38c6MGGVQ2PZgXCMa5GOv9wfAeywoHzIPJ
	 jhv5bhjVIICI/bQAeSVSakv7GlKELOxDtWgAqxMxYqek4LJJwnYKxS5rJ5pNIJLppH
	 nrRiN/Ci7se9A==
Date: Mon, 2 Mar 2026 08:25:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: andi.shyti@kernel.org, ychuang3@nuvoton.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Message-ID: <20260302-amiable-rugged-mastiff-ccded3@quoll>
References: <20260302020822.13936-1-zychennvt@gmail.com>
 <20260302020822.13936-4-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302020822.13936-4-zychennvt@gmail.com>
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

On Mon, Mar 02, 2026 at 02:08:22AM +0000, Zi-Yu Chen wrote:
> Add I2C controller nodes to the MA35D1 SoC dtsi.
> Also enable the I2C interfaces on the MA35D1 SOM board
> to allow communication with onboard peripherals.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> ---
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 14 ++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> index f6f20a17e501..2a8f0fd90ded 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
> @@ -98,6 +98,14 @@ pinctrl_uart16: uart16-pins {
>  			power-source = <1>;
>  		};
>  	};

Missing blank line

> +	i2c-grp {
> +		pinctrl_i2c1: i2c1-pins {
> +			nuvoton,pins = <1 10 12>,
> +				       <1 11 12>;
> +			bias-disable;
> +		};
> +
> +	};
>  };
>  
>  &uart0 {
> @@ -129,3 +137,9 @@ &uart16 {
>  	pinctrl-0 = <&pinctrl_uart16>;
>  	status = "okay";
>  };
> +
> +&i2c1 {

Why 'i' is after 'u'? Please read DTS coding style.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index e51b98f5bdce..36bd19e37b57 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -17,6 +17,10 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	aliases {
> +		i2c0 = &i2c2;

Not a property of DTSI, but DTS.

> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> @@ -372,6 +376,66 @@ uart15: serial@407f0000 {
>  			status = "disabled";
>  		};
>  
> +		i2c1: i2c@40810000 {
> +			compatible = "nuvoton,ma35d1-i2c";
> +			reg = <0x0 0x40810000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk I2C1_GATE>;
> +			clock-frequency = <100000>;
> +			resets = <&sys MA35D1_RESET_I2C1>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c2: i2c@40820000 {
> +			compatible = "nuvoton,ma35d1-i2c";
> +			reg = <0x0 0x40820000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk I2C2_GATE>;
> +			clock-frequency = <100000>;
> +			resets = <&sys MA35D1_RESET_I2C2>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c3: i2c@40830000 {
> +			compatible = "nuvoton,ma35d1-i2c";
> +			reg = <0x0 0x40830000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk I2C3_GATE>;
> +			clock-frequency = <100000>;
> +			resets = <&sys MA35D1_RESET_I2C3>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c4: i2c@40840000 {
> +			compatible = "nuvoton,ma35d1-i2c";
> +			reg = <0x0 0x40840000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk I2C4_GATE>;
> +			clock-frequency = <100000>;
> +			resets = <&sys MA35D1_RESET_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@40850000 {
> +			compatible = "nuvoton,ma35d1-i2c";
> +			reg = <0x0 0x40850000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk I2C5_GATE>;
> +			clock-frequency = <100000>;
> +			resets = <&sys MA35D1_RESET_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		uart16: serial@40880000 {
>  			compatible = "nuvoton,ma35d1-uart";
>  			reg = <0x0 0x40880000 0x0 0x100>;
> @@ -379,5 +443,6 @@ uart16: serial@40880000 {
>  			clocks = <&clk UART16_GATE>;
>  			status = "disabled";
>  		};
> +

Why? Do not introduce random changes.

Best regards,
Krzysztof


