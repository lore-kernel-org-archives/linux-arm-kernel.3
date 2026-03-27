Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6835610BA455
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXpioS2McrQ7pXJtZMGeE8cr5SkumoHU2NutwDqB11A=; b=QHBdyuPcHFF7zhLHpbkvcC0afC
	un6xS/MSLGC6rDxlPp/fOpDarMe9rBNcbOzsoaEOUvezmvSQRk+T7m2DY11IRxMkiXYMcqMXk3VPu
	l0tg+9mF57sLJo+Upn75VfIN6b2MeU7z8KQhaFuWnsUX56udf/9P2YmvhE576jkdIw1HSWnnjcelG
	goX6NocuXE9xREaWiDdL488COePtlXDxjPxCnex+GuxVqt/qSaTv4eOOsy5msSvT9D6T9nOsBP+h6
	QggoFaol0BfILcjDA/ufm5VXQ0vL/72V1cuk+lP92Qss9Nk/mq60D1hb8SmVkQ/z+k5bMu6395fnw
	L/yYfwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63By-000000072Pe-1vFl;
	Fri, 27 Mar 2026 09:09:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Br-000000072Nf-1Tj7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HXpioS2McrQ7pXJtZMGeE8cr5SkumoHU2NutwDqB11A=; b=GYMbYtYpqIB2DTh9kK9oXHzdrh
	wDGsP+A1cFb3nmStr1wJ0T+JBWU9q2SE8IzQgwPbvvBx8DDJ6CdA2cR1hLH2Apfr5Iqcmdvdu2fs8
	d9p3Zsv8FzVo7qxjfwGd1VNvbiZgncbYOWUqOj704kfmsQHJVKsoK/vutcsRrlHj+A1drb+AiNgn9
	Y8VWr5ctTovydju1ZKOd7X+pDNC6asC1fqHt9P1Y9W77kyLlXgAzNRaf5Bm8chfXuTzQV/r7UOeXx
	nNKxApLaTpyUMwDOt8/y3D23bngM/fP7naaUiVtlWRpS2AXQqPLw9j4sGc5i0IYU/DCL/TH+Exah8
	Gxo/NlUQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Bn-0000000A2JT-3rTO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:09:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so17178855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602550; x=1775207350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXpioS2McrQ7pXJtZMGeE8cr5SkumoHU2NutwDqB11A=;
        b=L8TiDSkXmre2lC2LKUHscLr4k/+gC5AuCvw1tB6ufZgF88zyMk7rpkUTAE+A/FylcI
         o7vXGMrq9aw0BcSjFRXUBThAOtkV48UJyBLIxhMYt7TpWlzd1JEDudBZhFcQG5cdsLyT
         jEUr9OFjM7M9TZ5CwB/JIv4OM649/8uWvcEiAQqU2XjjsmYqGL3F5aGFFLw2YCUdmXe8
         m+CGWGHJ2iBYWsWoNJCayQ22JjUjh8tHu4J70pbZUdaRTJAgsDfw2Cq+ZddpJDy5Na/i
         7PWi7nNp/na2xquRtQ5VTomYOTQ/m3NkZzYUD/YaBN5BtWtC6kE0sMP146i2lcOCsUvt
         QsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602550; x=1775207350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXpioS2McrQ7pXJtZMGeE8cr5SkumoHU2NutwDqB11A=;
        b=oqpealdRUd5xOcy6iijElhInR2nZ9SCccCL25FVqiRSqJ9DZaDDb/Ru2xh1tLzdR6t
         yriYlOAcn2DL9m4QGa8owJ6XnVdcmKE7f1r7jt/wrDhUiDAV102JEtDESR3Nad8JFLsq
         PDN6phOGIaMl4BxKzUxnMjBMMGFWPH7Q3PptdEFQ/fPJv7v0RPU4Ku3OgmvUguvCnAIK
         QSNMR0MAXQ4Ei+exWDZ8sWOTx1HCCiCwwhCCoEQHFzgx2MA2VyfqXVZY2/iBfT2w81kY
         NuvdwVIkVc+LiGf1MLiMlwjllSl91ZkZfgnOxjXFD1oTHrackvuBaq38N2CtNyU+5api
         cTLA==
