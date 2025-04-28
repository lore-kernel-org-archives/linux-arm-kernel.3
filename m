Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BB6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GR2GmT7fACAPkitPj8eTbd2Bh3lgrZjljTTbjCNGmE4=; b=wWD3G1VLb0C2cXyOz1rshDkuL6
	dhJ0rSCu+N6vSyANG1ZwbpXYHtIGtK12onTreKb8im9a0F21JYchjdX+MjNKrrwKa82N0pr/UqhF+
	h7NNZNTRE3rCpTTbULEvyv+X+nZCTs85lYRQTJffAjIufYiN5pwwO6uUdYCgwtkwMYNNoqv45sGVG
	YwjvOCMi4zkCyvBW8bYXiiKtqCK0dtN9ED1vA+PaDF0/GjBkWuJTvK2IUcrco/0kKKFRZ4fypWoTr
	79HN52xr5iO3gJRMwZWpJf2zBJWXFJ4pe5Be9PSaw1sgmuPjA+GZcIjkMgueie/DH5stNDvXkOoeQ
	xMbdLlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VxA-00000007brD-0jso;
	Mon, 28 Apr 2025 21:23:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vhl-00000007ZHp-3gze
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 21:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GR2GmT7fACAPkitPj8eTbd2Bh3lgrZjljTTbjCNGmE4=; b=KmrRLlJEimkapbLkld4AN+ppeP
	ZSJBnWKs5YVrmTQOm5ClW2nTsNessBWvUV97gwK9yT9jodGHduwWtmo/DEsPIIPhholLK4Og6AWU0
	aCK+k7ESnz861vMQ6SpqhJUhNIdOgY0wEQBRqqlVNmof3BWGlMmktvdfIkjTe7/e1LhTucNM8uk/K
	fD4VqoMVEmfPF/XSKdxF9zqEuQgCk/UXO5PB4neJBdkBGvOJkey34T60Uq208tAEyIaHuVdoOVQ4M
	WYjbmUZiVTJseruJ7OKANs0l7AE0uB0d4tVYzK95ZTTW5cJ0V1w+4qoMbP299dacXs1/TSe4mQdQn
	pA00arwA==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Vhg-0000000D3Bo-059w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 21:07:55 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5C6B7211AD21;
	Mon, 28 Apr 2025 14:07:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5C6B7211AD21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1745874466;
	bh=GR2GmT7fACAPkitPj8eTbd2Bh3lgrZjljTTbjCNGmE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xrw8QVTfiTdtUP3Y8XlV6NXORxmGnKRHs6fWUJthCc88pfIoxm/IszIEQ4yT7dF+J
	 IRdTAY+Xw1gv2O6QZ4w+YGqJlEbcz4XZOTz7bjcQJb1wy+VDB9tqoau7RBV0LeNFr1
	 ag/ISihJr8moPxOFn8Xf1tDPZgBBXcfdsNbWhxQI=
From: Roman Kisel <romank@linux.microsoft.com>
To: arnd@arndb.de,
	bhelgaas@google.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	haiyangz@microsoft.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	krzk+dt@kernel.org,
	kw@linux.com,
	kys@microsoft.com,
	lenb@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@redhat.com,
	oliver.upton@linux.dev,
	rafael@kernel.org,
	robh@kernel.org,
	ssengar@linux.microsoft.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	yuzenghui@huawei.com,
	linux-hyperv@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next v9 07/11] dt-bindings: microsoft,vmbus: Add interrupt and DMA coherence properties
Date: Mon, 28 Apr 2025 14:07:38 -0700
Message-ID: <20250428210742.435282-8-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428210742.435282-1-romank@linux.microsoft.com>
References: <20250428210742.435282-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_220753_493781_902AF9E9 
X-CRM114-Status: GOOD (  11.77  )
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

To boot in the VTL mode, VMBus on arm64 needs interrupt description
which the binding documentation lacks. The transactions on the bus are
DMA coherent which is not mentioned as well.

Add the interrupt property and the DMA coherence property to the VMBus
binding. Update the example to match that. Fix typos.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/bus/microsoft,vmbus.yaml | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
index a8d40c766dcd..0bea4f5287ce 100644
--- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
+++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
@@ -10,8 +10,8 @@ maintainers:
   - Saurabh Sengar <ssengar@linux.microsoft.com>
 
 description:
-  VMBus is a software bus that implement the protocols for communication
-  between the root or host OS and guest OSs (virtual machines).
+  VMBus is a software bus that implements the protocols for communication
+  between the root or host OS and guest OS'es (virtual machines).
 
 properties:
   compatible:
@@ -25,9 +25,16 @@ properties:
   '#size-cells':
     const: 1
 
+  dma-coherent: true
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt is used to report a message from the host.
+
 required:
   - compatible
   - ranges
+  - interrupts
   - '#address-cells'
   - '#size-cells'
 
@@ -35,6 +42,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
     soc {
         #address-cells = <2>;
         #size-cells = <1>;
@@ -49,6 +58,9 @@ examples:
                 #address-cells = <2>;
                 #size-cells = <1>;
                 ranges = <0x0f 0xf0000000 0x0f 0xf0000000 0x10000000>;
+                dma-coherent;
+                interrupt-parent = <&gic>;
+                interrupts = <GIC_PPI 2 IRQ_TYPE_EDGE_RISING>;
             };
         };
     };
-- 
2.43.0


