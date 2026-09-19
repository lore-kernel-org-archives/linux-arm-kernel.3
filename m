Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3420C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzyAqJhpIh+GhkguWvCXJSKgm7T47PfWugj7Ak9f8GE=; b=dm5b+CXlsmwKl7cXRbSnJg51wN
	yl6ErOosRWclMApUYEILVPO+IFaYTSlFlq0v+vPZN8ljB//ZMlT4vEOBgp47wPd09FakRMmB6bL0A
	bSCQliKF61dwprHHrcRPe1YmkWGdfRmqLP4tFNYBxuvAIDjA8zAR1uBCRodbRSvLQlP+Jw64L0Twx
	Ylcp/IDJW60UmIu/VReDxC/ZUUt84m/fdy1KWdpl2zuYX6n/Vo+PzFrdSOw2QQqma5NNPvcqW4Nce
	Oslv/AlURmQopcwowAcG8Xhsreb24t0BLpArUckRXgqayTRJ2gE53MAr104SSO6vbfe4cVpSgx3ms
	nuGjspSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yy-0000000Gbbg-2tPH;
	Sat, 19 Sep 2026 19:44:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yx-0000000GbbI-39Ko
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 19:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39AF3447E5;
	Sat, 19 Sep 2026 19:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAB1DC2BCFB;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789847058;
	bh=r77sIn49Lrr2a0v+bk8OJsZiqcGMnZs+bQDLle5pZFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l3NFDR/wKRDw+pu35YYKXns2b90KaTGqDfWuVLZiIyt9AtXZcSm67p76Xq80RxCVe
	 bJIcXTdze9wA87bOooQPFLAI9q0A+SF28NmtXIgCFzfHcLWUicJ4Y5kNJN30llWE+t
	 1ZWL/ZRp/vgdYvk76Q2h7kJO/qy+SKFi6SN1fH/UHEiqzV2cCwDa6z5lqxZpen2Efz
	 j78PGIzf8MtM4P2I3eVK1IZ4uZduwCxugSYsekXv74lzoo1l3/Qe5BU1QIVCXP1HdY
	 PlIlmpTMfmvzb4mFr1CjvWJ6Tc195DuCVI7yLNg9NqOlbwcayQTOeK2qxXvAMHO366
	 JDEZImPGkCQfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB08BC982D7;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Sat, 19 Sep 2026 21:44:19 +0200
Subject: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
In-Reply-To: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789847056; l=6691;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=cIld08OYfIFoE2gYQn26s1yqlTESE8txLhhnKZ8Q8Do=;
 b=irq2DjZt92s3gqXtY4NG/t2J0ny6CpKXo0bhcgmgQnq30P68soK44PkumnTQT6PRPCDQz8vgj
 MYJVulk1BRDAHliu8J5XS14QpKdHCUTS+16advJuMiU/5HoPc1XVO9I
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
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
Reply-To: nicolo.giuliani6@studio.unibo.it
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Add a device tree for the network processing unit (NPU) of the Sophos
XGS 87/107 desktop firewalls. The appliance pairs an AMD x86 host with the
NPU, a Marvell Armada CN9130 SoC with its own eMMC and SPI NOR flash that
runs independently of the host and serves the front panel ports.

The eight RJ45 ports and the SFP cage are connected through a Marvell
88E6193X switch on the MDIO bus of the SoC, at address 2. Switch port 0
is the CPU port, a 10GBASE-R link to the first mvpp2 port. Ports 1 to 8
are the RJ45 ports, which use the internal PHYs of the switch, and
port 9 is the SFP cage, connected over 1000BASE-X.

Describe the UART console, the eMMC, the SPI NOR flash that holds the boot
loader and its environment (read-only), the PCA9555 GPIO expander that
drives the port LEDs, the SFP cage and the switch with its ports. The LEDs
themselves, the PCIe link to the x86 host and the USB ports are not
described.

The reset line of the switch (CP GPIO2 pin 17) is deliberately not given
to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
seconds after a reset before it can be used, much longer than the driver
waits, so the probe would time out. The boot loader resets the switch
before it starts the kernel.

Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI NOR
access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing with
its eight user ports, and 936 Mbit/s through a front port. The SFP cage
and the PCA9555 outputs are untested.

Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 209 +++++++++++++++++++++
 2 files changed, 210 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/Makefile b/arch/arm64/boot/dts/marvell/Makefile
