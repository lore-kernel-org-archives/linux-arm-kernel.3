Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0E7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 20:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3mOnxrwm4v6YkMeEl63O551wf2ZXt6VBmx5Q4TpIp4=; b=4x7z8qGVTvyOtFQ/Ir4JuGOguX
	fajL1HMeoVsVDym10YNSsKUGoQqfKtx7OZD1vGpiUeBwq3ttPtMzi7U5x+cKZ/2BruKKkXRdmUcl+
	jkV2lhQOsmuM+0fMyDeDZhPUuWScTUt/086g+DGAPoLUyMm6CpE+guQdo+NeRol5t4bCM0RYfmgTu
	gf2NH3cWCE9+BeRA7XLwAnpWeQaE/6993HRteNYevNG/axHDuvbEwQJNDdPhaJysjfFvCFNfKc2tY
	5ZsYzS12q4sjrYSLp6KjcMgd7hWOcPL/xmWciu6vh4olA1NS16nBufrbgauduyxv8/LgtNknBgCB9
	5ZU8b8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4tO-00000003Qaj-1NMK;
	Sun, 12 Jan 2025 20:49:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4oT-00000003Pks-1yyJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 20:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5D605C43AA;
	Sun, 12 Jan 2025 20:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43DEFC4CEE3;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736714639;
	bh=WBrSErQMzfWPCF5h74vrUfu8w96wHnlkQey5D/+BBMY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LxZBOvln48brBUEaVVzcORGZys54d/KTZvVgUvm2lhLk+Jger/G+98qH6bLV37sjs
	 As10i2tRuQMm/451TG9AwPEKnJus2XY1StTMsmTS9niC3YeO5XrePoZF72v/hgiRo1
	 wSVv7aO2vQeYTUteLjPJwhCWYFXmCVrMi+jZpBoEV4SBy0Y5mEkEU7MgC7L1ZZ7k5Z
	 bxS91k0ZA5/l68FcqQZoY9rI2SL3gQns0LxYOhwnAx/P5aPH+GxFXJ10EDkiS8FInD
	 NNE5fr9R7uiMZYlUzN8p2gLaWIsUP0VNJSS82GU9BTrTl2mVqcfEnkcYzmAkN4yTlp
	 9hVnRmajk8FeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34110E7719F;
	Sun, 12 Jan 2025 20:43:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sun, 12 Jan 2025 21:43:48 +0100
Subject: [PATCH v3 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-adpdrm-v3-1-c674dc19fa7f@gmail.com>
References: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
In-Reply-To: <20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736714637; l=7143;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=5vdKdNHnK6LNHwjFiK0f3l2jH/l1B1N8KQT2Vbt2NHM=;
 b=h1g5rExM5bLzwa1E0w0TmsFHtJLy/yyxbXl5PydQBsO5Lo3/886pt4Vy445qe3OIMvA2KwbPt
 ak8GXTHH0lZDiNev09fQ1B/H8MSwsZq3enA1U2lGQa/8fOqAZ4nWm+g
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_124401_627720_388AC6B0 
X-CRM114-Status: GOOD (  13.36  )
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
 .../display/apple,h7-display-pipe-mipi.yaml        | 79 +++++++++++++++++++
 .../bindings/display/apple,h7-display-pipe.yaml    | 88 ++++++++++++++++++++++
 .../bindings/display/panel/apple,summit.yaml       | 58 ++++++++++++++
 3 files changed, 225 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b898c472962a2aec2aed6870e29b94f0ad356bd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
@@ -0,0 +1,79 @@
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
+    dsi@228200000 {
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
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+
+            port@1 {
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..dc07edccb437b221ea9772b9356e1896326aa7da
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
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: be
+        description: Primary register block, controls planes and blending
+      - const: fe
+        description:
+          Contains other configuration registers like interrupt
+          and FIFO control
+
+  power-domains:
+    description:
+      Phandles to pmgr entries that are needed for this controller to turn on.
+      Aside from that, their specific functions are unknown
+    maxItems: 2
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: be
+        description: Unknown function
+      - const: fe
+        description: Primary interrupt. Vsync events are reported via it
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



