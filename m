Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5698C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 01:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6EgvpP1HfVoj77A9p/ts6Gq18hvP3Tmzoq3S0EBxRY=; b=xzb0/9iD72IIgcfo5NvDZ5CRPZ
	gg0KCHBjehLVWgPT3gebn23ZbODWO2Uhfjv1S7U+jWg5ofzo136lZ8z+DIpPz8BF3Rw+N3dbsG19K
	V883Qvi59PgkoW6fln0yfMU1iT4UZFC4zUx+Z47Um5O+KIb6AiNCLq4F7vJ2EVAYGe9JjK3UqkiVf
	1qzCYiJ7VSIcpao6qKuDK3+Chz9ZP/RxL6aX4zaKfYzO+08RNwxZn4sqIxj8v3aO3TuM4vFeT9w9r
	79eg8NLiaXO6NEyKrRwBDIHK2V+alNsONDEkAGT9vc3IPnyN3E38ARBv7Bp3cfSIbuSeG9aY0XjPb
	acU80tqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHRo-00000003baD-3cSf;
	Fri, 21 Feb 2025 01:03:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHOq-00000003awE-2o2l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 01:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 274B81C01;
	Thu, 20 Feb 2025 17:00:34 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFAA53F59E;
	Thu, 20 Feb 2025 17:00:13 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
Date: Fri, 21 Feb 2025 00:57:58 +0000
Message-ID: <20250221005802.11001-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250221005802.11001-1-andre.przywara@arm.com>
References: <20250221005802.11001-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_170016_752262_3CD1781E 
X-CRM114-Status: GOOD (  12.59  )
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

The Allwinner H6 and some later SoCs contain some bits in the PRCM (Power
Reset Clock Management) block that control some power domains.
Those power domains include the one for the GPU, the PLLs and some
analogue circuits.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
new file mode 100644
index 0000000000000..7eaff9baf7268
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/allwinner,sun50i-h6-prcm-ppu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner SoCs PRCM power domain controller
+
+maintainers:
+  - Andre Przywara <andre.przywara@arm.com>
+
+description:
+  The Allwinner Power Reset Clock Management (PRCM) unit contains bits to
+  control a few power domains.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h6-prcm-ppu
+      - allwinner,sun50i-h616-prcm-ppu
+      - allwinner,sun55i-a523-prcm-ppu
+
+  reg:
+    maxItems: 1
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    prcm_ppu: power-controller@7010210 {
+        compatible = "allwinner,sun50i-h616-prcm-ppu";
+        reg = <0x07010250 0x10>;
+        #power-domain-cells = <1>;
+    };
-- 
2.46.3


