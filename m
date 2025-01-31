Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CEEC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmsVuclXwm8PQr/6LB1+/Fwu0UzhPKdMvCNKYvU09X4=; b=KkFPsjPmjZwXOyetB429++NKSO
	rwgLcv0OJuexl9ibaUCIiI6iLg7V3epAenEbSZZcbI5CGKW9YJvuOGVu97DaS9+JM1m94hdBCz2p5
	lSYKsLn9sL99CbyUf+qa8IyElFbPIpbAmx6C/TnJA/1gVZInvHlShW+KgdBGJYDW/jxubcOpe1RNl
	GGqUbOzn1j/05mHgY66xr1x16vEJqjcetNa+Aw5HlDDZHZjlGkyNC2ci+4+oY9mC2d3GdBuj23OA+
	6KYoqEeQB89bpYxZZLS5+DZIndbmUa/V/tyq/Bgk38IxFkdd6K4kZii/VzPxvwyn+sud7Ipz0tcFP
	d9AQ/mQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyMy-0000000BRCs-47sE;
	Fri, 31 Jan 2025 21:16:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyFz-0000000BQG5-3ybI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A768DA414E5;
	Fri, 31 Jan 2025 21:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC297C4CED1;
	Fri, 31 Jan 2025 21:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357734;
	bh=Za+NrW98YddhKRc1vNrsOW2b1nHMoDqwrwHLpvFTyko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d+bxMNHZPlRF22IT7zGa3Ac+Qji07FTRbqfSCCIzU/hAbeswAo4pqPfkPCzGc7GeB
	 3H88VCmOo4RcP9ub1LeepYOAEH4tLXqg75aRH4QYjjBCPsYz11Pglw2s8C+KiWYFEu
	 Q6ISCQ1TAcKtlv6NSP+pkdNBCp73VcD7A2SHcWkJRZLWt0KdxF9YwTWqpcrYD6rmt5
	 gNO24LAbzWgbNS2Lzsg4eEIEh7TfQS+mSN91w8kS/jiDtRAu+wu6ttFQiB09J8KlDn
	 PlAjfjRULeJU1/Yxcw6lf/L+ZWWgApoZel61Q4OCXgkr1hHm2GtICtUyWLwt1uZXlf
	 dk9K1+QuOG92w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:28 -0600
Subject: [PATCH 4/6] arm64: dts: marvell: Drop incomplete root
 compatible/model properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-4-55f9f6acd4b1@kernel.org>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_130856_130083_7091E100 
X-CRM114-Status: GOOD (  15.23  )
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

The Marvell .dtsi files define model and compatible properties which
aren't complete. They are missing board compatible for example. This is
mostly harmless as the properties will typically get overwritten.
However, with these there will not be any warning should a board .dts
forget to define its compatible and model.

armada-371x.dtsi is not used anywhere, so it can be removed entirely
since there is nothing left in it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-371x.dtsi            | 17 -----------------
 arch/arm64/boot/dts/marvell/armada-372x.dtsi            |  3 ---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi            |  2 --
 arch/arm64/boot/dts/marvell/armada-7020.dtsi            |  6 ------
 arch/arm64/boot/dts/marvell/armada-7040.dtsi            |  6 ------
 arch/arm64/boot/dts/marvell/armada-8020.dtsi            |  6 ------
 arch/arm64/boot/dts/marvell/armada-8040.dtsi            |  6 ------
 arch/arm64/boot/dts/marvell/armada-8080.dtsi            |  6 ------
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi      |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi      |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi           |  5 -----
 arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi      |  3 ---
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi           |  5 -----
 .../boot/dts/marvell/armada-ap810-ap0-octa-core.dtsi    |  1 -
 arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi       |  2 --
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi          |  3 ---
 16 files changed, 77 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-371x.dtsi b/arch/arm64/boot/dts/marvell/armada-371x.dtsi
