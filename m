Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852BFD172A9
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 19:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcDBvht1tN7pQSi0T0aBge/reb5eHegqZJLItDNrtYc=; b=OFW9BIkAk1Qlc3M0J8Ukb7wyv4
	0fB4j107T8xfxngyJ6V2RdKdXqxTKDh7NGNQJt52SI+l2tTKSMAXskd4wlXiNfyj/ZyYqaqO87gg/
	orSWc0v8NBOUYigmTo74gD0E3l2f9zbvn0zgyye8uKJdrFGRaSRaL9KLpHzwUOjRSeS1cNpFCKKN6
	P9zk7u9HXdOuL+ulW+TL7w1eyCEoR0NWZ603zUbSZT7DkEBOHih2n2Ky6hzabO1aDblN6TPifE9nI
	QFYRsVhT9X+qhn02hRIurptGdxeONe+qgEyDZtTEg+vpQQyIV4uviLM4Qyx6hQIeA6YrKZ3nbuQJF
	etfvPqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcxa-000000046f1-1aDL;
	Sun, 01 Feb 2026 19:18:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcxY-000000046dM-0XG3;
	Sun, 01 Feb 2026 19:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=zcDBvht1tN7pQSi0T0aBge/reb5eHegqZJLItDNrtYc=; b=WMeS+fpL0Uel8Z4zAfqaUoRggc
	2N/TjQ554k0NgIQUhtBzcBt2mYbrS6uQPfJLnkHDq4LlffQk9H6tL89mf0Wwd4wCGQOHYTLp792La
	AY4sNdeIt51iEkl4t4ek4HgecZmKV+OrCZdgVwlGf3dOARwbOlfVRoVB+HMlvFif9QwaD+NmBaz+y
	VzMOcsv5HJUQnrvkkoLcj1zqEhWfllBo6QI7e9GxO246SJBnC+V7VnWaqjw3wwzvu5Fks2OSwqL01
	MyHPqYxzzDvUaM8vENCt/sN9OnsfgvmHPPBNe0JODISrpPFSG3jOiv/+/fXdNe8b7DnclUkYH1uOr
	zpIRTm0g==;
Received: from [88.128.88.21] (helo=phil.t-mobile.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vmcxT-005wWz-AR; Sun, 01 Feb 2026 20:18:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: rockchip: add overlay for qnap-ts433 device revision
Date: Sun,  1 Feb 2026 20:18:02 +0100
Message-ID: <20260201191804.41421-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260201191804.41421-1-heiko@sntech.de>
References: <20260201191804.41421-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_111812_218294_2B570E08 
X-CRM114-Status: GOOD (  19.43  )
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

TS433 devices received a board revision adding gpios for per hard-disk
presence-detection and power-control. These board have a PCB-id of at
least 12 (mainboard) and 10 (backplane), which can be read from an EEPROM.

The presence detection is not really necessary and there are also no
existing bindings for doing something with it. So add them as gpio hogs
to at least document them and allow their state to be read from debugfs.

The power-control is modelled as regulators, with the hdd1+hdd2 variants
connected to the RK3568's SATA controllers as target-supplies. The
JMicron AHCI controller on PCIe didn't have bindings for that, I could
find, so they get an always-on state for now.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   5 +
 .../rockchip/rk3568-qnap-ts433-pcb-12-10.dtso | 151 ++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index d0f22d3a3bb4..aafffecfb2ef 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -145,6 +145,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433-pcb-12-10.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-radxa-e25.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
@@ -245,6 +246,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-v2-screen.dtb
 rk3399-rockpro64-v2-screen-dtbs := rk3399-rockpro64-v2.dtb \
 	rk3399-rockpro64-screen.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433-pcb-12-10.dtb
+rk3568-qnap-ts433-pcb-12-10-dtbs := rk3568-qnap-ts433.dtb \
+	rk3568-qnap-ts433-pcb-12-10.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtso b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtso
new file mode 100644
index 000000000000..ce0fdc9f2989
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtso
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Device tree overlay for TS433 board PCBs-12-10 revision.
+ *
+ * Copyright (C) 2025 Heiko Stuebner <heiko@sntech.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	/*
+	 * The default hardware-state of this gpio causes the drive
+	 * to be already running when entering the kernel.
+	 * regulator-boot-on is needed to prevent one additional
+	 * power-cycle on the drive.
+	 *
+	 * With regulator-boot-on we get the expected 1 cycle
+	 * per boot, without it we end up with 2 cycles as seen
+	 * via smartctl.
+	 */
+	hdd1_pwr: regulator-hdd1-power {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PC2 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdd1_power_pin>;
+		regulator-name = "hdd1-power";
+		regulator-boot-on;
+		vin-supply = <&dc_12v>;
+	};
+
+	hdd2_pwr: regulator-hdd2-power {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdd2_power_pin>;
+		regulator-name = "hdd2-power";
+		regulator-boot-on;
+		vin-supply = <&dc_12v>;
+	};
+
+	/*
+	 * HDD3+4 are connected to ports of the PCIe SATA controller.
+	 * Currently there is no way to attach those, so keep them
+	 * always on.
+	 */
+	hdd3_pwr: regulator-hdd3-power {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PC4 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdd3_power_pin>;
+		regulator-name = "hdd3-power";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&dc_12v>;
+	};
+
+	hdd4_pwr: regulator-hdd4-power {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 RK_PC5 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdd4_power_pin>;
+		regulator-name = "hdd4-power";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&dc_12v>;
+	};
+};
+
+&gpio2 {
+	hdd1-present-hog {
+		gpios = <RK_PA2 GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		input;
+		line-name = "hdd1-present";
+	};
+
+	hdd2-present-hog {
+		gpios = <RK_PA1 GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		input;
+		line-name = "hdd2-present";
+	};
+
+	hdd3-present-hog {
+		gpios = <RK_PD0 GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		input;
+		line-name = "hdd3-present";
+	};
+
+	hdd4-present-hog {
+		gpios = <RK_PD1 GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		input;
+		line-name = "hdd4-present";
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdd1_present_pin &hdd2_present_pin &hdd3_present_pin
+		     &hdd4_present_pin>;
+
+	hdd-power {
+		hdd1_power_pin: hdd1-power-pin {
+			rockchip,pins = <0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdd2_power_pin: hdd2-power-pin {
+			rockchip,pins = <0 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdd3_power_pin: hdd3-power-pin {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdd4_power_pin: hdd4-power-pin {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hdd-present {
+		hdd1_present_pin: hdd1-present-pin {
+			rockchip,pins = <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		hdd2_present_pin: hdd2-present-pin {
+			rockchip,pins = <2 RK_PA1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		hdd3_present_pin: hdd3-present-pin {
+			rockchip,pins = <2 RK_PD0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		hdd4_present_pin: hdd4-present-pin {
+			rockchip,pins = <2 RK_PD1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sata1_port0 {
+	target-supply = <&hdd2_pwr>;
+};
+
+&sata2_port0 {
+	target-supply = <&hdd1_pwr>;
+};
-- 
2.47.2


