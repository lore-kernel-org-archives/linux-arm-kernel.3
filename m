Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B26BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9SBUrAAk1NDr0xcsN8kM+SIzGkij32PCytMkcytIGAQ=; b=we7Y1t0btATXZi0fxfoV33Fh7I
	IOaBeBCyzfOPs/JydIhGAoltcK3ZJL1bgibRGw3Ry6+EKLKeMN9PdlBF8cdAQhfRuSD7gjx6jNdxG
	nTL2WMS54vUcA7BuzTIAIhWn0Q7eJ41dtmhUeD5T91zvHRUSYcs6d2GpFdce3Tzi8QE871VLb+l3/
	jS0wQs9vJYV8RzQ1iJvm3CajaThEsF1+16iv+PrapfwmtQ03VwdwgGeHmnMrzsWFfFVq/rcSMgY5T
	53UjdlI7uw9fFEufU0A23fBRYJWF5ARSzurouqmyFAIynFxuPG9tAulyWs6ViV+bApz3j74rG+UM2
	3rytdyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5gr-0000000Dm7L-0PaJ;
	Mon, 29 Jun 2026 06:41:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5gp-0000000Dm6F-1GFF;
	Mon, 29 Jun 2026 06:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA19460054;
	Mon, 29 Jun 2026 06:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59D70C2BCB8;
	Mon, 29 Jun 2026 06:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782715314;
	bh=NFuuFcb/ruJh3wvrl4TTnR1hgxROnRQip/VR2F/THy0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BWi51dZaDFBXTr5XrIKky5i25CHrbQToYpeLA72LEB+hyVegKpoIkhAA6RIvCOQhO
	 IKXaP9U7b3MM7CC1iG3Bbr4BRchL3b1AnqNJ7jO6wDHacsCGwC/MhbnVY3CXE536mZ
	 Y8HkOWFhDlyQQDHnhjvhOM8XLrg3BJMr3EsH/KgXvnGH4joqrBJG7i45oG0ESb3UmG
	 aMd6HVbtTZxkEwFwKpuwzx7AAUJlxCptbMK713HjYZZianKaexN9tkQQW+KUe0W9+s
	 QbTbE1ySTTFJbkSEKkNR7PzrDTn/PBzxFfFn/F6iAs2B6+cVwdQWuJG8LAegHbwjUV
	 c5KaaKLcWp+ZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4034EC43458;
	Mon, 29 Jun 2026 06:41:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 29 Jun 2026 06:41:51 +0000
Subject: [PATCH] arm64: dts: amlogic: add some device nodes for A9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a9-node-v1-1-42ff6a0c16ab@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAK4TQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNL3URL3bz8lFRd41SztOTUpETzZEsDJaDqgqLUtMwKsEnRsbW1AAQ
 6oYpZAAAA
X-Change-ID: 20260629-a9-node-3e6fceba7c90
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715311; l=5289;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=qsqMagQntUJk2+7nKd+Qfbf+tdW0g4n8khbu2y9iCho=;
 b=38v+7CfaRd6EV/UMT6fu9MuQbrcIgyUeFJuxl0LYqrsoLtV/DjAjF56OEhN2PtvvEdaM63/yi
 3MKG7QMdJmpCYpV+E+ESfxUHLwaUcsBc5eB1zbSfnP3aa6ESTdb85vf
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add pinctrl and irqchip-gpio device nodes for A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Add pinctrl and irqchip-gpio device node for A9.
---
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 140 ++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index 660c8556a864..cdc57b685cc3 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -97,6 +98,95 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		apb: bus@fe000000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xfe000000 0x0 0x480000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
+
+			periphs_pinctrl: pinctrl@4000 {
+				compatible = "amlogic,pinctrl-a9";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x4000 0x0 0x340>;
+
+				gpioz: gpio@c0 {
+					reg = <0 0xc0 0 0x20>, <0 0x18 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
+				};
+
+				gpiox: gpio@100 {
+					reg = <0 0x100 0 0x24>, <0 0xc 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
+				};
+
+				gpioh: gpio@140 {
+					reg = <0 0x140 0 0x20>, <0 0x2c 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 8>;
+				};
+
+				gpiom: gpio@1a0 {
+					reg = <0 0x1a0 0 0x20>, <0 0x20 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_M<<8) 8>;
+				};
+
+				gpiob: gpio@240 {
+					reg = <0 0x240 0 0x20>, <0 0x0 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+				};
+
+				gpioa: gpio@280 {
+					reg = <0 0x280 0 0x24>, <0 0x40 0 0xc>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_A<<8) 20>;
+				};
+
+				gpioy: gpio@2c0 {
+					reg = <0 0x2c0 0 0x20>, <0 0x30 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Y<<8) 10>;
+				};
+
+				gpiocc: gpio@300 {
+					reg = <0 0x300 0 0x20>, <0 0x14 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
+				};
+			};
+
+			gpio_intc: interrupt-controller@4080 {
+				compatible = "amlogic,a9-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x4080 0x0 0x20>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<10 11 12 13 14 15 16 17 18 19 20 21>;
+			};
+		};
+
 		gic: interrupt-controller@ff800000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
@@ -123,6 +213,56 @@ uart_b: serial@1e000 {
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			aobus_pinctrl: pinctrl@4000 {
+				compatible = "amlogic,pinctrl-a9";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x4000 0x0 0x0e0>;
+
+				gpioao: gpio@1c {
+					reg = <0 0x1c 0 0x20>, <0 0x0 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 13>;
+				};
+
+				gpioc: gpio@3c {
+					reg = <0 0x3c 0 0x20>, <0 0x10 0 0x4>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_C<<8) 7>;
+				};
+
+				gpiod: gpio@5c {
+					reg = <0 0x5c 0 0x24>, <0 0x8 0 0x8>;
+					reg-names = "gpio", "mux";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_D<<8) 18>;
+				};
+
+				test_n: gpio@c0 {
+					reg = <0 0xc0 0 0x20>;
+					reg-names = "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+				};
+			};
+
+			gpio_ao_intc: interrupt-controller@4080 {
+				compatible = "amlogic,a9-gpio-ao-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x4080 0x0 0x34>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<384 385 386 387 388 389 390 391 392 393
+					394 395 396 397 398 399 400 401 402 403>;
+			};
 		};
 	};
 };

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-a9-node-3e6fceba7c90

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



