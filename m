Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F2EC5DF83
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e07FX5GkEaY9Aqt13Kg3NhmFjpRQdhpSK/kW9/uSmo8=; b=F+HytGT6rYGY6NuJNofdQdxHve
	wwybw7A97LW1iCc5wvrJb03rOOhJNXZyAhUIQtlITHTi9xYKV7kjnI5Y+tPIh7XVVmYiQxRm/2/eW
	jM7NiOs/anr7xeFzU45TC7C7fGktvrI0sQLf0/QnAWI4XwpPLlt7ZX11EqWs/2lR5CIlx4wmPVaSC
	kYSvvheHjQcfKv9A73Nq0S0YuxYNJDohmzDwNueJ/B+GxOUmE4sy/zxhh/alM/+f7Ilt38vPA3Dea
	5PPMq8nVEJDK2z3gEKZb7pu+K256/p5Rol8iBSJ56EfSiPtdkGLxQ05/tDiZqPJbKEAO2ghK+LY5l
	n4UesVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH7N-00000007jK5-48dD;
	Tue, 18 Aug 2026 10:32:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH78-00000007j41-3Zuk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C2B744EBC;
	Tue, 18 Aug 2026 10:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4727C32781;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787049134;
	bh=XE7Jze2pWOY+XLVEZ5GthHvKEoJMO8iLYBrsfeT5fUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kcmtxsBBiEst7E+Mh78eRH4cxVf0bQPPMYZyThjxUW0nSeltxVbnc4+fo2hsAE8l4
	 VW3JUjl8HSOWOdaG6rC6E8WnXABuUnZq57dgD3+HsLx7luEF7UHck477nIgQGbqv1b
	 6j91dqY0IZKYkV8KViC4moGmVAeVSKFc9olgoy3o8O/SYpI9oj7FpvhU+ZbvEfOmBL
	 zrLjO3MxxC4fjmThTvl5JmwHC9aPRVUsd72CVBG3DTJt6DAGDLp9ytH13PhNPZRlo/
	 KLxvvF/7GtUZMIOqwvqtH7Wqf3EkYbHlGqw8kvR6kUWJzhB7JGUVJhrNntcr/KeA6p
	 b2ZE5bz42KFYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB559C5DF7E;
	Tue, 18 Aug 2026 10:32:13 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 18 Aug 2026 18:31:20 +0800
Subject: [PATCH v5 06/12] dt-bindings: serial: add Ambarella CV75 UART
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787049131; l=1828;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=5fvXIv4VkCf1t6ZAmNKnU3A6+aTT4MQ6fcD192SSaH0=;
 b=mUjLxTDt6GYIBD1VZ0ihH3mBXE05YBuVvYwKtwJk/oVtF8hBC5N1AYZD8QCXF8h3B/hzS3JiS
 x6XHFYANljODgynMMLC6EQ5Y8ffoS6SlvUxp4Q01qVPH85Nn14H0XGu
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

Document the Ambarella CV75 on-chip UART controller binding for early
console bring-up. The binding requires a single RCT clock input and
fixed 32-bit register access via reg-shift and reg-io-width.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/serial/ambarella,cv75-uart.yaml       | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml b/Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml
new file mode 100644
index 000000000000..223c84bf460d
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/ambarella,cv75-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 UART
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: ambarella,cv75-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reg-shift:
+    const: 2
+
+  reg-io-width:
+    const: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - reg-shift
+  - reg-io-width
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ambarella,cv75-rct.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@e4000000 {
+        compatible = "ambarella,cv75-uart";
+        reg = <0xe4000000 0x1000>;
+        clocks = <&rct CV75_GCLK_UART0>;
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+        reg-shift = <2>;
+        reg-io-width = <4>;
+    };

-- 
2.34.1



