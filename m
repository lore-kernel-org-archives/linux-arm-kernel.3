Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69172C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 01:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nrDft/3Kdnzpyc+fSm2aBfdoXN3pLHf3cbl8JiVU+ZI=; b=eNmLh0A5ocko816jPwIw69p9oa
	4rTIyN7W5N0/J+WUiiq+5HY68u6wWc0RrOMmJ118WBku/x6Nx/0o5m6sWWMmVYIetImatB7KETVc6
	DFZmaBKxYR+4qqenaInux+It/7jdc7u1K1kqvNUoSmLe4dxErGcHjkE5umnSqXWZnlZney789v13s
	n8k+nMnBUGApK8jr2yu+RERblBK9ktgbd4+T95KqiSsi1uCcA06fJgOCSkzAv/80PvOdnhYg5DkQp
	G8LSWJHvLrr7geowH0hWSuz/PwfDpBEIDs3tqORh3wzxXh2YvQbl1G3jVUBfNgTRl/CBJ6Kht7q9s
	kaj46OPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UyD-000000045pf-2XED;
	Tue, 15 Apr 2025 01:20:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UwN-000000045dW-3N9P;
	Tue, 15 Apr 2025 01:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D8D044BBB;
	Tue, 15 Apr 2025 01:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACE3C4CEEB;
	Tue, 15 Apr 2025 01:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744679899;
	bh=aHjsyeBYm57m9m7wzMHZdilF8oPhvPfbMMJA6cAeYi4=;
	h=From:To:Cc:Subject:Date:From;
	b=XCo+Vf3YmtzwkJ2xaJ7W44/0bzpKvWjmtU5a7QfB4yjjvITuPTZhDOFk++CoVA9+8
	 9BGl05JeLH0J/5ErFRVKqZAi2HVZjcbRyLfY/Xarz/SdpsWJApP/H/u31Hy0RcuuPb
	 JZv6KT+gkzoMImFeaHVm3t3R7jJ7kzSptq2WVqDS+GwbgLLEWG8EQhoZBv+GY6Ijfh
	 fROgZNB7QVGuHVza9t0Ay0vR25IbURxh9uek7/JqfX9xH/xcKvSDWVLrcReKo6e1Iu
	 8WNwFNJcMdJ5uX6gchdcSWpoN4QhhCE87rC8gt/2PUsztYpQrslrCZa9iVat+db0Hy
	 7dioKtqOebWSA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY to schema
Date: Mon, 14 Apr 2025 20:18:13 -0500
Message-ID: <20250415011814.2319719-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_181819_887256_1079BC44 
X-CRM114-Status: GOOD (  16.29  )
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

Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
missing "power-domains" property and "port" and "orientation-switch"
properties in the child nodes.

Omit the previously deprecated properties as they aren't used anywhere.

Drop the 2nd example which was pretty much identical to the 1st example.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/phy-rockchip-typec.txt       |  84 -------------
 .../phy/rockchip,rk3399-typec-phy.yaml        | 116 ++++++++++++++++++
 2 files changed, 116 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
