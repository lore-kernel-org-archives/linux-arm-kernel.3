Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBACC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qn8v1Eksg+mm5AvEmis6zfmzZch9hjVnjwl+QtZCKeM=; b=JjgsObs/yvbjQAAT08vRErMoIm
	ZgIVR1ALa8M7Du4apCqVFKUZaeDUd7UdqbB9k21jmIck2YplOeDnRjAHYLgwaT2pbgSFVUXMmNw0T
	bcx11BJ1sKk3zHSRJyGkZFt1IiNwOkAk1JsCwsbMisrApYADMSR5PKLw0ZxOrR/SWO9HkEEoeZYiS
	BlkrGRoouo8YbXJWU2XGdywpjXVF8JMuXRogpgGWrXxpFVhGZ3NxPeVVGmQhsCdM53vfS5jSTQW4o
	zTZ73vt9godlAqRwE94gRkHgF0CPuY39eaEIg/bqD7xcLV9eaeDBN7KnvLHGGrusw6mU4qXobady2
	StkBheSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx8n-0000000AqFX-3oSp;
	Wed, 15 Jan 2025 06:44:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXx6K-0000000Apge-1FA5;
	Wed, 15 Jan 2025 06:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45354A416B3;
	Wed, 15 Jan 2025 06:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95B79C4AF0E;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736923322;
	bh=/SxWTdCue2Zckk922hHwnnWaopJsKHsFX0I+Fn2cw78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nr0WRWZvGDbfSz1za78/JC43yAlPNRviy98r8R281RFv7Qim8ujemIXeMNUls6W+m
	 x3b9DGCR1kVzNlcnA6XN0zgAhrEsaY/Gs2QXOOoCJWX55R2TZSaRyMAk26bQa3d610
	 jiVeZqnMEhuRlUMYGdi36gOa015pmshOQg7W9fpamSVtGQeODxsQzgkRgPE5HS1NHv
	 lLRjOImadENovohuHjBEtu5tiX1cQVWBjpcFqCCxbsGsI+Ung4BQ6fHBi8BpRR/g8M
	 FsSRysgIRy9jrn6UntRWJyVzp2atKdSEhc+0aks7KNsd3p0hNg/OAu6RBd+o2qVrqG
	 ae77z73Pn+X5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7EEC02183;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 15 Jan 2025 14:42:02 +0800
Subject: [PATCH v3 4/5] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-amlogic-pinctrl-v3-4-2b8536457aba@amlogic.com>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
In-Reply-To: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736923319; l=4311;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=aSN6d2kaDXKKbqczcIvQuPYJ0HGVmaQE8fAHhpyYx2c=;
 b=A3lIedjFIMKh+Tn+ans+gYRNWfCn0w64CYmHQhJ6r3KU9QgPzShZsDaBmV6LofdZ0Gu3ZoY4t
 VGRiLnLkvAYDChN70RYsfVIDjnEmTCUCChMtssOGZCF+FWxoOm2cZ6u
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_224204_514384_8D07E72F 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add pinctrl device to support Amlogic A4 and add uart pinconf.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 133 ++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..8eb95580d64a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,135 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl {
+		compatible = "amlogic,pinctrl-a4";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpiox: gpio@4100 {
+			reg = <0 0x4100 0 0x40>,
+			      <0 0x400c 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_X>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
+		};
+
+		gpiot: gpio@4140 {
+			reg = <0 0x4140 0 0x40>,
+			      <0 0x402c 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_T>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
+		};
+
+		gpiod: gpio@4180 {
+			reg = <0 0x4180 0 0x40>,
+			      <0 0x4040 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_D>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
+		};
+
+		gpioe: gpio@41c0 {
+			reg = <0 0x41c0 0 0x40>,
+			      <0 0x4048 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_E>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
+		};
+
+		gpiob: gpio@4240 {
+			reg = <0 0x4240 0 0x40>,
+			      <0 0x4000 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_B>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+		};
+
+		gpioao: gpio@8e704 {
+			reg = <0 0x8e704 0 0x16>,
+			      <0 0x8e700 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_AO>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
+		};
+
+		test_n: gpio@8e744 {
+			reg = <0 0x8e744 0 0x20>;
+			reg-names = "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			bank-number = <AMLOGIC_GPIO_TEST_N>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+		};
+
+		func-uart-a {
+			uart_a_default: group-uart-a-pins1 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 12, 1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 13, 1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 14, 1)>;
+			};
+
+			group-uart-a-pins2 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_D, 2, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_D, 3, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-b {
+			uart_b_default: group-uart-b-pins {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_E, 0, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_E, 1, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-d {
+			uart_d_default: group-uart-d-pins1 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 18, 4)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 19, 4)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+
+			group-uart-d-pins2 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 7, 2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 8, 2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 9, 2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 10, 2)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-e {
+			uart_e_default: group-uart-e-pins {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 14, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 15, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 16, 3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 17, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+	};
+};

-- 
2.37.1



