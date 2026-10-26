Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W6F9wGVA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ClSoIIVD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=; b=W6F9wGVA5sR0OAWvPijN/DOsTP
	w1hd+R0xYptwdnfhLj40IoBbg6xVwX0N5bH6ilLPA8wlopuDZmOKqffV/dGoQGh0ocdBxOAB7NP7T
	u8zDxo5xcV1ZBlA/w8UyThVJXc7TdIxsDUPD3f6O8ZfmVEwAG7DIU2rIZt03hcLYJA6x5nzbSjW9w
	Ta0KrrKjIM9OUxZMArsjHG+Yd89ldzBW4YV4K7+j8+AGGYVmrRI5XcTa2iES2DpCXGiX2guBFfsGo
	3k/e8YaxPrkvQZZWu8H3S6xgs8R3WfBvNwA6W32eYUhYrmHE+DnX//QdTGW4M19/aVbsMdurXXs7U
	5I5zSxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHis-00000002FA8-3kqf;
	Mon, 26 Oct 2026 10:14:34 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHip-00000002F9k-27zv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:14:32 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so839933137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 03:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009670; x=1793614470; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
        b=ClSoIIVDQ+WOjl1Wm/EtuhnBnDgsHJ4fgPT1EcRFTvEUQb8+XFutBWrVZQN5dDQN60
         aYPSDFiTIAOPYBS4eGvrcg6wGIlqg8qxRyBnvuZP45PWIGp+qF7N4W3zTeEugPtXBp97
         Qa83KXYCI3wgHIYNqMfovKqHvERVU9u+cHzg0WfXdX9SCOjbGKbyxeLWvKcw1YGcdWpb
         rCIrVdSTZ718mgwhHrHPnL0/W3i9Ro04eJjQ1S8ESowqIU7U/8lNMXfQvz/O/VFQVJ9q
         wajVpFaGXEus4XVQDZYYuVKVmIzgQMz04gt64mFmgjp2Zh6RcqLGWulXOX71uKTgeajK
         CuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009670; x=1793614470;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYT4qnsyxafx/l9LYQg7BsWMfeGrcGwjTkvojDxY8FU=;
        b=PGYhFujGseS0cydSA0vBCHOjIthv27WLlrE+ECnVpYbn+MnABrOREzYTd2aoard3aZ
         JrlBL2nQ1epw42kt11tJPUvmtjy4gVNfeo7kmf0ly1ir0AnyNaaMuakmf37cPmJeiBQY
         c4wdpzXz/i51j57I6C/0bgCmSHoO39zpYtLFQr80TpLs6EK0d7hdq+Y7fC1JLiZaIwAb
         8W+C4mmCVcRgTGK+WSTxixhvvehi1+VrYkOh3DvICrwtOIB8+b4lKk9krfIsP+U4HPDk
         TRuRp4qE11OpLIpPqoyccye7h5b00IX0XFXuH5OafZnjCYU1AodPuo6R+ZBsOa0e+fTV
         VAaw==
X-Forwarded-Encrypted: i=1; AKwUvBwjePvqKnz+OpEN24mZuC6MPHCV7lUEl2uAV+R79ND/nz0/E0V6aEaCQfb8IPLnBojItXvSyS8L/5k0tdN6NVJr@lists.infradead.org
X-Gm-Message-State: AFq9FYKm1s36lZbvEdnpGm0Z9cLbGM2YU9LABnUDZZlnDhNLKqqnyyLK
	vhqtZfF67UtDSQoTsGemIczy3Ec92vHyaCIj9GMzbl4YTi4RWijYLtlh
X-Gm-Gg: AYBFou2c+RKP0uX6oDAg5FhvbiE4sAzuxAz28lGCUXDGbgTvOvklyPl/+xdKC3SyWGf
	FjBbsc8peQxz1X9um3c5OH88Mo+4H/Zvg/UyFAy14Pot8T9uLUjyHRFjQTWXSQZWCEdoh36H0pn
	Gi0px4gjj2avNf9JeFXpKwIazgmmT+wxMElSvWXBuS8o2k7tBWby9eW7CqoZaQ8AyNTSkgbCoRu
	oFaIiz2m6/fSxXF/bc5145LjjV0IMnixgFCzsC4rQg9GQWVRZcVXWiGaFPt7fZUNHSyVfinZT1v
	6UMrzdxPNhWdZo0knjB+lqDB1hmMdAUqvco2EidAaNMc8CGq677Tda3V/EATtqmFzdENY6I/dva
	paxJXpI0ls/Rv5I0TSrtJ0+CbguR+f6BJuihXI/zszsvs8jULuI14XUv4TeaPE6CIUqVjpCQiw2
	6fKIwY1oZ+XlV3SjbnH9Az5euY7DtW+kSmwSJJonQbitRm4IPPEbcVC8jVrYDxUmO92ndbk4G6v
	SBilYG0bvmJp9+Kac4wgL8y4FIvZfr2na7HYuUFBiOdo7XEPQOC2RHETjLX
X-Received: by 2002:a05:6102:14a3:b0:7cc:28a6:ee1c with SMTP id ada2fe7eead31-7ce5ca1e4bbmr1849285137.2.1793009669485;
        Mon, 26 Oct 2026 03:14:29 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234a940bsm7549112e0c.15.2026.10.26.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:14:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 26 Oct 2026 07:13:26 -0300
Subject: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v1-1-9e8bef9b13ba@toradex.com>
X-B4-Tracking: v=1; b=H4sIAMYn32oC/x2OywrDIBBFfyW47oBa6OtXSheDM7aCxjATxBDy7
 5XszoED9+5GWRKreU27EW5JU52HuMtkwg/nL0Oi4cZbf3PWO2gOUArQqhCFWQPm0ZT+KAusVZC
 4gxaUAEgEuZECJV0ybgq1sZyA/n7lp+UYiMyYWoRj6ueN9+c4/vIXLsyWAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793009661; l=6126;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=u/Bc4IIPj0XbmMSFY+ai/Y9DOy3qq0yjkSExtBotmVo=;
 b=ngMwqUQ/9OTzcsZpCu5XUiDjMR13gCY0595b6OwqVq/NkcYBWAZmNTzQanHzpmbIfM0DI6wPU
 IKQK1q/A2iYC9tHaZUn4HP43EazzxqVp322urQ7zglp1IkpShilGAym
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_031431_578766_8BF1D15D 
X-CRM114-Status: GOOD (  16.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
V2 on the Toradex SMARC Development Board LVDS0 interface. The panel is
an Opto Logic SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is
provided by an ILITEK ILI251x capacitive touch controller.

The overlay is also combined with the Toradex SMARC Development Board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
This change depends on other patch series, and should be applied after
it:

- https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com/T/#u

  Adds the other overlays for SMARC iMX8M Plus. This series is required
  because it adds the 3.3V power regulator used in the panel node. It's
  also needed for the patches to apply cleanly.
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 +
 ...radex-smarc-panel-cap-touch-10inch-lvds-v2.dtso | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1310b34178e5..94d39af8b8c9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -715,9 +715,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -729,6 +731,8 @@ imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-torade
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
+imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-v2-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 000000000000..0235aa1acbac
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch controller
+ * to J49.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_RISING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+};

---
base-commit: 4aeb54e451181c68bb1135f761281b6391fcb5a5
change-id: 20261021-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-a273e90efcdd

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


