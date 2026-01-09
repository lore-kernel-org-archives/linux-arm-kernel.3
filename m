Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904B0D232EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OpS/9xx9/H+raZvMl0mjAPbSoqVN5wAKx9K7yLc7NM=; b=R1eCgm8usM4acUkzsk8FBS3Ovc
	5PysAkUw2x7NXcRAqtXM/EUDwbNhO3uI88SF6+tzGx2oZ0K+9rKEAF0pufAoIbQBLMqIO7t3wMGxs
	ci1IIovTjHJoqnT+Vdxb/BnUrxMlWWuT6flEL23oPND7kOQzKHCHtvF69zADQEr87bP9hCmy7PQUA
	gHeIpKtLrjLcICJylM2pReJZxkuu9IOTSc+82r5lgHHlHmLbLm2+IQGPUZh3UwaPClKhNjrhtLE7S
	lNLItGncl4RyfXOenmiGT0rF3wWkRLnLIeHtxfIFFERhJrLox+T2a71MUhyQeNFEwn2S1MnoN2AyH
	gUL+0Qhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7Yb-00000001qIE-0Nf5;
	Fri, 09 Jan 2026 08:09:17 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7YY-00000001qHI-1Zf3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:09:16 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app2 (Coremail) with SMTP id TQJkCgCHyaydt2Bpf2ySAA--.23335S2;
	Fri, 09 Jan 2026 16:09:02 +0800 (CST)
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
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling control
Date: Fri,  9 Jan 2026 16:08:59 +0800
Message-ID: <20260109080859.1285-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260109080601.1262-1-lizhi2@eswincomputing.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TQJkCgCHyaydt2Bpf2ySAA--.23335S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw1xWw1fZry8ZF1rZF4UCFg_yoWruFyxpF
	W5C3y7JrsYqr1fZa17tw10kF9xGa93CF13Grn3t3WfXa1qvFZ0qr1aya45J3WUCr4xZFy5
	uFWYkay8CF1jk3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRuHqcUUUUU=
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_000914_589956_296B69FB 
X-CRM114-Status: GOOD (  13.29  )
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

The second Ethernet controller (eth1) on the EIC7700 SoC may experience
RX data sampling issues at high speed due to EIC7700-specific receive
clock to data skew at the MAC input.

Add vendor-specific device tree properties to describe optional receive
and transmit clock inversion controls used to compensate for the EIC7700
Ethernet MAC, which may be required to ensure correct RX sampling at
high speed.

This binding also updates the enum values of the rx-internal-delay-ps
and tx-internal-delay-ps properties to reflect the actual delay step
resolution implemented by the EIC7700 hardware. The hardware applies
delay in 20 ps increments, while the previous enum values were based on
an incorrect mapping. This change corrects the DT-to-hardware mapping
without changing the meaning of the delay properties.

In addition, the binding also describes the relevant HSP CSR registers
accessed by the MAC. The TXD and RXD delay control registers are included
so the driver can explicitly clear any residual configuration left by
the bootloader, ensuring the hardware is initialized into a known and
deterministic state.

Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../bindings/net/eswin,eic7700-eth.yaml       | 57 +++++++++++++++++--
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b..c948f62e97e9 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -63,10 +63,25 @@ properties:
       - const: stmmaceth
 
   rx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
 
   tx-internal-delay-ps:
-    enum: [0, 200, 600, 1200, 1600, 1800, 2000, 2200, 2400]
+    enum: [0, 20, 60, 100, 200, 400, 800, 1600, 2400]
+
+  eswin,rx-clk-invert:
+    description:
+      Invert the receive clock sampling polarity at the MAC input.
+      This property may be used to compensate for SoC-specific
+      receive clock to data skew and help ensure correct RX data
+      sampling at high speed.
+    type: boolean
+
+  eswin,tx-clk-invert:
+    description:
+      Invert the transmit clock polarity driven by the MAC.
+      This property provides SoC-specific transmit clock control
+      when required by the platform.
+    type: boolean
 
   eswin,hsp-sp-csr:
     description:
@@ -81,7 +96,9 @@ properties:
                          or external clock selection
           - description: Offset of AXI clock controller Low-Power request
                          register
+          - description: Offset of register controlling TXD delay
           - description: Offset of register controlling TX/RX clock delay
+          - description: Offset of register controlling RXD delay
 
 required:
   - compatible
@@ -111,17 +128,45 @@ examples:
         interrupts = <61>;
         interrupt-names = "macirq";
         phy-mode = "rgmii-id";
-        phy-handle = <&phy0>;
+        phy-handle = <&gmac0_phy0>;
         resets = <&reset 95>;
         reset-names = "stmmaceth";
+        rx-internal-delay-ps = <20>;
+        tx-internal-delay-ps = <100>;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x114 0x118 0x11c>;
+        snps,axi-config = <&stmmac_axi_setup_gmac0>;
+        snps,aal;
+        snps,fixed-burst;
+        snps,tso;
+        stmmac_axi_setup_gmac0: stmmac-axi-config {
+            snps,blen = <0 0 0 0 16 8 4>;
+            snps,rd_osr_lmt = <2>;
+            snps,wr_osr_lmt = <2>;
+        };
+    };
+
+    ethernet@50410000 {
+        compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
+        reg = <0x50410000 0x10000>;
+        clocks = <&d0_clock 186>, <&d0_clock 171>, <&d0_clock 40>,
+                <&d0_clock 194>;
+        clock-names = "axi", "cfg", "stmmaceth", "tx";
+        interrupt-parent = <&plic>;
+        interrupts = <70>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-rxid";
+        phy-handle = <&gmac1_phy0>;
+        resets = <&reset 94>;
+        reset-names = "stmmaceth";
         rx-internal-delay-ps = <200>;
         tx-internal-delay-ps = <200>;
-        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
-        snps,axi-config = <&stmmac_axi_setup>;
+        eswin,rx-clk-invert;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x200 0x208 0x214 0x218 0x21c>;
+        snps,axi-config = <&stmmac_axi_setup_gmac1>;
         snps,aal;
         snps,fixed-burst;
         snps,tso;
-        stmmac_axi_setup: stmmac-axi-config {
+        stmmac_axi_setup_gmac1: stmmac-axi-config {
             snps,blen = <0 0 0 0 16 8 4>;
             snps,rd_osr_lmt = <2>;
             snps,wr_osr_lmt = <2>;
-- 
2.25.1


