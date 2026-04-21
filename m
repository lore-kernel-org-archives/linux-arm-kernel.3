Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AF2F94CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KE/tdyyZoxPOLWvriT/rsSLHoXJGAn2TmnIez/dpnok=; b=Ve2oWF1+xObJF2o5aLIq/3KNGy
	ENdEDPKvIzYDKy6j6/qu5S5/6YJ65MYhRBfUuAsKcC7Y6nF4moRhBE/2cdJe5ZrUskG4tQUJcbgxd
	XxX0ppZ7fRbrG0kmea4Y+SJnWvJO3tlFCYEnzSJo6nrJ2ti0bXPhbUAEMJ3URHX5EVo0Bo99ZYXP1
	HOu/4hImhxkusRLV0oUiS5sCXy8fDS+RK0/QURXOIAmxUVv+PtOI0RcBel4VjP7il75ZC90bT82bU
	k/2R/uEx05Lq0afokNj5Vnuvwh8RlfM3BPhTJmQpaL8fFn1kHXxw2e4CqYVXJ6rBfVy92QEu10MhL
	dyXI2pNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFad-0000000919B-3rLE;
	Tue, 21 Apr 2026 18:12:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFaa-0000000916A-3Pfg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80D8541924;
	Tue, 21 Apr 2026 18:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3D1C2BCC9;
	Tue, 21 Apr 2026 18:12:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H Module Controller
Date: Tue, 21 Apr 2026 20:11:43 +0200
Message-ID: <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_111248_889044_3798B785 
X-CRM114-Status: GOOD (  17.40  )
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

Document support for Renesas R-Car X5H Module Controllers, and
add definitions for power domains not backed by registers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/power/renesas,r8a78000-mdlc.yaml | 63 +++++++++++++++++++
 .../dt-bindings/power/renesas,r8a78000-mdlc.h | 16 +++++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
 create mode 100644 include/dt-bindings/power/renesas,r8a78000-mdlc.h

diff --git a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
new file mode 100644
index 0000000000000000..c3075bb308962f59
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/renesas,r8a78000-mdlc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car X5H Module Controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  Each instance of the R-Car X5H Module Controller (MODULE CONTROL) provides
+  Power Gating for up to 64 Power Domains, and Module Standby and Reset for up
+  to 256 modules in the Power Domain of each Module hierarchy.
+
+properties:
+  compatible:
+    const: renesas,r8a78000-mdlc
+
+  reg:
+    maxItems: 1
+
+  '#power-domain-cells':
+    description: |
+      - The first power domain specifier cell must be either the Module
+        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
+        datasheet, or a Power Domain number, as defined in
+        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
+      - The second power domain specifier cell must be the module number
+        (0x00-0xff), composed of the Module System Reset (MSRES) register index
+        in the high nibble, and the Module Reset Destination bitfield index in
+        the low nibble.
+    const: 2
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number (0x00-0xff).
+    const: 1
+
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the SCMI firmware device node on systems where SCMI must be
+      used instead of direct hardware access.
+
+required:
+  - compatible
+  - reg
+  - '#power-domain-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@c3060000 {
+            compatible = "renesas,r8a78000-mdlc";
+            reg = <0xc3060000 0x1000>;
+            #power-domain-cells = <2>;
+            #reset-cells = <1>;
+            firmware = <&scmi>;
+    };
diff --git a/include/dt-bindings/power/renesas,r8a78000-mdlc.h b/include/dt-bindings/power/renesas,r8a78000-mdlc.h
new file mode 100644
index 0000000000000000..31aa4935a7c5cf94
--- /dev/null
+++ b/include/dt-bindings/power/renesas,r8a78000-mdlc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Glider bv
+ */
+#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
+#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
+
+/* R-Car X5H MDLC Power Domains */
+
+#define R8A78000_MDLC_PD_AON			0x40
+#define R8A78000_MDLC_PD_SCP			0x41
+#define R8A78000_MDLC_PD_APL			0x42
+#define R8A78000_MDLC_PD_CMN			0x43
+#define R8A78000_MDLC_PD_ACL			0x44
+
+#endif /* __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__ */
-- 
2.43.0


