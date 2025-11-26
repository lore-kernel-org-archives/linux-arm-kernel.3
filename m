Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4FD1118B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWslL5MJAu1ktwPaDyDYlweDV4/0Xu50P9NpGLLvPzI=; b=12Wh9OmkFSQUh3yb5zqruUQAAg
	QND8JMCmG1HzBOmDe0dFkYI1GO0lVDQnzCVmIrKYQZH0AR8sJ1fQ6S4NqEOFSS3wnwW3mhPlT4Fk9
	LLfYBaGEByoBeFlHUHw3hAj3pQU4Qj4hNy+uooqB9AOYPPLkrnM+apw1ModireOZc+kEKVNDcxPsU
	nB/BEZeTu1c+XpQuZ82qqXxwoSwrVkdScDMM2DtQ9usfdDhqZ0B9PGK+ajo3mi9+zGi5X0/9wyTXm
	1+WMlBsuzp8lp7Tk6PnVzr1WLrH070XinSxGS/K5v2KgrLyF5iojUx9w2Fvp23QF8NMbqLp2feyvQ
	Kyu8JeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJSF-0000000FOwD-3a4I;
	Wed, 26 Nov 2025 17:37:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJRx-0000000FOhc-2wLu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:37:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4AA1B4E418DB;
	Wed, 26 Nov 2025 17:37:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8B060721;
	Wed, 26 Nov 2025 17:37:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E28F4102F22D9;
	Wed, 26 Nov 2025 18:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EWslL5MJAu1ktwPaDyDYlweDV4/0Xu50P9NpGLLvPzI=;
	b=urmWOWiOCRBQAaoKMUKHRNe7j5UlKQhDEabtHMlCvM1TGAhlLuB+6X45QYYWZNSKGwwm69
	l3PZTZjW3W6qIfDfh/qnPs3VW+hLmQ+MfuadSI3knL03/q0LZ1eM5N8kx7JkuyjppmOTc8
	b9GVdtvZ6b20OoB/85QkDEDzmcDujK+oYN24M5A/fLSuGuVdh4NdEhYkUc5WnuO2mqggJa
	3vEk7KOmZQGFpmcX15aegIJY2/WRrOq6pQDQMhlUyw8G5TttJqc7qvbarJ9o2r7csdbJ/H
	Jy8lJW2nADY63oCd7wPItAFFyEpdjeh5fWz6eH8nur/0b2LUpJAJZv24W/wh8Q==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:48 +0100
Subject: [PATCH 06/21] dt-bindings: display: tilcdc: Remove panel binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-6-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_093706_039271_FFED3224 
X-CRM114-Status: GOOD (  13.47  )
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

Remove the deprecated ti,tilcdc,panel binding which violates devicetree
design principles by placing display controller configuration
(DMA burst size, FIFO thresholds, AC bias, etc.) inside the panel node
instead of the controller node where it belongs.

This non-standard binding has several critical issues:
- Mixes controller-specific hardware parameters with panel properties
- Lacks the standard port/endpoint graph for panel connections
- Cannot work with the standard DRM panel infrastructure
- Forces vendor-specific binding instead of reusable panel-dpi binding

The tilcdc driver has been updated to work with standard DRM panels and
bridges, and all in-tree users have been migrated to use the generic
panel-dpi binding with proper port/endpoint connections. Controller
parameters like fifo-threshold are now correctly specified in the
tilcdc node itself.

While removing bindings is exceptional, keeping this binding would:
- Perpetuate incorrect devicetree design patterns
- Require maintaining a non-standard panel driver solely for tilcdc
- Block proper integration with the DRM panel subsystem
- Prevent devicetree reusability across different display controllers

This removal completes the migration to standard DRM panel bindings.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 .../devicetree/bindings/display/tilcdc/panel.txt   | 66 ----------------------
 1 file changed, 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
deleted file mode 100644
index 808216310ea27..0000000000000
--- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Device-Tree bindings for tilcdc DRM generic panel output driver
-
-Required properties:
- - compatible: value should be "ti,tilcdc,panel".
- - panel-info: configuration info to configure LCDC correctly for the panel
-   - ac-bias: AC Bias Pin Frequency
-   - ac-bias-intrpt: AC Bias Pin Transitions per Interrupt
-   - dma-burst-sz: DMA burst size
-   - bpp: Bits per pixel
-   - fdd: FIFO DMA Request Delay
-   - sync-edge: Horizontal and Vertical Sync Edge: 0=rising 1=falling
-   - sync-ctrl: Horizontal and Vertical Sync: Control: 0=ignore
-   - raster-order: Raster Data Order Select: 1=Most-to-least 0=Least-to-most
-   - fifo-th: DMA FIFO threshold
- - display-timings: typical videomode of lcd panel.  Multiple video modes
-   can be listed if the panel supports multiple timings, but the 'native-mode'
-   should be the preferred/default resolution.  Refer to
-   Documentation/devicetree/bindings/display/panel/display-timing.txt for display
-   timing binding details.
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-- enable-gpios: GPIO pin to enable or disable the panel
-
-Recommended properties:
- - pinctrl-names, pinctrl-0: the pincontrol settings to configure
-   muxing properly for pins that connect to TFP410 device
-
-Example:
-
-	/* Settings for CDTech_S035Q01 / LCD3 cape: */
-	lcd3 {
-		compatible = "ti,tilcdc,panel";
-		pinctrl-names = "default";
-		pinctrl-0 = <&bone_lcd3_cape_lcd_pins>;
-		backlight = <&backlight>;
-		enable-gpios = <&gpio3 19 0>;
-
-		panel-info {
-			ac-bias           = <255>;
-			ac-bias-intrpt    = <0>;
-			dma-burst-sz      = <16>;
-			bpp               = <16>;
-			fdd               = <0x80>;
-			sync-edge         = <0>;
-			sync-ctrl         = <1>;
-			raster-order      = <0>;
-			fifo-th           = <0>;
-		};
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: 320x240 {
-				hactive         = <320>;
-				vactive         = <240>;
-				hback-porch     = <21>;
-				hfront-porch    = <58>;
-				hsync-len       = <47>;
-				vback-porch     = <11>;
-				vfront-porch    = <23>;
-				vsync-len       = <2>;
-				clock-frequency = <8000000>;
-				hsync-active    = <0>;
-				vsync-active    = <0>;
-			};
-		};
-	};

-- 
2.43.0


