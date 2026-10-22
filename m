Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E76606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g1c/ctaZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J7K1um42
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BCyMFzGkZTUeeg+gfaW4ejgXMtcsKjsZDaaqWxXwkfU=; b=g1c/ctaZqulgY5
	VG1JFdzWmFz71RgM7vtfwOxL/WUeOsBJr3gWXCxND3QY9s+Y4CqR7SVtc47SgYbA/InOMopTvFrSi
	2cqGRDSjjtiAYdqKj+hPaZOAuFuycYwdFgnwwrz2EGv6adXmv4VnbYwRcWodkjtprLitH5N1EAiMR
	Lq8inWGAMfseodFPZ7Ug4COZcjDUIRsxK26nX3saS6IPWT1gXI7m4hAGjynaSRYTeDVDU5l5JpVbo
	TmHUxnNgxtNkENgpBDm06tc0dgZfoYQHXBJqO7lhOfDlKPCYDp9GLchOmHDeoDp5d0vdsz7URQdWq
	IOHXEFP3+uLDoWARU3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtpT-0000000EIkY-1Aof;
	Thu, 22 Oct 2026 14:31:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtpN-0000000EIhY-1eDY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:31:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so14920705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679491; x=1793284291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCyMFzGkZTUeeg+gfaW4ejgXMtcsKjsZDaaqWxXwkfU=;
        b=J7K1um42Fbf1ZqidaCh6qmK2bsk2vjD9ycioCAewpw6Lr5YW5svcOxPzo+6DevWRgE
         3nlV4FEE2QRAWQ+aYhh/UqB0HWVQHLIE3zGxRWxAGOpGAlKRkCiMvvFJyufvD4vLvWaW
         woRJTrRlFmSte1Dj0ujNr/IhGPL696FkaNi/P1BrS7ZGyIgjUqbUmFo0U53o/wlSrhvo
         ewXP4tSGal5B6gPIT0lGKjwdfL6qAy0CAbmFwGDKVxThrGoM+tVixk0A2DTIloDI31el
         QydAWDbAM5BMVT69V/q13Q0gGgrwRVN67RMRtNYSx6gQme+8Qd9uXJWU/HzLVLM/efLg
         9dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679491; x=1793284291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCyMFzGkZTUeeg+gfaW4ejgXMtcsKjsZDaaqWxXwkfU=;
        b=wcPxinh5GvrrYfdF5SHCxhXZyJQYofqAnA/In/+nwH+ctMSo1WN8e+pbrIEdQSj1IC
         C/sQ4l54wBtHdbZPJtKlEr/05Rox+/BRPb0wr+tGHy7xGhRa66zYFIvewohoK+9p0KnK
         oo3h2nv0CcTU4V3xTWymCtOQ4/njn61o7jK8Z3pfB88JdfLO7qTyZorW7vSFZEsVoSMJ
         ay4MLeZKNdPy5deFsHX/oE4daW5QjdUHsE8Hsxa6o1FuAk5h4TJM4put9fy/ltlCUC3e
         ppugWJ+1+sc3G3ttLZQSNIsXQ3y+3Olei8L7CWcmpng+33r4dWsLDJtmio3eed1UU/6w
         VjHg==
X-Forwarded-Encrypted: i=1; AKwUvBx6DDlR1bQvk9XDDCQAkC+nqzj25uwtSgqde/7tJAVegg7do8Z8lgsvBQa+3mA/or5Bqg1yZBKfb069P4/qGEzr@lists.infradead.org
X-Gm-Message-State: AFq9FYLOerPubwD6YcAaIG5FHodWi+pM6do6olswuWM2cD+/LcAeFSUv
	WWQz+Ls4Z8BwtfAtHnwQp/IW2F6NTgm+STJMsv9shcqtvcEFws+twNnV
X-Gm-Gg: AYBFou3V9sRKhBvHqw16zdwIULxPTlz6vmmF8dI+HNem9zMjh4A34opwB0LJtnU5ZNy
	V43gbSn6E6qDobOgV3zEMXWUQsNPhTMqflHL8MAd2AgiZIQptq15bkzmEVWWW8WAnRFuF/6o4L8
	BLp4PVhynzDhwmWqyiFYTZnSPp4iNd5i93ao5Z4vGfix3zeQGFDhHnlgAcADdQp/oiRuora/pab
	BKOjg35ZvuwI2IohyNyFCsgL6c8RKiOtcSuVNj08PXHqpE7WmLeur4IBHpGrezQwSuQa+1SQI2w
	U6odobBbSejEbWtJ53CrG+bmEmSG93o35HpEtiC+zHMGup2/1FtkZN1LqEejaQjHwB9Y3/XQtfN
	BR2vY1SnN/h1eNB181F+l9ITwwnv2AmDVWYC3iRZhn/iDdcRYsoJ5CjgcG/EBJOICbTsuujI+E7
	H+pmpXELdBXoBjc816kY4vldY9CokSyBDnTNejZky9JEATyon7sGItyLPI8gz9FzhmLMNzP4cum
	6Ny3hTsc6k2JE79NrHQT/IBX8k22HG1h6IlQKdfYbaZZqhaS6UPEXaIEtYX74PK047oQMDzlLAq
	IttBxSuuSwUw93krD9z1owQQj//BWtq13fIIu6HriSWUlgMGVhDkqKdRAUDRFgMEDy23LWfNNJv
	L
X-Received: by 2002:a05:600c:34c4:b0:4a2:1a:a10a with SMTP id 5b1f17b1804b1-4a2001aa275mr103308895e9.29.1792679491166;
        Thu, 22 Oct 2026 07:31:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:27 +0200
Subject: [PATCH v3 3/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 shared OV5640 overlays
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-3-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_073133_492314_429672BF 
X-CRM114-Status: GOOD (  14.54  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The current and legacy Toradex OV5640 camera modules use the same connector
on Verdin iMX8M Mini and Verdin iMX8M Plus. Keeping SoC and carrier GPIO
references in the overlays would require a separate camera description for
every combination.

Use the connector nexus and stable CSI_1 media labels to describe the
camera once. Keep separate variants only for the current 27 MHz and legacy
24 MHz camera oscillators.

Build both DTBOs for installation and compose each with the two Verdin
Development Board DTBs to validate the module integrations.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 11 +++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 4 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..5ce923d87072 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
 imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
@@ -275,6 +277,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
@@ -296,6 +300,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
@@ -737,12 +743,17 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mp-verdin-wifi-dev-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..af77c065c3c2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..39204a14f0d0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_ov5640_osc: ov5640-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	reg_ov5640: regulator-camera {
+		compatible = "regulator-fixed";
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		gpios = <&verdin_camera_connector 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&verdin_csi_capture {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&verdin_csi_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+		clocks = <&clk_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_ov5640>;
+		DOVDD-supply = <&reg_ov5640>;
+		DVDD-supply = <&reg_ov5640>;
+		/* CAM_1_CON_PWRDWN, pin 22 */
+		powerdown-gpios = <&verdin_camera_connector 1 GPIO_ACTIVE_HIGH>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&verdin_camera_connector 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_verdin_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&verdin_csi_rx_in>;
+			};
+		};
+	};
+};
+
+&verdin_csi_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			verdin_csi_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_to_verdin_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
new file mode 100644
index 000000000000..332811f53743
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <27000000>;
+};

-- 
2.43.0


