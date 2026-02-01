Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283C5E6529E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBJoony19TmpMSQvar+sI3waiK1pCWowuANcsLeM5/E=; b=Rng3/xe/IzV2ef5x6aChyMfFIj
	f25e6uhJxn1i6qUGP+uN8zWBQd+1t3yz8GZo/zKBTHscs4vFb/UMbsBxpra9B0ehs4vcG2dvsXpEQ
	HUwc1/eajLLPkSqoDR/Wng6GUoiSVovKi9+WvPCvYqpIFHKCHsmHOLqCW4TI99tL6+axUaTeV8oxW
	pnRExQmgaHP/o/g7r9Y24eMeo+JGJeWgd2BI6/ubrg62T+MUlCDiBefnnG0KHXYigwqR/9VFdykVD
	THlqJG6+floxB1cMn2BBjCLa/3kVrN/bzSZHIWZoLCwwSMJNgvj0tlFS8A3w+zqoE8fTI9sxVVHqb
	7AMPLU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcxd-000000046gf-0Qtp;
	Sun, 01 Feb 2026 19:18:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmcxY-000000046dL-1rU9;
	Sun, 01 Feb 2026 19:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=sBJoony19TmpMSQvar+sI3waiK1pCWowuANcsLeM5/E=; b=Qdj8sKOmWmhQqqVq4YbQ4GirLn
	75JKvvVZMcgpV0EGpluBTR3WkbdT2pdu9UAdNPwW/GoAHAqfGwc7XSkbMBLReNPoAa4cX7YUakXII
	tIsPd/uRWrlM3n2cTNifRnrFZdijh4oofsZ1NuessFBEC2LGJ0bf7oPvP98jvieDlTKkoOnUeNl2D
	UC0lyIy+j0omh2fkLSkBpbsDLRuU/7b7QGbnzU8db8nX0UtQBMsRrduBkWPWOkdlZ/ioizLTfMEC0
	FXvP7SXXSLb7JiC95B/Op6OHwkqEYQJ2Vk40CQvW1eK9DY5m/hyRX+M3fEujAOB4iJY+qrOUuy1Xc
	ulvnND3A==;
Received: from [88.128.88.21] (helo=phil.t-mobile.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vmcxT-005wWz-Oj; Sun, 01 Feb 2026 20:18:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: rockchip: add overlay for qnap-ts133 device revision
Date: Sun,  1 Feb 2026 20:18:04 +0100
Message-ID: <20260201191804.41421-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260201191804.41421-1-heiko@sntech.de>
References: <20260201191804.41421-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_111812_495713_39EDD611 
X-CRM114-Status: GOOD (  17.69  )
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
presence-detection and power-control. These boards have a PCB-id of at
least 13 which can be read from an EEPROM.

The presence detection is not really necessary and there are also no
existing bindings for doing something with it. So add them as gpio hog
to at least document them and allow its state to be read from debugfs.

The power-control is modelled as regulator, with connected to the
RK3568's SATA controller as target-supply.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 .../rockchip/rk3566-qnap-ts133-pcb-13.dtso    | 64 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133-pcb-13.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index c5086aa9c427..40c5a75a2511 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -115,6 +115,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rgb30.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-rk2023.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-powkiddy-x55.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-qnap-ts133.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-qnap-ts133-pcb-13.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-quartz64-b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-radxa-cm3-io.dtb
@@ -247,6 +248,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-v2-screen.dtb
 rk3399-rockpro64-v2-screen-dtbs := rk3399-rockpro64-v2.dtb \
 	rk3399-rockpro64-screen.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-qnap-ts133-pcb-13.dtb
+rk3566-qnap-ts133-pcb-13-dtbs := rk3566-qnap-ts133.dtb \
+	rk3566-qnap-ts133-pcb-13.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233-pcb-12-11.dtb
 rk3568-qnap-ts233-pcb-12-11-dtbs := rk3568-qnap-ts233.dtb \
 	rk3568-qnap-ts233-pcb-12-11.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133-pcb-13.dtso b/arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133-pcb-13.dtso
new file mode 100644
index 000000000000..f9a8194f5753
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133-pcb-13.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Device tree overlay for TS133 board PCB-13 revision.
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
+};
+
+&gpio2 {
+	hdd1-present-hog {
+		gpios = <RK_PA2 GPIO_ACTIVE_LOW>;
+		gpio-hog;
+		input;
+		line-name = "hdd1-present";
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdd1_present_pin>;
+
+	hdd-power {
+		hdd1_power_pin: hdd1-power-pin {
+			rockchip,pins = <0 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	hdd-present {
+		hdd1_present_pin: hdd1-present-pin {
+			rockchip,pins = <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sata2_port0 {
+	target-supply = <&hdd1_pwr>;
+};
-- 
2.47.2


