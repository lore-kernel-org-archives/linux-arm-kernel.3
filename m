Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A1C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWm00ecZW//noVOBD0ZolXeFNkMKumFFuTm6AnT3FXY=; b=jMcvtj0LHXkLPF7BQOX+j0vhOy
	QtzBOpBqHuB/h4wzdmSVz42cKo4Rfz1uhyBVLlu/hOW73vQg67XffwWihSyVXDEGDE1qBhSndb4vN
	Nq0xKtLy4ekIm4jir/pWQ0kP50KCB5lwttn/Pe//eWPPdTGJ4pmoVFWE+6kGZqg8QdLfFKdeP/kAK
	dO9tdKP7YPiiwrR8vDItOxU5u0n4uJpOf/7dkKrMLG8Pr4IWph7ski+PHoFlofFvVWd7blfhfarUQ
	9+no6FUsG2U0e8xcvF7/1uVLa3sQSNET6G0srRHMEEyUTUUf6NLe9Hyz9/iH4T/H659Wci5OKYbz9
	aWCAy/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Iw0-00000005FhV-1R9y;
	Mon, 28 Apr 2025 07:29:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Inr-00000005E7K-48R6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 07:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=rWm00ecZW//noVOBD0ZolXeFNkMKumFFuTm6AnT3FXY=; b=oBMpEK7AtsTU2WD10IvIjptj0S
	ubkcsD5G15RBn7ta03uCaFILRyMd6o+4ecqtAgwFfM05bPvohIEYU7hTCnlwK9C3zHN2uz/VR/uK1
	sWzwI9431uYFxpouxOku3HGC1usfqfpGLksV2iJWRoEzgrJvCor3lsv/u++I+cpfyKnqzw6UpCCCE
	9JYpufGqNCfwDcU7QlnUsYRfd6rHbcEnQizULu++KRxH9TPzpeLt4ootvL5Ee/G6De0oId7AXWViT
	9lIl24F9Mq67I87UFFzappNw+XAy4veOi+maPURsFc29FFGuvM4rOFiakJZEKh6YytD+lyMNeQBhc
	tPwWbaWQ==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Ino-0000000CZup-0uAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:21:22 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53S7L3pH2713970
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 02:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745824863;
	bh=rWm00ecZW//noVOBD0ZolXeFNkMKumFFuTm6AnT3FXY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J6Fk5y0XLegsHh1dF41d7vojDkM91lABDPgLF91MmFeeM3z+OUxejL7sfBDVSXYp4
	 i7AS7nEzJZ++wY6GpWlaofBhm3KsZ1C4zzC0FmcdRCx6oiRwCJ6pKUkc3Iup/dL2xu
	 jEb3LDnOxv58lnmw4MAX5ZG7JHlgBwK85H9KorcI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53S7L3dh121356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 02:21:03 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 02:21:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 02:21:02 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53S7KdMb068873;
	Mon, 28 Apr 2025 02:20:58 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>
Subject: [PATCH 2/8] dt-bindings: dma: ti: Add document for K3 PKTDMA V2
Date: Mon, 28 Apr 2025 12:50:26 +0530
Message-ID: <20250428072032.946008-3-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428072032.946008-1-s-adivi@ti.com>
References: <20250428072032.946008-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_082120_650053_27236DED 
X-CRM114-Status: GOOD (  13.73  )
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

New binding document for
Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/k3-pktdma-v2.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml b/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
new file mode 100644
index 0000000000000..a6aae96af44df
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/k3-pktdma-v2.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2025 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/k3-pktdma-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description: |
+  The PKTDMA V2 is intended to perform similar functions as the packet
+  mode channels of K3 UDMA-P.
+  PKTDMA V2 only includes Split channels to service PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,dmss-pktdma-v2
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Channel number for the peripheral
+
+        Please refer to the device documentation for the channel map.
+
+      cell 2: ASEL value for the channel
+
+  reg:
+    items:
+      - description: Packet DMA Control /Status Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+required:
+  - compatible
+  - "#dma-cells"
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |+
+    cbass_main {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+      main_pktdma: dma-controller@485c0000 {
+        compatible = "ti,dmss-pktdma-v2";
+        reg = <0x00 0x485c0000 0x00 0x4000>,
+          <0x00 0x48900000 0x00 0x80000>,
+          <0x00 0x47200000 0x00 0x100000>;
+        reg-names = "gcfg", "chanrt", "ringrt";
+        #dma-cells = <2>;
+      };
+    };
-- 
2.34.1


