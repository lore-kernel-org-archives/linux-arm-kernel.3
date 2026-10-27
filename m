Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C93606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 04:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KbGOtihZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WcQyYVqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=83nafzbkV5Ank6Et04/R6CJDCI1/AnYfnAhSh3P32qs=; b=KbGOtihZ5kaVN9qVjxXNn65Dba
	P4aSF8KguOLgU6XKmv24UhIk3pyt1BsROnqI83oelv5DnIB+vyL2+srQ23v1mlAk+H5FcflOp4deE
	Gn45cCzxFYR1CX7tL3aO25800KuJSHHIQp/TaVi/dQVCcCg4gqMQeSyIBd/9C24LX9fbdCFmfxcbx
	24nBQQn9ftEgSR7pdbv7xKG3pe1REcF/x2Z8DYzTUcP4zLACY57Ejh/WsC35v5nUaVJeBOwNDwuHW
	EzZ5gW7q4Dri/7qrrItpZYwNCW4JTg6KaYDfd/le7M1cJ3kYzvU0Cs+uAzH5FGysNaluPHITCnecE
	dqvIGDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYhs-00000003jmh-0zCi;
	Tue, 27 Oct 2026 04:22:40 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLYhp-00000003jlr-2cPE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 04:22:39 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-15dd124bbe7so1807372c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 21:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793074956; x=1793679756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=83nafzbkV5Ank6Et04/R6CJDCI1/AnYfnAhSh3P32qs=;
        b=WcQyYVqNq3/qWho+YRTNWJHeJfhJMCbqsp6dJ+YhozX7IFs6prMBbB2V8/urnjgR55
         FwBVSV8vHi5Vg/42q9aTtMw+y1eD2A9aRTsb3pnJ27+F6xC4BMKgbp9gwj6v6soxr58J
         utrnP1qu8nrUfoRc3p1ODfQgV/PEUKT22xdesihM5XuCWyV22Gc1FpeEZEU1K/FLC2NP
         1HmIf31+Nt+yNex/Ht2tWVmOa9tZKDSuNqzspDnm9L+g8vt9Al7c2T8VLCTXQKl8vCpB
         E+yu1PSAHv4hJ9mGpgBE0prZEO/kfdvwvPRRTmAB87TvOR9yQCQD2mrDtDsc/rQV5BjD
         cVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074956; x=1793679756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83nafzbkV5Ank6Et04/R6CJDCI1/AnYfnAhSh3P32qs=;
        b=iOZntX6v+gu/t7+cxgk4wjymwuScVD0r7JnmE0jbLQ7urTRxTAZNeCKd2un8iofWFN
         HpSkO3USFsm+GzWLA1IjxKLU3aCM7bj8ELwtAeGc2mmib2LlWCpeuFtaEyRDj+wWCBNU
         TEc2/qNMJ112tlvn8RTtqjQwdmMetRKwqsS7OU0VxrizmrRjuQHto2qDlux1REq8aCYr
         qFuLBlecuVCPKxhiTePJ7SnDN7EB59k7aTseSAhgb1g5FGw21N67sMNmE9Mn39/myWoX
         HEPXg0arlpDq2btdJLs1O4p8q8296/bzZfniZFcQgjCN0A78h6E+WsW+X9NAKryPcoY4
         6ldg==
X-Gm-Message-State: AFq9FYISSVJHipEOWSyGCTvqIUj4ThDpT0/sqs+v23ge73vnVDrBDOlr
	yy0MuDQOGJVX2lZ/BjpiGZpWnX3cRsi4sSxBbtNjeiaI7RrYa1KBOrGkeBSgt7Hmf9w=
X-Gm-Gg: AYBFou1B5N/2wtvA/5HLdNA2tRL4PvRWCQ83xJDfkp+2aVZ5sxCcHSw0zGWIRiXJ+5a
	8VHuBFtxqro2Kv170jra4coIr5XY9Ho9OLwIIb4nk/vZXh9pXl0KEGJ5uhnQXsOZXLp5LVMMX1H
	E9TJcyExc8Cb3hQDTKalra3+0qnsbzx+9oh2KsPs+Ab4F+SsR0Xkd3qWHjHmOG1QQcAgKoSIGvA
	Sv+im9JhN7cxOGAWOEB4jdC9uzrnrpxDDG2m3oXjE+fcUDcz3R6kr8ebCvLZ2UEbv7/sPwaBEN8
	mrDfqM2TgTnBSEnosv72+PPnw7Fzux6Y1T+yDpvZfVREQxplqC/GRgbjsncQnv6C8/Zb+70waIn
	bCv56rfhW5zL+KVRO2ryPSINb/GlJcMGHk1HqZXK5eJmy3Mw5WN26hJs5O9mGXfNCOniePxqTgV
	pNB9HxtDXxV4dtnRoFRrKhb83vXbdcKMaldWyv8NchRhczwr/FpaANGEH36mYOD84Dtslv5Wl5z
	o6ZmAOKyE5nXrVTng5l73+YLhdqIauA/w5BwGXszPyXsxY8p5tc67mwf2lXDZVXABJnkNdsgz2a
	gCmnPcIi3WOwASEPG3eKjKJhsRmudv7xx0k+uRU5we6cVc5EhwRjjuv3Fct6KAEx
