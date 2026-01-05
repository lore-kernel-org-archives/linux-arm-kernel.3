Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33C3C79FBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RaAvlZzyK9NhBPWSVfzEIIZ87kNMFeTYAHmz9f/nVE=; b=zMxr7hdjxG9qbF2u1nB4WSDx+s
	AQkmCNTbR79Bxy3R69G7uO3Z57pI5uHBKqY5kf6g04FPfWftMUVSEobzoFwner7TsiSGg6IgTweAk
	qjSGGjLljlsPmzBK9udYgTIyb5myxNNrHW8LxMi6EA+hjXwJ7XGcmNCr1IBjI6oQMJnTILZcjBrXZ
	jnI+vL0Gk/rWIZ7HgcoWqtkip/vnejeNd2b09ibU6eayEBEpIJyDs47c1rKS1+u0wJiqRXVEU9pP1
	0E1APUhQPSZ6LoEbquGTgeUvGpZRYyfvLOtbd4iRxj/eNfaoRsUHyVQ/rg3RPnY8JScazNe1BxN3b
	QIc0GKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXK-0000000Bzss-0f56;
	Mon, 05 Jan 2026 19:46:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqXI-0000000Bzsg-3IdM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D275360010;
	Mon,  5 Jan 2026 19:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B29FC116D0;
	Mon,  5 Jan 2026 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767642399;
	bh=uXHOetpzVfMY5FeZnGkLH3rPKDi0N+YTnGd6QXJf5v4=;
	h=From:To:Cc:Subject:Date:From;
	b=kUDUFGZDo1OvCCnRLo4G/PnCJSebI1OqSHrhRdxZkWrWgtTiCoftVBhgaqYWpR/HN
	 FiumkftU67LUov1SU/Ri+dcoap71J8Z3NLcchyZgtu8YE17Z2nxf3mfleUp291fTku
	 vQm+TzRQ7dkVi11CraT85Gmmccao+DJCmX0IAxfr58PfCiUdMog0uAXhAEtvbTUYyU
	 nB7otustWu2Y6zmz7T1EErVeoI0d5DhFGjfv3IHeQnaGJuKEuVliKXpZkNgY/diD5v
	 FmqUVEGRfG2Ja9ydPnmX1J00upeEUTkLtQwCwNMA0DuCrWvq3GojeS9brWK6Bq/FnL
	 1gHUhBmIoGbUw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: marvell: Add missing "#phy-cells" to "usb-nop-xceiv"
Date: Mon,  5 Jan 2026 13:46:34 -0600
Message-ID: <20260105194636.3188884-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The "usb-nop-xceiv" binding requires "#phy-cells" property with a value
of 0 though it is not really used. Add it where missing from Marvell
platforms.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-db.dts                | 1 +
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts | 1 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts                | 2 ++
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                   | 2 ++
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi                    | 2 ++
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi                    | 1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi                    | 2 ++
 7 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
index bd4e61d5448e..06d4a3a93f84 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
@@ -41,6 +41,7 @@ exp_usb3_vbus: usb3-vbus {
 
 	usb3_phy: usb3-phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&exp_usb3_vbus>;
 	};
 
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
index 97a180c8dcd9..e82284888b9a 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
@@ -37,6 +37,7 @@ reg_usb3_vbus: usb3-vbus {
 
 	usb3_phy: usb3-phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&reg_usb3_vbus>;
 	};
 
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index 21ecb9c12505..c7102f74d4d5 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -51,6 +51,7 @@ cp0_reg_usb3_1_vbus: cp0-usb3-1-vbus {
 
 	cp0_usb3_0_phy: cp0-usb3-0-phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp0_reg_usb3_0_vbus>;
 	};
 
@@ -65,6 +66,7 @@ cp1_reg_usb3_0_vbus: cp1-usb3-0-vbus {
 
 	cp1_usb3_0_phy: cp1-usb3-0-phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp1_reg_usb3_0_vbus>;
 	};
 };
diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
index 5e7d6de3cdde..5689a8bdfd03 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
@@ -47,10 +47,12 @@ cp0_reg_usb3_vbus1: regulator-2 {
 
 	cp0_usb3_0_phy0: usb-phy-1 {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 	};
 
 	cp0_usb3_0_phy1: usb-phy-2 {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp0_reg_usb3_vbus1>;
 	};
 
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
index 3cc320f569ad..7156739aa31a 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
@@ -50,6 +50,7 @@ cp0_reg_usb3_vbus0: regulator-2 {
 
 	cp0_usb3_0_phy0: usb-phy-1 {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp0_reg_usb3_vbus0>;
 	};
 
@@ -64,6 +65,7 @@ cp0_reg_usb3_vbus1: regulator-3 {
 
 	cp0_usb3_0_phy1: usb-phy-2 {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp0_reg_usb3_vbus1>;
 	};
 
diff --git a/arch/arm64/boot/dts/marvell/cn9131-db.dtsi b/arch/arm64/boot/dts/marvell/cn9131-db.dtsi
index 626042fce7e2..26dc91c88677 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9131-db.dtsi
@@ -31,6 +31,7 @@ cp1_reg_usb3_vbus0: regulator-6 {
 
 	cp1_usb3_0_phy0: usb-phy-3 {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp1_reg_usb3_vbus0>;
 	};
 
diff --git a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi b/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
index f91fc69905b8..f82d45e62753 100644
--- a/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9132-db.dtsi
@@ -28,6 +28,7 @@ cp2_reg_usb3_vbus0: regulator-7 {
 
 	cp2_usb3_0_phy0: usb-phy-4 {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp2_reg_usb3_vbus0>;
 	};
 
@@ -42,6 +43,7 @@ cp2_reg_usb3_vbus1: regulator-8 {
 
 	cp2_usb3_0_phy1: usb-phy-5 {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 		vcc-supply = <&cp2_reg_usb3_vbus1>;
 	};
 
-- 
2.51.0


