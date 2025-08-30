Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D65DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tulqcgl5E7xddxV0QVa8ixoBhbEOneG+ZJlK77Ah9ws=; b=TlUOCW1w4KxAMIBpuwV4kc3eBc
	QZR9HJZPzkVMC4IhlwM2tYKUYgxzG5woIPFtQYQCIpi9J6W19fBsjxoe1Al14Z/5MwAB6Gb7RDhb0
	yry3Ut9lfucilP/LXFEoqIut2MBCgzfFw1V7SKLQpoVh/WvECuiuPesdpRBflNJpIOH8rGtx/V2M5
	M02/YJkRsCX/YRhuLijukfWmXpv5fCjZJSFszMKnfqc/3S6bfGQURJmj68OhLCoon5J5T5n4Z05z/
	OHRiH/nDEfz/QB+IBhDjPRRxVf9Zox0T1lMLYEwkCQcIWTKNd1HMx0NbcqWYdNXDR4Pe2K5MEC8jj
	02sMg7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIJm-00000007hVc-16Iv;
	Sat, 30 Aug 2025 09:56:18 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIBd-00000007gfl-21qN;
	Sat, 30 Aug 2025 09:47:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=Tulqcgl5E7xddxV0QVa8ixoBhbEOneG+ZJlK77Ah9ws=;
	b=pRJcNI9Bf3JFnHaLbwbeD3wmPJuWGF28HTy9SE5rduqMknD9IRlAKj2CKOEihWgf8Vv0oi9ANybSoR7UMmAlya/CGd1TvG2hG3vwFET2GDFodGNsuQKG8KfgtipyuSfZgRSNKJ7Zm8c9p2fMWZIh19Ba+RUlh39YKm6qawq7nF8=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Sat, 30 Aug 2025 11:47:39 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube Systems Nagami SoM
Date: Sat, 30 Aug 2025 11:46:54 +0200
Message-Id: <20250830094700.1715658-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830094700.1715658-1-lukas.schmid@netcube.li>
References: <20250830094700.1715658-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_024753_809352_94F8CE42 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

Added the following pinctrl's used by the NetCube Systems Nagami SoM
  * i2c2_pins
  * i2c3_pins
  * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
  * spi1_pins, spi1_hold_pin, spi1_wp_pin

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb028d..c00996d6275c 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -78,6 +78,36 @@ dsi_4lane_pins: dsi-4lane-pins {
 				function = "dsi";
 			};
 
+			/omit-if-no-ref/
+			i2c2_pins: i2c2-pins {
+				pins = "PD20", "PD21";
+				function = "i2c2";
+			};
+
+			/omit-if-no-ref/
+			i2c3_pins: i2c3-pins {
+				pins = "PG10", "PG11";
+				function = "i2c3";
+			};
+
+			/omit-if-no-ref/
+			i2s1_pins: i2s1-pins {
+				pins = "PG12", "PG13";
+				function = "i2s1";
+			};
+
+			/omit-if-no-ref/
+			i2s1_din_pins: i2s1-din-pins {
+				pins = "PG14";
+				function = "i2s1_din";
+			};
+
+			/omit-if-no-ref/
+			i2s1_dout_pins: i2s1-dout-pins {
+				pins = "PG15";
+				function = "i2s1_dout";
+			};
+
 			/omit-if-no-ref/
 			lcd_rgb666_pins: lcd-rgb666-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
@@ -126,6 +156,24 @@ spi0_pins: spi0-pins {
 				function = "spi0";
 			};
 
+			/omit-if-no-ref/
+			spi1_pins: spi1-pins {
+				pins = "PD10", "PD11", "PD12", "PD13";
+				function = "spi1";
+			};
+
+			/omit-if-no-ref/
+			spi1_hold_pin: spi1-hold-pin {
+				pins = "PD14";
+				function = "spi1";
+			};
+
+			/omit-if-no-ref/
+			spi1_wp_pin: spi1-wp-pin {
+				pins = "PD15";
+				function = "spi1";
+			};
+
 			/omit-if-no-ref/
 			uart1_pg6_pins: uart1-pg6-pins {
 				pins = "PG6", "PG7";
-- 
2.39.5



