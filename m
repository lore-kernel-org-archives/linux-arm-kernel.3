Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E8BC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XavhzQr4VzmWd4Gut7X0rOtPYvCGyPMIEIKU9C9TmK0=; b=AIT0qrs05E63xtndVQwm9GsG8U
	ITcbvfBUhUohlB+02ftLYKdQ53UNHSb3KFwTBHH6Cvx0iYwHmZStbdouYF5d64DirC58LlEzYsRdb
	cNKW7xXn6/Zdcodqqp91wSk1TsMuFMuxveQuA6x6jGP0XSj5XcnIUFls+WZmVGQO+EvuaEOUrU1PD
	2f0OqPpHv/5KfKtx9GxTD7WOPKA8SScNQpUgxBvk66LhLvKuKYYJZanHYt1hjz3IAMsMhxDvEc+bG
	dSyrCmC9LCY2tgbTU1blsvcZ5JnHyqTQoA91/mV1GQYUo/puHh5gyGzi7YLhjPcOUZ89LCE0VaVHC
	ROXLEVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cz8-000000022NT-3HQA;
	Mon, 21 Sep 2026 12:19:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cz8-000000022N4-13Yp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XavhzQr4VzmWd4Gut7X0rOtPYvCGyPMIEIKU9C9TmK0=; b=EuZX4lfFWONxPAacRNFjWAjDoJ
	EVdhajX3Bd9RPTdAgyEdUbz9W0YgnUL/uQ9bAFVsGJ+ftGcXNA2s9qIao/CGFxSXK1t4U6Wr6FAyG
	bWtMOepAzDNtc5Cn9ZcqwDs8XYDVtXGcj5WNzPyDFec5EJ02O4pJQf7GW+67yjEE1Ax/A1v2+ulxX
	8Oo9fH4aWhtnQSg78+OqEAlYSxw5k8QmyyRx/QSM8pWn8SQKkSj0hEaB09JzSKEs6OPyKLdkL8R5H
	KGiQEwD2pwz+wOVGeLXIJyzTaBge0Ss8XAAS3egbLlcuoL78SSwuc3hAmYkqzZjBQVGjsf2cWhFw9
	zBwy2Gdw==;
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cz4-00000003s42-094C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1789993130;
	bh=XavhzQr4VzmWd4Gut7X0rOtPYvCGyPMIEIKU9C9TmK0=;
	h=From:To:Cc:Subject:Date;
	b=tdeOfXnPEYv+qF4pusWcP8n2AdvhwANsVoJQkEvtY/bYfTbdwoMQlZbhBBmecaVFo
	 RAD8Sc12JWEJLl0q0XoE643LTEFcQKaYtQNBg20W720fbFN5jx5V/9F81rn/On2zTa
	 cup24uoJXy+fe8fXduVgH351lhSgjiWYUMp5l6qA=
