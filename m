Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFD6C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPiVm/POc525L8s9glUzpjL+CFJkccwDY2Mj9g/KCgo=; b=awvz0qhkYbrf1KafB50Oj279+r
	WU+Lhnc7lWfi9uCInm/5wB83rLfa0mF44M6/FwrBBNPEoJwXdPwbH3sUTVCGphPPMi0XCUNuGVce0
	EeJxY6hSoWktnsub5T5ACWRFI8GA4SyXsFa5J5fH8Rh5rDIhDpVeRG1++v9lb1g2o9TiP2zdXMo9b
	sbeCanuMcstk8X/kuGji806/OOUqCITqFLeRSVyxh++wMdBRDwmHlBLKLsrpFuixfnKst/aZd7qLn
	rCv7lVhkfY+IhWMg78AXDszOHNAbGH/8BOEEeTpccMFCFhpVV03XnDe/itIbvF6Z5aKRi3x7AE7SU
	IWHohOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6na-0000000DxGp-3HEE;
	Mon, 29 Jun 2026 07:52:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6nY-0000000DxFa-0x8n;
	Mon, 29 Jun 2026 07:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7179600AA;
	Mon, 29 Jun 2026 07:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FD52C2BCB8;
	Mon, 29 Jun 2026 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782719575;
	bh=5km4NmuYF9DScyquNyhzgnIdcqYff1K4clJTIfXF2U8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=h0FFBMOU/GYZC6i0PCy8lSk6gzKWJOKtVOZ33jhhz/hpd9ZX0U+6G/hjRagPP0Suz
	 FuoPp7sqD1VgDH1tk3AVeb5mEMEELSMH2EjGqnNdJizLNeNI5DXrJ8hjhwuavFu3ZG
	 IcPuxIg4P8zszmfG6v1H0VoUHa4rYM7gUmK6Gu8jAQFBOyCuxDLYGwjP7JGW4w5GRJ
	 q8eO2HRQ8vUrwgrO3Tw6dAFRu5R3NJWc/0V5A3RoCgmGtqPn7ruREtB3R0rfaw1UML
	 +TlBYL2P4N6k4dxAL/BthJHaf1vXZ88cp74LMGAUx4tSINsWB13ZZl8+3eJV3Wfkcu
	 qUiJ0SKimZhwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3075EC43458;
	Mon, 29 Jun 2026 07:52:55 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 29 Jun 2026 07:52:53 +0000
Subject: [PATCH v2] arm64: dts: amlogic: add some device nodes for A9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a9-node-v2-1-dadd3401fccb@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAFQkQmoC/2XMQQrCMBCF4auUWTuSRInElfeQLqbppB2wjSQSl
 JK7G7t1+T8e3waZk3CGa7dB4iJZ4trCHDrwM60To4ytwShjlTUOyeEaR8YT2+B5oIt3Ctr7mTj
 Ie5fufetZ8iumzw4X/Vv/jaJR49mEYEl5bWm40fKIk/ijjwv0tdYvVP6iHaAAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719573; l=5518;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=4hEc0Y3kJi0oLWhBei8MgVtCOquaYcl8dUAJU9UbQBo=;
 b=DlbUk+TTjIUALWf5L5T56AOLfQA4dYtobtp6v0o1p/if76zO5DUT8ikuqbEEWI1i6OBSakAyI
 /SelcFZcKfGAkrtrlAZ0doTeS2BxFk5/n5x+Z2zyzIqOc8UI7MlmARi
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
Changes in v2:
- Reorder device node by address.
- Link to v1: https://lore.kernel.org/r/20260629-a9-node-v1-1-42ff6a0c16ab@amlogic.com
---
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 140 ++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index 660c8556a864..b0e0fadeed82 100644
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
@@ -114,6 +204,56 @@ aobus: bus@ffa00000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xffa00000 0x0 0x100000>;
 
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
+
 			uart_b: serial@1e000 {
 				compatible = "amlogic,a9-uart",
 					     "amlogic,meson-s4-uart";

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-a9-node-3e6fceba7c90

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



