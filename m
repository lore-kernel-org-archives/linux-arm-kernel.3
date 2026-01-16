Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF656C79FBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DT9OYF56dSeiOQ5sF9Eaq86ZE8h2jc5QtEzadsx/RUU=; b=bm9ax/VlMYj5RCly4MclgEvRnp
	cnrVsWzA444Yuqz4wXrrLVIEPjSn29U6+vvaVmiY6Ufp7ANqTT59vG9YMvm9Nc0XX2sxURFb1QwS8
	0keHhg0fPI/WCfHFE0A1YK79+4hle+v2MH7LqME6t4+u5PK4pzaA/R+5U8k9NAc8QI4RpmC/Omkmw
	3qZ+USQiDp54mpHTQ3uSkHNsP/nXJEFNiVOijC6KKs7kZdb0PnuL6Rq0UW6kP2Si2i6j6BnFVHIhB
	VVwtCAhoxmJAYYupkG0ysTpFiZG75Qn6VsMLBU3eIAsdQo3fPypCqH8dVh0s/zCJh/1P/QeYZux89
	83GAyaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkI6-0000000EDPZ-41Nc;
	Fri, 16 Jan 2026 13:55:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkI5-0000000EDOk-3RvZ;
	Fri, 16 Jan 2026 13:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12090601B4;
	Fri, 16 Jan 2026 13:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABFB1C16AAE;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768571704;
	bh=mXW/i+rycYbd3I2LEZ8521qw9+6i8fI0ZfZIcbfT19U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AHWPcQLTDsDMdmd87DTfXCAMiKwx26/02NUGwzSACKhe/y21CcQDEUBp3M6FJJHvh
	 a9Gtk25dHQgCGySLU2hxBphZtAeWQqPaOofwpRNB8imRYrYC2mWhpw055Tb9EfpbSL
	 gzO1MHVfxOFwnDj4n/EuPiYbLKIo8i+m2B+U47N5xVMNxx5KWUhGkrrXXDGhg00/K5
	 bUk77HMdUwBDYXuN6rfxtgCAnCEcCY4P8LxExdChRBiiDRAKgSmHfBaTJq2bQqsyAc
	 NaZ31xxBRtkXwwPohbui6zXrnz9zq5YC0CXCkDNQqGKkVs8z0tPUJXvw8miSSdiFdi
	 mv1Ql8VO5psUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A2EC79FBC;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 16 Jan 2026 14:54:59 +0100
Subject: [PATCH v6 1/3] media: dt-bindings: add rockchip mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v6-1-b7ce6e68b3fa@collabora.com>
References: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
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
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768571703; l=5160;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=PPmFFXU4lcpYuhNY2o4F5akS5AB7QRCAUM6FvfO3Y0Y=;
 b=DfTaNkX7QKaXK6tnpArjbTiDq/mnSr0HyVqGg3XxXzAV7DF/PO7+THDaNZ/77bHLphoY5jmrG
 5S18r0HuB1JCzQ4hEQ34umNsLDcv+pN7WKEndSonrniiX+eoOz5uEet
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

From: Michael Riesch <michael.riesch@collabora.com>

Add documentation for the Rockchip MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 141 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
new file mode 100644
index 000000000000..2c2bd87582eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml#
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
+  (C-PHY or D-PHY) and passes it to the Rockchip Video Capture (VICAP) block.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-mipi-csi2
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
+        description: Output port connected to a Rockchip VICAP port.
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
+            compatible = "rockchip,rk3568-mipi-csi2";
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
index fc68ee0c68c0..965132e0933a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25364,6 +25364,12 @@ S:	Maintained
 F:	drivers/i2c/busses/i2c-designware-amdisp.c
 F:	include/linux/soc/amd/isp4_misc.h
 
+SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
+M:	Michael Riesch <michael.riesch@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
 M:	Shawn Lin <shawn.lin@rock-chips.com>

-- 
2.39.5



