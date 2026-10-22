Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11602606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LXehCjzz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rW6OAwvX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Dwv67Dio
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+ulViqmN/gERqSfWWEq4zOnz42D6WlhHjq94c4ttf9o=; b=LXehCjzzCYuLqb
	dDDyy8hy1YHOIES5do6WRgdyiaTAW+oMbtEcaOQE2edO2CPMlPcMHdv/Lo+kZGSWNcAo9dIF1QHpl
	CpaWfmfSseMqKYZg9x2+Nmh26Y2b6LFP0KU/CLTexp17OKxEd2/3f1aJoPtxrX9W9MGMZ0LJAlm/H
	QVjBcJZwnWEOC2pVi4f84TERFCQEJQwMLHwiZ/mcOxDC4txPoSxkF32wVWfxeAygerj/DPLpGRUo8
	LOY1zuPzzw6ayMEG2owofUMbutw0v4baCZ0DXnfKPtuo3NCgksI+pI9y1I//5+o63sD2cV0VfjE5J
	UvRTVDzR2fGGu0hSw8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4w-0000000ELLg-10ws;
	Thu, 22 Oct 2026 14:47:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4p-0000000ELIl-31bR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 14:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+ulViqmN/gERqSfWWEq4zOnz42D6WlhHjq94c4ttf9o=; b=rW6OAwvXpIUVRMKDltB+5iADfw
	jNM5lVLy9zjTmrPbRFkPAHhN0galc6vxvwg0MfZOCF+yjFnf3U0POfskv11EjbiBoh8NslkUBpi1Y
	PE6HXXJizhD/gvEN+w7wJ4LzKLolfqYd0i2GInPLB+JRyg4gilBPaX/b7DD7ZIGbxDmt0iGtzS5LL
	rx+RJxCKPdgrJk8ay8cgXAwHb7w+MtYjW8Tf9YfRvISG4m9w6YU/4nbYEBYFT0H8VNxrSeLmF0Vdp
	FasbR+F/cPgXPglYf8D5Qz/9stehpdpc25LQYsuwhhpGXX/sSHtZBENTfOW1p1bSTb+NjhSxEpWlh
	rj0+U1kw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4G-00000007Kq9-1q9Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:47:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e0d1da913so897046f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680413; x=1793285213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ulViqmN/gERqSfWWEq4zOnz42D6WlhHjq94c4ttf9o=;
        b=Dwv67DiolL/xvkN3dYtf71FAC8F7Fzr4rTVaX/wY5zmIxheFMQE4Qf4FQvooePfyjl
         wElNIRYmaRLt1Kgiw7PCCG8Md7xL0ASdsVqPO4kGAaFkd0wRv/Gy1m/QOTuuAuAC7WpG
         laTEqr8DArpIEamVSaSQcPp2kHe3X/M4EU7jTX9amWSyzMyIzka0WFNZAR2Wyu5s8f1G
         JegmhBFGi4dz/aMJcnBccC7AHCX76vVL4JFdBsOv5hmEO0t7JHtsEFW1xcPFxU+j9UFI
         6o7VGFuWi7HJQxDqlZndxuDFtUICnNT1BjHKvJzHk6Il25VsNolPWEvZt3syWFnmh3HL
         0aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680413; x=1793285213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ulViqmN/gERqSfWWEq4zOnz42D6WlhHjq94c4ttf9o=;
        b=vGdqppqjR3HJsSJ07UfPUhcmnblT9zO1rs7LELr/bBFMjt/iualxLk5OGOQPZ2/PoJ
         oeot6SrnsEli6lWNRdF2YUq4WNdz5W14Rl6WKafXCWb5xDH9lsHcvZtUaql30Jutafr4
         ValebuiGxN5fE8em0sV+dBWycWSChXUgKLAyPtNiwOTfubQuBaZ8/bkYgxkGcK5lSc9x
         PqbHcdncYuRKrGgqsiDu8PB9UXU5tGOYfdVm6U6gv+7krqJ61rR/oVuYuVbtZlc6heNO
         fL8UubNyfkycuYXtr+w0jHnGxGfj7wmJ4vBJJI0Smzahocs3ioR20Y6NiZj+gUm8c4fN
         9+bg==
