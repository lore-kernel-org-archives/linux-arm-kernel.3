Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BA7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qDMGvwqOKF26JszbDrGaiZp0PfNzMy8pt7RjXzvFy8=; b=2bEoyCaA4KDRV+K4SPkNRZwDoK
	ATFL6HujtNGNIqInDcLDlIyEqpkE90PQfTRmVUL3SIVTjZMgd3ojE+YyN8H9tUAyVQaKWWd+hz524
	3VrJzkkivnwwMODw0pFU4CjaQlTft82uCTEXFkh4NkqDoAMjTt+Lf7xxF/cA4l/6aIhAY07lMPIUH
	OUXRQlcPHZ/e1TWlViWLyFb7dg3btEmUnsPZpTrfXc8zjpe5PEI1yUFmK2wGCju5/INDnjU6Ky10U
	fhEQwZ32cqjtcSAQ8zWKYhuYMEhgwCOBjkOepYP41gQo3/IwiAhSB7uQnFC1s5TlafnaiIngGA99N
	oSuCF9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEeRp-0000000B3oY-00oV;
	Tue, 13 May 2025 01:28:45 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEeKf-0000000B379-1c7g;
	Tue, 13 May 2025 01:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747099222;
	bh=2qDMGvwqOKF26JszbDrGaiZp0PfNzMy8pt7RjXzvFy8=;
	h=From:To:Subject:Date:Message-Id;
	b=KWo3MpZynaWTM6r6Gk6nJgIgR71njuUnM3R5OPlqeHnxsfDRDV8blbhz0yjj6MKAW
	 DHqjI9iPmS0yXqDji5KEopdoc6Qv/asiVaz5wJ5PcLD9bd0mJmIvXsPVCWskeR9U/f
	 R8Hwq5LtjNjOOVYmlNagcXWvZh0ASzwFIqrblaDM=
X-QQ-mid: zesmtpgz8t1747099219t219559e6
X-QQ-Originating-IP: dyFx1sjN77jqkaicYdfiYEH7SEpZk75pP/V9gvuz6J8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 09:20:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1201715425475302784
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
Subject: [PATCH v3 2/2] dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
Date: Tue, 13 May 2025 09:19:04 +0800
Message-Id: <20250513011904.102-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513011904.102-1-kernel@airkyi.com>
References: <20250513011904.102-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MvW0gkkpO9Je9yv/aTNaCkxj6zjU+S5JjcuNa7z5pUxv97VxChjj+VF/
	pR/yp7CpiYbGFgTZ7Tyv0rdisLrgwxN8Q5C57+MgNzCNVANGT/QCM2iSneRO//NrPz/VZ/n
	5sHSCljBDUXGcinDSZC8x/6SIVeQjFlnkvP5zTcs0JHq4TJTEd8LoUjXJClXQ3Qzqa8MDyi
	bxflTWST3QkFR+wQWa3I8C8CI9ngNoYhHEJte7DVlaMGPxg/Z3YBaNeUyUOpB72DIgj491M
	S7Cy+cbpkThuwEhRrXnbPPy7KDNQx65hSc61uhAczcF/b0yUzXZaH52a3Ny5+77OVmJHtIR
	5naZur474q7/dMzcUAjy4/dHx5/+rOEfDDcFqhznsoK6aeua/U4YokZ9jwUIUbQB1Dg+G4M
	v4AcQyBZgf6BDcwIuDccw5/3mDlHRhSbrWweaXcir354J+/vrI2VFmq2Vt29Y83K5GhFmAL
	vCmHHTtd+g8Tk43tdNu0gAoblnONlnv3QG6Ury370yHQnYVSDzl1mkqhRda/DzcDprW0syN
	FSFZDqPqcUobcAcBL8JQYoK0C6S+9o2h8t/nkCFiH2WWa1IKuBiZYM5aUE8bHDoUOmXrYZP
	uPkgPusv+kWzSHwci5Q8EcgxGVhEYt7VUDYvtRTxgI61m86TsINnQX+Nl/3qMbmCx9YJCua
	GESGqFIQzrE6Arfqzv4RFT4MW+t6THg7+brpjKmmbk4Vea/4xSp4E8vPZ7h19wsbb7wWl7H
	ClWW3V1r04kJVu5bjhBVqIznwfq5hExtdpUt1nA0C8rwJFQche1snsRXK3+zzDfWsIkPL+x
	W2vWqo6b5ffm5oJDXiuCuR1GIzH6jjBkhTIfGsGbFc8oi5u+Jakg4ETesWslEzonLnhPp4n
	Avv4FK3VGRHqaR8HvUnFqxUyxvbFtM80W3bEitz/IhMGkg9W2d9HwNGGKn3skA/+Jf8hHEg
	Jbz8X7bhHzuYCDf0BkXNU4Fv34x9dT9+ua6qX10B9rDUoiT2Dr2oql6d4Y1US5qFUcKk=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_182122_053095_612D5C31 
X-CRM114-Status: GOOD (  19.74  )
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

Changes in v3:
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style


 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 165 ++++++++++++++++++
 2 files changed, 165 insertions(+), 74 deletions(-)
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
index 000000000000..7c2225204de2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml#
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
+    items:
+      maxItems: 1
+    maxItems: 2
+    description:
+      List of phandle to the extcon device providing the cable state for the DP PHY.
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    items:
+      maxItems: 1
+    maxItems: 2
+    description: |
+      List of phandle to the PHY device for DP output.
+      RK3399 have two DP-TPYEC PHY, specifying one PHY which want to use,
+      or specify two PHYs here to let the driver determine which PHY to use.
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
+unevaluatedProperties: false
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


