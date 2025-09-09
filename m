Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C72CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DyBSxWmm9na4mfTkZqI3l8MVVrtqBO96WL+y7f6wA4=; b=NV9NhB/rDN8S6jF6bPMC0HPACR
	cBJW81Tl/Py4wzjWzStRxog1OLfsorTa/Xq01OJiGk9C+v7c1Fzyk4MjSGKLFk+QRnuhCdsqTJhQq
	58EX22canU7jvycxSYwm5kZgnAduwgDdGN52vi9pi6QirUmgE1nbRmL5s56pX4MItzF1UBCfwG3KW
	pZC1AkehGdUSRNZ1umT4gJfSNx/qMRzfPTU8g2G9hUX81CgYg+zGi2Q5RcnVbe/Sos0BKehRMfiry
	w0ZYdf7qLR1zk9jNdW11f4O8Wzk6/YNw3uKrpDdDAltkn7fG2lWbF/TE4xg++bQUukE5kR8cwHxM0
	FyarirLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsv7-00000005EB9-2Xgc;
	Tue, 09 Sep 2025 07:37:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvs72-00000004mTP-2AQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 06:46:00 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso4619559a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 23:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757400355; x=1758005155; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6DyBSxWmm9na4mfTkZqI3l8MVVrtqBO96WL+y7f6wA4=;
        b=JRdml1g4YKyeCxKcR+arVgNXO4C+l1p3r57Mm4RyXa+q0KMkBYHrZLUIYVHGrGUVL2
         A5J5u+CJ/gQsBjmdPgkuCeqC2W/U8tt4TRNXT1/fol/trH7LHFbj6s3NaFGYggE3ppHK
         +E/qCZ6gx7xPUZfxn/L+nzrC/68dcIrje56zZkI6w/TOtyfHg3Mm1zvKzKJdP2AJzU9s
         XmjaLKzM11rPZ1O8O15GE8x8oInzvDgnrMXynNuCgbMNKdAaExc35JhTxmEBbSenh6Tx
         GmA8eO8qXyaqGcBFh5EeQOUhWKf/Oa6I8a1n86iTS6/Kz7PbQ7x4ZOyAs0z7U0KnYCnx
         CwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757400355; x=1758005155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DyBSxWmm9na4mfTkZqI3l8MVVrtqBO96WL+y7f6wA4=;
        b=l1qtk/LwSRIvmnANHPRPQkj2twf13H8F2ToJu3Tm5iU7dYYq07/7Kt7CCFyZGPjZUw
         0ohlLBniwiAuxPjoelFYJYBndBZj03Ljmec9iMYeOnbX5dqcRovPuC1DKVbsMbc2Pv3F
         FSlVXRVJLEktzZ9t4kTu+1ZadEtWZYmvP6zZaAMoLw8C6J6E3wlPCrrRrJs+Amkxsgkc
         yNe/T/obmQqtM1Gfa+/VH5T2NASauDr5pVxhWat7+cJCYYdcudamgFwC/sdiOc9Q/OBQ
         etm36OvDfvxKhb/Wyrkj+F1FrTPPRCA13BOG4UAVNMomESVpfiLKK1RMNBJYoblO8+2O
         4LYg==
X-Forwarded-Encrypted: i=1; AJvYcCUREPAySaizGN9j439x72Rdo15BaCH43wtXVCGBSGj2JJSfhvCkx1zL6WkoS8wj/liZcyfA7twQ6MyBI/b9/6HO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ON76GFQ2vmMQBQ4M82jlaiTj/9Eo95Obkot9XST5wJA+SMWE
	EdH089q74EDcFzEYsGgUQ9Qqm5U5FhUMadKhO/XhzAL9OSGSezaTVzQGNHNP2HanRHQ=
X-Gm-Gg: ASbGncuH/nSLIRFiITOjHbhFAcuWAVJeLIVdKXbx5W1JhdZ7sgBYLz9Mnp8U293kZSG
	qpiE4oCBvt+brMmXet12/brYbo/sJCnF2XeYWHxdiNcq9RA44fQeFVls6HeQ3SfaMxJBc81+clJ
	gDLZyiJf/hxk4u7RenSaslj4soLsbU5NymtmYnToovjjlM0Zg3Sp2o+BgK5OWSYhXxtiaJFRxc9
	FTNzUEnRXIkcgckeV50osIrj4Lm+xS9JL/dFIlaj1PASAuYdjzYmWy4Lgm+mXOewwa9Dj4rm7vK
	v7CS3xLeruYo8FHx8wyBMA53OBGjCyaX3Pm7yfY7UAqtRj7yW52yXKGM9vLAZmcKyz6J+NGEiyo
	I/9HbOGS7ofLqKkrr8MT+f36h5XYpJQhrn4hRZzAx+o4N
