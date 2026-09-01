Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D76C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=16wkGkGjtMZJK0egYytkz9YHSnlvfQ9XYjKckJktAqc=; b=M9uxObEgxpGS6FhK687ZMTbqnu
	WEttH/E+pgkVbga7aQgIblL/Lvjy0+/csPUw7CHlDZ1+D7OBmaoTORW/UXMzugj0vKPv8eCLKwjRL
	cBOQ/hQgGZgvW3pGHcGqOXrhh5WUL83I0bKasdUYwvIPMhOcb3AwIFDnEoKEVuKUKu/6/+LneYBpB
	svJsPzw7JEbqd3pmlKQexrqjN8T3K9dLmCIqzKG9n2wcRTVs9SuqdgM7n71beJhikwa/uhGSmW3jw
	5sZkswNsk8hcWAPfVgFnANJA5dszFZJo1FIjP/R8t2qyk60CP57QWnSgYVPb/25Srh051HOFMSt5M
	XtousVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nvu-0000000C8cf-0NRP;
	Tue, 01 Sep 2026 12:49:46 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Nvq-0000000C8be-3zzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:49:45 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1671E1F94F;
	Tue,  1 Sep 2026 14:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788266975;
	bh=16wkGkGjtMZJK0egYytkz9YHSnlvfQ9XYjKckJktAqc=; h=From:To:Subject;
	b=Tw02IMJZ6jzXen+J6UQZpvw655/oHpgiVUqUrMiVYUbvf6dP6zo0JeDXSi5b3Inws
	 5OqRZpl8mN9abu1KnrutKWp/ZEvy9s+NhEWu9LaOqDis3Ls50vIr3QPaCw66MS3YUO
	 D8TtZSMM0Rf8LVHK7ILDHXaYr8fp38R7dycWkyfuutoJwjLsZljSx1cleEcJ5bnbyM
	 W9nictGWcDSqmJ84f1Bd98ztPyYPW67kwO1G2FNWgy+Z+x4iprmy092kJTXvzz3bto
	 uSZtldAPjzK1lnqOA8ab7gtlLJA1Oz/O0yBdzETyPgLzggOHuD9K1Kyv+t8P41rPzy
	 8O+odu53Ncp9w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx7d-colibri-emmc: Add VGA overlay
Date: Tue,  1 Sep 2026 14:49:20 +0200
Message-ID: <20260901124921.78635-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_054943_895649_811D28C9 
X-CRM114-Status: GOOD (  15.09  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX7 parallel
RGB LCD interface. The VGA output is driven through a non-programmable
video DAC without VESA DDC I2C signals to a DVI connector.

The overlay is also combined with the Aster, Evaluation Board v3, Iris
and Iris v2 carrier board device trees to provide ready-to-use DTBs.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
this patch is on top of https://lore.kernel.org/all/20260723105225.194366-1-francesco@dolcini.it/
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 21 +++++++
 .../dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   | 59 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index e9f95c3b8353..d1272104ef27 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -436,18 +436,39 @@ imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo
 
+imx7d-colibri-emmc-aster-vga-dtbs := \
+	imx7d-colibri-emmc-aster.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
+imx7d-colibri-emmc-eval-v3-vga-dtbs := \
+	imx7d-colibri-emmc-eval-v3.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
+imx7d-colibri-emmc-iris-vga-dtbs := \
+	imx7d-colibri-emmc-iris.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
+imx7d-colibri-emmc-iris-v2-vga-dtbs := \
+	imx7d-colibri-emmc-iris-v2.dtb \
+	imx7d-colibri-emmc-vga.dtbo
+
 dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
 	imx7d-colibri-aster.dtb \
 	imx7d-colibri-emmc-aster.dtb \
 	imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-aster-vga.dtb \
 	imx7d-colibri-emmc-iris.dtb \
+	imx7d-colibri-emmc-iris-vga.dtb \
 	imx7d-colibri-emmc-iris-v2.dtb \
 	imx7d-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-iris-v2-vga.dtb \
 	imx7d-colibri-emmc-eval-v3.dtb \
 	imx7d-colibri-emmc-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx7d-colibri-emmc-eval-v3-vga.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-vga.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
 	imx7d-colibri-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
new file mode 100644
index 000000000000..cda214c13876
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcdif_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lcdif_out {
+	remote-endpoint = <&vga_enc_in>;
+};
-- 
2.47.3


