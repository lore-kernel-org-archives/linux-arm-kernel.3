Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D0DCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XY1+cf0NTb0xRpC03OIMhJWcVNtQLjQy5avmpN1TZY=; b=Xje6By8NPthgQdgeMAmVhgqDPT
	Mukg83OBSmV09Bf6ll0S+LMTeb0NcJvN7DKKSHoC5SO1HHlVlCVYCgSygjQCkZGoUyLls1RMzU+6r
	7yZsBWE5147YfbFYNSejrpHVjt7rxSeyqoLsajNiyZTKEt4AQghn/IsTT/7Yg1htv+h/fRnA3MiQD
	6G1NGHK2wu4bj400CzcPcoA4cgz+RNIOcQSYHpTBnxEMGGsEXgOyMvyz5lsefkQaAbcYANW1RZ9yG
	QEV7zqd5PqOuzCLJH/0fYFQ3b70uwfhpLnAkilUlrRBifM6pS+obW+pk7L6dtFCcaSR16DVnmuQjV
	DKpbIcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluaZ-0000000Bmox-1LKd;
	Tue, 12 Aug 2025 19:23:15 +0000
Received: from mail-m32105.qiye.163.com ([220.197.32.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloAJ-0000000Ah4o-2BNQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:31:44 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f211b6d9;
	Tue, 12 Aug 2025 20:31:39 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	adrian.hunter@intel.com,
	robin.murphy@arm.com,
	ding.wang@bst.ai,
	gordon.ge@bst.ai
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v3 8/8] MAINTAINERS: add and consolidate Black Sesame Technologies (BST) ARM SoC support
Date: Tue, 12 Aug 2025 20:31:10 +0800
Message-ID: <20250812123110.2090460-9-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a989e43c9c809cckunm52c5de628443e3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS04dVkpITUpKTUJPTkxLHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TlyYPy41p0fjSOSw/DXJYeY/u7nlf4/zwGoyL9ES27467blCjCHPRGpDBoOBehWgMXuHNftPWscE0sinYV7Y0m+A6A+fJMCbMhpju+CZV/pdmdCkTmtWZ6Tq7r85YIe1U3jqxD+Kdw2Zro8+kaBWI6OS80dWjux6NqDDP8utsuU=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=5XY1+cf0NTb0xRpC03OIMhJWcVNtQLjQy5avmpN1TZY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_053143_760134_045C43F6 
X-CRM114-Status: UNSURE (   9.32  )
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

Add and consolidate the MAINTAINERS entry for Black Sesame Technologies
ARM SoC support. This entry covers device tree bindings, drivers, and board
files for BST SoCs, including MMC, and platform support.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Change for v3:
- No changes

Change for v2:
- No changes
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efb51ee92683..e3236384c28a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2441,6 +2441,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/blaize.yaml
 F:	arch/arm64/boot/dts/blaize/
 
+ARM/BST SOC SUPPORT
+M:	Ge Gordon <gordon.ge@bst.ai>
+R:	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/bst.yaml
+F:	Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
+F:	arch/arm64/boot/dts/bst/
+F:	drivers/mmc/host/sdhci-of-bst-c1200.c
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Andre Przywara <andre.przywara@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


