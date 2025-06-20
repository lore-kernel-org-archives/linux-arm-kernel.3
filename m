Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06730C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0GQhZs/BHF8doajH51/JufbixsF0x6AuArECNNY9uI=; b=BECfhBq/xLy4ON0UtjDDeY1m3L
	wI7hooy+gd1UDQwn6AsFYAkbV8JdpHcVn0F2rT3Ca4Tctp45wtDNYdfystOVT8wOaeXSTY0bO4Z0Y
	Wqi7Q3TfQ5ejsNVqxojKaWLVcBv4yXeXljCWn9GLDJhZ/S7huQvxIjf+bxCKOGM5uPU3yxomvDmyr
	tbAHEBWcVvVTMse+ICv2K8DZF06pGAuTCrwrzJ/XwMa4TxL6QPXD7vRYWft15Qv4auUOPXU+jfkCZ
	6kIZb72BOf0JB3EH2R9ACxgreL+sGvd3aSqUZZIRORMre/CgI7qFr4MT5keaX2/So5uJjBa3hC/Jd
	vjH9F4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXbZ-0000000F8kG-0VJx;
	Fri, 20 Jun 2025 09:00:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSX6A-0000000F3PV-3r1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:27:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so11267375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408065; x=1751012865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0GQhZs/BHF8doajH51/JufbixsF0x6AuArECNNY9uI=;
        b=I25Djyj4g3O9PChvHXeqNw61eiAIQ8UdLfWTFkXYPaaUjOzc99AGgc3RwVjPcUbR5w
         4VJYOcPT/5dzCdKwzrPvk7Nfz0/eRDqNc+M/6s5MoUWqBvbOqvugOmWBHIWL/2Wy0Wew
         eo/mfsJF2XNGA1wjfp0qVnmKNEWJ/jEtW8ipo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408065; x=1751012865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0GQhZs/BHF8doajH51/JufbixsF0x6AuArECNNY9uI=;
        b=oje6GEOKhg20PjMbS3rURWKyBPqLs14M4jbJ5yaJQGN5wJPFeU3gh/YfmZDdzJVNUl
         Tuiad4MsoT/oMM7CYPaIFxxJOjM9Um3mySaOAKVzJz1ln5ihCSeljsfW3PVVOkV3e4vS
         9pQUpZ3Y4XSE4I5CbsQfnhpZhWXAZF4cWAw5FfFQCOeG+M8wrNJNY8m9ST1McmuTDIoA
         LPKDuDwkkMS+pcwIc11rftdOhh7Qeb8SsUYSFneu8N82Tu13nNL3Kn2PDQOuEvSyqgD9
         uEoyNWoz3FLHMy4JqxAPyQMNjDi/dx6Dfgb2r2q4mm5HCZjij9KaZW1FoBChEL47ff6k
         OsxA==
X-Forwarded-Encrypted: i=1; AJvYcCUItNXTQWQRW6SNs/hOht3sTQnwcUWXvQeE89N2+M1zHL+bEE3m1qoK5dTLDyVQ0J7ucOQrs8p+omp2Xd3tV4xC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm9YtI4awYqiO++3djrpf4wi07HnqbAiTGdfcBcxMFqHU9BKTi
	n0h9t8OX3yG2QtP6IH87RU9jL9YVUX38HjMrmW506mHjkw7BIc95llg3/qtgobnzFXE=
X-Gm-Gg: ASbGncvVVyfhjm1QmPrRGOCOXiZymY6z1Yw7RMGtaLXgek5qnfZzXQba+NVjtym9AwR
	LE+DL8HJc40l8F9lXpccennyQCcMWAyRU8kmyMyNHgY0u7p+sOBRF7t68n4h3kUPJnUKYJ5V884
	CdyXxIhTEu4rlRyb/1duaz6/yK748Q/oTrwMg1wpGCbFo4UByEe10dmMZ2beaJNdZkFnB6lKgnC
	ASHKp8dk0we/tdzel7ABn8mc4XYvsWXfhwgP1w48AIMez7p0N2kuqSFPsWrSr6NnHLKH4alvLCF
	0n2HJH5X1tJ04Proxs38ItFTHGM+brvREgn8tIwauqrn1aGMMQJLUV9pxDtEJJqSUqncIj/Tz4D
	Kjmo636Ty4P8o7amYCWyPCMGFd9HD6nWalIrtdW3wv0j+IoKnUd/E