X-Received: by 2002:a05:701b:458e:10b0:195:c6c2:c6b with SMTP id a92af1059eb24-19937abc802mr11936974c88.35.1793074956099;
        Mon, 26 Oct 2026 21:22:36 -0700 (PDT)
Received: from m.tailc35649.ts.net ([2401:4900:1c0f:90b7:e702:7c19:441a:f9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm26568725c88.8.2026.10.26.21.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:22:35 -0700 (PDT)
From: Mrigendra Chaubey <mrigendra.chaubey@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable HDMI display
Date: Tue, 27 Oct 2026 09:52:31 +0530
Message-ID: <20261027042231.499107-1-mrigendra.chaubey@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_212237_678350_BF1618F6 
X-CRM114-Status: GOOD (  14.47  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

The EVM drives its HDMI port from DSS1 VP0 over DPI through a SiI9022
bridge on MAIN I2C1. The bridge reset, its interrupt and the DDC/HPD
level-shifter enable are lines of a TCA6416 expander on the same bus.

Add the expander, the bridge, the HDMI connector and the DPI pinmux,
and enable DSS1 with VP0 clocked directly from the HDMI PLL.

Keep the bridge out of reset using a GPIO hog rather than reset-gpios:
after a reset pulse the SiI9022 NAKs its first I2C transfer, so the 
sii902x probe fails with -EREMOTEIO.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Yashas D <y-d@ti.com>
[mrigendra.chaubey: squashed ti-linux-6.18.y commits 65b8b66908be and
 589e383cef77; carried over the DSS1 ports node and dss1_pins_default
 from the AM62P DSS series; dropped the unused OLDI reset hog,
 EXTPCLKIN pin and bridge audio properties; added bus-width and
 documented the reset hog. Tested on J722SXH01EVM.]
Signed-off-by: Mrigendra Chaubey <mrigendra.chaubey@gmail.com>
---
Depends on patches 4, 5 and 14 of the AM62P display series v3:
https://lore.kernel.org/all/20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com/

Also depends on patches 1-3, reposted as patches 1-3 of:
https://lore.kernel.org/all/20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com/

Tested on J722SXH01EVM with Linux v6.18.58 and an HDMI display
connected; sii902x and tidss probed successfully. Builds and passes
dtbs_check on next-20261026 with the prerequisite patches applied.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 172 ++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index c6486cf5a0..90c5151f52 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -220,6 +220,18 @@ transceiver2: can-phy2 {
 		standby-gpios = <&exp1 17 GPIO_ACTIVE_HIGH>;
 	};
 
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
+
 	csi01_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-state-cells = <1>;
@@ -260,6 +272,14 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
 		bootph-all;
 	};
 
+	main_i2c1_pins_default: main-i2c1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C24) I2C1_SCL */
+			J722S_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (A22) I2C1_SDA */
+		>;
+		bootph-all;
+	};
+
 	main_i2c2_pins_default: main-i2c2-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
@@ -366,6 +386,45 @@ J722S_IOPAD(0x030, PIN_INPUT, 7) /* (K23) GPIO0_12 */
 		>;
 	};
 
