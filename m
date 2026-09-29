Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4188FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbCtCdN41oUeQDzmeeAwIL8Ae/PndxFH3eQau/EA3HQ=; b=dVOwq0hxFjElT8BqjOebI9NL55
	KAvIN1vnse/vF04YbF9a/S80tYzhtjV58ecBEnKqQx7pSMHdkNa1lC/wLi+HmRzU3x3DysLswUCVz
	XQrV6UhiVw0Z9ZpTZ54b0kFYFDqRemo2BNXzP/02nfJb4k/DTp1SCTyDBTbxuiyZrTsPgYfiHRKOu
	GuBkMIIOyLSAJciu8CWK44gsRU4vJDHMDbWzG54pba76QkVcVMJE+xbRJmma2lYakrtgdCyVHuLsV
	8i+3DpNf/WBBHr6MBz4JKB0H/JboMIO0CAWxXsE3RmJiD7+o2zhk4zASAx6NRaIKQ7vPWQjUpV+AO
	vH/Sd3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTyw-00000002wrE-16Z9;
	Tue, 29 Sep 2026 09:18:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTyn-00000002wob-2Bu7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 09:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fbCtCdN41oUeQDzmeeAwIL8Ae/PndxFH3eQau/EA3HQ=; b=nNdKO9yZkht5ujCjOn3h293Y3v
	fr2thPNct/RmKUooHsnZuwbuHDIa1nb0SzzirR4CDJe+Rqt+pVROLpSxXd2ZY6s6KL2b6q6aWHtAK
	GY9K1p4S1HYz+/4DtDiSZvBKynOIQ3SAtl5tzQZlCvs6LL39XlPXavhcDz1st7tosVnr7sXoispOM
	jBBlclFgfuu10uUjLTgAehgFxa5ghucgmx90V6xJEDIILkOzMPZgu1t4fj9ZSnOlr0mGJ41rtn39H
	u9qnSDSVyD7XfrvQgPI7WKJidlftfA670yAb2JfdhcUhfdAl0/GxvBKz9p+5ahpMfBZtvDh0aLCFA
	B6uxiS0w==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBTyj-00000002PQk-3cF0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:18:28 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so24420245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673504; x=1791278304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbCtCdN41oUeQDzmeeAwIL8Ae/PndxFH3eQau/EA3HQ=;
        b=WT9MQFGw+1EmYaIJRiBENjt3gbu9ltjsSgiahYC+oKmY3DI4vOES0WCtxT+0u4HtvD
         ufLlLE8y9/KDvLTTchq++9bjFpUsiGZ2xNaW82Vz1sFY0G/38zGOOPZrTPu1AsJwLuS1
         pRsyDgBZnU3JiDyrvMTpccWw1HJxFkzDNUhhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673504; x=1791278304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fbCtCdN41oUeQDzmeeAwIL8Ae/PndxFH3eQau/EA3HQ=;
        b=T+bkEAuWG7xg0a3uUj/V3+y1CgrZtgA5ID/7/VW2FhGaYHmBRXvfKqussGy0EbBcgo
         UQhTtdnk9Lw/UCgTJ0NpM/Od0CI7Pvq753SCk3vA3OMT7SVS5iAgyFp2epMXdLBLIwhR
         0s8SpieLmTwEqPC6Cgk17kBsiNbZcO2b29AvGDzUuQ163AeyNYinI97tpk89t6BRGWkU
         0xNOqnEKj3a8O/Pr0gAtM4WT17wgaRM8evWkvInmUWSWXpddgJYuUW5vPUd2//N70bS5
         TaQKHvx+tsGm/eZUUqxc8mPQ1W5OA5nwBfmNdFY20oc9uucbTzruDlSt5kS/f8M6Fe8/
         Wxvg==
X-Forwarded-Encrypted: i=1; AKwUvByOUbEqznUPJpcNGMmyvsZzR/rhGzHRRNyMVOY+q2hsFeJ3ao4H+iPUvAZV2/NULR1WOgWtzxG5NeETV01MaP4j@lists.infradead.org
X-Gm-Message-State: AFuF++nbVaHOFxiQI8FHbYKFJ+5vWn0ZuRndExnUoI3wyl43EYq9dEMh
	14bSdzxRqQ1JH/iIUrjhio7vUZ04X+gjFlmA+TwjeWIr1ucCHYF46vKkz1RBMUQ56BA=
