Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F421C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXM0gp7zPynxLOxNv4NRH/tQVVI4C+xmwY2ZDoncdyY=; b=yxicPfDZs1dNHrVs6voFk4H4FT
	zm15a1D1HUXleT9m8CBF2Q96/KvlKrKLXbbdpCSaPi2g36U1PvLW7z3ITIXKAffSPIqU1FXkARuEJ
	4P7sbddSYsUbj0M5rB3BIGCSicLiVCNwg7TcnvhhIhwJTy4YmsQf7SPGXyNpqaTmtH5iZTxMhaXjB
	t87UnhaA/Wqg0G4WbO1kfZw9akPNvwSg4R0NocZNSmHDS7eFzhM+pC+/043mSi1HU8GFofNkl6vtb
	ymSM/Ebk/4gSckHBwVH4hBp5Tnc9CUKZ5BREDYI/hHiH33cNGz5bJZqh+ws7MR3POEvAVVM13wySf
	CZoRPF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRyF-0000000CfZZ-0ECW;
	Thu, 03 Jul 2025 21:59:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOkE-0000000CF4w-0zis
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 18:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71007A539EC;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5E7FC4AF0B;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=twKLCDvgvJ4N3es1zViUdUytVpc1yuuskuyBdmZ+9lY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R9uvwg7H/tZrWUiU2XNSphV19N7RZhq3VTIpr7RkePXVvXiuqfSjEbdEzy1u3/L8b
	 BFLr0DNU/yhCT7/1IUGjYrZD/H05T7tEsS0jatIK1XXfmfDWAUPuGGBDy8c23cOExj
	 99fYWcPpD/ie3wppt3cOBlDSeYIDsq3Hr+XpZ2pZ6oILdUhX5+oqPnhX2yZNxn9iKM
	 cDxSZ9sAdczy71F/0yRRIpGi10PELYcwYHEwGh61oXrPqdUz1J0KtPNjV7NBnE43JE
	 TwJk1hGaFpCJt7EdrJ0AVHb6dA0HIynhRAO3yFkVg9dZmdIUzqjuQ8/ajijWxBMs1n
	 aLjKhv9aeVDcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1BBC83F05;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Thu, 03 Jul 2025 14:33:09 -0400
Subject: [PATCH v2 4/4] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx8qxp_pcam-v2-4-188be85f06f1@nxp.com>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
In-Reply-To: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=3715;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xrlatQtLaiuinBwAmL4cEzL3pNe437Uvr/YWmYMVyX4=;
 b=OrYhgbxp0mxYiuvD4zwpejFQ9E/eldojxDR2ZfCT44z4t7F/rAzD6h8/JvNn4OeWKbkLfnHiQ
 jMyCzGG8e6aCOEQMci3BgiDtLjGFLAEhTs1FhhzET3OdH5wncSPru8A
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_113314_439880_1F2C08D6 
X-CRM114-Status: GOOD (  13.88  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI and parallel mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- move ov5640 part to overlay file
- rename to imx8qxp-mek-ov5640-parallel.dtso
- remove data-lanes
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../dts/freescale/imx8qxp-mek-ov5640-parallel.dtso | 82 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 02ef35578dbc7e05b35b781dbfca0f0bc124ead1..25787fc7143f36301f8b334d4b0d84d543e1f320 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-parallel-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-parallel.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-parallel.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-parallel.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-parallel.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e184a5beb5c835e6801495ae2adc3b14cfcde2e5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-parallel.dtso
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+
+&cm40_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "xclk";
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_2v8>;
+		DOVDD-supply = <&reg_1v8>;
+		DVDD-supply = <&reg_1v5>;
+		pinctrl-0 = <&pinctrl_parallel_csi>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_pi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&parallel_csi_in>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_parallel_csi: parallelcsigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
+		>;
+	};
+};
+
+&isi {
+	status = "okay";
+};
+
+&parallel_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_csi_in: endpoint {
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1