+	main_gpio0_ioexp_intr_pins_default: main-gpio0-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0110, PIN_INPUT, 7) /* (G27) MMC2_DAT1.GPIO0_67 */
+		>;
+	};
+
+	dss1_pins_default: dss1-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0100, PIN_OUTPUT, 0) /* (AB23) VOUT0_VSYNC */
+			J722S_IOPAD(0x00f8, PIN_OUTPUT, 0) /* (AB24) VOUT0_HSYNC */
+			J722S_IOPAD(0x0104, PIN_OUTPUT, 0) /* (AC26) VOUT0_PCLK */
+			J722S_IOPAD(0x00fc, PIN_OUTPUT, 0) /* (AC27) VOUT0_DE */
+			J722S_IOPAD(0x00b8, PIN_OUTPUT, 0) /* (W27) VOUT0_DATA0 */
+			J722S_IOPAD(0x00bc, PIN_OUTPUT, 0) /* (W25) VOUT0_DATA1 */
+			J722S_IOPAD(0x00c0, PIN_OUTPUT, 0) /* (W24) VOUT0_DATA2 */
+			J722S_IOPAD(0x00c4, PIN_OUTPUT, 0) /* (W23) VOUT0_DATA3 */
+			J722S_IOPAD(0x00c8, PIN_OUTPUT, 0) /* (W22) VOUT0_DATA4 */
+			J722S_IOPAD(0x00cc, PIN_OUTPUT, 0) /* (W21) VOUT0_DATA5 */
+			J722S_IOPAD(0x00d0, PIN_OUTPUT, 0) /* (Y26) VOUT0_DATA6 */
+			J722S_IOPAD(0x00d4, PIN_OUTPUT, 0) /* (Y27) VOUT0_DATA7 */
+			J722S_IOPAD(0x00d8, PIN_OUTPUT, 0) /* (AA24) VOUT0_DATA8 */
+			J722S_IOPAD(0x00dc, PIN_OUTPUT, 0) /* (AA27) VOUT0_DATA9 */
+			J722S_IOPAD(0x00e0, PIN_OUTPUT, 0) /* (AA25) VOUT0_DATA10 */
+			J722S_IOPAD(0x00e4, PIN_OUTPUT, 0) /* (AB25) VOUT0_DATA11 */
+			J722S_IOPAD(0x00e8, PIN_OUTPUT, 0) /* (AA23) VOUT0_DATA12 */
+			J722S_IOPAD(0x00ec, PIN_OUTPUT, 0) /* (AA22) VOUT0_DATA13 */
+			J722S_IOPAD(0x00f0, PIN_OUTPUT, 0) /* (AB26) VOUT0_DATA14 */
+			J722S_IOPAD(0x00f4, PIN_OUTPUT, 0) /* (AB27) VOUT0_DATA15 */
+			J722S_IOPAD(0x005c, PIN_OUTPUT, 1) /* (U27) GPMC0_AD8.VOUT0_DATA16 */
+			J722S_IOPAD(0x0060, PIN_OUTPUT, 1) /* (U26) GPMC0_AD9.VOUT0_DATA17 */
+			J722S_IOPAD(0x0064, PIN_OUTPUT, 1) /* (V27) GPMC0_AD10.VOUT0_DATA18 */
+			J722S_IOPAD(0x0068, PIN_OUTPUT, 1) /* (V25) GPMC0_AD11.VOUT0_DATA19 */
+			J722S_IOPAD(0x006c, PIN_OUTPUT, 1) /* (V26) GPMC0_AD12.VOUT0_DATA20 */
+			J722S_IOPAD(0x0070, PIN_OUTPUT, 1) /* (V24) GPMC0_AD13.VOUT0_DATA21 */
+			J722S_IOPAD(0x0074, PIN_OUTPUT, 1) /* (V22) GPMC0_AD14.VOUT0_DATA22 */
+			J722S_IOPAD(0x0078, PIN_OUTPUT, 1) /* (V23) GPMC0_AD15.VOUT0_DATA23 */
+		>;
+	};
+
 };
 
 &cpsw3g {
@@ -627,6 +686,84 @@ tlv320aic3106: audio-codec@1b {
 	};
 };
 
+&main_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c1_pins_default>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	exp2: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "DSI_Mux_SEL_2", "GPIO_eDP_ENABLE",
+				  "DP0_PWR_SW_EN", "GPIO_OLDI_RSTn",
+				  "GPIO_HDMI_RSTn", "HDMI_LS_OE",
+				  "", "",
+				  "DSI_GPIO0", "DSI_GPIO1",
+				  "DSI_EDID", "IO_eDP_IRQ",
+				  "OLDI_INT#", "HDMI_INTn",
+				  "", "";
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <67 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio0_ioexp_intr_pins_default>;
+		bootph-all;
+
+		p04-hog {
+			/*
+			 * P04 - GPIO_HDMI_RSTn: keep the SiI9022 out of reset. Not
+			 * reset-gpios: after a reset pulse the bridge NAKs its first
+			 * I2C transfer, which fails the sii902x probe with -EREMOTEIO.
+			 */
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "GPIO_HDMI_RSTn";
+		};
+
+		p05-hog {
+			/* P05 - HDMI_LS_OE: enable the DDC/HPD level shifter */
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "HDMI_LS_OE";
+		};
+	};
+
+	sii9022: bridge-hdmi@3b {
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+		interrupt-parent = <&exp2>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					bus-width = <24>;
+					remote-endpoint = <&dss1_dpi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &main_i2c2 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -844,4 +981,39 @@ &mcu_i2c0 {
 	status = "okay";
 };
 
+&dss1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dss1_pins_default>;
+
+	/*
+	 * VP0 ("vp1" clock) drives DPI, not OLDI: take its pixel clock directly
+	 * instead of through the SoC default OLDI /7 divider.
+	 */
+	clocks = <&k3_clks 232 8>,
+		 <&k3_clks 232 0>,
+		 <&k3_clks 232 4>;
+
+	assigned-clocks = <&k3_clks 241 0>,	/* DSS1-VP0 */
+			  <&k3_clks 240 0>,	/* DSS1-VP1 */
+			  <&k3_clks 245 0>;	/* DPI Output */
+	assigned-clock-parents = <&k3_clks 241 2>,	/* PLL 17 HDMI */
+				 <&k3_clks 240 1>,	/* PLL 18 DSI */
+				 <&k3_clks 245 2>;	/* DSS1-DPI0 */
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* DSS1-VP0: DPI -> SiI9022 -> HDMI */
+		port@0 {
+			reg = <0>;
+
+			dss1_dpi0_out: endpoint {
+				remote-endpoint = <&sii9022_in>;
+			};
+		};
+	};
+};
+
 #include "k3-j722s-ti-ipc-firmware.dtsi"
-- 
2.43.0


