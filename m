Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7371F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SNNVpoFM;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=IRmDyGVQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmQtxD5ltcvpFoaJbm6dtzVdLv6aa0Yf3BVfvtcHkks=; b=SNNVpoFMEl33gfEhVAcDch37Wv
	j4rV4gxTbll6WDQTyFq+uPH2kyn13vQS1l9wXzgmQgbbsZFI18BX2qCym3ffYTI8FasnM5pBH2YlE
	f000wC9MUza+mwH0+rL+YbvNdIBTSu//3MMV728fYFuWGVQFUzwVQB8y9JXct3e2x8/XH5iAnpnEg
	sDkCxXF3JEGLvMAxvQFlILB/s58bjg8/7KX2Eis6M8dCmUBuRoDSMNMqoNMWKl+SCicjZZ190rxgk
	/AmDlaG0QDtUtuqDFavdaCJEqPhzM9kbsSGGjTLMSJxC9e2Lhpw97ri+MnLpME+i/kmEzVMJBNC3t
	qXDlR/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSWE-0000000BTqp-29Ms;
	Wed, 21 Oct 2026 09:21:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSW9-0000000BToT-1Y5s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:21:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a01933b584so3525055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574511; x=1793179311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmQtxD5ltcvpFoaJbm6dtzVdLv6aa0Yf3BVfvtcHkks=;
        b=IRmDyGVQWazcYd6oQnUk8wuZ3/pViB1rpnbz1zBSFELKaevj6EMbpPTQAr+M9mX+iV
         QQyUvf0nQerDZkIjqNtgmbBNmqWzcYdjtjkH1bh/626StTPXI7LlGn3sMhS3dd+XIl+j
         nTDZcDq54K0BUDkRJUirX+OvC+PvMXDdbT9dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574511; x=1793179311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmQtxD5ltcvpFoaJbm6dtzVdLv6aa0Yf3BVfvtcHkks=;
        b=DcsvuDu7UgIMpL6eTkSLaKiANNcLFtCWUHeIRB/g4RvNlnC98DZ5T6TqD32LzP/Ptp
         5QzogZJo0YpYbgy/SkKG7kik+avfuXRfWmxw6OjmpauKYe+FWeL718YT05rm/Kf57oeS
         nM7YLi87xGAThcpNxSCXUOUlo+wWRJh024gDwJvnEgb5qRwh5nTgLpagg+6ZcCEDa9uu
         JRuARfO7vxVn1VKyalUBDwgfbyfjjPIfJQMdpzCexCtXa1eWVItt0ClgAzOyG7Rjv/5U
         KTfQbt0O8LevLoIhJoF3gwOkxA+LOEv5C/0BccfFeKmvz66CKBqppF7dt7CW1c0Tx3eB
         QBkg==
X-Forwarded-Encrypted: i=1; AKwUvBylEIYKnhT+sClHYbuSoPNbXQgdgn5xFlhoqeFXczMMGgsuzbiK6QUA/sjWkD4DvdM+6VCo/6IihU6aMFkewx46@lists.infradead.org
X-Gm-Message-State: AFq9FYJRliYkw2RB8btZyH/ui+pkOWrO+EXZpGguUb9XNtlJLB0kt5N6
	FdxqeDXXvcjYQHbMsdd7AJcSrdieihbV1t7CxG80+VF7b5Q35yJKU98AyDMd0IKwKA8=
