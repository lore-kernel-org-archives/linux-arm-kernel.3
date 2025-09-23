Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B601CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDcHxGOvabpWrg24OH+LFpYkmiRSfnuaNCDEqWh+fbE=; b=uKABIT5sKrgmMnPjX6DPLdHP64
	cI+xom1OQ8o01FoK53L/gPAmSEW/3/fiOO6XuP9pwb+cL9F1L9wTbxqECf1eZ6Dl6lYxA40KjekwU
	1qGozALAi20FhSEm79Po+jqDla9uZtJGd+Ormlsma3G6OefPF+d/XcpSEPNEpTiKoL+NGB/B1WNRz
	0GdglA+9eNAqB2kWvDAt709FrGbdXXbrP441urPkiSZJehoTFFx3Hjwy6M00mCguGCCptXd90K4V1
	XSN6Id9ZSdZ/gJrwGcQmYHxLtVVtRd2dFalPH7IEoyCYqHUYJOzjqwFun49229xQkGhQMJLLX7eGg
	ihe8DnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEc-0000000CWgZ-3aUt;
	Tue, 23 Sep 2025 06:10:42 +0000
Received: from mail-m49202.qiye.163.com ([45.254.49.202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEW-0000000CWeF-3jtL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:10:39 +0000
Received: from [127.0.1.1] (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23bdebfc7;
	Tue, 23 Sep 2025 14:10:29 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
Date: Tue, 23 Sep 2025 14:10:07 +0800
Subject: [PATCH 1/9] dt-bindings: vendor-prefixes: Add Black Sesame
 Technologies Co., Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-v4-patch-final-v1-1-2283ad7cbf88@thundersoft.com>
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
 soc@lists.linux.dev, Albert Yang <yangzh0906@thundersoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758607828; l=1195;
 i=yangzh0906@thundersoft.com; s=20250814; h=from:subject:message-id;
 bh=To99qns2zIXO51nztUpDVeLTKR/SUM5m6vG3Z0d9mV0=;
 b=n6u/4gLR0xKZcjrIKnlqsvmqSYP53mO5T6o2D3OTbvhgdVK5clLU23j27vcnVsi8ukoOplW+y
 C3gA5zsFROdCnEA/SuVHq/2Z03qIG8ST3G/CZg/HxfXnSyCuSyLCoo5
X-Developer-Key: i=yangzh0906@thundersoft.com; a=ed25519;
 pk=bEcgALL9KpUg/m7zH44r50xa/re91dI9SA0vGV1/bu4=
X-HM-Tid: 0a997531ea2509cckunmfc27e25b4e01f5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGBpKVkxIHh1NTx5CTUkYQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SN/zKi+YVII4pB67yrsOXEVx+2yvQOtit8lh7jbXqQ4yWChJkN/YD2zn+eY3tAoAJ32L2pSq2h1GbWpaguP1S0Gs/TtC1nZffRQb5PEhZqthBy4CX8TrJnsLeLhH4Qsh2T+Xf55/qkVa2pcFlpGWxo9PepS8NzQPPJzfkIfw67Y=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=JDcHxGOvabpWrg24OH+LFpYkmiRSfnuaNCDEqWh+fbE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_231037_459749_FEF481BF 
X-CRM114-Status: UNSURE (   9.09  )
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

Black Sesame Technologies Co., Ltd.s a leading automotive-grade
computing SoC and SoC-based intelligent vehicle solution provider.
Link: https://bst.ai/.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>

---
Changes for v4:
- adjust ^bst to the correct order
- adjust Acked-by order
Changes for v3:
- No changes

Changes for v2:
- No changes
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad2fa53b2dca2ca06a63710771a600..084ba39016ae23150dd8f140da16f9b1cd55f4cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -243,6 +243,8 @@ patternProperties:
     description: Shanghai Broadmobi Communication Technology Co.,Ltd.
   "^bsh,.*":
     description: BSH Hausgeraete GmbH
+  "^bst,.*":
+    description: Black Sesame Technologies Co., Ltd.
   "^bticino,.*":
     description: Bticino International
   "^buffalo,.*":

-- 
2.43.0