X-Forwarded-Encrypted: i=1; AJvYcCUgwVx9xLn/qAiltX5tZYCqTBexTJlzY1dLRFGJVeD6qMiraJnyR+P66e40mydJ7BkWqIVKF6jChIgugZqTV+c+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa6vDqC1/PEmYC8bifV8VxUyKnc6GjKI5Q0KK8hmzzdgoNBkFH
	CJGGT4QhfQYKtF2YpK8rEghugJEN28+KpUFVz6Io304a/1Is+Fa1zaEi
X-Gm-Gg: ATEYQzwTvbcYVZI3AEtfl2OYhYKaYC8OALkfntjItT6/YHd8oUec7SyeedgA4YKYYSh
	8mobt7PyiVl1xPqi6/jBbfai2s1BlTwoOpp7+qOP6NMxRgJWL8KBacNI9CRQoNfs7yy9WRkMbdN
	kxx3LKyw9P9cwLVUd33JVcDc06Jg8iEJxdTSdEN0AmqitaE3Rjss2W5n/4U44q77szksTRt4gLW
	4nxW6QattYQzC+DT6jx+N5NMl7H9Qq99UpNYbPkvOX+UFIY+vrfTFwOLwBPhDa5XxEdMfHCYr8Q
	FCyPoATkJUVx109yJrsfa9eioQtTn/ZQxwIseQV1VLps5tx/90HW3kEX95yqBzk4hwU0ThfkCYk
	+zZ36+p1KI4lnd67n1k1dpRJGg5IF7k+t1+3vHSjlKobHIHGesaAZTMLYIERKDAA/xxrAAtGp/c
	0me9j8/gqY3Igbr5KujGpGjj3TkJWyuyfZAIHgwo3q22WFNChZ4Su5APfnph9ceohq2RNwfLH6B
	hwIL+1AQk+pW2p+L9boDulfkeb4spFV+VoFww==
X-Received: by 2002:a05:600c:4e15:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-48727d5a191mr27106065e9.2.1774602550064;
        Fri, 27 Mar 2026 02:09:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:09 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite DART-MX93
