Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38916C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpkfw74KomD29eYBQKrY0G7zGLVu5kAQQGJgVU6Pyy4=; b=aE8x/gNb1P6+evw7G1ZAFxYvI3
	U2o/qXgLW78PsM6qAtIjRFidcr5ss1/iVQMAl5GjmrNwZ/qmLYdJ/cCfinE9s2p2yDpEalBoHUwpY
	VulHxojJRd4xwqrDPZ8aPY9ZVAfYfdFfgXVD7/jgg2V1nuw53O0ZSr9Q0S8nWjCnzLRao+JumInMK
	J2e8l+z0aBxJyLaCvtXHp2gKMH/GsgkZEUC7DrrDck4zEAwgcE4Vsmvrh3DTn6X1h5on7umahCC4b
	x6j3nUEd1QKu8p0hvnYRrVuhZewCI7QmWBLN/6OfC8iqTVJFA6JFtkXQpRbonN8gEiR8J6NvuXPIU
	SRNrZEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulMn-000000021Yl-39im;
	Fri, 14 Aug 2026 06:26:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wulMl-000000021Xs-2MR4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 06:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87590601E0;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15DD9C2BCC7;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786688766;
	bh=tivZ5BYNFH4W6I41+vAAaK6MuTK6IPDTNH6UPZleqPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Qx2YJx7X0+aP/+wYdJ83bvBXdHWsofmEBlSPjKCLlt2t7y4wyWw4MTERtWjETEhW2
	 Khasy0c8i6x0xHaocaAuzJ2ZFUwK64yDnwe0NUyvSHTHeOKtHCVoYifD47rNL/Sir+
	 wAb4oaA4yiAi/PSBtTtGSqopsePQicO0ZQ1BaHQlSXo8FSJQaa8hWdvXxEmJQAEGCc
	 FH0T+r9egdMR+uF3jGcCec8eHaup+h7cw2XL7oFdVm6dtpNIWBgljcdgqRWVkW86Fb
	 DFCRh6NrEY2k4kW5tjtulMWwfpn97Mwb71xYLSG/XTmwT4AFsCvRGfvJyqsnsf3yT3
	 tGdulo3DP9nAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75DEC5CFC1;
	Fri, 14 Aug 2026 06:26:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 14 Aug 2026 14:25:41 +0800
