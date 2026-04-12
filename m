Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B8E937EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4bbz/6PIuOZC+QP370TudeS59rM6vQiLK/nl2iL2JY=; b=IUaIC/Ry8Fp+TaQOMQnWU05I5r
	G4iVdpnBlbu3wqNcLSWfU3m9S0FqaK7m/scgzhN8DFmNdEARVw2OyLJ1BsRb06dMqqnXnv941Dumd
	MgwbGZNTbjQlAAUsFrik+t0wLx4TCMRmLe0O0KfV963/QAKKZDRvz5Cqe/O+f9xbCSXQaCSyrVToY
	iniIqCbrXGyde6P3DCgFEZOBJVRXzjKkidioU9NkF3V0e6LfGhQY8o7D2B/p3nTCY5lkYdKOUnPSe
	UPjYgXzGdZKPcQDmlu1mGRwg20dEGRwN7jpofjemVcA5bcNGN1lCzilgB5qBI4N2lSDPzO4AumBOk
	uWfCI//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFk-0000000EViF-18ra;
	Sun, 12 Apr 2026 17:05:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFf-0000000EVgI-0YOz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26CEC6132D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B03EC19425;
	Sun, 12 Apr 2026 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013537;
	bh=3zinErAF7PIUZyN4YZ8S8wFZ34k6zuwyefbRqDldTUU=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=FFHc+nEpmbGi089Bcp/h8IU0b+Rui8aVj5WeJ93zHZ7WUVeDa+jd1ISr+DCaq/KEr
	 MwH7eEYLR5NY4DYNtKhcUGu83wfsz5MbcwK8bZoUv0xQZj7LxS5aShB1RHXe4L3Wj1
	 VWqzfGv/iqHuckU5eMCmHivJ/XoiSL2j7LKzfZWTH4LF8UAWAh9V8ozNxG45oICPIW
	 B7y9Uid0svthw1DXVIQ1TJZDyrzQEWWfr7ciklAGRyWtJbolga8+QWp3KwkozlSXLT
	 bBgp7lNN6NqqY3FgFbUwI4IzUErH955RHA2oS9BArHJsfhJNKt0LMuNzywdUKSXkFH
	 mxLb46kYu7UCA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:39 +0100
Subject: [PATCH 3/5] dt-bindings: firmware: Add Arm FF-A binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-3-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0
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

Document the FF-A firmware device node.

Describes the "arm,ffa" compatible and requires the standard interrupts
property.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 .../devicetree/bindings/firmware/arm,ffa.yaml      | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,ffa.yaml b/Documentation/devicetree/bindings/firmware/arm,ffa.yaml
new file mode 100644
index 000000000000..150f394b3327
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/arm,ffa.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/arm,ffa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Firmware Framework for A-profile
+
+maintainers:
+  - Sudeep Holla <sudeep.holla@kernel.org>
+
+description: |
+  Arm Firmware Framework for A-profile (FF-A) firmware device node
+  describing the   notification interrupt exposed to the normal world.
+
+properties:
+  $nodename:
+    const: ffa
+
+  compatible:
+    const: arm,ffa
+
+  interrupts:
+    description:
+      Per-CPU notification interrupt used by the normal world FF-A partition.
+    maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ffa {
+        compatible = "arm,ffa";
+        interrupts = <GIC_SGI 8 IRQ_TYPE_EDGE_RISING>;
+    };

-- 
2.43.0


