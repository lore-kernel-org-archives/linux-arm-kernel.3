Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7379C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9TISRjcyNzJhspv+BsI/IwMgSnJGVD7KjflnKUUa21M=; b=h8Sr+uVz9IjjSFY3rX9ZoFZ+EW
	yYj/pkWmlOa8Io0QPsk6pUCQmZH9DavU5qQdMD4nY+lj5LD3MMkWfqcJfq2LDOZ/SpPQ67oUw9IjU
	0Cx/7a44gvcRNRpmjhorn+cQ05zrwdwbHm/hZeOGGh2FxQ5dmp/TCQoue2EQSj3n2OVSdACzjwyFd
	SDfoWJQTD5ggCC8dgtDxdWSShKWOJ0JNOzW8IG2FhBjneSvnafWTclw+6spDB4NnHaXAkAJAirZOK
	9t/xZMm7TeFAbw6kalxu19aiUjTeLHvfYASSMMtCUADyRH+ntiAI4UNicKv2vzTDHZTpWpN4MzTl9
	Un0NJGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujREk-0000000E03I-0E9U;
	Tue, 05 Aug 2025 23:38:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujR2J-0000000DyUN-2T0f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA9A6A56819;
	Tue,  5 Aug 2025 23:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEB5C4CEF0;
	Tue,  5 Aug 2025 23:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754436338;
	bh=LuzcoV1I2VbUUAVRYOZOdRQdjYx81NxcPnYk4ajcTmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UG6/MnGgU6/R2IXo5TSAzDjz1PCeGNoPl7dVRPwvrPMmB89r3cr/8xfoOxOuwTPqX
	 qlI3EI7o3Blum0lnYbGFMLY3zb0WqnwYiB47h8vZeiHQlRIBOF1zTClLLzfgs5qi9W
	 XdxsKQ1PbavETe+97DkfKIkX68xq28lsuE7UA9r4Gyso0isPk4PYwriJ4LllG90Q3/
	 Timh7Q3gOE7AUD5Eu5EOOdmjVksJ+FCj6SmUZJWZDs7psqw/clKaznhNW9p+uCHcj8
	 WK28+GrNVgNvUSZitOI30AmIg0LLbLra++dCWbru+wh2yu71tThTSK/v/BW+tsHbDh
	 gvzf2n43qG19w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: marvell: Convert marvell,dove boards to DT schema
Date: Tue,  5 Aug 2025 18:25:31 -0500
Message-ID: <20250805232532.2828745-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_162539_757341_2C7DA6F7 
X-CRM114-Status: GOOD (  14.18  )
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

Convert Marvell Dove based boards to DT schema format.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/marvell/marvell,dove.txt     |  7 ----
 .../bindings/arm/marvell/marvell,dove.yaml    | 35 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 36 insertions(+), 8 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,dove.yaml

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt b/Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt
deleted file mode 100644
index e10e8525eabd..000000000000
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-Marvell Dove Platforms Device Tree Bindings
------------------------------------------------
-
-Boards with a Marvell Dove SoC shall have the following properties:
-
-Required root node property:
-- compatible: must contain "marvell,dove";
diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,dove.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,dove.yaml
new file mode 100644
index 000000000000..a37804fb30c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,dove.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/marvell/marvell,dove.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Dove SoC
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
+              - compulab,cm-a510
+              - solidrun,cubox
+              - globalscale,d2plug
+              - globalscale,d3plug
+              - marvell,dove-db
+          - const: marvell,dove
+      - items:
+          - const: solidrun,cubox-es
+          - const: solidrun,cubox
+          - const: marvell,dove
+      - items:
+          - const: compulab,sbc-a510
+          - const: compulab,cm-a510
+          - const: marvell,dove
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 4912b8a83bbb..424d2a9cee49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2831,7 +2831,7 @@ M:	Gregory Clement <gregory.clement@bootlin.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git
-F:	Documentation/devicetree/bindings/arm/marvell/marvell,dove.txt
+F:	Documentation/devicetree/bindings/arm/marvell/marvell,dove.yaml
 F:	Documentation/devicetree/bindings/arm/marvell/marvell,orion5x.txt
 F:	Documentation/devicetree/bindings/soc/dove/
 F:	arch/arm/boot/dts/marvell/dove*
-- 
2.47.2