X-Google-Smtp-Source: AGHT+IGCFYStrTgNsjnRmsc7GGbG3y8oz3uwUGJuqr4aQmwKSso45JAx4LX8aRRELrdAr5XUuZa8kw==
X-Received: by 2002:a05:6402:1e88:b0:628:a4fb:3b1c with SMTP id 4fb4d7f45d1cf-628a4fb3dd2mr6227268a12.13.1757400354285;
        Mon, 08 Sep 2025 23:45:54 -0700 (PDT)
Received: from GLaDOS ([37.77.97.75])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfef68af8sm671681a12.19.2025.09.08.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 23:45:53 -0700 (PDT)
Date: Tue, 9 Sep 2025 08:45:51 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Judith Mendez <jm@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/3] arm64: dts: ti: Add support for Variscite
 VAR-SOM-AM62P
Message-ID: <aL_NHwomoCdJwa_1@GLaDOS>
References: <20250904132240.36819-1-stefano.radaelli21@gmail.com>
 <20250904132240.36819-3-stefano.radaelli21@gmail.com>
 <d140fb99-d830-4aad-9312-b0eaa714e30f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d140fb99-d830-4aad-9312-b0eaa714e30f@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_234556_613481_EF8907EC 
X-CRM114-Status: GOOD (  30.68  )
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

Hi Judith,

