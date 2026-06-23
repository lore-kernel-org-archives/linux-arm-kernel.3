Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226A5CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 02:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q9pNoQqpYasS0QPJrxwGUqHBaVAY/3JYsy0RcdiRpI=; b=35g3dNZcvG4tSjPvH52i+4MOi0
	/uz1pNb5o6jgedsHgly9fOX/zTwzUH7jVmABIteF5EBWhibAQn5ELXIJij8tu5kT8ZiiA5BHQCbWY
	Hi2r3afCNEBrBkUgjDDIg7TTDGTd38NXqnxj8a/v51H6uE+7lHgCzmlODwkXX16gViCpnazupdXsg
	OQJC/rt/ssa5LLPcwSJcMH9cS2jMkJq1IRiZxcXwxS1ra6IRtF+XutUDNJMPLSrNhSIp32DrRE3yz
	Pn0XTWRlG9dQN9F2kgwE5FaLBYXwIc+EBoLpfbaWTT8ZZGUW4ghVDmwVAUFHZKltcbzHvL0buvr8A
	neZ6caxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrIq-00000005c6K-1Nlp;
	Tue, 23 Jun 2026 02:55:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrIo-00000005c5E-1oDX;
	Tue, 23 Jun 2026 02:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 385A3601FD;
	Tue, 23 Jun 2026 02:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD121C2BCC7;
	Tue, 23 Jun 2026 02:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782183352;
	bh=c/PIQew4CIvgLc9UhZFMzJcfcY8E32gOzQD0mFhpcp0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GWj1HeppYgEHZp/6UNsb9x5NZqyhjAL54N4ZesUhe6+gYYksB2mzQMb01Bg3B44BW
	 8y6ScUAb03v3b96/2ZUhHh9HAL4XPKzkqsLT5kw3oPUfA+rz/sXnALrWcY7hEI8R4h
	 TFxTr1BCvDJceQW0SyD+rPlEjPp9avv1GJOmXAjfe6RDUIaqKnrV7r0bTTpBD6grOE
	 WSV3FhJP7tXJqD8nW8ne+YlqSC67fufYpA6ZLXUlA1E4SNzrb+WndKqzEFGOCLIrXW
	 FXKra0v38NUJKieNMpNX8Gsb6cieSlMOYglDoE3hSC6Qz4qMX9DAAJCfjPfaMXaP2g
	 Qqe69T8KaAt0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A55CDB46B;
	Tue, 23 Jun 2026 02:55:52 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 23 Jun 2026 10:55:33 +0800
Subject: [PATCH v5 1/2] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-a9_aoclk-v5-1-c7cb1ff9ebf1@amlogic.com>
References: <20260623-a9_aoclk-v5-0-c7cb1ff9ebf1@amlogic.com>
In-Reply-To: <20260623-a9_aoclk-v5-0-c7cb1ff9ebf1@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782183350; l=5339;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=kwn+xLdvWcoIS5pumj6G8ysGe6h8qolt3jz+Yj+ZsB8=;
 b=1MuPUwmmCvFqCV7VsXqvx+Chh7M0SnD8tVnsUpJ6QjVoZodyWlPIPw1Kxq8KKoQqseDSuMKVB
 J85ZMQzW6EhD1r5s2Jtn0/H4MXn90fGN4pyoRTagy4wns86faEhAo+5
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jian Hu <jian.hu@amlogic.com>

