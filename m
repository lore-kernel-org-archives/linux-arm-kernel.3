Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F573C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 02:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aySafOooMHvZDQnGvGlUIAnFsqa4xwWcc7xuu5Kfq9E=; b=ty9e0FRTB4GB3CL4YLPq+R5dNQ
	fa2R5xikRocYhUfBADBbpiVMeH7xDzX3y/SrHAxbWllecwT1YK43lWoTPhav5QqGLNR45uSl0JIZx
	mitQSQPmPPfDKCqk7+lXI+EVtofeRqFGQY7uXLZgK2uc5pPNHsdpi5FFH90OIpyO74uFDAchIbzKQ
	12kRZNYSpgUTjWPfCloQMy0T1SBbbWxUBc++x59pn0D5h6gAMq+hRrM1YIHb3yVv39/wDAsoZfs+u
	r/Fa2PdFcAglcMiM+w/OATfdEB5ozj+RFle06TCspJiZiGTSZ/VZD56MP1A0/8GSH4b/266hUWoCU
	lPRNyE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvS4w-0000000DgsO-3LTK;
	Fri, 21 Mar 2025 02:25:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvS3E-0000000DgmR-1rQI;
	Fri, 21 Mar 2025 02:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D942A4894A;
	Fri, 21 Mar 2025 02:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BE08C4CEDD;
	Fri, 21 Mar 2025 02:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742523837;
	bh=8+YFngRA+RL4itCdSnDqokhyCF25uPzsqjoBvzUhdHI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PzHSf57qgUf0FB7TATdmiJPPa16kAxxbeQBubmAv6ILpPwJ122YZbqrk1X3sZm0P9
	 uYTzERiVqmRIg4+ruKUo/315IOkh83+bjOW9WxlSh8ShgcGv86JYxt/sCiGZzffVgB
	 D86c3m9ZcKJB1PvS91lDdps3G6VYd4TauQqJJs+4w4tF014A79xqGuc57R8YiyFjlW
	 KY/y0CcrhSUgQDzfcxOXOy0b0nNEh5tyOXMBrAsGfGr0UGsHrC1D57jChsaAvbGssF
	 kgtxtyGK8941NGmLaxtZ9awMirQ319DxPHgkR9fkgldMd3dfcsPfxVb+VRDzUU8oHR
	 IZ1ETZ1yHTacg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AA7C28B30;
	Fri, 21 Mar 2025 02:23:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 21 Mar 2025 10:23:55 +0800
Subject: [PATCH] arm64: dts: amlogic: a4: fix dtb compilation warning
 issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-fix-a4-pinctrl-node-v1-1-5719f9f09932@amlogic.com>
X-B4-Tracking: v=1; b=H4sIALrN3GcC/x2MSQqAMAwAvyI5G6hacfmKeOgSNSBRWhGh+HeLx
 4GZSRApMEUYiwSBbo58SIaqLMBtRlZC9pmhVnWrmqrDhR80Gk8Wd4Ud5fCEgzV28VqT6lvI5Rk
 oa/91mt/3A56PuNllAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742523835; l=4994;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=IChqhCiVUHKV/Al5PYyBFG4RW3XtS/W3OF9ZWLm5x5E=;
 b=m1lud64/wUROGiLfKAlu7eDbYTf4Y/RBj9k8nVltMlE3s359FZ3sUFC3hN+43NIu5AYW0uFlA
 lrPSd5xEnI7BMBENznF5Jnx4nBvPjA9G6DiGs92ZaYgeF6zaOd2etNW
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_192400_623841_75B27A9C 
X-CRM114-Status: UNSURE (   8.40  )
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

When use command 'make ARCH=arm64 dtbs_check W=1' to compile dtb,
a warning message appears.
"Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl:
missing or empty reg/ranges property"

Add the unit address to the pinctrl node to fix it.