X-Forwarded-Encrypted: i=1; AKwUvBzxD9DJRtLKr+wnZyY7l+OrXCkYuV+cLD7HpiuOuoAYeqjVPm1Y1JrpADWhsWn9qx67ily70lVNAuLTJz6zITzm@lists.infradead.org
X-Gm-Message-State: AFq9FYIE8xUqP7gAD1PAEKEGX7ZOmOU8xQcAxwDdJEj0ISlCVv4Xlnu8
	dwlQD//6RiDCyliFmxVWXnu2YCcbCA8Qa6QVTY8jzCBzL7WuoZmW71FzOjQ4kMfP
X-Gm-Gg: AYBFou2MBKXKBs8CR/Y/pqs5+yLIID6bvD2Syz3RViuWGWT3sy6XqRJIwiztYdq18tx
	zeislosVY2/5ZSNns8/B04V74LBZZh7Se0urDzIzC65aqoGQiszlA4fGA1MSPpuBrvH+TaY8HNV
	89cVQzYjW9uZTBTE0bCKy5RSd684udfGrgzvZwe4+Iz9XcItcaNTG6oX5O8Ib34vMSWidGR8gnM
	sWh7bySIeFafJbO9kPuRsOGb7usrv2yXAVLSmayaiqGQl3va1fwHIEEl+f2LmrHH3rxTqLnSOyK
	yxDqIt7gIJhkVmU83Z0+hLiJxWDiK5gH4Lg0k8alGN3fg016WUyF32mwnOoHyhDIhHWNCVj5UAE
	w+Yd4z0BofZwGMVB0bjeh7lIIK5c2j+o5MqnbOBWJAyriFFm7xD2TZpZICtcxKwHFudTSSJqLHi
	fiosbPGQpmyqWrYmCw5HqxTWcNP/iX+4E7MNXsnUngxPXK4ZUdYGY2Gt0xfDpTtLjcra9rkk1up
	/1QsOr1tWOx8RI9V4dJI/keQAgiHo30rQIrRhYwwiIGYI1s15b5pT2JVynuOY/Z0uDME4wlwt3L
	8tg6FqNIJlXG3p+hqroQkCOuX2nC5/XhwMIV0T0OXTK9qm4g994+L7M=
X-Received: by 2002:a05:6000:298e:10b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-48e2d102e96mr4094255f8f.8.1792680413276;
        Thu, 22 Oct 2026 07:46:53 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:46 +0200
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-3-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_154703_253242_5D5E475F 
X-CRM114-Status: GOOD (  15.11  )
X-Spam-Score: -0.2 (/)
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

Add device tree overlays for the current 27 MHz and legacy 24 MHz
Toradex OV5640 camera modules connected to CSI0 and CSI1 on the SMARC
Development Board.

CAM_n_CON_PWRCTRL (pin 24) is an active-high power-up input of the
camera module, so it is described as an active-low powerdown GPIO.

The overlays are also combined with the SMARC Development Board device
tree to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 17 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 5 files changed, 197 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..2defe77ee7df 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -709,11 +709,28 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640.dtbo
+
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
 imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..7e6991b95dec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi0-ov5640.dtso"
+
+&clk_csi0_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
new file mode 100644
index 000000000000..23b155beec2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi0_ov5640_osc: ov5640-csi0-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM0 */
+&smarc_csi0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi0_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_0_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi0 3 GPIO_ACTIVE_LOW>;
+		/* CAM_0_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi0 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi0_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi0_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi0_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi0_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi0_to_smarc_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f6bfc3d49f5e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi1-ov5640.dtso"
+
+&clk_csi1_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
new file mode 100644
index 000000000000..d78f46a764f8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi1_ov5640_osc: ov5640-csi1-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM1 */
+&smarc_csi1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi1_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi1 3 GPIO_ACTIVE_LOW>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi1_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi1_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi1_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi1_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi1_to_smarc_csi_rx>;
+			};
+		};
+	};
+};

-- 
2.43.0


