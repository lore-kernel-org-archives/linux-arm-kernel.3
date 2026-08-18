Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78896C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5gpcTOIKTny7J66cv11qDLumaURT70ynjOZeU7pZG8=; b=GpXEFHv6z/oyRi6lB+gk2EkhMt
	cgKR1PG+gPeRQCHU7m4DT4rGzfcLdJz0ILDVYYmw+uZAQzym2+KFoh6QK0bi1gNeP6TVK1F25W7HY
	O8pbsbQviE3sPTaI4v6NzWerngnPG/fHiPtt2oLusG57XRn2PDIc17xn86cpY8hCKqZ9y75k1onRO
	VzgeJD4inh3B8jnAjZ1smaX8GG95bEvYK/lyYVV2AIw2ws3zTnh5D7bSXyNoAT+ItdSlFmCztrgtD
	oLZXQZPcJYyU7wBlCKh/g2UjirMfvknhJmYF3oc9r7+kMeoX58g9d9RJ82aRvbUNy87qRU0io4Wsd
	Q9YQOv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH7N-00000007jJl-3XpX;
	Tue, 18 Aug 2026 10:32:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH78-00000007j4V-3TzZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4AEF44BB0;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B49FCC2BCFD;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787049133;
	bh=hp7bqmHn9P6jHYwnNUYIruS99llCyau/ChCTrkE9I+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ayZJa1sVH7++0TDFW9aoodDYU6rdAbzkf4zDqLPqxB14Gvf+E1hkBbZCwXlQxA0g8
	 d/cqkhqkrCg7idKhrZ8T+E7ClPgbT/DnydVFo6152Vl4nrM+vxj6lwuLBr4QhwNBL0
	 RZ4jeV+HJkn0ylpRBCDb6B9hxiD/6pd89uxL+w+P6r2rbtStD7p3nmzFeSWWcGDArr
	 Gg63P3aoexDRuItczcnDFBs/H0A90vps2MQrFP7kZYHu3iQ5S+2daURmFaBjNsgqa/
	 cbyjWHxMiF16l+a+riRZAEn4frC/1BNCpO7faceOuEZ3mXQsr+vDpzkuzZG0eW22sW
	 OydMv0infh7Rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D225C5DF81;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 18 Aug 2026 18:31:18 +0800
Subject: [PATCH v5 04/12] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-cv75-v5-v5-4-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
 Long Zhao <zl020895@163.com>, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049131; l=6330;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=XEvKncSGovDF7OgNkB6DKQG+ZkDy9YW2XQhMlWM+4n0=;
 b=h0FnNS20H56ST+R+dRfD5UAzzGYH0JEd8Or/5lM0Na4qx2C7nEvIIvStg13h1naJHobLAF/AF
 uZh/eJHD9QZBVWpx9A5orZvK3lxDnL1ANHOdlepSP7cT+s9rcZpktTG
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
 .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
new file mode 100644
index 000000000000..34054bc56c3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
@@ -0,0 +1,239 @@
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



