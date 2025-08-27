Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34D6CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yz3fIBni6wt0XQF9wBivF6Q+JaUBNBPrgoRJw8G0JNQ=; b=UZpSFczpRs4XQJx82UqBiVZMp1
	R6SoXcL3db5xsSGK7CFsyBgPtUGB66Bo77pHHFnV3Gh1NcGGUIrgAvoucHe+fNaac7qwEe9RJ0Z+B
	2idqLHXn5Zv808HFVSiIuXt6lMvX2vfAvMA/X8N3HnSIjkdkWKnUv3ck6xyMYJRMw935L2MfjMJEf
	sk7HtBKXEyDokJMmARwp2DY6EgRvWOWOXLof6pxiOm4WmLYuzLa87CSy+cv/Mk5c7kW18IHdJO2b4
	kiPbHNKGVhpXI6xsP+Mh6n9f+H7vgOm/wB8fJnqjXFFXEiCEIsx+gXWC3a81dAZcgsTPdhyNazJzF
	Vz4LxLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBdP-0000000Egq0-3D6W;
	Wed, 27 Aug 2025 08:35:59 +0000
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBHd-0000000EcJt-3VdI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 08:13:31 +0000
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
	by app1 (Coremail) with SMTP id TAJkCgD3DQ8dvq5omjTEAA--.17642S2;
	Wed, 27 Aug 2025 16:13:19 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com,
	rmk+kernel@armlinux.org.uk,
	faizal.abdul.rahim@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	inochiama@gmail.com,
	jan.petrous@oss.nxp.com,
	jszhang@kernel.org,
	p.zabel@pengutronix.de,
	boon.khai.ng@altera.com,
	0x1207@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	lizhi2@eswincomputing.com,
	Shangjuan Wei <weishangjuan@eswincomputing.com>
Subject: [PATCH v4 1/2] dt-bindings: ethernet: eswin: Document for EIC7700 SoC
Date: Wed, 27 Aug 2025 16:13:14 +0800
Message-Id: <20250827081314.2295-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250827081135.2243-1-weishangjuan@eswincomputing.com>
References: <20250827081135.2243-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgD3DQ8dvq5omjTEAA--.17642S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw4fWw1kGFW3Wr48Cw15urg_yoWrWr1Upa
	ykC39xJr4Sqr1xXa17tF10kFn3tanxCr15Crn7t3W3J3s0ga90qw4ayFy5Ga47Cr47ZFy5
	uFWYqayxAw17C3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Wrv_ZF1lc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRbyCJUUUUU=
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_011330_336429_A93FA4BB 
X-CRM114-Status: GOOD (  12.37  )
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

From: Shangjuan Wei <weishangjuan@eswincomputing.com>

Add ESWIN EIC7700 Ethernet controller, supporting clock
configuration, delay adjustment and speed adaptive functions.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
new file mode 100644
index 000000000000..aa8bf2be9af7
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/eswin,eic7700-eth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Eswin EIC7700 SOC Eth Controller
+
+maintainers:
+  - Shuang Liang <liangshuang@eswincomputing.com>
+  - Zhi Li <lizhi2@eswincomputing.com>
+  - Shangjuan Wei <weishangjuan@eswincomputing.com>
+
+description:
+  The eth controller registers are part of the syscrg block on
+  the EIC7700 SoC.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - eswin,eic7700-qos-eth
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: eswin,eic7700-qos-eth
+      - const: snps,dwmac-5.20
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: Tx clock
+      - description: AXI clock
+      - description: Configuration clock
+
+  clock-names:
+    contains:
+      enum:
+        - axi
+        - cfg
+        - stmmaceth
+        - tx
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  rx-internal-delay-ps:
+    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+
+  tx-internal-delay-ps:
+    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+
+  eswin,hsp-sp-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - description: Phandle to HSP(High-Speed Peripheral) device
+      - description: Offset of phy control register for internal
+                     or external clock selection
+      - description: Offset of AXI clock controller Low-Power request
+                     register
+      - description: Offset of register controlling TX/RX clock delay
+    description: |
+      A phandle to hsp-sp-csr with three arguments that configure
+      HSP(High-Speed Peripheral) device. The argument one is the
+      offset of phy control register for internal or external clock
+      selection, the argument two is Offset of AXI clock controller
+      Low-Power request register, the argument three is Offset of
+      register controlling TX/RX clock delay.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phy-mode
+  - resets
+  - reset-names
+  - rx-internal-delay-ps
+  - tx-internal-delay-ps
+  - eswin,hsp-sp-csr
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet@50400000 {
+        compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
+        reg = <0x50400000 0x10000>;
+        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
+                <&d0_clock 193>;
+        clock-names = "axi", "cfg", "stmmaceth", "tx";
+        interrupt-parent = <&plic>;
+        interrupts = <61>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        phy-handle = <&phy0>;
+        resets = <&reset 95>;
+        reset-names = "stmmaceth";
+        rx-internal-delay-ps = <200>;
+        tx-internal-delay-ps = <200>;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,aal;
+        snps,fixed-burst;
+        snps,tso;
+        stmmac_axi_setup: stmmac-axi-config {
+            snps,blen = <0 0 0 0 16 8 4>;
+            snps,rd_osr_lmt = <2>;
+            snps,wr_osr_lmt = <2>;
+        };
+    };
--
2.17.1


