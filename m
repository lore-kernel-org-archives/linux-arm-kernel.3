Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F478C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S38gIegyImzSiPrPTJZbZJbHNkJdghgnHdGNsjdUcdY=; b=A046k0LOJe5U0kfjsdHLacWd9W
	SN6SrX+ala57h9DepAUo5vcNEy9QX/0qnHjL65rmXutxxTrCPKZW+gW/GTGSbYnkWfb7stEh2U0Rc
	9jkscA7kki8tscaoLfETFfphPV3qpOHX+xkB4+WAkJJ4rnI6LrXVyZ+fJW2NhsGBUDRo+MnKtK1sP
	3TqJ4/K8khZ3UGKgs0mgl57fGgwAjGbF6KwsQcwNe4uln2tB9jADyBT/EYqibyjvqu+adYg6G9qwo
	RC370CPcjWGGzJ75+iKRDe2biZxwEmrQw2Jk7pBBIPkNnANwGKLF8YmhDbqdtpRwSMXGfzde6Tx7N
	bO9f2g+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCv5Z-0000000HVov-1dZt;
	Thu, 08 May 2025 06:50:37 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuzi-0000000HV11-48vG;
	Thu, 08 May 2025 06:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746686617;
	bh=S38gIegyImzSiPrPTJZbZJbHNkJdghgnHdGNsjdUcdY=;
	h=From:To:Subject:Date:Message-Id;
	b=rtv0eiwfK1LPHBvmff55WiFcJbnq0IVuU/rjWq344Li7rowYTFB3MLYX3Y9zp0ZVB
	 Eu/p+95wevj3aIFUum90vwm1V9z6fYeb1GJb4ZmCiPww6DtlSZPhV2ncIrSkgOBbqd
	 HMrDzfREhVHisjoEPnTcVRrTnJ2XlSr35r/+ozPc=
X-QQ-mid: esmtpsz18t1746686615t934238f6
X-QQ-Originating-IP: 6QePaabhGr3rW48lbWk1i7+S8T1BOSY7MRS+ZtJxtzw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 May 2025 14:43:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16256494491489308250
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
Subject: [PATCH 2/2] dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
Date: Thu,  8 May 2025 14:43:04 +0800
Message-Id: <20250508064304.670-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250508064304.670-1-kernel@airkyi.com>
References: <20250508064304.670-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M58CI+QHpTskHy8BRZuj/93rat0UUiAIiEGmYtNjTT+nwVMvBMF4VEKZ
	9BPRxYaMy1uGB6dy8eusCmWtfgbFVUSd5lL20pRDKlCyl7KueU0nI1Et0QZ6VX0W6JSiIhH
	ggxvgiUwyWdByle7kNsoisuOQzuyQbHG0cIblKJm2LeJ3B8FAade8DElBCP286h6UMxKp7I
	mdKvWGoxqcb7rlpZfu6CW+tXXwyfjUYRP4nudJohhAM5yNWGDbYFIsNPUk5Ans7txy0d0A7
	ba8QeqQ4XWUGRs8MwWha/iqjgySpes7jRV4/dcN4awtYUJ+wesRGq7EvK34/FpVWKf6EZiu
	QebcQrz5Fl1rQ12Zj//1Y7nlFx4K93S2ONE3gKQfjmI9mWmcYoEnXLV8sPaJAXJWIEBW678
	q0fzdTB720hKGp6EnBpBF6r7S+FYu1fH9hoK8MacPlUCfc9f6zYWXsbcyo1WE73/sYEsJXC
	kYQycfdwz8orNy7FOHggp/AKdOo8UXhcy9NJx/O12/ZtuFNG7wz07w7HxIRIY9R1t5hnqrs
	75pACFBNo1d7X0CdBVDkeXHLL6yYIyOMA5/qhi/NKQvJ8tm5lHQDxGhZ7nizYRpAufCfhCp
	4d3JWCMchN3L2bRjlB8DPMh1k9dToi0P2tHLqWaRZ/hyvfvTODhmZNMgvf2u5Wv7TkEouJd
	TiZJYXjugP6UTAqQ8Yzx9eY6Xh232/yywRl051SQKEgha6hIpWt6Qe3SbxI8ZB7+o3NSloz
	pgUTqSQ/ln8QbJdcA7QfLLZDy+lJR4atn0fBMacBhEja65ivamM0GmxCG87uwonLp3pR4sv
	f0KHmNj87dKyoS1OiDOt3FvaEj+Pwo2348extJT/QUdSWBMCccqWL66YGc/LkfJGjzxyuqZ
	36XU4l2bVDSX1RfA98aNs70HZ5NTR7U89RH0XpJqK6+lpGyGy4yFrgrOljYxS/k1LJyGQaf
	C3IdSPBTwzdYOs0pOP9uVj01j+KPNACZFgnGwZzVXTi2HMG8D5mP4xgej
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_234435_632268_C74CAF58 
X-CRM114-Status: GOOD (  17.55  )
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

Tested with:

1. make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

2. make ARCH=arm64 dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../display/rockchip/cdn-dp-rockchip.txt      |  74 ---------
 .../display/rockchip/rockchip,cdn-dp.yaml     | 148 ++++++++++++++++++
 2 files changed, 148 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml

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
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
new file mode 100644
index 000000000000..ed68b48a6743
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,cdn-dp.yaml
@@ -0,0 +1,148 @@
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
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3399-cdn-dp
+
+  reg:
+    description:
+      CDN DP core register
+
+  assigned-clock-rates: true
+  assigned-clocks: true
+
+  clocks:
+    minItems: 4
+
+  clock-names:
+    items:
+      - const: core-clk
+      - const: pclk
+      - const: spdif
+      - const: grf
+
+  extcon:
+    description:
+      Phandle to the extcon device providing the cable state for the DP phy.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
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
+    minItems: 4
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
+      This SoC makes use of GRF regs.
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+    cdn_dp: dp@fec00000 {
+        compatible = "rockchip,rk3399-cdn-dp";
+        reg = <0x0 0xfec00000 0x0 0x100000>;
+        assigned-clocks = <&cru SCLK_DP_CORE>;
+        assigned-clock-rates = <100000000>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>, <&cru SCLK_SPDIF_REC_DPTX>,
+                <&cru PCLK_VIO_GRF>;
+        clock-names = "core-clk", "pclk", "spdif", "grf";
+        power-domains = <&power RK3399_PD_HDCP>;
+        phys = <&tcphy0_dp>, <&tcphy1_dp>;
+        resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
+                <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
+        reset-names = "spdif", "dptx", "apb", "core";
+        rockchip,grf = <&grf>;
+        #sound-dai-cells = <1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            dp_in: port@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                dp_in_vopb: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&vopb_out_dp>;
+                };
+
+                dp_in_vopl: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&vopl_out_dp>;
+                };
+            };
+
+            dp_out: port@1 {
+                reg = <1>;
+            };
+        };
+    };
--
2.49.0


