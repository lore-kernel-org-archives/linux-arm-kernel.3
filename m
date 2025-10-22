Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED4ACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 05:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hy0kTl7BNRNFcfoo24ThWUqONEE5q0hOY4O60OM8AKo=; b=Gz0WCnDILu2aDs+/rK7i25Dke5
	ErQhxZGFFQyEl5YkPTyGc/70Ua7R/ebAqFHM80Zma9HIQPiKZDuIt0JPrkmHh+rwK2hFnIiD3bFnK
	qWGMiGpYRSZNGQxdk5Dcpwy8N0bP7VZUxMup4aF2EPIQmaQMROp/+2WEx8sIx/bnqexFXeaFtvTro
	MkppdAQ550qRAZuyktFFy4WSwdCDrdlBngd0mm8bHMZfOd00MSFuAlJQSoasmvHAyXYyzY6IxN/JQ
	wyiHF0rMmx75jEFfkDNl0gOwFGa1Al0ZrcWeJqCmO7IvH7xatU4yxEfzKfIv6ZhDTnmkGAjHzd0Sx
	5rbzE9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBR1q-00000001UzQ-1yJK;
	Wed, 22 Oct 2025 05:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBR1o-00000001Uz2-1JMH;
	Wed, 22 Oct 2025 05:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B94A62805;
	Wed, 22 Oct 2025 05:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF8FAC4CEE7;
	Wed, 22 Oct 2025 05:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761109491;
	bh=2EdtDU6mRhcVA+GAzWRU4FRqrvpQfbrVBlhQfwxWS5o=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=t9Rvocw/JYXXU5Ucjbsn7aVQBLLOeKo+xM9g2JPz3Np2e/4NXlVSeUuG/QcaK44sO
	 k18GCjxX2/6zaSvJBMsjXksMU5AIY8PXoc3GAjtSgs2q26i/Ad7+jecqelsCA2/bZJ
	 DPQDmHB70IWhC7RbpkPeLdynag38TsVJgrMAx2QWfqG/9QJLrJbm78jRDR5fWFYTAG
	 18ZMruTpypnS4dnpV8kF5vj7NSjA2p4QocMZQJBxMPMrT7rCIqxBHgUuyFZM89+kr8
	 v8Gc2C4GmbwhxlS50KEyuTaduz68OZaVQc6q2sKQ8jdZnuKTqMIHzwNERlRjUXwLgl
	 nGzTnQgkkpSBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD365CCD1BE;
	Wed, 22 Oct 2025 05:04:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 22 Oct 2025 13:04:48 +0800
Subject: [PATCH v4] dts: arm64: amlogic: add a5 pinctrl node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-a5-pinctrl-node-v4-1-a71911852c4b@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAO9l+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3URT3YLMvOSSohzdvPyUVF0LyxQzE/OkRCNLQzMloK6CotS0zAq
 widGxtbUABr6r+mEAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761109488; l=3976;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=L4+dkNUItx+b/fyi3A8tosJY0LGL4pTf8lDMXXe1YgY=;
 b=KqEsemoMw7YudnhxpG8a8K0hlC5MigxSXpOLtE65kkqQNfDSatkjRHamxp/LTt8zeEV0aYLbL
 HJU3Pq1WekxAeaFZdDV4th4W9Q9/HSbWlW1Ql2LwPziS67L5L43YKK7
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

Add pinctrl device to support Amlogic A5.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Add A5 pinctrl compatible string and device node.
---
Changes in v4:
- Rebase dts.
- Binding has already be accepted. This submission does not include this part.
- Link to v3: https://lore.kernel.org/all/20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com

Changes in v3:
- Remain blank line.
- Link to v2: https://lore.kernel.org/r/20250401-a5-pinctrl-v2-0-a136c1058379@amlogic.com

Changes in v2:
- Modify bindings according to Conor's suggestion.
- Link to v1: https://lore.kernel.org/r/20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index b1da8cbaa25a..2b12d8284594 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -5,6 +5,7 @@
 
 #include "amlogic-a4-common.dtsi"
 #include "amlogic-a5-reset.h"
+#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 / {
 	cpus {
@@ -58,6 +59,95 @@ reset: reset-controller@2000 {
 		#reset-cells = <1>;
 	};
 
+	periphs_pinctrl: pinctrl@4000 {
+		compatible = "amlogic,pinctrl-a5",
+			     "amlogic,pinctrl-a4";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
+
+		gpioz: gpio@c0 {
+			reg = <0x0 0xc0 0x0 0x40>,
+			      <0x0 0x18 0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
+		};
+
+		gpiox: gpio@100 {
+			reg = <0x0 0x100 0x0 0x40>,
+			      <0x0 0xc   0x0 0xc>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
+		};
+
+		gpiot: gpio@140 {
+			reg = <0x0 0x140 0x0 0x40>,
+			      <0x0 0x2c  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 14>;
+		};
+
+		gpiod: gpio@180 {
+			reg = <0x0 0x180 0x0 0x40>,
+			      <0x0 0x40  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
+		};
+
+		gpioe: gpio@1c0 {
+			reg = <0x0 0x1c0 0x0 0x40>,
+			      <0x0 0x48  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
+		};
+
+		gpioc: gpio@200 {
+			reg = <0x0 0x200 0x0 0x40>,
+			      <0x0 0x24  0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 11>;
+		};
+
+		gpiob: gpio@240 {
+			reg = <0x0 0x240 0x0 0x40>,
+			      <0x0 0x0   0x0 0x8>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
+		};
+
+		gpioh: gpio@280 {
+			reg = <0x0 0x280 0x0 0x40>,
+			      <0x0 0x4c  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 5>;
+		};
+
+		gpio_test_n: gpio@2c0 {
+			reg = <0x0 0x2c0 0x0 0x40>,
+			      <0x0 0x3c  0x0 0x4>;
+			reg-names = "gpio", "mux";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+		};
+	};
+
 	gpio_intc: interrupt-controller@4080 {
 		compatible = "amlogic,a5-gpio-intc",
 			     "amlogic,meson-gpio-intc";

---
base-commit: ea528a07aae07a764babc0d92db55e2c0d68d414
change-id: 20251022-a5-pinctrl-node-89d647ba2916

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



