Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69432FCE082
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yV/XhMFY062SXtORH9uiov+6vn/6ep7qWs/yzDNm8ow=; b=ANBCEd1/sFYF6I3Vu6lw897oeV
	5oRb9N4NvHcaKp5Dqk0KfVvjph22lkruRX7B/dY3RrXlAMsEHQt0WTdCdyKMxvtpdb0mdXK1WckIZ
	p26itD7XGDjKu7cYEK1I91IO8O5gyCWvMl2RgV8h9Xh4sHR2RIhd12epYBrKpugmggTxq9kc9QLhN
	d6xmgwL8QCjxxwe+RC8Z9KMsvWftrzAMHfzJpKLrp23P1DRjgpHN9Rt7k/A9A4LSWWPa2Rb8BSFdu
	nyahbIq9hZb//G9UXg5N1UHREBCUeIyWW9djp0cr/EYeBP6NxGjhghDQAU5yua7X9YcbmOlQEIuoE
	swZZL0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbcB-00000006EwN-0cKZ;
	Thu, 26 Feb 2026 13:41:15 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbby-00000006Eld-38ko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:41:04 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 55E461A14A2;
	Thu, 26 Feb 2026 14:41:01 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 405991A14A9;
	Thu, 26 Feb 2026 14:41:01 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A45A2035B;
	Thu, 26 Feb 2026 14:40:59 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:42 +0200
Subject: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=3009;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=EX2bIZOSowP7el+n7llkL5Myq7aMQsIPLE13DNgNaf0=;
 b=tPxIFYSc7cbZSar8MAZ2vi5SJTPMRU/MOwR6ASpB1hIm7foVZJIzow1x+B7uPluDrCqVmZjC0
 UbPbT0uDRp6D2R7LlgfcgzTj+tB0JQdwp92nBdYyDP1Jra2XEl0bXlE
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_054103_065574_4C106E26 
X-CRM114-Status: GOOD (  11.73  )
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

Add the bindings for Neutron, a Neural Processing Unit from NXP.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 .../devicetree/bindings/npu/nxp,imx95-neutron.yaml | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
new file mode 100644
index 000000000000..ba1f6851866b
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/nxp,imx95-neutron.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Neutron NPU
+
+maintainers:
+  - Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
+  - Jiwei Fu <jiwei.fu@nxp.com>
+
+description:
+  Neutron is an NPU from NXP targeting edge AI inference applications.
+  Initially supported on i.MX95 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-neutron
+
+  reg:
+    items:
+      - description: Register space
+      - description: Instruction area of the TCM space
+      - description: Data area of the TCM space
+
+  reg-names:
+    items:
+      - const: regs
+      - const: itcm
+      - const: dtcm
+
+  memory-region:
+    description:
+      Phandle referencing a "shared-dma-pool" to be used for Neutron
+      inference buffers, which need to be 1MB aligned.
+
+      The memory region must be defined with alignment of 1MB and size
+      should be large enough to accommodate the targeted ML models. It
+      should be marked as reusable.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: npu
+      - const: npu_apb
+      - const: npu_cgc
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      neutron@4ab00000 {
+              compatible = "nxp,imx95-neutron";
+              reg = <0x0 0x4ab00000 0x0 0x00000400>,
+                    <0x0 0x4AB10000 0x0 0x00010000>,
+                    <0x0 0x4AB08000 0x0 0x00008000>;
+              reg-names = "regs", "itcm", "dtcm";
+              memory-region = <&neutron_pool>;
+              interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+              clocks = <&scmi_clk 68>, <&scmi_clk 67>;
+              clock-names = "npu", "npu_apb";
+              power-domains = <&scmi_devpd 20>;
+      };
+    };
+...

-- 
2.34.1


