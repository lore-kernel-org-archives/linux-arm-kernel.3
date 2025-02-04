Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F4BC02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CEdF0jhoG/B0a4ES0SlrhCki6yzDX3XnbYxVQbv/gYw=; b=Cjzmw41W62Ytt/
	vXT9kOIIApyh3TFHl7BiRovThFJ4OirDbhvMoeX043xcjrXnLWF2pyXP8xb4xMeOt2n9OWu3WmRhK
	koVWJXk9/vm+1CcGVbRF+NRgNuEkHZWxqbGRIErmOHm44Vii/wDq9irUykyGjCDS+5NuRBJriQtlJ
	YcAu1t54OOGK3ZqR+tlmyoiwsL5aLr+4OydtZgSkMRE3vzZWBKH9riLNVJZIwZMvQWO2eXsm3DYoy
	TbUMAE5g9gidILeKied7BFcI9/4D+MYemOuBSZ62/Tzx+D+MN6mOgJ9jV8wpbYTnNBvfDH4FvpkbE
	l88JkzyQHfux7YNaUq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMBD-000000010wb-3C1P;
	Tue, 04 Feb 2025 16:53:43 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfM9s-000000010lw-0Zzy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 16:52:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1115A1483A3A;
	Tue,  4 Feb 2025 17:52:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1738687934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CEdF0jhoG/B0a4ES0SlrhCki6yzDX3XnbYxVQbv/gYw=;
	b=ZEHBxZNgpTtAP/BAslYrTS06RLxAvyDhs0dCf9GN6erkZZ9dQHg6+d6kU5ex744wF/yc5X
	SJh5Yo1xYY27VhaoErIyQ2z07vTxX1/Af/KrpKPHEJ6RV/YgQ1iN993AL/WEb49qcCwm0A
	xQRILYXXTPQqgNovN5ONpv7N1tMQEJ63TaGa62QOZTO/v69Vn4egISfgrMWjTWMXSp3G3J
	CCeOTZb37IVDfcII9tvWygGgygkz3H57qIqFJHT7USyhQWfqaDL75mCE6dbQM7uQUzprHd
	I7Do+R4/vzVnW26ht3Zgn2GePOrRFvoLkunlscaHapwznhEZopGU20P2xaY0LQ==
From: Alexander Dahl <ada@thorsis.com>
To: devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: microchip: Move address/size-cells properties to SoC dtsi
Date: Tue,  4 Feb 2025 17:52:04 +0100
Message-Id: <20250204165205.2375940-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_085220_787281_34F889C2 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, open list <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Rosin <peda@axentia.se>, "moderated list:ARM/Microchip AT91 SoC support" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Avoids warnings with board dts files enabling ethernet-controller node
together with phy child node(s).

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---
 arch/arm/boot/dts/microchip/at91-dvk_su60_somc.dtsi    | 4 ----
 arch/arm/boot/dts/microchip/at91-sam9_l9260.dts        | 2 --
 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 2 --
 arch/arm/boot/dts/microchip/at91-sam9x60ek.dts         | 2 --
 arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi    | 2 --
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi  | 2 --
 arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts    | 2 --
 arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts  | 2 --
 arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts  | 4 ----
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts         | 4 ----
 arch/arm/boot/dts/microchip/at91-tse850-3.dts          | 3 ---
 arch/arm/boot/dts/microchip/at91-vinco.dts             | 3 ---
 arch/arm/boot/dts/microchip/at91rm9200.dtsi            | 2 ++
 arch/arm/boot/dts/microchip/at91sam9260.dtsi           | 2 ++
 arch/arm/boot/dts/microchip/at91sam9263.dtsi           | 2 ++
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi           | 2 ++
 arch/arm/boot/dts/microchip/at91sam9x5_macb0.dtsi      | 2 ++
 arch/arm/boot/dts/microchip/at91sam9x5_macb1.dtsi      | 2 ++
 arch/arm/boot/dts/microchip/sam9x60.dtsi               | 4 ++++
 arch/arm/boot/dts/microchip/sam9x7.dtsi                | 2 ++
 arch/arm/boot/dts/microchip/sama5d2.dtsi               | 2 ++
 arch/arm/boot/dts/microchip/sama5d3_emac.dtsi          | 2 ++
 arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi          | 2 ++
 arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi        | 2 --
 arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi        | 2 --
 arch/arm/boot/dts/microchip/sama5d3xmb_emac.dtsi       | 2 --
 arch/arm/boot/dts/microchip/sama5d3xmb_gmac.dtsi       | 2 --
 arch/arm/boot/dts/microchip/sama7g5.dtsi               | 4 ++++
 28 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-dvk_su60_somc.dtsi b/arch/arm/boot/dts/microchip/at91-dvk_su60_somc.dtsi
