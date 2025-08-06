Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84469C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+sDVe+AL0VvM2xVVhvm9ns2Irn43g9bQsGd/D2Ja4c=; b=oe1GEWzz3FZLkwhWPyoeMNuFx6
	HYylHG9xHZGFQ3gtT8sFJ/7EZEjpBMGBxOruoew36plv4fQ8odwMkg3DhRTCZc3Nug8l4X9D1kVZ/
	1lkscrC8chFRCnFVnq3OXbKro1xdW1K1n9s+NrIfdDo0aWFlLLvNwfJ2RrmeHWbTD8an069bsqh/f
	eyxaxYvonkj37ONxCbUIJUUMuEyQ1T6xV8UXtwon2M774ldfEf3GLK13POhVWK/vV/cn72f906mVi
	J+B+T1uDe4xD8+ss1UzmvL142AG9+EU2zfR4wFR2TF2JyYebVAijxnil28lBBUvmL91wL2jxpXkdC
	EkXgu9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiMO-0000000FziW-01E0;
	Wed, 06 Aug 2025 17:55:32 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiHL-0000000FzFB-3dA8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:50:21 +0000
DKIM-Signature: a=rsa-sha256; bh=K+sDVe+AL0VvM2xVVhvm9ns2Irn43g9bQsGd/D2Ja4c=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1754501630; v=1; x=1754933630;
 b=GovyU9nqwNWQBo54lcF4rXe42IT96iZOZf3OMfVm8XBnZ5b5t7k3K/ugVQu7ez43PkFGf28i
 sNhgiWyqyWbpdXiZOmFzskNuHQGS0OZXCDuwTmAeqRm8T/qaTBnmkAuvBLEiHkCheI5+BXnzfqh
 GOu7Z6LWUKwg+jsTGzUXu55S5+KLKiYh/RPn0+aUocEOBHQBxIEZSWfV4074xZwvCdRyZ75SW+N
 qE/Tbxz0XH2XGyEbBgeSZXzS5eF6Zr0nqhMy0hqGTr42j4bhThBxYQK4Yj1B8O0pKxWbNx+J8yj
 QbW74tRYO2Zi/aswsUhCtqChQRMNJ/RXK3DTJEOzbR4Tg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 0bfd0103; Wed, 06 Aug 2025 19:33:50 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Wed, 06 Aug 2025 19:33:21 +0200
Subject: [PATCH RFC 2/5] dt-bindings: power: Add Marvell PXA1908 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250806-pxa1908-genpd-v1-2-16409309fc72@dujemihanovic.xyz>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
In-Reply-To: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4274;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=NaSKHDpe1UTKIpyJg9w1/zlPE5d3b9jJCH+yLalacOw=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmTJ/6xZ2Z7XR5sfy77GoOPz/LLwrsUi0okGFf3Zsm2b
 +M13/Cio5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACbiv4SR4YO0T2mo+imhjB6F
 A9tajZZ3BE3qmsRbtlCIs3Drhjlqxgz/Q7fr7eabINq9V1FATthoi1HA3NSw31w7HQ9WSM18fHM
 RAwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_105020_055037_DAE7408B 
X-CRM114-Status: GOOD (  11.46  )
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

Add device tree bindings for Marvell PXA1908's power domains.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../power/marvell,pxa1908-power-controller.yaml    | 105 +++++++++++++++++++++
 include/dt-bindings/power/marvell,pxa1908-power.h  |  17 ++++
 2 files changed, 122 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/marvell,pxa1908-power-controller.yaml b/Documentation/devicetree/bindings/power/marvell,pxa1908-power-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1cf3a45d56cbb7b75f7204d656016a9a569da186
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/marvell,pxa1908-power-controller.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/marvell,pxa1908-power-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA1908 Power Domain Controller
+
+maintainers:
+  - Duje Mihanović <duje@dujemihanovic.xyz>
+
+description: |
+  The Marvell PXA1908 SoC includes multiple power domains which can be powered
+  on/off to save power when different IP cores are not in use.
+
+properties:
+  $nodename:
+    pattern: '^power-controller$'
+
+  compatible:
+    const: marvell,pxa1908-power-controller
+
+  '#power-domain-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^power-domain@[0-9a-f]+$":
+    type: object
+
+    description: |
+      Represents a power domain within the power controller node as documented
+      in Documentation/devicetree/bindings/power/power-domain.yaml.
+
+    properties:
+      reg:
+        description: |
+          Power domain index. Valid values are defined in:
+              "include/dt-bindings/power/marvell,pxa1908-power.h"
+        maxItems: 1
+
+      clocks:
+        description: |
+          A number of phandles to clocks that need to be enabled during domain
+          power up.
+
+      '#power-domain-cells':
+        const: 0
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/marvell,pxa1908-power.h>
+
+    clock-controller@d4282800 {
+      compatible = "marvell,pxa1908-apmu", "simple-mfd", "syscon";
+      reg = <0xd4282800 0x400>;
+      #clock-cells = <1>;
+
+      power-controller {
+        compatible = "marvell,pxa1908-power-controller";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #power-domain-cells = <1>;
+
+        power-domain@PXA1908_POWER_DOMAIN_VPU {
+          reg = <PXA1908_POWER_DOMAIN_VPU>;
+          #power-domain-cells = <0>;
+        };
+
+        power-domain@PXA1908_POWER_DOMAIN_GPU {
+          reg = <PXA1908_POWER_DOMAIN_GPU>;
+          #power-domain-cells = <0>;
+        };
+
+        power-domain@PXA1908_POWER_DOMAIN_GPU2D {
+          reg = <PXA1908_POWER_DOMAIN_GPU2D>;
+          #power-domain-cells = <0>;
+        };
+
+        power-domain@PXA1908_POWER_DOMAIN_DSI {
+          reg = <PXA1908_POWER_DOMAIN_DSI>;
+          #power-domain-cells = <0>;
+        };
+
+        power-domain@PXA1908_POWER_DOMAIN_ISP {
+          reg = <PXA1908_POWER_DOMAIN_ISP>;
+          #power-domain-cells = <0>;
+        };
+      };
+    };
diff --git a/include/dt-bindings/power/marvell,pxa1908-power.h b/include/dt-bindings/power/marvell,pxa1908-power.h
new file mode 100644
index 0000000000000000000000000000000000000000..19b088351af138823505a774ff27203429fe2d97
--- /dev/null
+++ b/include/dt-bindings/power/marvell,pxa1908-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Marvell PXA1908 power domains
+ *
+ * Copyright 2025, Duje Mihanović <duje@dujemihanovic.xyz>
+ */
+
+#ifndef __DTS_MARVELL_PXA1908_POWER_H
+#define __DTS_MARVELL_PXA1908_POWER_H
+
+#define PXA1908_POWER_DOMAIN_VPU	0
+#define PXA1908_POWER_DOMAIN_GPU	1
+#define PXA1908_POWER_DOMAIN_GPU2D	2
+#define PXA1908_POWER_DOMAIN_DSI	3
+#define PXA1908_POWER_DOMAIN_ISP	4
+
+#endif

-- 
2.50.1


