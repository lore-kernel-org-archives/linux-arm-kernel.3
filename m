Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C381C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqwaa2XptwhOeo2I7aJqylxWaH/oGYOtr5CsM3q+n+w=; b=vkDYImcw+Oq5+CgAZGTpqSjhSr
	fP5+8AAQ5yRm2Qxe/FThKQF7G73JWnW0b14REjnrS1sziWp616JqnzqhGpMi29DGLyuOfRGycByD3
	T13LRQi5otVDVIR1yZgLfD1Gqk8Y3HTxcnMRWZnmTs5qVcyY2XH7hMERIkTS7tGRPflzOyJTNqnR4
	DDHiRcjnJvwKr3j6kI/INFXsbldtDe9f35jwSigtSAneoXKluS3WFdZaR8th9KxRFocSFWUwd5j0B
	1CTEGA7pKrIcs+G0p5fQx++JNvrNIQsrw57DwtOJWGHuhKnE5iFYsfCvis6UDDrt/QBCmwqyHiMZu
	TV0cc/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxFM-00000006ebc-05No;
	Tue, 10 Jun 2025 11:34:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwgz-00000006atQ-0HNj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 10:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nqwaa2XptwhOeo2I7aJqylxWaH/oGYOtr5CsM3q+n+w=; b=ebfYwGnpVoscACPAgvEqo1VE10
	RLKWj/tzWb7bm/3HdEo+oX0ezE8ewtFxufxNov+ciSTyXvgyoi8gsd5K58HOo8vRsT+rHeMKoxHUT
	gw1U6rCFZf0YoA+B9qRLbr1zkWNvTFrvHkeyOnoQ71Sq9hLCNLC8WoEz6mT8KJVwMCFgGVFoXgq+3
	q7WWLIYkGa+t9aaXO+IrafKXX8xFqeCG36SNJYZvqgwOzmMwzcfN/ITrkYVjP1pSVMzJMi7nPxH31
	ZXnkjmrQ1h76FdxAMRzt6QOlEPyPycM2mCwyM6L+f0HTATm7UCEbXi3ZLlwSLfKY/jgsI7FK2DThD
	a+mH4Dzg==;
Received: from server.couthit.com ([162.240.164.96])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwgw-00000001lJ5-39Ai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nqwaa2XptwhOeo2I7aJqylxWaH/oGYOtr5CsM3q+n+w=; b=TzaUF308Qs8ohQNljOPapIUhTV
	PBSHgk2GuKQpodTxBoffnu7e9AwFbLctd9WWe4wmK3m3MAe1V4uYh6phyXV36jUW96J9QMHOiOZ4I
	rtM5J3+3/Rb3xYqLUI8YYttfxlrWBkfF45expKI1/8S3eg24tLZbydLhjqipljKLfpMBaC2c+A3y+
	Rv5zVJhBYfwcrmryLwnlTkAVLbwGWZgEVeEe99j7pp/LCki6pPRF6NK52VP92Zlxt3HhGzAmNrbwR
	GRpGBlJ9N94n6+BFIsqCXGc30L5AzFr0dYOQLjRzF0sLvPATTc4o9XGu1ozthHQIhbozPcUbgUTXa
	xwfi5GXg==;
Received: from [122.175.9.182] (port=7158 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uOwg8-0000000ATJF-0iHO;
	Tue, 10 Jun 2025 06:58:04 -0400
From: Parvathi Pudi <parvathi@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ssantosh@kernel.org,
	richardcochran@gmail.com,
	s.hauer@pengutronix.de,
	m-karicheri2@ti.com,
	glaroque@baylibre.com,
	afd@ti.com,
	saikrishnag@marvell.com,
	m-malladi@ti.com,
	jacob.e.keller@intel.com,
	diogo.ivo@siemens.com,
	javier.carrasco.cruz@gmail.com,
	horms@kernel.org,
	s-anna@ti.com,
	basharath@couthit.com,
	parvathi@couthit.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next v8 01/11] dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for AM57xx, AM43xx and AM33xx SOCs
Date: Tue, 10 Jun 2025 16:27:11 +0530
Message-Id: <20250610105721.3063503-2-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610105721.3063503-1-parvathi@couthit.com>
References: <20250610105721.3063503-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_115854_985688_AF7F05F5 
X-CRM114-Status: GOOD (  11.91  )
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

