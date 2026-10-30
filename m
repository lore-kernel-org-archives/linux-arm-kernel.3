Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8513606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YlnFuW7P;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=kpSzL+Ah
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=; b=YlnFuW7Pa8p2e/
	KhtsTxqzymNiEsCtldVQ9BoqsbEBlSk6hO3CxdtgLifkYlnJ5iD7c8VQsWccz2ZwunjXiJx7Z6Svw
	qrtV/HQY4MbA0wForaqIeuVNhI0xnMhBzfSSf+OtS5jz2rRIQ1FXbdzIdx11TfQuK/gnqBhcY+t+v
	dh49xMfy/qhP6OysFhyoO3PVbB/7Yka1CG51AXrlUA0LfK5vBanIi+oi79YKn4E29y+MxW/TMKt1o
	v4a08h+pIdNu7r5YX0SavJWqoQdmfV7w91FCDKeH2qSltK9Le5Kcj7FPE+YbfPFz9lj3fUR81lDNW
	Vr0KW9Dozliodp4ixQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaQ-0000000C8oX-2v4T;
	Fri, 30 Oct 2026 16:36:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaE-0000000C8iL-3btu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:36:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so9079355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378159; x=1793982959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
        b=kpSzL+Ahxu5YCBXfdjI0mcjYdmNsjdLt2WUaA/KUKfsBPgOVV8wG2FepbtdC77vO6Q
         PPCjYpIffkYVZrYGq6NE6o7BwThEkMUZRxqytiN19adDXGjAaWVwbVI4na2Lzw5zRYzE
         hL62wZl7l8Zun3uBdlhRlrTz+QDzzylxtzayw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378159; x=1793982959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z35yEEi9TZLdCD1HTNmsvOHqwJ3ebC3waffosyNXYts=;
        b=XhYUHQIIgygZ1nAlfvnI7pCN47nsbHEjBGIShvZnClww8EibLcB5Kh1Vt+pbB1/3iJ
         l0Uma1GvBAPH822ZWnN39mq5A5f+r3kRAwVnNVfvyTcZa6SVMBNm8r2bMdToHAWXIzVw
         B3TwmV7BbnyujbhOP1hyHC9B1T7a4v+An3H/LCvUhGqf6EEmtG0L+PBGJk22jYFpcbWB
         rAFfcss1Iek0Q2xLrw/PzTizW4vbYlfv+yy5oQZf4Pg9caOMfCjIuo+jNVxyYC64cVZZ
         Vx9cH3PYY5HhJFs8pPCLYoKWj0opOj1EUekggxyAzmp8P7qkEUcCnK8E+Rv5bjE1L6zv
         QlwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzee+MvFOkdHw9v7nQBzEbSp0Ley4ekR1Due7agLeV4XFhS8R3kEDjSj+GHLUkC9DMq98R9dAL7O9AUyNqYpzmj@lists.infradead.org
X-Gm-Message-State: AFq9FYJpkaLPnIe82wYHdzbxMdhEAyfmwho87GP6jZSgbM7r2AXNpaHT
	W/cTos/lp++CTP/N7jUHnHmXbkfTZAHAJcLB/+0JqXaqLvoBOMj1SSItiwQUYxM38ag=
X-Gm-Gg: AYBFou3w9SrKQ0YZl6BlcI9rhh8MeLzvhGUgq9zt0zKRBJSnTu+cTPJ9BT24njhDG5K
	TACE4HoEGJJJy/49dayuRbyGvJ202JKguSOp/aqj5vovl+AX4FlSRy6vPXsNkGdjmmcIN4Q+D+O
	32mNy9NrUHM5oNN0i3N+KbLsd9dXGI18Ym0IgZ2TCumwnmtZDPqjVCpfWA7kp4UNO7G3cLAngjU
	hGYM9EPX/2K1+P2HPpfpJGn3pPQTu9Fe8iIbgFy2RL7Oiv3DMr8mdkV+EMwbfefldtlrTOIOM/z
	TpnCxQfZtkJ41mq2ZVKT08iD8yE5kiEDW+tnTCkq4LrzfQQVpk2PL+a2juc5msImJelrFMRXdfu
	PBx948JIKDIenCfDs/0soacbMJBoyCQ3y6exXrJNLarSyF8ArkPd1lnc2ldjPwDDXOkTLMzTF+x
	XZykYhBDz1dFKqvaMakS/jGSDy69fP3HyFSUa9D6zriqNGD8FmODLmOlAM7sWovbnIzReoDnlhH
	mWmkcyG7Zd467TqwGRaQgYJHt9jdarcaadWNKkztfh3XsD6D+Eaaj4QVsTuK5cS3Dzok9QzuO2Y
	dkPykA7MVZ0cDHI/2QFMOJeLaoXsIjfu0KMIMbrJYA0biWvRHhr9Gt8O0kuMqRZjm32Aa/OucnU
	su736kfUsaPK/ZRkLKhkcPMNkSV3UAuabGqkCkqjfHMU7rNi/+W4SJr9vWgxlzpBXrR3pC9FUao
	1DnAn9Eh0uaqOPDZqE1hibZUf9XQ==
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr61761445e9.23.1793378158975;
        Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:43 +0100
Message-ID: <20261030163547.2682583-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093602_967642_C3A02756 
X-CRM114-Status: GOOD (  16.03  )
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

Support Engicam i.Core MX8M Plus Fast Ethernet C.TOUCH 2.0 board with:

 - 10/100 Ethernet
 - CAN
 - RTC
 - USB host, through an on-board hub
 - USB OTG, device only
 - Micro SD card connector
 - LVDS display connector

The C.TOUCH 2.0 carrier board is described in a separate dtsi, so that
it can be shared with the other i.Core MX8M Plus SoMs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
 .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
 3 files changed, 184 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..bf324cdec879 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -655,6 +655,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
 DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-fe-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
new file mode 100644
index 000000000000..5338aeb6ec92
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ *
+ * Engicam C.TOUCH 2.0 carrier board for i.Core MX8M Plus SoMs.
+ */
+
+/ {
+	aliases {
+		rtc0 = &pcf8563;
+		rtc1 = &snvs_rtc;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm2 0 100000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <80>;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	pcf8563: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "okay";
+};
+
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+/* USB OTG, device only */
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+/* USB host, through the on-board hub */
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+/* micro SD */
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT	0x116
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x40
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x40
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
new file mode 100644
index 000000000000..c4271cffca9a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include "imx8mp.dtsi"
+#include "imx8mp-icore-mx8mp-fe.dtsi"
+#include "imx8mp-icore-mx8mp-ctouch2.dtsi"
+
+/ {
+	model = "Engicam i.Core MX8M Plus Fast Ethernet C.TOUCH 2.0";
+	compatible = "engicam,icore-mx8mp-fe-ctouch2", "engicam,icore-mx8mp-fe",
+		     "fsl,imx8mp";
+};
-- 
2.43.0


