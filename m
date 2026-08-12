Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0465BC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxckCXoEBwT86Yjgv8+r4hBdxwNS1Haykb8AscG7Svo=; b=iTPNIKAvjvOUZnAchVZJrbf9uv
	l0eT9XcVO0Y9mrvPLlZZrIE8sYnv3E8hzTqEFh32/VfF9xGFmyV4m+muVDYn8qAcgtdKQvcwh5iJs
	m2PEyk9FiOmEQcCUbzlEXhRRBlIiUry+A4mbFzTu46P3YaFWQeM9133GqW52yGPV7FhcafUgWWUTm
	z3erFAS2YYcz2nzz5BW1etO6dH7xifomOHLj3yFfhZSwUorSBVCkix+rywrG0koEosLrHTvuVeAOs
	IWJOvW8151RnyMd2Y3XqwfO7ZPIwTtNaKgCUscjjKykt+TEkGK/S1/6l/lakfNtczAz9XEPF7Ic4Z
	17xtcrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6UD-0000000FvyU-2dhP;
	Wed, 12 Aug 2026 10:47:06 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6U9-0000000Fvwl-2nFy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:47:04 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E53D200016;
	Wed, 12 Aug 2026 12:47:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 00472200011;
	Wed, 12 Aug 2026 12:47:00 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AAA4418000B1;
	Wed, 12 Aug 2026 18:46:57 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v4 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Date: Wed, 12 Aug 2026 18:46:30 +0800
Message-Id: <20260812104633.22420-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260812104633.22420-1-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_034702_450632_58342686 
X-CRM114-Status: GOOD (  14.40  )
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
Changes in v4:
- Updated description to describe the hardware instead of the binding
- Changed compatible to SoC-specific "fsl,imx93-rproc-psci" with
  generic fallback "fsl,imx-rproc-psci"
- Fixed example node name from "remoteproc-ca55-1" to "remoteproc"

---
 .../remoteproc/fsl,imx-rproc-psci.yaml        | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
new file mode 100644
index 000000000000..7d0d0da383a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
@@ -0,0 +1,54 @@
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
+  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
+  platforms, one or more of these cores can be offloaded to run RTOS
+  or bare-metal firmware as a remote processor, while the remaining
+  cores run Linux. The cores are powered on and off via PSCI (Power
+  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx93-ca55-rproc
+      - const: fsl,imx-rproc-psci
+
+  fsl,cpus-mask:
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
+  - fsl,cpus-mask
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+        remoteproc {
+            compatible = "fsl,imx93-ca55-rproc", "fsl,imx-rproc-psci";
+            /* bitmask: 0b10, assign A55 Core 1 */
+            fsl,cpus-mask = <0x2>;
+            memory-region = <&rtos_ca55_reserved>;
+        };
-- 
2.43.0


