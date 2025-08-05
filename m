Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886CAC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p9WzFixiTpCTIWr0ZV67Jeot+hj3yHkwSAjBMtJ3im0=; b=cG0ozzgg+UytEBikuLuLsD2twM
	aCFgl2IlkJkglySjZCvJiIcUzNYN/zHrPcgoHTi1JQHhTgT4cR4fmlnZ3bhw4X1gQb/l7TCAJPdRa
	yUTTHbRJbWl0nuZ80uk+Qmxoy423tOjQ90j8GV96CsQ0C83wfPHFrbuYie3nAWtHjOuaHVU6ib2NB
	5U32nCMlk1ozKqBqjHaQltgr6FU/yfrU3i1yqNSRel5DnHsqrENdfGzBnoXJkwuvQ7tIvJBl08t9i
	FjBqj3h29sSAM7/PkYbV0Xue+us9BOzxFsCizjLNWInlMQRTaZ2OHYLlLLjZIBh4iTXh9XZh6sFFY
	raGDUgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR9e-0000000DziB-1jjb;
	Tue, 05 Aug 2025 23:33:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR22-0000000DyQM-44ce
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0822E601D5;
	Tue,  5 Aug 2025 23:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A15C4CEF0;
	Tue,  5 Aug 2025 23:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754436321;
	bh=pSW8iCs3751+4sUebaIwymfRB47Os5fTm5JvQh78ULY=;
	h=From:To:Cc:Subject:Date:From;
	b=jIwhLOdX0c9P1uXB2PZuiGdLBMFSnXcqqk6jTQTikYnzaiNkn7s51jnqq8PpM2tbz
	 eyY/5IH6wG01xg84t1PtKulNbPiWyH3cnEiM+cu/shULSn1LOWB175L8XnzKTrLdmM
	 ydEoVJzJc7Syuy49CuIPDa7Qh8Zchojf2o7JQr8Hv2E55B9k/k8gw0yXIMZ0/X+922
	 ouOcrfvUJ6yMEnSIt8wiF2XkGmf+qKxU8Uv69GDjZcn7U7OzZlzg1Qlxo1hQ0XXubh
	 PcjbSgfs2Xd9DHKX5GxIhnaVOlSqGOP+yRqEWO+lRyL+o45OJ397fuxj0c59/0kxGu
	 Cmnz64BRp5rWQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: marvell: Convert marvell,armada390 boards to DT schema
Date: Tue,  5 Aug 2025 18:25:17 -0500
Message-ID: <20250805232518.2828268-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Convert Marvell Armada-390 based boards to DT schema format.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/marvell/armada-39x.txt       | 31 ------------------
 .../arm/marvell/marvell,armada390.yaml        | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-39x.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,armada390.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-39x.txt b/Documentation/devicetree/bindings/arm/marvell/armada-39x.txt
deleted file mode 100644
index 89468664f6ea..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/armada-39x.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Marvell Armada 39x Platforms Device Tree Bindings
--------------------------------------------------
-
-Boards with a SoC of the Marvell Armada 39x family shall have the
-following property:
-
-Required root node property:
-
- - compatible: must contain "marvell,armada390"
-
-In addition, boards using the Marvell Armada 395 SoC shall have the
-following property before the common "marvell,armada390" one:
-
-Required root node property:
-
-compatible: must contain "marvell,armada395"
-
-Example:
-
-compatible = "marvell,a395-gp", "marvell,armada395", "marvell,armada390";
-
-Boards using the Marvell Armada 398 SoC shall have the following
-property before the common "marvell,armada390" one:
-
-Required root node property:
-
-compatible: must contain "marvell,armada398"
-
-Example:
-
-compatible = "marvell,a398-db", "marvell,armada398", "marvell,armada390";
diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,armada390.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,armada390.yaml
new file mode 100644
index 000000000000..5ff6a5439525
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,armada390.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/marvell,armada390.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Armada 39x Platforms
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: marvell,a390-db
+          - const: marvell,armada390
+      - items:
+          - enum:
+              - marvell,a398-db
+          - const: marvell,armada398
+          - const: marvell,armada390
+      - items:
+          - enum:
+              - marvell,a395-gp
+          - const: marvell,armada395
+          - const: marvell,armada390
+
+additionalProperties: true
-- 
2.47.2


