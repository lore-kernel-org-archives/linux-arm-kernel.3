Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEC3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q13+UqYp5UMDjGH7thE8zuZK92NCYn7UzMtK3lxXd4c=; b=EwvbgAG7YP75JT4G9SU73jQtb6
	tVJ0Y0gV/5wbDqPNlOH6WFczXaN9wVW8zQieqEcFPX7WB8gwlvuP1jldBk4rc0BxaGebdX5K/Bd2r
	l/4aPjbGbNT9SHsnMi2RiEmbyfC5U1id5x5kk0nss9c38psvMzfVeC9CBBW03pWVAiqsKRdeCuTco
	NcL8hRqwGLi4TNuM97abt8UoVXf6IfvnGEXfBmG3Z72Sw557zwoKgO06h9AM2nFsZJvPd6sqhl/0R
	8TGFKIviCrUDiobX08eBPoRr+FuoEQPIiLn19H1UUHqF8aGZFPG20/HGQMc3oWEDOmVeHjyKpuzXC
	FaM2b6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQire-0000000FRis-3T80;
	Thu, 26 Dec 2024 08:05:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQikf-0000000FQlL-25Fw;
	Thu, 26 Dec 2024 07:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E261A40D9C;
	Thu, 26 Dec 2024 07:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D9E9C4CEE0;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735199866;
	bh=bfZxmQAYQvQTVRVlZT40HLcZ6ZJ6NtMjZ1rtxWJKKio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NrXXDymxkwYHObwMuZPzkEXUO42PstMqs0a8uP3Y7Sl9bbmP8N5a4PMVxru4WXLz+
	 vlL1eCoDMrm4WJSouickctjSkWzZ1tflnuh06BxsKREsw7jGZyvaGGY1VjI+a4qtT2
	 Y/3DtaLOldtqzdSRKF6LVwwS8PVMTOmltEBBjOBcGyaao8w6kFCzKmvo15hAiPsuRh
	 VfWsO2W8DSioypesavf1oY7So4TiiK7Jm/6YW+rT4MNMD3e7gKbX2t0B13ZQEM0Jh5
	 57xVyhmDPwaFNs/eS9bZB4DJqrnHpEXrF38RNVXZdXvAYh/PRKgA/LDDWnm7TDV3vX
	 978Kl+yRxvr3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC95E77191;
	Thu, 26 Dec 2024 07:57:46 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Dec 2024 15:57:44 +0800
Subject: [PATCH v2 4/5] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-amlogic-pinctrl-v2-4-cdae42a67b76@amlogic.com>
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
In-Reply-To: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735199863; l=3914;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=wy3fQdz+SJH1zG7wVrB8eckpXy2HYaam9eL+Y9nbl3s=;
 b=kN7IwVc5y6ThjsD6DpFOEsjMxPyDZk3Ga4AWF+wOeiasE2uqnoKO82fg8hJzz7/kREdI3ITBG
 Mbw5goH9A1eBdwf7V8KCG+dtfLEVuTtWpxGKQDVQmjSO6uzohTLQRhJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_235749_671788_89742CCC 
X-CRM114-Status: UNSURE (   9.63  )
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
index de10e7aebf21..90ef74b015bd 100644
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
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,pinctrl-a4";
+		reg = <0x0 0x4000 0x0 0x0050>,
+		      <0x0 0x40c0 0x0 0x0220>;
+		reg-names = "mux", "gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpiox: gpio@10 {
+			reg = <0x10>, <0x3>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <18>;
+			identity = <AMLOGIC_GPIO_X>;
+		};
+
+		gpiot: gpio@20 {
+			reg = <0x20>, <0xb>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <23>;
+			identity =  <AMLOGIC_GPIO_T>;
+		};
+
+		gpiod: gpio@30 {
+			reg = <0x30>, <0x10>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <16>;
+			identity = <AMLOGIC_GPIO_D>;
+		};
+
+		gpioe: gpio@40 {
+			reg = <0x40>, <0x12>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <2>;
+			identity = <AMLOGIC_GPIO_E>;
+		};
+
+		gpiob: gpio@60 {
+			reg = <0x60>, <0x0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <14>;
+			identity = <AMLOGIC_GPIO_B>;
+		};
+
+		func-uart-a {
+			uart_a_default: uart-a-pins1 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_X, 11, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 12, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 13, AF1)>,
+					<AML_PINMUX(AMLOGIC_GPIO_X, 14, AF1)>;
+			};
+
+			uart-a-pins2 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_D, 2, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_D, 3, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-b {
+			uart_b_default: uart-b-pins {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_E, 0, AF3)>,
+					<AML_PINMUX(AMLOGIC_GPIO_E, 1, AF3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-d {
+			uart_d_default: uart-d-pins1 {
+				pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 18, AF4)>,
+					<AML_PINMUX(AMLOGIC_GPIO_T, 19, AF4)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+
+			uart-d-pins2 {
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
+			uart_e_default: uart-e-pins {
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
+		compatible = "amlogic,pinctrl-a4";
+		reg = <0x0 0x8e700 0x0 0x04>,
+		      <0x0 0x8e704 0x0 0x60>;
+		reg-names = "mux", "gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpioao: gpio@0 {
+			reg = <0x0>, <0x0>;
+			mask = <0xfffffff>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <7>;
+			identity = <AMLOGIC_GPIO_AO>;
+		};
+
+		test_n: gpio@10 {
+			reg = <0x10>, <0x0>;
+			mask = <0xf0000000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <1>;
+			identity = <AMLOGIC_GPIO_TEST_N>;
+		};
+	};
+};

-- 
2.37.1



