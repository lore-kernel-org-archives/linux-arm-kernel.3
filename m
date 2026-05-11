Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A34CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsNxJgL7gUbp0md/m5gmpxG7MWs1b0wZxUinNFbrdGU=; b=XMvPGwTjM8H39nMeY+WY8RquSX
	YppTA+V14/DJP4wTGymmuu3i5KB9szzSm7Knh96hmkPBveCZWP0F+nvHUwwe1oKYXviX43lxfPrDU
	Px5E+h1McWIFfyJ5mFL30eoqWQX55SjgApNRayQqY9s/VPlwGn8it/5OA0WLniaKHNgqxLQw8lYla
	uYo0wdc1Cj14JCrwgjTFdtPeiZJxIWc5gtQR+k4bGaVkSgtq+get50O/oXhnDxpHpj07EXWFwJfFi
	6nFtzWGYwLvJJvxUBq8P4ueoPIC6YA4JoDBUm15/RFxVvJW3APz9oqREAXC1/xp/DNvcJgl9+MWr+
	v/bSPiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGWG-0000000C2vN-2sdE;
	Mon, 11 May 2026 02:37:20 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGWD-0000000C2t6-3lis
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:37:19 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA5CE1A4840;
	Mon, 11 May 2026 04:37:07 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C0771A4841;
	Mon, 11 May 2026 04:37:07 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 69EE618002C2;
	Mon, 11 May 2026 10:37:05 +0800 (+08)
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
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Date: Mon, 11 May 2026 10:39:25 +0800
Message-Id: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_193718_073749_2A4A8952 
X-CRM114-Status: GOOD (  12.81  )
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
Changes in v3:
- Fixed dt_binding_check warnings

---
 .../remoteproc/fsl,imx-rproc-psci.yaml        | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
new file mode 100644
index 000000000000..28d00dbf8bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
@@ -0,0 +1,51 @@
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
+        remoteproc-ca55-1 {
+            compatible = "fsl,imx-rproc-psci";
+            /* bitmask: 0b10, assign A55 Core 1 */
+            fsl,cpus-mask = <0x2>;
+            memory-region = <&rtos_ca55_reserved>;
+        };
-- 
2.43.0


