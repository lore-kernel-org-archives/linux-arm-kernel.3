Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD77FC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+0tAWt+Qjct3O4SDcG8rZZ2o6M/LcHVGvtP3po6lSY=; b=XytELkKOEu3xffvcJPIasW7vCy
	bAJvZT5g0WBjKeUIKImiJ8J0AxSJ+YRanB9zg4RSMh2S2ncegYtwMDJHG4ztojwXf1sjBA2BYVSUN
	N4J9q2wIkQ3wPFnqHz2dSueoK3txmFVyv9HBbTetbeoLysHGatjTJo2aVS3HCWN4LmD8koPMZtyO5
	Rn1wnMNyzRoPx/xkamr8UyrIM8B/EdzFe0fSBozIieJf+mzAhwB7RmfLVoWqVVnY5/H6K4xoQoqhS
	LFKgCtY3QusGheU/anKSGvQoq5pcjkG9aryKSGsrpphE0plqyi4nYGuXZzg9U05PPxPkNcD4ZjFu5
	uCLBD1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjm-00000008Yy6-2CDb;
	Thu, 27 Feb 2025 19:40:02 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhFk-000000089kN-01Ea
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:00:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A02410382F1A;
	Thu, 27 Feb 2025 18:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+0tAWt+Qjct3O4SDcG8rZZ2o6M/LcHVGvtP3po6lSY=;
	b=KQNxjRXpcvJbz9cgkcZQoHo9j6WJlFA4+eHsi+79LIXltTLb8A2GR9urWj7yMW/wa4fC++
	O7re390e2VOV3buJ5/H6NnTQ2nJ9lhtq8tQ8dJKEU9I6CIgBgfQpklf8Qh1wkKodqvMZgY
	1kXjSslr0OIIA+HI6ZwkwsQA9/bl3iTU5+jCdZ4O3fei8TLnvxUThvGT7PIe3I+tUxP5WX
	uCsYX7xWdJ0IziUY+ZGVfNDARw9uFflLV38qjFs/KZGwnouYXYptpWA0Yr68dV5dhbd45a
	608JCAPJkOQTBgxfxoEMdJe/nPXD4hDYp6Xxg/Og7YOgn2xnNNJQp0hfdSF7Pw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU reset
Date: Thu, 27 Feb 2025 17:58:01 +0100
Message-ID: <20250227170012.124768-2-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090052_183259_F70E1268 
X-CRM114-Status: GOOD (  14.54  )
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

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Document support for this reset register.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 .../reset/fsl,imx95-gpu-blk-ctrl.yaml         | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml b/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
new file mode 100644
index 0000000000000..dc701bd556c0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/fsl,imx95-gpu-blk-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 GPU Block Controller
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  This reset controller is a block of ad-hoc debug registers, one of
+  which is a single-bit GPU reset.
+
+properties:
+  compatible:
+    - const: fsl,imx95-gpu-blk-ctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@4d810000 {
+        compatible = "fsl,imx95-gpu-blk-ctrl";
+        reg = <0x0 0x4d810000 0x0 0xc>;
+        clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
+        power-domains = <&scmi_devpd IMX95_PD_GPU>;
+        #reset-cells = <1>;
+    };
-- 
2.47.2