Documentation update for the newly added "pruss2_eth" device tree
node and its dependencies along with compatibility for PRU-ICSS
Industrial Ethernet Peripheral (IEP), PRU-ICSS Enhanced Capture
(eCAP) peripheral and using YAML binding document for AM57xx SoCs.

Co-developed-by: Basharath Hussain Khaja <basharath@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/ti,icss-iep.yaml  |  10 +-
 .../bindings/net/ti,icssm-prueth.yaml         | 233 ++++++++++++++++++
 .../bindings/net/ti,pruss-ecap.yaml           |  32 +++
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   9 +
 4 files changed, 281 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
 create mode 100644 Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml

diff --git a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
index e36e3a622904..ea2659d90a52 100644
--- a/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
+++ b/Documentation/devicetree/bindings/net/ti,icss-iep.yaml
@@ -8,6 +8,8 @@ title: Texas Instruments ICSS Industrial Ethernet Peripheral (IEP) module
 
 maintainers:
   - Md Danish Anwar <danishanwar@ti.com>
+  - Parvathi Pudi <parvathi@couthit.com>
+  - Basharath Hussain Khaja <basharath@couthit.com>
 
 properties:
   compatible:
@@ -17,9 +19,11 @@ properties:
               - ti,am642-icss-iep
               - ti,j721e-icss-iep
           - const: ti,am654-icss-iep
