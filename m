Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4D2C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJyYuIzEP97cm89L88l359VJouC3QafW8DAfksKCUYw=; b=FOkH5rwSdkNhEnl/0olgAbS99b
	pZUw4v13Xg7ud+fmgnBsvqr74gnU1L6q0aK4e4Lgo6Yo8zLvaF15NMhO28HFStgKJyZ6wETotc6Ih
	zDT8fbc8gYK1VPMRD656xkTgtCSc6PCvZ27WdLabO+2wnH/uWjI5xP0eSg4ztt08aqv+sCXmXulKa
	GEciDFyLtVEe6nqAi7jXQqgbAy7oc4+2Sb4ULqYPgGFRzignlKxF+eXE5AtFMrTnNYltziz/IEmTQ
	TI/QmWpoe4uJPGYK1qeV7eWwbd7i3sd8e1LTeACtBuv3qH2Cx6v799keQRH+7tEjU1XXfzKxEIyWU
	9vPmoRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxEq-0000000EpK9-36aE;
	Thu, 23 Jul 2026 17:29:40 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxEn-0000000EpJ2-28kE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:29:39 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 160328422B;
	Thu, 23 Jul 2026 19:29:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lBOqesrNlnk; Thu, 23 Jul 2026 19:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784827762; bh=HOw79g3ooG6NNzkyYSEvjfgfmCBbxswKnKtrHqLTX78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RzUHcxycuXEGLDrrMTO9V+C3e4p7X+LYEB8EK/mhCTLlatUrmU44MOHSI4vyKn19F
	 cg6+WqFxEx/ozRh2D4ZhCagxx3TWNeXpe8KzWAjGpbdUQjZKnVXZxdljUDZHuij2hI
	 zvINWxQtImmzJ6cEfb+TNop7bvdVPmez88hnQkOE7rVY6cM86ppwmCkYIrnIfVJ5hF
	 CT9fDsYqGa3Mx2NCDAozq8eyLl1S30oL4t+akMuFCv9L0GMEMN7WLNmh06sd9zGdCa
	 UXurRgiJ9mUzmMtkBxMqWKb0jOv6x0l6uJ4iq5iQBQb7FAYGVvuhG/zhTeEceupw42
	 cl0Yd/Y32+tUQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 23 Jul 2026 22:58:35 +0530
Subject: [PATCH 3/3] arm64: dts: exynos7870-j6lte: add Sharp GP2AP070S
 proximity sensor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-gp2ap070s-v1-3-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
In-Reply-To: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_102937_711077_402C7DEF 
X-CRM114-Status: GOOD (  12.40  )
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

The Sharp GP2AP070S is a proximity sensor, which is connected to a
GPIO-driven I2C line. Define the devicetree node for the sensor.

The sensor requires two voltage supplies, one of which is from the
primary regulator bank of the device, while the other one is controlled
by the GPIO. Add a regulator wrapping over the concerned GPIO so as to
feed it to the sensor node.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 55 ++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index de30d0970336..dd493138fed6 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -73,6 +73,35 @@ key-volup {
 		};
 	};
 
+	i2c-proximity {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c_proxm_bus>;
+
+		sda-gpios = <&gpf4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpf4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		i2c-gpio,delay-us = <2>;
+
+		proximity@39 {
+			compatible = "sharp,gp2ap070s";
+			reg = <0x39>;
+			interrupt-parent = <&gpa0>;
+			interrupts = <5 IRQ_TYPE_EDGE_BOTH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&proxm_irq>;
+
+			vdd-supply = <&vdd_fixed_proxm>;
+			vled-supply = <&vdd_ldo33>;
+
+			proximity-near-level = <500>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x3d800000>,
@@ -94,6 +123,16 @@ vdd_fixed_mmc2: regulator-fixed-mmc2 {
 		enable-active-high;
 	};
 
+	/* proximity: vdd */
+	vdd_fixed_proxm: regulator-fixed-proxm {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fixed_proxm";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpd2 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <1>;
@@ -354,13 +393,12 @@ vdd_ldo32: ldo32 {
 				regulator-ramp-delay = <12000>;
 			};
 
+			/* proximity: vled */
 			vdd_ldo33: ldo33 {
 				regulator-name = "vdd_ldo33";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <12000>;
-				regulator-boot-on;
-				regulator-always-on;
 			};
 
 			/* touchscreen: vdd */
@@ -556,6 +594,13 @@ pmic_irq: pmic-irq-pins {
 		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
 	};
 
+	proxm_irq: proxm-irq-pins {
+		samsung,pins = "gpa0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
+	};
+
 	touch_irq: touch-irq-pins {
 		samsung,pins = "gpa0-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
@@ -579,6 +624,12 @@ bt_enable: bt-enable-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 	};
 
+	i2c_proxm_bus: i2c-proxm-bus-pins {
+		samsung,pins = "gpf4-3", "gpf4-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
 	wlan_enable: wlan-enable-pins {
 		samsung,pins = "gpd3-6";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;

-- 
2.54.0


