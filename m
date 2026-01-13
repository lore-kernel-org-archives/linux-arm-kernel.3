Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7256DD30CC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rX1+BScb9TzK7RIeeYFpxE3tFW7H6efjr20rXbLQJ2g=; b=KFJY+StCDZcUslwaF2ZXus1i18
	9+sYJsuDxseundusDxRlH/k4vdipu2sn3JIRxwjarwKqqwaW+F4rpfv++ilxlR1GOdgNsPNFJBCtU
	XJZlo+m1WeMcR72UGvHbeUDndvbO7Lu8gQ0cfkK+IutMxg6wtyBmyCpYZG3p//RBwVsUwyQQ8Pnzs
	ziJEiQ6WYUAfNFIaeJt0Jc2B4eQBuhxkxB59XaMbYnAnXqa9w9hP4vnaY6trj5wnw1+Dcm6DloYMh
	JFvuPWU8fVsjw0h8DPN0uy7qHUHQ4gPq2w00coxWEM2hrn74rwYXEToA/3SmqmCS4ZLtbasgKDRIk
	d5pQ4DMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfle8-00000007j5y-13pi;
	Tue, 13 Jan 2026 21:09:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfle1-00000007j2l-3FCX;
	Tue, 13 Jan 2026 21:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90B9B44340;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52A3CC19423;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338580;
	bh=KzvcJrPkjxLQ6Z7jX8EbkSwIjfIaDVYOPsYxxZYUcLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wa7cshPqtdCUWeX3muOyz91lt+w0IUy6gd24zvMbPBeMY2irJ6icvL+bKQfcY2xey
	 8/lrm0hLveW3neRAkVi9JY4+ngVXpnfLk0ttbTEnlPwNHr4U7gdiW4WywssVzeUj1b
	 WcCyf6me499UzwUVihWWBIQDMbjyY8lJ3U8fdBpvpv+S3Qgjhs7oMWJzEJgsDbM/dN
	 hQ4EYAFnZTRZ/cY2+ejbefcKjztPDahX3Omkt7eCNDHZ0QZPKUu/oJgY3So1yErUFr
	 msTYJq0Tu9fqYk6ZTgZbs1EUgkxoIh9furKXoOG8HXhvtrrdilPDhdf7naw1SLaMLB
	 dD3e5HIpXrBYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B1FD30CC3;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 13 Jan 2026 22:09:27 +0100
Subject: [PATCH v3 1/3] media: dt-bindings: add rockchip mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v3-1-16e83aa7f395@collabora.com>
References: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768338578; l=5373;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=YiATaUtIUr4MrRpJpU3Wq3Y+VV09qyPFQQR7+zuX0zg=;
 b=zztIh3w0DnVYcShoXLigW0Zkd6Kg/GbjzarWzQaIo7Xu19xvVWTTgtWzFU9t1H4NMp9bDf96M
 1a30mWUwkgMD6+mCMydUUkQqB7KgP7y0WbucJDqW93jl1AykjvhC0Hx
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_130941_877916_6F340F51 
X-CRM114-Status: GOOD (  14.34  )
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

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 146 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
new file mode 100644
index 000000000000..52fe959af8f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip MIPI CSI-2 Receiver
+
+maintainers:
+  - Michael Riesch <michael.riesch@collabora.com>
+
+description:
+  The Rockchip MIPI CSI-2 Receiver is a CSI-2 bridge with one input port and
+  one output port. It receives the data with the help of an external MIPI PHY
+  (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video Capture (VICAP)
+  block.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi
+          - const: rockchip,rk3568-mipi-csi
+      - const: rockchip,rk3568-mipi-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Interrupt that signals changes in CSI2HOST_ERR1.
+      - description: Interrupt that signals changes in CSI2HOST_ERR2.
+
+  interrupt-names:
+    items:
+      - const: err1
+      - const: err2
+
+  clocks:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description: MIPI C-PHY or D-PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port node. Connect to e.g., a MIPI CSI-2 image sensor.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - bus-type
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output port connected to a RK3568 VICAP port.
+
+    required:
+      - port@0
+      - port@1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - phys
+  - ports
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/rk3568-power.h>
+
+    soc {
+        interrupt-parent = <&gic>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi: csi@fdfb0000 {
+            compatible = "rockchip,rk3568-mipi-csi";
+            reg = <0x0 0xfdfb0000 0x0 0x10000>;
+            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "err1", "err2";
+            clocks = <&cru PCLK_CSI2HOST1>;
+            phys = <&csi_dphy>;
+            power-domains = <&power RK3568_PD_VI>;
+            resets = <&cru SRST_P_CSI2HOST1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                csi_in: port@0 {
+                    reg = <0>;
+
+                    csi_input: endpoint {
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&imx415_output>;
+                    };
+                };
+
+                csi_out: port@1 {
+                    reg = <1>;
+
+                    csi_output: endpoint {
+                        remote-endpoint = <&vicap_mipi_input>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 752ccaea38b0..dafa8ef7a000 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22636,6 +22636,12 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP MIPI CSI-2 RECEIVER DRIVER
+M:	Michael Riesch <michael.riesch@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.39.5