deleted file mode 100644
index dc1182ec9fa1..000000000000
--- a/arch/arm64/boot/dts/marvell/armada-371x.dtsi
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-/*
- * Device Tree Include file for Marvell Armada 371x family of SoCs
- * (also named 88F3710)
- *
- * Copyright (C) 2016 Marvell
- *
- * Gregory CLEMENT <gregory.clement@free-electrons.com>
- *
- */
-
-#include "armada-37xx.dtsi"
-
-/ {
-	model = "Marvell Armada 3710 SoC";
-	compatible = "marvell,armada3710", "marvell,armada3700";
-};
diff --git a/arch/arm64/boot/dts/marvell/armada-372x.dtsi b/arch/arm64/boot/dts/marvell/armada-372x.dtsi
index 02ae1e153288..b99ac4c03a48 100644
--- a/arch/arm64/boot/dts/marvell/armada-372x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-372x.dtsi
@@ -12,9 +12,6 @@
 #include "armada-37xx.dtsi"
 
 / {
-	model = "Marvell Armada 3720 SoC";
-	compatible = "marvell,armada3720", "marvell,armada3700";
-
 	cpus {
 		cpu1: cpu@1 {
 			device_type = "cpu";
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 9603223dd761..4e5ff7f67e33 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -11,8 +11,6 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
-	model = "Marvell Armada 37xx SoC";
-	compatible = "marvell,armada3700";
 	interrupt-parent = <&gic>;
 	#address-cells = <2>;
 	#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/marvell/armada-7020.dtsi b/arch/arm64/boot/dts/marvell/armada-7020.dtsi
index 4e46326dd123..570f901b4f4a 100644
--- a/arch/arm64/boot/dts/marvell/armada-7020.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-7020.dtsi
@@ -8,9 +8,3 @@
 
 #include "armada-ap806-dual.dtsi"
 #include "armada-70x0.dtsi"
-
-/ {
-	model = "Marvell Armada 7020";
-	compatible = "marvell,armada7020", "marvell,armada-ap806-dual",
-		     "marvell,armada-ap806";
-};
diff --git a/arch/arm64/boot/dts/marvell/armada-7040.dtsi b/arch/arm64/boot/dts/marvell/armada-7040.dtsi
index 2f440711d21d..710ac44870bd 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-7040.dtsi
@@ -9,12 +9,6 @@
 #include "armada-ap806-quad.dtsi"
 #include "armada-70x0.dtsi"
 
-/ {
-	model = "Marvell Armada 7040";
-	compatible = "marvell,armada7040", "marvell,armada-ap806-quad",
-		     "marvell,armada-ap806";
-};
-
 &cp0_pcie0 {
 	iommu-map =
 		<0x0   &smmu 0x480 0x20>,
diff --git a/arch/arm64/boot/dts/marvell/armada-8020.dtsi b/arch/arm64/boot/dts/marvell/armada-8020.dtsi
index ba1307c0fadb..b6fc18876093 100644
--- a/arch/arm64/boot/dts/marvell/armada-8020.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8020.dtsi
@@ -9,12 +9,6 @@
 #include "armada-ap806-dual.dtsi"
 #include "armada-80x0.dtsi"
 
-/ {
-	model = "Marvell Armada 8020";
-	compatible = "marvell,armada8020", "marvell,armada-ap806-dual",
-		     "marvell,armada-ap806";
-};
-
 /* The RTC requires external oscillator. But on Aramda 80x0, the RTC clock
  * in CP master is not connected (by package) to the oscillator. So
  * disable it. However, the RTC clock in CP slave is connected to the
diff --git a/arch/arm64/boot/dts/marvell/armada-8040.dtsi b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
index 22c2d6ebf381..3efd9b9e6892 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
@@ -9,12 +9,6 @@
 #include "armada-ap806-quad.dtsi"
 #include "armada-80x0.dtsi"
 
-/ {
-	model = "Marvell Armada 8040";
-	compatible = "marvell,armada8040", "marvell,armada-ap806-quad",
-		     "marvell,armada-ap806";
-};
-
 &cp0_pcie0 {
 	iommu-map =
 		<0x0   &smmu 0x480 0x20>,
diff --git a/arch/arm64/boot/dts/marvell/armada-8080.dtsi b/arch/arm64/boot/dts/marvell/armada-8080.dtsi
index 299e814d1ded..32bb56f2fe3f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8080.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8080.dtsi
@@ -6,9 +6,3 @@
  */
 
 #include "armada-ap810-ap0-octa-core.dtsi"
-
-/ {
-	model = "Marvell 8080 board";
-	compatible = "marvell,armada-8080", "marvell,armada-ap810-octa",
-				"marvell,armada-ap810";
-};
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
index 3ed6fba1f438..82f4dedfc25e 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
@@ -8,9 +8,6 @@
 #include "armada-ap806.dtsi"
 
 / {
-	model = "Marvell Armada AP806 Dual";
-	compatible = "marvell,armada-ap806-dual", "marvell,armada-ap806";
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi
index cf6a96ddcf40..f37f49c79a50 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi
@@ -8,9 +8,6 @@
 #include "armada-ap806.dtsi"
 
 / {
-	model = "Marvell Armada AP806 Quad";
-	compatible = "marvell,armada-ap806-quad", "marvell,armada-ap806";
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 866628679ac7..ecfd5f70190b 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -8,11 +8,6 @@
 #define AP_NAME		ap806
 #include "armada-ap80x.dtsi"
 
-/ {
-	model = "Marvell Armada AP806";
-	compatible = "marvell,armada-ap806";
-};
-
 &ap_syscon0 {
 	ap_clk: clock {
 		compatible = "marvell,ap806-clock";
diff --git a/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi b/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
index 8848238f9565..e8af7546e893 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap807-quad.dtsi
@@ -8,9 +8,6 @@
 #include "armada-ap807.dtsi"
 
 / {
-	model = "Marvell Armada AP807 Quad";
-	compatible = "marvell,armada-ap807-quad", "marvell,armada-ap807";
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/marvell/armada-ap807.dtsi b/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
index a3328d05fc94..550bdba7aeb9 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
@@ -8,11 +8,6 @@
 #define AP_NAME		ap807
 #include "armada-ap80x.dtsi"
 
-/ {
-	model = "Marvell Armada AP807";
-	compatible = "marvell,armada-ap807";
-};
-
 &ap_syscon0 {
 	ap_clk: clock {
 		compatible = "marvell,ap807-clock";
diff --git a/arch/arm64/boot/dts/marvell/armada-ap810-ap0-octa-core.dtsi b/arch/arm64/boot/dts/marvell/armada-ap810-ap0-octa-core.dtsi
index d1a7143ef3d4..2e719ffc8289 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap810-ap0-octa-core.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap810-ap0-octa-core.dtsi
@@ -11,7 +11,6 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		compatible = "marvell,armada-ap810-octa";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
diff --git a/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi b/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
index 2f9ab6b4a2c9..f824eb56b0e2 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
@@ -10,8 +10,6 @@
 /dts-v1/;
 
 / {
-	model = "Marvell Armada AP810";
-	compatible = "marvell,armada-ap810";
 	#address-cells = <2>;
 	#size-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
index cb8d54895a77..a997bbabedd8 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
@@ -7,9 +7,6 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "SolidRun CN9130 SoM";
-	compatible = "solidrun,cn9130-sr-som", "marvell,cn9130";
-
 	aliases {
 		ethernet0 = &cp0_eth0;
 		ethernet1 = &cp0_eth1;

-- 
2.47.2