X-Gm-Gg: AYBFou3v/OrP9tLgG28OvtwhYn/ZZ4MwBuQBIK0eIk2aZcbHLm12ohuz3fdcrtZ8RGT
	sv7OHpYx9LLotxEou0vgBoTQMczs5ry7wiSP7+BGpxTfooH2CHLxW/RshB1zfzflsVsFaaxC4w2
	qiZ26q9bImw9wl20nNvf2exk2rV5tGzD3Pa1QmrkhOc22iTnWKsxM4NRdyf+WyteGCLVIN14uSm
	VpSb5UMmpAuvBGRxlQz0TUP/ofsj6n5fTRX385ls3AZUZ9I4x6f71foQhW7ZgWs5+NZrGFalH3w
	zQqL7INBe7H3pqVXQRWWhFa96cLpXPPpYfAnUR4jMKGkmekYZGNtEwVDYKk88XvWCFnqPYpxBar
	LJmfLeg0QtpTgM10yH/M6JRXIFlF+0u/qbknuet9wcBPThVYOPjMnOsPjhhUvGa/G2R/zGLWXrf
	IFzHH3xB2xf+SXv1PvGKfoxcybbENyyIkLeO0TwK0uk2PfuD68Rz8za7G9aeKvKMMPdLK/ckG8E
	zwHOKdYgyu0kdw=
X-Received: by 2002:a05:600c:1d0a:b0:4a0:4cd:7e1d with SMTP id 5b1f17b1804b1-4a004cd886amr76626455e9.8.1790673503618;
        Tue, 29 Sep 2026 02:18:23 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:23 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Date: Tue, 29 Sep 2026 12:18:10 +0300
Message-ID: <20260929091811.3735201-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929091811.3735201-1-petko.manolov@konsulko.com>
References: <20260929091811.3735201-1-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_101826_641375_158758F7 
X-CRM114-Status: GOOD (  20.34  )
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

This one adds the DT for the two variants of M48 that are based on
imx6q and imx6dl.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 5 files changed, 495 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..44b393256235 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -220,6 +220,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-dms-ba16.dtb \
 	imx6q-ds.dtb \
+	imx6q-draeger-m48.dtb \
+	imx6dl-draeger-m48.dtb \
 	imx6q-emcon-avari.dtb \
 	imx6q-evi.dtb \
 	imx6dl-b105pv2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
