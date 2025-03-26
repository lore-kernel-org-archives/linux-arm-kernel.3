Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC47C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 05:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0iIsGD8TwFf5ldLOXJZLqytj0LiI4ZaC6DHMz0gEKZc=; b=MnMAGhVmgdz6gTNHOKbESaImcQ
	I8iO8u/olXVMRxyST9FgjDL81H1AoigAbgGuNuaq/R93CM9FS/WeE0pREvC6UQ+S0kwDK7dDwhnag
	Iu8du2ept/V7rKIpbY/hgcBbJbAxem9lNaORR29Nf7dGAB9OmWZYSQr8G/8886uKJ3tfrVlAuvyim
	vdmvZAeBcWElAJeuWiq0WftemTRSzRkIXgCIswiZy7uPFZkfbfDO4a1qOXulaMV0XYk8yED5MaWnq
	ezcCNpzC4VMwwOmscjyFodKuDV8PPi/7hQalHvf4AYWWMtNxkvCVsiDUdCR3DHAuuhr4vww8FzMQ/
	LA8+u0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txJAU-00000007ad0-421W;
	Wed, 26 Mar 2025 05:19:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txJ8m-00000007aVC-1icx;
	Wed, 26 Mar 2025 05:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EE9B6112F;
	Wed, 26 Mar 2025 05:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BD7AC4CEE2;
	Wed, 26 Mar 2025 05:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742966243;
	bh=ButHpYnOi30uTPKUbQYml9fS8YtmCtfmAvQ1YRC9dGc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=RmbfcyPlxUcupUBgbsyNT4fJVBJOAiXykRKvoeJyiWhGHOHAzTo5W6nf2LG3jvv5n
	 Yzh0HRPL5JSJIYLwpYt2ulFSYmHsmE+hrsbdV40RsJenOoA6ylghhrKiZ36Uptf9Ol
	 BmJkFYPMN5oJXtGmbpHP5PozJjtjS8RlNCkPjCShtMREB3RgAHVLUVmerMZJ6BX+9/
	 0aVlAc7VX3VWflIDCkbyzQX+21DKYg5SmV5G01YOfqUEvdH65ryvkZIdY7K4G5bpmY
	 oyeQlHBgjLvLq7v/9mNn40456vQYPoAZsRZChE2NVEBbaRzRCAHiyXbnGd8+QzSZ78
	 +bFvz4IVmHxPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3514FC28B30;
	Wed, 26 Mar 2025 05:17:23 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 26 Mar 2025 13:17:16 +0800
Subject: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
X-B4-Tracking: v=1; b=H4sIANuN42cC/x2MQQqAIBAAvxJ7TjBLi74SHUy3WggVjQjEvyfBX
 OYwkyFhJEwwNxkiPpTIuypd24A5tTuQka0OggvJeyFZIGfueDHnLTI9VJQarUQzmQ1qFSLu9P7
 HZS3lA03gC7thAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742966241; l=5053;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=71qIP+ef+rZamoMp2uHsnRGLP/3xxQGVfKdovCE34Gg=;
 b=VtxrAX3CV74cDeafGJLPn8y7m2o7qUtmyDz70JtDk8R1Zwv5Kpd1CE8gJAHcAZ8ZRpSSIPEkb
 CTZNM18bRQcDo6ArOAFQk1qsKOX7m1daledgaQMtNgWGbZK92ilb2VF
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
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

Add pinctrl device to support Amlogic A4 and add uart pinconf.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
This commit is based on the Neil's suggestion, rebase the commit on top of
https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=for-next 
which merges this commit:
https://lore.kernel.org/all/20250212-amlogic-pinctrl-v5-4-282bc2516804@amlogic.com/
with another one:
https://lore.kernel.org/all/20250321-fix-a4-pinctrl-node-v1-1-5719f9f09932@amlogic.com/
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 125 ++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index a06838552f21..c02fa5ee9fd2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include <dt-bindings/power/amlogic,a4-pwrc.h>
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -50,6 +51,107 @@ pwrc: power-controller {
 };
 
 &apb {
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,pinctrl-a4";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x280>;
+
+		gpiox: gpio@100 {
+			reg = <0 0x100 0 0x40>, <0 0xc 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
+		};
+
+		gpiot: gpio@140 {
+			reg = <0 0x140 0 0x40>, <0 0x2c 0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
+		};
+
+		gpiod: gpio@180 {
+			reg = <0 0x180 0 0x40>, <0 0x40 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
+		};
+
+		gpioe: gpio@1c0 {
+			reg = <0 0x1c0 0 0x40>, <0 0x48 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
+		};
+
+		gpiob: gpio@240 {
+			reg = <0 0x240 0 0x40>, <0 0 0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+		};
+
+		func-uart-a {
+			uart_a_default: group-uart-a-pins1 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_X, 12, 1)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_X, 13, 1)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_X, 14, 1)>;
+			};
+
+			group-uart-a-pins2 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 2, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_D, 3, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-b {
+			uart_b_default: group-uart-b-pins {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_E, 0, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_E, 1, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-d {
+			uart_d_default: group-uart-d-pins1 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 18, 4)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 19, 4)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+
+			group-uart-d-pins2 {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 7, 2)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 8, 2)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 9, 2)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 10, 2)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+
+		func-uart-e {
+			uart_e_default: group-uart-e-pins {
+				pinmux = <AML_PINMUX(AMLOGIC_GPIO_T, 14, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 15, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 16, 3)>,
+					 <AML_PINMUX(AMLOGIC_GPIO_T, 17, 3)>;
+				bias-pull-up;
+				drive-strength-microamp = <4000>;
+			};
+		};
+	};
+
 	gpio_intc: interrupt-controller@4080 {
 		compatible = "amlogic,a4-gpio-intc",
 			     "amlogic,meson-gpio-intc";
@@ -60,6 +162,29 @@ gpio_intc: interrupt-controller@4080 {
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
 
+	ao_pinctrl: pinctrl@8e700 {
+		compatible = "amlogic,pinctrl-a4";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x80>;
+
+		gpioao: gpio@4 {
+			reg = <0 0x4 0 0x16>, <0 0 0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
+		};
+
+		test_n: gpio@44 {
+			reg = <0 0x44 0 0x20>;
+			reg-names = "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+		};
+	};
+
 	gpio_ao_intc: interrupt-controller@8e72c {
 		compatible = "amlogic,a4-gpio-ao-intc",
 			     "amlogic,meson-gpio-intc";

---
base-commit: 23a708916ec7ab21c8c81d61bdb7cb933f6867d5
change-id: 20250325-pinctrl-node-a4-a4667d5ec8cb

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



