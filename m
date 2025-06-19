Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9DDC7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7usLyk0noPkEv2ge2kQqBK/ILFniJZuPZ4hyGzkrYs=; b=tWOV00fiRaN2XwSqWBvHCi3TTw
	C3xWekCG/vtWS5AZtixTJijJwPADpCSqfX7/wbto4EoRcA1Mg2vVTpzOYe9/gUBwKfX54K7XZiWnw
	ejPCVk/IdTcZXIyVaCSxrN7fph2DT6bMBqPrHqqOIHNAiTmj2OdgBFxfPSH4Rk5dQvkug5kkaYthL
	8vzemZDceazIZJaMajtus4ubG2LegOv75VK9iZfvlACu6Bq4sRcVwNJ1y7hi/7j4FGHbJmeMVmhWv
	9Xg08fHntuu7DgZNR5cAzaH1l1ZLzdhPBQ1W1oalTTdeh+U9vjec/3m61W4LzsOMmRR65KeAQ2/qb
	niQAuT0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSANm-0000000COzf-0sGU;
	Thu, 19 Jun 2025 08:12:26 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9tL-0000000CJwF-0dI3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=s7usLyk0noPkEv2ge2kQqBK/ILFniJZuPZ4hyGzkrYs=;
	b=XYzXHUcmxLI5+cRkznmkVQEWL3Or3K317seMkpsm2fMSJIOfakdTK0JKxVFhf8
	SzK2zor0fbQhe3C5TUBVAzLHQPzMC83xaHET+8+eibi+piuCgVbci8WVyQNyUcrg
	p/AlXLEmz0JGou+aeGlKaLh/V0xSZznkN9pLbmeQXzGUs=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnnw6GvlNox8n5AA--.38868S3;
	Thu, 19 Jun 2025 15:38:49 +0800 (CST)
Date: Thu, 19 Jun 2025 15:38:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: James Clark <james.clark@linaro.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>,
	Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	"Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
Subject: Re: [PATCH v2 14/14] arm64: dts: Add DSPI entries for S32G platforms
Message-ID: <aFO+htx92aa90SL0@dragon>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
 <20250522-james-nxp-spi-v2-14-bea884630cfb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-james-nxp-spi-v2-14-bea884630cfb@linaro.org>
X-CM-TRANSID: M88vCgAnnw6GvlNox8n5AA--.38868S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxKw48trW8Ary5Gr1rZr4rAFb_yoWDGFWkpF
	9xKayfJr10qF12g3sxtr4kWr1kG3ykKr1a9rnruFyjvay29FyfKFs7KF4ku34fZF1UXw4U
	XF4vvrW3Crsrtw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0xRDUUUUU=
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQFxZWhTmlaGagAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_004059_507487_C22E4311 
X-CRM114-Status: GOOD (  17.47  )
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

