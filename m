Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4491EC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjuA7rmWgAGZCSV96vRmSS0VcsR/4uag37CYLdTx0nI=; b=nmMZ6c2fUmmUEb1jNfi6vEU7U+
	4sOZ5asoy8JMhNOqtzHatyyoStOG9dy0ToHC2cO1cQMtZRQVvBg5csjoHCJYO3lU044f6qnmkNfHK
	J7cgtaAm7ZVwSsqjz61TJiLPiEdcFbnX99C2FpCX2HD9pkv/wo67j7IIRnXqi1TFFuO+Db3QuUfnZ
	J7IrK5Tf6wfb7vMd8edAbfCgbjMYd8ZImnwITHqLkqzs9HBEeABQ6p95OA/hc/x64bfuX1zX7p0Kg
	T9r+lP+YF+yI0AbEFL5k6VmBl6/Fg7/czQhtXIV5g/iuJXXZ3Bdi5szT1tJclxJiurOHu//uGNEos
	+OkCZCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCiW-0000000FMIA-1wqv;
	Wed, 14 May 2025 14:04:16 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFAnd-0000000Exyz-3DjT;
	Wed, 14 May 2025 12:01:27 +0000
Received: from localhost.localdomain (unknown [119.122.215.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15068bee2;
	Wed, 14 May 2025 20:01:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: chainsx@foxmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
Date: Wed, 14 May 2025 20:00:24 +0800
Message-Id: <20250514120024.609948-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>
References: <tencent_9922367945B45D45C938B0B947EEFFCE1808@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQksZVk5LGR9ITR1OQktDTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJT09ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a96ceaba7c903a2kunm15068bee2
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6Ajo5LzE3ED44CE4WFTQu
	FClPFD5VSlVKTE9MSUlPS0xCSktIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUlPT1lXWQgBWUFPSU5JNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_050126_013281_055995E6 
X-CRM114-Status: GOOD (  11.29  )
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
> +	leds: leds {

No aliases needed.

> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_gpio>;
> +
> +		power_led: power {
> +			label = ":power";

Please use standard LED binding.
e.g.
```
color = <LED_COLOR_ID_BLUE>;
function = LED_FUNCTION_POWER;
```

> +			linux,default-trigger = "heartbeat";
> +			default-state = "on";

default-state is not needed.

> +			gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		user_led: user {
> +			label = ":user";
> +			linux,default-trigger = "ir-user-click";

This LED should be user-defined?

> +			default-state = "off";
> +			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		user1_led: user1 {
> +			label = ":user1";
> +			default-state = "off";
> +			gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
> +		};
> +	};

> <snip>
> +	vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie20";
> +		regulator-always-on;

Why does this regulator require always-on?

> <snip>
> +	vcc5v0_host: regulator-vcc5v0-host {
> +		regulator-name = "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?

> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> +	vbus5v0_typec_pwr_en: vbus5v0-typec-pwr-en-regulator {
> +		regulator-name = "vbus5v0_typec_pwr_en";

Please use the name from schematics.

> +		regulator-boot-on;
> +		regulator-always-on;

Why does this regulator require always-on and boot-on?

> +		vin-supply = <&vcc5v0_sys>;

The vendor dts says it's from vcc5v0_usb?

> <snip>
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big1_s0>;
> +};

Please add other cpu nodes: cpu_l1-l3, cpu_b1-b3

+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-rxid";
+	tx_delay = <0x43>;

Please try using rgmii-id and remove the delay.

> <snip>
> +&i2c2 {
> +	status = "okay";
> +	pinctrl-0 = <&i2c2m0_xfer>;

status should be placed behind.

> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +		#clock-cells = <0>;
> +		clock-output-names = "hym8563";

clock should be placed before interrupt.

> +	usbc0: usb-typec@22 {

This node should be placed before vdd_npu_s0.

> <snip>
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id001c.c916";

The phy used in this board is RTL8211FVD, not RTL8211F.
Please use "ethernet-phy-ieee802.3-c22" instead of hardcoding.

> <snip>
> +&sdhci {
> +	bus-width = <8>;
> +	max-frequency = <200000000>;

max-frequency is already defined in rk3588-base.dtsi

> <snip>
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	no-sdio;
> +	no-mmc;

The sdmmc controller supports sdio devices.
If no-mmc is defined, cap-mmc-highspeed is useless.

> <snip>
> +&spi2 {
> +	status = "okay";

status should be placed behind.

> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +				<&rk806_dvs2_null>, <&rk806_dvs3_null>;

Align Indent.

> <snip>
> +&uart7 {
> +	pinctrl-0 = <&uart7m2_xfer>;
> +	status = "okay";
> +};

It seems that uart2 (default serial port) is missing?

--
2.25.1


