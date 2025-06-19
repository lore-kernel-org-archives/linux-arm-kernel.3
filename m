Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADCEC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4b6fZr2VMMz3/qDr3fr5aVwvCWvwNN5h4Y+j1H/iSs=; b=qCtTr72DSvkpCZa+7J7c+FpyOU
	GufuUtrfK5lkjaOWVDr6WLf8CbM+q5pu6ZsEXcsBTdBPMS5YCKnbXqgosC8JFPv8c5b0TuuZYyx9H
	kif77sVqbE5VdFYXT9cb8WSKNVmOkY2BSVRBEDD4Kpt8pTlHbrls9sRImGZ7w7doY9XkHcp7qMFkf
	zUriFk4P3cJSyoutYDUZHuaoYT577Ytv0s+wEfeZXLfW1NdmbQvUWrAlMW67Msvlq7oGSEYhHEJ2y
	2u98O08IPuLr8pNFkFLEBU1nsGPzLrsjmGRmItIq2ZQOXrIRaM2/hZxdmat+aHaKJElYSyTuRC+Rp
	1UK6F/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDM-0000000E0JZ-1mMu;
	Thu, 19 Jun 2025 18:42:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJ5b-0000000Dn3N-41mR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5714361C6B;
	Thu, 19 Jun 2025 17:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661DDC4CEF2;
	Thu, 19 Jun 2025 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354214;
	bh=wCB6x+x+rj6RDpHRZY4HD76LxIfQ6M7f4ACdL/qmmIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbGvVzdHbUtWcUe5zogrNMWHrikLfYW7CiqIm9magQRZamU51Bz3bIPrs08YON8eY
	 MsAoHl/0ZxMBtYfxmP6gpDhQOGriw/kmXXA70phtpov5VunsRmNKxK4LpDzO9J2KUs
	 muXcN51nqvp3hfBVBnrahfk9Gno1ozMskt+/8FJJ4jA0KU9FJFIWA01jg2PbsHs2Wh
	 V/39gC/0Kv1CkQi7eqNEp9DzlEj4Gv+wDi3nvH9DXvJbZMK24FRalFsKC+9lm0myg0
	 NUKXryWBH3zpxt1b8vE1r7Gc9VOjGliFOeYVzmI2oosATVZhuPMWY7aYCoTHzIxCut
	 dFUoH07Ie8DmQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 23E095FF4F; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 2/5] arm64: dts: allwinner: a523: Move mmc nodes to correct position
Date: Fri, 20 Jun 2025 01:30:04 +0800
Message-Id: <20250619173007.3367034-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
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

From: Chen-Yu Tsai <wens@csie.org>

When the mmc nodes were added to the dtsi file, they were inserted in
the incorrect position.

Move them to the correct place.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 126 +++++++++---------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 8b7cbc2e78f5..458d7ecedacd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -181,69 +181,6 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
-		mmc0: mmc@4020000 {
-			compatible = "allwinner,sun55i-a523-mmc",
-				     "allwinner,sun20i-d1-mmc";
-			reg = <0x04020000 0x1000>;
-			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
-			clock-names = "ahb", "mmc";
-			resets = <&ccu RST_BUS_MMC0>;
-			reset-names = "ahb";
-			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&mmc0_pins>;
-			status = "disabled";
-
-			max-frequency = <150000000>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			cap-sdio-irq;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
-		mmc1: mmc@4021000 {
-			compatible = "allwinner,sun55i-a523-mmc",
-				     "allwinner,sun20i-d1-mmc";
-			reg = <0x04021000 0x1000>;
-			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
-			clock-names = "ahb", "mmc";
-			resets = <&ccu RST_BUS_MMC1>;
-			reset-names = "ahb";
-			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&mmc1_pins>;
-			status = "disabled";
-
-			max-frequency = <150000000>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			cap-sdio-irq;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
-		mmc2: mmc@4022000 {
-			compatible = "allwinner,sun55i-a523-mmc",
-				     "allwinner,sun20i-d1-mmc";
-			reg = <0x04022000 0x1000>;
-			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
-			clock-names = "ahb", "mmc";
-			resets = <&ccu RST_BUS_MMC2>;
-			reset-names = "ahb";
-			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&mmc2_pins>;
-			status = "disabled";
-
-			max-frequency = <150000000>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			cap-sdio-irq;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
 		wdt: watchdog@2050000 {
 			compatible = "allwinner,sun55i-a523-wdt";
 			reg = <0x2050000 0x20>;
@@ -449,6 +386,69 @@ its: msi-controller@3440000 {
 			};
 		};
 
+		mmc0: mmc@4020000 {
+			compatible = "allwinner,sun55i-a523-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04020000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			status = "disabled";
+
+			max-frequency = <150000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			cap-sdio-irq;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc1: mmc@4021000 {
+			compatible = "allwinner,sun55i-a523-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04021000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc1_pins>;
+			status = "disabled";
+
+			max-frequency = <150000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			cap-sdio-irq;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc2: mmc@4022000 {
+			compatible = "allwinner,sun55i-a523-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04022000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC2>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc2_pins>;
+			status = "disabled";
+
+			max-frequency = <150000000>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			cap-sdio-irq;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		usb_otg: usb@4100000 {
 			compatible = "allwinner,sun55i-a523-musb",
 				     "allwinner,sun8i-a33-musb";
-- 
2.39.5


