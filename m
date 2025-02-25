Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08AC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 22:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kW7GoPKxdws4F/zRu0zCMdtqGUMtfGCriJS0d8t8p9s=; b=xElt11/FUOcRIh+yhdCGoeXDOv
	kc4UgUmEsw+jeKnYzi2bpdBVh4FQc8LuJFovMOefSgoZFxDgrmrZ9vKYAV/bqhsj89E7kHWC6h45M
	ViIAf4FTNSjmeN2g1UxNeHw56lKwC5Fangkw51HWK0yCsBfnTMQCMXtw/OWFbqBRZJ+r0gtqev6SB
	pT/EUU5RWb0IPndKJQAC8A+2x1fFx2X1qnopr6SMUs5/HBpXVKdpF6NQaYhWYVjSbTUne1iPhfY5t
	3uwqBWDnUe+wS5+GWu/ntIhy5qP/0utDia8AhEQZO7/I//9vScDO3pPXDsvqotvPiCAF1J3DB6S6K
	/ntbu8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3Yt-00000001jBq-1FCM;
	Tue, 25 Feb 2025 22:37:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2LR-00000001WK0-2bu6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D6185C1628;
	Tue, 25 Feb 2025 21:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CB9EC4CEDD;
	Tue, 25 Feb 2025 21:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740518400;
	bh=ghGqvv7GAFe1nH4x2u9vuYujrKPbpOccmWJvpRRHSB0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oEfLsdZidnIj7asGdSYT+SxvKF0L4dS9GdI91lLDxuTpfI9v9DUnVfXSE4Oz5ZPAd
	 YB29VFmLy4Mz4ASTZqX0gYJ/OV3y7PzfEdXYNA0i9dxgk8P8Qy8/0w7Y0/XMrLY+vI
	 JR7JiVxPJmGGxMhglc/tDiz1V5dB9Oexp/SvHn6aeRlJC7XvUGlwxcq5+sa/m9Z8Yd
	 yc0vwG929D7/SIo90G+gOx7Jga1A2G584Tfeek0vUzr4sxXI/jq6L1RsoA6b+eyvTS
	 YUNOrhAqeXT1DrCJmvCn3t8PWq3WHCo2enUNxP/L5OcnTsGQLFQLi5oYMVeAS5lYn3
	 6XYT0dwRc0QDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D316C021B2;
	Tue, 25 Feb 2025 21:20:00 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 25 Feb 2025 22:19:54 +0100
Subject: [PATCH] arm64: dts: apple: Add touchbar digitizer nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-z2-dts-v1-1-df101a7c17c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPkzvmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNT3Soj3ZSSYt3URBMjQ+OUVJNEIyMloOKCotS0zAqwQdGxtbUANAL
 YuFgAAAA=
X-Change-ID: 20250225-z2-dts-ea4213de4a22
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740518398; l=3677;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=SeavfPLsBuaZJzKTxcJ2pMU97oNr50qsmltlLTUZBAI=;
 b=IUfKp0rV+n8SLeaZzuhEz2/BzCOvdP8DpjHRR8/QFLEjh1S/nritzhjqCFiwTm60uKcGoQUhS
 9UVzH2t39tdApIBmwR7Ffe/bhkqbKOeo/4fAKbwTsfJ3q1LtGrjPK6y
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_132001_787298_C5890F1D 
X-CRM114-Status: GOOD (  13.41  )
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
Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 27 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi     |  2 +-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 56b0c67bfcda321b60c621de092643017693ff91..0a93d3891c23da8b8c77dce64001caacb69ee140 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -17,6 +17,14 @@ / {
 	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
 
+	/*
+	 * All of those are used by the bootloader to pass calibration
+	 * blobs and other device-specific properties
+	 */
+	aliases {
+		touchbar0 = &touchbar0;
+	};
+
 	led-controller {
 		compatible = "pwm-leds";
 		led-0 {
@@ -49,3 +57,22 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&spi0 {
+	cs-gpios = <&pinctrl_ap 109 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	touchbar0: touchbar@0 {
+		compatible = "apple,j293-touchbar";
+		reg = <0>;
+		spi-max-frequency = <11500000>;
+		spi-cs-setup-delay-ns = <2000>;
+		spi-cs-hold-delay-ns = <2000>;
+		reset-gpios = <&pinctrl_ap 139 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
+		firmware-name = "apple/dfrmtfw-j293.bin";
+		touchscreen-size-x = <23045>;
+		touchscreen-size-y = <640>;
+		touchscreen-inverted-y;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 0ad908349f55406783942735a2e9dad54cda00ec..045bd0716cb7d20c1379ebc1e3ff7f4d0dddc179 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -17,8 +17,13 @@ / {
 	compatible = "apple,j493", "apple,t8112", "apple,arm-platform";
 	model = "Apple MacBook Pro (13-inch, M2, 2022)";
 
+	/*
+	 * All of those are used by the bootloader to pass calibration
+	 * blobs and other device-specific properties
+	 */
 	aliases {
 		bluetooth0 = &bluetooth0;
+		touchbar0 = &touchbar0;
 		wifi0 = &wifi0;
 	};
 
@@ -67,3 +72,21 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+&spi3 {
+	status = "okay";
+
+	touchbar0: touchbar@0 {
+		compatible = "apple,j493-touchbar";
+		reg = <0>;
+		spi-max-frequency = <8000000>;
+		spi-cs-setup-delay-ns = <2000>;
+		spi-cs-hold-delay-ns = <2000>;
+		reset-gpios = <&pinctrl_ap 170 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&pinctrl_ap 174 IRQ_TYPE_EDGE_FALLING>;
+		firmware-name = "apple/dfrmtfw-j493.bin";
+		touchscreen-size-x = <23045>;
+		touchscreen-size-y = <640>;
+		touchscreen-inverted-y;
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 58d88f1ef92a32061765bd3b569fdae0255dcd7e..271986a7697f7033e96d11fb4ea6a50a467f0f2f 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -499,7 +499,7 @@ spi3: spi@23510c000 {
 			power-domains = <&ps_spi3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			status = "disabled";
+			status = "disabled"; /* only used in J493 */
 		};
 
 		serial0: serial@235200000 {

---
base-commit: 3febe9de5ca5267618675650871a626d0901f8cb
change-id: 20250225-z2-dts-ea4213de4a22



