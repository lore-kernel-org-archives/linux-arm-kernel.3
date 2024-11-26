Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB489D65559
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO6XpbsmfDMTTfpVaq/O4i++ICaY0nJXlftKGPZc4lA=; b=kpZ2y56jNDghnxjZSHbj2WqPls
	JEyVqCgSFavw8m7A5N25QyWa9PvQbgqk0mE99EWdkh0tt6IcPkspMiLmOj/HYpG0Oomu4DSNuhJIk
	n0e/qS6eeHzMueP54IQONEdfx7v5H7L3LUnJHy2alQD7UBdmrNMvyNHqLKIpoJFJndGNN+dYaN4r9
	7TfNXr8v06+gwJo6rkufSGAbf4uortjTd8qFcBH2afUAvoia5zxXN/6cfNHW55Iml/S3KyoUwPYC1
	GbeAAcUIBbLBKlYWXmR7aj2h4nd61FIGsgLFZ9wgNfRs9JUusM1Obiev14GxWi4Ec1TP3X3nMDEVB
	KK7tFQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2YV-0000000Bgyr-2DXN;
	Tue, 26 Nov 2024 20:53:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2Tn-0000000BgHn-2S2e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 20:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABD95A41413;
	Tue, 26 Nov 2024 20:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5443C4CED3;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654093;
	bh=3sfwidJbVEfmW6zxaxyjnfU+ygUlFzzFkMzDLVh/wfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qwy7qRytUbDPXbnhZYUz1OyCHBrgynuDosnuP6FApFOuv+o1zYReI3X1sMTv78IFr
	 WZKgGodHntj+rYDlSQdLIWL6x7U1kTrtYowW0pL9UrgGjvojBVHOweEoDuZUDTMb4G
	 rZZ+BExcAMi+jfaL+njkphmJ/V5k4u6HROyST8tSLLTd4O3mMYxhc1eD73fiIpcHUX
	 UWo8fw5cxPgV0mtkSjXiDWb/1liJ9HU3RNzFCVcZhrKwh+wSegtmdySnHDI9dachFH
	 DSMqPeErte2xuYM7/9iNqrPbY4mq18qD5wj0FX91zBSE2lvGeGOjJeTzktzek74vfF
	 /6fjpfHJs2QHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA719D65525;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 26 Nov 2024 21:48:01 +0100
Subject: [PATCH 3/4] arm64: dts: apple: Add touchbar digitizer nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-z2-v1-3-c43c4cc6200d@gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=4794;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=gqYKJvX7z4TYFIJsxMCI4+iHYsE1/zB864hQ5FlH8lE=;
 b=Nw0G9eeqDcbozBTTSvbTNsP02fpKEivr65A5bAVLeDx3aczp+j91xqgla8OBRfAY6NSjMiyh1
 M0XVh9RkM2eBs2Lz7HYpPRPm4B1HrmkDyzdg+gzTUKKZC5iUDEJs8MC
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_124815_764563_7F2717E9 
X-CRM114-Status: GOOD (  11.64  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Adds device tree entries for the touchbar digitizer

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 24 ++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi     | 19 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++
 4 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 56b0c67bfcda321b60c621de092643017693ff91..a1c4e5731f2147121a9845bc9f34d224025fb145 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -28,6 +28,10 @@ led-0 {
 			default-state = "keep";
 		};
 	};
+
+	aliases {
+		touchbar0 = &touchbar0;
+	};
 };
 
 &bluetooth0 {
@@ -38,6 +42,26 @@ &wifi0 {
 	brcm,board-type = "apple,honshu";
 };
 
+&spi0 {
+	status = "okay";
+
+	touchbar0: touchbar@0 {
+		compatible = "apple,j293-touchbar",
+			"apple,z2-touchbar", "apple,z2-multitouch";
+		reg = <0>;
+		spi-max-frequency = <11500000>;
+		spi-cs-setup-delay-ns = <2000>;
+		spi-cs-hold-delay-ns = <2000>;
+		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
+		cs-gpios = <&pinctrl_ap 109 0>;
+		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
+		firmware-name = "apple/dfrmtfw-j293.bin";
+		touchscreen-size-x = <23045>;
+		touchscreen-size-y = <640>;
+		label = "MacBookPro17,1 Touch Bar";
+	};
+};
+
 &i2c2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 9b0dad6b618444ac6b1c9735c50cccfc3965f947..dc72aae3844bf33579f623f0b01abc7de4033af4 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -326,6 +326,13 @@ clkref: clock-ref {
 		clock-output-names = "clkref";
 	};
 
+	clk_200m: clock-200m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;
+		clock-output-names = "clk_200m";
+	};
+
 	/*
 	 * This is a fabulated representation of the input clock
 	 * to NCO since we don't know the true clock tree.
@@ -441,6 +448,18 @@ fpwm1: pwm@235044000 {
 			status = "disabled";
 		};
 
+		spi0: spi@235100000 {
+			compatible = "apple,t8103-spi", "apple,spi";
+			reg = <0x2 0x35100000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_200m>;
+			power-domains = <&ps_spi0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled"; /* only used in J293 */
+		};
+
 		serial0: serial@235200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x35200000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 0ad908349f55406783942735a2e9dad54cda00ec..03fb711b3a1fa767ba70807a6d3404e4d52eb783 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -20,6 +20,7 @@ / {
 	aliases {
 		bluetooth0 = &bluetooth0;
 		wifi0 = &wifi0;
+		touchbar0 = &touchbar0;
 	};
 
 	led-controller {
@@ -67,3 +68,22 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&spi3 {
+	status = "okay";
+
+	touchbar0: touchbar@0 {
+		compatible = "apple,j493-touchbar", "apple,z2-touchbar", "apple,z2-multitouch";
+		reg = <0>;
+		label = "Mac14,7 Touch Bar";
+		spi-max-frequency = <8000000>;
+		spi-cs-setup-delay-ns = <2000>;
+		spi-cs-hold-delay-ns = <2000>;
+
+		reset-gpios = <&pinctrl_ap 170 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&pinctrl_ap 174 IRQ_TYPE_EDGE_FALLING>;
+		firmware-name = "apple/dfrmtfw-j493.bin";
+		touchscreen-size-x = <23045>;
+		touchscreen-size-y = <640>;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 1666e6ab250bc0be9b8318e3c8fc903ccd3f3760..977c1ca5e8c1b566bb3876b6619ea8812b98e072 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -467,6 +467,20 @@ fpwm1: pwm@235044000 {
 			status = "disabled";
 		};
 
+		spi3: spi@23510c000 {
+			compatible = "apple,t8112-spi", "apple,spi";
+			reg = <0x2 0x3510c000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 751 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkref>;
+			pinctrl-0 = <&spi3_pins>;
+			pinctrl-names = "default";
+			power-domains = <&ps_spi3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		serial0: serial@235200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x35200000 0x0 0x1000>;

-- 
2.47.1



