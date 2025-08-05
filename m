Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EAEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7FUvgL1TuDCMtf7/92bRNZsYPADm6Z7BjG5c0s/OG2c=; b=1xxiZw5Wu5AMzSVD2MigaGdJVY
	AnQbxfemyR8hdkXoFbfXc4oiXH0IrafrZ/Q5iIRKBPI8kPKzA3br9TO1gqqyp3YLa9krbYubXAjL9
	XsnwBJtmEuYqX5xWbaKmGPc/5ARgsnwxc+yEgLGsGHSdwc7q2UEny+TVKdShdFS7217CJa0hJSvbe
	yTSh5cf5kmZY9LDEI2730sqDwOYYi5wymbGQkFyY63sXTRx0VmedZeLTKpLmFMDZYY4Rp4TKhPGAs
	EHVC1djBK1U/nFcAiWC3eELsSouax+7dh02YPRWYZG5TU9L0A0Chn6mNvQ8DQBO4UrK18k+m7XQgq
	sO3rvNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRHI-0000000E0D4-3Pwc;
	Tue, 05 Aug 2025 23:41:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR2Z-0000000DyXs-2UgQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D86D5C5E74;
	Tue,  5 Aug 2025 23:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F71C4CEF0;
	Tue,  5 Aug 2025 23:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754436354;
	bh=5XIGIOtkm5wqnfle6b94B9BhH0eqVUZy3VtaDNaGTRk=;
	h=From:To:Cc:Subject:Date:From;
	b=pjrXyVmQDlk+It43r3ZsQHPz8wXxy2KQswTJp5Ya2DpeP3p2DYG0IffPt0fmstgNE
	 385oUvmWtnnGM4jGx0f4hCZNorHnRgcKVVMVj1NHSOZztjHh7Emhi2WYgdYVlsfO6U
	 tG9Dw73ONxpvc4Sx4y1am98ssdcrOGUGVtKO3VqyPsZqDJLYeoq63vBp+dtRMjeN3/
	 0DB4uAlcax2+NcjfefwNS2XGfIls5gxw0jib1J9um7aALUeW6ELxsqiqDmh4PIn77D
	 CQ79PG3R8smA3RHCmvE768GbzTehOJz8E7kOouW92TdGU9m/xAZ/wPT8Pa3kQOlaXZ
	 NyuEXia71Xgig==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: marvell: Convert marvell,orion5x boards to DT schema
Date: Tue,  5 Aug 2025 18:25:51 -0500
Message-ID: <20250805232552.2829241-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_162555_713948_62EC3AF2 
X-CRM114-Status: GOOD (  13.99  )
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

Convert Marvell Orion5x based boards to DT schema format.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/marvell/marvell,orion5x.txt  | 25 -------------
 .../bindings/arm/marvell/marvell,orion5x.yaml | 37 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 38 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt b/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt
deleted file mode 100644
index 748a8f287462..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Marvell Orion SoC Family Device Tree Bindings
----------------------------------------------
-
-Boards with a SoC of the Marvell Orion family, eg 88f5181
-
-* Required root node properties:
-compatible: must contain "marvell,orion5x"
-
-In addition, the above compatible shall be extended with the specific
-SoC. Currently known SoC compatibles are:
-
-"marvell,orion5x-88f5181"
-"marvell,orion5x-88f5182"
-
-And in addition, the compatible shall be extended with the specific
-board. Currently known boards are:
-
-"buffalo,lsgl"
-"buffalo,lswsgl"
-"buffalo,lswtgl"
-"lacie,ethernet-disk-mini-v2"
-"lacie,d2-network"
-"marvell,rd-88f5182-nas"
-"maxtor,shared-storage-2"
-"netgear,wnr854t"
diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.yaml
new file mode 100644
index 000000000000..c0417591b2be
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/marvell,orion5x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Orion5x SoC Family
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
+          - enum:
+              - netgear,wnr854t
+          - const: marvell,orion5x-88f5181
+          - const: marvell,orion5x
+      - items:
+          - enum:
+              - buffalo,kurobox-pro
+              - buffalo,lschl
+              - buffalo,lsgl
+              - buffalo,lswsgl
+              - buffalo,lswtgl
+              - lacie,ethernet-disk-mini-v2
+              - lacie,d2-network
+              - marvell,rd-88f5182-nas
+              - maxtor,shared-storage-2
+          - const: marvell,orion5x-88f5182
+          - const: marvell,orion5x
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 424d2a9cee49..f4d8b5721488 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2832,7 +2832,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git
 F:	Documentation/devicetree/bindings/arm/marvell/marvell,dove.yaml
-F:	Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt
+F:	Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.yaml
 F:	Documentation/devicetree/bindings/soc/dove/
 F:	arch/arm/boot/dts/marvell/dove*
 F:	arch/arm/boot/dts/marvell/orion5x*
-- 
2.47.2


