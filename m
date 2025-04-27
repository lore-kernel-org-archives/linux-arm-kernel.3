Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42125C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dBcTOwhLLAnlZ3/5xvuemZ5v+zbRuhaM6dLdrtDIek=; b=nQfpr+vNy9Y6K5Yz0RbE4pGRKl
	5YI2a/DrmuIDTxqf5DSX1C3F48bE1h04nCQiKBz802xooycZr2jm/B4utUjv+nP0nPXTINGwvjieM
	Br9HzVGtoRffmnTC8yFboTX6047K+TAOBnFpPayJJ2+EwA+5S6KZHX0jQgMvrT2joJ5usRU11l1Vw
	RALh4DzYUl1MBbZvnGeS/OjILxkENd3yOQpyx0O5LJCe6cwmSGU3MsfuN5b9ok6OM+6o3UAn0zuU5
	W+kFi3H8MqLS7YJO5LxoaUWbFqxVPWAxAvNXTq+nfuBRJ3wN5Bdt+5T/P29XYvll/fluVPkldpQ6x
	3mOmiMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8yd6-00000003JFo-0Tfo;
	Sun, 27 Apr 2025 09:48:56 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8yXN-00000003Igo-2Rae;
	Sun, 27 Apr 2025 09:43:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1745746959;
	bh=3dBcTOwhLLAnlZ3/5xvuemZ5v+zbRuhaM6dLdrtDIek=;
	h=From:To:Subject:Date:Message-Id;
	b=kqs/rmpIxQfkymK10KdXVWwt6Furve0cGOMtkeXGukNm84ItUbX4Sa26I9BLi3nFS
	 wMOQCncUD1Sjx9Bddohi5cGdG8Pp3ahCu0pYFGsHZ9KMqqUVD+JkBxwoG7BFD0/gcP
	 NqqQK3pva3wp+4JXZnwsobtXd3o3/vBIibzrLVks=
X-QQ-mid: esmtpgz13t1745746953tea6e95f9
X-QQ-Originating-IP: 0CyvTdPCnkit835WDRKZUzn1no0tgQjOj1qT+l5BIpo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Apr 2025 17:42:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12905984598938793410
EX-QQ-RecipientCnt: 20
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Date: Sun, 27 Apr 2025 17:42:11 +0800
Message-Id: <20250427094211.246-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250427094211.246-1-kernel@airkyi.com>
References: <20250427094211.246-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NV9lVvsB36OpbcFDcLZiJ/gJssUNoSAUtHkkMuI+IDj4b6CShKWaKlxh
	phTa2NXkDT7JZe1YaMB+gYsSRI1moel0Gh3GLaf4+mJh/Uy0Rv4DayCCuXTi3sg49wQ3GUE
	kG15uUGcQdKygevg4tPKp7HQisfSF3mO+JKrrW8EZIEtCSrD/KaJX6DE0p7Uw/0mQl94+wH
	AiWU6zUU2E8MGpqh3utV7I8Tzxx4j6peoXL+aZls7fx4scub7xq4zAFKKXRHZLBCZGcWUpo
	KP/h+RbGMLFLNtZdZ8zQcgKXltHKJdU4d2YXFioE7aY5DxArEwzAERZmp+uJthKu1UOAzc1
	e2k2t7wxYs7SnGORvBkIMr3ncBPRkBfo7G6UfjpMIcUbfcaNA9OUh8ootlD6gQpQ0f9jkbF
	r7tEYRgBIHDmNEapDcUE2nojwBPXed3b48muAlOoT2JDABpyO4b+ZCna6gc4BychTorh4RZ
	eOiXqByIWZZl+AifO2Susv8uO1cemftT0ewLqyVH6XySilgxQ6rdKO32oSUVr2PcIpCdQ1R
	Usw+UeZb2nYNtnYRTgu9T0WugaS8J4kZmr1tHLW9B5kNoW4PjdkuTPATefVALuWAJ990tjT
	Gi5tHblCOQbLOOCJSvNzZcfyzv2updWsT2saPAjtD8nOhrzwecYnC787rAjLDYZ1lJBPHx1
	q6wRi/sItYS4SI7/1C5AdcQ6mWwgR4czIPcrY/u3ZLM8MYQ2M0wzuLDXUtk6lYYcDMiL+Jk
	dKIn5QjLUXZnnbyNF5tl4DuMnPj8KHNKSfBRA4MUeoaNzD5WE/B1wV87XiM9Qtdpjm/PcAS
	WGCpDoC6dSx4Ujo5DbHubFjV39SnNWKhmZs1GczrjTdib24CEBtJm3P2FrT1sfKhWP3zZbr
	OcvCYfhNI14lN5yRnqPK2peoMO3LL42d4izNsB6lZqTdU4uepocRniDB38vli99IppzftZZ
	DEAyw3wKj1PGUPumautnwSwSoo8tLZSsF02gmK68xVhGttRqcE7oUYd2UP17D4nOBWYA=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_024301_997301_88B2C77D 
