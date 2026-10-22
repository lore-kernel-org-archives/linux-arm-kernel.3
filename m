Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pk71ja0w;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=m7PVjIuP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yV1RxJJscrXOeI7Q/8W59C0ANld22tAuW0rA5vcBUxc=; b=pk71ja0wzDX9Hm
	D6dAnrjJVaOQsP3iUGHQlGoy6SC0gJenT25g+Qoge5hG01f2hmvavZSf1byuRX3NaOZlAHNZCrAki
	q4IOIc8t9NTHGX6P02OeIzvTv3mXDfuMV3SFK3qx8pWqJehYubF6+1dBl4VD4/CU4IgNbCcJUDlM1
	kLC8pW9ZQI/VpMDb5Au5KBvcyF+6jvcNlMTaMOokEviPI1ud8j2dkiYS+8KXb16l9i1xz11colyht
	e/c3eSiI63dRqBeTMqVUd2kbWsyoCx8dP2xidxuNPtCKeND+qI/CI4ngD9Si7xmj5rsgNK5EJX5S9
	xutaR/wBVgu7eA4NrnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtNx-0000000EG9r-25st;
	Thu, 22 Oct 2026 14:03:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtNl-0000000EG3E-3gOw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:03:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso24251205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677780; x=1793282580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yV1RxJJscrXOeI7Q/8W59C0ANld22tAuW0rA5vcBUxc=;
        b=m7PVjIuPwwllcVlzYGh73CyhLihLpiR4AJ8TbpZjtjydX9NyO/LXeTnrYm+xOAKkpC
         QrysbdGTIKRqq9XTH11uEoHxbbrtztnDLeMaqaX9Tnyk+uIP0KjfWZCdotm7VQvN5jl2
         IF26MAoO+AH66nZNgwhy2BM+xXfEDMi1WYHjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677780; x=1793282580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yV1RxJJscrXOeI7Q/8W59C0ANld22tAuW0rA5vcBUxc=;
        b=ky4ZABwCB/OFhFJ5Zme5y+x7J8Ug4BBH9SOROdwhNB6G+EMs8xA+bsXgMvKS/EfbWy
         7dklNBuJ/76SMy3fl70VrnZ4hmGVjYimiJ/OtffHqn4j9PH0oh6dUNRYGV4B5kwzx3mO
         o1jTyqUUOT1bRSk6U2h+MGoV+satl12YEDBHDhbAX5urwv1hcRpqWhlsi0c5VChlXd/r
         BTYysxDur++P/PqmgLogOSt9GEIjVnvwI1Iqm074IGWKWN1looqZlPdOgYfPxqYApnLq
         wKjWyD+4SMJI3sN0mzU9CWw+Ty5CZvHNoF6Ai6WrQJYmYV8EhvUWjRPdGd5GTSJerWjF
         dwxw==
X-Forwarded-Encrypted: i=1; AKwUvBwhhU+MgLiUGGt9VWNmb52LepIN2ujheLpr9w58CrWQKXWps6KtTKn1VR6Mx3sk0AUzA8pPVFfsUSidUu1LJzY8@lists.infradead.org
X-Gm-Message-State: AFq9FYK80GDB/YuEAp/xuVPkE1NTbsHd3Ooqfr+1GY/E6i8ELteegdJd
	o4+LXkjZeldHMSmGdzjiPPfssmnrAd/1K0zBk36FWhFLyONj3WygaN30ebNXYJc8B0k=
X-Gm-Gg: AYBFou0mN5OQUmzzLV1zl2SPig0hvI861rk7oXRu2YR+MTIIUCQNA0lrChJVB9cwMwR
	Jj8ntTsjlZr5Ly70jiZBbmUuicagtDeICtv9PYaLQ34MFIP4z9D+GhGWzP9IoiDGKd2kRx0wjQW
	+onMPhABq+Z18SAKDfWy5KN3l2/lyRV4dAIZ2iWT/2IgSZcTIrLi7HkaOJM8wM54uYetJ5JkmEY
	/fXuOSl3eyWVvXGk4p/9UeRupn/GOR+lt4IzWsZUUbVtDYJcyi2+jmS/tN1hj/QnOM3v3e9YywL
	hisEfVYRkdVLiM61y4flDrqWUt8p8G9ZB/VdPgMX3DOFFGWMblW3g/6RWd3894C+vQNZeBIgJWS
	H7bwkptPjFizZbiFFfN09O3QcVwlwYfNT9NIgdAJQRdz7GKEFmdSaNGN7oXioeRjp9cgxvkPRkW
	zb8zK1cziUleCx1cHk9ay/buC0y5i+MPQGYJ0QmRpIQHM667xqJEEBA5wH7CpZ2WBjZ/jjwQWmP
	ZfOWH6UXHUawpGei4mdCv3Ki0z8q5qhF+7NVIys7QV68Ra0EHBQT5fxA0PIE+LOp7wQeUoF
X-Received: by 2002:a5d:584d:0:b0:48e:28bd:e010 with SMTP id ffacd0b85a97d-48e28bde4b0mr8838292f8f.7.1792677779627;
        Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
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
Subject: [PATCH v4 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Date: Thu, 22 Oct 2026 17:02:43 +0300
Message-ID: <20261022140244.3476844-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140244.3476844-1-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070301_957826_DBBB93D2 
X-CRM114-Status: GOOD (  17.17  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index 000000000000..bb2c149c64bb
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
+	scl-gpios = <&gpio4 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
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
+	scl-gpios = <&gpio3 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
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
+				clock-frequency = <142380000>;
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
+			MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA	0x4001b8b1
+			MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL	0x4001b8b1
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
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x4001b820
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x4001b820
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
+			MX6QDL_PAD_EIM_D17__GPIO3_IO17		0x4001b820
+			MX6QDL_PAD_EIM_D18__GPIO3_IO18		0x4001b820
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


