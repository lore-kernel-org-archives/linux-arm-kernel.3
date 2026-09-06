Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC81C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwKhCbEGgiAwm+aUQqVRUtVwAG/aqbkp3hmDWG+xhZA=; b=pq+Gyg8gTVWyrFD8kbeVntl0FM
	+i8wv6X2gIxzjMfTCFEaaWifARdQIWCHkvnIFllzzTawgVtL7Dgy+Mkev+aQ5tqHpRHYgtpB5ErSB
	P1YnWYjLbcOLS3hRDy3vZkXW8CTc67IIo/BjsSRbcc96vmkg83EVPKB0xXUHJ5N1REASm5/QVQ5qP
	mtYaxADMEjSYx+vhIN6XuFTU1GfS5NUnw/kM2V7CmL5B7ogmp91XAldQptU/q5qs9Zq7pOvq6gs00
	kppC9YRiEcQHUtVxTQNZSEtSgcR7Ss4BW9hYUCWF/VPGVe50/RSbAygEotk+Uq/GYRPppoE+PsqGK
	gHkTSqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FNb-00000005AID-1SVq;
	Sun, 06 Sep 2026 16:06:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FNZ-00000005AHm-13uo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7867C43D56;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D6F3C4AF09;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788710760;
	bh=5SJsPBbTPs2WnulpeeDxwt9+wMcyzsKk9EE8/ifoDP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uj4RXKWrcFGYPayDgIJ808wIhl6aJ7Vg6lrsbh2aFApyVhlRenALMfOceLI2pAZAI
	 JpTAn2ZFYpKUbPlLod/1DyLJxxSrMxhrEorblRwkG2GtYLR+kgwyB7+B4iaHBYovXj
	 tQ01Ho9463ap4YpG6c3Ki7WF+FtrI4C+2/rGcrlDxdCB5Yr5EgtJ1dgWukzocNEm1o
	 wC5eU3zypDiF069tHcLK+uYkmOrqLuU+ZAuRbn1lR+Lh5EpvwHMDQPOMuRvZk7hk3R
	 mnBxlHEDkyAfSg725v5dKgPN90qfsbx9haLl8BzjyqwHAUOwCR4X9IfV753ll9bsFf
	 5fJtXJyB3g39w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0952C79F9F;
	Sun,  6 Sep 2026 16:05:59 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Date: Sun, 06 Sep 2026 16:05:50 +0000
Subject: [PATCH 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260906-b4-spc-glee-a64-v1-v1-2-621df2155e31@proton.me>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
In-Reply-To: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710758; l=3793;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=smg8un4L1xfda+TiUSf/I6igSw+M5PMAvgVUP5GsAX4=;
 b=6To9yA903C/qhWOwfY4AboqPIGjL4R1bzuOfPc8ax19LpI8BLtSIK+1fZfMWTJa684fCIlk35
 zsIBdS33m+zAE0Pa75gzrlolBPTOipOWvjZ6+EXixTKnzF8vGVePC//
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
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
Reply-To: jcarlosgl96@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>

Add support for the SPC Glee 10.1 tablet based on the Allwinner
A64. Describe the 2 GiB of DRAM, AXP803 PMIC, essential CPU and
system rails, microSD slot, UART console, battery monitoring and USB
peripheral port. Leave eMMC and unverified peripherals disabled.

This configuration was boot-tested from microSD to Arch Linux ARM
userspace without regulator_ignore_unused.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-spc-glee.dts     | 123 +++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index aa21f58a4..cc6687b39 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-spc-glee.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
new file mode 100644
index 000000000..1ca7c36de
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 SPC Glee A64 Linux contributors
+ */
+
+/dts-v1/;
+
+#include "sun50i-a64.dtsi"
+
+/ {
+	model = "SPC Glee 10.1 A64";
+	compatible = "spc,glee-10-1-a64", "allwinner,sun50i-a64";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x80000000>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_dcdc1>;
+	broken-cd;
+	bus-width = <4>;
+	max-frequency = <25000000>;
+	status = "okay";
+};
+
+&r_rsb {
+	status = "okay";
+
+	axp803: pmic@3a3 {
+		compatible = "x-powers,axp803";
+		reg = <0x3a3>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp803.dtsi"
+
+&axp_adc {
+	status = "okay";
+};
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-name = "vcc-3v3";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-cpux";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1500000>;
+	regulator-max-microvolt = <1500000>;
+	regulator-name = "vcc-dram";
+};
+
+&reg_dcdc6 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_fldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-cpus";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};

-- 
2.55.0



