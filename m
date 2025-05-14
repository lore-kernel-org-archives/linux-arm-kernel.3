Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DEEC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AnbZZAO2C0KRQIUMzqmILmjo2qU2M45ughTci//7tg=; b=X4jdadlkiDKGqBrPQqI42HHxZ1
	wkWo/Neu/KISPuSvEmnF2PVL48g4YAoLNBfYyFZseZP5yuSPaBtmKcp8mtaYRTB0c5Twg/vNuuph8
	PjSFjaNTJIcOf+lD+tPmDPlDCiZVv6MR3+bQk578/mNFpoAgrO9J70Qi+sqUuGXxMdikfOykj59gC
	Q4+ZU5VMiXDxszr3UttCsPdQMfKXjEg67IXJypoYXSGVQj8clLiL14A0MXneVAsd0y67lTmgiHfJc
	WY3oeT5U1jQtoHMX5Kqy7STA4YFp+GF4E3ABE59d+Sr17Db40zOInV6heth1PG7k05RlLao3nMbnQ
	QS4jZoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBV-0000000FtpP-1mKC;
	Wed, 14 May 2025 17:46:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEPo-0000000FeNo-0C1z;
	Wed, 14 May 2025 15:53:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B229629DA;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1E5AC4CEF3;
	Wed, 14 May 2025 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237982;
	bh=rN575DOX7I6B9Oaxm/gUP/LsqVXGls7ZtIzvxS23oVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U3gVfKV4r/t4engHn13jJ0LztWXWAi0aowSssfb7dz4YId8KntPXvSjTqvK+1jeww
	 Gqi8ljTTxGmLFc/H5Rc1UkTo7EUKgTiQ2qzTHSepj09HOnZFGQAbpwoeikvwsd3VQk
	 1Fg4k9EC1w7DfUbGP4lUIf0kdE2TTwir+U9/VJW9LCMO/fguGeWGP3ikPhZVUz7ZP4
	 /iUkc8RCimR9YfoVVZyaqn9pCmEJSnlk14lNdCToN9k7/pgx1UJg44yq0nVZMpq3oR
	 Bl4jNtip6JZm0loPLBniPQMNsmyp1et9qMQYdJXfoTiVHKHMmm+PPtqB4rtmeFjMSX
	 OmT+GdRcTOXQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FA1C3ABDF;
	Wed, 14 May 2025 15:53:02 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:05 +0200
Subject: [PATCH v7 04/14] media: dt-bindings: add rockchip rk3568 vicap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-4-7581fd96a33a@collabora.com>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=6191;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=96Tr5mfUkmc33pcpF/k7Mxka10I4d3+rkRTtrREPGYs=;
 b=Ks4///+3fD9LQsJa36e4U7gmTh0C2lZxdi+mNplsYRwyDsCgcocvxc/ila0ffHKCdjyTXP5t2
 yGq+dkKEE08D+Slo+UtzaocgZDbwGy5cmVSZY5wgpujqLQHlfr7kxZb
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@wolfvision.net>

Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 171 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
new file mode 100644
index 000000000000..99861d236f5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3568 Video Capture (VICAP)
+
+maintainers:
+  - Michael Riesch <michael.riesch@collabora.com>
+
+description:
+  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
+  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
+  the data from camera sensors, video decoders, or other companion ICs and
+  transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-vicap
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: DCLK
+      - description: ICLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: dclk
+      - const: iclk
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: ARST
+      - description: HRST
+      - description: DRST
+      - description: PRST
+      - description: IRST
+
+  reset-names:
+    items:
+      - const: arst
+      - const: hrst
+      - const: drst
+      - const: prst
+      - const: irst
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to general register file used for video input block control.
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The digital video port (DVP, a parallel video interface).
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+              rockchip,dvp-clk-delay:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                default: 0
+                minimum: 0
+                maximum: 127
+                description:
+                  Delay the DVP path clock input to align the sampling phase,
+                  only valid in dual edge sampling mode. Delay is zero by
+                  default and can be adjusted optionally.
+
+            required:
+              - bus-type
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Port connected to the MIPI CSI-2 receiver output.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3568-power.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vicap: video-capture@fdfe0000 {
+            compatible = "rockchip,rk3568-vicap";
+            reg = <0x0 0xfdfe0000 0x0 0x200>;
+            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+            assigned-clocks = <&cru DCLK_VICAP>;
+            assigned-clock-rates = <300000000>;
+            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+            clock-names = "aclk", "hclk", "dclk", "iclk";
+            iommus = <&vicap_mmu>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+                     <&cru SRST_I_VICAP>;
+            reset-names = "arst", "hrst", "drst", "prst", "irst";
+            rockchip,grf = <&grf>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                vicap_dvp: port@0 {
+                    reg = <0>;
+
+                    vicap_dvp_input: endpoint {
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                        bus-width = <16>;
+                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+                        remote-endpoint = <&it6801_output>;
+                    };
+                };
+
+                vicap_mipi: port@1 {
+                    reg = <1>;
+
+                    vicap_mipi_input: endpoint {
+                        remote-endpoint = <&csi_output>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c71ba2de8e71..1c327f87a6a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21009,6 +21009,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/rkcif*
 F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
 
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>

-- 
2.39.5



