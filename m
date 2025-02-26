Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8B5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxsrscezGJubm7rUM85ZXAPnCpHiDmg3Kn4JohLNs14=; b=v++M01fETd5Kl/E0vRNQp9Dbxz
	Vb8U9U498GNyW8PmgW+k1BAUhoMpjrxNhppNizJTYu2GZnNxJBUTmbyW359/nLF3NSB3GSnnQPmv9
	7WiHBUot93XC2QJkmteahQxDLC++15/J5mKgD2uIxt8Ni5Ua7wtotgq1QDUHhvRJW4W4gCRHZP5S7
	p8RFody9NKNApXnMtlfL0X1nfNnLskncy0+8ATN+jojriOafo0P+jaIo3+4nx7v5adsU98cDmabac
	/nY/wpHpmhfou0JlPsYB8aocbzUOLKoXx9PGG6aXf4cMGBq8MFPrlBZJX9qRLHuwX14qGnYm5Ba5e
	/B9Gso8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPKk-00000005Wsj-3DRa;
	Wed, 26 Feb 2025 21:52:50 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPGH-00000005WBb-1Sc0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC0B36122D;
	Wed, 26 Feb 2025 21:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F00C4CEE7;
	Wed, 26 Feb 2025 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740606492;
	bh=J57eJSnjO9hXPRLMhrrFdrkaisb+OAmoFXPVZ3hF/jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NWY08T6vgHpnlSjh0KJs2h8tm5GRSji3ze++I1jgIbPZtxMJZNeNcQlT0OQC8rvN/
	 f8Qg6RYbOoUHcelW/Ouexvoh+8UC+GBLAMZHyLAbqokvUxv2ODzND/hIgLuTkPIj+0
	 JkB1W1+Pp2fLtSfbpFAydneyD8icWy3ORUfqVG+4Qq0dWt/tjFArdTBdYIexF5p3kO
	 QFdzQS3kRadOu9dcusq28grytgPTC5tkkxbPL5xo1/8WW2xMYolJ1YEOrZsdn8QiES
	 +izQB/pEhFtlXgQpSb8MfiFzBP7Egwnr6EgC92diAh/aK8CMkIAu5nGa3SqBRhIW8E
	 ou5kM4D4cJilA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: marvell: Use preferred node names for "simple-bus"
Date: Wed, 26 Feb 2025 15:47:49 -0600
Message-ID: <20250226214751.3751865-3-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226214751.3751865-1-robh@kernel.org>
References: <20250226214751.3751865-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The "simple-bus" binding has preferred node names such as "bus",
".*-bus", or "soc". Rename the Marvell platforms to use these names.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi     | 2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 2 +-
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi     | 1 -
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi     | 1 -
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi     | 4 ++--
 arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi | 4 ++--
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi     | 4 ++--
 7 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index 75377c292bcb..605f5be1538c 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -78,7 +78,7 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
-		internal-regs@7f000000 {
+		bus@7f000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 9603223dd761..6ec22eaaf816 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -78,7 +78,7 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
-		internal-regs@d0000000 {
+		bus@d0000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 866628679ac7..e421d454daa7 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -5,7 +5,6 @@
  * Device Tree file for Marvell Armada AP806.
  */
 
-#define AP_NAME		ap806
 #include "armada-ap80x.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/marvell/armada-ap807.dtsi b/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
index a3328d05fc94..7150ce83abf2 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap807.dtsi
@@ -5,7 +5,6 @@
  * Copyright (C) 2019 Marvell Technology Group Ltd.
  */
 
-#define AP_NAME		ap807
 #include "armada-ap80x.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index e206d03a2867..40e146982921 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -63,14 +63,14 @@ pmu {
 		interrupts = <17>;
 	};
 
-	AP_NAME {
+	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
 		ranges;
 
-		config-space@f0000000 {
+		bus@f0000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
diff --git a/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi b/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
index f5a89af154d4..a143d84bcf23 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap810-ap0.dtsi
@@ -34,13 +34,13 @@ timer {
 				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	ap810-ap0 {
+	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
 		ranges;
 
-		config-space@e8000000 {
+		bus@e8000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 161beec0b6b0..a057e119492f 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -17,7 +17,7 @@ / {
 	 * The contents of the node are defined below, in order to
 	 * save one indentation level
 	 */
-	CP11X_NAME: CP11X_NAME { };
+	CP11X_NAME: CP11X_NODE_NAME(bus) { };
 
 	/*
 	 * CPs only have one sensor in the thermal IC.
@@ -51,7 +51,7 @@ &CP11X_NAME {
 	interrupt-parent = <&CP11X_LABEL(icu_nsr)>;
 	ranges;
 
-	config-space@CP11X_BASE {
+	bus@CP11X_BASE {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
-- 
2.47.2