Add the Always-On clock controller dt-bindings for the Amlogic A9
SoC family.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 .../bindings/clock/amlogic,a9-aoclkc.yaml          | 76 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      | 76 ++++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-aoclkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-aoclkc.yaml
new file mode 100644
index 000000000000..1fa9b3a32fbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a9-aoclkc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a9-aoclkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A9 Series Always-On Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jian Hu <jian.hu@amlogic.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,a9-aoclkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 5
+    items:
+      - description: input oscillator
+      - description: input fclk div 3
+      - description: input fclk div 4
+      - description: input fclk div 5
+      - description: input sys clk
+      - description: external fixed 32k (optional)
+
+  clock-names:
+    minItems: 5
+    items:
+      - const: xtal
+      - const: fdiv3
+      - const: fdiv4
+      - const: fdiv5
+      - const: sys
+      - const: ext_32k
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@0 {
+            compatible = "amlogic,a9-aoclkc";
+            reg = <0x0 0x0 0x0 0x58>;
+            #clock-cells = <1>;
+            clocks = <&xtal>,
+                     <&scmi_clk 14>,
+                     <&scmi_clk 16>,
+                     <&scmi_clk 18>,
+                     <&scmi_clk 21>;
+            clock-names = "xtal",
+                          "fdiv3",
+                          "fdiv4",
+                          "fdiv5",
+                          "sys";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,a9-aoclkc.h b/include/dt-bindings/clock/amlogic,a9-aoclkc.h
new file mode 100644
index 000000000000..a7d704d4b58e
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a9-aoclkc.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __AMLOGIC_A9_AO_CLKC_H
+#define __AMLOGIC_A9_AO_CLKC_H
+
+#define CLKID_AO_XTAL_IN			0
+#define CLKID_AO_XTAL				1
+#define CLKID_AO_SYS				2
+#define CLKID_AO_SYS_I3C			3
+#define CLKID_AO_SYS_RTC_REG			4
+#define CLKID_AO_SYS_CLKTREE			5
+#define CLKID_AO_SYS_RST_CTRL			6
+#define CLKID_AO_SYS_PAD			7
+#define CLKID_AO_SYS_RTC_DIG			8
+#define CLKID_AO_SYS_IRQ			9
+#define CLKID_AO_SYS_PWRCTRL			10
+#define CLKID_AO_SYS_PWM_A			11
+#define CLKID_AO_SYS_PWM_B			12
+#define CLKID_AO_SYS_PWM_C			13
+#define CLKID_AO_SYS_PWM_D			14
+#define CLKID_AO_SYS_PWM_E			15
+#define CLKID_AO_SYS_PWM_F			16
+#define CLKID_AO_SYS_PWM_G			17
+#define CLKID_AO_SYS_I2C_A			18
+#define CLKID_AO_SYS_I2C_B			19
+#define CLKID_AO_SYS_I2C_C			20
+#define CLKID_AO_SYS_I2C_D			21
+#define CLKID_AO_SYS_SED			22
+#define CLKID_AO_SYS_IR_CTRL			23
+#define CLKID_AO_SYS_UART_B			24
+#define CLKID_AO_SYS_UART_C			25
+#define CLKID_AO_SYS_UART_D			26
+#define CLKID_AO_SYS_UART_E			27
+#define CLKID_AO_SYS_SPISG_0			28
+#define CLKID_AO_SYS_RTC_SECURE			29
+#define CLKID_AO_SYS_CEC			30
+#define CLKID_AO_SYS_AOCPU			31
+#define CLKID_AO_SYS_SRAM			32
+#define CLKID_AO_SYS_SPISG_1			33
+#define CLKID_AO_SYS_SPISG_2			34
+#define CLKID_AO_PWM_A_SEL			35
+#define CLKID_AO_PWM_A_DIV			36
+#define CLKID_AO_PWM_A				37
+#define CLKID_AO_PWM_B_SEL			38
+#define CLKID_AO_PWM_B_DIV			39
+#define CLKID_AO_PWM_B				40
+#define CLKID_AO_PWM_C_SEL			41
+#define CLKID_AO_PWM_C_DIV			42
+#define CLKID_AO_PWM_C				43
+#define CLKID_AO_PWM_D_SEL			44
+#define CLKID_AO_PWM_D_DIV			45
+#define CLKID_AO_PWM_D				46
+#define CLKID_AO_PWM_E_SEL			47
+#define CLKID_AO_PWM_E_DIV			48
+#define CLKID_AO_PWM_E				49
+#define CLKID_AO_PWM_F_SEL			50
+#define CLKID_AO_PWM_F_DIV			51
+#define CLKID_AO_PWM_F				52
+#define CLKID_AO_PWM_G_SEL			53
+#define CLKID_AO_PWM_G_DIV			54
+#define CLKID_AO_PWM_G				55
+#define CLKID_AO_RTC_DUALDIV_IN			56
+#define CLKID_AO_RTC_DUALDIV_DIV		57
+#define CLKID_AO_RTC_DUALDIV_SEL		58
+#define CLKID_AO_RTC_DUALDIV			59
+#define CLKID_AO_RTC				60
+#define CLKID_AO_CEC_DUALDIV_IN			61
+#define CLKID_AO_CEC_DUALDIV_DIV		62
+#define CLKID_AO_CEC_DUALDIV_SEL		63
+#define CLKID_AO_CEC_DUALDIV			64
+#define CLKID_AO_CEC				65
+
+#endif  /* __AMLOGIC_A9_AO_CLKC_H */

-- 
2.47.1



