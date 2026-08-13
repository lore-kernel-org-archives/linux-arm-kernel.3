Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F1CC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLoojX40mcr5B+3xG4fUqCnkEz3kAjFhFE0JT64UF08=; b=sVvAcNujyoJ/9Y9/f7yKofmt6J
	4ZqET64bS5nKTii6K+9nl3wdyAXAwe4pitw79zlZ/x5ceQAsl1NXQIjjbIWB1wozmBLvYMa8tnfBw
	QINNK/929weLuno7gaQDp4DMMAke5BZnLV1Yz4VSx1OeKyYOznW69b/vV518lf/vENjwES3A9XGN2
	/CliFPcvdm+bAOEC9WllEDbk+RsZE/BgkWjE/pPH4PDrafT4jrQFR3/lZBsjUeMI6Q8Xn/HDTkuhD
	xBWrBeeOJzFQ+DBrYOXBCA+DRDaT3hGNKGUfjO+sF/vwYQOXtD6yQJLKbXm1PrYVVBN7Dw69Vxv1w
	gzMn29rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBU-00000000OU5-1gPv;
	Thu, 13 Aug 2026 09:57:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBT-00000000OT0-3Fs9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FD684400D;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4401EC2BD00;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=aSJA2EFPPGSpWartqH3BCX1f9nWW1yxSp86dYBj9s5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V8JWG0Y0KojYzOxwRMG6MZ025QkxS735fGNL5QXosSI2xZ6R1y4Mdp2vsZWqTxQHk
	 smclbAPj6LrDhkH0mKoEtADGne9yk0KR1x0P+kUe4bPfQp2PkmM6i98k9d6iqU6jEr
	 LcoScTKEghnKXBxRibr5vJ8Z4n6YS2Fjo2dHNqC8qp9GdajINWahzn4Mub7b0PuyG5
	 WpfhCha0/w28MqVuF+dE5rwWJIUwtDJoJeB5/V6PelS6QmcO0avdfMRPHS6cKSgC9f
	 b9c12QVgIPIFchodsVwCrV3XZ8PylcZjltauI4Ff082fDBzNHD+lunb1w7iAY8HFWs
	 bRbw0/gbM3Gfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26980C5CFEB;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:14 +0800
Subject: [PATCH v3 3/6] dt-bindings: clock: add Ambarella CV75 RCT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-3-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=2647;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=10b0bj80z69iNUeJ6xkO89WqeEirl990xJjncrVar6c=;
 b=+GveRNOHVJLxmO9iIuPI3qFB0pTqkG5nwUdiEvMgndDcqyay0kVz+JdAUZ0qITu6saweL9DhR
 soPCPX6RkO5AELmdzD2aofvSI3Ngnrz+3gAG6/Fo93PjB/0J6jQfOb7
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

Document the CV75 RCT clock controller and the clock ID header used by
DT consumers.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/clock/ambarella,cv75-rct.yaml         | 58 ++++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     | 15 ++++++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
new file mode 100644
index 000000000000..eb5956fc32bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ambarella,cv75-rct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 RCT Clock Controller
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description: |
+  The RCT (Reset and Clock Tree) block on the Ambarella CV75 SoC provides
+  PLLs, clock muxes and dividers for on-chip peripherals.
+
+  The same register region is also exposed as a syscon for other SoC
+  blocks (e.g. pin drive-strength), hence the "syscon" compatible.
+
+  Clock indices are defined in include/dt-bindings/clock/ambarella,cv75-rct.h.
+
+properties:
+
+  compatible:
+    items:
+      - const: ambarella,cv75-rct
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference crystal oscillator (typically 24 MHz)
+    maxItems: 1
+
+  clock-names:
+    const: osc
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@ed080000 {
+        compatible = "ambarella,cv75-rct", "syscon";
+        reg = <0xed080000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/ambarella,cv75-rct.h b/include/dt-bindings/clock/ambarella,cv75-rct.h
new file mode 100644
index 000000000000..0a6e946c9108
--- /dev/null
+++ b/include/dt-bindings/clock/ambarella,cv75-rct.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2026 Ambarella, Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMBARELLA_CV75_RCT_H
+#define _DT_BINDINGS_CLOCK_AMBARELLA_CV75_RCT_H
+
+/* Boot / bus clocks */
+#define CV75_GCLK_UART0		0
+#define CV75_GCLK_CORE		1
+#define CV75_GCLK_AHB		2
+#define CV75_GCLK_APB		3
+
+#endif

-- 
2.34.1



