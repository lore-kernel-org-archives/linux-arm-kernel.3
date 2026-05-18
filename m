Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D387DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fCiwvjoYxa7IsnqkuwZMJXGyPW0ItV0NDG21XwCeUU=; b=MR5kR8YmY02pHGgEYxQXvIiKe3
	RTgDDr/LSr1hYMfnldQn6ZxCMqDmDSOd79i7j1N9ATagXAOqZp/84+8wKw7bgQ27OEFuH9DA0W1N3
	eGvmrtcBXojkqiEIAve0fyzPHiu50QIzNLLSb2tjMmqmBXwtlnHnhYiCaceS5/Y/gB6YCKYViRrm4
	ICKaOeV3CZsnQTsne1BqrIkmrhSKJF7jg+8iXL15PdVAd4qBvutj5hCv0PODDBcIOwPNjT4dg7nHU
	4cNsy7AEupSfOT75TaprQg97dB4WhOUr88sLq++UWkAhk6i6O0L4UIQkEj+GjTh9PprDAm7g9iB+X
	e3/zrg1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnb9-0000000DuwC-3XFk;
	Mon, 18 May 2026 02:20:51 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnb6-0000000Duv4-3XRE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:20:50 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app1 (Coremail) with SMTP id TAJkCgCHG3BqdwpqrU0aAA--.255S2;
	Mon, 18 May 2026 10:20:27 +0800 (CST)
From: lizhi2@eswincomputing.com
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net v2 1/5] dt-bindings: ethernet: eswin: add optional TXD and RXD delay register offsets
Date: Mon, 18 May 2026 10:20:23 +0800
Message-ID: <20260518022023.427-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260518021919.404-1-lizhi2@eswincomputing.com>
References: <20260518021919.404-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgCHG3BqdwpqrU0aAA--.255S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrW3ZF1DWr1UZr17WFW5Awb_yoW5GF45pa
	95C3y7GFn5Xr13Wws3J3W09F1fXFs3GFy3Crs7trnrXrn8Xa4YqwsxKw15W3WUCrWxZFy5
	uFya9a1ru34qkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_192049_146851_C434FFA4 
X-CRM114-Status: GOOD (  11.50  )
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

Document two optional cells in eswin,hsp-sp-csr for the TXD and RXD
delay control register offsets.

These registers are used by the driver to clear any residual delay
configuration left by the bootloader, ensuring that MAC-side RGMII delay
settings are applied solely according to the kernel configuration.

Add a reference to the EIC7700X SoC Technical Reference Manual for
background information about the HSP CSR block.

Fixes: 888bd0eca93c ("dt-bindings: ethernet: eswin: Document for EIC7700 SoC")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml  | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b..b66ae6300faf 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -73,6 +73,15 @@ properties:
       HSP CSR is to control and get status of different high-speed peripherals
       (such as Ethernet, USB, SATA, etc.) via register, which can tune
       board-level's parameters of PHY, etc.
+
+      Additional background information about the High-Speed Subsystem
+      and the HSP CSR block is available in Chapter 10 ("High-Speed Interface")
+      of the EIC7700X SoC Technical Reference Manual, Part 4
+      (EIC7700X_SoC_Technical_Reference_Manual_Part4.pdf). The manual is
+      publicly available at
+      https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases
+
+      This reference is provided for background information only.
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - items:
@@ -82,6 +91,8 @@ properties:
           - description: Offset of AXI clock controller Low-Power request
                          register
           - description: Offset of register controlling TX/RX clock delay
+          - description: Optional offset of register controlling TXD delay
+          - description: Optional offset of register controlling RXD delay
 
 required:
   - compatible
@@ -116,7 +127,7 @@ examples:
         reset-names = "stmmaceth";
         rx-internal-delay-ps = <200>;
         tx-internal-delay-ps = <200>;
-        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118>;
+        eswin,hsp-sp-csr = <&hsp_sp_csr 0x100 0x108 0x118 0x114 0x11c>;
         snps,axi-config = <&stmmac_axi_setup>;
         snps,aal;
         snps,fixed-burst;
-- 
2.25.1