X-CRM114-Status: GOOD (  12.47  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

General feature for rk3399 industry evaluation board:
- Rockchip RK3399
- 4GB LPDDR4
- emmc5.1
- SDIO3.0 compatible TF card
- 1x HDMI2.0a TX
- 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
- 1x type-c DisplayPort
- 3x USB3.0 Host
- 1x USB2.0 Host
- 1x Ethernet / USB3.0 to Ethernet

Tested with HDMI/GPU/USB2.0/USB3.0/Ethernet/TF card/emmc.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 222 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3e8771ef69ba..8a3adb7482ca 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-px5-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-r88.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-eaidk-610.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb-ind.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-ficus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-firefly.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-bob.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
new file mode 100644
index 000000000000..a995d4ff202d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
+ */
+
+/dts-v1/;
+#include "rk3399-base.dtsi"
+
+/ {
+	model = "Rockchip RK3399 EVB IND LPDDR4 Board";
+	compatible = "rockchip,rk3399-evb-ind", "rockchip,rk3399";
+
+	aliases {
+		ethernet0 = &gmac;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	clkin_gmac: external-gmac-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clkin_gmac";
+		#clock-cells = <0>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
+	vcc_phy: regulator-vcc-phy {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "vcc_phy";
+	};
+};
+
+&emmc_phy {
+	status = "okay";
+};
+
+&gmac {
+	assigned-clocks = <&cru SCLK_RMII_SRC>;
+	assigned-clock-parents = <&clkin_gmac>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>;
+	clock_in_out = "input";
+	phy-supply = <&vcc_phy>;
+	phy-mode = "rgmii";
+	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 150000>;
+	tx_delay = <0x22>;
+	rx_delay = <0x23>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_i2c_xfer>, <&hdmi_cec>;
+	status = "okay";
+};
+
+&hdmi_in_vopl {
+	status = "disabled";
+};
+
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	i2c-scl-falling-time-ns = <4>;
+	i2c-scl-rising-time-ns = <168>;
+	status = "okay";
+
+	vdd_gpu: tcs4526@10 {
+		compatible = "tcs,tcs4525";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel2_gpio>;
+		fcs,suspend-voltage-selector = <1>;
+		vin-supply = <&vcc5v0_sys>;
+		vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
+		regulator-compatible = "fan53555-reg";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-initial-state = <3>;
+		regulator-max-microvolt = <1500000>;
+		regulator-min-microvolt = <712500>;
+		regulator-name = "vdd_gpu";
+		regulator-ramp-delay = <1000>;
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <150000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	keep-power-in-suspend;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	no-sdio;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&tcphy0 {
+	status = "okay";
+};
+
+&tcphy1 {
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_host {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_host {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usbdrd_dwc3_0 {
+	status = "okay";
+};
+
+&usbdrd3_0 {
+	status = "okay";
+};
+
+&usbdrd3_1 {
+	status = "okay";
+};
+
+&usbdrd_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&pinctrl {
+	pmic {
+		vsel2_gpio: vsel2-gpio {
+			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&vopb {
+	status = "okay";
+};
+
+&vopb_mmu {
+	status = "okay";
+};
-- 
2.49.0


