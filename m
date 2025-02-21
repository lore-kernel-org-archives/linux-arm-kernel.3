Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B978BC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 18:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H93iyX4QsIjRvuarMUU+zmaDywtAgxNZUW5MXDIbqH0=; b=WyRk6Z6Lbk8ctTDbkDkI3/etQf
	iqJb0BNWIdEuLFBElEOKptPgfKYs9K0SV4mYxRhGOLAwrFcbtJ9ncQj7/k784uuxfARqAWWAtD1zb
	n2RkP1IU2WOXxbWu9Qr6iBdWnfpsvtwIXYnHE+aj4QlrtqFM+6P91lM5SFaaS/PEceyy46FJl5DZx
	vgpvsgR6JhgVxhdS9DphDjLkF32Og1UUdqOZBct2lqdqdCZkEs8ccOSNnRLcxm/gwxqfCg4nIeHhi
	H+oT46FoIy0G396qAM+RB9PI3bMKAP4SK0ODcjVR6mDoKzgniUo+dD6HSFBHu9mTQtOZX1Vi/xrat
	UyLb+MNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXSA-00000006TF7-0zrR;
	Fri, 21 Feb 2025 18:08:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXNZ-00000006SDE-2VJb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 18:04:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECBD2169C;
	Fri, 21 Feb 2025 10:04:18 -0800 (PST)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 052803F59E;
	Fri, 21 Feb 2025 10:03:58 -0800 (PST)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 02/10] dt-bindings: arm: Add Morello compatibility
Date: Fri, 21 Feb 2025 18:03:41 +0000
Message-ID: <20250221180349.1413089-3-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_100401_669162_3A6CBA8C 
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

Add compatibility to Arm Morello System Development Platform.

Note: Morello is at the same time the name of an Architecture [1], an SoC
[2] and a Board [2].
To distinguish in between Architecture/SoC and Board we refer to the first
as arm,morello and to the second as arm,morello-sdp.

[1] https://developer.arm.com/Architectures/Morello
[2] https://www.morello-project.org/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 .../devicetree/bindings/arm/arm,morello.yaml  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,morello.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,morello.yaml b/Documentation/devicetree/bindings/arm/arm,morello.yaml
new file mode 100644
index 000000000000..b4cfa8d048c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,morello.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,morello.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Morello Platforms
+
+maintainers:
+  - Vincenzo Frascino <vincenzo.frascino@arm.com>
+
+description: |+
+  The Morello architecture is an experimental extension to Armv8.2-A,
+  which extends the AArch64 state with the principles proposed in
+  version 7 of the Capability Hardware Enhanced RISC Instructions
+  (CHERI) ISA.
+
+  ARM's Morello Platforms are built as a research project to explore
+  capability architectures based on arm.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Arm Morello System Development Platform
+        items:
+          - const: arm,morello-sdp
+          - const: arm,morello
+
+additionalProperties: true
+
+...
-- 
2.43.0


