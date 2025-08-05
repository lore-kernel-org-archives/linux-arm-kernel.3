Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD74C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BraSCMoNboV28dHgdkb2j/VJFexpbK0YmUaiiE8kjCA=; b=B9n6kHO0ZmkSMPfZgwWzs+EzN7
	ktKI1rr0v+vJK9UNDinq9wgke9OTjbdUBPTxogh8dOszrA1fuFAZDiCSSls+uZR1+EzbYASzRTWp2
	ZVzCmfoAhqWWXxfXSk72qaAuH3Smm/nh17ipgr7UabNtl3CwkWWzQZrkDzx6c8GXc0jPc1Rd2ej6I
	nJYx0kRy6WaBgj+tKNUF6cN658nsxxutkkRX6DTTlnnkWC9dYn76IrxdtflX3FAmpxfuZmhkf1ODJ
	yEOG0jy2dZ7Yfzen5rgPZDe8eryMFU6Fmv+5Nj7gq53tz136FBMSD75sQxtWWFIitsdFxnYhg0mju
	orzGdUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR72-0000000Dz0S-2O3B;
	Tue, 05 Aug 2025 23:30:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR1w-0000000DyOk-3iyu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49DBB5C6713;
	Tue,  5 Aug 2025 23:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E5BC4CEF0;
	Tue,  5 Aug 2025 23:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754436315;
	bh=uRaQFKmTNs6WiDXUTtckqwoicM/kHAHx6j1ov6e95AA=;
	h=From:To:Cc:Subject:Date:From;
	b=J2mvrXzrwJkx9C9QKapUCqTGRhZZPxCQkE3/zUGA+oeJpvOZy/1Nc9WaqEvH7fntC
	 OknLSQzQOmapjidp8RbQshrqzKYPr/6ak23oS9QK4YeCPVpL4yHW1McPrVHEzCrMcQ
	 OJ7rRuxbEp0f6zfDwcbWe7TN25wCxBUdK5UQCPlGjai9dfV8XZuzofE9j6qcZ0Bvvn
	 HfotzQYudwVx+gOkT7FXFSpk54NkvA+KS/f0scGOxPpgzM056M3eXllw5RfI2wDUOD
	 IW/6xaGqg16Q5c4NR5eyaMtuVtGmt4EIOPrPlm2slAMyzU04ANtoKTcqKCvFt/H6QF
	 twoXSOl7gCvCw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: marvell: Convert marvell,armada375 boards to DT schema
Date: Tue,  5 Aug 2025 18:25:12 -0500
Message-ID: <20250805232513.2828068-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_162516_971894_920511BD 
X-CRM114-Status: GOOD (  11.48  )
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

Convert Marvell Armada-375 based boards to DT schema format.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/marvell/armada-375.txt       |  9 --------
 .../arm/marvell/marvell,armada375.yaml        | 21 +++++++++++++++++++
 2 files changed, 21 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-375.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,armada375.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-375.txt b/Documentation/devicetree/bindings/arm/marvell/armada-375.txt
deleted file mode 100644
index 867d0b80cb8f..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-375.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Marvell Armada 375 Platforms Device Tree Bindings
--------------------------------------------------
-
-Boards with a SoC of the Marvell Armada 375 family shall have the
-following property:
-
-Required root node property:
-
-compatible: must contain "marvell,armada375"
diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,armada375.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,armada375.yaml
new file mode 100644
index 000000000000..81c33e46fecc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,armada375.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/marvell,armada375.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 375 Platform
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - const: marvell,a375-db
+      - const: marvell,armada375
+
+additionalProperties: true
-- 
2.47.2