X-Gm-Gg: AYBFou0f/FxB5DMG14YbEblp/bgR536/m77hGCqQ7yliQbhlU+hVjgygjU39esep1K8
	ooRZG07hrIayJQpXDAF/+LePa55gYoRA7KatrbdsWv/ZR9j0x14x2LLqDEX0cFNkSz0bVohfRhs
	+LQTMPM8ixLOmr2TvFEaVul8JvPi/gUP+nETYGcjKbuL3OjEHTkxphLJbY8GJVhurH6rL+pBZVW
	x2/VhySZfHLosVpxwWOTg3XuVBG54gHvd04Uq02+AhvpuurIzawmhDH4ENdlTnQFJC4EMva4wJb
	sUeFahWVdXmQ/4Goc7pZgfW/hDmHtmF0qwROvNvstcaKkiGAxYvF51wj21CYkqajMFFeewb9ENm
	O378h/UnctRZKffVk+zII1NFgU7baYYhLE0dpt3kIB3/PRxLD5A9LK2gpaXuQb79O86XhDCph5Q
	nFxaGFfe4+jZA0Zk+IDc+8Cgm3LVFIBsUkmSaZO9QBPXNgUTEs5YeozMoIIhpMg9VcUAU/8kU57
	QUVE6vVdAu2YJ4kfchwKl9RUvV0eiV2OSNlwW31rl7CM28w5xD6taYxIHcb8g1XhT2Mid2iHMz+
	soEIJOPwgKizKLlYgQ==
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr25024955e9.12.1792574511333;
        Wed, 21 Oct 2026 02:21:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:50 -0700 (PDT)
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
Subject: [PATCH v3 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Date: Wed, 21 Oct 2026 12:21:38 +0300
Message-ID: <20261021092140.4142493-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021092140.4142493-1-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_022153_454711_11CA43D0 
X-CRM114-Status: GOOD (  17.26  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Add the DT for the two variants of M48 that are based on imx6q and
imx6dl.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..cdd252fd5109 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -104,6 +104,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-dfi-fs700-m60.dtb \
 	imx6dl-dhcom-pdk2.dtb \
 	imx6dl-dhcom-picoitx.dtb \
+	imx6dl-draeger-m48.dtb \
 	imx6dl-eckelmann-ci4x10.dtb \
 	imx6dl-emcon-avari.dtb \
 	imx6dl-gw51xx.dtb \
@@ -219,6 +220,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-display5-tianma-tm070-1280x768.dtb \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-dms-ba16.dtb \
+	imx6q-draeger-m48.dtb \
 	imx6q-ds.dtb \
 	imx6q-emcon-avari.dtb \
 	imx6q-evi.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
new file mode 100644
index 000000000000..b0bc9a67f5b3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *
+ * Device Tree file for Draeger M48 Board
+ */
+
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-draeger-m48.dtsi"
+
+/ {
+	model = "Draeger M48 i.MX6 DualLite";
+	compatible = "draeger,imx6dl-m48", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
new file mode 100644
index 000000000000..ff9c337e93fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *
+ * Device Tree file for Draeger M48 Board
+ */
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-draeger-m48.dtsi"
+
+/ {
+	model = "Draeger M48 i.MX6 Quad";
+	compatible = "draeger,imx6q-m48", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
new file mode 100644
index 000000000000..19207d45764c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ * Based on work by Russell King
+ *
+ * Device Tree file for Draeger M48 Board
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	aliases {
+		mmc0 = &usdhc3;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	/* Will be filled by the bootloader */
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x80000000>;
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
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
+		};
+	};
+};
+
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
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
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&ldb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lvds>;
+	fsl,dual-channel;
+	status = "okay";
+
+	lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		display-timings {
+			native-mode = <&timing0>;
+
+			/* LVDS split mode */
+			timing0: timing-1920x1080 {
+				clock-frequency = <71190000>;	/* pixclk / 2 */
+				hactive = <1920>;
+				vactive = <1080>;
+				hback-porch = <60>;		/* left * 2 */
+				hfront-porch = <60>;		/* right * 2 */
+				vback-porch = <30>;
+				vfront-porch = <3>;
+				hsync-len = <60>;		/* hsync * 2 */
+				vsync-len = <17>;
+			};
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x13018
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b018
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b018
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b018
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b018
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x13018
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x13030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x13030
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA	0x1b0b0
+			MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL	0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b820
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b820
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x1b820
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x1b820
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b820
+			MX6QDL_PAD_EIM_D18__I2C3_SDA		0x4001b820
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__GPIO3_IO17		0x1b820
+			MX6QDL_PAD_EIM_D18__GPIO3_IO18		0x1b820
+		>;
+	};
+
+	pinctrl_lvds: lvdsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A22__GPIO2_IO16		0x1b010	/* DISPLAY_EN */
+			MX6QDL_PAD_EIM_A20__GPIO2_IO18		0x1b010	/* BACKLIGHT_EN */
+			MX6QDL_PAD_EIM_A18__GPIO2_IO20		0x1b010	/* DISP0_CONTRAST */
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b010
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b010
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x1b060
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x1b060
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x1b060
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x1b060
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x1b060
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x1b060
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x1b060
+		>;
+	};
+};
-- 
2.47.3


