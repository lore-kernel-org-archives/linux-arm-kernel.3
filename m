Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D0AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yWsn+0ExQhNkbOckP8lZ46/MNjGbRxU3ZFiybZARrc=; b=2nG8QrgRJ40/tp5/jE3QAkkQOh
	Ixc6t5pJolX5mIWXiiM7VcJi8e9HKajMgc2kpNfJ/7qzzm9Be17lfW9MupseTlAhaObucf/QIe6Lp
	Kw6pF7LL1e04QCjHIgHlPQhoADrMyRXQYhEj4OYyn5PMiaHSiceDuJxGvGtvn71XqLtUQ1fDUhXu+
	hj/9Lhm86vnb4a/vhomHs+x4kT5yGCwgdmxE+gc7kycX9f8YveEmzOs0IadZ+92i8lWPIukwIsqeO
	5rzt+7Iy9oW5aIQXhaZqCGfaF8WAO+SjW6NTo5YfOLpjpHTROAsvvv6g2YSevNYoE4dI0L8QkPb3L
	lT2K9FIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVNb-00000009gPz-25Rg;
	Wed, 25 Jun 2025 19:01:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPzu-00000008lhc-1PQT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 13:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A51B61785;
	Wed, 25 Jun 2025 13:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81D9C4AF09;
	Wed, 25 Jun 2025 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857424;
	bh=bRr/5nBVNTrO8h20FoPhHm0wRk96HyeoMwIQD4LmilM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k++/2pzAGuY4XdUVV8YAqUHG2uxVs4d9ZCHK82L+bB0W50e04qc6lcpiQfnVenQNh
	 yckW3BuZy9cXoG18Db6m5qQAB925pd+zfbEHFuu35UwK3929/pKQBDGmZRRgbWp2zN
	 Wk8Ixx6u1BlyQMqKvSk296ltnMOFho3SIgAdKPge34Rpd+zckdRd7tsWqBcHQip5QA
	 W21UkbwKpOc56N3/4x6EZEMkTnxwP67HjmSk/tXm6xK41WL+q1mRhA95T3nckRZVdS
	 IkA3AlYHb/ujGaWRCYRq4QUT+u2Mj+VQYhCFpSQlX0k61vGKevF6dFtNgmsW1kztFL
	 riqE1hn3lu6iw==
Received: by wens.tw (Postfix, from userid 1000)
	id 5DFE05FF19; Wed, 25 Jun 2025 21:17:02 +0800 (CST)
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
Subject: [PATCH v2 2/5] arm64: dts: allwinner: a523: Move mmc nodes to correct position
Date: Wed, 25 Jun 2025 21:16:49 +0800
Message-Id: <20250625131652.1667345-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131652.1667345-1-wens@kernel.org>
References: <20250625131652.1667345-1-wens@kernel.org>
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
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


