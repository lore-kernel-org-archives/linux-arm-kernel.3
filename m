Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4FFFD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlk9BRwgkq4A2iO5Iy+2c5u6AAQsz5Zowx5JrysW110=; b=WyR+GBAMM2S2rgHdIkAVuQYkkX
	bzBL5HxiSCxlUsrfVMlyb2a9/Fs8FUV01W6DyWWSGMZT8lT2ZeuYj0b6biiASbUVsoPRA/u9aaRCT
	ZsLSWyTOxtosKQoOB1D91adEAu440glxQAx6u301qWJkPLt/34zcL3S7/xuvP3d4H5NmTsoxaQ3Eu
	IFTTeoUl+culaCDCVdRG0vo+qwQ62OyI/Uq36HzJm+Ytxvb20w9l2mpsAfQvDV/x3zC48dp14WCoP
	Vr45OvHb1jt8OEgA1g+kDWbbapBhTDJsP309b1FRg6poB4Q8kBNzrpIzRMlMpFdEdy8wzXlT5l1aj
	HDoXorAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVjF-0000000AaN9-0TaV;
	Sun, 01 Mar 2026 01:36:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVjA-0000000AaKW-27C5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 01:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC44E60126;
	Sun,  1 Mar 2026 01:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E97C19421;
	Sun,  1 Mar 2026 01:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328971;
	bh=rs+AdXbvY/4s8ufqTaidjEupHKh2m0diNhzMc5x8NWk=;
	h=From:To:Cc:Subject:Date:From;
	b=RM7jSZngZHZ3Y3lnct8qta9pGgQZs6PysJ/11TpWWvelzgdyfz43PxuyPTuoITtpo
	 0+nyo7F4qKTkYGi/Y+bUpV4hYt9mAZLG/kSicWLMiSEeumLY9bxhKzacCNoOU3c+pG
	 2l6HdJ831Rfk6OoxPBQiw5oDYIUWRP4DqlmfrvednNxNJ2MMstJZyZc0liI3z8uWhd
	 TSU4CXrC6YWxY3GSVfZi4Z0QEiCW2knM95blovFmExzSNpSxgd6El4VsoyuY+lM3GS
	 bjSfwoFlF4ARyL1zG+9M8ttOBVzE8pOhr/eKURcY4t4qqUQvRozwF8wCiIrMPjetbC
	 7g06dqPVae9LQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	robin.murphy@arm.com
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: FAILED: Patch "perf/arm-cmn: Reject unsupported hardware configurations" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:36:09 -0500
Message-ID: <20260301013609.1696038-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 36c0de02575ce59dfd879eb4ef63d53a68bbf9ce Mon Sep 17 00:00:00 2001
From: Robin Murphy <robin.murphy@arm.com>
Date: Tue, 3 Feb 2026 14:07:29 +0000
Subject: [PATCH] perf/arm-cmn: Reject unsupported hardware configurations

So far we've been fairly lax about accepting both unknown CMN models
(at least with a warning), and unknown revisions of those which we
do know, as although things do frequently change between releases,
typically enough remains the same to be somewhat useful for at least
some basic bringup checks. However, we also make assumptions of the
maximum supported sizes and numbers of things in various places, and
there's no guarantee that something new might not be bigger and lead
to nasty array overflows. Make sure we only try to run on things that
actually match our assumptions and so will not risk memory corruption.

We have at least always failed on completely unknown node types, so
update that error message for clarity and consistency too.

Cc: stable@vger.kernel.org
Fixes: 7819e05a0dce ("perf/arm-cmn: Revamp model detection")
Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/perf/arm-cmn.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 651edd73bfcb1..4fbafc4b79843 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2422,6 +2422,15 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
 			dn->portid_bits = xp->portid_bits;
 			dn->deviceid_bits = xp->deviceid_bits;
+			/*
+			 * Logical IDs are assigned from 0 per node type, so as
+			 * soon as we see one bigger than expected, we can assume
+			 * there are more than we can cope with.
+			 */
+			if (dn->logid > CMN_MAX_NODES_PER_EVENT) {
+				dev_err(cmn->dev, "Node ID invalid for supported CMN versions: %d\n", dn->logid);
+				return -ENODEV;
+			}
 
 			switch (dn->type) {
 			case CMN_TYPE_DTC:
@@ -2471,7 +2480,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 				break;
 			/* Something has gone horribly wrong */
 			default:
-				dev_err(cmn->dev, "invalid device node type: 0x%x\n", dn->type);
+				dev_err(cmn->dev, "Device node type invalid for supported CMN versions: 0x%x\n", dn->type);
 				return -ENODEV;
 			}
 		}
@@ -2499,6 +2508,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 		cmn->mesh_x = cmn->num_xps;
 	cmn->mesh_y = cmn->num_xps / cmn->mesh_x;
 
+	if (max(cmn->mesh_x, cmn->mesh_y) > CMN_MAX_DIMENSION) {
+		dev_err(cmn->dev, "Mesh size invalid for supported CMN versions: %dx%d\n", cmn->mesh_x, cmn->mesh_y);
+		return -ENODEV;
+	}
 	/* 1x1 config plays havoc with XP event encodings */
 	if (cmn->num_xps == 1)
 		dev_warn(cmn->dev, "1x1 config not fully supported, translate XP events manually\n");
-- 
2.51.0





