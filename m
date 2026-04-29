Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1970AFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxhZv9V/MciaMkimByIs7OD1ODZL9ik64h/A4H5G/Zw=; b=PFtFwCdIqUujtzzM002iKe9SiQ
	GhTSGBfV+c1Q6QW4oqZ6peeluahHqMRbtGF10StSJyno7zyGHVHOu5hoDBhQJZ3jeHcZ6St1CXpeM
	ajBp8SeVy9l8Ih9qt2mExJrzBN4S2zTuTlqEl6PtOd8LAR1uBFj2XEXjRHAroCunqUgW/TmKav6a2
	OWwqCwsRXJV6ZFyau4lGxtPAb497VP1DgJ0Y0NjZV3MWXvF5prjzklUtShLDz5a3xfCHlGBsDWtqb
	/aAKJBZymnx82vMrhVbfXt+OfMEaPodicXA4YjomvgVHSDGTegonuJgBtvEUsDCNspvg1J4ZYLXLz
	l2qsEWaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvHh-00000002pWk-3xyi;
	Wed, 29 Apr 2026 03:08:21 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvHd-00000002pVC-2Fdi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:08:18 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1D14A2044AE;
	Wed, 29 Apr 2026 05:08:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D83AF2044B9;
	Wed, 29 Apr 2026 05:08:15 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9AD571800083;
	Wed, 29 Apr 2026 11:08:13 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: add imx-rproc-psci binding
Date: Wed, 29 Apr 2026 11:10:43 +0800
Message-Id: <20260429031047.30893-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_200817_707149_7B58CF5D 
X-CRM114-Status: GOOD (  13.16  )
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

Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
remoteproc support.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
 .../remoteproc/fsl,imx-rproc-psci.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
new file mode 100644
index 000000000000..cdab9566e588
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc-psci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Cortex-A Core Remote Processor via PSCI
+
+maintainers:
+  - Jiafei Pan <Jiafei.Pan@nxp.com>
+
+description:
+  This binding provides support for managing Cortex-A cores as remote
+  processors on i.MX platforms using the PSCI (Power State Coordination
+  Interface) for CPU power management operations. This allows single
+  Cortex-A core or multiple Cortex-A cores to be controlled by Linux as
+  a remote processor, enabling them to run RTOS or bare-metal applications.
+
+properties:
+  compatible:
+    const: fsl,imx-rproc-psci
+
+  fsl,cpus-bits:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask indicating which CPU cores are assigned to this remote
+      processor instance. Each bit represents a CPU core, where bit N
+      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
+      while 0x6 (0b110) assigns CPU cores 1 and 2.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved memory region to be used for the remote
+      processor's code and data.
+
+required:
+  - compatible
+  - fsl,cpus-bits
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            rtos_ca55_reserved: rtos-ca55@d0000000 {
+                reg = <0 0xd0000000 0 0x10000000>;
+                no-map;
+            };
+        };
+
+        remoteproc-ca55-1 {
+            compatible = "fsl,imx-rproc-psci";
+            /* bitmask: 0b10, assign A55 Core 1 */
+            fsl,cpus-bits = <0x2>;
+            memory-region = <&rtos_ca55_reserved>;
+        };
+    };
-- 
2.43.0


