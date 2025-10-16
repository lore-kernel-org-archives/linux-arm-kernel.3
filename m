Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDFBCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vmS3EfhUykAvBVymJGJnTFBE7v+DMHYK0Xp3FKpXE8=; b=j4vOmsSZ7jD2DvxpcEiinePEDI
	d2lbs9xkvV4Tw+8GC3HNGNVMdAYebzQ3XbBO8m30eErWcBP1A7uRg8KzYHNUY9Kd4UbAS61KQYQ1H
	zucuxdg3ySnxxG2TzglzZYF8PHdYVeKuEmWk2bzbThJ5gceYPnxDE7GVUS3L9dGcI/VFccoobyfVc
	i146KVIrzZSkQZJDuAZRnkw72ZRuit5RygN/lVlDReJOm72giaoTjC3ihR3X23LJuYvUVnXqwppdu
	B8W4zVCmz5gAu/xPQtPjr1y0cy3pzTyTJXUtX5hJZvdvzLT3mCVq6DLKUn26Gvf9KzJePVKilQCKS
	DRr3SiFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ml1-00000004fy7-0Xp9;
	Thu, 16 Oct 2025 12:06:59 +0000
Received: from mail-m3281.qiye.163.com ([220.197.32.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mky-00000004fsO-1YAr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:06:57 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26265958d;
	Thu, 16 Oct 2025 20:06:51 +0800 (GMT+08:00)
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
Subject: [PATCH v5 6/6] MAINTAINERS: add Black Sesame Technologies (BST) ARM SoC support
Date: Thu, 16 Oct 2025 20:05:58 +0800
Message-ID: <20251016120558.2390960-7-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99ecea710e09cckunm98a0ee06128ad
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSh9IVh5KGBlDTB1OSBlIHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Dk1et/NkrQ7aZ0NPv4CTjrYYp9Tn7qD9pL3NdHP9TihvJ23t/6KWS5WHsoIw/C1r6hNxoQ0nmwWONRXqL0oU50bY52PSCZ00dkos/17xrnh0MwxgDXwuk8q+VDNNacS0fi+rix6sPWFt3xSorapfsrsuSGeKIDza4OnODFXodQw=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=8vmS3EfhUykAvBVymJGJnTFBE7v+DMHYK0Xp3FKpXE8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_050656_599160_214DDCAA 
X-CRM114-Status: UNSURE (   9.94  )
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

Add a MAINTAINERS entry for Black Sesame Technologies (BST) ARM SoC
support. This entry covers device tree bindings, drivers, and board files
for BST SoCs, and platform support.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Change for v5:
  - Remove MMC driver and dt-bindings entries (MMC patches will be submitted separately)
  - Change status from "Maintained" to "Supported" based on review feedback

Change for v4:
  - Changed file name: sdhci-of-bst-c1200.c to sdhci-of-bst.c
  - Changed title from "add and consolidate" to just "add"
  - Simplified commit message description
  - Removed Signed-off-by line for Ge Gordon

Change for v3:
 - No changes

Change for v2:
 - No changes
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..841d3f055778 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2543,6 +2543,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/blaize.yaml
 F:	arch/arm64/boot/dts/blaize/
 
+ARM/BST SOC SUPPORT
+M:	Ge Gordon <gordon.ge@bst.ai>
+R:	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/devicetree/bindings/arm/bst.yaml
+F:	arch/arm64/boot/dts/bst/
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Andre Przywara <andre.przywara@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


