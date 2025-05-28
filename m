Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B89C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5aDsGHATrYbvgalCsJgPhzB/hTqSH/AkFDrxYsFVCvs=; b=lcOFYDP03omFl3ozFoDL88DxGH
	h0ha18k5v0rq/l8kRx6tkmO/CmDg4WpeWivyBWZLKXcVIQWbQ9dMTCQuatriskO6nrQvYq3k7WtEw
	FH1Pe3pftkmTt/0Msou7L9NvN5R65yeERIbepmfSZ2igKcNiZMIW6rOoQ64PqBbxdzB9tYN4VxQlK
	W09qevKlx+HJEfMpn1O3x8gQyyVJheyKZMeusPpbvquCFLmoeeh9/3eJedsiGgaTZPcHJ8SE0zyVz
	DyBm4PnglAg7ksyJ505xVS1UOm9YeS9vnatvA99YkmfmYwRKEfBLohwVd3K8fnsfYMMGOxh/jlYrj
	xgRERliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCuF-0000000ChQo-1cz1;
	Wed, 28 May 2025 09:17:03 +0000
Received: from mail-m49231.qiye.163.com ([45.254.49.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCYk-0000000Cdbn-31rr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:54:52 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a5f5;
	Wed, 28 May 2025 16:54:47 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 2/9] dt-bindings: arm: add Black Sesame Technologies (bst) SoC
Date: Wed, 28 May 2025 16:54:44 +0800
Message-Id: <20250528085444.481163-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkIZVklNGUtIGU4dQ0hISFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a971619ed6109cckunma4140f57397d08
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46USo4CTE*PkgZUQ9KOTMt
	QxowCy5VSlVKTE9DT0lJT0NDTkxKVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlITE03Bg++
DKIM-Signature: a=rsa-sha256;
	b=ZslRBfNdnW2bRPoB7+povFOwSwa1nMCumeKBGMgQd7JE+W8YOSPbGR0q4PmtMDcVlHAqhDT//rOdOPiIhvzMYIZCXixAsTNQEWXnYjk90GVBqxAV/tGRyaNSDOQ2lDmoFtDB6a/NzLj6Wwz5LFK5J9nCzF/alj6tZJKaSbperRE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=5aDsGHATrYbvgalCsJgPhzB/hTqSH/AkFDrxYsFVCvs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015450_950111_8852E3C7 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

Add device tree bindings for Black Sesame Technologies Arm SoC,
it consists several SoC models like C1200, etc.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 .../devicetree/bindings/arm/bst.yaml          | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bst.yaml

diff --git a/Documentation/devicetree/bindings/arm/bst.yaml b/Documentation/devicetree/bindings/arm/bst.yaml
new file mode 100644
index 000000000000..e21a37130cef
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bst.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/bst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BST platforms
+
+description: |
+  Black Sesame Technologies (BST) is a semiconductor company that produces
+  automotive-grade system-on-chips (SoCs) for intelligent driving, focusing
+  on computer vision and AI capabilities. The BST C1200 family includes SoCs
+  for ADAS (Advanced Driver Assistance Systems) and autonomous driving applications.
+
+maintainers:
+  - Ge Gordon <gordon.ge@bst.ai>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: BST C1200 family platforms
+        items:
+          - const: bst,c1200
+
+      - description: BST C1200 CDCU1.0 ADAS 4C2G board
+        items:
+          - const: bst,c1200-cdcu1.0-adas
+          - const: bst,c1200
+
+additionalProperties: true
+
+...
-- 
2.25.1


