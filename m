Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E3C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HId0QjN1Uxd1UcS1PVWLgSUuLheSa0vzbbArIAI4e0=; b=Ve3ntqT8LCV3M8GeavklMDkip+
	vEGHNY37NteUNza44vFOmT58n/BDf3LjSAXoVEAk13Q1yAc1NQ/hHPI3KSq4lzTTfg3JwDPqJWm9b
	SJPu9UQ4+GtxCFbs5v1dndoycFHwUHQ0iiRx8UC3Zy3fZ7Wi3tg4YOaX5xWOAQf5ThwDDaH2S0U4B
	hJAv03EP7QKm9qfgryiqygGcZ8gH7Lp8cftr0dgKnEVPyP1umXP50rTuDFmJsQ8Yjfd5W/xFZf6Up
	T353PZPmkMFxblXvDXYj+5M8E2icH3wQLE3EITD/Oj2lbAew2tjMwOfdJqpJuXChw6tbTmXo8Pm+4
	mL6Ihv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWufZ-00000007wwn-3S8Q;
	Wed, 02 Jul 2025 10:26:25 +0000
Received: from mail-m1973174.qiye.163.com ([220.197.31.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu31-00000007pbt-0Jua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:46:36 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1aaa9ed36;
	Wed, 2 Jul 2025 17:46:31 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	catalin.marinas@arm.com,
	geert.uytterhoeven@gmail.com,
	will@kernel.org,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	bst-upstream@bstai.top,
	neil.armstrong@linaro.org,
	jonathan.cameron@huawei.com,
	bigfoot@classfun.cn,
	kever.yang@rock-chips.com,
	mani@kernel.org,
	geert+renesas@glider.be,
	andersson@kernel.org,
	nm@ti.com,
	nfraprado@collabora.com,
	quic_tdas@quicinc.com,
	ebiggers@google.com,
	victor.shih@genesyslogic.com.tw,
	shanchun1218@gmail.com,
	ben.chuang@genesyslogic.com.tw,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v2 2/8] dt-bindings: arm: add Black Sesame Technologies (bst) SoC
Date: Wed,  2 Jul 2025 17:44:38 +0800
Message-Id: <20250702094444.3523973-3-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250702094444.3523973-1-yangzh0906@thundersoft.com>
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGR1JVk4YGENDTEpJHh5OQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSklVT1
	VKT1kG
X-HM-Tid: 0a97ca87dd3009cckunmee1cabff3ebaba
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxg6KTo6TzE*T089KxksHQw9
	CD4aCQ5VSlVKTE5KT09CTkJIS0NKVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUhKSEw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=km48lblwqhJ9eMNaOOixs21bDUWw710nq+WF3nGAJkUGzohpfAFY+A5CVIoRyltnZs22ksywNjzOgET76hamxpDBF9R2HS4wUCyQgTxvo7xVqyRedMN6Tw+WsJO1RgD0TEFox7TMi1Djhh6zAs54h+QEhBwVrqNNP5Gokbgz6uA=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=7HId0QjN1Uxd1UcS1PVWLgSUuLheSa0vzbbArIAI4e0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_024635_317661_A69628F1 
X-CRM114-Status: UNSURE (   9.96  )
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

---
Changes for v2:
- Removed unnecessary pipe (`|`) in description
- Dropped invalid `compatible` entry for standalone SoC
- Removed root node (`$nodename: '/'`) definition

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 .../devicetree/bindings/arm/bst.yaml          | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bst.yaml

diff --git a/Documentation/devicetree/bindings/arm/bst.yaml b/Documentation/devicetree/bindings/arm/bst.yaml
new file mode 100644
index 000000000000..e6f48f569768
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bst.yaml
@@ -0,0 +1,30 @@
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
+      - description: BST C1200 CDCU1.0 ADAS 4C2G board
+        items:
+          - const: bst,c1200-cdcu1.0-adas-4c2g
+          - const: bst,c1200
+
+additionalProperties: true
+
+...
-- 
2.25.1


