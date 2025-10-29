Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B705CCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KnWI6ZVyFMQhKqaDtRaOL5FhreDlDuRLI+ae74XoxrE=; b=IauDWsbnz/8mfI1dscT7svTrJr
	3hXjIDgRR2b7+06CyKWHGLu7o5Q+CPdwk0I56REp4XP1CbMV+4Lt0CPsaEsOOLRckJ5v2VXoy6XKG
	gfIi2jY8iqoZOSpl6dnJ5ufX/BdE2pF1O7kKIe9v9UQWKXKio5TyHPFl/4UDmnzdV35JWD64JGldl
	irC7Juq/AnxjNqLj7Sp/M549p3rw9mcJ/lrZTFgYrn+2GD/anryKMKnLI2dJTtkiPk6qV6eraNmHY
	qMDVJcxgbuc/SBc5jW0pJ/doMqaoxQBxZTrW0rzF+yZO8Jcs5gQJ15Ef1lpnD3VbsP8exH6hFsko4
	Hpbyg/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Gy-00000001pUk-1kRA;
	Wed, 29 Oct 2025 15:39:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Gw-00000001pU3-24WH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:39:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88CEB61F55;
	Wed, 29 Oct 2025 15:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1186C4CEF7;
	Wed, 29 Oct 2025 15:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761752377;
	bh=grPwEietiNbq1mSlzDL7WcODrofYGlPESBXp1qQNHsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=vAlRS1mAFJLTp2ybW94RNMrdBL9c7LEqcafqarKYgFiPNlZ7pwx3TuoKI8thB7qcr
	 4Bv7O/FqSAg7KTv4URkhPYbf7f5z28e7nawJfc+P55eiNrkVOo5FrUAxfJqpNl7lEN
	 GUrpJtm03ct3XDlLhq+l9uOtujZBhKLpF792XMD+VWVxZDsbTEu0wo2EfmSMWfnYBm
	 GQjiYgdwHeaNQ4WylG8ZP/9xH0Krj5OreqhS72QdXT3WJ8HCDWf0ZqDAqCRK6U5NT5
	 NdbixIdBFcaLj6hnZnNMF1XWdrwilBcZDpjbxHmWEGWOF3IXSYoZnI7BAAuKD/IBDw
	 HpytFTCoAhvgg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/arm: dts: marvell: Rename "nand-rb" pinctrl node names
Date: Wed, 29 Oct 2025 10:39:25 -0500
Message-ID: <20251029153927.1065446-1-robh@kernel.org>
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

Update the "nand-rb" pinctrl child node names to use the defined "-pins"
suffix fixing DT schema warnings.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/marvell/armada-38x.dtsi         | 2 +-
 arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi | 2 +-
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi      | 2 +-
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi      | 2 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dts/marvell/armada-38x.dtsi
index 1181b13deabc..1d616edda322 100644
--- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
@@ -247,7 +247,7 @@ nand_pins: nand-pins {
 					marvell,function = "dev";
 				};
 
-				nand_rb: nand-rb {
+				nand_rb: nand-rb-pins {
 					marvell,pins = "mpp41";
 					marvell,function = "nand";
 				};
diff --git a/arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi b/arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi
index 7a7e2066c498..a9a71326aafc 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-xp-98dx3236.dtsi
@@ -322,7 +322,7 @@ nand_pins: nand-pins {
 		marvell,function = "dev";
 	};
 
-	nand_rb: nand-rb {
+	nand_rb: nand-rb-pins {
 		marvell,pins = "mpp19";
 		marvell,function = "nand";
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
index 293403a1a333..df939426d258 100644
--- a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
@@ -56,7 +56,7 @@ nand_pins: nand-pins {
 			marvell,function = "dev";
 		};
 
-		nand_rb: nand-rb {
+		nand_rb: nand-rb-pins {
 			marvell,pins = "mpp13";
 			marvell,function = "nf";
 		};
diff --git a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
index ee67c70bf02e..fb361d657a77 100644
--- a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
@@ -89,7 +89,7 @@ nand_pins: nand-pins {
 			marvell,function = "dev";
 		};
 
-		nand_rb: nand-rb {
+		nand_rb: nand-rb-pins {
 			marvell,pins = "mpp13", "mpp12";
 			marvell,function = "nf";
 		};
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
index 50e9e0724828..3cc320f569ad 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
@@ -379,7 +379,7 @@ nand_pins: nand-pins {
 				       "mpp27";
 			marvell,function = "dev";
 		};
-		nand_rb: nand-rb {
+		nand_rb: nand-rb-pins {
 			marvell,pins = "mpp13";
 			marvell,function = "nf";
 		};
-- 
2.51.0