On Thu, May 22, 2025 at 03:51:43PM +0100, James Clark wrote:
> From: Larisa Grigore <larisa.grigore@nxp.com>
> 
> S32G3 and S32G2 have the same 6 SPI devices, add the DT entries. Devices
> are all the same except spi0 has 8 chip selects instead of 5. Clock
> settings for the chip rely on ATF Firmware [1].
> 
> [1]: https://github.com/nxp-auto-linux/arm-trusted-firmware
> Co-developed-by: Radu Pirea (NXP OSS) <radu-nicolae.pirea@oss.nxp.com>
> Signed-off-by: Radu Pirea (NXP OSS) <radu-nicolae.pirea@oss.nxp.com>
> Signed-off-by: Larisa Grigore <Larisa.Grigore@nxp.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi        | 78 +++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi        | 78 +++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi | 83 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 83 +++++++++++++++++++++++++
>  4 files changed, 322 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index ea1456d361a3..68848575bf81 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -376,6 +376,45 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@401d4000 {
> +			compatible = "nxp,s32g2-dspi";
> +			reg = <0x401d4000 0x1000>;
> +			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <8>;
> +			bus-num = <0>;
> +			dmas = <&edma0 0 7>, <&edma0 0 8>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@401d8000 {
> +			compatible = "nxp,s32g2-dspi";
> +			reg = <0x401d8000 0x1000>;
> +			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <1>;
> +			dmas = <&edma0 0 10>, <&edma0 0 11>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi2: spi@401dc000 {
> +			compatible = "nxp,s32g2-dspi";
> +			reg = <0x401dc000 0x1000>;
> +			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <2>;
> +			dmas = <&edma0 0 13>, <&edma0 0 14>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@401e4000 {
>  			compatible = "nxp,s32g2-i2c";
>  			reg = <0x401e4000 0x1000>;
> @@ -460,6 +499,45 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>  
> +		spi3: spi@402c8000 {
> +			compatible = "nxp,s32g2-dspi";
> +			reg = <0x402c8000 0x1000>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <3>;
> +			dmas = <&edma0 1 7>, <&edma0 1 8>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi4: spi@402cc000 {
> +			compatible = "nxp,s32g2-dspi";
> +			reg = <0x402cc000 0x1000>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <4>;
> +			dmas = <&edma0 1 10>, <&edma0 1 11>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi5: spi@402d0000 {
> +			compatible = "nxp,s32g2-dspi";
> +			reg = <0x402d0000 0x1000>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <5>;
> +			dmas = <&edma0 1 13>, <&edma0 1 14>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
>  		i2c3: i2c@402d8000 {
>  			compatible = "nxp,s32g2-i2c";
>  			reg = <0x402d8000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 991dbfbfa203..4f883b1a50ad 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -435,6 +435,45 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@401d4000 {
> +			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
> +			reg = <0x401d4000 0x1000>;
> +			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <8>;
> +			bus-num = <0>;
> +			dmas = <&edma0 0 7>, <&edma0 0 8>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@401d8000 {
> +			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
> +			reg = <0x401d8000 0x1000>;
> +			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <1>;
> +			dmas = <&edma0 0 10>, <&edma0 0 11>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi2: spi@401dc000 {
> +			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
> +			reg = <0x401dc000 0x1000>;
> +			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <2>;
> +			dmas = <&edma0 0 13>, <&edma0 0 14>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
>  		i2c0: i2c@401e4000 {
>  			compatible = "nxp,s32g3-i2c",
>  				     "nxp,s32g2-i2c";
> @@ -524,6 +563,45 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>  
> +		spi3: spi@402c8000 {
> +			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
> +			reg = <0x402c8000 0x1000>;
> +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <3>;
> +			dmas = <&edma0 1 7>, <&edma0 1 8>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi4: spi@402cc000 {
> +			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
> +			reg = <0x402cc000 0x1000>;
> +			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <4>;
> +			dmas = <&edma0 1 10>, <&edma0 1 11>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
> +		spi5: spi@402d0000 {
> +			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
> +			reg = <0x402d0000 0x1000>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 26>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <5>;
> +			dmas = <&edma0 1 13>, <&edma0 1 14>;
> +			dma-names = "tx", "rx";
> +			status = "disabled";
> +		};
> +
>  		i2c3: i2c@402d8000 {
>  			compatible = "nxp,s32g3-i2c",
>  				     "nxp,s32g2-i2c";
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> index d26af0fb8be7..d8bf734aa267 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -173,6 +173,77 @@ i2c4-gpio-grp1 {
>  			pinmux = <0x2d40>, <0x2d30>;
>  		};
>  	};
> +
> +	dspi1_pins: dspi1-pins {
> +		dspi1-grp0 {
> +			pinmux = <0x72>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +
> +		dspi1-grp1 {
> +			pinmux = <0x62>;
> +			output-enable;
> +			slew-rate = <150>;
> +		};
> +
> +		dspi1-grp2 {
> +			pinmux = <0x83>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +		};
> +
> +		dspi1-grp3 {
> +			pinmux = <0x5F0>;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +
> +		dspi1-grp4 {
> +			pinmux = <0x3D92>,
> +				 <0x3DA2>,
> +				 <0x3DB2>;
> +		};
> +	};
> +
> +	dspi5_pins: dspi5-pins {
> +		dspi5-grp0 {
> +			pinmux = <0x93>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +		};
> +
> +		dspi5-grp1 {
> +			pinmux = <0xA0>;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +
> +		dspi5-grp2 {
> +			pinmux = <0x3ED2>,
> +				 <0x3EE2>,
> +				 <0x3EF2>;
> +		};
> +
> +		dspi5-grp3 {
> +			pinmux = <0xB3>;
> +			output-enable;
> +			slew-rate = <150>;
> +		};

Missing a newline.

I fixed it up and applied the patch.

Shawn

> +		dspi5-grp4 {
> +			pinmux = <0xC3>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +	};
>  };
>  
>  &can0 {
> @@ -220,3 +291,15 @@ &i2c4 {
>  	pinctrl-1 = <&i2c4_gpio_pins>;
>  	status = "okay";
>  };
> +
> +&spi1 {
> +	pinctrl-0 = <&dspi1_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&spi5 {
> +	pinctrl-0 = <&dspi5_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> index ba53ec622f0b..b0a21e4468da 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -127,6 +127,77 @@ i2c4-gpio-grp1 {
>  			pinmux = <0x2d40>, <0x2d30>;
>  		};
>  	};
> +
> +	dspi1_pins: dspi1-pins {
> +		dspi1-grp0 {
> +			pinmux = <0x72>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +
> +		dspi1-grp1 {
> +			pinmux = <0x62>;
> +			output-enable;
> +			slew-rate = <150>;
> +		};
> +
> +		dspi1-grp2 {
> +			pinmux = <0x83>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +		};
> +
> +		dspi1-grp3 {
> +			pinmux = <0x5F0>;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +
> +		dspi1-grp4 {
> +			pinmux = <0x3D92>,
> +				 <0x3DA2>,
> +				 <0x3DB2>;
> +		};
> +	};
> +
> +	dspi5_pins: dspi5-pins {
> +		dspi5-grp0 {
> +			pinmux = <0x93>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +		};
> +
> +		dspi5-grp1 {
> +			pinmux = <0xA0>;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +
> +		dspi5-grp2 {
> +			pinmux = <0x3ED2>,
> +				 <0x3EE2>,
> +				 <0x3EF2>;
> +		};
> +
> +		dspi5-grp3 {
> +			pinmux = <0xB3>;
> +			output-enable;
> +			slew-rate = <150>;
> +		};
> +		dspi5-grp4 {
> +			pinmux = <0xC3>;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <150>;
> +			bias-pull-up;
> +		};
> +	};
>  };
>  
>  &can0 {
> @@ -155,6 +226,18 @@ pcal6524: gpio-expander@22 {
>  	};
>  };
>  
> +&spi1 {
> +	pinctrl-0 = <&dspi1_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&spi5 {
> +	pinctrl-0 = <&dspi5_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &i2c2 {
>  	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&i2c2_pins>;
> 
> -- 
> 2.34.1
> 