Date: Fri, 27 Mar 2026 10:08:55 +0100
Message-ID: <7a2cf33f735af51f393954c4f317c36e4d20b1d8.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774601806.git.stefano.r@variscite.com>
References: <cover.1774601806.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090912_148723_DFBB7F73 
X-CRM114-Status: GOOD (  17.98  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite DART-MX93 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX93 MPU processor
- Up to 2GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-93/dart-mx93/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Remove clock-frequency property from eqos node

 .../boot/dts/freescale/imx93-var-dart.dtsi    | 461 ++++++++++++++++++
 1 file changed, 461 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
new file mode 100644
index 000000000000..69495bb7fc9f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite DART-MX93
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-93/dart-mx93/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx93.dtsi"
+
+/ {
+	model = "Variscite DART-MX93 Module";
+	compatible = "variscite,var-dart-mx93", "fsl,imx93";
+
+	sound-wm8904 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio3 7 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1>,
+		 <&mu1 1 1>,
+		 <&mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	status = "okay";
+};
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	snps,clk-csr = <5>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "sleep", "gpio";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
+	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX93_CLK_SAI1_GATE>;
+		clock-names = "mclk";
+		AVDD-supply = <&buck5>;
+		CPVDD-supply = <&buck5>;
+		DBVDD-supply = <&buck4>;
+		DCVDD-supply = <&buck5>;
+		MICVDD-supply = <&buck5>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
+	};
+
+	pmic@25 {
+		compatible = "nxp,pca9451a";
+		reg = <0x25>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <650000>;
+				regulator-max-microvolt = <2237500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&mu1 {
+	status = "okay";
+};
+
+&mu2 {
+	status = "okay";
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	keep-power-in-suspend;
+	bus-width = <4>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_bt: btgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15				0x51e
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
+			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
+			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
+			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
+			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
+			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
+			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
+			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
+			MX93_PAD_UART2_TXD__GPIO1_IO07				0x51e
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqos-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
+			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
+			MX93_PAD_ENET1_RD0__GPIO4_IO10				0x31e
+			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
+			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
+			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
+			MX93_PAD_ENET1_RXC__GPIO4_IO09				0x31e
+			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
+			MX93_PAD_ENET1_TD0__GPIO4_IO05				0x31e
+			MX93_PAD_ENET1_TD1__GPIO4_IO04				0x31e
+			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
+			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
+			MX93_PAD_ENET1_TXC__GPIO4_IO07				0x31e
+			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			MX93_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO28__GPIO2_IO28				0x40000b9e
+			MX93_PAD_GPIO_IO29__GPIO2_IO29				0x40000b9e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00			0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00			0x31e
+			MX93_PAD_I2C2_SDA__SAI1_RX_BCLK				0x31e
+			MX93_PAD_I2C2_SCL__SAI1_RX_SYNC				0x31e
+			MX93_PAD_UART2_RXD__SAI1_MCLK				0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12				0x31e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11				0x31e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13				0x31e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14				0x31e
+			MX93_PAD_UART2_RXD__GPIO1_IO06				0x31e
+			MX93_PAD_I2C2_SDA__GPIO1_IO03				0x31e
+			MX93_PAD_I2C2_SCL__GPIO1_IO02				0x31e
+		>;
+	};
+
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX				0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK				0x1582
+			MX93_PAD_SD1_CMD__USDHC1_CMD				0x40001382
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0			0x40001382
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1			0x40001382
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2			0x40001382
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3			0x40001382
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4			0x40001382
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5			0x40001382
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6			0x40001382
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7			0x40001382
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE			0x1582
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			MX93_PAD_SD1_CMD__USDHC1_CMD				0x4000138e
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0			0x4000138e
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1			0x4000138e
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2			0x4000138e
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3			0x4000138e
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4			0x4000138e
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5			0x4000138e
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6			0x4000138e
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7			0x4000138e
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			MX93_PAD_SD1_CMD__USDHC1_CMD				0x400013fe
+			MX93_PAD_SD1_DATA0__USDHC1_DATA0			0x400013fe
+			MX93_PAD_SD1_DATA1__USDHC1_DATA1			0x400013fe
+			MX93_PAD_SD1_DATA2__USDHC1_DATA2			0x400013fe
+			MX93_PAD_SD1_DATA3__USDHC1_DATA3			0x400013fe
+			MX93_PAD_SD1_DATA4__USDHC1_DATA4			0x400013fe
+			MX93_PAD_SD1_DATA5__USDHC1_DATA5			0x400013fe
+			MX93_PAD_SD1_DATA6__USDHC1_DATA6			0x400013fe
+			MX93_PAD_SD1_DATA7__USDHC1_DATA7			0x400013fe
+			MX93_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK				0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD				0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0			0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1			0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2			0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3			0x40001382
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK				0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD				0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0			0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1			0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2			0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3			0x4000138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK				0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD				0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0			0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1			0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2			0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3			0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20				0x400
+			MX93_PAD_SD3_CMD__GPIO3_IO21				0x400
+			MX93_PAD_SD3_DATA0__GPIO3_IO22				0x400
+			MX93_PAD_SD3_DATA1__GPIO3_IO23				0x400
+			MX93_PAD_SD3_DATA2__GPIO3_IO24				0x400
+			MX93_PAD_SD3_DATA3__GPIO3_IO25				0x400
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14				0x51e
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07			0x51e
+		>;
+	};
+};
-- 
2.47.3


