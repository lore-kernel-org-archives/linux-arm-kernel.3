Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFA2CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcsOo7dw5sdNA6iXB9cRPtTm3pD/GHhp+yw7Xs1Vz68=; b=A6x5VjAUDKF5cxdQLz6RNuNV7f
	Idye77IHVH0LtG/3Dyr+3lEW5d+kz5N3dh/oAGkohdt/uwTXsVvbXjHPa2N2l1WD/P0+YZqwLBnnd
	GVBsexpZ6l+4xMl15Dl0p+uBI9lbawPXWbBeU9j49ve25HOx/Ph0W3vIP+fpsGlvVI/yeGZ2cB+7Q
	izOpyU0ItgUGBsnjaVRJ44Iu3vRB6j83iQ8mZ0s1mZBvdJvngkkCjp0Y5DYWATpmEMrrJBBkuvfF6
	VeXiur0Uz5S+pdzKoeuUCQd0iLSPzgvo/ym2WKTnvi/1fOJa7F1JwAELIVm8ecLt1pontU6ZFWnHn
	AW+T289A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGBd-00000000knA-2nsD;
	Tue, 19 May 2026 08:52:25 +0000
Received: from cvsmtppost103.wmail.worksmobile.com ([125.209.209.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGBY-00000000kkW-0lnW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1779180736;
	bh=3J3/AwLUzcB/WAmYB4Pu04ubxpDRmRuvWzYDYU6hi4w=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=pc8gq95Ei6M/SfaFHM0c1Sclu2nIjeDVDHTG1k/Y6wCzUnFuieCBn2GaqDMuwtDi9
	 rIDv6tjD+EM9hrHWEYx5LkkfCint3eZ7JdUnE9T4wHJzbRrL6X63+pwUG7FFuYPG5x
	 OKLpZbxB78aBk2TDrRcCyBgNUz+3Bq9Etuxsp1Ds9GwFhNFwiU//B9gaWuvoE13cHv
	 Fouv5pzgGxI3MGptXKxPKs8mouIDfIFnmCZgNWJG8glIa1jZea27S2NGHSkD3eQIVt
	 2Mva6yOkDFRzucZFfuUMEl0YlAfQKnm+EkhNpjywo9MFg0sxoF6GIuseYIbIQgP/O4
	 OQ4cxpz6s7o7w==
X-Originating-IP: 163.152.163.130
Received: from cvsendbo001.wmail ([10.113.20.163])
  by cvsmtppost103.wmail.worksmobile.com with ESMTP id NcBvveBoTCOT0XTIuR5KDQ
  for <linux-arm-kernel@lists.infradead.org>;
  Tue, 19 May 2026 08:52:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1779180736;
	bh=3J3/AwLUzcB/WAmYB4Pu04ubxpDRmRuvWzYDYU6hi4w=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Mz4SsVqeAC2FlRYWh8KoKesSAjcMuqNldi9mznSvNtKJH6SI68VHfYJoBNnUv8JdT
	 85LHNq4EZ1Y1uDeWqo1neSy1rYMlhJNOl0gvJLAETCiQkOcN+XAAC33cEGUOskZ5gk
	 rz90XUGaJws/7qYtS2+9qNdp5Ox6hW3iMI++ilhM=
X-Session-ID: B92UEe-9TvuyppjR03krVw
X-Originating-IP: 163.152.163.130
X-Works-Send-Opt: 3lYwjAIYjHmXFoEXKBmwaAErKqpYjHmm
X-Works-Smtp-Source: edKdKxvXFqJZ+HmrKqK/+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp403.gwmail.worksmobile.com with ESMTP id B92UEe-9TvuyppjR03krVw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 19 May 2026 08:52:16 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mt76: Drop unneeded mt76_register_debugfs_fops() return checks
Date: Tue, 19 May 2026 17:52:14 +0900
Message-Id: <20260519085214.164846-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514193243.2518979-1-ingyujang25@korea.ac.kr>
References: <20260514193243.2518979-1-ingyujang25@korea.ac.kr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_015220_728990_FE96F02B 
X-CRM114-Status: GOOD (  10.92  )
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

mt76_register_debugfs_fops() returns the dentry from
debugfs_create_dir(), which yields an error pointer on failure
(notably ERR_PTR(-ENODEV) when CONFIG_DEBUG_FS=n), never NULL. Per
commit ff9fb72bc077 ("debugfs: return error values, not NULL"),
callers do not need to check the return value.

Drop the dead !dir checks in mt7615/mt7915/mt7921/mt7925/mt7996
_init_debugfs(). Converting them to IS_ERR() instead would have
exposed a probe abort on CONFIG_DEBUG_FS=n, since each
*_init_debugfs() caller propagates the helper's return value.

This patch supersedes an earlier proposal that converted the checks
to IS_ERR().

Link: https://lore.kernel.org/all/20260514193243.2518979-1-ingyujang25@korea.ac.kr
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---

 drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c | 2 --
 5 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 0f7b20152279c..6a1475e3c8999 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -550,8 +550,6 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, &fops_regval);
-	if (!dir)
-		return -ENOMEM;
 
 	if (is_mt7615(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues", dir,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 26ed3745af43e..4d0854fe785bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -1296,8 +1296,7 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(phy->mt76, NULL);
-	if (!dir)
-		return -ENOMEM;
+
 	debugfs_create_file("muru_debug", 0600, dir, dev, &fops_muru_debug);
 	debugfs_create_file("muru_stats", 0400, dir, phy,
 			    &mt7915_muru_stats_fops);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 4333005b3ad95..a5a70d8e8544a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -266,8 +266,6 @@ int mt7921_init_debugfs(struct mt792x_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, &fops_regval);
-	if (!dir)
-		return -ENOMEM;
 
 	if (mt76_is_mmio(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues",
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index e2498659c884e..d01ff49de47af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -291,8 +291,6 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, &fops_regval);
-	if (!dir)
-		return -ENOMEM;
 
 	if (mt76_is_mmio(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues",
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 76d623b2cafb4..327fc2032c8da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -856,8 +856,6 @@ int mt7996_init_debugfs(struct mt7996_dev *dev)
 	struct dentry *dir;
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, NULL);
-	if (!dir)
-		return -ENOMEM;
 
 	debugfs_create_file("hw-queues", 0400, dir, dev,
 			    &mt7996_hw_queues_fops);
-- 
2.34.1


