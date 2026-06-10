Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3541ECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 01:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdLsxvuEN5IfmMNTHZthK5ecX7GyIHEvq0qnpydYfMI=; b=kU1E22b0Myhrg4EoEfzw9azopN
	8z59hjRI+sv2+PrjTCzsc1/mGvXD9wVIzpx2i8ewU3hCZmLgzvceDYlhxpNLUfM+kCimIgvycgE26
	6h1kqwWjjCdnXpPFSoF8MJTQEfF3G4fYg0pZpb9f8MD73AC4gYj4vzeGG9hVAjlvhWUoxf3+yC8tB
	k7fLxXKO9BbiDb1objUq2MQQmj08/5WoPgUUX/Kui/c+EbMOyUq9pQrvNnKuJPGeBEzveB021oZQO
	EP2rNeSTWiZZLoAXeHdZ1s3YR2C0s67dkCbA+ByWR1gmM+cWTJYyWBi6DF9xos/Bzo8WZwTcxoc4q
	iT++6b7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7l6-00000006dNn-1Wfq;
	Wed, 10 Jun 2026 01:29:32 +0000
Received: from azure-sdnproxy.icoremail.net ([13.76.78.106])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7l3-00000006dMc-0ykv;
	Wed, 10 Jun 2026 01:29:30 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app1 (Coremail) with SMTP id TAJkCgCHKXPlvShq75MlAA--.2691S2;
	Wed, 10 Jun 2026 09:29:11 +0800 (CST)
From: lizhi2@eswincomputing.com
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
	rmk+kernel@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	horms@kernel.org,
	lee@kernel.org,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH net-next v8 2/6] dt-bindings: ethernet: eswin: add EIC7700 eth1 RX clock inversion variant
Date: Wed, 10 Jun 2026 09:29:07 +0800
Message-ID: <20260610012907.894-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260610012727.848-1-lizhi2@eswincomputing.com>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgCHKXPlvShq75MlAA--.2691S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF43Ww1DuF4rJrW3Gw1rJFb_yoWrGFykpF
	WDury8Gr18Xr4xAw4xJF10k3W3t397Wry3Kr4kAF1xXw1Dt3Z8XrW29a45Ca48Cr4DZFW3
	Wa45tF1Fya9Fy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRiWrW5UUUUU==
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_182929_442726_49EAF566 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

From: Zhi Li <lizhi2@eswincomputing.com>

The EIC7700 SoC integrates two GMAC instances. The eth1 MAC exhibits
different RX clock sampling characteristics due to silicon-inherent
timing behavior.

The eth1 MAC has a fixed, non-configurable RX clock-to-data skew at the
MAC input in the order of 4-5 ns. This cannot be compensated solely by
the standard MAC internal delay configuration and PHY delay, and RX clock
inversion is required at 1000Mbps for correct sampling.

The eth1 TX path also includes a fixed silicon-inherent delay of
approximately 2 ns. This delay is always present and cannot be disabled.
It is therefore part of the effective transmit timing observed on the
wire.

For the eth1 variant, the valid tx-internal-delay-ps values include
this fixed delay component. Consequently, the effective range becomes
2000-4540 ps (approximately 2000 ps fixed delay plus 0-2540 ps
programmable delay).

Introduce a dedicated compatible string
"eswin,eic7700-qos-eth-clk-inversion" to represent the eth1 variant,
allowing the driver to apply RX clock inversion only when required by
hardware variant selection.

This keeps SoC-level differentiation without exposing silicon-fixed skew
as configurable device tree parameters.

Add per-compatible tx-internal-delay-ps constraints using a oneOf
schema partition:
- eswin,eic7700-qos-eth: 0-2540 ps
- eswin,eic7700-qos-eth-clk-inversion: 2000-4540 ps

No functional change for existing "eswin,eic7700-qos-eth" users.

Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 55 +++++++++++++++++--
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 4e02fedae5c6..8cb7545c56e8 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -20,16 +20,38 @@ select:
       contains:
         enum:
           - eswin,eic7700-qos-eth
+          - eswin,eic7700-qos-eth-clk-inversion
   required:
     - compatible
 
 allOf:
   - $ref: snps,dwmac.yaml#
 
+oneOf:
+  - properties:
+      compatible:
+        contains:
+          const: eswin,eic7700-qos-eth
+      tx-internal-delay-ps:
+        minimum: 0
+        maximum: 2540
+        multipleOf: 20
+
+  - properties:
+      compatible:
+        contains:
+          const: eswin,eic7700-qos-eth-clk-inversion
+      tx-internal-delay-ps:
+        minimum: 2000
+        maximum: 4540
+        multipleOf: 20
+
 properties:
   compatible:
     items:
-      - const: eswin,eic7700-qos-eth
+      - enum:
+          - eswin,eic7700-qos-eth
+          - eswin,eic7700-qos-eth-clk-inversion
       - const: snps,dwmac-5.20
 
   reg:
@@ -67,11 +89,6 @@ properties:
     maximum: 2540
     multipleOf: 20
 
-  tx-internal-delay-ps:
-    minimum: 0
-    maximum: 2540
-    multipleOf: 20
-
   eswin,hsp-sp-csr:
     description:
       HSP CSR is to control and get status of different high-speed peripherals
@@ -140,3 +157,29 @@ examples:
             snps,wr_osr_lmt = <2>;
         };
     };
+
+    ethernet@50410000 {
+        compatible = "eswin,eic7700-qos-eth-clk-inversion", "snps,dwmac-5.20";
+        reg = <0x50410000 0x10000>;
+        interrupt-parent = <&plic>;
+        interrupts = <70>;
+        interrupt-names = "macirq";
+        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
+                <&d0_clock 194>;
+        clock-names = "axi", "cfg", "stmmaceth", "tx";
+        resets = <&reset 94>;
+        reset-names = "stmmaceth";
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x200 0x208 0x218 0x214 0x21c>;
+        phy-handle = <&gmac1_phy0>;
+        phy-mode = "rgmii-id";
+        snps,aal;
+        snps,fixed-burst;
+        snps,tso;
+        snps,axi-config = <&stmmac_axi_setup_gmac1>;
+
+        stmmac_axi_setup_gmac1: stmmac-axi-config {
+            snps,blen = <0 0 0 0 16 8 4>;
+            snps,rd_osr_lmt = <2>;
+            snps,wr_osr_lmt = <2>;
+        };
+    };
-- 
2.25.1


