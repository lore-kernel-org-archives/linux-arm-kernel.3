Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCAFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgL7knV6yI8Y1Hx7bT1tq1wKfGShjoMrf4TYYwMBN6A=; b=dQWq2lblo0tVX3vJTTIku/jVwd
	QO698/vPtTf0Vb3JgHVTSp/gbwAZsggz402ElG/DyGOA9nITYFeZ8ShRLQGN5OWmhkozgJyeMQzzT
	1LQXV5rUTPLKx1bXC1+0E1jsyLrkSM3VTbPB5pIKy8bwNQLL++gwV26SsNT8zIBoU7G6mwKw4V55e
	9YYDOibmt0QB+r+RCIgxAmspE7QgW37V6S//W/o95HX0TKqjFK2w1tEl2y20BDT9i9EXsF1nSEivH
	Oi2fPhR28CF+IYBr7+wlFvUCfWn4wvR5Eaa4mvbj5Wzam0snqtTvgVXTchlyDs9c2rJQuIZH8YX20
	xdRag2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBo5-00000000714-3ylx;
	Fri, 13 Jun 2025 21:19:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBlx-000000006oy-3uWp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 127FB6116F;
	Fri, 13 Jun 2025 21:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B31DDC4CEEF;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749849432;
	bh=QZrUX6qLPma6r2q9zM5C/BtmOqxPggrx08ycD2emiA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QwdoRFt+1rKlEawYaPoCDXPd9etqGhgN7bT92XXnLx8aEBTnirS9/XGx0TVrMgb6E
	 oJ7LrKzNpnvwkbi9oGXBVMxFgT2Cpt5KMEmx9lkc0szL31v428jFDl4LysWo5AnMb1
	 1+ZFAWEXtqZpQdvIGEIkgzuG9VuSE55wL6a0+/q+/fQbDhRhIXGR8bWaxQrgch0RbT
	 oxdTmAzvVldybW+hbGjCI4EH5H4TWaodErFhiuz0p+Nr5gq3/bfj7q6G9JtJ8naJzo
	 hcSkF/OBl4PEnNur8t9t+t+VykGT1hNyEVl7JZuyI5K/6+QEA8ve1WVkYc5H7Ch4cM
	 ltk4RYkrIopcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD04C7114A;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Fri, 13 Jun 2025 23:17:07 +0200
Subject: [PATCH v2 1/2] dt-bindings: gpu: Add Apple SoC GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
In-Reply-To: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749849431; l=3960;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=3r2IVrL38qapDPG/5iQRSW6ZZ0cbJ6URhg9pEUW+SNk=;
 b=585Ssxh53I/dFrq96K6/8DikvQkcX8QUs4kakByC0QwcJeI3Cay2QQC7ddIkVHz7cE6h62nb4
 74YGnDIWqUyBcdqSKyMVfb5tr56Nj9g+4hGiRc2a3ORETvj3DfAwSGm
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for the GPU present in Apple SoCs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                          |  1 +
 2 files changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..51629b3833b0a8c296eaccdfd6d9eeef02a5bc63
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/apple,agx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC GPU
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - apple,agx-g13g
+          - apple,agx-g13s
+          - apple,agx-g14g
+      - items:
+          - enum:
+              - apple,agx-g13c
+              - apple,agx-g13d
+          - const: apple,agx-g13s
+
+  reg:
+    items:
+      - description: GPU coprocessor control registers
+      - description: GPU block MMIO registers
+
+  reg-names:
+    items:
+      - const: asc
+      - const: sgx
+
+  power-domains:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 1
+
+  memory-region:
+    items:
+      - description: Region containing GPU MMU TTBs
+      - description: Region containing GPU MMU page tables
+      - description:
+          Region containing a shared handoff structure for VM
+          management coordination
+      - description: Calibration blob. Mostly power-related configuration
+      - description: Calibration blob. Mostly GPU-related configuration
+      - description: Shared global variables with GPU firmware
+
+  memory-region-names:
+    items:
+      - const: ttbs
+      - const: pagetables
+      - const: handoff
+      - const: hw-cal-a
+      - const: hw-cal-b
+      - const: globals
+
+  apple,firmware-abi:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 3
+    description:
+      macOS version the current firmware is paired with, used to pick
+      the version of firmware ABI to be used.
+      Bootloader will overwrite this
+
+required:
+  - compatible
+  - reg
+  - mboxes
+  - memory-region
+  - apple,firmware-abi
+
+additionalProperties: false
+
+examples:
+  - |
+    gpu@6400000 {
+        compatible = "apple,agx-g13g";
+        reg = <0x6400000 0x40000>,
+              <0x4000000 0x1000000>;
+        reg-names = "asc", "sgx";
+        mboxes = <&agx_mbox>;
+        power-domains = <&ps_gfx>;
+        memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>,
+                        <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>;
+        memory-region-names = "ttbs", "pagetables", "handoff",
+                              "hw-cal-a", "hw-cal-b", "globals";
+
+        apple,firmware-abi = <0 0 0>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..2a32c9c4ee355a1109a3e2031ea3663c39cc8c68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2331,6 +2331,7 @@ F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
+F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.49.0