Fixes: ce78f679e08c ("arm64: dts: amlogic: a4: add pinctrl node")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 102 +++++++++++++++-------------
 1 file changed, 55 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index fa80fa365f13..582e0043024b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -51,87 +51,52 @@ pwrc: power-controller {
 };
 
 &apb {
-	gpio_intc: interrupt-controller@4080 {
-		compatible = "amlogic,a4-gpio-intc",
-			     "amlogic,meson-gpio-intc";
-		reg = <0x0 0x4080 0x0 0x20>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		amlogic,channel-interrupts =
-			<10 11 12 13 14 15 16 17 18 19 20 21>;
-	};
-
-	gpio_ao_intc: interrupt-controller@8e72c {
-		compatible = "amlogic,a4-gpio-ao-intc",
-			     "amlogic,meson-gpio-intc";
-		reg = <0x0 0x8e72c 0x0 0x0c>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		amlogic,channel-interrupts = <140 141>;
-	};
-
-	periphs_pinctrl: pinctrl {
+	periphs_pinctrl: pinctrl@4000 {
 		compatible = "amlogic,pinctrl-a4";
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x280>;
 
-		gpiox: gpio@4100 {
-			reg = <0 0x4100 0 0x40>, <0 0x400c 0 0xc>;
+		gpiox: gpio@100 {
+			reg = <0 0x100 0 0x40>, <0 0xc 0 0xc>;
 			reg-names = "gpio", "mux";
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 18>;
 		};
 
-		gpiot: gpio@4140 {
-			reg = <0 0x4140 0 0x40>, <0 0x402c 0 0xc>;
+		gpiot: gpio@140 {
+			reg = <0 0x140 0 0x40>, <0 0x2c 0 0xc>;
 			reg-names = "gpio", "mux";
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 23>;
 		};
 
-		gpiod: gpio@4180 {
-			reg = <0 0x4180 0 0x40>, <0 0x4040 0 0x8>;
+		gpiod: gpio@180 {
+			reg = <0 0x180 0 0x40>, <0 0x40 0 0x8>;
 			reg-names = "gpio", "mux";
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
 		};
 
-		gpioe: gpio@41c0 {
-			reg = <0 0x41c0 0 0x40>, <0 0x4048 0 0x4>;
+		gpioe: gpio@1c0 {
+			reg = <0 0x1c0 0 0x40>, <0 0x48 0 0x4>;
 			reg-names = "gpio", "mux";
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
 		};
 
-		gpiob: gpio@4240 {
-			reg = <0 0x4240 0 0x40>, <0 0x4000 0 0x8>;
+		gpiob: gpio@240 {
+			reg = <0 0x240 0 0x40>, <0 0 0 0x8>;
 			reg-names = "gpio", "mux";
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
 		};
 
-		gpioao: gpio@8e704 {
-			reg = <0 0x8e704 0 0x16>, <0 0x8e700 0 0x4>;
-			reg-names = "gpio", "mux";
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
-		};
-
-		test_n: gpio@8e744 {
-			reg = <0 0x8e744 0 0x20>;
-			reg-names = "gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
-		};
-
 		func-uart-a {
 			uart_a_default: group-uart-a-pins1 {
 				pinmux = <AML_PINMUX(AMLOGIC_GPIO_X, 11, 1)>,
@@ -186,4 +151,47 @@ uart_e_default: group-uart-e-pins {
 			};
 		};
 	};
+
+	gpio_intc: interrupt-controller@4080 {
+		compatible = "amlogic,a4-gpio-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x4080 0x0 0x20>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts =
+			<10 11 12 13 14 15 16 17 18 19 20 21>;
+	};
+
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
+	gpio_ao_intc: interrupt-controller@8e72c {
+		compatible = "amlogic,a4-gpio-ao-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x8e72c 0x0 0x0c>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts = <140 141>;
+	};
+
 };

---
base-commit: 73a143e436311183186ab4b365a84c662f2c9651
change-id: 20250317-fix-a4-pinctrl-node-9babfd44e085

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



