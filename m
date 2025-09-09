Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435DACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyadFLxlRlwEk+Ui8mjWLiq/XtmtbkFX+GzoshXoKNU=; b=4Ig1ZU9TVRdITQnmCRm4sesSmE
	0VXrvXlw9+VZBN90tt8wsEAQriYp/FZsl099W7WLV5sr6FlT1fJ2I4gJKlGrZoL/lSdRyTw75Vhdm
	WQkaCyUJPdmiOLUvDpwWT6PdbvbGcXT1YC7BMXHN/h4ELsIfU2yGU3bqkmdswLTGB9ntoWaC4f5Hi
	hPdCe21GKq5uZIn+TEepT12U3Uc9z9HpclnUCZNOha3YluFYTaBQjB9ipuz3oqiF0B8xaUHHJIof0
	mNQtSJcZ343GZInI51No/m9lUvtJHsK8n70RxXX1O8hqoPZNWapQ5ZfInSPopm10UrwTwYBfFeOd4
	VOGx3Zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv9a-00000006Czg-43fH;
	Tue, 09 Sep 2025 10:00:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtZx-00000005WlD-3VIm;
	Tue, 09 Sep 2025 08:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757405992;
	bh=VnSDQiVHfDeGGgN3036Z3G/Wze4azSlSEc+VJySEo0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K2AXZyIj3Y3viZKKNZ7DYM+GT+fvIZt461X6FqzI0+paqgMOF7SJyEfkuGPZMYRA2
	 jpQxoj9QD9K3XwdYZaTIyrdEztndO59ohA6uX+6JxlybXuU/cBgHnwP04BOu88c14Q
	 ichvF1Kw5hYURpa/aX4ROZ9EraLY0NDNcyDEkNQqQroWIjFbPXNPD7uKm9ZkcC4u5V
	 neOQwGdH1EftfIcCfjAV85ERowOXIuiZtPa/ZNEykWv9EWdSuvtXvcVZKdVTCNCljC
	 aEEFa6iagL9kumJKYYYPnrGT/HK9+BMSmHc/XbCwEMSSMI14QvnCvIqYFNsGZJ0DVQ
	 j0VzGztIh0Ybg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B99417E0100;
	Tue,  9 Sep 2025 10:19:51 +0200 (CEST)
Message-ID: <db10eb9e-471d-4022-902c-ca5d497a6cde@collabora.com>
Date: Tue, 9 Sep 2025 10:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: mediatek: mt8390-genio-700-evk: Add
 Grinn GenioSBC-700
To: Mateusz Koza <mateusz.koza@grinn-global.com>, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com, andrew@lunn.ch
References: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
 <20250908130620.2309399-2-mateusz.koza@grinn-global.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908130620.2309399-2-mateusz.koza@grinn-global.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_011954_206792_DDF0C645 
X-CRM114-Status: GOOD (  18.43  )
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