-
-      - const: ti,am654-icss-iep
-
+      - enum:
+          - ti,am654-icss-iep
+          - ti,am5728-icss-iep
+          - ti,am4376-icss-iep
+          - ti,am3356-icss-iep
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
new file mode 100644
index 000000000000..a98ad45ca66f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,icssm-prueth.yaml
@@ -0,0 +1,233 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,icssm-prueth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments ICSSM PRUSS Ethernet
+
+maintainers:
+  - Roger Quadros <rogerq@ti.com>
+  - Andrew F. Davis <afd@ti.com>
+  - Parvathi Pudi <parvathi@couthit.com>
+  - Basharath Hussain Khaja <basharath@couthit.com>
+
+description:
+  Ethernet based on the Programmable Real-Time Unit and Industrial
+  Communication Subsystem.
+
+properties:
+  compatible:
+    enum:
+      - ti,am57-prueth     # for AM57x SoC family
+      - ti,am4376-prueth   # for AM43x SoC family
+      - ti,am3359-prueth   # for AM33x SoC family
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to OCMC SRAM node
+
+  ti,mii-rt:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the MII_RT peripheral for ICSS
+
+  ti,iep:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to IEP (Industrial Ethernet Peripheral) for ICSS
+
+  ti,ecap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to Enhanced Capture (eCAP) event for ICSS
+
+  interrupts:
+    items:
+      - description: High priority Rx Interrupt specifier.
+      - description: Low priority Rx Interrupt specifier.
+
+  interrupt-names:
+    items:
+      - const: rx_hp
+      - const: rx_lp
+
+  ethernet-ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      ^ethernet-port@[0-1]$:
+        type: object
+        description: ICSSM PRUETH external ports
+        $ref: ethernet-controller.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            items:
+              - enum: [0, 1]
+            description: ICSSM PRUETH port number
+
+          interrupts:
+            maxItems: 3
+
+          interrupt-names:
+            items:
+              - const: rx
+              - const: emac_ptp_tx
+              - const: hsr_ptp_tx
+
+        required:
+          - reg
+
+    anyOf:
+      - required:
+          - ethernet-port@0
+      - required:
+          - ethernet-port@1
+
+required:
+  - compatible
+  - sram
+  - ti,mii-rt
+  - ti,iep
+  - ti,ecap
+  - ethernet-ports
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: /schemas/remoteproc/ti,pru-consumer.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* Dual-MAC Ethernet application node on PRU-ICSS2 */
+    pruss2_eth: pruss2-eth {
+      compatible = "ti,am57-prueth";
+      ti,prus = <&pru2_0>, <&pru2_1>;
+      sram = <&ocmcram1>;
+      ti,mii-rt = <&pruss2_mii_rt>;
+      ti,iep = <&pruss2_iep>;
+      ti,ecap = <&pruss2_ecap>;
+      interrupts = <20 2 2>, <21 3 3>;
+      interrupt-names = "rx_hp", "rx_lp";
+      interrupt-parent = <&pruss2_intc>;
+
+      ethernet-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pruss2_emac0: ethernet-port@0 {
+          reg = <0>;
+          phy-handle = <&pruss2_eth0_phy>;
+          phy-mode = "mii";
+          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+
+        pruss2_emac1: ethernet-port@1 {
+          reg = <1>;
+          phy-handle = <&pruss2_eth1_phy>;
+          phy-mode = "mii";
+          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
+          interrupt-names = "rx", "emac_ptp_tx", "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+      };
+    };
+  - |
+    /* Dual-MAC Ethernet application node on PRU-ICSS1 */
+    pruss1_eth: pruss1-eth {
+      compatible = "ti,am4376-prueth";
+      ti,prus = <&pru1_0>, <&pru1_1>;
+      sram = <&ocmcram>;
+      ti,mii-rt = <&pruss1_mii_rt>;
+      ti,iep = <&pruss1_iep>;
+      ti,ecap = <&pruss1_ecap>;
+      interrupts = <20 2 2>, <21 3 3>;
+      interrupt-names = "rx_hp", "rx_lp";
+      interrupt-parent = <&pruss1_intc>;
+
+      pinctrl-0 = <&pruss1_eth_default>;
+      pinctrl-names = "default";
+
+      ethernet-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pruss1_emac0: ethernet-port@0 {
+          reg = <0>;
+          phy-handle = <&pruss1_eth0_phy>;
+          phy-mode = "mii";
+          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+          interrupt-names = "rx", "emac_ptp_tx",
+                                          "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+
+        pruss1_emac1: ethernet-port@1 {
+          reg = <1>;
+          phy-handle = <&pruss1_eth1_phy>;
+          phy-mode = "mii";
+          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
+          interrupt-names = "rx", "emac_ptp_tx",
+                                          "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+      };
+    };
+  - |
+    /* Dual-MAC Ethernet application node on PRU-ICSS */
+    pruss_eth: pruss-eth {
+      compatible = "ti,am3359-prueth";
+      ti,prus = <&pru0>, <&pru1>;
+      sram = <&ocmcram>;
+      ti,mii-rt = <&pruss_mii_rt>;
+      ti,iep = <&pruss_iep>;
+      ti,ecap = <&pruss_ecap>;
+      interrupts = <20 2 2>, <21 3 3>;
+      interrupt-names = "rx_hp", "rx_lp";
+      interrupt-parent = <&pruss_intc>;
+
+      pinctrl-0 = <&pruss_eth_default>;
+      pinctrl-names = "default";
+
+      ethernet-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pruss_emac0: ethernet-port@0 {
+          reg = <0>;
+          phy-handle = <&pruss_eth0_phy>;
+          phy-mode = "mii";
+          interrupts = <20 2 2>, <26 6 6>, <23 6 6>;
+          interrupt-names = "rx", "emac_ptp_tx",
+                                          "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+
+        pruss_emac1: ethernet-port@1 {
+          reg = <1>;
+          phy-handle = <&pruss_eth1_phy>;
+          phy-mode = "mii";
+          interrupts = <21 3 3>, <27 9 7>, <24 9 7>;
+          interrupt-names = "rx", "emac_ptp_tx",
+                                          "hsr_ptp_tx";
+          /* Filled in by bootloader */
+          local-mac-address = [00 00 00 00 00 00];
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
new file mode 100644
index 000000000000..42f217099b2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,pruss-ecap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PRU-ICSS Enhanced Capture (eCAP) event module
+
+maintainers:
+  - Murali Karicheri <m-karicheri2@ti.com>
+  - Parvathi Pudi <parvathi@couthit.com>
+  - Basharath Hussain Khaja <basharath@couthit.com>
+
+properties:
+  compatible:
+    const: ti,pruss-ecap
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pruss2_ecap: ecap@30000 {
+        compatible = "ti,pruss-ecap";
+        reg = <0x30000 0x60>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 927b3200e29e..b5336bcbfb01 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -251,6 +251,15 @@ patternProperties:
 
     type: object
 
+  ecap@[a-f0-9]+$:
+    description:
+      PRU-ICSS has a Enhanced Capture (eCAP) event module which can generate
+      and capture periodic timer based events which will be used for features
+      like RX Pacing to rise interrupt when the timer event has occurred.
+      Each PRU-ICSS instance has one eCAP module irrespective of SOCs.
+    $ref: /schemas/net/ti,pruss-ecap.yaml#
+    type: object
+
   mii-rt@[a-f0-9]+$:
     description: |
       Real-Time Ethernet to support multiple industrial communication protocols.
-- 
2.34.1


