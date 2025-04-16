Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D378FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGdIgps2l2D9seU19dnTd6NwpZVe1Er3vyb7f/YrKII=; b=1XIwph4JnVIt+XkLuMe92oCknz
	xIxHS9HNb086CskemyzNvXpLiW34NqW0hiD3UBCWVIDX5PaGtajZPwPf8M19Dhwc6PvD3iC2Y8GxG
	bbWH9/M9C7PMEUBccXjUcL9Z5T7fHJ4tDomQ4LNaYqo+noGRGW05UqyqYGrGOywZgcsaUaH68sDfX
	szgwyHFS993uTzPzu0q05QkVmXYo7/HjevP/TmCH1u0K076gIAc43lknujFEvfQq7jwG2Rr+bMgpc
	BxUcjZ6MWV+6XwRnZpnrf7Oqw5JJS6demCxd2HDE3ybfX2VMqsz0i/um6A51lZtVTx4PtxnQvyP1b
	eBt5fISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Biv-0000000B6Mg-0ajg;
	Wed, 16 Apr 2025 22:59:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BZg-0000000B5BQ-2iKn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 22:49:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 777AF1515;
	Wed, 16 Apr 2025 15:49:41 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD2503F66E;
	Wed, 16 Apr 2025 15:49:41 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: allwinner: h616: enable Mali GPU for all boards
Date: Wed, 16 Apr 2025 23:48:39 +0100
Message-ID: <20250416224839.9840-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250416224839.9840-1-andre.przywara@arm.com>
References: <20250416224839.9840-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_154944_770771_B1DC7DF2 
X-CRM114-Status: GOOD (  11.40  )
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

All Allwinner H616/H618 SoCs contain a Mali G31 MP2 GPU.

Enable the DT nodes for that GPU, and specify the regulator providing
power to the VDD_GPU pins of the package. The rest of the DT node is set
by the SoC, so is not board specific.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts      | 5 +++++
 .../boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi      | 5 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts       | 5 +++++
 .../boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi     | 5 +++++
 .../arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts | 5 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 4 ++++
 .../boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts     | 5 +++++
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 5 +++++
 10 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index 17e6aef67aaf9..7906b79c03898 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -79,6 +79,11 @@ &ehci0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &ir {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
index d12b01c5f41b6..bebfeb2a337a3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
@@ -67,6 +67,11 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dldo1>;
 	/* Card detection pin is not connected */
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 908fa3b847a66..a8644fb52b04e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -77,6 +77,10 @@ &emac0 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index a360d8567f955..f2e3300e078a9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -24,6 +24,10 @@ &emac0 {
 	phy-supply = <&reg_dcdce>;
 };
 
+&gpu {
+	mali-supply = <&reg_dcdcc>;
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdce>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 968960ebf1d18..085f3e4e8eaa8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -50,6 +50,11 @@ &ehci2 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdcc>;
+	status = "okay";
+};
+
 &ir {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
index e92d150aaf1c1..3f416d129b727 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
@@ -10,6 +10,11 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index a0fe7a9afb77c..b340bbcb710de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -69,6 +69,11 @@ &ehci1 {
 
 /* USB 2 & 3 are on the FPC connector (or the exansion board) */
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &mmc0 {
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
 	bus-width = <4>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index e1cd7572a14ce..c51d4d9120dee 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -27,6 +27,10 @@ &ext_rgmii_phy {
 	motorcomm,clk-out-frequency-hz = <125000000>;
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+};
+
 &mmc0 {
 	/*
 	 * The schematic shows the card detect pin wired up to PF6, via an
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index f828ca1ce51ef..efe0faa252f5e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -69,6 +69,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &ir {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 7e17ca07892dd..f1efaf6d06831 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -197,6 +197,11 @@ &ehci0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	disable-wp;
-- 
2.46.3