Il 08/09/25 15:05, Mateusz Koza ha scritto:
> Add support for Grinn GenioSBC-700. The Grinn GenioSBC-700 is a
> single-board computer based on the MediaTek Genio 700 SoC. Its device
> tree is split into separate SoM (.dtsi) and SBC (.dtsi) files, which are
> combined in the SoC-specific .dts file.
> 
> More details about the hardware:
> - https://grinn-global.com/products/grinn-geniosom-700
> - https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../mediatek/mt8390-grinn-genio-700-sbc.dts   |  19 +
>   .../dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 538 ++++++++++++++++++
>   .../dts/mediatek/mt8390-grinn-genio-som.dtsi  | 209 +++++++
>   4 files changed, 767 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index a4df4c21399e..b37a8c65e724 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -101,6 +101,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-grinn-genio-700-sbc.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
> new file mode 100644
> index 000000000000..a37507a5a5d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Grinn sp. z o.o.
> + * Author: Mateusz Koza <mateusz.koza@grinn-global.com>
> + */
> +/dts-v1/;
> +
> +#include "mt8188.dtsi"
> +#include "mt8390-grinn-genio-som.dtsi"
> +#include "mt8390-grinn-genio-sbc.dtsi"
> +
> +/ {
> +	model = "Grinn GenioSBC-700";
> +	compatible = "grinn,genio-700-sbc", "mediatek,mt8390", "mediatek,mt8188";

Just a nit: please leave one blank line here.

> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 1 0x00000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
> new file mode 100644
> index 000000000000..0e6006cd8ed9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
> @@ -0,0 +1,538 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Grinn sp. z o.o.
> + * Author: Mateusz Koza <mateusz.koza@grinn-global.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	chassis-type = "embedded";
> +	aliases {
> +		ethernet0 = &eth;
> +		i2c0 = &i2c0;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		serial0 = &uart0;
> +	};
> +

Please move chassis-type here.

> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +
> +	firmware {
> +		optee {
> +			compatible = "linaro,optee-tz";
> +			method = "smc";
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/*
> +		 * 12 MiB reserved for OP-TEE (BL32)
> +		 * +-----------------------+ 0x43e0_0000
> +		 * |      SHMEM 2MiB       |
> +		 * +-----------------------+ 0x43c0_0000
> +		 * |        | TA_RAM  8MiB |
> +		 * + TZDRAM +--------------+ 0x4340_0000
> +		 * |        | TEE_RAM 2MiB |
> +		 * +-----------------------+ 0x4320_0000
> +		 */
> +		optee_reserved: optee@43200000 {
> +			no-map;
> +			reg = <0 0x43200000 0 0x00c00000>;
> +		};
> +
> +		scp_mem: memory@50000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +
> +		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
> +		bl31_secmon_reserved: memory@54600000 {
> +			no-map;
> +			reg = <0 0x54600000 0x0 0x200000>;
> +		};
> +
> +		apu_mem: memory@55000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x55000000 0 0x1400000>; /* 20 MB */
> +		};
> +
> +		vpu_mem: memory@57000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x57000000 0 0x1400000>; /* 20 MB */
> +		};
> +
> +		adsp_mem: memory@60000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x60000000 0 0xf00000>;
> +			no-map;
> +		};
> +
> +		afe_dma_mem: memory@60f00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x60f00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		adsp_dma_mem: memory@61000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x61000000 0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	reg_sbc_vsys: regulator-vsys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	reg_fixed_5v: regulator-0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed_5v";

Can we please avoid underscores?

regulator-name = "fixed-5v0";

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +		regulator-always-on;
> +		vin-supply = <&reg_sbc_vsys>;
> +	};
> +
> +	reg_fixed_4v2: regulator-1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed_4v2";

fixed-4v2

> +		regulator-min-microvolt = <4200000>;
> +		regulator-max-microvolt = <4200000>;
> +		enable-active-high;
> +		regulator-always-on;
> +		vin-supply = <&reg_sbc_vsys>;
> +	};
> +
> +	reg_fixed_3v3: regulator-2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed_3v3";