Subject: [PATCH v4 1/4] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
In-Reply-To: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786688763; l=6392;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=nKtxPce2re61fXy+1qoLhWBCtRzuGBLrRckpr8oXxx4=;
 b=a7znp/pnlWhAgzN3TRpcMoERgnBeJ920ph/HZ3tle3KxQfiUaFKl2AmqV2MRDJtnfcFK+/YGm
 wp4iv38A6uABsR90+2KY7ZgmwIvmDZIXGRtupCgw+X3z5W3aa74riJC
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Document the CV75 pin controller binding using generic function and
groups properties for pinmux configuration.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 240 +++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
new file mode 100644
index 000000000000..9d65da32d3d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
@@ -0,0 +1,240 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ambarella,cv75-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 Pin Controller
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description:
+  The Ambarella CV75 pin controller configures pin multiplexing, bias and
+  drive strength for the main GPIO banks. Pin groups and their mux settings
+  are defined by the pin controller driver and selected by function and group
+  names.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: ambarella,cv75-pinctrl
+
+  reg:
+    maxItems: 1
+    description: IOMUX registers
+
+  ambarella,drive-strength-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: RCT syscon containing the drive-strength registers.
+
+  ambarella,pull-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Secure scratchpad syscon containing the pull registers.
+
+patternProperties:
+  "^[a-z0-9-]+-pins$":
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - can0
+          - can1
+          - clk_au
+          - dmic0
+          - enet0
+          - hsync0
+          - hsync1
+          - i2c0
+          - i2c1
+          - i2c2
+          - i2c3
+          - i2cs
+          - i2s0
+          - i2s1
+          - ir
+          - pwm0
+          - pwm1
+          - pwm2
+          - pwm3
+          - pwm4
+          - pwm5
+          - pwm6
+          - pwm7
+          - pwm8
+          - pwm9
+          - pwm10
+          - pwm11
+          - sdmmc0
+          - sdmmc1
+          - snand
+          - spi0
+          - spi1
+          - spi2
+          - spi3
+          - spi_slave
+          - spinor
+          - uart0
+          - uart1
+          - uart2
+          - uart3
+          - uart4
+          - vin_master_sync
+          - vsync0
+          - vsync1
+          - vsync2
+          - vsync3
+          - wdt
+
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        items:
+          enum:
+            - can0
+            - can1
+            - clk_au
+            - dmic0
+            - enet_2nd_ref_clk_a
+            - enet_2nd_ref_clk_b
+            - enet_ext_osc_clk
+            - enet0_ptp_pps_o
+            - hsync0
+            - hsync1
+            - i2c0_a
+            - i2c0_b
+            - i2c1_a
+            - i2c1_b
+            - i2c2
+            - i2c3_a
+            - i2c3_b
+            - i2c3_c
+            - i2cs_a
+            - i2cs_b
+            - i2cs_c
+            - i2cs_d
+            - i2s0
+            - i2s1
+            - ir
+            - pwm0
+            - pwm1
+            - pwm2
+            - pwm3
+            - pwm4_a
+            - pwm4_b
+            - pwm5_a
+            - pwm5_b
+            - pwm6_a
+            - pwm6_b
+            - pwm7_a
+            - pwm7_b
+            - pwm8_a
+            - pwm8_b
+            - pwm9_a
+            - pwm9_b
+            - pwm10_a
+            - pwm10_b
+            - pwm11_a
+            - pwm11_b
+            - rgmii0
+            - rmii0
+            - sdmmc0_1bit
+            - sdmmc0_4bit
+            - sdmmc0_cd
+            - sdmmc0_hs_sel
+            - sdmmc0_reset
+            - sdmmc0_wp
+            - sdmmc1_1bit
+            - sdmmc1_4bit
+            - sdmmc1_cd
+            - sdmmc1_hs_sel
+            - sdmmc1_reset
+            - sdmmc1_wp
+            - snand
+            - spi0
+            - spi1
+            - spi2
+            - spi3_a
+            - spi3_b
+            - spi3_c
+            - spi_slave_a
+            - spi_slave_b
+            - spi_slave_c
+            - spi_slave_d
+            - spi_slave_e
+            - spinor
+            - uart0
+            - uart1
+            - uart1_flow
+            - uart2_a
+            - uart2_b
+            - uart2_c
+            - uart2_flow_a
+            - uart2_flow_b
+            - uart3_a
+            - uart3_b
+            - uart3_flow_a
+            - uart3_flow_b
+            - uart4_a
+            - uart4_b
+            - uart4_flow_a
+            - uart4_flow_b
+            - vin_master_sync_a
+            - vin_master_sync_b
+            - vin_master_sync_c
+            - vin_master_sync_d
+            - vin_master_sync_e
+            - vsync0
+            - vsync1
+            - vsync2
+            - vsync3
+            - wdt_a
+            - wdt_b
+            - wdt_c
+            - wdt_d
+            - wdt_e
+            - wdt_f
+        minItems: 1
+        maxItems: 6
+        uniqueItems: true
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+
+      drive-strength:
+        enum: [3, 4, 5, 6, 7, 8, 9, 12]
+
+    required:
+      - function
+      - groups
+
+required:
+  - compatible
+  - reg
+  - ambarella,drive-strength-syscon
+  - ambarella,pull-syscon
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl: pinctrl@e4010000 {
+        compatible = "ambarella,cv75-pinctrl";
+        reg = <0xe4010000 0x1000>;
+        ambarella,drive-strength-syscon = <&rct>;
+        ambarella,pull-syscon = <&scratchpad>;
+
+        uart0-pins {
+            function = "uart0";
+            groups = "uart0";
+            bias-disable;
+            drive-strength = <8>;
+        };
+    };

-- 
2.34.1



