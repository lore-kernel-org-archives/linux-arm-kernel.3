Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738DBC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CLuglWww/cpnE9iMVkbWNWwDdhMcYkMOkDQE39kjT8=; b=y9h4d4YtpBbMWmfy7iqJeiXHCh
	TC3baPHAouTK87M/4mXfICclScOfm6ZL/L4nCxTtsd/in/98Da9rFX1BsQ7xnfz79iCNmmpz62A8f
	aGYjS/FIIbliMEUVN8HWyksWPkv/5rfRP64yvH/tL+PB/airLwCiKbqEqnDULpRzBs+gGNg4195N/
	t1Pu8GTrT8N2aQj7WRzdQoxHk4NHo/Al97E4UsXS2O/C6Y/BXba/x1lhL2QRVqefuquGTf523A7Nt
	g9qYFC9K0cOKnXhUspYBeRUtbi7+73BxkSNLYCuva/I/+EvNYMXXC0IsiR0ORSLT8SnPo3Qvu30MM
	FA8QSzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Baa-0000000BKfK-41GP;
	Thu, 17 Sep 2026 12:51:44 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BaX-0000000BKed-2oSC;
	Thu, 17 Sep 2026 12:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789649487; bh=4CLuglWww/cpnE9iMVkbWNW
	wDdhMcYkMOkDQE39kjT8=; b=JwUcMar2nbwhjP9o2iVvJsFUae4FRG2nh4H1umpSKuGuWa3jAA
	NnZsUncmc/1bvPA4opiDWiQSGHJzuToQF7bZopYfRqCVAkJCVaw78XdlSI/6F5FB2Cf1JXOtrE0
	KnAj93lW34/s2Gkfs9o5UjZ7wtzs+swbpNg+ifpz482klkQCM9GW98d15l2YLaW0jgxlOiJgEhh
	N+IByxvcqGScHgvv/dMI1Ap1NwBv/Q9++edllTcPRic2sX3heyU3d7DhPzhtytR7pbh0agLxX/a
	EeXcR3Zh1gxQ/yyfLlYz1gc7tdRx0OqYo5yJxhPF5XbdoxvkW4Q+FOC99wO9/rgEIxA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789649487; bh=4CLuglWww/cpnE9iMVkbWNW
	wDdhMcYkMOkDQE39kjT8=; b=1zWkS9L1PSKJlaS/vFXPP2pIVDzFNP3Cr/DxtQJIzNoUT+64aG
	MZU994hzyLSP5ydS9NLXIr2HMCb21Sw6OJCQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 17 Sep 2026 15:51:20 +0300
Subject: [PATCH v4 1/3] dt-bindings: display: panel: Add Novatek NT51021
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-qcom-novatek-nt51021-panels-v4-1-30afbc35d70c@mainlining.org>
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789649485; l=3534;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=x8NEKtFdLRC+MuRJnahM8czimw+tZNpnYl/kkgWz68w=;
 b=6NTWr4+56WUkrYFqCqZYlmkrrLwJsXMmGybON1kmhDeKnQ6zhR2RyhFrxjn/GS1vueiZ3JTpE
 +2jH1csFubYDWx3MTblGjlAxgvGU0fxL39FhDjDvegzQcREBmNlCnNT
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055141_880596_9A06ECF7 
X-CRM114-Status: GOOD (  12.40  )
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

Novatek NT51021 is a display driver IC that can drive DSI panel. It
is also present in the BOE TV101WUM-NX0 video mode panel, which is a WUXGA
panel with a resolution of 1200x1920 and 10.1 inches size. It is found in
Xiaomi Mi Pad 4 Plus. Also it's present in the BOE-TV080WUM-NX2 video mode
panel, which also has a resolution of 1200x1920, but 8 inches size. It is
found in Xiaomi Mi Pad 4. And also it's present in the BOE-TV101WUM-NM0.
It's found in Amazon Fire HD 10 (2017).

Add the bindings for display driver for the IC, with support added
for this BOE TV101WUM-NX0 and TV080WUM-NX2 WUXGA video mode panels.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 .../bindings/display/panel/novatek,nt51021.yaml    | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
new file mode 100644
index 000000000000..7754a8cb1e5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt51021.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT51021 based DSI display Panels
+
+maintainers:
+  - Nickolay Goppen <setotau@mainlining.org>
+
+description:
+  The NT51021 IC from Novatek is a generic DSI Panel IC used to drive dsi
+  panels.
+  Right now, support is added only for a BOE WUXGA LCD display panels with a
+  resolution of 1200x1920. They are video mode DSI panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - boe,tv101wum-nm0
+          - boe,tv101wum-nx0
+          - boe,tv080wum-nx2
+      - const: novatek,nt51021
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active low)
+
+  vdd-supply:
+    description: phandle of the regulator that provides the supply voltage
+      for digital circuits
+
+  avdd-supply:
+    description: phandle of the regulator that provides the supply voltage
+      for analog circuits
+
+  havdd-supply:
+    description: phandle of the regulator that provides the supply voltage
+      for analog circuits
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - avdd-supply
+  - havdd-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "boe,tv101wum-nx0", "novatek,nt51021";
+            reg = <0>;
+            vdd-supply = <&lcd_pwr>;
+            avdd-supply = <&lcd_pwr>;
+            havdd-supply = <&lcd_pwr>;
+
+            backlight = <&i2c_backlight>;
+            reset-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.55.0

