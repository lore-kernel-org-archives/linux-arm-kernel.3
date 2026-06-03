Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94347CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBewM6jbUcaBlyhsOXQ6v/pv4THYWRhxq86SYYNYvAU=; b=Xkul882JcWIn2mdJNfQIu3cFjm
	zAO/BUqGFPhLwqMHPH83q8VFyMwIS4hM/88yaREJ/TQpCJte0kB6dBo/5DLtT1P/3m4fk4MIU3EUP
	kcrPB4YnzAb0HKAXxTK/ggDyHilkOrZeZHgTC00pShhrlJXfRX85GhbPdHdl6zyoNdXFd0I9jSa1F
	/tsRpO0Q2b5W0Sc531Ipet1vuJGaBpSWmUE/dM+mjQ6aeQ0IiADG3Sh3q//hPKbz1O7Gsd6QNZzxF
	42Q6F6TA8uh9Lk+s4F1+1HY0IAbU6CXpfdIz7j6VvDC3WsGndkq2nEAuw3Ex4nWYWrpw3x3xWqhx6
	jh2uqv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN2-0000000FMnq-31WU;
	Wed, 03 Jun 2026 15:19:04 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMz-0000000FMk8-3pqZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HBewM6jbUcaBlyhsOXQ6v/pv4THYWRhxq86SYYNYvAU=; b=j5dXkIC5Fg5RofOXvGpZcFpCA1
	jWtDKSVlftEKfp+Py5JDykJerCmTmlzazrZTrYXiBV/bxBJXFL3You/jZK12WzNxUatu7g59QWTLy
	7rKWIzwvA/gLgB4XNuDodP+fVs5ApW52Uw2FoI1z3ih9IN0EodObU4HM6dps2a9+NEpxhNXAWJBEH
	YbN7IE2CrQfDgz7NkpK8ZQiwo4i6KzyP2DxDzayESrP/Dr0RrsFz9rEpTsslZDt/jxY4P9jsrTIC2
	jt8KIDgCd/qlFuOTeSwjWzfhdgIfzt67OvUqQhHA94+ONKsOwImA1/G6WSXV52Pb/crSS4Fy7/7WT
	YBNK7d/A==;
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnMu-0000000CXbx-01YD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499927; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=HBewM6jbUcaBlyhsOXQ6v/pv4THYWRhxq86SYYNYvAU=;
	b=sZ0ZsR/QQEXrIKLHQn8XatIOPzUQN6YRpK64beHZpWlM6iVexask1BLcIWdhF89orN5NJaHQdsT1YtamKhCEGPxNl/kYO05Tiux4rLr24afC/wOHB/1s9wbam9bgghTSnT6uubpausbpn2JWYsw2ciZzgSP4gMrCM7Uf61WgWaY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R571e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR2R_1780499925;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR2R_1780499925 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:45 +0800
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
Subject: [PATCH v3 07/32] iommu/arm-smmu: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:39 +0800
Message-ID: <20260603151804.1963871-8-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161856_444207_55CD6620 
X-CRM114-Status: GOOD (  10.31  )
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

Migrate ARM SMMU to implement iova_to_phys_length, calling
ops->iova_to_phys_length on the io-pgtable layer. Update qcom-debug
caller accordingly.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 65e0ef6539fe..4fd01341157f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -415,7 +415,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 		return IRQ_HANDLED;
 	}
 
-	phys_soft = ops->iova_to_phys(ops, cfi.iova);
+	phys_soft = ops->iova_to_phys_length(ops, cfi.iova, NULL);
 
 	tmp = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 				 cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3..5c9ec7c93763 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1366,7 +1366,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 			"iova to phys timed out on %pad. Falling back to software table walk.\n",
 			&iova);
 		arm_smmu_rpm_put(smmu);
-		return ops->iova_to_phys(ops, iova);
+		return ops->iova_to_phys_length(ops, iova, NULL);
 	}
 
 	phys = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_PAR);
@@ -1384,20 +1384,21 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 	return addr;
 }
 
-static phys_addr_t arm_smmu_iova_to_phys(struct iommu_domain *domain,
-					dma_addr_t iova)
+static phys_addr_t arm_smmu_iova_to_phys_length(struct iommu_domain *domain,
+					dma_addr_t iova, size_t *mapped_length)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
 
+
 	if (!ops)
-		return 0;
+		return PHYS_ADDR_MAX;
 
 	if (smmu_domain->smmu->features & ARM_SMMU_FEAT_TRANS_OPS &&
 			smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
 		return arm_smmu_iova_to_phys_hard(domain, iova);
 
-	return ops->iova_to_phys(ops, iova);
+	return ops->iova_to_phys_length(ops, iova, mapped_length);
 }
 
 static bool arm_smmu_capable(struct device *dev, enum iommu_cap cap)
@@ -1652,7 +1653,7 @@ static const struct iommu_ops arm_smmu_ops = {
 		.unmap_pages		= arm_smmu_unmap_pages,
 		.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 		.iotlb_sync		= arm_smmu_iotlb_sync,
-		.iova_to_phys		= arm_smmu_iova_to_phys,
+		.iova_to_phys_length	= arm_smmu_iova_to_phys_length,
 		.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
 		.free			= arm_smmu_domain_free,
 	}
-- 
2.43.7