fixed-3v3

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-always-on;
> +		vin-supply = <&reg_sbc_vsys>;
> +	};
> +};
> +
> +&pio {
> +	gpio-line-names =
> +	/*  0 -  4   */ "RPI_GPIO0", "RPI_GPIO1", "", "", "RPI_GPIO4",
> +	/*  5 -  9   */ "", "RPI_GPIO6", "", "", "RPI_GPIO9",
> +	/* 10 - 14   */ "RPI_GPIO10", "RPI_GPIO11", "", "", "",
> +	/* 15 - 19   */ "", "", "", "", "",
> +	/* 20 - 24   */ "", "RPI_GPIO21", "", "RPI_GPIO23", "",
> +	/* 25 - 29   */ "", "", "", "", "",
> +	/* 30 - 34   */ "RPI_GPIO30", "", "", "", "",
> +	/* 35 - 39   */ "RPI_GPIO35", "RPI_GPIO36", "", "", "",
> +	/* 40 - 44   */ "", "", "", "", "",
> +	/* 45 - 49   */ "", "", "", "", "",
> +	/* 50 - 54   */ "", "", "", "", "",
> +	/* 55 - 59   */ "RPI_GPIO55", "RPI_GPIO56", "", "", "RPI_GPIO59",
> +	/* 60 - 64   */ "RPI_GPIO60", "", "", "", "",
> +	/* 65 - 69   */ "", "", "", "", "RPI_GPIO69",
> +	/* 70 - 74   */ "", "", "RPI_GPIO72", "RPI_GPIO73", "RPI_GPIO74",
> +	/* 75 - 79   */ "", "", "", "", "RPI_GPIO79",
> +	/* 80 - 84   */ "RPI_GPIO80", "RPI_GPIO81", "RPI_GPIO82", "", "",
> +	/* 85 - 89   */ "", "", "", "", "",
> +	/* 90 - 94   */ "", "", "", "", "",
> +	/* 95 - 99   */ "", "", "", "", "",
> +	/*100 - 104  */ "", "", "", "", "",
> +	/*105 - 109  */ "", "", "", "", "",
> +	/*110 - 114  */ "", "", "", "", "",
> +	/*115 - 119  */ "", "", "", "", "",
> +	/*120 - 124  */ "", "RPI_GPIO121", "RPI_GPIO122", "RPI_GPIO123", "RPI_GPIO124";
> +
> +	i2c0_pins: i2c0-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>,
> +				 <PINMUX_GPIO55__FUNC_B1_SCL0>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +			drive-strength-microamp = <1000>;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO60__FUNC_B1_SDA2>,
> +				 <PINMUX_GPIO59__FUNC_B1_SCL2>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +			drive-strength-microamp = <1000>;
> +		};
> +	};
> +
> +	i2c3_pins: i2c3-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO62__FUNC_B1_SDA3>,
> +				 <PINMUX_GPIO61__FUNC_B1_SCL3>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +			drive-strength-microamp = <1000>;
> +		};
> +	};
> +
> +	i2c5_pins: i2c5-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO66__FUNC_B1_SDA5>,
> +				 <PINMUX_GPIO65__FUNC_B1_SCL5>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +			drive-strength-microamp = <1000>;
> +		};
> +	};
> +
> +	i2c6_pins: i2c6-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO68__FUNC_B1_SDA6>,
> +				 <PINMUX_GPIO67__FUNC_B1_SCL6>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +			drive-strength-microamp = <1000>;
> +		};
> +	};
> +
> +	uart0_pins: uart0-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
> +				 <PINMUX_GPIO32__FUNC_I1_URXD0>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	uart1_pins: uart1-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO86__FUNC_O_UTXD1>,
> +				 <PINMUX_GPIO87__FUNC_I1_URXD1>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	uart2_pins: uart2-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO35__FUNC_O_UTXD2>,
> +				 <PINMUX_GPIO36__FUNC_I1_URXD2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie_pins_default: pcie-default {
> +		mux {
> +			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
> +				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
> +				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	eth_default_pins: eth-default-pins {
> +		pins-cc {
> +			pinmux = <PINMUX_GPIO139__FUNC_B0_GBE_TXC>,
> +				 <PINMUX_GPIO140__FUNC_I0_GBE_RXC>,
> +				 <PINMUX_GPIO141__FUNC_I0_GBE_RXDV>,
> +				 <PINMUX_GPIO142__FUNC_O_GBE_TXEN>;
> +			drive-strength = <8>;
> +		};
> +
> +		pins-mdio {
> +			pinmux = <PINMUX_GPIO143__FUNC_O_GBE_MDC>,
> +				 <PINMUX_GPIO144__FUNC_B1_GBE_MDIO>;
> +			drive-strength = <8>;
> +			input-enable;
> +		};
> +
> +		pins-power {
> +			pinmux = <PINMUX_GPIO145__FUNC_B_GPIO145>,
> +				 <PINMUX_GPIO146__FUNC_B_GPIO146>;
> +			output-high;
> +		};
> +
> +		pins-rxd {
> +			pinmux = <PINMUX_GPIO135__FUNC_I0_GBE_RXD3>,
> +				 <PINMUX_GPIO136__FUNC_I0_GBE_RXD2>,
> +				 <PINMUX_GPIO137__FUNC_I0_GBE_RXD1>,
> +				 <PINMUX_GPIO138__FUNC_I0_GBE_RXD0>;
> +			drive-strength = <8>;
> +		};
> +
> +		pins-txd {
> +			pinmux = <PINMUX_GPIO131__FUNC_O_GBE_TXD3>,
> +				 <PINMUX_GPIO132__FUNC_O_GBE_TXD2>,
> +				 <PINMUX_GPIO133__FUNC_O_GBE_TXD1>,
> +				 <PINMUX_GPIO134__FUNC_O_GBE_TXD0>;
> +			drive-strength = <8>;
> +		};
> +	};
> +
> +	eth_sleep_pins: eth-sleep-pins {
> +		pins-cc {
> +			pinmux = <PINMUX_GPIO139__FUNC_B_GPIO139>,
> +				 <PINMUX_GPIO140__FUNC_B_GPIO140>,
> +				 <PINMUX_GPIO141__FUNC_B_GPIO141>,
> +				 <PINMUX_GPIO142__FUNC_B_GPIO142>;
> +		};
> +
> +		pins-mdio {
> +			pinmux = <PINMUX_GPIO143__FUNC_B_GPIO143>,
> +				 <PINMUX_GPIO144__FUNC_B_GPIO144>;
> +			input-disable;
> +			bias-disable;
> +		};
> +
> +		pins-rxd {
> +			pinmux = <PINMUX_GPIO135__FUNC_B_GPIO135>,
> +				 <PINMUX_GPIO136__FUNC_B_GPIO136>,
> +				 <PINMUX_GPIO137__FUNC_B_GPIO137>,
> +				 <PINMUX_GPIO138__FUNC_B_GPIO138>;
> +		};
> +
> +		pins-txd {
> +			pinmux = <PINMUX_GPIO131__FUNC_B_GPIO131>,
> +				 <PINMUX_GPIO132__FUNC_B_GPIO132>,
> +				 <PINMUX_GPIO133__FUNC_B_GPIO133>,
> +				 <PINMUX_GPIO134__FUNC_B_GPIO134>;
> +		};
> +	};
> +
> +	spi2_pins: spi2-pins {
> +		pins-spi {
> +			pinmux = <PINMUX_GPIO79__FUNC_O_SPIM2_CSB>,
> +				<PINMUX_GPIO80__FUNC_O_SPIM2_CLK>,
> +				<PINMUX_GPIO81__FUNC_B0_SPIM2_MOSI>,
> +				<PINMUX_GPIO82__FUNC_B0_SPIM2_MISO>;
> +			bias-disable;
> +		};
> +	};
> +
> +	audio_default_pins: audio-default-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO121__FUNC_B0_PCM_CLK>,
> +				 <PINMUX_GPIO122__FUNC_B0_PCM_SYNC>,
> +				 <PINMUX_GPIO123__FUNC_O_PCM_DO>,
> +				 <PINMUX_GPIO124__FUNC_I0_PCM_DI>;
> +		};
> +	};
> +
> +	usb_default_pins: usb-default-pins {
> +		pins-valid {
> +			pinmux = <PINMUX_GPIO85__FUNC_I0_VBUSVALID>;
> +			input-enable;
> +		};
> +	};
> +};
> +
> +&eth {

Please reorder the nodes per type (generic first, vendor specific last) and
alphabetically, like so:

> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethernet_phy0>;

pinctrl-names
pinctrl-0
pinctrl-1

mediatek,.....
snps,.....

status = "okay";

> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 11000 200000>;
> +	mediatek,tx-delay-ps = <30>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default_pins>;
> +	pinctrl-1 = <&eth_sleep_pins>;
> +	mediatek,mac-wol;
> +	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&eth_mdio {
> +	ethernet_phy0: ethernet-phy@3 {

compatible
reg
interrupts-extended
eee-broken-1000t;

> +		reg = <3>;
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		eee-broken-1000t;
> +		interrupts-extended = <&pio 148 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +

> +&xhci1 {

#address-cells
#size-cells
vusb33-supply
status = "okay"

subnodes

> +	status = "okay";
> +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb451,8027";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		vdd-supply = <&reg_fixed_3v3>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb451,8025";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		vdd-supply = <&reg_fixed_3v3>;
> +	};
> +};
> +
> +&xhci2 {
> +	status = "okay";
> +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;

same here

> +
> +	hub@1 {
> +		compatible = "microchip,usb2513bi";
> +		reg = <1>;
> +		vdd-supply = <&reg_fixed_3v3>;
> +	};
> +};
> +
> +&ssusb0 {
> +	status = "okay";
> +	dr_mode = "peripheral";
> +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	pinctrl-0 = <&usb_default_pins>;
> +	pinctrl-names = "default";

dr_mode
pinctrl
vusb

status

> +};
> +
> +&ssusb1 {
> +	status = "okay";
> +	dr_mode = "host";
> +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	maximum-speed = "super-speed";

dr_mode
maximum-speed
vusb
status

> +};
> +
> +&ssusb2 {
> +	status = "okay";
> +	dr_mode = "host";
> +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	maximum-speed = "high-speed";

same here

> +};
> +
> +&scp_cluster {
> +	status = "okay";
> +};
> +
> +&scp_c0 {
> +	firmware-name = "mediatek/mt8188/scp.img";

please drop firmware-name, unfortunately this is not acceptable upstream.

> +	memory-region = <&scp_mem>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&mt6359_vproc2_buck_reg>;
> +	status = "okay";
> +};
> +
> +&adsp {
> +	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
> +	status = "okay";
> +};
> +
> +&afe {
> +	memory-region = <&afe_dma_mem>;
> +	status = "okay";
> +};
> +
> +&sound {
> +	compatible = "mediatek,mt8390-mt6359-evk", "mediatek,mt8188-mt6359-evb";
> +	model = "mt8390-evk";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&audio_default_pins>;
> +	audio-routing =
> +		"Headphone", "Headphone L",
> +		"Headphone", "Headphone R",
> +		"AP DMIC", "AUDGLB",
> +		"AP DMIC", "MIC_BIAS_0",
> +		"AP DMIC", "MIC_BIAS_2",
> +		"DMIC_INPUT", "AP DMIC";
> +
> +	mediatek,adsp = <&adsp>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
> new file mode 100644
> index 000000000000..d88481beff9d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Grinn sp. z o.o.
> + * Author: Mateusz Koza <mateusz.koza@grinn-global.com>
> + */
> +
> +#include "mt6359.dtsi"
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	aliases {
> +		i2c1 = &i2c1;
> +		mmc0 = &mmc0;
> +	};
> +};
> +

..snip..

> +
> +&pmic {
> +	interrupt-parent = <&pio>;
> +	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;

interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;

> +
> +	mt6359keys: keys {

(drop handle) keys {

> +		compatible = "mediatek,mt6359-keys";
> +		mediatek,long-press-mode = <1>;
> +		power-off-time-sec = <0>;
> +
> +		power-key {
> +			linux,keycodes = <KEY_POWER>;
> +			wakeup-source;
> +		};
> +	};
> +};
Cheers,
Angelo