X-Google-Smtp-Source: AGHT+IGIiM2En+0VcWDODTyrMwusUOQIG6ewD38YhYWPQ2sf6gsFzxnImCyxD2LIC3KGsTZzKHjbxQ==
X-Received: by 2002:a05:600c:621b:b0:453:62e7:7705 with SMTP id 5b1f17b1804b1-45365e653bfmr13318195e9.12.1750408065324;
        Fri, 20 Jun 2025 01:27:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 03/10] ARM: dts: imx6ul: support Engicam MicroGEA BMM board
Date: Fri, 20 Jun 2025 10:27:07 +0200
Message-ID: <20250620082736.3582691-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_012746_957159_C72E22BF 
X-CRM114-Status: GOOD (  15.17  )
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

Support Engicam MicroGEA BMM board with:

- 256 Mbytes NAND Flash
- 512 Mbytes DRAM DDR2
- CAN
- Micro SD card connector
- USB 2.0 high-speed/full-speed
- Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v4:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.
- Drop an extra blank line from iomuxc and iomuxc_snvs nodes.

Changes in v2:
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Add Reviewed-by tag of Peng Fan.

 arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 303 ++++++++++++++++++
 2 files changed, 304 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 8b3abe817e12..57f185198217 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -356,6 +356,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-dhcom-pdk2.dtb \
 	imx6ull-dhcom-picoitx.dtb \
 	imx6ull-dhcor-maveo-box.dtb \
+	imx6ull-engicam-microgea-bmm.dtb \
 	imx6ull-jozacp.dtb \
 	imx6ull-kontron-bl.dtb \
 	imx6ull-myir-mys-6ulx-eval.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
new file mode 100644
index 000000000000..279d46c22cd7
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx6ull-engicam-microgea.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull-bmm",
+		     "engicam,microgea-imx6ull", "fsl,imx6ull";
+	model = "Engicam MicroGEA i.MX6ULL BMM Board";
+
+	backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <85>;
+		pwms = <&pwm8 0 100000 0>;
+	};
+
+	buzzer {
+		compatible = "pwm-beeper";
+		pwms = <&pwm4 0 1000000 0>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usb1>;
+		regulator-name = "usb1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usb2>;
+		regulator-name = "usbotg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ext_pwr: regulator-ext-pwr {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_ext_pwr>;
+		regulator-name = "ext-pwr";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "imx6ull-microgea-bmm-sgtl5000";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"Headphone Jack", "HP_OUT";
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	codec: audio-codec@a {
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mclk>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_CKO>;
+		assigned-clocks = <&clks IMX6UL_CLK_CKO2_SEL>,
+				  <&clks IMX6UL_CLK_CKO2_PODF>,
+				  <&clks IMX6UL_CLK_CKO2>,
+				  <&clks IMX6UL_CLK_CKO>;
+		assigned-clock-parents = <&clks IMX6UL_CLK_OSC>,
+					 <&clks IMX6UL_CLK_CKO2_SEL>,
+					 <&clks IMX6UL_CLK_CKO2_PODF>,
+					 <&clks IMX6UL_CLK_CKO2>;
+		VDDA-supply = <&reg_3v3>;
+		VDDIO-supply = <&reg_3v3>;
+		VDDD-supply = <&reg_1v8>;
+	};
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm4>;
+	status = "okay";
+};
+
+&pwm8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm8>;
+	status = "okay";
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	status = "okay";
+};
+
+&tsc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_tsc>;
+	measure-delay-time = <0x9ffff>;
+	pre-charge-time = <0xfff>;
+	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
+
+&usbotg2 {
+	dr_mode = "host";
+	vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
+
+/* MicroSD */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	vmmc-supply = <&reg_3v3>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_can: can-grp {
+		fsl,pins = <
+			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
+			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__I2C2_SCL		0x4001b8b0
+			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA	0x4001b8b0
+		>;
+	};
+
+	pinctrl_mclk: mclkgrp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TMS__CCM_CLKO1		0x13009
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
+		>;
+	};
+
+	pinctrl_pwm8: pwm8grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_ER__PWM8_OUT		0x11008
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x130b0
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
+		>;
+	};
+
+	pinctrl_tsc: tscgrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x000b0
+			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0x000b0
+			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0x000b0
+			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0x000b0
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10059
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
+		>;
+	};
+};
+
+&iomuxc_snvs {
+	pinctrl_reg_usb1: regusb1grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x17059
+		>;
+	};
+
+	pinctrl_reg_usb2: regusb2grp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER3__GPIO5_IO03	0x17059
+		>;
+	};
+
+	pinctrl_reg_ext_pwr: reg-ext-pwrgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x17059
+		>;
+	};
+};
-- 
2.43.0


