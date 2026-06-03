Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97172CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cII6ny8ml7CMYCax7iOr5Pt8lHtm5RFG7dKDlrestlY=; b=0wRzO7NkWtgyG9VxFm2WRXt7lB
	K57PJz3jwF15VrAghVaJnAgg4LoKB0EkY3dpqGMhCjs28UXr0XHZ/kfoYNNNmjR3EUUKmC6IanVKZ
	fqpUzg+pTjhVtfJbmc/7fqsCr/5sjzAHgpFw7hBn1W3oaMMA/h7WbAALFXOpCvdYf19vsF9g8qTZL
	PwEFjrOtHFU1HWeI7ZKwJsLxARq5/K4gKVX914Pn0BPG8mUSnCxwVggnKHekRvKtu/KPuQRK2wkW/
	6+XU6+DYMee2HQ4C0BETC8YMkhLxZ4Py2dpWQDxwhL4HV2RlJpV9qZQ8tjpxVR/pQ1K0YG3ITzGqE
	1o/XSaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNU-0000000FNU3-0u1c;
	Wed, 03 Jun 2026 15:19:32 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNI-0000000FN6A-09fs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cII6ny8ml7CMYCax7iOr5Pt8lHtm5RFG7dKDlrestlY=; b=fad2P0BY7KRZv8/nfEBC1rFDod
	gx0fEbcQ/GEBkv50fQFnw41gzEauVk2XORD5tUsa4jv0aPaiVV6YW1R/tsAxgM32o6XNLT/4cbJV4
	SYdkCDXVoCawu6nIMYZ3xg3HLl2bUys+T2SoR8J2yiMxkzVIcb7kOLJPBVT1p1Vant2EYQta844G1
	psWEIQv6Bc0nJcXQ3+wVBMjzV9mywsbrGnxLcDbPTV/CC855wN35IphNe1S0RIpztj9/e1BRWQQlc
	hpCoLOxxupFO7OfWkdhjbGAqjJ/zk04Ck0cFyG+8UT6aLLmfD4Pxv1eUluPP58Sk2/pegBgMvDnmB
	hEUWDUDw==;
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnNE-0000000CXrC-44Zq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499950; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cII6ny8ml7CMYCax7iOr5Pt8lHtm5RFG7dKDlrestlY=;
	b=TsA8LpKibZb/TSwbrTvQjGRKXM5oM+DD9b51NS57nHXjVcMHIrgpmmxak17/cXkfTH6X7I1YDrtiKvKGhn4rNbmbH7oY8H25srf3sTPg9N+y+rkG4SP9FHDMTZlC8C8WYvW8HhNgHvYJlNXwnt/QuyOljIUvWqfHCLd6o3Nxht0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR87_1780499947;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR87_1780499947 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:19:07 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: jgg@ziepe.ca
Cc: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	alikernel-developer@linux.alibaba.com,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oliver.yang@linux.alibaba.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com,
	suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de,
	wei.guo.simon@linux.alibaba.com,
	will@kernel.org,
	xlpang@linux.alibaba.com
Subject: [PATCH v3 29/32] iommu/io-pgtable-arm: remove deprecated iova_to_phys wrapper
Date: Wed,  3 Jun 2026 23:18:01 +0800
Message-ID: <20260603151804.1963871-30-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161917_424863_A903DBA8 
X-CRM114-Status: UNSURE (   6.44  )
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

Remove the iova_to_phys wrapper function and .iova_to_phys assignment
from ARM LPAE io-pgtable, as all callers now use iova_to_phys_length.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-arm.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index f33a86fa0f6c..55a32346b586 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -731,18 +731,6 @@ static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
 	return 0;
 }
 
-static phys_addr_t arm_lpae_iova_to_phys_length(struct io_pgtable_ops *ops,
-						 unsigned long iova,
-						 size_t *mapped_length);
-
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
-{
-	phys_addr_t phys = arm_lpae_iova_to_phys_length(ops, iova, NULL);
-
-	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
-}
-
 static phys_addr_t arm_lpae_iova_to_phys_length(struct io_pgtable_ops *ops,
 						 unsigned long iova,
 						 size_t *mapped_length)
@@ -965,7 +953,6 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map_pages	= arm_lpae_map_pages,
 		.unmap_pages	= arm_lpae_unmap_pages,
-		.iova_to_phys	= arm_lpae_iova_to_phys,
 		.iova_to_phys_length	= arm_lpae_iova_to_phys_length,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
 		.pgtable_walk	= arm_lpae_pgtable_walk,
-- 
2.43.7


