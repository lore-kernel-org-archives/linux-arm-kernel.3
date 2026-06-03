Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A62ACD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjBO95xDSmLrp4JNHx4KMhFqFrLuEXxwuA67QFALbhc=; b=n+djL653KfVz9AjPA4PiJjDbqL
	SyBgg9OM4znYGSa/Op+64jWRL7n2I8NUiPe1widR2ThFUgozQiNkRpcqecw4npJUpiFzuCXvvR7k5
	nYMlW39t/oEUa2rDB3H6y/KiwN6yVnYl8t6xKBXJ8pqGnn6tis6xGAdALb++fZqPopC/FBHeOEk/O
	UjkT9AHUixjJhV9uO3AUuVfLHs+OqlCW1/oeF2Q4qBTZQn09Dm3XPhLfFI+xDYvw124xMh4f4AtZw
	snX7O0XNyC4R8zHpn+jVPfYlleH8TcE4SipmDY5rcTN8KHwFABl5J17Yrmi8ru5vF82cYGUXp4w6S
	TpOkpXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNP-0000000FNGs-1BzC;
	Wed, 03 Jun 2026 15:19:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN9-0000000FMwd-0piT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MjBO95xDSmLrp4JNHx4KMhFqFrLuEXxwuA67QFALbhc=; b=ZFKjELxbOfwncHSdp9gz0c2YN4
	7tjSrHz5fpnL7ErTgz8m9F4afk8cgcAfUov1AYxVNajMhKw2b8Sjqc+aODD5LYUDGI1y0VxhVsH1t
	2g4SJZ8H4RHqoljxuyEzB+JvEO0So2dSgtYnKqDygZU4p54+QiTElavilPs+C68qILT1OaHI0pE4a
	ufwWU1QrK67T5K3fNMWZSCLC0PYafNfjBAV0+a4HcG4KfzbL+WFMLB+ROx3QxpmukcZPF5bOzrXB7
	xXtZYJMXzbP5ArAfRhqtdeR34aOoqON+tcLbjFoE6JKVuWbSutCnk5Thjk3bTf7cplPqbizGOjR8V
	XnawGg2w==;
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN5-000000045kG-0mt5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499939; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=MjBO95xDSmLrp4JNHx4KMhFqFrLuEXxwuA67QFALbhc=;
	b=R8Owicpc8mgsg/lriAfy1dQYAuR4cA7Z6ZHdp6yfeBXa7edr1kYSWDDAAmYRioNnonc8UM5bVPOjtfIzVaogjBLhPmLbLHz0twlhGWT6YKdpRg0ByFf9a27Phf0DJW34CSaZK8sxcZJ8O47mPbV/2KxxoS+neFLzyFFKAP7gz78=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR5K_1780499937;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR5K_1780499937 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:57 +0800
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
Subject: [PATCH v3 19/32] iommu/sprd: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:51 +0800
Message-ID: <20260603151804.1963871-20-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161908_012344_BD0A79E2 
X-CRM114-Status: UNSURE (   8.93  )
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

Implement iova_to_phys_length for Spreadtrum IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/sprd-iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index c1a34445d244..3c04ec040d96 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -366,8 +366,9 @@ static void sprd_iommu_sync(struct iommu_domain *domain,
 	sprd_iommu_sync_map(domain, 0, 0);
 }
 
-static phys_addr_t sprd_iommu_iova_to_phys(struct iommu_domain *domain,
-					   dma_addr_t iova)
+static phys_addr_t sprd_iommu_iova_to_phys_length(struct iommu_domain *domain,
+						  dma_addr_t iova,
+						  size_t *mapped_length)
 {
 	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
 	unsigned long flags;
@@ -376,13 +377,19 @@ static phys_addr_t sprd_iommu_iova_to_phys(struct iommu_domain *domain,
 	unsigned long end = domain->geometry.aperture_end;
 
 	if (WARN_ON(iova < start || iova > end))
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	spin_lock_irqsave(&dom->pgtlock, flags);
 	pa = *(dom->pgt_va + ((iova - start) >> SPRD_IOMMU_PAGE_SHIFT));
-	pa = (pa << SPRD_IOMMU_PAGE_SHIFT) + ((iova - start) & (SPRD_IOMMU_PAGE_SIZE - 1));
 	spin_unlock_irqrestore(&dom->pgtlock, flags);
 
+	if (!pa)
+		return PHYS_ADDR_MAX;
+
+	pa = (pa << SPRD_IOMMU_PAGE_SHIFT) + ((iova - start) & (SPRD_IOMMU_PAGE_SIZE - 1));
+	if (mapped_length)
+		*mapped_length = SPRD_IOMMU_PAGE_SIZE;
+
 	return pa;
 }
 
@@ -420,7 +427,7 @@ static const struct iommu_ops sprd_iommu_ops = {
 		.unmap_pages	= sprd_iommu_unmap,
 		.iotlb_sync_map	= sprd_iommu_sync_map,
 		.iotlb_sync	= sprd_iommu_sync,
-		.iova_to_phys	= sprd_iommu_iova_to_phys,
+		.iova_to_phys_length	= sprd_iommu_iova_to_phys_length,
 		.free		= sprd_iommu_domain_free,
 	}
 };
-- 
2.43.7