index 09d1544041..81f892715b 100644
--- a/arch/arm64/boot/dts/marvell/Makefile
+++ b/arch/arm64/boot/dts/marvell/Makefile
@@ -34,5 +34,6 @@ dtb-$(CONFIG_ARCH_MVEBU) += cn9130-cf-base.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9130-cf-pro.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9131-cf-solidwan.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9132-clearfog.dtb
+dtb-$(CONFIG_ARCH_MVEBU) += cn9130-sophos-xgs107w.dtb
 
 subdir-y	+= mmp
diff --git a/arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts b/arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts
new file mode 100644
index 0000000000..d98d8da10e
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/cn9130-sophos-xgs107w.dts
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree for the network processing unit (NPU) of the Sophos XGS 87/107
+ * firewalls: a Marvell CN9130 SoC with a Marvell 88E6193X switch.
+ *
+ * The x86 host on the same board is not described here.
+ */
+
+/dts-v1/;
+
+#include "cn9130.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Sophos XGS 107w (CN9130 NPU)";
+	compatible = "sophos,xgs107w-npu", "marvell,cn9130",
+		     "marvell,armada-ap807-quad", "marvell,armada-ap807";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		ethernet0 = &cp0_eth0;
+		i2c0 = &cp0_i2c0;
+		i2c1 = &cp0_i2c1;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		/* OP-TEE, reserved by the firmware */
+		tee@4400000 {
+			reg = <0x0 0x4400000 0x0 0x1000000>;
+			no-map;
+		};
+	};
+
+	/* Front-panel SFP cage "F1", wired to switch port 9 */
+	sfp: sfp {
+		compatible = "sff,sfp";
+		i2c-bus = <&cp0_i2c1>;
+		los-gpios = <&cp0_gpio1 1 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&cp0_gpio1 2 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&cp0_gpio1 3 GPIO_ACTIVE_LOW>;
+		tx-disable-gpios = <&cp0_gpio1 7 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+/* eMMC on the AP */
+&ap_sdhci0 {
+	bus-width = <8>;
+	non-removable;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
+
+/*
+ * The MPP pin muxing is left as configured by the boot loader; the pin
+ * controller node only exists to back the GPIO banks.
+ */
+&cp0_syscon0 {
+	cp0_pinctrl: pinctrl {
+		compatible = "marvell,cp115-standalone-pinctrl";
+	};
+};
+
+&cp0_i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	/* Drives the port speed LEDs, which are not described yet */
+	gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&cp0_i2c1 {
+	/* SFP EEPROM (0x50/0x51) */
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+/* 4 MB SPI NOR with U-Boot and its environment, read-only on purpose */
+&cp0_spi0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x3f0000>;
+				read-only;
+			};
+
+			partition@3f0000 {
+				label = "u-boot-env";
+				reg = <0x3f0000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
+&cp0_ethernet {
+	status = "okay";
+};
+
+/* 10G link to switch port 0 */
+&cp0_eth0 {
+	phy-mode = "10gbase-r";
+	phys = <&cp0_comphy4 0>;
+	managed = "in-band-status";
+	status = "okay";
+};
+
+&cp0_mdio {
+	status = "okay";
+
+	switch@2 {
+		compatible = "marvell,mv88e6190";
+		reg = <2>;
+		/*
+		 * The reset line of the switch is CP GPIO2 pin 17. It is not
+		 * described as reset-gpios: the 88E6193X needs about two
+		 * seconds after a reset before it can be used, much longer
+		 * than the driver waits, and the probe would time out. The
+		 * boot loader resets the switch before starting the kernel.
+		 */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				ethernet = <&cp0_eth0>;
+				phy-mode = "10gbase-r";
+				managed = "in-band-status";
+			};
+
+			port@1 {
+				reg = <1>;
+				label = "p1";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "p2";
+			};
+
+			port@3 {
+				reg = <3>;
+				label = "p3";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "p4";
+			};
+
+			port@5 {
+				reg = <5>;
+				label = "p5";
+			};
+
+			port@6 {
+				reg = <6>;
+				label = "p6";
+			};
+
+			port@7 {
+				reg = <7>;
+				label = "p7";
+			};
+
+			port@8 {
+				reg = <8>;
+				label = "p8";
+			};
+
+			port@9 {
+				reg = <9>;
+				label = "sfp";
+				phy-mode = "1000base-x";
+				managed = "in-band-status";
+				sfp = <&sfp>;
+			};
+		};
+	};
+};

-- 
2.48.1



