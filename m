Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DDAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NysbQOJ86vuPoT7ltR1OuNDQoX9vHxyNbrDaqkbNVY=; b=4/PXHjEv3IRZN9sVpkqTpJwu7p
	QHbqO0BJwQIIBJFWIPSKuH4xK0LhMv1Ld+HxLjtxF4qHqYicKFBd7HacbhEJtLu53oSJNenoh6dBc
	I4TStAKsfZ2yFKdihZSmEE3Xi7zNqyMLn7KqACsYvXLw5LOs8OydVAFRP4dhVoPDGmGefUG3qowbH
	P+yhgANFcIi4VNL/j/4yq4Odj0dVUZlBhEl58jvV8Aed4ikL4QQlt4IWI6DBH3rJH5/+dm2xisjnu
	QcsonEgLi8WXRODbV6GZozt+uxB2RaaxOa3HqF0KDx5raJ1UNauBxWcNW3BwYD8TVvkIYrDW+KSPK
	XVHBfWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHsB-00000002hmJ-1VRV;
	Fri, 09 May 2025 07:10:19 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHmj-00000002goU-3dC9;
	Fri, 09 May 2025 07:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746774189;
	bh=8NysbQOJ86vuPoT7ltR1OuNDQoX9vHxyNbrDaqkbNVY=;
	h=From:To:Subject:Date:Message-Id;
	b=a78MwHIh4oMbU9C0DBsNVgQ8tqAxxbdfdxNJ2gPC6m02bxq6cDDTdhxd7VcaPBbgr
	 ddVz46Z/yRXCA8KaDRqT3U8loSppJdRPuD8/H2Eg0LvYHaywUH1N+Z+aHZkUy4bvUK
	 qZLpkuzO3ipw0buhZOvYmFyh+I1DuSIrzK83FkAI=
X-QQ-mid: zesmtpsz9t1746774188t8eb6ddc0
X-QQ-Originating-IP: New5mvh2wYiHvAxS/fOyolFMfTZgcP2lZ3Fej2D4xNc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 May 2025 15:03:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5872515443839041301
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
Date: Fri,  9 May 2025 15:02:47 +0800
Message-Id: <20250509070247.868-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250509070247.868-1-kernel@airkyi.com>
References: <20250509070247.868-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N5QhsOwzP0INXZD3NHcwIrtLqtAO/IFiPw6h+yKiSpYWLKnxdtf4Zfgt
	5tLHZmwpGt5YxIZsXdhzcA0M01LVyWMUSRRm+POz49Ob/lLwvPTRsnLioyW3Qjazt3Bmy1M
	9e5Mz9TGGbz1stlenZD81NpxrAjZAKGLzIPdEzx6N1zkT7PpEw0WdfqjYlOVINWe+E7+RhB
	ckGIwEuFOsCLfR2AbkSVmdOHA+kx2ZAO7ddEpGq/cJc5b2Jyu7IojD2nL1yV4v5G2g+s7M5
	UhjohOUOlehn9lOGAvOthGIY3iOmGBCXFjyPNae1JMaHjBi/TYiQDT37O+CcIU+y6xchqV+
	/SnzKfxN1zlsjXZQRI4X1ABZPetHpHOjzOUF6VpjeCZohf5zwResLf3SpQuXnlbtwiI2C3p
	bVi/UnoMg1PoRTANOGh/NbKQ4+2ZrvIhw2tMX7j7AoTY37k5arjHj0jlFbVaM4yJ6ACe2hS
	DTi2K4/nP3CjrNgiLLORggN0dtQROotR6MCBl4e/2OmRmPFXJCaBcx4coJRzGwT1/hG55TJ
	XvWkCQY8F485ZPAA0H8FivUsHueXpvUm7B4tbT/rnySc+iEWIkbSLqwU7Ai4wQxmt2pgTLu
	KVK74ANleRQHQ9jZOob36JtTjcjiN5w63y4G6ZGWUtf5aAdvpUqZ7F3t3U79/PFRIJ6xAjh
	zA916eK+mb9Ynb5L43QlaKUHBZqEtvDZDe2lCt9lHLWWDmDhSihcwOtsyhADsn2iV0ZRizH
	R8n9Bko9ddXcshfGdauPMwujhHYmVHKHUQAgtvu3cezUAkfhhKLNjOR3UrTfggyQ0y7QTr5
	Lz7M0xWmYl1PoFykPpF5Nsgvbj9kRUXAwu3qnOSjBx+98obC6vNXFYcfdmDdX+O3xh2ntJq
	V2eE7wp7Veb5DgRNv1I856ySPX2629Bj5tioGj7rn5CH5jSXxkjc0Mi5Q5nq/vnzSlrQBmR
	mvTo5Yer5er2LAKKuBoz7jUv6ERUzDOnrXFQPft0CXkg2Wj2X5w/cT0fsWhxF00PaPjI=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_000442_213361_59EE0B65 