new file mode 100644
index 000000000000..45809770d16f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *  Based on work by Russell King
+ *
+ *  Device Tree file for Drager M48 Board
+ */
+
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+/* PAD config disabled in imx6qdl-draeger-m48.dtsi by setting value to 0x80000000
+ * PAD configuration register must not be 0, so it is set to 0xfff
+ */
+#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x768 0xfff 0x000 0x000C0000 0x0
+#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x788 0xfff 0x000 0x00000200 0x0
+#include "imx6qdl-draeger-m48.dtsi"
+
+/ {
+	model = "Draeger M48 i.MX6 DualLite";
+	compatible = "draeger,imx6dl-m48", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
new file mode 100644
index 000000000000..1266b8451fa1
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *
+ *  Device Tree file for Drager M48 Board
+ */
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+/* PAD config disabled in imx6qdl-draeger-m48.dtsi by setting value to 0x80000000
+ * PAD configuration register must not be 0, so it is set to 0xfff
+ */
+#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x790 0xfff 0x000 0x000C0000 0x0
+#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x7ac 0xfff 0x000 0x00000200 0x0
+
+#include "imx6qdl-draeger-m48.dtsi"
+
+/ {
+	model = "Draeger M48 i.MX6 Quad";
+	compatible = "draeger,imx6q-m48", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
new file mode 100644
index 000000000000..bcfe7b2556cb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *  Based on work by Russell King
+ *
+ *  Device Tree file for Drager M48 Board
+ */
+#include <dt-bindings/clock/imx6qdl-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+&iomuxc {
+	m48 {
+		pinctrl_m48_uart1: m48-uart1 {
+			fsl,pins = <
+				MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA 0x1b010
+				MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA 0x1b010
+			>;
+		};
+
+		pinctrl_m48_hdmi: m48-hdmi {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA 0x1b0b0
+				MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL 0x1b0b0
+			>;
+		};
+
+		pinctrl_m48_lvds: m48-lvds {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_A22__GPIO2_IO16 0x1b010 /* DISPLAY_EN */
+				MX6QDL_PAD_EIM_A20__GPIO2_IO18 0x1b010 /* BACKLIGHT_EN */
+				MX6QDL_PAD_EIM_A18__GPIO2_IO20 0x1b010 /* DISP0_CONTRAST */
+			>;
+		};
+
+		pinctrl_m48_i2c2: m48-i2c2 {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL3__I2C2_SCL 0x4001b820
+				MX6QDL_PAD_KEY_ROW3__I2C2_SDA 0x4001b820
+			>;
+		};
+
+		pinctrl_m48_i2c2_gpio: m48-i2c2_gpio {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL3__GPIO4_IO12 0x1b820
+				MX6QDL_PAD_KEY_ROW3__GPIO4_IO13 0x1b820
+			>;
+#define GP_I2C2_SCL <&gpio4 12 GPIO_ACTIVE_HIGH>
+#define GP_I2C2_SDA <&gpio4 13 GPIO_ACTIVE_HIGH>
+		};
+
+		pinctrl_m48_i2c3: m48-i2c3 {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_D17__I2C3_SCL 0x4001b820
+				MX6QDL_PAD_EIM_D18__I2C3_SDA 0x4001b820
+			>;
+		};
+
+		pinctrl_m48_i2c3_gpio: m48-i2c3_gpio {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_D17__GPIO3_IO17 0x1b820
+				MX6QDL_PAD_EIM_D18__GPIO3_IO18 0x1b820
+			>;
+#define GP_I2C3_SCL <&gpio3 17 GPIO_ACTIVE_HIGH>
+#define GP_I2C3_SDA <&gpio3 18 GPIO_ACTIVE_HIGH>
+		};
+
+		pinctrl_m48_usdhc3: m48-usdhc3 {
+			fsl,pins = <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD 0x1B060
+				MX6QDL_PAD_SD3_CLK__SD3_CLK 0x1B060
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x1B060
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x1B060
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x1B060
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x1B060
+				MX6QDL_PAD_NANDF_CS1__SD3_VSELECT 0x1B060
+			>;
+		};
+
+		pinctrl_m48_enet: enetgrp {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL1__ENET_MDIO 0x1b0b0
+				MX6QDL_PAD_ENET_MDC__ENET_MDC 0x1b0b0
+				MX6QDL_PAD_RGMII_TXC__RGMII_TXC 0x13018
+				MX6QDL_PAD_RGMII_TD0__RGMII_TD0 0x1B018
+				MX6QDL_PAD_RGMII_TD1__RGMII_TD1 0x1B018
+				MX6QDL_PAD_RGMII_TD2__RGMII_TD2 0x1B018
+				MX6QDL_PAD_RGMII_TD3__RGMII_TD3 0x1B018
+				MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL 0x13018
+				MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK 0x1b0b0
+				MX6QDL_PAD_RGMII_RXC__RGMII_RXC 0x13030
+				MX6QDL_PAD_RGMII_RD0__RGMII_RD0 0x1B030
+				MX6QDL_PAD_RGMII_RD1__RGMII_RD1 0x1B030
+				MX6QDL_PAD_RGMII_RD2__RGMII_RD2 0x1B030
+				MX6QDL_PAD_RGMII_RD3__RGMII_RD3 0x1B030
+				MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL 0x13030
+				MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII 0x80000000
+				MX6QDL_PAD_CTL_GRP_RGMII_TERM 0x80000000
+			>;
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_m48_i2c2>;
+	pinctrl-1 = <&pinctrl_m48_i2c2_gpio>;
+	scl-gpios = GP_I2C2_SCL;
+	sda-gpios = GP_I2C2_SDA;
+	status = "okay";
+
+	eeprom_mac: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_m48_i2c3>;
+	pinctrl-1 = <&pinctrl_m48_i2c3_gpio>;
+	scl-gpios = GP_I2C3_SCL;
+	sda-gpios = GP_I2C3_SDA;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_m48_uart1>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_m48_usdhc3>;
+	non-removable;
+	fsl,wp-controller;
+	status = "okay";
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_m48_enet>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@0 {
+			reg = <0>;
+			rxc-skew-ps = <1380>;
+			rxd0-skew-ps = <0>;
+			rxd1-skew-ps = <0>;
+			rxd2-skew-ps = <0>;
+			rxd3-skew-ps = <0>;
+			rxdv-skew-ps = <0>;
+			txc-skew-ps = <1860>;
+			txd0-skew-ps = <0>;
+			txd1-skew-ps = <0>;
+			txd2-skew-ps = <0>;
+			txd3-skew-ps = <0>;
+			txen-skew-ps = <0>;
+			status = "okay";
+		};
+	};
+};
+
+&hdmi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_m48_hdmi>;
+
+	display-timings {
+		native-mode = <&hdmi0>;
+
+		hdmi0: hdmi {
+			clock-frequency = <65000000>;
+			hactive = <1024>;
+			vactive = <768>;
+			hback-porch = <220>;
+			hfront-porch = <40>;
+			vback-porch = <21>;
+			vfront-porch = <7>;
+			hsync-len = <60>;
+			vsync-len = <10>;
+		};
+
+		hdmi1: hdmi-1280x800-24@60 {
+			clock-frequency = <71000000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hback-porch = <80>;
+			hfront-porch = <48>;
+			vback-porch = <14>;
+			vfront-porch = <3>;
+			hsync-len = <32>;
+			vsync-len = <6>;
+		};
+
+		hdmi2: hdmi-1366x768-32@60 {
+			clock-frequency = <72000000>;
+			hactive = <1366>;
+			vactive = <768>;
+			hback-porch = <80>;
+			hfront-porch = <48>;
+			vback-porch = <14>;
+			vfront-porch = <3>;
+			hsync-len = <32>;
+			vsync-len = <5>;
+		};
+	};
+};
+
+&ldb {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_m48_lvds>;
+
+	lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,default-data-width = <24>;
+		status = "okay";
+
+		display-timings {
+			native-mode = <&timing0>;
+
+			timing0: 1920x1080-32@60 {
+				fsl,dual-channel;
+
+				/* LVDS split mode */
+				clock-frequency = <71190000>;
+
+				/* pixclk /2 */
+				hactive = <1920>;
+				vactive = <1080>;
+				hback-porch = <60>;
+
+				/* left * 2 */
+				hfront-porch = <60>;
+
+				/* right * 2 */
+				vback-porch = <30>;
+				vfront-porch = <3>;
+				hsync-len = <60>;
+
+				/* hsync * 2 */
+				vsync-len = <17>;
+			};
+
+			timing1: 1366x768-32@60 {
+				clock-frequency = <72000000>;
+				hactive = <1366>;
+				vactive = <768>;
+				hback-porch = <80>;
+				hfront-porch = <48>;
+				vback-porch = <14>;
+				vfront-porch = <3>;
+				hsync-len = <32>;
+				vsync-len = <5>;
+			};
+
+			timing2: 1280x800-24@60 {
+				fsl,data-width = <18>;
+				clock-frequency = <71000000>;
+				hactive = <1280>;
+				vactive = <800>;
+				hback-porch = <80>;
+				hfront-porch = <48>;
+				vback-porch = <14>;
+				vfront-porch = <3>;
+				hsync-len = <32>;
+				vsync-len = <6>;
+			};
+
+			timing3: Tianma_1280x800-24@60 {
+				fsl,data-width = <18>;
+				clock-frequency = <67254000>;
+				hactive = <1280>;
+				vactive = <800>;
+				hback-porch = <5>;
+				hfront-porch = <27>;
+				vback-porch = <2>;
+				vfront-porch = <26>;
+				hsync-len = <32>;
+				vsync-len = <6>;
+			};
+
+			timing4: 1024x768-24@60 {
+				fsl,data-width = <18>;
+				clock-frequency = <65000000>;
+				hactive = <1024>;
+				vactive = <768>;
+				hback-porch = <160>;
+				hfront-porch = <24>;
+				vback-porch = <29>;
+				vfront-porch = <3>;
+				hsync-len = <136>;
+				vsync-len = <6>;
+			};
+
+			timing5: 800x600-32@60 {
+				clock-frequency = <40000000>;
+				hactive = <800>;
+				vactive = <600>;
+				hback-porch = <120>;
+				hfront-porch = <40>;
+				vback-porch = <28>;
+				vfront-porch = <13>;
+				hsync-len = <80>;
+				vsync-len = <4>;
+			};
+
+			timing6: 800x480-32@60 {
+				clock-frequency = <25000000>;
+				hactive = <800>;
+				vactive = <480>;
+				hback-porch = <8>;
+				hfront-porch = <8>;
+				vback-porch = <8>;
+				vfront-porch = <8>;
+				hsync-len = <4>;
+				vsync-len = <4>;
+			};
+
+			timing7: 640x480-32@60 {
+				clock-frequency = <25175000>;
+				hactive = <640>;
+				vactive = <480>;
+				hback-porch = <48>;
+				hfront-porch = <16>;
+				vback-porch = <33>;
+				vfront-porch = <10>;
+				hsync-len = <96>;
+				vsync-len = <2>;
+			};
+		};
+	};
+};
+
+/ {
+	aliases {
+		mmc0 = &usdhc3;
+		mmc1 = &usdhc4;
+		eeprom_mac = &eeprom_mac;
+	};
+
+	/* Will be filled by the bootloader */
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x80000000>;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	config {
+		#ifdef LEGACY_BOOT
+		bootcmd = "startM48;errorMsg";
+			bootcmd = "startKernel;errorMsg";
+		#endif
+
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts
new file mode 100644
index 000000000000..ab331596abd9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *
+ *  Device Tree file for Drager M48 Board
+ */
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+/* PAD config disabled in imx6qdl-draeger-m48.dtsi by setting value to 0x80000000
+ * PAD configuration register must not be 0, so it is set to 0xfff
+ */
+#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x790 0xfff 0x000 0x000C0000 0x0
+#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x7ac 0xfff 0x000 0x00000200 0x0
+#define IMX_PAD_SION	                         0x40000000	/* set SION */
+
+#include "imx6qdl-draeger-m48.dtsi"
+#include "imx6qdl-draeger-m48-u-boot.dtsi"
+
+/ {
+	model = "Draeger M48 i.MX6 Quad Plus";
+	compatible = "draeger,imx6qp-m48", "fsl,imx6qp";
+
+	vccq_sdhc3: regulator-vccq-sdhc3 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHC3 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_m48_regulatorvccq_sdhc3>;
+		gpios = <&gpio6 16 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 0>, <1800000 1>;
+	};
+};
+
+&iomuxc {
+	m48 {
+		pinctrl_m48_usdhc3_100mhz: m48-usdhc3_100mhz {
+			fsl,pins = <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x1B0E9
+				MX6QDL_PAD_SD3_CLK__SD3_CLK    0x1B0E9
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x1B0E9
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x1B0E9
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x1B0E9
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x1B0E9
+			>;
+		};
+		pinctrl_m48_usdhc3_200mhz: m48-usdhc3_200mhz {
+			fsl,pins = <
+				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x1B0E9
+				MX6QDL_PAD_SD3_CLK__SD3_CLK    0x1B0E9
+				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x1B0E9
+				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x1B0E9
+				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x1B0E9
+				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x1B0E9
+			>;
+		};
+
+		pinctrl_m48_regulatorvccq_sdhc3: m48-vccq-sdhc3 {
+			fsl,pins = <MX6QDL_PAD_NANDF_CS3__GPIO6_IO16 (0x1B0B0 | IMX_PAD_SION)>;
+		};
+	};
+};
+
+&usdhc3 {
+	compatible = "fsl,imx6qp-usdhc";
+	vqmmc-supply = <&vccq_sdhc3>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_m48_usdhc3>;
+	pinctrl-1 = <&pinctrl_m48_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_m48_usdhc3_200mhz>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
+};
-- 
2.47.3


