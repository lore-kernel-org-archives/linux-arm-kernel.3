Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F73CF6BE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhmvF6Fm0H4Q0C0+PhP11WlNE5ZH20R5v79tPffmgoI=; b=pxagrl+ARjQRtta23yA/1pWGhk
	csYpVs4JciTcd5zWILrzSc4RAX4CGsl+48NAO6s4pn7K9V71Iwpk9zRvKfjqAxCqkA9YxbSmxWQ61
	/80hoiw6crzM+dIU98f+EKwPaMtb/l7nyrTvzv5kR8bN3KbkHrQe+L1BTtRzHBw6U0EcmE7h/WQdR
	QxTi9I6I3DQcAopWfEG3iWWnk+0WkjkLjpftEwKk0Y1TnaXUEPIXG9gQwTbZMkET7F+miRkL9FFhz
	oOxZe7dZt6ScL1clF4rbhCCNOshUxJ1lM6EJO7LH8AKPRPuI+mnQ7yhavMpD+/Ppb+AwUGrQS1xmL
	PTlrJUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ0E-0000000E2QB-0gbv;
	Wed, 07 Jan 2026 02:10:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ03-0000000E2FJ-1POI;
	Wed, 07 Jan 2026 02:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00C87443EB;
	Wed,  7 Jan 2026 02:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B944BC4AF0B;
	Wed,  7 Jan 2026 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751814;
	bh=AtMI4/3OlnuqTZle0UKGcuThBaXK43hg5OjG6JBk87U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZawqhfkfCEGkouYdrTNfIPTW8Ggs/X+O48hkfax3B4Hsk4QGeVlVxro9UmcGbeUXW
	 Wd9bgHUgbh5oIySR2J32RY5WyZHQPLQpRC2T1BZwp+HpH2zOSlzwTY73CRQmQycCuT
	 E9p7abciCgwAoaaqPFnhvbVFrl9uLYrbxhy82YMCBvUDJe3MTrsG7PcvGviBjXA3j8
	 JLrE2RNdVH9LB4yXh1vOhGfve2NNFm+gFw7jCq9SraZed3zAIH0SwF3+7/72BA5kIv
	 EGXQEy3gXLDs314Wn4YAAkVDvWWWXC5C3BDTcVtnUWJ0/UG+EQhUxmdprfX1JEIcvm
	 NfIApk10zaOkQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:47 -0600
Subject: [PATCH 08/13] arm64: dts: broadcom: Use preferred node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-8-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_181015_436989_219E9E24 
X-CRM114-Status: GOOD (  11.35  )
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

Update various node names to use the documented preferred names. Node
names/path aren't considered ABI, so changing them should be safe.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts         | 4 ++--
 arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts         | 2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi            | 8 ++++----
 arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi   | 2 +-
 arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi | 2 +-
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi         | 6 +++---
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index f06472edd4a1..290759ee0078 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -111,7 +111,7 @@ &ssp0 {
 &ssp1 {
 	status = "okay";
 
-	at25@0 {
+	eeprom@0 {
 		compatible = "atmel,at25";
 		reg = <0>;
 		spi-max-frequency = <5000000>;
@@ -151,7 +151,7 @@ &sdio1 {
 };
 
 &nand {
-	nandcs@0 {
+	nand@0 {
 		compatible = "brcm,nandcs";
 		reg = <0>;
 		nand-ecc-mode = "hw";
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
index 0e134a94e142..be0876648afd 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts
@@ -74,7 +74,7 @@ gphy0: eth-phy@10 {
 };
 
 &nand {
-	nandcs@0 {
+	nand@0 {
 		compatible = "brcm,nandcs";
 		reg = <0>;
 		nand-ecc-mode = "hw";
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 9888a1fabd5c..0de9d6265701 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -657,7 +657,7 @@ hwrng: hwrng@66220000 {
 			reg = <0x66220000 0x28>;
 		};
 
-		sata_phy: sata_phy@663f0100 {
+		sata_phy: sata-phy@663f0100 {
 			compatible = "brcm,iproc-ns2-sata-phy";
 			reg = <0x663f0100 0x1f00>,
 			      <0x663f004c 0x10>;
@@ -701,7 +701,7 @@ sata1: sata-port@1 {
 			};
 		};
 
-		sdio0: sdhci@66420000 {
+		sdio0: mmc@66420000 {
 			compatible = "brcm,sdhci-iproc-cygnus";
 			reg = <0x66420000 0x100>;
 			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
@@ -711,7 +711,7 @@ sdio0: sdhci@66420000 {
 			status = "disabled";
 		};
 
-		sdio1: sdhci@66430000 {
+		sdio1: mmc@66430000 {
 			compatible = "brcm,sdhci-iproc-cygnus";
 			reg = <0x66430000 0x100>;
 			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
@@ -721,7 +721,7 @@ sdio1: sdhci@66430000 {
 			status = "disabled";
 		};
 
-		nand: nand@66460000 {
+		nand: nand-controller@66460000 {
 			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 			reg = <0x66460000 0x600>,
 			      <0x67015408 0x600>,
diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
index 8fe7325cfbb2..18152b16cfed 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
@@ -88,7 +88,7 @@ &enet {
 
 &nand {
 	status = "okay";
-	nandcs@0 {
+	nand@0 {
 		compatible = "brcm,nandcs";
 		reg = <0>;
 		nand-ecc-mode = "hw";
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi
index 46a827521921..b8da71463ad7 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-pinctrl.dtsi
@@ -32,7 +32,7 @@
 
 #include <dt-bindings/pinctrl/brcm,pinctrl-stingray.h>
 
-		pinconf: pinconf@140000 {
+		pinconf: pinctrl@140000 {
 			compatible = "pinconf-single";
 			reg = <0x00140000 0x250>;
 			pinctrl-single,register-width = <32>;
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index f9f77b2639c5..05139bcb3184 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -691,7 +691,7 @@ enet: ethernet@340000 {
 			status = "disabled";
 		};
 
-		nand: nand@360000 {
+		nand: nand-controller@360000 {
 			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 			reg = <0x00360000 0x600>,
 			      <0x0050a408 0x600>,
@@ -704,7 +704,7 @@ nand: nand@360000 {
 			status = "disabled";
 		};
 
-		sdio0: sdhci@3f1000 {
+		sdio0: mmc@3f1000 {
 			compatible = "brcm,sdhci-iproc";
 			reg = <0x003f1000 0x100>;
 			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
@@ -714,7 +714,7 @@ sdio0: sdhci@3f1000 {
 			status = "disabled";
 		};
 
-		sdio1: sdhci@3f2000 {
+		sdio1: mmc@3f2000 {
 			compatible = "brcm,sdhci-iproc";
 			reg = <0x003f2000 0x100>;
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.51.0


