Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA5FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+Is4l+QhZfpXEpYBJcEPsotkirV+fH0qWqP949FELk=; b=b1ye2EYy7SwFrJWRIBcR4LgJ+J
	owhhVv9jwE0qW6EElmJZ3LWn4HElnO5TYilpeLlnBfGH75FMWfr1Fz6gEKNsiF8q2B4RL888LT13K
	5CrOBdMxaYAZImQZWBH1NoztyN8vqyXJJ/vrQtWGK0wOIi1iDjdKwXGynOHykJxznX5GpcfvTXktl
	nssqmMGnfI80SwmpPl4/dgOERAuA06xCqhFLiMv2lYDBHHxEIsT8L6s0sb7SnQVFa5iTp9PD1qt34
	Mw8wQblhipjYz2F1Uak43rcZ1iF2UHvSX7tHlhxS4C3BHb928AhFfOZbUhNuuELEJWYTlCf6AzK9h
	vg1s2P4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAWq-00000004hP4-3poY;
	Fri, 13 Dec 2024 18:36:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAUo-00000004h6I-2rOD;
	Fri, 13 Dec 2024 18:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y+Is4l+QhZfpXEpYBJcEPsotkirV+fH0qWqP949FELk=; b=oQHOQHlloBXL+dlEq+hZEiVJ50
	UXXJNGX2JQhxnxcyzop7cmApYLu1OFsTtqN35CnwDZZHJjP4EEjh9KQzOnEvaCtYm2TP4fenBRO+y
	OP/5iqCb99S3sq+2CLXabTBYMbbJiZaANfopWRDhd6MAdC2DgUdT4NTHn+FqjkG+LV+WqZjl8Zohl
	wMVBH00VDJ8L2dRfEPvSQGpgANNAnloFfoDbWql3tsxWgmQ58g8lnEwrqf2p8I17/11kTuTuooEAu
	XmGTRpMilR0cMYofbshrWyEWebtSZd9d9qrgbi1ce3v9hhMIsTxOwKfl6B3WlEb25LBtwgpZDN8oq
	5M5NLtRg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tMAUn-0008GP-8k; Fri, 13 Dec 2024 19:34:37 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Shimrra Shai <shimrrashai@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org,
 Shimrra Shai <shimrrashai@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: add DTs for Firefly ITX-3588J
Date: Fri, 13 Dec 2024 19:34:36 +0100
Message-ID: <10578885.nUPlyArG6x@diego>
In-Reply-To: <20241213180855.16472-2-shimrrashai@gmail.com>
References: <20241213180855.16472-1-shimrrashai@gmail.com>
 <20241213180855.16472-2-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_103438_866934_4ADA4D6F 
X-CRM114-Status: GOOD (  28.11  )
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

Am Freitag, 13. Dezember 2024, 19:08:54 CET schrieb Shimrra Shai:
> Main DTS for the board and Makefile addition.
> 
> Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
> new file mode 100644
> index 000000000..a99c007c7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
> @@ -0,0 +1,1133 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "dt-bindings/usb/pd.h"
> +#include "rockchip-pca9555.h"
> +#include "rk3588.dtsi"

in line with my comment in the binding, please split the system-on-module
parts into a rk3588-firefly-core-3588j.dtsi and then include that file here.


