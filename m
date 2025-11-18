Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E84CEE334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V33LgHMaA19L7AQTTxwDc0wvf2Ziqc56wvPPwij4a3Y=; b=rtetmcUovai4em/36WD9Qekaop
	Wz+iC6WXj7nE9RYIan7KCOyqIG4qRGyHupXl6XY4CKxXIspKTpK0qRBpltLQwV2zBHD/Bhm8Utxip
	HVUPhge39It/IKuVoj7QXuEuMVpT4EePAdRgVfyBs1iTer5z4CWt0qOTZCAjfI1xBioSxM5QM57O1
	It+5GJBaj4jGGDPbN8H2p7zUhw1NTkkxSpnQN5ObAV8y9c82h0/TgVluOMYiURdQ5B5v7x2mtmm4q
	ul4Cy1SwenbZl7awxwTF4NpamSVlM3wuDS4RxEKFWaCpGwWItJP9Tu4SdtsmmAMKECBT/yNl0/SI/
	WBIEdPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTMw-0000000187Z-29d6;
	Tue, 18 Nov 2025 21:36:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTMs-00000001878-0kID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 21:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61D7443813;
	Tue, 18 Nov 2025 21:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E351EC116D0;
	Tue, 18 Nov 2025 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763501765;
	bh=b1uwEjQ88F7sIXoukh2YUwPZjQK4En6hofzj3LhP+ow=;
	h=From:To:Cc:Subject:Date:From;
	b=c2drhGzLUR+9NsY2j7pn0GQGI77lVDcgKBxtWrumeqahNIORPuLPKnbS4Oty5Hl2O
	 s5QwLPsZclcWfvEbcKJy3C7mEArxiUg6cVxxj1B8z9RNchZ5M6rYdqtu66Grs0XYye
	 hduYwBGA6li2Q9+W0brAsN6RceLoH3ETv58ihqePvf/rVNNcs/d8u4jQhHuuGWzgZi
	 ew/3sjC/M+XxNuqPCR7jLoc3EFI2qyCCmeC7VrCVBRos12bxZH0+EXm9OAVA/vtJNP
	 C+mHiN3KGpjg1lcNUdLTUFAe0nioWDoOvrbArKmnhUrV4CpmrnsQd/x3uo68clr5Bp
	 eCc9cBY8CD0Ew==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: nxp: imx: Fix mc13xxx LED node names
Date: Tue, 18 Nov 2025 15:35:50 -0600
Message-ID: <20251118213551.44116-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_133606_890536_C4B73FD5 
X-CRM114-Status: GOOD (  10.29  )
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

Node names are supposed to be generic and use hexadecimal unit-addresses.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts | 8 ++++----
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts           | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts      | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts       | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
index b8048e12e3d9..5398e9067e60 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
@@ -248,14 +248,14 @@ ledr3: led@9 {
 		linux,default-trigger = "nand-disk";
 	};
 
-	ledg3: led@10 {
-		reg = <10>;
+	ledg3: led@a {
+		reg = <0xa>;
 		label = "system:green3:live";
 		linux,default-trigger = "heartbeat";
 	};
 
-	ledb3: led@11 {
-		reg = <11>;
+	ledb3: led@b {
+		reg = <0xb>;
 		label = "system:blue3:cpu";
 		linux,default-trigger = "cpu0";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 06545a6052f7..238138c4ee72 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -398,13 +398,13 @@ leds {
 			#size-cells = <0>;
 			led-control = <0x0 0x0 0x3f83f8 0x0>;
 
-			sysled0@3 {
+			led@3 {
 				reg = <3>;
 				label = "system:green:status";
 				linux,default-trigger = "default-on";
 			};
 
-			sysled1@4 {
+			led@4 {
 				reg = <4>;
 				label = "system:green:act";
 				linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
index 26eb7a9506e4..1598bf4f4991 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
@@ -225,13 +225,13 @@ leds {
 			#size-cells = <0>;
 			led-control = <0x0 0x0 0x3f83f8 0x0>;
 
-			sysled3: led3@3 {
+			sysled3: led@3 {
 				reg = <3>;
 				label = "system:red:power";
 				linux,default-trigger = "default-on";
 			};
 
-			sysled4: led4@4 {
+			sysled4: led@4 {
 				reg = <4>;
 				label = "system:green:act";
 				linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
index 19a3b142c964..c2dcfd44c445 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
@@ -153,13 +153,13 @@ leds {
 			#size-cells = <0>;
 			led-control = <0x0 0x0 0x3f83f8 0x0>;
 
-			sysled3: led3@3 {
+			sysled3: led@3 {
 				reg = <3>;
 				label = "system:red:power";
 				linux,default-trigger = "default-on";
 			};
 
-			sysled4: led4@4 {
+			sysled4: led@4 {
 				reg = <4>;
 				label = "system:green:act";
 				linux,default-trigger = "heartbeat";
-- 
2.51.0


