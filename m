Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF8FC02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 02:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Yfw3YYmQ42RTILNlusHnxgsov7m4pIrTmZuZQJm8vg=; b=rVvqEPC2pp0kVk11+AoKfovDa/
	Kh17MTy+ENvmgCFUajNJLeyEUIEk5Re5O4CN2TAawQeXB1JbSD5JAfO/PlEQgLYNBYlbrv+6ECFHt
	8SoYNCFL3obVQgOyicS7ZaLV5L2x+rD/5+h3YlbJDubmWqDLU6MHWD5ljKORgvkTP7GRhBb6Z7sRr
	lg4wNhgSxbYFT+ocRGCl6NA6lXl/9Cw2wwSQU2XWDSXQNc8KkT1f2HkQFlFijJeUbaKgNIpqFttfj
	zBJezQmRX3C71pdksN3Q5yPvVMq0SUYlcB7+gIIClocesSadGrxhLzTR3DbENmKDHM4QeHi66ipOY
	L8ahrgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfV2g-000000027cS-1aBo;
	Wed, 05 Feb 2025 02:21:30 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfUzy-000000027Dr-1cV5;
	Wed, 05 Feb 2025 02:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=+Yfw3YYmQ42RTILNlusHnxgsov7m4pIrTmZuZQJm8vg=; b=hxBgZqX2iUarOki1
	7a8QWu65p+dX7+GDq0vp/w+ZILVpp2qBdA4nku4KqP6VOUBSh25RpghyzVjLwthCB6wnX0IfLOaZZ
	Tb7v46rnlaxD3Zkj06Tl36F9Z4m7cGRWkHlYLPMH9wCcc5H46+A30QxA9MGrb4ACZcL3/2b5hPKT1
	CQ5Lbt12GaQAnS8zifoKCZabue0jwxQ1CGhT882CaG7MMhlJuur1tYXiaCNl0VrOW828L4F1BpRr1
	1nW4O+bfn4qJiZZpSNkUA1jv2YvvqGR+mldSsH7DlFWMKkIeJNqVu9i+ixJdbsIqVeWhT0EMEQ/Qp
	MP9g3vWWbjQYHSaeRw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tfUzr-00De3m-20;
	Wed, 05 Feb 2025 02:18:35 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: platform: mtk-mdp3: Remove unused mdp_get_plat_device
Date: Wed,  5 Feb 2025 02:18:34 +0000
Message-ID: <20250205021834.497105-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_181842_469164_470C4F5C 
X-CRM114-Status: UNSURE (   9.36  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mdp_get_plat_device() was added in 2022 as part of
commit 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3
driver")
but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  2 --
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 19 -------------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
index 935ae9825728..222611e03a06 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
@@ -12,8 +12,6 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include "mtk-img-ipi.h"
 
-struct platform_device *mdp_get_plat_device(struct platform_device *pdev);
-
 struct mdp_cmdq_param {
 	struct img_config *config;
 	struct img_ipi_frameparam *param;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f571f561f070..8de2c8e4d333 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -79,25 +79,6 @@ static struct platform_device *__get_pdev_by_id(struct platform_device *pdev,
 	return mdp_pdev;
 }
 
-struct platform_device *mdp_get_plat_device(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *mdp_node;
-	struct platform_device *mdp_pdev;
-
-	mdp_node = of_parse_phandle(dev->of_node, MDP_PHANDLE_NAME, 0);
-	if (!mdp_node) {
-		dev_err(dev, "can't get node %s\n", MDP_PHANDLE_NAME);
-		return NULL;
-	}
-
-	mdp_pdev = of_find_device_by_node(mdp_node);
-	of_node_put(mdp_node);
-
-	return mdp_pdev;
-}
-EXPORT_SYMBOL_GPL(mdp_get_plat_device);
-
 int mdp_vpu_get_locked(struct mdp_dev *mdp)
 {
 	int ret = 0;
-- 
2.48.1


