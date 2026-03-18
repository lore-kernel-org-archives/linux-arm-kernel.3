Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E24107761C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 20:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbfnwI3zG1qI6fjCRB2xfljp1vdqzcHcbOSHyeZ5tNA=; b=P2F4Pnag4QsBnS1tJpFH8XPM02
	2QyZo+1ysWk+yCymZVDUypbvkYonIvhm7pT6CwsLzcJdGdjdoHJWxvv/CF6i6te1gKCepSwbxaj3Z
	aLUYiSMOyZk1bJ7PAvzKMRg06pSQG1BC7PAv8a73SIAZNDJTJXgfFzHV9uDNxydo9XvfvtQwN56fo
	3M9L6mRd+w3SEkr74qYvlW9DM+mqzQoT9gVfRhj96ITQNDFA4SBCGNgUaAu6b0HrFem0C47KGtnfS
	14sa4VFA9lnYjdZfE09yS15ombRbmxMw4k6pl7ybalIroaFjJbwOmmSYF5X3exqabCHJ7m2e0Nhe2
	LVtV7IcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpw-00000009Kpj-2DK2;
	Wed, 18 Mar 2026 20:49:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2xpc-00000009Kaf-2lby
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 20:49:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 332E11BF7;
	Wed, 18 Mar 2026 13:49:24 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42B893F7BD;
	Wed, 18 Mar 2026 13:49:28 -0700 (PDT)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Wed, 18 Mar 2026 20:48:06 +0000
Subject: [PATCH v3 09/10] dt-bindings: firmware: add arm,ras-cper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-9-48e6a1c249ef@arm.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-cxl@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Michael.Zhao2@arm.com, robh@kernel.org, 
 linux-arm-kernel@lists.infradead.org, Dmitry.Lamerov@arm.com, 
 rafael@kernel.org, conor@kernel.org, will@kernel.org, bp@alien8.de, 
 catalin.marinas@arm.com, krzk+dt@kernel.org, linux-doc@vger.kernel.org, 
 mchehab+huawei@kernel.org, tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773866948; l=3216;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=m30C6ae0Gi/1VPGKk3cnY2R4jGh1sOEZdBEV37Q3YPY=;
 b=sHjP2DYtORHKUEVL+/1U7e2XDY8+tQt0TCQEd567sF2RoRfivWDK69M4stglIr9uH5lUi9UqG
 UU+I7fBWyQnAoGlYqQ1FTuBDFGwo3/3Mq3AEOLbnaYRwFhH0qcLQnFH
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_134932_929177_193308CB 
X-CRM114-Status: GOOD (  14.46  )
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

Describe the DeviceTree node that exposes the Arm firmware-first
CPER provider and hook the file into MAINTAINERS so the
binding has an owner.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 .../devicetree/bindings/firmware/arm,ras-cper.yaml | 71 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
new file mode 100644
index 000000000000..bd93cfb8d222
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/arm,ras-cper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm RAS CPER provider
+
+maintainers:
+  - Ahmed Tiba <ahmed.tiba@arm.com>
+
+description: |
+  Arm Reliability, Availability and Serviceability (RAS) firmware can expose
+  a firmware-first CPER error source directly via DeviceTree. Firmware
+  provides the CPER Generic Error Status block and notifies the OS through
+  an interrupt.
+
+properties:
+  compatible:
+    const: arm,ras-cper
+
+  reg:
+    minItems: 1
+    items:
+      - description:
+          CPER Generic Error Status block exposed by firmware
+      - description:
+          Optional 32- or 64-bit doorbell register used on platforms
+          where firmware needs an explicit "ack" handshake before overwriting
+          the CPER buffer. Firmware watches bit 0 and expects the OS to set it
+          once the current status block has been consumed.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt used to signal that a new status record is ready.
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional phandle to the reserved-memory entry that backs the status
+      buffer so firmware and the OS use the same carved-out region.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    reserved-memory {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      ras_cper_buffer: cper@fe800000 {
+        reg = <0x0 0xfe800000 0x0 0x1000>;
+        no-map;
+      };
+    };
+
+    error-handler@fe800000 {
+      compatible = "arm,ras-cper";
+      reg = <0xfe800000 0x1000>,
+            <0xfe810000 0x4>;
+      memory-region = <&ras_cper_buffer>;
+      interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..69756fb61a98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22009,6 +22009,11 @@ M:	Alexandre Bounine <alex.bou9@gmail.com>
 S:	Maintained
 F:	drivers/rapidio/
 
+RAS ERROR STATUS
+M:	Ahmed Tiba <ahmed.tiba@arm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/firmware/arm,ras-cper.yaml
+
 RAS INFRASTRUCTURE
 M:	Tony Luck <tony.luck@intel.com>
 M:	Borislav Petkov <bp@alien8.de>

-- 
2.43.0


