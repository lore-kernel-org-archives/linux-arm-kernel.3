Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976B7FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tU0y43ctA2aYlFT4Zg2aq9wxkaHRnozCeZRkkfr3wxA=; b=GhwYeE7O6CTjI+3Ab+o9SnaLmT
	8omNyvqeCRbKRz6pgCd7ornFvSEvA4/YhYBXOsE5oRjbBrRQa/o+DKsUVHee9x6IliWwlLCLhUokX
	H1AFCHggP9nEbGdHwWQfuVyUj3mUCtyq4gYaZJsFJcHMxpZ5qllRiXBNaVDbmTAiUEghCEImwpCiW
	iD1VPoC59CsX1K+CPT7+yZtFgpnx1jugZB3kVmV0lEo3VEGbWPa8CPDMEsBweAyLNznDsFd8QTGet
	cS7a5QXU9hwzLfyxCBqv60faJTvQZBAf8YQraAEY3kao4OSH0FVAnJ22QiK9x0aT051ixR6tTWCXG
	w2MjWxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVrr-0000000AdcV-3lzd;
	Sun, 01 Mar 2026 01:45:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVrn-0000000AdZJ-3IbR;
	Sun, 01 Mar 2026 01:45:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7074A407CA;
	Sun,  1 Mar 2026 01:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B600C19424;
	Sun,  1 Mar 2026 01:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329507;
	bh=r7w0U+t3BkYHSoclmCe+XAJmVrbSuVYfKVg+jGqjFdw=;
	h=From:To:Cc:Subject:Date:From;
	b=Rw3wLAMP93vKF568TyH9/YiMrMkAVBYpBk8r2vXueMJwN6DiW4IcOkGBQQrnouyZI
	 lJzmxtGxx9CGy4nR3k7JzaGit0eB06b8ZcuLPb3fctMQC/WX4a5/Wx3rnYv5qeHoWW
	 xHIoh8GPdilgJY1574/ssaF71TLcRblnhW9ZNaoYr/TB/a0fQB/gRInPWbnqqMhadv
	 gcrGEGYsAmJ8PPu807GarFAxSm0aGw5kdOUIRLtFWPu0pSfU2W5yJhY6mLmlQ1+/bl
	 BqjVzFFGasPCj1X/9XoKs/GpItuIcaADzn8RiI6HEYdB/0RoW7mctYI4/EFblOk5U4
	 UvMbt4zAhJqqg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	thomasyen@google.com
Cc: Peter Wang <peter.wang@mediatek.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "scsi: ufs: core: Flush exception handling work when RPM level is zero" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:45:05 -0500
Message-ID: <20260301014505.1707608-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_174508_361143_6FB8EE3C 
X-CRM114-Status: GOOD (  14.26  )
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f8ef441811ec413717f188f63d99182f30f0f08e Mon Sep 17 00:00:00 2001
From: Thomas Yen <thomasyen@google.com>
Date: Fri, 30 Jan 2026 00:51:51 +0800
Subject: [PATCH] scsi: ufs: core: Flush exception handling work when RPM level
 is zero

Ensure that the exception event handling work is explicitly flushed during
suspend when the runtime power management level is set to UFS_PM_LVL_0.

When the RPM level is zero, the device power mode and link state both
remain active. Previously, the UFS core driver bypassed flushing exception
event handling jobs in this configuration. This created a race condition
where the driver could attempt to access the host controller to handle an
exception after the system had already entered a deep power-down state,
resulting in a system crash.

Explicitly flush this work and disable auto BKOPs before the suspend
callback proceeds. This guarantees that pending exception tasks complete
and prevents illegal hardware access during the power-down sequence.

Fixes: 57d104c153d3 ("ufs: add UFS power management support")
Signed-off-by: Thomas Yen <thomasyen@google.com>
Cc: Stable Tree <stable@vger.kernel.org>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Link: https://patch.msgid.link/20260129165156.956601-1-thomasyen@google.com
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/ufs/core/ufshcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 66223d2908532..8349fe2090db6 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9998,6 +9998,8 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (req_dev_pwr_mode == UFS_ACTIVE_PWR_MODE &&
 			req_link_state == UIC_LINK_ACTIVE_STATE) {
+		ufshcd_disable_auto_bkops(hba);
+		flush_work(&hba->eeh_work);
 		goto vops_suspend;
 	}
 
-- 
2.51.0