Received: from RE0700.barrietech.com ([183.156.165.242])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 45DB3E18; Mon, 21 Sep 2026 20:17:29 +0800
X-QQ-mid: xmsmtpt1789993049t1yb1seja
Message-ID: <tencent_4392079B5C29406B923C037A7E66DD338005@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X29aUms/wkM2a3TG0IvKdvfY2aRLFDQQl2s8lj9cjBlvjwtb16J
	 KIYuGhAaWx8FZW7rP2C1DFX4lrDvtLuauytgZv25Ficwe+vM2ZSghpJJVXoxSi5bWPa5hennos0C
	 MiCaP/DYKMBdrGy5aXrKZmrabvG+zzNGLe5cr/qfME6QgQYb//isr6OtZ2fTV9JMmVVbZoqr5DO9
	 UxewZUMBlGViwZ7jJ1ZaFlvhs/7V4bV8Qt+DOK38+SClH1JAByUJ3cxuQ+xRY1XvlsmUrTQ3voGf
	 lPwCRx4BzHFbxgP9diF1e2DePgRTvquiirO53MHDrii48KVtcONMQA8WMs5UL396ooL2bDn0ICGd
	 IENHebzaiQyk5Rac0fqnQW/WIP4aeUR84mMK5Xldvn9Vcp6+sSYKydXqCvqEe3CMSEIedSdMHZEH
	 9OpB4HdsD6jWxEy+PxwvYd4mzniHkoXYbt+o2Y+9IbnoxYRLieS9NNPgaEbAS5CwLpVEGpR2DNnr
	 Q5WMo2wqv39+yKC7XoX38x7ezAceVZJfLdzCJ/8HRwEgrBTppd3GIQIrSZ+TQa/FpKam9pFNRUuk
	 NohROcbuSuWkqDh7lu8eufR6z4esQUjET1pmf9K1WpjUk8jIKFHNtS9x+qA71o4ZEMtrw7fmXyAu
	 UTCUPkEyefXB1bzgaQjWsneH0+uZKqYvpGU9ZUwIXZjnFEbf0DfcTC8AG+DqDgcLys9bMlZxJNX9
	 5nYPo0z+fSdoejGh5iY1ZVyP+nZYS8XOXVW3gpYjfPJS9DLK8hoB06dBWrF5HGCcbWiHD2/FordF
	 HwpAB20+Z/cC+xfEMqHz+JNWpY54sYEcLcrObIGBvMxHBUW6mWnrklgkox5m4PuVxHXpLr/CG7YF
	 zGHuuS53itATt1FrKHE6+8mez+G/E13O9NvZqNTr9dZ21t7B3AB6GBLcVWhBo2ELWqRo6KFYJq9n
	 ew3aNqA1jY4mX8lS2KO1DLUM/XvimSTx5bXtW5gR0QkEG08ab7+IO1xq5H7qrHTmmzPIFPzf4Mda
	 69GE/GDCbRBeZO5lwNX27f9rud68Z7N5twfIS/1MnCLBikNmqIum4yH05YLSm7CKYunHfhSeRyEh
	 AlDFSSzUW4SflXa6w=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: zhoumin <teczm@foxmail.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: robin.murphy@arm.com,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	teczm@foxmail.com,
	stable@vger.kernel.org
Subject: [PATCH] iommu/arm-smmu-v3: Skip unlinked duplicate stream nodes on removal
Date: Mon, 21 Sep 2026 20:17:27 +0800
X-OQ-MSGID: <20260921121727.630136-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_131858_554528_B6459455 
X-CRM114-Status: GOOD (  11.15  )
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

A master's firmware stream ID list can contain duplicates, for example
for PCI devices behind an aliasing bridge. arm_smmu_insert_master()
accepts these IDs when the existing stream belongs to the same master,
but does not link the duplicate stream's rb_node into the SID tree.

Both arm_smmu_remove_master() and the insertion error path nevertheless
call rb_erase() for every stream in their respective ranges. Erasing a
zero-initialized, unlinked node can clear the tree root, losing SID to
master mappings for other devices sharing the SMMU and leaving the tree
inconsistent for subsequent operations.

Mark skipped duplicate nodes with RB_CLEAR_NODE() and skip them in both
removal paths. Set the marker after sorting the stream array, since it
contains the node's own address. Keep the stream array and num_streams
unchanged to preserve existing STE, invalidation and single-stream
feature checks.

Fixes: b00d24997a11 ("iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids")
Cc: stable@vger.kernel.org
Signed-off-by: zhoumin <teczm@foxmail.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..2627d496921e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4141,8 +4141,10 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 					->master;
 
 			/* Bridged PCI devices may end up with duplicated IDs */
-			if (existing_master == master)
+			if (existing_master == master) {
+				RB_CLEAR_NODE(&new_stream->node);
 				continue;
+			}
 
 			dev_warn(master->dev,
 				 "Aliasing StreamID 0x%x (from %s) unsupported, expect DMA to be broken\n",
@@ -4154,7 +4156,8 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 
 	if (ret) {
 		for (i--; i >= 0; i--)
-			rb_erase(&master->streams[i].node, &smmu->streams);
+			if (!RB_EMPTY_NODE(&master->streams[i].node))
+				rb_erase(&master->streams[i].node, &smmu->streams);
 		kfree(master->streams);
 		kfree(master->build_invs);
 	}
@@ -4174,7 +4177,8 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 
 	mutex_lock(&smmu->streams_mutex);
 	for (i = 0; i < fwspec->num_ids; i++)
-		rb_erase(&master->streams[i].node, &smmu->streams);
+		if (!RB_EMPTY_NODE(&master->streams[i].node))
+			rb_erase(&master->streams[i].node, &smmu->streams);
 	mutex_unlock(&smmu->streams_mutex);
 
 	kfree(master->streams);
-- 
2.53.0