On Mon, Sep 08, 2025 at 01:06:45PM -0500, Judith Mendez wrote:
> Hi Stefano,
> 
> On 9/4/25 8:22 AM, Stefano Radaelli wrote:
> > Add device tree support for the Variscite VAR-SOM-AM62P system on module.
> > This SOM is designed to be used with various carrier boards.
> > 
> > The module includes:
> > - AM62P Sitara MPU processor
> > - Up to 8GB of DDR4-3733 memory
> > - eMMC storage memory
> > - PS6522430 chip as a Power Management Integrated circuit (PMIC)
> > - Integrated 10/100/1000 Mbps Ethernet Transceiver Analog Devices ADIN1300
> > - Resistive touch panel interface controller TI TSC2046
> > - I2C interfaces
> > 
> > Only SOM-specific peripherals are enabled by default. Carrier board
> > specific interfaces are left disabled to be enabled in the respective
> > carrier board device trees.
> > 
> > Link: https://www.variscite.it/product/system-on-module-som/cortex-a53-krait/var-som-am62p-ti-sitara-am62px/
> > 
> > Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> > ---
> > v6:
> >   - Removed unnecessary sdhci properties
> > v5:
> >   - Update to match up with coding guidelines for device tree
> > v4:
> >   - Moved every MCUs-related node into the SOM dtsi
> >   - Removed unused audio node
> > v3:
> >   - Change compatible string to match existing mainline format
> >   - Lower case hex digits
> >   - Generic node names
> > v2:
> >   - Fixed warnings and cleanup
> > 
> >   arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 385 ++++++++++++++++++
> >   1 file changed, 385 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> > new file mode 100644
> > index 000000000000..da037993574f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> > @@ -0,0 +1,385 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Common dtsi for Variscite VAR-SOM-AM62P
> > + *
> > + * Link: https://www.variscite.com/product/system-on-module-som/cortex-a53-krait/var-som-am62p-ti-sitara-am62px/
> > + *
> > + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include "k3-am62p5.dtsi"
> > +
> > +/ {
> > +	compatible = "variscite,var-som-am62p", "ti,am62p5";
> > +
> > +	wifi_pwrseq: wifi-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		post-power-on-delay-ms = <100>;
> > +		power-off-delay-us = <10000>;
> > +		reset-gpios = <&main_gpio0 54 GPIO_ACTIVE_LOW>,	/* WIFI_PWR_EN */
> > +			      <&main_gpio0 59 GPIO_ACTIVE_LOW>;	/* WIFI_EN */
> > +	};
> > +
> > +	mmc_pwrseq: mmc-pwrseq {
> > +		compatible = "mmc-pwrseq-emmc";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_mmc_pwrseq>;
> > +		reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	memory@80000000 {
> > +		/* 8G RAM */
> > +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
> > +		      <0x00000008 0x80000000 0x00000001 0x80000000>;
> > +		device_type = "memory";
> > +		bootph-pre-ram;
> > +	};
> > +
> > +	opp-table {
> > +		/* Add 1.4GHz OPP for am62p5-sk board. Requires VDD_CORE at 0v85 */
> > +		opp-1400000000 {
> > +			opp-hz = /bits/ 64 <1400000000>;
> > +			opp-supported-hw = <0x01 0x0004>;
> > +			clock-latency-ns = <6000000>;
> > +		};
> > +	};
> > +
> > +	reserved_memory: reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +
> > +		rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9b500000 0x00 0x00300000>;
> > +			no-map;
> > +		};
> > +
> > +		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9b800000 0x00 0x00100000>;
> > +			no-map;
> > +		};
> > +
> > +		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9b900000 0x00 0x00f00000>;
> > +			no-map;
> > +		};
> 
> Perhaps it will be a good idea to do the same refactoring as this:
> 
> https://lore.kernel.org/linux-arm-kernel/20250905051846.1189612-30-b-padhi@ti.com/
> 
> Meaning we drop the memory carve-outs for MCU R5SS here.
> 
> 
> > +
> > +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9c800000 0x00 0x00100000>;
> > +			no-map;
> > +		};
> > +
> > +		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x9c900000 0x00 0x01e00000>;
> > +			no-map;
> > +		};
> > +
> > +		secure_tfa_ddr: tfa@9e780000 {
> > +			reg = <0x00 0x9e780000 0x00 0x80000>;
> > +			no-map;
> > +		};
> > +
> > +		secure_ddr: optee@9e800000 {
> > +			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	reg_3v3: regulator-3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "On-module +V3.3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +
> > +	reg_1v8: regulator-1v8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "On-module +V1.8";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		vin-supply = <&reg_3v3>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +	};
> > +
> > +	reg_3v3_phy: regulator-3v3-phy {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "On-module +V3.3_PHY";
> > +		gpios = <&main_gpio0 45 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> > +};
> > +
> > +&cpsw3g {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_rgmii1>;
> > +};
> > +
> > +&cpsw3g_mdio {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_mdio1>;
> > +	status = "okay";
> > +
> > +	cpsw3g_phy0: ethernet-phy@4 {
> > +		compatible = "ethernet-phy-id0283.bc30";
> > +		reg = <4>;
> > +		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us = <10000>;
> > +		reset-deassert-us = <100000>;
> > +	};
> > +};
> > +
> > +&cpsw_port1 {
> > +	/*
> > +	 * The required RGMII TX and RX 2ns delays are implemented directly
> > +	 * in hardware via passive delay elements on the SOM PCB.
> > +	 * No delay configuration is needed in software via PHY driver.
> > +	 */
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&cpsw3g_phy0>;
> > +	status = "okay";
> > +};
> > +
> > +&main_i2c2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c2>;
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +};
> > +
> > +&main_i2c3 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c3>;
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +};
> > +
> > +&main_pmx0 {
> > +	pinctrl_mmc_pwrseq: main-emmc-pwrseq-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (AB23) VOUT0_DATA4.GPIO0_49 */
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c2: main-i2c2-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (T22) GPMC0_CSn2.I2C2_SCL */
> > +			AM62PX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (U25) GPMC0_CSn3.I2C2_SDA */
> > +		>;
> > +	};
> > +
> > +	pinctrl_i2c3: main-i2c3-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 2) /* (A23) UART0_CTSn.I2C3_SCL */
> > +			AM62PX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (C22) UART0_RTSn.I2C3_SDA */
> > +		>;
> > +	};
> > +
> > +	pinctrl_mdio1: main-mdio1-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
> > +			AM62PX_IOPAD(0x015c, PIN_INPUT, 0) /* (F16) MDIO0_MDIO */
> > +		>;
> > +	};
> > +
> > +	pinctrl_mmc2: main-mmc2-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x0120, PIN_INPUT_PULLUP, 0) /* (K24) MMC2_CMD */
> > +			AM62PX_IOPAD(0x0118, PIN_INPUT_PULLDOWN, 0) /* (K21) MMC2_CLK */
> > +			AM62PX_IOPAD(0x011c, PIN_INPUT_PULLUP, 0) /* () MMC2_CLKLB */
> > +			AM62PX_IOPAD(0x0114, PIN_INPUT_PULLUP, 0) /* (K23) MMC2_DAT0 */
> > +			AM62PX_IOPAD(0x0110, PIN_INPUT_PULLUP, 0) /* (K22) MMC2_DAT1 */
> > +			AM62PX_IOPAD(0x010c, PIN_INPUT_PULLUP, 0) /* (L20) MMC2_DAT2 */
> > +			AM62PX_IOPAD(0x0108, PIN_INPUT_PULLUP, 0) /* (L21) MMC2_DAT3 */
> > +		>;
> > +	};
> > +
> > +	pinctrl_rgmii1: main-rgmii1-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x014c, PIN_INPUT, 0) /* (B15) RGMII1_RD0 */
> > +			AM62PX_IOPAD(0x0150, PIN_INPUT, 0) /* (B16) RGMII1_RD1 */
> > +			AM62PX_IOPAD(0x0154, PIN_INPUT, 0) /* (A14) RGMII1_RD2 */
> > +			AM62PX_IOPAD(0x0158, PIN_INPUT, 0) /* (B14) RGMII1_RD3 */
> > +			AM62PX_IOPAD(0x0148, PIN_INPUT, 0) /* (A16) RGMII1_RXC */
> > +			AM62PX_IOPAD(0x0144, PIN_INPUT, 0) /* (A15) RGMII1_RX_CTL */
> > +			AM62PX_IOPAD(0x0134, PIN_INPUT, 0) /* (A18) RGMII1_TD0 */
> > +			AM62PX_IOPAD(0x0138, PIN_INPUT, 0) /* (C17) RGMII1_TD1 */
> > +			AM62PX_IOPAD(0x013c, PIN_INPUT, 0) /* (A17) RGMII1_TD2 */
> > +			AM62PX_IOPAD(0x0140, PIN_INPUT, 0) /* (C16) RGMII1_TD3 */
> > +			AM62PX_IOPAD(0x0130, PIN_INPUT, 0) /* (B17) RGMII1_TXC */
> > +			AM62PX_IOPAD(0x012c, PIN_INPUT, 0) /* (B18) RGMII1_TX_CTL */
> > +		>;
> > +		bootph-all;
> > +	};
> > +
> > +	pinctrl_spi0: main-spi0-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x01bc, PIN_OUTPUT, 0) /* (B21) SPI0_CLK */
> > +			AM62PX_IOPAD(0x01b4, PIN_OUTPUT, 0) /* (D20) SPI0_CS0 */
> > +			AM62PX_IOPAD(0x01c0, PIN_OUTPUT, 0) /* (B20) SPI0_D0 */
> > +			AM62PX_IOPAD(0x01c4, PIN_INPUT, 0) /* (C21) SPI0_D1 */
> > +		>;
> > +	};
> > +
> > +	pinctrl_uart5: main-uart5-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x00ec, PIN_INPUT, 4) /* (AC21) VOUT0_DATA13.UART5_CTSn */
> > +			AM62PX_IOPAD(0x00e8, PIN_OUTPUT, 4) /* (AD21) VOUT0_DATA12.UART5_RTSn */
> > +			AM62PX_IOPAD(0x00d0, PIN_INPUT, 4) /* (AC23) VOUT0_DATA6.UART5_RXD */
> > +			AM62PX_IOPAD(0x00d4, PIN_OUTPUT, 4) /* (AE23) VOUT0_DATA7.UART5_TXD */
> > +		>;
> > +	};
> > +
> > +	pinctrl_bt: main-btgrp-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x00f4, PIN_OUTPUT, 7) /* (Y20) VOUT0_DATA15.GPIO0_60 (BT_EN) */
> > +		>;
> > +	};
> > +
> > +	pinctrl_restouch: main-restouch-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x00c4, PIN_INPUT_PULLUP, 7) /* (Y23) VOUT0_DATA3.GPIO0_48 */
> > +		>;
> > +	};
> > +
> > +	pinctrl_wifi: main-wifi-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_IOPAD(0x00dc, PIN_OUTPUT, 7) /* (AC22) VOUT0_DATA9.GPIO0_54 - WIFI_PWR_EN - */
> > +			AM62PX_IOPAD(0x00f0, PIN_OUTPUT, 7) /* (AA20) VOUT0_DATA14.GPIO0_59 - WIFI_EN - */
> > +		>;
> > +	};
> > +};
> > +
> > +&mcu_pmx0 {
> > +	pinctrl_wkup_clkout0: wkup-clkout0-default-pins {
> > +		pinctrl-single,pins = <
> > +			AM62PX_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (F13) WKUP_CLKOUT0 */
> > +		>;
> > +	};
> > +};
> > +
> > +&main_spi0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_spi0>;
> > +	ti,pindir-d0-out-d1-in;
> > +	status = "okay";
> > +};
> > +
> > +&main_uart5 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "nxp,88w8987-bt";
> > +	};
> > +};
> > +
> > +&sdhci0 {
> > +	ti,driver-strength-ohm = <50>;
> > +	mmc-pwrseq = <&mmc_pwrseq>;
> > +	bootph-all;
> > +	status = "okay";
> > +};
> > +
> > +&sdhci2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_mmc2>, <&pinctrl_wifi>;
> > +	bus-width = <4>;
> > +	non-removable;
> > +	keep-power-in-suspend;
> > +	mmc-pwrseq = <&wifi_pwrseq>;
> > +	ti,fails-without-test-cd;
> > +	status = "okay";
> > +};
> > +
> > +&usbss0 {
> > +	ti,vbus-divider;
> > +};
> > +
> > +&usbss1 {
> > +	ti,vbus-divider;
> > +};
> > +
> > +&mailbox0_cluster0 {
> > +	status = "okay";
> > +
> > +	mbox_r5_0: mbox-r5-0 {
> > +		ti,mbox-rx = <0 0 0>;
> > +		ti,mbox-tx = <1 0 0>;
> > +	};
> > +};
> > +
> > +&mailbox0_cluster1 {
> > +	status = "okay";
> > +
> > +	mbox_mcu_r5_0: mbox-mcu-r5-0 {
> > +		ti,mbox-rx = <0 0 0>;
> > +		ti,mbox-tx = <1 0 0>;
> > +	};
> > +};
> > +
> > +&mcu_r5fss0 {
> > +	status = "okay";
> > +};
> > +
> > +&mcu_r5fss0_core0 {
> > +	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
> > +	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
> > +			<&mcu_r5fss0_core0_memory_region>;
> > +};
> > +
> > +&wkup_r5fss0 {
> > +	status = "okay";
> > +};
> > +
> > +&wkup_r5fss0_core0 {
> > +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> > +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> > +			<&wkup_r5fss0_core0_memory_region>;
> > +};
> > +
> > +/* mcu_gpio0 and mcu_gpio_intr are reserved for mcu firmware usage */
> > +&mcu_gpio0 {
> > +	status = "reserved";
> > +};
> 
> And also drop the IPC stuff above.
> 
> 
> > +
> > +&mcu_gpio_intr {
> > +	status = "reserved";
> > +};
> > +
> > +&wkup_rtc0 {
> > +	status = "disabled";
> > +};
> > +
> > +&wkup_rti0 {
> > +	/* WKUP RTI0 is used by DM firmware */
> > +	status = "reserved";
> > +};
> > +
> > +&wkup_uart0 {
> > +	/* WKUP UART0 is used by DM firmware */
> > +	status = "reserved";
> > +};
> > +
> > +&main_uart1 {
> > +	/* Main UART1 is used by TIFS firmware */
> > +	status = "reserved";
> > +};
> 
> And include:
> 
> +#include "k3-am62p-ti-ipc-firmware.dtsi"
> 
> 
> so that this SOM can be left in a refactored state like all other DT.
> Of course, this means this series would have a dependency on beleswar's
> series:
> https://lore.kernel.org/linux-arm-kernel/20250905051846.1189612-1-b-padhi@ti.com/
> 
> Just a suggestion here. (:
> 
> ~ Judith

thank you very much for the review! That does make sense, you are right.

Would you think it makes sense to leave this refactoring for a follow‑up,
so that this series can go in without depending on Beleswar’s?
That way the patch could be merged right away, and later we include:

#include "k3-am62p-ti-ipc-firmware.dtsi"

to bring the DT in line with the others.

Just checking if that sounds reasonable to you. (:

Thanks again,
Stefano

> 
> 

