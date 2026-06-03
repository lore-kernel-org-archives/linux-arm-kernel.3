Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A047ACD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5zQjIPVfFmKstwwMGABYtO3/c5KzR7s9T/A9BdluRs=; b=u6Dgt2S/G7d2+Y7P8aRz8ysIhE
	5qrqC4hnucSjcpL/4kZVf1y9v3WNfLHDAOrvxtuiB90N4uWTZtPQEsvz+X1LB5kVeDRkzBikABDiZ
	zXlNn5V1RHB0DCWagj94GimfwSIIIw+PYqA2Ol4meLxe3kOINBC2TU80lwEMsxU+E/nrHF4dff+Fi
	xDxo0wMhrzjx7qSbI/Pddfzyo/rGyLNTAdXPNDI6DM9O+0Y61+CyVv67Q8LYn56JlxwmgJZfVXw94
	URYnm7EnnszlisX5EzUZA5y55b49TBiknd3P/3EnGg3LBibZ8vd/UopziRt1xeUokVJ6givfqKlMH
	MQL0qFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNP-0000000FNHk-1rGR;
	Wed, 03 Jun 2026 15:19:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN9-0000000FMx8-34xB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M5zQjIPVfFmKstwwMGABYtO3/c5KzR7s9T/A9BdluRs=; b=HPZ8Ln6nkrUgBBiu9R+9K8tql+
	2oeL5zjfPmhDAb2/lGM14te9xN4FstywPZFjCH88hYc0rFk0mytkygVl74Q57CpjfRyZyrENTkpf3
	aAw17rlqGgs3VZBmGWnikrAw7oo122xCsLVydeqpJK2EKLnHpZvgcNidhJkE8cgNRJkKcPEm3qVQL
	wSXpJefJ9Cqg2m0H456sVeMvHT3gFtg5aoBD5+GsskmbBnbdnuF7A6ueUigZhs9/HKhBQBzuf7YbS
	jYNY9Z/Bl34EvZ/2vIJWj4CbE6993jPhB6+8xNfPefUbUhxqF3sxwEB90ETl3n36NaBq3f6x8UJgu
	HCJAImfQ==;
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN5-000000045di-2W0e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499930; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=M5zQjIPVfFmKstwwMGABYtO3/c5KzR7s9T/A9BdluRs=;
	b=yCqaIobteWxWpR5vVYWr78f/MFpxE4a7kmm8tIt7ZaQ2XAdg4xyDgMgppoLWtFDP18d2/xDwmdudzBil09hMRcUZs6BrE3iMVavuu6bV+TspBMt7AMqj3oHpxyo6/AcThEm40ugKTfMEkBZPGtJ91T414abeLPKvQZJQdxKzErc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR30_1780499928;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR30_1780499928 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:48 +0800
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
Subject: [PATCH v3 10/32] iommu/ipmmu-vmsa: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:42 +0800
Message-ID: <20260603151804.1963871-11-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161908_424636_E57D52C9 
X-CRM114-Status: UNSURE (   8.37  )
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

Migrate IPMMU-VMSA to implement iova_to_phys_length, passing through
mapped_length from io-pgtable.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/ipmmu-vmsa.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9386b752dea2..6e2e5922ab1b 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -699,14 +699,16 @@ static void ipmmu_iotlb_sync(struct iommu_domain *io_domain,
 	ipmmu_flush_iotlb_all(io_domain);
 }
 
-static phys_addr_t ipmmu_iova_to_phys(struct iommu_domain *io_domain,
-				      dma_addr_t iova)
+static phys_addr_t ipmmu_iova_to_phys_length(struct iommu_domain *io_domain,
+				      dma_addr_t iova, size_t *mapped_length)
 {
 	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
 
+
 	/* TODO: Is locking needed ? */
 
-	return domain->iop->iova_to_phys(domain->iop, iova);
+	return domain->iop->iova_to_phys_length(domain->iop, iova,
+						mapped_length);
 }
 
 static int ipmmu_init_platform_device(struct device *dev,
@@ -892,7 +894,7 @@ static const struct iommu_ops ipmmu_ops = {
 		.unmap_pages	= ipmmu_unmap,
 		.flush_iotlb_all = ipmmu_flush_iotlb_all,
 		.iotlb_sync	= ipmmu_iotlb_sync,
-		.iova_to_phys	= ipmmu_iova_to_phys,
+		.iova_to_phys_length = ipmmu_iova_to_phys_length,
 		.free		= ipmmu_domain_free,
 	}
 };
-- 
2.43.7


