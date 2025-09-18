Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE5DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocbHSNjuNykQZVLFeZoQD3hO4wR0e+fH0OoN0Af2kgE=; b=oi1Yef08v85VHJWfujuUobx0Fh
	03bki2UWR3IbxddmqQ5jiD999mCLa44frohIvcSThLyVOaEJxPwzeNqRdHh6AAh0jfAZe8xlME5e5
	MDC2wmPjuo3LDJiRdKyVE7BC5Pxe9Cgod1KTVJA5U3KGtPISHNC37NDcWZNkA2UaZEmElRWiW277c
	EKYdWemZjvT7hg+xv2DO2rnaqGa7GwW6oXEnG/YfM+pw9wAsdCRT2yAfyOrqgR1QB3XpfGONtqN6i
	Ys3xWBBSwv2YrxoGkzG6Le/Yvx9uuDgSxnibirzpyh0Wi5SUM60ergI7AWMmyetsFrHZQZMJ+VDm/
	wbNGL9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAUN-0000000GmqD-0H8d;
	Thu, 18 Sep 2025 08:59:39 +0000
Received: from azure-sdnproxy.icoremail.net ([52.229.205.26])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAUK-0000000Gmpq-0nK8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:59:37 +0000
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
	by app1 (Coremail) with SMTP id TAJkCgBHXg_ayctoHpTUAA--.4697S2;
	Thu, 18 Sep 2025 16:59:10 +0800 (CST)
From: weishangjuan@eswincomputing.com
To: devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	vladimir.oltean@nxp.com,
	rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com,
	anthony.l.nguyen@intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jan.petrous@oss.nxp.com,
	jszhang@kernel.org,
	inochiama@gmail.com,
	0x1207@gmail.com,
	boon.khai.ng@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	lizhi2@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: ethernet: eswin: Document for EIC7700 SoC
Date: Thu, 18 Sep 2025 16:59:03 +0800
Message-Id: <20250918085903.3228-1-weishangjuan@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgBHXg_ayctoHpTUAA--.4697S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1DtF1kCFyrZFyrZFyfXrb_yoWrGw15pa
	97CrWDJr4fXr13Xa1UtF10kFn3ta1DCF1Ykrn7J3Waq390qas0q3WayFy5Ga43Cr47ZFW5
	WFWYvay8A3Wjk3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26rWY6Fy7MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRJ8nYUUUUU
X-CM-SenderInfo: pzhl2xxdqjy31dq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_015936_388395_27C3E61E 
X-CRM114-Status: GOOD (  10.95  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
new file mode 100644
index 000000000000..57d6d0efc126
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -0,0 +1,127 @@
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
+  Platform glue layer implementation for STMMAC Ethernet driver.
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
+      - description: AXI clock
+      - description: Configuration clock
+      - description: GMAC main clock
+      - description: Tx clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: cfg
+      - const: stmmaceth
+      - const: tx
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
+      High-Speed Peripheral device needed to configure clock selection,
+      clock low-power mode and clock delay.
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
\ No newline at end of file
--
2.17.1


