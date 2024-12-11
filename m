Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA52E77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 06:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPnImB4FVRZH6kAG/TPPBUw49J3Vu/TP2Hm3hrAkJdc=; b=TT7yW1GW1GnLlMDQXPbVQvHUp4
	U/FIiOqJrc0Y6lKOmT4Jbt7f0ck3mw3eyCZzeKCqZnmkpta+e53sPz/Nxtg2Qbj4ufzik+5FEOtij
	1ws0CZqSqe32iTMC71X8IjzjJ599dxscrcgHUrBbpgSSO+znjoGToNrc2abuh1vjMRYBF7fuv4qhb
	ufkApDU+bw1j8DcL7AY6er/NO/h2qydBwcxgSiPetxbhe5qJggp0CVx2q7kMp2zMCcH3Kc290NSrA
	n9rvmk24c9dwClbXjSw48ThY0uqu6/s2OITLPbFoEULJISPQlfc2jkAtDwj6JH1fcw1BlG2/9SKHV
	mPBHpu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGX9-0000000DyQM-21DY;
	Wed, 11 Dec 2024 06:49:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGW4-0000000Dy4e-3HsH;
	Wed, 11 Dec 2024 06:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C12C5C657D;
	Wed, 11 Dec 2024 06:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21097C4AF0C;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733899689;
	bh=UPPnlWPu9KoNlNpvsqGTfPyBQbXQZd4qU+Jb/czZ7/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lVzI0Algq+XTOAf/dYDHZb1kI7b3r7XQ2Qhixv6gouPmJBqrx/IhUObZRNdUrZGVb
	 ugFaymGbSB6Oxv6oFu5lSHWOi0QRCHbu6yZojlcvu8baXMi0Tw/bZmpKKO4rGrCaxC
	 pYNVLM42CfqaiQU9QPPLjlkUspBmlptdF0t8zuVtuaK0G9ODHAiVee7LqhmhnpMCrN
	 CZ5zWLazfue4AK1WZLzBg3NqY5QT8JWHVPfqkBSoyUCfmutiQWuN9/myG3bRED4UqU
	 PQ+STpDvXXvH3vIBf7E2WlkyNPpAjCmHiEkTp4njDXX2G17+XqPRiTVYiBJQYpohcI
	 sGD4A4netMulg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112EFE77183;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 11 Dec 2024 14:47:51 +0800
Subject: [PATCH RFC 3/3] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-amlogic-pinctrl-v1-3-410727335119@amlogic.com>
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
In-Reply-To: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733899686; l=4294;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=wd2xEkVGIb+QQGNlpn9fPOzOszeVPGCMX5Z9RWeBF+M=;
 b=V4CFjbseLot8PdTVnt01ycVpwibk0w7BRAlIO9BREobCH/cbUT9/dccE5TNzvbad920xz3xTq
 s+Cse5B+iI3AcJLNHYnZKdsjFDFM1RhjPRWGZUwmwwqX1JaULRCXsW2
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_224812_916129_846BE63E 
X-CRM114-Status: UNSURE (   9.74  )
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
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 146 ++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..fccae7c9758a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -48,3 +49,148 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,pinctrl";
+		reg = <0x0 0x4000 0x0 0x0050>,
+		      <0x0 0x40c0 0x0 0x0220>;
+		reg-names = "mux", "gpio";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gpiob: gpiob {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <14>;
+			bank-index = <AMLOGIC_GPIO_B>;
+			reg-mux-offset = <0>;
+			reg-gpio-offset = <0x60>;
+			bank-name = "GPIOB";
+		};
+
+		gpiod: gpiod {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <16>;
+			bank-index = <AMLOGIC_GPIO_D>;
+			reg-mux-offset = <0x10>;
+			reg-gpio-offset = <0x30>;
+			bank-name = "GPIOD";
+		};
+
+		gpioe: gpioe {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <2>;
+			bank-index = <AMLOGIC_GPIO_E>;
+			reg-mux-offset = <0x12>;
+			reg-gpio-offset = <0x40>;
+			bank-name = "GPIOE";
+		};
+
+		gpiot: gpiot {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <23>;
+			bank-index = <AMLOGIC_GPIO_T>;
+			reg-mux-offset = <0xb>;
+			reg-gpio-offset = <0x20>;
+			bank-name = "GPIOT";
+		};
+
+		gpiox: gpiox {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <18>;
+			bank-index = <AMLOGIC_GPIO_X>;
+			reg-mux-offset = <0x3>;
+			reg-gpio-offset = <0x10>;
+			bank-name = "GPIOX";
+		};
+
+		func-uart-a {
+			uart_a_default: uart-a-pins1{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 12, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 13, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 13, AF1)>;
+			};
+
+			uart-a-pins2{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_D, 2, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_D, 3, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-b {
+			uart_b_default: uart-b-default{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_E, 0, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_E, 1, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-d {
+			uart_d_default: uart-d-pins1{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 18, AF4)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 19, AF4)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+
+			uart-d-pins2{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 7, AF2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 8, AF2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 9, AF2)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 10, AF2)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-e {
+			uart_e_default: uart-e-pins{
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 14, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 15, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 16, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 17, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+	};
+
+	aobus_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,pinctrl";
+		reg = <0x0 0x8e700 0x0 0x04>,
+		      <0x0 0x8e704 0x0 0x60>;
+		reg-names = "mux", "gpio";
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gpioao: gpioao {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <7>;
+			bank-index = <AMLOGIC_GPIO_AO>;
+			reg-mux-offset = <0>;
+			reg-gpio-offset = <0>;
+			bank-name = "GPIOAO";
+		};
+
+		test_n: gpiotestn {
+			gpio-controller;
+			#gpio-cells = <2>;
+			npins = <1>;
+			bank-index = <AMLOGIC_GPIO_TEST_N>;
+			reg-mux-offset = <0>;
+			bit-mux-offset = <28>;
+			reg-gpio-offset = <0x10>;
+			bank-name = "TEST_N";
+		};
+	};
+};

-- 
2.37.1



