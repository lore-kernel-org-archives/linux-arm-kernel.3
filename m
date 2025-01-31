Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D8C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOMagjVk/RHMeRQd+AcBOL2NXRKa31WOVE1JJnG35Y0=; b=ynkzg87KZDHI63VvuEbRG/DQn5
	aU/4EDJ4j/ZPvcZX2ELJJ0DT2TtTr9E5iDWP8jVXrDV8tFgu76B92j8d7SGcdua8ArmhwZ22I/LJP
	NnxNkhIczt6A0wqq2Pz4jg33vQgB4Dys1uYqkoDKw/y1wXhCWopTEyfCpd/rtj8IVRGI/x8Me95Mp
	wJMojKD9tWe9dfGzZ3UKA1nopYpeRc7XbHCla9/UUZfQc5q2tPXGahLXHDlF47BCXSg8q2Kz6PJkM
	Xg7UqOVhC8VlEDGn4Yldy+PgAj582vqkIVdTiU02nANgCFI73fY+dbBFNvakVvP19T1gFqAIgJOtp
	Mw/TSs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyOG-0000000BRHf-2gIb;
	Fri, 31 Jan 2025 21:17:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyG1-0000000BQFk-0End
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 21:08:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41BF1A42546;
	Fri, 31 Jan 2025 21:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3831C4CED1;
	Fri, 31 Jan 2025 21:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738357736;
	bh=y1XRJOOEojK7aHlX06znA6wDgkwys+QMiT/chEEavzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VclobnRrgpKlObwrwzhaDtJM0gusceIxnEajayKElBUfWzXjo6x6cEwD1msRJMwXC
	 EY8YQmF/6eR2kiOJL11RWyTT7L1A7o/lTaIHC+x+YCoK71rWVAce2+V/8wiwm/x9Sj
	 uVFG4q26hEyh4wKXfql3X+Mq8RPEDPdZdDLD86WZgujaHYhUQckpExiDM7jO6+WiEw
	 rtngVPnUmGp9FffKJFv6QobySq2qNtVgxUjInfKxKW73KkE49it/ZOtX+8GjOy2JWI
	 PT+t+/TNczBLyBeCP4gbgeu0ukgqrXebt05T6BcyAHNwYXRcY9AcNqvlYHU1n3Rq5F
	 BL9RugIBtW8ng==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 31 Jan 2025 15:08:29 -0600
Subject: [PATCH 5/6] arm64: dts: marvell: Fix missing/incorrect
 "marvell,armada3710" compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-dt-marvell-fixes-v1-5-55f9f6acd4b1@kernel.org>
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
X-CRM114-CacheID: sfid-20250131_130857_239272_F1C98B10 
X-CRM114-Status: GOOD (  10.27  )
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

"marvell,armada3700" is not a documented compatible value. According to
the schema, "marvell,armada3720" SoCs should have a "marvell,armada3710"
fallback compatible.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-db.dts                  | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts    | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts   | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts      | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts         | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts           | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
index 0cfb38492021..bd4e61d5448e 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
@@ -18,7 +18,7 @@
 
 / {
 	model = "Marvell Armada 3720 Development Board DB-88F3720-DDR3";
-	compatible = "marvell,armada-3720-db", "marvell,armada3720", "marvell,armada3700";
+	compatible = "marvell,armada-3720-db", "marvell,armada3720", "marvell,armada3710";
 
 	chosen {
 		stdout-path = "serial0:115200n8";
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts
index 6715a19c1483..5c4d8f379704 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts
@@ -18,7 +18,7 @@
 / {
 	model = "Globalscale Marvell ESPRESSOBin Board (eMMC)";
 	compatible = "globalscale,espressobin-emmc", "globalscale,espressobin",
-		     "marvell,armada3720", "marvell,armada3700";
+		     "marvell,armada3720", "marvell,armada3710";
 };
 
 &sdhci0 {
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
index b3cc2b7b5d19..97a180c8dcd9 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts
@@ -13,7 +13,7 @@
 / {
 	model = "Globalscale Marvell ESPRESSOBin Ultra Board";
 	compatible = "globalscale,espressobin-ultra", "globalscale,espressobin",
-		     "marvell,armada3720", "marvell,armada3700";
+		     "marvell,armada3720", "marvell,armada3710";
 
 	aliases {
 		/* ethernet1 is WAN port */
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts
index 2a8aa3901a9f..75401eab4d42 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts
@@ -19,7 +19,7 @@ / {
 	model = "Globalscale Marvell ESPRESSOBin Board V7 (eMMC)";
 	compatible = "globalscale,espressobin-v7-emmc", "globalscale,espressobin-v7",
 		     "globalscale,espressobin", "marvell,armada3720",
-		     "marvell,armada3700";
+		     "marvell,armada3710";
 
 	aliases {
 		/* ethernet1 is wan port */
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts
index b03af87611a9..48a7f50fb427 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts
@@ -18,7 +18,7 @@
 / {
 	model = "Globalscale Marvell ESPRESSOBin Board V7";
 	compatible = "globalscale,espressobin-v7", "globalscale,espressobin",
-		     "marvell,armada3720", "marvell,armada3700";
+		     "marvell,armada3720", "marvell,armada3710";
 
 	aliases {
 		/* ethernet1 is wan port */
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
index c5a834b33b77..1542d836c090 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
@@ -16,5 +16,5 @@
 
 / {
 	model = "Globalscale Marvell ESPRESSOBin Board";
-	compatible = "globalscale,espressobin", "marvell,armada3720", "marvell,armada3700";
+	compatible = "globalscale,espressobin", "marvell,armada3720", "marvell,armada3710";
 };
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index 56930f2ce481..9f4bafeddd82 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -7,7 +7,7 @@
 
 / {
 	model = "GL.iNet GL-MV1000";
-	compatible = "glinet,gl-mv1000", "marvell,armada3720";
+	compatible = "glinet,gl-mv1000", "marvell,armada3720", "marvell,armada3710";
 
 	aliases {
 		led-boot = &led_power;
diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index 54453b0a91f9..f4d73c8b1a6d 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -14,7 +14,7 @@
 / {
 	model = "CZ.NIC Turris Mox Board";
 	compatible = "cznic,turris-mox", "marvell,armada3720",
-		     "marvell,armada3700";
+		     "marvell,armada3710";
 
 	aliases {
 		spi0 = &spi0;

-- 
2.47.2