index 3542ad8a243ea..d72a97da900d2 100644
--- a/arch/arm/boot/dts/microchip/at91-dvk_su60_somc.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-dvk_su60_somc.dtsi
@@ -110,8 +110,6 @@ &can1 {
 };
 
 &macb0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
 
 	ethernet-phy@7 {
@@ -132,8 +130,6 @@ ethernet-phy@7 {
 };
 
 &macb1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
 
 	ethernet-phy@1 {
diff --git a/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts b/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
index 2fb51b9aca2ae..f62d5c92021ae 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
@@ -63,8 +63,6 @@ slot@1 {
 			macb0: ethernet@fffc4000 {
 				pinctrl-0 = <&pinctrl_macb_rmii &pinctrl_macb_rmii_mii_alt>;
 				phy-mode = "mii";
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "okay";
 
 				ethernet-phy@1 {
diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..9f26d9d25cab5 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -239,8 +239,6 @@ uart7: serial@200 {
 
 &macb0 {
 	phy-mode = "rmii";
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_macb0_rmii>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
index cdc56b53299d1..65e01bad1c8d4 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
@@ -311,8 +311,6 @@ &i2s {
 
 &macb0 {
 	phy-mode = "rmii";
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_macb0_rmii>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
index 8ac85dac5a969..38f67290bc7a0 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
@@ -84,8 +84,6 @@ kernel@200000 {
 			macb0: ethernet@f8008000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_macb0_default>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				phy-mode = "rmii";
 
 				ethernet-phy@7 {
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b31..dc6e21cd241bc 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -206,8 +206,6 @@ regulator-state-mem {
 &macb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_macb0_default>;
-	#address-cells = <1>;
-	#size-cells = <0>;
 	phy-mode = "rmii";
 
 	ethernet-phy@0 {
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts
index e4ae60ef5f8a0..2e7aa0c3b87ee 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts
@@ -139,8 +139,6 @@ spi0: spi@f8000000 {
 			macb0: ethernet@f8008000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_macb0_default &pinctrl_macb0_phy_irq>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				phy-mode = "rmii";
 				status = "okay";
 
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts
index 4bab3f25b855a..839716f8ab646 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts
@@ -147,8 +147,6 @@ flash@0 {
 			macb0: ethernet@f8008000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&pinctrl_macb0_default &pinctrl_macb0_phy_irq>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 				phy-mode = "rmii";
 				status = "okay";
 
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
index 5662992cf213e..6b977f8b5852d 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
@@ -132,8 +132,6 @@ vddana_reg: LDO_REG2 {
 
 			macb0: ethernet@f0028000 {
 				phy-mode = "rgmii-rxid";
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "okay";
 
 				ethernet-phy@7 {
@@ -201,8 +199,6 @@ i2c2: i2c@f801c000 {
 
 			macb1: ethernet@f802c000 {
 				phy-mode = "rmii";
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "okay";
 
 				ethernet-phy@1 {
diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 0f5e6ad438dd9..e7f79dd733beb 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -512,8 +512,6 @@ spi11: spi@400 {
 };
 
 &gmac0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gmac0_default
 		     &pinctrl_gmac0_mdio_default
@@ -532,8 +530,6 @@ ethernet-phy@7 {
 };
 
 &gmac1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gmac1_default
 		     &pinctrl_gmac1_mdio_default
diff --git a/arch/arm/boot/dts/microchip/at91-tse850-3.dts b/arch/arm/boot/dts/microchip/at91-tse850-3.dts
index 9d58a3931207e..cc902925c6545 100644
--- a/arch/arm/boot/dts/microchip/at91-tse850-3.dts
+++ b/arch/arm/boot/dts/microchip/at91-tse850-3.dts
@@ -264,9 +264,6 @@ &macb1 {
 
 	phy-mode = "rmii";
 
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	phy0: ethernet-phy@3 {
 		reg = <3>;
 
diff --git a/arch/arm/boot/dts/microchip/at91-vinco.dts b/arch/arm/boot/dts/microchip/at91-vinco.dts
index ecbdacf48708e..f2df2e9164a7c 100644
--- a/arch/arm/boot/dts/microchip/at91-vinco.dts
+++ b/arch/arm/boot/dts/microchip/at91-vinco.dts
@@ -129,9 +129,6 @@ timer@1 {
 			macb1: ethernet@fc028000 {
 				phy-mode = "rmii";
 				status = "okay";
-				#address-cells = <1>;
-				#size-cells = <0>;
-				status = "okay";
 
 				ethernet-phy@1 {
 					reg = <0x1>;
diff --git a/arch/arm/boot/dts/microchip/at91rm9200.dtsi b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
index 02a838541dc35..cafb62f1d64da 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
@@ -219,6 +219,8 @@ macb0: ethernet@fffbc000 {
 				pinctrl-0 = <&pinctrl_macb_rmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 24>;
 				clock-names = "ether_clk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/at91sam9260.dtsi b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
index 0038183e9a531..85cf1e8fa48ac 100644
--- a/arch/arm/boot/dts/microchip/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
@@ -634,6 +634,8 @@ macb0: ethernet@fffc4000 {
 				pinctrl-0 = <&pinctrl_macb_rmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 21>, <&pmc PMC_TYPE_PERIPHERAL 21>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/at91sam9263.dtsi b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
index b95d4016ae9f6..267db664deedb 100644
--- a/arch/arm/boot/dts/microchip/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
@@ -633,6 +633,8 @@ macb0: ethernet@fffbc000 {
 				pinctrl-0 = <&pinctrl_macb_rmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 21>, <&pmc PMC_TYPE_PERIPHERAL 21>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
index 157d306ef5c98..04e607951c299 100644
--- a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
@@ -750,6 +750,8 @@ macb0: ethernet@fffbc000 {
 				pinctrl-0 = <&pinctrl_macb_rmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 25>, <&pmc PMC_TYPE_PERIPHERAL 25>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/at91sam9x5_macb0.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5_macb0.dtsi
index 222aa30f68603..31b0e29bc8ec3 100644
--- a/arch/arm/boot/dts/microchip/at91sam9x5_macb0.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9x5_macb0.dtsi
@@ -50,6 +50,8 @@ macb0: ethernet@f802c000 {
 				pinctrl-0 = <&pinctrl_macb0_rmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/microchip/at91sam9x5_macb1.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5_macb1.dtsi
index 26bf9b5de9ee4..3ef5d4920b85a 100644
--- a/arch/arm/boot/dts/microchip/at91sam9x5_macb1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9x5_macb1.dtsi
@@ -38,6 +38,8 @@ macb1: ethernet@f8030000 {
 				pinctrl-0 = <&pinctrl_macb1_rmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_PERIPHERAL 27>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index b8b2c1ddf3f1e..dc2289685238f 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -1035,6 +1035,8 @@ macb0: ethernet@f802c000 {
 				interrupts = <24 IRQ_TYPE_LEVEL_HIGH 3>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -1044,6 +1046,8 @@ macb1: ethernet@f8030000 {
 				interrupts = <27 IRQ_TYPE_LEVEL_HIGH 3>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_PERIPHERAL 27>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index b217a908f5253..60d04c0a0b33f 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -971,6 +971,8 @@ gmac: ethernet@f802c000 {
 			clock-names = "hclk", "pclk", "tx_clk", "tsu_clk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
 			assigned-clock-rates = <266666666>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/microchip/sama5d2.dtsi b/arch/arm/boot/dts/microchip/sama5d2.dtsi
index 3f99451aef832..204976294ce6e 100644
--- a/arch/arm/boot/dts/microchip/sama5d2.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d2.dtsi
@@ -387,6 +387,8 @@ macb0: ethernet@f8008000 {
 					     <67 IRQ_TYPE_LEVEL_HIGH 3>;        /* Queue 2 */
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 5>, <&pmc PMC_TYPE_PERIPHERAL 5>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/microchip/sama5d3_emac.dtsi b/arch/arm/boot/dts/microchip/sama5d3_emac.dtsi
index 5d7ce13de8ccf..a202147e2dc3c 100644
--- a/arch/arm/boot/dts/microchip/sama5d3_emac.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3_emac.dtsi
@@ -41,6 +41,8 @@ macb1: ethernet@f802c000 {
 				pinctrl-0 = <&pinctrl_macb1_rmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 35>, <&pmc PMC_TYPE_PERIPHERAL 35>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi b/arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi
index 884df7a54dbb6..28771a1ea2355 100644
--- a/arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3_gmac.dtsi
@@ -71,6 +71,8 @@ macb0: ethernet@f0028000 {
 				pinctrl-0 = <&pinctrl_macb0_data_rgmii &pinctrl_macb0_signal_rgmii>;
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 34>, <&pmc PMC_TYPE_PERIPHERAL 34>;
 				clock-names = "hclk", "pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi b/arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi
index 362806afef44f..54e130da1914f 100644
--- a/arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3xcm_cmp.dtsi
@@ -46,8 +46,6 @@ timer@1 {
 
 			macb0: ethernet@f0028000 {
 				phy-mode = "rgmii";
-				#address-cells = <1>;
-				#size-cells = <0>;
 
 				ethernet-phy@1 {
 					reg = <0x1>;
diff --git a/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi b/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi
index 5d9e97fecf834..6f9dd98a708f2 100644
--- a/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi
@@ -126,8 +126,6 @@ &pinctrl_adc0_ad4_sleep
 			macb1: ethernet@f802c000 {
 				phy-mode = "rmii";
 
-				#address-cells = <1>;
-				#size-cells = <0>;
 				phy0: ethernet-phy@1 {
 					/*interrupt-parent = <&pioE>;*/
 					/*interrupts = <30 IRQ_TYPE_EDGE_FALLING>;*/
diff --git a/arch/arm/boot/dts/microchip/sama5d3xmb_emac.dtsi b/arch/arm/boot/dts/microchip/sama5d3xmb_emac.dtsi
index a5dd41cd9522d..16c3f2468fe09 100644
--- a/arch/arm/boot/dts/microchip/sama5d3xmb_emac.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3xmb_emac.dtsi
@@ -12,8 +12,6 @@ apb {
 			macb1: ethernet@f802c000 {
 				phy-mode = "rmii";
 
-				#address-cells = <1>;
-				#size-cells = <0>;
 				phy0: ethernet-phy@1 {
 					interrupt-parent = <&pioE>;
 					interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
diff --git a/arch/arm/boot/dts/microchip/sama5d3xmb_gmac.dtsi b/arch/arm/boot/dts/microchip/sama5d3xmb_gmac.dtsi
index d750da38ff3cc..fef978f0e0ea3 100644
--- a/arch/arm/boot/dts/microchip/sama5d3xmb_gmac.dtsi
+++ b/arch/arm/boot/dts/microchip/sama5d3xmb_gmac.dtsi
@@ -11,8 +11,6 @@ ahb {
 		apb {
 			macb0: ethernet@f0028000 {
 				phy-mode = "rgmii";
-				#address-cells = <1>;
-				#size-cells = <0>;
 
 				ethernet-phy@1 {
 					reg = <0x1>;
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a0..eac00084b4def 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -855,6 +855,8 @@ gmac0: ethernet@e2800000 {
 			clock-names = "pclk", "hclk", "tx_clk", "tsu_clk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 51>;
 			assigned-clock-rates = <125000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
@@ -865,6 +867,8 @@ gmac1: ethernet@e2804000 {
 				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 52>, <&pmc PMC_TYPE_PERIPHERAL 52>;
 			clock-names = "pclk", "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
 			status = "disabled";
 		};
 

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.39.5