X-CRM114-Status: GOOD (  19.16  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Convert cdn-dp-rockchip.txt to yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style


 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 158 ++++++++++++++++++
 2 files changed, 158 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
deleted file mode 100644
index 8df7d2e393d6..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Rockchip RK3399 specific extensions to the cdn Display Port
-================================
-
-Required properties:
-- compatible: must be "rockchip,rk3399-cdn-dp"
-
-- reg: physical base address of the controller and length
-
-- clocks: from common clock binding: handle to dp clock.
-
-- clock-names: from common clock binding:
-	       Required elements: "core-clk" "pclk" "spdif" "grf"
-
-- resets : a list of phandle + reset specifier pairs
-- reset-names : string of reset names
-		Required elements: "apb", "core", "dptx", "spdif"
-- power-domains : power-domain property defined with a phandle
-		  to respective power domain.
-- assigned-clocks: main clock, should be <&cru SCLK_DP_CORE>
-- assigned-clock-rates : the DP core clk frequency, shall be: 100000000
-
-- rockchip,grf: this soc should set GRF regs, so need get grf here.
-
-- ports: contain a port nodes with endpoint definitions as defined in
-	 Documentation/devicetree/bindings/media/video-interfaces.txt.
-	 contained 2 endpoints, connecting to the output of vop.
-
-- phys: from general PHY binding: the phandle for the PHY device.
-
-- extcon: extcon specifier for the Power Delivery
-
-- #sound-dai-cells = it must be 1 if your system is using 2 DAIs: I2S, SPDIF
-
--------------------------------------------------------------------------------
-
-Example:
-	cdn_dp: dp@fec00000 {
-		compatible = "rockchip,rk3399-cdn-dp";
-		reg = <0x0 0xfec00000 0x0 0x100000>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
-			 <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
-		clock-names = "core-clk", "pclk", "spdif", "grf";
-		assigned-clocks = <&cru SCLK_DP_CORE>;
-		assigned-clock-rates = <100000000>;
-		power-domains = <&power RK3399_PD_HDCP>;
-		phys = <&tcphy0_dp>, <&tcphy1_dp>;
-		resets = <&cru SRST_DPTX_SPDIF_REC>;
-		reset-names = "spdif";
-		extcon = <&fusb0>, <&fusb1>;
-		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		#sound-dai-cells = <1>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			dp_in: port {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				dp_in_vopb: endpoint@0 {
-					reg = <0>;
-					remote-endpoint = <&vopb_out_dp>;
-				};
-
-				dp_in_vopl: endpoint@1 {
-					reg = <1>;
-					remote-endpoint = <&vopl_out_dp>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
new file mode 100644
index 000000000000..99d1f0ad9cda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,cdn-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3399 specific extensions to the CDN Display Port
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chip.com>
+  - Heiko Stuebner <heiko@sntech.de>
+  - Sandy Huang <hjc@rock-chips.com>
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3399-cdn-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DP core work clock
+      - description: APB clock
+      - description: SPDIF interface clock
+      - description: GRF clock
+
+  clock-names:
+    items:
+      - const: core-clk
+      - const: pclk
+      - const: spdif
+      - const: grf
+
+  extcon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle to the extcon device providing the cable state for the DP PHY.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle to the PHY device for DP output.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input of the CDN DP
+        properties:
+          endpoint@0:
+            description: Connection to the VOPB
+          endpoint@1:
+            description: Connection to the VOPL
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output of the CDN DP
+
+    required:
+      - port@0
+      - port@1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: spdif
+      - const: dptx
+      - const: apb
+      - const: core
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF register to control HPD.
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - ports
+  - resets
+  - reset-names
+  - rockchip,grf
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dp@fec00000 {
+            compatible = "rockchip,rk3399-cdn-dp";
+            reg = <0x0 0xfec00000 0x0 0x100000>;
+            assigned-clocks = <&cru SCLK_DP_CORE>;
+            assigned-clock-rates = <100000000>;
+            interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>, <&cru SCLK_SPDIF_REC_DPTX>,
+                    <&cru PCLK_VIO_GRF>;
+            clock-names = "core-clk", "pclk", "spdif", "grf";
+            power-domains = <&power RK3399_PD_HDCP>;
+            phys = <&tcphy0_dp>, <&tcphy1_dp>;
+            resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
+                    <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
+            reset-names = "spdif", "dptx", "apb", "core";
+            rockchip,grf = <&grf>;
+            #sound-dai-cells = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dp_in: port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    dp_in_vopb: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&vopb_out_dp>;
+                    };
+
+                    dp_in_vopl: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&vopl_out_dp>;
+                    };
+                };
+
+                dp_out: port@1 {
+                    reg = <1>;
+                };
+            };
+        };
+    };
--
2.49.0


