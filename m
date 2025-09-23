Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D24CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWAYbqoYVtppRStnG1G4tD44qpuBAMIK8fz0sA1UFI4=; b=cHZcTJGa6Q5463dU5yj73sppwX
	Pn91mGLZPbL/A8ExmpRNE0Zsr+hwIddxKXjntNeItLYUtRmdFFfMPWtz56uQ2eR35pTdEcHm4xuPL
	M6pXHdKIMziK9iVT/9hHvyPR7z6gMnPNunr6fkF8M6JG/y2lsMdaZUp/toTCo2vQhTyA2B/fcP5cC
	lJQIxIGAwajY2kCpeoU3MXA2nbAWsjTVW1vAhroS0Ce5mo7l0CXRd8SgK72smlVBu2Mm8icJFud3j
	la+MZCbfD2r3mtFn+ISNCrK+TYda/J/O6xnizb6FZBvZODLpPRpV5Rbs8EP/0OBuvaItNFqTp5lHW
	SeLE7iLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEd-0000000CWhJ-1voo;
	Tue, 23 Sep 2025 06:10:43 +0000
Received: from mail-m49222.qiye.163.com ([45.254.49.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEY-0000000CWeH-2M0z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:10:41 +0000
Received: from [127.0.1.1] (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23bdebfcf;
	Tue, 23 Sep 2025 14:10:30 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
Date: Tue, 23 Sep 2025 14:10:08 +0800
Subject: [PATCH 2/9] dt-bindings: arm: add Black Sesame Technologies (bst)
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-v4-patch-final-v1-2-2283ad7cbf88@thundersoft.com>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
In-Reply-To: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 soc@lists.linux.dev, Albert Yang <yangzh0906@thundersoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758607828; l=1892;
 i=yangzh0906@thundersoft.com; s=20250814; h=from:subject:message-id;
 bh=eWqieNtDLZJBpQIXEibnf+P3a6GVeHnQ5dMPHSti1nI=;
 b=ooly4LSDwkrjPNsdIM9qUiMJZDxlx0PMeSMu/5TzTp+ZKRh97izHCDoR1OsTpaMc+4snOuWAN
 CTb6obAD2pSBsdJzbQ4EWSyg7a8GzMTeBsk/vs81gUHuBc8UySKxFQr
X-Developer-Key: i=yangzh0906@thundersoft.com; a=ed25519;
 pk=bEcgALL9KpUg/m7zH44r50xa/re91dI9SA0vGV1/bu4=
X-HM-Tid: 0a997531ef2a09cckunmfc27e25b4e0226
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0tMVktJQ0gaGBpNHkoZGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Wti8Khl09WilIY/Kt4OJjPDBGwcGXaCw+n0gqtJdKvcCeTP+jOulzXNVqjK8kwmjGJ1ZF8zM+5jrMHSmjWwDqLHSgw0HoLfQBZb1HBItN3+afVYw8Ejczy3tk3BDhtZ8omG21DBmtBIq8KwJh8rxyod14irEHFUTQlgadPRGtoY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=aWAYbqoYVtppRStnG1G4tD44qpuBAMIK8fz0sA1UFI4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_231038_808098_FB1EF928 
X-CRM114-Status: UNSURE (   9.99  )
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

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v4:
- remove Signed-off-by: Ge Gordon
- add Reviewed-by Krzysztof Kozlowski info
Changes for v3:
- Add Signed-off-by: Ge Gordon

Changes for v2:
- Removed unnecessary pipe (`|`) in description
- Dropped invalid `compatible` entry for standalone SoC
- Removed root node (`$nodename: '/'`) definition
---
 Documentation/devicetree/bindings/arm/bst.yaml | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bst.yaml b/Documentation/devicetree/bindings/arm/bst.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a3a7f424fd57f23efeed9b076c2612ba672be3e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bst.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/bst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BST platforms
+
+description:
+  Black Sesame Technologies (BST) is a semiconductor company that produces
+  automotive-grade system-on-chips (SoCs) for intelligent driving, focusing
+  on computer vision and AI capabilities. The BST C1200 family includes SoCs
+  for ADAS (Advanced Driver Assistance Systems) and autonomous driving
+  applications.
+
+maintainers:
+  - Ge Gordon <gordon.ge@bst.ai>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: BST C1200 CDCU1.0 ADAS 4C2G board
+        items:
+          - const: bst,c1200-cdcu1.0-adas-4c2g
+          - const: bst,c1200
+
+additionalProperties: true
+
+...

-- 
2.43.0


