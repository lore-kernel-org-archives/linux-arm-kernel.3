Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DDCCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XY/NICcYo4c4EqbeoVxlLf6ZpKoUb9CC4wsHsE205m8=; b=4kDtt5Lly3Sr7Zj5PdwOyKvEEH
	2G8cEWBNZHn5ylBGTQWhUnOr6do+FhwCF+3gQeGMlxiJg9vNEWpTr9aO+2gpkrlt8a0nd6QFGgczW
	lJqwu4Yu5PepTeC94mlNeJ4Af0v8CmwQu+6OQSc2VfL/g1ujqZEVQQlBR9poWckHQiQRcMEwEhvCy
	HBKJ6M3yuofGad1xT7fQ9+O8+v1y40qUQ+TTF+Y4CJdFVDrLETRbYduTTIaVKsevI60tm5eC2Yp6h
	gtM9wGj1+gM1H6CPBHt8CC8jAvlEq8EGmEVXOglKv+iBjDUAhzCjgcuz//I3CpyI/e515vYcnthYS
	n8Gzou7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4eXC-0000000CEgK-3nKd;
	Fri, 03 Oct 2025 12:05:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4eX9-0000000CEfu-2rkL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:05:13 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 593C4fLM3032131;
	Fri, 3 Oct 2025 07:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759493081;
	bh=XY/NICcYo4c4EqbeoVxlLf6ZpKoUb9CC4wsHsE205m8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B05SXjQms13cJWGFp7OSJSs4G9q6PGegh5oUltsyKP99PXVPrJ8+icJ6deUJ6iwot
	 LKpxSnOoY1Pt0RnjK41r/dEYBmb4duNbsJDblfzJSStcZBX1fN/MIMXn6i45B40C59
	 WYFwE2ouvyC+7NaCCFQ4wGm03j/rqyn3CAlxu34k=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 593C4fRY126874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Oct 2025 07:04:41 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Oct
 2025 07:04:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Oct 2025 07:04:40 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 593C4aEV3606964;
	Fri, 3 Oct 2025 07:04:37 -0500
Message-ID: <5d91923f-8929-4bce-94e7-2b96fa2062af@ti.com>
Date: Fri, 3 Oct 2025 17:34:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: am625-phyboard-lyra: Add Lincoln
 LCD185-101CT panel overlay
To: Wadim Egorov <w.egorov@phytec.de>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
        "Thakkar, Devarsh"
	<devarsht@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
References: <20250925100038.3008298-1-w.egorov@phytec.de>
 <20250925100038.3008298-3-w.egorov@phytec.de>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20250925100038.3008298-3-w.egorov@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_050511_894551_E8462613 
X-CRM114-Status: GOOD (  18.19  )
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

Hi Wadim,

On 9/25/25 15:30, Wadim Egorov wrote:
> The panel is a Lincoln Technology Solutions LCD185-101CT [0]. It is
> a dual-link LVDS panel and supports WUXGA resolution (1920x1200).
> Furthermore, it has an I2C based touch controller: Goodix-GT928.
> 
> Add an device tree overlay to support the Lincoln LCD185-101CT panel
> in combination with the phyBOARD-Lyra-AM62x.
> 
> [0] https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
NACK. PATCH 1/3 and 2/3 are posted and reviewed already, please add link 
to your PATCH and mention to apply it on top of the series[1].

[1]: https://lore.kernel.org/all/20250913064205.4152249-1-s-jain1@ti.com/

