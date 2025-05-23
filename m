Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51842C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8I4vV3ksnw7sF4t+5fPxJgyZtoVDygq05xqWreAD28s=; b=KoITe+maNYNU8fIEdR3ii/HDKA
	stnDVwt5Jbt9ygId31FYXJR++zacq7hQJIGfEf0QETWY71T32AZzoyETiPa1wIyXEbRzjGV/443Du
	JPxCBOBafFnIYOk+GBhZVh+Kvjp//QsORAZCGmEAzL4J/STHMiTYOm1cm7igCgKcioGXqIAX7STPr
	w0cwVJa8aw6hl4WaTUayRkUDruKbPt9Igfu7pNxfqQzjJsgpXa2vOaUZiBU0ifEAm2kWMOiFnYbhp
	ZjwnhaaKG1PJIpUA9XymYoGvUdtzs79zgIBsU5Ud2UClEbkBHYDB/QUAMXvi0mVI2xzG0OKXFMPCy
	vBKR4lag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINS3-00000003GTU-0A4x;
	Fri, 23 May 2025 08:08:23 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMOZ-00000003ARv-2KIQ;
	Fri, 23 May 2025 07:00:45 +0000
Received: from localhost.localdomain (unknown [119.122.214.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1625f069b;
	Fri, 23 May 2025 15:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: i@chainsx.cn
Cc: devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
Date: Fri, 23 May 2025 15:00:26 +0800
Message-Id: <20250523070026.50263-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519075432.2239713-3-i@chainsx.cn>
References: <20250519075432.2239713-3-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkpOVkMdSkxMTE9KHU1MQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VCQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a96fbf181af03a2kunmfbc2900462617
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46Hjo5LzE1CBYCTgI3Vh9N
	UR4aFA1VSlVKTE9MQkNITUhKTE1OVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUJCWVdZCAFZQU9ITkM3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_000043_788953_83703EAE 
X-CRM114-Status: GOOD (  11.33  )
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

Hi,

> <snip>
> +		led-0 {
> +			default-state = "on";
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};

From PATCH v1, led-1 is a user-led, so it would be better
to make it off by default.

Please also add `color = xxx` to these leds.

> +	vcc5v0_usbdcin: regulator-vcc5v0-usbdcin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usbdcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};

The DC of this board is 12V, why is there 5V?

> <snip>
> +	vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie20";
> +		enable-active-high;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <5000>;
> +		gpio = <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;

Please put enable/gpio before regulator.

> <snip>
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc5v0_host_en>;
> +		regulator-name = "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?
It will be enabled through the corresponding phy-supply.

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> +	vbus5v0_typec_pwr_en: vbus5v0-typec-pwr-en-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&typec5v_pwren>;
> +		regulator-name = "vbus5v0_typec_pwr_en";

Please use the regulator name from schematics.
xxx_pwr_en is usually the name of the pinctrl.

> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?
It will be enabled through the corresponding phy-supply.

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = ...
> +	pinctrl-names = "default";

pinctrl-names should be placed before pinctrl-0

> <snip>
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +			op-sink-microwatt = <1000000>;
> +			power-role = "dual";
> +			sink-pdos =
> +				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
> +			source-pdos =
> +				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			try-power-role = "sink";

The TYPE-C of this board does not seem to support pd power supply?

> <snip>
> +	};
> +};
> +

Extra blank lines.

> +
> +&i2c3 {
> +	status = "okay";

> <snip>
> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +				<&rk806_dvs2_null>, <&rk806_dvs3_null>;

Align Indent.

> <snip>
> +	};
> +};
> +

Extra blank lines.

> +
> +&tsadc {
> +	status = "okay";
> +};

> <snip>
> +&u2phy0_otg {
> +	status = "okay";
> +};

> +&u2phy3_host {
> +	status = "okay";
> +};

Missing phy-supply?

--
2.25.1