deleted file mode 100644
index 960da7fcaa9e..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-* ROCKCHIP type-c PHY
----------------------
-
-Required properties:
- - compatible : must be "rockchip,rk3399-typec-phy"
- - reg: Address and length of the usb phy control register set
- - rockchip,grf : phandle to the syscon managing the "general
-   register files"
- - clocks : phandle + clock specifier for the phy clocks
- - clock-names : string, clock name, must be "tcpdcore", "tcpdphy-ref";
- - assigned-clocks: main clock, should be <&cru SCLK_UPHY0_TCPDCORE> or
-		    <&cru SCLK_UPHY1_TCPDCORE>;
- - assigned-clock-rates : the phy core clk frequency, shall be: 50000000
- - resets : a list of phandle + reset specifier pairs
- - reset-names : string reset name, must be:
-		 "uphy", "uphy-pipe", "uphy-tcphy"
-
-Optional properties:
- - extcon : extcon specifier for the Power Delivery
-
-Required nodes : a sub-node is required for each port the phy provides.
-		 The sub-node name is used to identify dp or usb3 port,
-		 and shall be the following entries:
-	* "dp-port" : the name of DP port.
-	* "usb3-port" : the name of USB3 port.
-
-Required properties (port (child) node):
-- #phy-cells : must be 0, See ./phy-bindings.txt for details.
-
-Deprecated properties, do not use in new device tree sources, these
-properties are determined by the compatible value:
- - rockchip,typec-conn-dir
- - rockchip,usb3tousb2-en
- - rockchip,external-psm
- - rockchip,pipe-status
-
-Example:
-	tcphy0: phy@ff7c0000 {
-		compatible = "rockchip,rk3399-typec-phy";
-		reg = <0x0 0xff7c0000 0x0 0x40000>;
-		rockchip,grf = <&grf>;
-		extcon = <&fusb0>;
-		clocks = <&cru SCLK_UPHY0_TCPDCORE>,
-			 <&cru SCLK_UPHY0_TCPDPHY_REF>;
-		clock-names = "tcpdcore", "tcpdphy-ref";
-		assigned-clocks = <&cru SCLK_UPHY0_TCPDCORE>;
-		assigned-clock-rates = <50000000>;
-		resets = <&cru SRST_UPHY0>,
-			 <&cru SRST_UPHY0_PIPE_L00>,
-			 <&cru SRST_P_UPHY0_TCPHY>;
-		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
-
-		tcphy0_dp: dp-port {
-			#phy-cells = <0>;
-		};
-
-		tcphy0_usb3: usb3-port {
-			#phy-cells = <0>;
-		};
-	};
-
-	tcphy1: phy@ff800000 {
-		compatible = "rockchip,rk3399-typec-phy";
-		reg = <0x0 0xff800000 0x0 0x40000>;
-		rockchip,grf = <&grf>;
-		extcon = <&fusb1>;
-		clocks = <&cru SCLK_UPHY1_TCPDCORE>,
-			 <&cru SCLK_UPHY1_TCPDPHY_REF>;
-		clock-names = "tcpdcore", "tcpdphy-ref";
-		assigned-clocks = <&cru SCLK_UPHY1_TCPDCORE>;
-		assigned-clock-rates = <50000000>;
-		resets = <&cru SRST_UPHY1>,
-			 <&cru SRST_UPHY1_PIPE_L00>,
-			 <&cru SRST_P_UPHY1_TCPHY>;
-		reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
-
-		tcphy1_dp: dp-port {
-			#phy-cells = <0>;
-		};
-
-		tcphy1_usb3: usb3-port {
-			#phy-cells = <0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
new file mode 100644
index 000000000000..91c011f68cd0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,rk3399-typec-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Type-C PHY
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-typec-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: tcpdcore
+      - const: tcpdphy-ref
+
+  extcon: true
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: uphy
+      - const: uphy-pipe
+      - const: uphy-tcphy
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the "general register files" (GRF).
+
+  dp-port:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#phy-cells':
+        const: 0
+
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to USB Type-C connector
+
+    required:
+      - '#phy-cells'
+
+  usb3-port:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#phy-cells':
+        const: 0
+
+      orientation-switch: true
+
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to USB Type-C connector SS port
+
+    required:
+      - '#phy-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - dp-port
+  - usb3-port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+
+    phy@ff7c0000 {
+        compatible = "rockchip,rk3399-typec-phy";
+        reg = <0xff7c0000 0x40000>;
+        rockchip,grf = <&grf>;
+        extcon = <&fusb0>;
+        clocks = <&cru SCLK_UPHY0_TCPDCORE>,
+           <&cru SCLK_UPHY0_TCPDPHY_REF>;
+        clock-names = "tcpdcore", "tcpdphy-ref";
+        resets = <&cru SRST_UPHY0>,
+                 <&cru SRST_UPHY0_PIPE_L00>,
+                 <&cru SRST_P_UPHY0_TCPHY>;
+        reset-names = "uphy", "uphy-pipe", "uphy-tcphy";
+
+        dp-port {
+            #phy-cells = <0>;
+        };
+
+        usb3-port {
+            #phy-cells = <0>;
+        };
+    };
+
+...
-- 
2.47.2


