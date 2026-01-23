Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8070D72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGm0MWwkBdQUJ6VMHylNjNY5VUzuxOyf/oKBwqDK+ZM=; b=2DmJwSFN44pneLwrYAEVhK32J9
	Hv2C1hYrQZJEVaNHvIlEY0YWLkOGiSOriJ+fJvY+9F9iMAomSihwwRPU+I+vGrpp5tFkRuvDVwXae
	HMf/koPWD7V1nV7vkQVk0NHoub0YG+ZQ216W9oiPaMMJtlY5uDUcOKb9TDO+B99L4gP2wd/ZuEz3D
	Dn9CxPvEJoHEu8vMTwDoLAU7PBZKIdRKOSfj3ALZb3DVcx7I7r470Y6JiGIroehvr3CMHG2Qqy0Ss
	3v0XUVPtV1Z96NfpxlZSfr3CUHmicnn7JgCzBRp4kPJwHrtdVSeGd/lVB+Rg40H/vBkplZZ+/HLuf
	0a9YCQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDwV-00000008eza-2dT5;
	Fri, 23 Jan 2026 09:59:03 +0000
Received: from mail-m3291.qiye.163.com ([220.197.32.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDwS-00000008eyJ-1Jba
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:59:01 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31bc9a775;
	Fri, 23 Jan 2026 17:53:56 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Arnd Bergmann <arnd@arndb.de>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v5 6/6] MAINTAINERS: add MMC files to BST entry
Date: Fri, 23 Jan 2026 17:53:42 +0800
Message-ID: <20260123095342.272505-7-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123095342.272505-1-yangzh0906@thundersoft.com>
References: <20260123095342.272505-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bea4655bf09cckunm2b675df11c3dd3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDThhPVhlPHR9OGU0eHR1CQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=WP/u8KwxJExyov9NG3WKDd5xGRSRKPcmAaXaUKvTKPS1xI43q9Z/yXvzqi1T4WnYuNjlBVlo4wmY1F2hIh9O2e8xwbtQPY6w4v6cTSwP7J4x+PTnFyfcXhPOfudd63Drtmk7WMSbhBkeBpC/4sDNiUhkhmARLK2JXut6FSdxpBk=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=cGm0MWwkBdQUJ6VMHylNjNY5VUzuxOyf/oKBwqDK+ZM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015900_524685_5C6CC4FB 
X-CRM114-Status: UNSURE (   9.42  )
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

Add the MMC device tree binding and driver files to the existing
ARM/BST SOC SUPPORT maintainer entry.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>

---
Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- Changed driver file name to sdhci-of-bst.c

Changes for v3:
- Consolidate BST maintainer entries

Changes for v2:
- Initial MAINTAINERS entry in platform patch
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d044a58cbfe..dc7f716f9811 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2596,7 +2596,9 @@ R:	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/arm/bst.yaml
+F:	Documentation/devicetree/bindings/mmc/bst,c1200-sdhci.yaml
 F:	arch/arm64/boot/dts/bst/
+F:	drivers/mmc/host/sdhci-of-bst.c
 
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Andre Przywara <andre.przywara@arm.com>
-- 
2.43.0


