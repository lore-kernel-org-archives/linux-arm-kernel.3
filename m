Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F7AFD0049
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 01:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8Trzem/9eAa12Dr2yVKCWeE7WHg5H40aGbdkzbgUNA=; b=E7bh2McVS475sN0U86B9b35w9Y
	bn3tvNHo7WW+6BKQuHW1sWD9OJpqIbnG/Z1fj3KKgPP8Fxiu5/eYPiXm4BCcXfHyfkjLR4UKGh66C
	iPpTfi9M3kKwzlpqe3mKHa7JIP+4iyktLzRMSKqD6oZupU8kPVJ3OlFen7oIlWXmYBrUemoT/EEBm
	wBIDwsH3uMPeLW+uWZOvuceRSHK6vZg/A4/NVVAXz85g4E02KVIVqCFF2qhHnHRYH3qsCRGFJGoij
	yPi97j/0meMxqFJERU24KlbnUqrs6SdnfUr5RbSd4rBs2WqfdUO7x2dGEm59VFI4PEvgdLQv+9apM
	cfurC0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSp-0000000ATMJ-0CqI;
	Sun, 01 Mar 2026 01:19:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVSm-0000000ATJB-0DIX;
	Sun, 01 Mar 2026 01:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77B6D60008;
	Sun,  1 Mar 2026 01:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F7CC19421;
	Sun,  1 Mar 2026 01:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327955;
	bh=QygN+tm7vRSe8PUAkQZiS9VT5srWgie0sJ/PkT7UXz8=;
	h=From:To:Cc:Subject:Date:From;
	b=EDQeAipZHndMtgd90fWDOyId6frQBTscRZEFh6A78uPpi7a3rmND4mJHkY70RLr++
	 6dZLn4y7ydRCM80nW8PVk/gtEp3RPF3jqbOoG3t4N5CRym37T8C8/VDWbwO90+n7tB
	 EiVfdXPIGUlFWYehbUL/Vx0HFy6hx+P9ox4hx5fID0SGwlIxlHM/Kz8W8BO90LZKdW
	 WDBKgZzLaI/DC1FkQfTqk2BU2Drir4pdSkjNkbbonKoSg31GRctQIt8cpXgfS4enzD
	 +QindDpm/wsfmquXgEGKTbvPAdrhqnfB1RpeTpILTNtZkeq+3jWdi1VomCTCxdRHqx
	 +UdJrxWCKh5cQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:13 -0500
Message-ID: <20260301011913.1674123-1-sashal@kernel.org>
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

The patch below does not apply to the 6.12-stable tree.
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