> +
> +/ {
> +	model = "Firefly ITX-3588J";
> +	compatible = "firefly,itx-3588j", "rockchip,rk3588";
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		mmc0 = &sdhci;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	/* NB: There are also a "Reset" and "Mask ROM" button but I don't
> +	 * know the right settings for these. - Shimrra Shai
> +	 */

same comment-style as below, plus

/*
 * There are additional Reset and Maskrom keys connected, but their
 * settings are still unknown right now.
 */

> +	adc-keys-1 {

why is it adc-keys-1 ? (where is -0 ?)

> +		compatible = "adc-keys";
> +		io-channels = <&saradc 1>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1800000>;
> +		poll-interval = <100>;
> +
> +		button-recovery {
> +			label = "Recovery";
> +			linux,code = <KEY_VENDOR>;
> +			press-threshold-microvolt = <2000>;
> +		};
> +	};
> +
> +	analog-sound {
> +		compatible = "simple-audio-card";
> +		pinctrl-0 = <&hp_detect>;
> +		pinctrl-names = "default";
> +		simple-audio-card,aux-devs = <&amp_headphones>, <&amp_speaker>;
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
> +		simple-audio-card,mclk-fs = <384>;
> +		simple-audio-card,name = "rockchip_es8323";
> +		simple-audio-card,pin-switches = "Headphones", "Speaker";
> +		simple-audio-card,routing =
> +			"Speaker Amplifier INL", "LOUT2",
> +			"Speaker Amplifier INR", "ROUT2",
> +			"Speaker", "Speaker Amplifier OUTL",
> +			"Speaker", "Speaker Amplifier OUTR",
> +			"Headphones Amplifier INL", "LOUT1",
> +			"Headphones Amplifier INR", "ROUT1",
> +			"Headphones", "Headphones Amplifier OUTL",
> +			"Headphones", "Headphones Amplifier OUTR",
> +			"LINPUT1", "Microphone Jack",
> +			"RINPUT1", "Microphone Jack",
> +			"LINPUT2", "Onboard Microphone",
> +			"RINPUT2", "Onboard Microphone";
> +		simple-audio-card,widgets =
> +			"Microphone", "Microphone Jack",
> +			"Microphone", "Onboard Microphone",
> +			"Headphone", "Headphones",
> +			"Speaker", "Speaker";
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&i2s0_8ch>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&es8323>;
> +			system-clock-frequency = <12288000>;
> +		};
> +	};
> +
> +	/* note: this does not seem to be a proper "amplifier" but is just

	/*
	 * note: this does not seem to be a proper "amplifier" but is just

comment formatting please

> +	 * a way to control the GPIO pins to switch on or off the given
> +	 * sound output device
> +	 */
> +	amp_headphones: headphones-audio-amplifier {
> +		compatible = "simple-audio-amplifier";
> +		enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&headphone_amplifier_en>;
> +		sound-name-prefix = "Headphones Amplifier";
> +	};

> +	leds {
> +		compatible = "gpio-leds";
> +
> +		/* NB: This Power LED control does not seem to work for
> +		 * some reason. - Shimrra Shai
> +		 */
> +#if 0
> +		power_led: led-0 {
> +			gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "default-on";
> +		};
> +#endif

please don't add dead code

> +
> +		user_led: led-1 {
> +			gpios = <&pca9555 PCA_IO0_3 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "disk-activity";
> +		};
> +	};
> +
> +	vcc_sata_pwr_en: vcc-sata-pwr-en-regulator {

vcc_sata_pwr_en: regulator-vcc-sata-pwr-en

Applied to all regulator nodes

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_sata_pwr_en";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		enable-active-high;
> +		gpio = <&pca9555 PCA_IO1_2 GPIO_ACTIVE_HIGH>;  //PCA_IO 12

please sort properties (compatible, regs, [alphabetically], status) and please
drop those comments at the end.

Applied to all regulator nodes

> +	};

[...]

> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +	mem-supply = <&vdd_cpu_lit_mem_s0>;

that mem-supply property is not specified and also is not necessary here.
Same for the other cases above.

> +};

[...]

> +	usbc0: usb-typec@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
> +		vbus-supply = <&vbus5v0_typec_pwr_en>;
> +		status = "okay";

default status is always "okay", so no need to add it for new nodes.
Same for possible other places in this file.


> diff --git a/arch/arm64/boot/dts/rockchip/rockchip-pca9555.h b/arch/arm64/boot/dts/rockchip/rockchip-pca9555.h
> new file mode 100644
> index 000000000..c4c9a2471
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rockchip-pca9555.h

if anything, that include needs to live in include/dt-bindings/something
and needs to be a separate patch, if you really need that

> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Bindings for the PCA9555 GPIO extender used on some Rockchip devices, e.g.
> + * Firefly.
> + *
> + * Copyright (c) 2013 MundoReader S.L.
> + * Authors: Heiko Stuebner <heiko@sntech.de>

where does this copyright come from? I don't remember being involved
in a binding header for that expander?


> + *          Shimrra Shai <shimrrashai@gmail.com>
> + */
> +
> +#ifndef __RK_PCA9555_H__
> +#define __RK_PCA9555_H__
> +
> +#define PCA_IO0_0          0
> +#define PCA_IO0_1          1
> +#define PCA_IO0_2          2
> +#define PCA_IO0_3          3
> +#define PCA_IO0_4          4
> +#define PCA_IO0_5          5
> +#define PCA_IO0_6          6
> +#define PCA_IO0_7          7
> +#define PCA_IO1_0          8
> +#define PCA_IO1_1          9
> +#define PCA_IO1_2          10
> +#define PCA_IO1_3          11
> +#define PCA_IO1_4          12
> +#define PCA_IO1_5          13
> +#define PCA_IO1_6          14
> +#define PCA_IO1_7          15
> +
> +#endif
> 

Heiko



