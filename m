Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3ECC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 05:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JLmMakORo/bjvYHh1BYejrDyt6i6mfqrJjTJJ0Tsbvw=; b=xOL7AE/TcO4I46LROewtT5pnt7
	OwWE1hzBy9/+Y+QrVIzWPo9zu3uTJcpQfyzr1L2sagIF9FCnpE2vciCB7xhRYJtYTmt2tFA+DWrry
	zVSyzO5AhcnXE8HbO7nNUtTY7wkm38jfpaVVZ7uHcBAiMBIFjBqbnCP/IYNchXFOcMFSo5645TmAG
	OeBeoKdgqAoOwj+7TrAaokBLxIAXND0css4XI7WAjFOldHt8zlYjD8mu+WBAd5IfKP/SZAmoowxYG
	lnv81fS3gK5Q+lKEpyJPWLG3GxP6qW8fYdA3AuF+OLsIsfWHEfOl4e4dRSlvA+KbeHyreJl3Y8XG8
	oT+gn9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7kP-0000000C39S-1rbW;
	Thu, 19 Jun 2025 05:23:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS7i9-0000000C2wh-35Zg;
	Thu, 19 Jun 2025 05:21:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6814043994;
	Thu, 19 Jun 2025 05:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750310473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JLmMakORo/bjvYHh1BYejrDyt6i6mfqrJjTJJ0Tsbvw=;
	b=HKuq5902ViCbbhOdChQM+LrEMpXkWrKsQymSO8dQbIzxyRYE3nw/7iYX8nU2WAzol1eLPZ
	Jg17EctvIU+nKZ8UkMdNSMPNnF6OYSNWJIMLa0eBr/TwttEZQSFIw+QOvLkHdjjkZpRTSu
	wHivS2Q82cxx2wPwsN4/EMqhUOMWe+uVShWQusutjUlnbBBJULy6D8SFUHjzujVq/4bP9Z
	uUCEDZZBW0E/zNT7K6YjVEKlvTdmnDtTBUgQ2l/QaAW1gXNEmxwhZm7V1aCZ0r7ONQILYN
	h/h9ycMQUWBRBcdbDzkbrYev9i6l7z9BMbE9SBhi1leNG9tbPR0TQHKsRwji5A==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Thu, 19 Jun 2025 07:21:05 +0200
Subject: [PATCH v2] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAECeU2gC/22MwQ7CIBAFf6XZsxggUKwn/8M0ppTVbqLQACGah
 n8Xe/Y48yZvg4SRMMG52yBioUTBN5CHDuZl8g9k5BqD5FLzXpyYy/Z2pzcmNpheadW8kAitXyP
 uQ8uvY+OFUg7xs18X8bP/XopgnKFWZjCTk2iniw0hP8kf5/CCsdb6BfW29wSkAAAA
X-Change-ID: 20250618-dtb_fixes-97645402512e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdegieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkefhvdelleeuhefgvdekveffieelhfeujefgtdejueelgfeltdefffehtddvfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopegludelvddrudeikedruddrvddtngdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohephhgvihhkohesshhnthgvtghhrdguvgdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_222118_543188_091DB013 
X-CRM114-Status: GOOD (  13.45  )
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

Fix a few issues in the panel section of the PinePhone Pro DTS:
  - add the second part of the Himax HX8394 LCD panel controller
    compatible
  - as proposed by Diederik de Haas, reuse the mipi_out and ports
    definitions from rk3399-base.dtsi instead of redefining them
  - add a pinctrl for the LCD_RST signal for LCD1, derived from
    LCD1_RST, which is on GPIO4_D1, as documented on pages 11
    and 16 of the PinePhone Pro schematic

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
Small fixes to the PinePhone Pro DTS to fit bindings and
suppress warnings at build.
---
Changes in v2:
- Added the pinctrl definition for GPIO4_D1/LCD1_RST
- Incorporated Diederik de Haas' suggestion for defining mipi_out
- Squashed multiple patches into one
- Link to v1: https://lore.kernel.org/r/20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 33 +++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 04ba4c4565d0a205e2e46d7535c6a3190993621d..98aba146749998dd5a798aabed0fe844c474d1cf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -463,29 +463,18 @@ &io_domains {
 };
 
 &mipi_dsi {
-	status = "okay";
 	clock-master;
-
-	ports {
-		mipi_out: port@1 {
-			#address-cells = <0>;
-			#size-cells = <0>;
-			reg = <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint = <&mipi_in_panel>;
-			};
-		};
-	};
+	status = "okay";
 
 	panel@0 {
-		compatible = "hannstar,hsd060bhw4";
+		compatible = "hannstar,hsd060bhw4", "himax,hx8394";
 		reg = <0>;
 		backlight = <&backlight>;
-		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
-		vcc-supply = <&vcc2v8_lcd>;
 		iovcc-supply = <&vcc1v8_lcd>;
 		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_reset_pin>;
+		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vcc2v8_lcd>;
 
 		port {
 			mipi_in_panel: endpoint {
@@ -495,6 +484,12 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pmu_io_domains {
 	pmu1830-supply = <&vcc_1v8>;
 	status = "okay";
@@ -507,6 +502,12 @@ pwrbtn_pin: pwrbtn-pin {
 		};
 	};
 
+	lcd {
+		lcd_reset_pin: reset-pin {
+			rockchip,pins = <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		red_led_pin: red-led-pin {
 			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>


