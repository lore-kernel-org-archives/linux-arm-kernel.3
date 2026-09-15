Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D135C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJhW6KJR2q02aymAKzeVjP5u4IMZU2lIeCswnW/kmHA=; b=QCzqAzA05uKY887VrdsiIsGD4s
	w9vBU4Ra+ygr7FFhsuHngp3trh0v0rP/g09eQXgJWWH8WlmGzBV2BOcmT7H5v+YgDUrJcv2evq9ew
	h22EdAVaKPowjAwLl0vxSPmrWL+XWpK0Yuz+Ncew3JAqkZ3w6+Pv4l3GCtAR2LMv1FiFyH3M3cbHg
	/Mc5uEwbl0GeyDYVYdlO1nuBC5A8cYpSo5fmsd4GggI0xjaM0t2Nl4lj3OwPVp2oNRTZjRhnOLtJi
	xu7PL0e/QUjsR8e9OCFiFpdppniSzUyI9UPOG1tDFq5MNcRgsXOQhc3wLYBGJadPk4ROeqRcdRDD6
	QWPglBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QRk-00000005vL0-3FQq;
	Tue, 15 Sep 2026 10:31:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QRg-00000005vKJ-3xn7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:31:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 104ED1570;
	Tue, 15 Sep 2026 03:31:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 560BB3F7B4;
	Tue, 15 Sep 2026 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789468283; bh=aaFgC+9c4woienxeGUxt0YF9gIshO6e7edOS2SBHRbo=;
	h=From:To:Cc:Subject:Date:From;
	b=pF9Nr705qRGy1MBgKUvoJOXmt3mc7jUDmMF5Hp3oVgv5HOKO8qvGlWs+It5iQnnMY
	 hSYVO/PEgMpLoO8ykQ61CC9At0//TX1FZGZWusyUlHpqqc1sTm3oBcPDr5ZKsjuCaw
	 q9BZWBdLT41PESercE1AFc0MIwsr0rgwZnv5vowU=
From: Ben Horgan <ben.horgan@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ben.horgan@arm.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Gavin Shan <gshan@redhat.com>,
	Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Use linux-arm-kernel list for the MPAM driver
Date: Tue, 15 Sep 2026 11:31:01 +0100
Message-ID: <20260915103101.1659477-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_033125_738064_C884DE16 
X-CRM114-Status: GOOD (  10.95  )
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

As MPAM is an arm64 feature and patches mostly go via the arm64 maintainers
it may be reasonably expected that the MPAM driver uses the list-arm-kernel
list.

Make this official by adding the L: in MAINTAINERS.

Suggested-by: Gavin Shan <gshan@redhat.com>
Suggested-by: Yin Li <yin.li@oss.qualcomm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6215fcb07770..2113a0051b52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18436,6 +18436,7 @@ M:	James Morse <james.morse@arm.com>
 M:	Ben Horgan <ben.horgan@arm.com>
 R:	Reinette Chatre <reinette.chatre@intel.com>
 R:	Fenghua Yu <fenghuay@nvidia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/resctrl/mpam_*
 F:	drivers/resctrl/test_mpam_*
-- 
2.43.0


