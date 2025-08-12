Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B498CCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TVTiP3d3up0r4WmriP+EavdkE7gYiaPW3w5Dge65o+w=; b=eQW8huvBnOw6M1i/D5W9g5uCu2
	+ErJCXAzfFjwIBhtwZapaQ26joRwvaDwSMVWSNcyFjAgMd0DysyGNvu9ajNjMy9pskgaYLQyUUNmo
	l9jLtv3JV7fpYo7nqF1xmg/YIPqdYc1vJr8k3ug7wg6nbwYJHSJ6lqe1mmKlZJiZzJp9OjvlOdO04
	1rXxWjGE02W5Tg+9zRRcRqV7868d2792JGbNQgNvjcLWfNr1GVuG4U2qkzJs48d7bOZiz2nKJmhju
	M1hOAQ12WI26HrCANFzow4dpiYHkPDH00Ocnb/Lfy12Lld+u4rIeFUhfbVtlUtoLx2Z54SVcniO3f
	+cC2dGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvga-0000000BwzH-3Lfx;
	Tue, 12 Aug 2025 20:33:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultVP-0000000BguD-18h1;
	Tue, 12 Aug 2025 18:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB2165C4A77;
	Tue, 12 Aug 2025 18:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B12C4CEF0;
	Tue, 12 Aug 2025 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755022430;
	bh=2G9iWlo23GHxJ65AxMwzRiYfucjYHe/ztpYSv1VBrOs=;
	h=From:To:Cc:Subject:Date:From;
	b=eQju3OOPGRBU8gqJkHFznbsclSPjdm3XbsGXpJ0hyscmGPlsNhrAxAlHYxbSL+egM
	 0YhqKNCSY8Y6sS+ZtcxQl8cR0o7DIyUuBMzbUFmKd5oeVXy+SXJNRDjpzAdNAS1xhB
	 N+Ic2Ta4ecBcWE1gW4hAZwSSr38+KlJYJeueN96A8/m2zQ2+814xGgjtowSULTPKMv
	 hG2O8Xu7tZ/fQXL8KzVPN0ERHutxYLPX/mj2Qu/FGL06quL/LCRCO1jMJX8RFfjhB0
	 9d8SCM6CaHizp1EwVrjGW3DXwFEJOaY+zNsK+6cu4HiCc2QQUOn/S1Uhbf5aKlUsw7
	 rB52QZFgKWNyw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] dt-bindings: mailbox: Convert rockchip,rk3368-mailbox to DT schema
Date: Tue, 12 Aug 2025 13:13:46 -0500
Message-ID: <20250812181348.62137-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_111351_388669_70948DF6 
X-CRM114-Status: GOOD (  16.93  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Convert the rockchip,rk3368-mailbox binding to DT schema format. Add
the missing 'clocks' and 'clock-names' properties. Document that it's
one interrupt per mailbox channel (and there are 4 channels).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../mailbox/rockchip,rk3368-mailbox.yaml      | 56 +++++++++++++++++++
 .../bindings/mailbox/rockchip-mailbox.txt     | 32 -----------
 2 files changed, 56 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/rockchip,rk3368-mailbox.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/rockchip,rk3368-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/rockchip,rk3368-mailbox.yaml
new file mode 100644
index 000000000000..107bc96a8f3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/rockchip,rk3368-mailbox.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/rockchip,rk3368-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3368 Mailbox Controller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  The Rockchip mailbox is used by the Rockchip CPU cores to communicate
+  requests to MCU processor.
+
+properties:
+  compatible:
+    const: rockchip,rk3368-mailbox
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pclk_mailbox
+
+  interrupts:
+    description: One interrupt for each channel
+    maxItems: 4
+
+  '#mbox-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@ff6b0000 {
+        compatible = "rockchip,rk3368-mailbox";
+        reg = <0xff6b0000 0x1000>;
+        interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt b/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
deleted file mode 100644
index b6bb84acf5be..000000000000
--- a/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Rockchip mailbox
-
-The Rockchip mailbox is used by the Rockchip CPU cores to communicate
-requests to MCU processor.
-
-Refer to ./mailbox.txt for generic information about mailbox device-tree
-bindings.
-
-Required properties:
-
- - compatible: should be one of the following.
-   - "rockchip,rk3368-mbox" for rk3368
- - reg: physical base address of the controller and length of memory mapped
-	region.
- - interrupts: The interrupt number to the cpu. The interrupt specifier format
-	depends on the interrupt controller.
- - #mbox-cells: Common mailbox binding property to identify the number
-	of cells required for the mailbox specifier. Should be 1
-
-Example:
---------
-
-/* RK3368 */
-mbox: mbox@ff6b0000 {
-	compatible = "rockchip,rk3368-mailbox";
-	reg = <0x0 0xff6b0000 0x0 0x1000>,
-	interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
-	#mbox-cells = <1>;
-};
-- 
2.47.2


