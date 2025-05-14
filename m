Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C4FC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGFUxWoYIYHKg7u2iK0ZpnnF7olnHXOFMmR31CEt14o=; b=DFP/KK0tnZrnkg7Pr1tKm4fsGA
	IrgITvqcTwMNxYSd4lGnQiFM5tNwZ2R8oMDBNdKP7iCfqOWjS9lk3svrf1aPzNG8atXribvHkMsag
	b92zZ2RVNjq+eF6N99fmdp3GBXpHFXbTMAk/Wm0iwJwWJzQvoq62m/g37npwKHdDzUHedFUlOLE6g
	WvFEaxh3zIWjR1FZciUmwUhYNpB5nrfgoDPOGFvN0US/HpjbhVGrE4rDqhJNW4sf0hUscQCDoJcVS
	xVyFUieZ9yu1raqr0gj0O6QR5DaWB4csRLOWZj6irdZ/xop05p8u87tqtgvEDUwAUjLkiFMtCo7n9
	wJ9G91gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Ct-0000000ERsO-1UDT;
	Wed, 14 May 2025 08:11:15 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF72K-0000000EPre-1f1h;
	Wed, 14 May 2025 08:00:21 +0000
X-QQ-mid: esmtpgz12t1747209569t5d572571
X-QQ-Originating-IP: VpLWjnwyPWgh81/0vj3hwBo3kvAInt1kmoE1Ua2iaNw=
Received: from chainsx-ubuntu-server.lan ( [182.242.225.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 May 2025 15:59:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3638814323767141484
EX-QQ-RecipientCnt: 10
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org
Cc: i@chainsx.cn,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/3] arm64: dts: rockchip: add DTs for Sakura Pi RK3308B
Date: Wed, 14 May 2025 15:59:14 +0800
Message-Id: <20250514075914.194651-4-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514075914.194651-1-i@chainsx.cn>
References: <20250514075914.194651-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OKKHiI6c9SH3WIpAmk548qKD7W0AZrxUELTzBSAiPMRvWMw7xmFh39B3
	rL1GwGKZnZpYN16i0MOlHEhO1VTfzGMBE3SQzjbHSRZx9XkvyCQi1X/LoTKIW/NVivpstBV
	2GIeEMnKLgUykLoNrNpQdeD43Uv6tbsNGyFNVF7dQYakiwotxIqTZCosiBe10Tnjo8tOC1l
	h6Ywsx8R8JDqMUTSDLR4lINwLDSwPmMrGb2UjD6uUWXyCpgOC4BNVQC/ZJem2/5n1cWbKJz
	BQhTSRHACWGBI6jBoMxwBWX51v2J/4USINoN1Ww8RVhLkWgG51HUWKxszZPjZTHLJ2Z1YOG
	R8gKlyQI03EATIsk3qx95FuXAjAGOe6xdJQ2h/sRjSaIEvLa6GzqgJBXSbtR8q+7XhQaRWv
	AwOLsDteKUUtlfMfqD72n8kIQwS0pxyi8VB1IyQFjzPx38JUnAWwSIIbWN9XkyFt+ADZBIS
	UnkzZb4DmVZ6fCVc+2lMHDcC0qYKyxkLWdNKYLO8s8P5SpKUML+3KIfks/iL/gb7GmBEfJn
	pQgIGwekubdDzIahCJb0yJVmQI6drsFG0ZGY7FP9yY75AvsgFeyMd05yTJC/DadvzeGqOMo
	+HeCqjb46E2HR7Th3uqogTBmSjqZj7OmQmvzucXZaayDPrZufWHiwt7yU/80Ff3bUgIkzNy
	xoatoB1NzmJzRN6G1AD973Hd7586ukGNrHu+c9h57Raw0hzfSlySAtlMWouCDh0nhfoRqgh
	OnPlzAsPTLw8RE8qRojhr6J0w1CP5IJtiaXb31UfKzyanKlAzdz/4psYchOWDpOwhl8Sphn
	eGT6Ci6F4nhuy1JqdiRIwIuqiNEUHEcTbY3fH7YqhS7La6BvinG/bzbsyVa6NO6vYFQszJy
	M1itwNVlZQFQEvOEXyuYBh0CucGpkcD4iN/+0tbfDDFBwDd0DpIliRITpc26CfaYqzhdFp9
	5PDNFnMpLApJo2Dh4pvDS7xZb/bnKJKcM8+Z+DVNbrKKFhrOeK9i4xaxWsJxjzFFs7chNBE
	0UqUOdnQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_010020_667022_77D26430 
X-CRM114-Status: GOOD (  15.34  )
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

The Sakura Pi RK3308B is a SBC based on the Rockchip RK3308 SoC.

Link: https://github.com/Sakura-Pi
Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

The device contains the following hardware that is tested/working:
 - 4 or 8GB eMMC
 - SDMMC card slot
 - Realtek SDIO WiFi 5/BT
 - 256 or 512MB of RAM
 - USB 2.0 port
 - OTG port

Signed-off-by: Hsun Lai <i@chainsx.cn>

---

Changes in v2:
- Update regulator names

Changes in v1:
- Add support for Sakura Pi RK3308B

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 274 ++++++++++++++++++
 2 files changed, 275 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e63c3f5eb..c9017bdc3 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-roc-cc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-rock-pi-s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-rock-s0.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-sakurapi-rk3308b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3318-a95x-z2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-anbernic-rg351m.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-anbernic-rg351v.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
new file mode 100644
index 000000000..b9032d4e7
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Akash Gajjar <akash@openedev.com>
+ * Copyright (c) 2019 Jagan Teki <jagan@openedev.com>
+ * Copyright (C) 2024 TheSnowfield <thesnowfield@sakurapi.org>
+ * Copyright (C) 2025 Hsun Lai <i@chainsx.cn>
+ */
+
+/dts-v1/;
+#include "rk3308.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Sakura Pi RK3308B";
+	compatible = "sakurapi,rk3308-sakurapi-rk3308b", "rockchip,rk3308";
+
+	aliases {
+		mmc0 = &emmc;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-0 = <&wifi_enable_h>;
+		pinctrl-names = "default";
+		/*
+		 * On the module itself this is one of these (depending
+		 * on the actual card populated):
+		 * - SDIO_RESET_L_WL_REG_ON
+		 * - PDN (power down when low)
+		 */
+		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vdd_core: regulator-vdd-core {
+		compatible = "pwm-regulator";
+		pwms = <&pwm0 0 5000 1>;
+		regulator-name = "vdd_core";
+		regulator-min-microvolt = <827000>;
+		regulator-max-microvolt = <1340000>;
+		regulator-settling-time-up-us = <250>;
+		regulator-always-on;
+		regulator-boot-on;
+		pwm-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_log: regulator-vdd-log {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_log";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1050000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_ddr: regulator-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_io>;
+	};
+
+	vcc_io: regulator-vcc-io {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_io";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_phy: regulator-vcc-phy-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_phy";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vcc5v0_otg: regulator-vcc5v0-otg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_otg";
+		regulator-always-on;
+		gpio = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&otg_vbus_drv>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_core>;
+};
+
+&emmc {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	non-removable;
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&sdmmc {
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_det &sdmmc_bus4>;
+	card-detect-delay = <800>;
+	status = "okay";
+};
+
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	no-mmc;
+	no-sd;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm43455-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake>;
+	};
+};
+
+&dmac0 {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rtc_32k>;
+
+	usb {
+		otg_vbus_drv: otg-vbus-drv {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		wifi_host_wake: wifi-host-wake {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm0 {
+	status = "okay";
+	pinctrl-0 = <&pwm0_pin_pull_down>;
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&pwm3 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m0_xfer>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&cru SCLK_RTC32K>;
+		clock-names = "lpo";
+		pinctrl-names = "default";
+		pinctrl-0 = <&host_wake_bt &bt_wake_host &bt_reg_on>;
+		device-wakeup-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+		max-speed = <1500000>;
+	};
+};
+
+&usb20_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&u2phy {
+	status = "okay";
+};
+
+&u2phy_otg {
+	status = "okay";
+};
+
+&u2phy_host {
+	status = "okay";
+};
+
+&usb_host_ehci {
+	status = "okay";
+};
+
+&usb_host_ohci{
+	status = "okay";
+};
-- 
2.34.1


