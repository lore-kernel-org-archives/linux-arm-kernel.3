Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E647ACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdMLkxCMdwv/ZcvRRwqvZ+qNQlbpWZA9E5mCTIh0Tkc=; b=NuLlEnhyAFz4/mlnhWeAtPIN5A
	5AAOfsCgxGhMwgufJSlrqnxwZRJmjmhhPuTuraoUVz5tFfMWzGoEt9JfEjJIyda7yyV694kcV9+3l
	kMXDudEJZecKKGNMSJbzAItsPMXCmcRdp/3IuvwdpmaPOWe+ySW32yGiRpazkr5Q+tSM3njW0kFYu
	fBl0aWozDge1G7tQj4FLlCl4OeNgLh3rxkKL1tCKARVperq0wLj/vIKa8seVXJgk56qGQuyyAXghb
	iOirEgzXprVsTVSrC2QiergM5oUoan4CD+lnvVjQW0Er8cYVzL9t+QbFjaEF0rC/S7ao685ZO9ei3
	XO2UM8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mkg-00000004fiS-3haG;
	Thu, 16 Oct 2025 12:06:38 +0000
Received: from mail-m49218.qiye.163.com ([45.254.49.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mke-00000004ffZ-0axC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:06:38 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26265956d;
	Thu, 16 Oct 2025 20:06:32 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzysztof.kozlowski@linaro.org
Cc: krzk+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
Date: Thu, 16 Oct 2025 20:05:53 +0800
Message-ID: <20251016120558.2390960-2-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99ecea25f909cckunm98a0ee06127c2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGksYVk8eHk1NSUIYSBpIQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FodpsulKPDCojROvxcmY+iPnfkF4JJ9ME0qd+d0MRzFR3+H6WIgnsH+m2DBgq2v3xZSWruB6bQv3LEHkoTSWKSNyN7qofdkflZrcC3MednsbPRKPtOVE8thuMLi+ZSxsdfg3vR5ge4dUaDs0FwNVGV+2rq91WCU0vCmiZIpnxy0=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=zdMLkxCMdwv/ZcvRRwqvZ+qNQlbpWZA9E5mCTIh0Tkc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_050636_925002_C8A059F4 
X-CRM114-Status: UNSURE (   7.23  )
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
index f1d1882009ba..df0a50b5437b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -251,6 +251,8 @@ patternProperties:
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


