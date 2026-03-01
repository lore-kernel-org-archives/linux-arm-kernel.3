Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09064FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sH2DzjOb4l8MBqMIIB7Xnv5uaPZIg2fQTKg19kF7Yi0=; b=pZDcrGssHJc/rabacODtC/UAMk
	M7eRxFmqfn3kV94tSGBELWLle/+T1xxy38hTIIP9mgU+vwZExfC+28MOTPKYedEFC0/IxRtGTPUTo
	fhV3yfFPJTUYBzhhPuPEqvXQxaER3ZiqRZl8tvnKtf2B8BdBVhWJbAkHvK75qZsfOpxZ8LMmmAHNi
	V+4MXMbogOSnDclVR6KN0o+Uv6oLM5L1JwU6REOcyNVqceCzrWDOpJ5Mm4GQmE0OepUg00ootTlyZ
	TYuULfICCgTkxb/9LBetXW05NcjYWVh79jKy9kItDQSIdvTYC4JnBZkAm86Ys2hWhgKk4zG/OYDx8
	uqbn4wVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVT5-0000000ATdP-3tkx;
	Sun, 01 Mar 2026 01:19:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSq-0000000ATNn-2V2D;
	Sun, 01 Mar 2026 01:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E61840704;
	Sun,  1 Mar 2026 01:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6C9C19421;
	Sun,  1 Mar 2026 01:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327960;
	bh=KSlzvPMcPdroCRP7Ne2TmImOphnHGVDI27z0Kahl+9A=;
	h=From:To:Cc:Subject:Date:From;
	b=ggc64fzMGsuekE/SfKhDa/bqLNNTNq9trPciRySyaTnuxcQYhJLWq9hxg2AP/5ZvH
	 3GU1I1l1eURupXzgzT7khO1kMUxLuifQfwVyx8ks/bgRIMAhdFvu5JCeIz9kd5kQ/6
	 VAzwHMJx5KY83JZRqJRJa5BmNEMFm78SAOyenxEAmzWUsw3gOtBuXj6QgEq6cHsp+p
	 /22ooXH/gSY3pjbi40YpJZ8/t1P4XssupEZudH3sOJeZAH+uGi4YpABHkX/tZScGcN
	 kIoIxWEWEf5D4q9l2rryF1KF778MSw8VGQ4tiiRQ94dnqbHut4eU88BJ0AcgSp3JYf
	 cxmmYBbUt176g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix error handling in probe function" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:17 -0500
Message-ID: <20260301011918.1674237-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_171920_744410_F4AC9FB2 
X-CRM114-Status: GOOD (  14.29  )
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 8a8a3232abac5b972058a5f2cb3e33199d2a8648 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <haoxiang_li2024@163.com>
Date: Wed, 8 Oct 2025 16:55:03 +0800
Subject: [PATCH] media: mtk-mdp: Fix error handling in probe function

Add mtk_mdp_unregister_m2m_device() on the error handling path to prevent
resource leak.

Add check for the return value of vpu_get_plat_device() to prevent null
pointer dereference. And vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put() to
prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/mediatek/mdp/mtk_mdp_core.c   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0e..f78fa30f18648 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -194,11 +194,17 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
+	if (!mdp->vpu_dev) {
+		dev_err(&pdev->dev, "Failed to get vpu device\n");
+		ret = -ENODEV;
+		goto err_vpu_get_dev;
+	}
+
 	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +212,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +220,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_reg_handler:
+	platform_device_put(mdp->vpu_dev);
+
+err_vpu_get_dev:
+	mtk_mdp_unregister_m2m_device(mdp);
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.51.0





