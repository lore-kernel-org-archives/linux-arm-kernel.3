Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A4FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HMkgd4U8ejQDglyMU+B67p6FaY3W0Xfzh2z2Jn1+M1I=; b=g62/WewXqCbf75zHgiQjw1PBn9
	itRzqYDJb46a/8dl1Xfi78whfAz62nnONNXJufSC0Aj2LH42pE6Vl1F/xSC237iCqLy4C+1sgQiKD
	Wt25WoKaVYpt/0uI4kL8cA+mInkagvqCPsZvW+51yTyPp0wDDiXJoR730rNXBTuyVMMISwcaYFvRW
	SrURDQPS9LvUyqbRxEvc0I2NPU9VjQv07DvpPzQs6yjbJo5OnjrPGgU8gih/yd1OLO4uwe43Azerd
	rHQahVYkQDk65lj6o7jCMoAeQVuMlxEArpSaaDm5PEpxlZjU6rmDbHRwV45Qd6H0aDkDAKe5nqsTp
	Vz0T+RpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVvf-0000000Af0M-3vlB;
	Sun, 01 Mar 2026 01:49:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVvc-0000000AevL-05iU;
	Sun, 01 Mar 2026 01:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0657416BD;
	Sun,  1 Mar 2026 01:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA96C19421;
	Sun,  1 Mar 2026 01:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329743;
	bh=hKPfWY3C38468BnO2wo8zfAHG6X53W98fR1INJ/k2Oo=;
	h=From:To:Cc:Subject:Date:From;
	b=XOg/Tat1xCN3KaHcB3jyRA16vqugBu/gLmGYX3Cut28m6WmfwWL24ZtYQBG4eZu61
	 2hoPxNd8fgCo5+fwPUtFTocCLHnNJUgTvuY08MeafdxQLn1VWN4L/l6K+Z+1lvhJu/
	 +cWg2J/qWs54fkTKkvlw/iJKRzKUVtQNwO6yemketHcb+qciZyZ0ufKIlhvpg4VLAz
	 +uBZATLhM3y7f2S4BAJ0rpL8WyAWUi13F4FUYvUy/vvFkxtZaFFVMiG9zhY3QqkzG3
	 uaJ6isSj+p24prlrUwJ1LP7u04AsHtQPKR8meeo8FZugiJgwyrJc+NRb47BqCWJ5bF
	 T723BCG166wFw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:01 -0500
Message-ID: <20260301014901.1713342-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_174904_087540_27EAC3F6 
X-CRM114-Status: GOOD (  10.68  )
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

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f128bab57b8018e526b7eda854ca20069863af47 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <haoxiang_li2024@163.com>
Date: Wed, 8 Oct 2025 17:01:56 +0800
Subject: [PATCH] media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()

In mtk_mdp_probe(), vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put()
to prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index f78fa30f18648..8432833814f31 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -254,6 +254,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.51.0