Regards,
Swamil
> v1: https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/1065767.html
> v2: Use port dummies defined in previous patch
> ---
>   arch/arm64/boot/dts/ti/Makefile               |   3 +
>   .../k3-am625-phyboard-lyra-oldi-lcd185.dtso   | 188 ++++++++++++++++++
>   2 files changed, 191 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-oldi-lcd185.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index aad9177930e6..aa34a0d77615 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am652-phyboard-lyra-oldi-lcd185.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev.dtb
> @@ -165,6 +166,8 @@ k3-am625-phyboard-lyra-gpio-fan-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
>   	k3-am62x-phyboard-lyra-gpio-fan.dtbo
>   k3-am625-phyboard-lyra-qspi-nor-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
>   	k3-am6xx-phycore-qspi-nor.dtbo
> +k3-am625-phyboard-lyra-oldi-lcd185-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
> +	k3-am625-phyboard-lyra-oldi-lcd185.dtbo
>   k3-am625-sk-csi2-imx219-dtbs := k3-am625-sk.dtb \
>   	k3-am62x-sk-csi2-imx219.dtbo
>   k3-am625-sk-csi2-ov5640-dtbs := k3-am625-sk.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-oldi-lcd185.dtso b/arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-oldi-lcd185.dtso
> new file mode 100644
> index 000000000000..b1feb665248b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-oldi-lcd185.dtso
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Author: Wadim Egorov <w.egorov@phytec.de>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	display {
> +		compatible = "lincolntech,lcd185-101ct";
> +		backlight = <&backlight>;
> +		power-supply = <&vdd_usb_5v0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +				lcd_in0: endpoint {
> +					remote-endpoint = <&oldi_0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				dual-lvds-even-pixels;
> +				lcd_in1: endpoint {
> +					remote-endpoint = <&oldi_1_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	backlight: backlight {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bl_pwm_pins_default>;
> +
> +		compatible = "pwm-backlight";
> +
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +
> +		enable-gpios = <&gpio_exp 5 GPIO_ACTIVE_HIGH>;
> +		pwms = <&epwm0 1 50000 0>;
> +	};
> +
> +        vdd_usb_5v0: regulator-vdd-usb5v0 {
> +                compatible = "regulator-fixed";
> +                regulator-name = "vdd-usb5v0";
> +                regulator-min-microvolt = <5000000>;
> +                regulator-max-microvolt = <5000000>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +        };
> +};
> +
> +&dss {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_oldi0_pins_default &main_dss0_pins_default>;
> +};
> +
> +&dss_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* VP1: Output to OLDI */
> +	port@0 {
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dpi0_out0: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&oldi_0_in>;
> +		};
> +
> +		dpi0_out1: endpoint@1 {
> +			reg = <1>;
> +			remote-endpoint = <&oldi_1_in>;
> +		};
> +	};
> +};
> +
> +&epwm0 {
> +	status = "okay";
> +};
> +
> +&main_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt928";
> +		reg = <0x5d>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touch_screen_pins_default>;
> +
> +		interrupt-parent = <&main_gpio0>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios = <&main_gpio0 18 GPIO_ACTIVE_HIGH>;
> +		irq-gpios = <&main_gpio0 19 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&main_pmx0 {
> +	bl_pwm_pins_default: bl-pwm-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x01b8, PIN_INPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
> +		>;
> +	};
> +
> +	touch_screen_pins_default: touch-screen-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x048, PIN_OUTPUT, 7) /* (N25) GPMC0_AD3.GPIO0_18 - RST */
> +			AM62X_IOPAD(0x04c, PIN_INPUT, 7) /* (P24) GPMC0_AD4.GPIO0_19 - INT */
> +		>;
> +	};
> +
> +	main_oldi0_pins_default: main-oldi0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x0260, PIN_OUTPUT, 0) /* (AA5) OLDI0_A0N */
> +			AM62X_IOPAD(0x025c, PIN_OUTPUT, 0) /* (Y6) OLDI0_A0P */
> +			AM62X_IOPAD(0x0268, PIN_OUTPUT, 0) /* (AD3) OLDI0_A1N */
> +			AM62X_IOPAD(0x0264, PIN_OUTPUT, 0) /* (AB4) OLDI0_A1P */
> +			AM62X_IOPAD(0x0270, PIN_OUTPUT, 0) /* (Y8) OLDI0_A2N */
> +			AM62X_IOPAD(0x026c, PIN_OUTPUT, 0) /* (AA8) OLDI0_A2P */
> +			AM62X_IOPAD(0x0278, PIN_OUTPUT, 0) /* (AB6) OLDI0_A3N */
> +			AM62X_IOPAD(0x0274, PIN_OUTPUT, 0) /* (AA7) OLDI0_A3P */
> +			AM62X_IOPAD(0x0280, PIN_OUTPUT, 0) /* (AC6) OLDI0_A4N */
> +			AM62X_IOPAD(0x027c, PIN_OUTPUT, 0) /* (AC5) OLDI0_A4P */
> +			AM62X_IOPAD(0x0288, PIN_OUTPUT, 0) /* (AE5) OLDI0_A5N */
> +			AM62X_IOPAD(0x0284, PIN_OUTPUT, 0) /* (AD6) OLDI0_A5P */
> +			AM62X_IOPAD(0x0290, PIN_OUTPUT, 0) /* (AE6) OLDI0_A6N */
> +			AM62X_IOPAD(0x028c, PIN_OUTPUT, 0) /* (AD7) OLDI0_A6P */
> +			AM62X_IOPAD(0x0298, PIN_OUTPUT, 0) /* (AD8) OLDI0_A7N */
> +			AM62X_IOPAD(0x0294, PIN_OUTPUT, 0) /* (AE7) OLDI0_A7P */
> +			AM62X_IOPAD(0x02a0, PIN_OUTPUT, 0) /* (AD4) OLDI0_CLK0N */
> +			AM62X_IOPAD(0x029c, PIN_OUTPUT, 0) /* (AE3) OLDI0_CLK0P */
> +			AM62X_IOPAD(0x02a8, PIN_OUTPUT, 0) /* (AE4) OLDI0_CLK1N */
> +			AM62X_IOPAD(0x02a4, PIN_OUTPUT, 0) /* (AD5) OLDI0_CLK1P */
> +		>;
> +	};
> +};
> +
> +&oldi0 {
> +	ti,companion-oldi = <&oldi1>;
> +	status = "okay";
> +};
> +
> +&oldi0_port0 {
> +	oldi_0_in: endpoint {
> +		remote-endpoint = <&dpi0_out0>;
> +	};
> +};
> +
> +&oldi0_port1 {
> +	oldi_0_out: endpoint {
> +		remote-endpoint = <&lcd_in0>;
> +	};
> +};
> +
> +&oldi1 {
> +	ti,secondary-oldi;
> +	status = "okay";
> +};
> +
> +&oldi1_port0 {
> +	oldi_1_in: endpoint {
> +		remote-endpoint = <&dpi0_out1>;
> +	};
> +};
> +
> +&oldi1_port1 {
> +	oldi_1_out: endpoint {
> +		remote-endpoint = <&lcd_in1>;
> +	};
> +};


