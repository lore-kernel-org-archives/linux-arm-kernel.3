Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 21:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEZ1hohA1SfN0xO5CoglM5ucHKcyM83/vRsaJ6+2HNU=; b=REO5Fd1hYNV/2KIWc07KWJClqz
	gsztiKvOfHnLzFm1TW0aj3vn+5BTkicwAKmmsNmaOamfRqoFk/G9xfBHFXZnUQWoitVXETI91LXJs
	VtLB0URMOm1qTpqQhClhDPrOQoIMjCE6ZIdEgqFeCTPpEvbpY+8G64EejQ5rpFXKOr92FK6XlmPBf
	XlRcPvcAn+EP9cOL6U0rH8B5rmVcxoUxwb1d0bHNf39xxbtScRN5JIM5VpJ6REbLvd77pzcItHOhq
	f7juJoMAzXNy6+GqhQ71oJCB9sg3JEZwAxrDe6UJaiPnVf3s+v/XauC1rQmdkoHGQ1W+zitQ4akYJ
	C9v62Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXofF-00000009pxQ-2mBq;
	Tue, 14 Jan 2025 21:41:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXocm-00000009pVp-2MJL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 21:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71A10A419D5;
	Tue, 14 Jan 2025 21:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBBB4C4CEE0;
	Tue, 14 Jan 2025 21:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736890738;
	bh=FqqtuHZ2xVpq81aHXkj01ME5McvceHelIy459BBbk2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kpIlewjODP2b+bu5o8Of38Osa+5QiLTa/XTiSD3LYa1nxbaGr51HiFUCxwm7mBtis
	 riWip8fozkEaKQ+i8Bu0RBWIPR2NUhz/10q9PZgcYn0uZTr9xuwI48xR0k9EzSptEa
	 QfCHUJpTDtukQHY9UdhKs9egB7pTI4c3HluS64jh4v0hoGWAbEuu4FbUksloP8VYok
	 3G4CQ0cGC2jkfD0aq06PbdyFwtp8TCcN2ONbi+p3cPFpj33xbbldGwgIMUnAHh3icz
	 keNTwJNQ8fLH5/dAze1rEEc+045uMzaoZcm3TKLK5IHCaKqDwQOVpZvZIZvV2AUdFw
	 prSTtrvMe7mDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3DEC02185;
	Tue, 14 Jan 2025 21:38:58 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:38:52 +0100
Subject: [PATCH v4 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-adpdrm-v4-1-e9b5260a39f1@gmail.com>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
In-Reply-To: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736890736; l=7241;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=+zXbhZGcaNGoRP+96oERb98U1ZjM+cx6jbgYsDm87Qc=;
 b=NugG+sm4vlbYEbeP7khDpYjOxGVELtAWLvnq09DHWSXxJgcnu2Bw90xLMsHjpKH6XJI0Drkqy
 0qo9wr4q42GBsqOqKE1HuYEYc7BnbHZ/po/R2wvTGqjwFeL5F6WTgID
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_133900_733673_F92FCD5F 
X-CRM114-Status: GOOD (  13.02  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for a secondary display controller present on certain
Apple laptops.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../display/apple,h7-display-pipe-mipi.yaml        | 83 ++++++++++++++++++++
 .../bindings/display/apple,h7-display-pipe.yaml    | 88 ++++++++++++++++++++++
 .../bindings/display/panel/apple,summit.yaml       | 58 ++++++++++++++
 3 files changed, 229 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5e6da66499a508c001670f68fa00d6bab13591d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/apple,h7-display-pipe-mipi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple pre-DCP display controller MIPI interface
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description:
+  The MIPI controller part of the pre-DCP Apple display controller
+
+allOf:
+  - $ref: dsi-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8112-display-pipe-mipi
+          - apple,t8103-display-pipe-mipi
+      - const: apple,h7-display-pipe-mipi
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port. Always connected to the primary controller
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output MIPI DSI port to the panel
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi@28200000 {
+        compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
+        reg = <0x28200000 0xc000>;
+        power-domains = <&ps_dispdfr_mipi>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                dfr_adp_out_mipi: endpoint {
+                    remote-endpoint = <&dfr_adp_out_mipi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dfr_panel_in: endpoint {
+                    remote-endpoint = <&dfr_mipi_out_panel>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..102fb1804c0c0b84f590e507ca2d526948e98f68
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/apple,h7-display-pipe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple pre-DCP display controller
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description:
+  A secondary display controller used to drive the "touchbar" on
+  certain Apple laptops.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8112-display-pipe
+          - apple,t8103-display-pipe
+      - const: apple,h7-display-pipe
+
+  reg:
+    items:
+      - description: Primary register block, controls planes and blending
+      - description:
+          Contains other configuration registers like interrupt
+          and FIFO control
+
+  reg-names:
+    items:
+      - const: be
+      - const: fe
+
+  power-domains:
+    description:
+      Phandles to pmgr entries that are needed for this controller to turn on.
+      Aside from that, their specific functions are unknown
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: Unknown function
+      - description: Primary interrupt. Vsync events are reported via it
+
+  interrupt-names:
+    items:
+      - const: be
+      - const: fe
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output port. Always connected to apple,h7-display-pipe-mipi
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/apple-aic.h>
+    display-pipe@28200000 {
+        compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
+        reg = <0x28200000 0xc000>,
+              <0x28400000 0x4000>;
+        reg-names = "be", "fe";
+        power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
+        interrupt-parent = <&aic>;
+        interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
+                     <AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "be", "fe";
+        iommus = <&displaydfr_dart 0>;
+
+        port {
+            dfr_adp_out_mipi: endpoint {
+                remote-endpoint = <&dfr_mipi_in_adp>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f081755325e97ad58b831893b84082cc10f8d5e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple "Summit" display panel
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description:
+  An OLED panel used as a touchbar on certain Apple laptops.
+  Contains a backlight device, which controls brightness of the panel itself.
+  The backlight common properties are included for this reason
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/leds/backlight/common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,j293-summit
+          - apple,j493-summit
+      - const: apple,summit
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - max-brightness
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "apple,j293-summit", "apple,summit";
+            reg = <0>;
+            max-brightness = <255>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dfr_bridge_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.48.0



