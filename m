Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E40E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI/xVfW0NJIG4pabP2PrJlF4/ywCtn5dWW4kgaXryCA=; b=2DIPb99rFhQ22Fi46AJL++/zYl
	2lfU1JvX3nNkQcD6+4klZBRo//4rDgmhItra8UwUJO8prE74eESqHXX1WF0vWXEI+mvOnJn0kddlp
	hvCiPFTkqQhMQm9lg303zmW1rBIFJRqB75BSMnz3yTArrMVcJuJIjnzoCWHc1fJnu1pYOKWp3K8GM
	RBWRZ3/CeqeghV68mZvowIE8VKrp1DaIMWVcYrPRghMR2UkfhEM6hzTBhRf03f12ToraXMPei+YLi
	BN7+33iummhdV3/kqsjTIaZ5En9g/iEOG3RAXQPk26e3BfXDhisXszm0N6kLKjethjWcNp65se8Vd
	wrpt2Rlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoFR-00000001UlT-34zj;
	Thu, 12 Dec 2024 18:49:17 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZh-00000001Jza-0Qmh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:10 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so7203905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026767; x=1734631567; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gI/xVfW0NJIG4pabP2PrJlF4/ywCtn5dWW4kgaXryCA=;
        b=uiPV8KLyr2GscCPvMeUZkl3MFtRvERZ05+UKwtMTHSTQW5R3O4CtzIa4rZe/wXk+Ci
         i8V1C9HagawYcXS7PXxpIkbu3W3e7s9CoKM326vnDbdeaf9O8JvaxrAo+udOKCDC9Z1i
         JNumlThiUN04isabiEYDPY8jLdFQKtoEM3aCOfQ5ODXq1lT5VAZglQIwrtDhovHitVlJ
         FPcwWXPq+rqRwAGNg1WM92czljxD2Dho+n8SUA32rMdgQuHru7qoYl26f4VUeSEy2HaB
         cVXBFhY1nKJ9UbrVfxkZIjLjggO/nJHAgIw02zQXWqgd9WE9ra+7439Q3Bsyu1JtK2Li
         gbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026767; x=1734631567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gI/xVfW0NJIG4pabP2PrJlF4/ywCtn5dWW4kgaXryCA=;
        b=vQc5dlXitSkko+L78WDg3VqeoI8lfFo/aDoXNnWftcBH4NmQOaHhT/vlVycANN9qyC
         Ui5cXUf7+iVPpudWxvTRKCcYKNqa6nIZryQ8xArcdVQQYSkPbklxKoWhLzgpV30JrEn3
         elGZdVapU4qIpDXMyDZvonUG1PsospZLyb/pxRNMDoQVVAkMnRqaXSzCU5EXJk2akiVO
         SAJQWhFTCfYn8ut5FC1TP/6CILpYFpzy4BWWdzDRxKG1TfdJVRp/+fk/PFcS6YepMfG3
         dLoLJ6L2ozWRHOLein5rxSMviUilPnJpL9+WIGbGSbRLxeHNBPtM36e5UKcU9ztUVnlU
         bJrA==
X-Forwarded-Encrypted: i=1; AJvYcCUslAFVOekW2aLff6rMX9kdILVEQ8FCYCjJgMe9GmVJR4jrRw99da6g34/Zrn1k2xRI+guiEjzA1lCNzmlmt5nJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwNafqhESbzu/PauREmPel8ioubH/dngRHN600Sv8SRFtr7GPTf
	4bUjxBHVl5SSdE+T+fU6VWducvkXKMLeY7bmFltMrcgpAqts7N4Lx+TaMgEABMHQU+DBYSASjcM
	kK64/u2qUBQ==
X-Google-Smtp-Source: AGHT+IHQ4cd+c/HRUSDI+U6v3tD80p/r2kIFY0himPqzGsq85TsqDSkq/5V4+Is4wQaH97N2w1ilsWBcofMkbQ==
X-Received: from wmgg16.prod.google.com ([2002:a05:600d:10:b0:434:a7ee:3c40])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19ca:b0:434:f819:251a with SMTP id 5b1f17b1804b1-4362282ab8emr40017385e9.9.1734026767627;
 Thu, 12 Dec 2024 10:06:07 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:04 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-41-smostafa@google.com>
Subject: [RFC PATCH v2 40/58] KVM: arm64: smmu-v3: Add map/unmap pages and iova_to_phys
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100609_143445_E2FFD195 
X-CRM114-Status: GOOD (  21.58  )
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

Add map_pages and iova_to_phys HVC code, which
mainly calls the io-pgtable.

For unmap_pages, we rely on IO_PGTABLE_QUIRK_UNMAP_INVAL, where the
driver first calls unmap_pages which invalidate all the pages as
a typical unmap, issuing all the necessary TLB invalidations.
Then, we will start a page table with 2 callbacks:
- visit_leaf: for each unmapped leaf, it would decrement the refcount
  of the page using __pkvm_host_unuse_dma(), reversing the what IOMMU
  core does in map.
- visit_post_table: this would free any invalidated tables as they
  wouldn't be freed because of the quirk.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 147 ++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index ec3f8d9749d3..1821a3420a4d 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -808,15 +808,74 @@ static const struct iommu_flush_ops smmu_tlb_ops = {
 	.tlb_add_page	= smmu_tlb_add_page,
 };
 
+static void smmu_unmap_visit_leaf(phys_addr_t addr, size_t size,
+				  struct io_pgtable_walk_common *data,
+				  void *wd)
+{
+	u64 *ptep = wd;
+
+	WARN_ON(__pkvm_host_unuse_dma(addr, size));
+	*ptep = 0;
+}
+
+/*
+ * On unmap with the IO_PGTABLE_QUIRK_UNMAP_INVAL, unmap doesn't clear
+ * or free any tables, so after the unmap walk the table and on the post
+ * walk we free invalid tables.
+ * One caveat, is that a table can be unmapped while it points to other
+ * tables which would be valid, and we would need to free those also.
+ * The simples solution is to look at the walk PTE info and if any of
+ * the parents is invalid it means that this table also needs to freed.
+ */
+static void smmu_unmap_visit_post_table(struct arm_lpae_io_pgtable_walk_data *walk_data,
+					arm_lpae_iopte *ptep, int lvl)
+{
+	struct arm_lpae_io_pgtable *data = walk_data->cookie;
+	size_t table_size;
+	int i;
+	bool invalid = false;
+
+	if (lvl == data->start_level)
+		table_size = ARM_LPAE_PGD_SIZE(data);
+	else
+		table_size = ARM_LPAE_GRANULE(data);
+
+	for (i = 0 ; i <= lvl ; ++i)
+		invalid |= !iopte_valid(walk_data->ptes[lvl]);
+
+	if (!invalid)
+		return;
+
+	__arm_lpae_free_pages(ptep, table_size, &data->iop.cfg, data->iop.cookie);
+	*ptep = 0;
+}
+
 static void smmu_iotlb_sync(struct kvm_hyp_iommu_domain *domain,
 			    struct iommu_iotlb_gather *gather)
 {
 	size_t size;
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+	struct io_pgtable *pgtable = smmu_domain->pgtable;
+	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(pgtable);
+	struct arm_lpae_io_pgtable_walk_data wd = {
+		.cookie = data,
+		.visit_post_table = smmu_unmap_visit_post_table,
+	};
+	struct io_pgtable_walk_common walk_data = {
+		.visit_leaf = smmu_unmap_visit_leaf,
+		.data = &wd,
+	};
 
 	if (!gather->pgsize)
 		return;
 	size = gather->end - gather->start + 1;
 	smmu_tlb_inv_range(domain, gather->start, size,  gather->pgsize, true);
+
+	/*
+	 * Now decrement the refcount of unmapped pages thanks to
+	 * IO_PGTABLE_QUIRK_UNMAP_INVAL
+	 */
+	pgtable->ops.pgtable_walk(&pgtable->ops, gather->start, size, &walk_data);
 }
 
 static int smmu_domain_config_s2(struct kvm_hyp_iommu_domain *domain,
@@ -966,6 +1025,7 @@ static int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
 			.oas = smmu->ias,
 			.coherent_walk = smmu->features & ARM_SMMU_FEAT_COHERENCY,
 			.tlb = &smmu_tlb_ops,
+			.quirks = IO_PGTABLE_QUIRK_UNMAP_INVAL,
 		};
 	} else {
 		cfg = (struct io_pgtable_cfg) {
@@ -975,6 +1035,7 @@ static int smmu_domain_finalise(struct hyp_arm_smmu_v3_device *smmu,
 			.oas = smmu->oas,
 			.coherent_walk = smmu->features & ARM_SMMU_FEAT_COHERENCY,
 			.tlb = &smmu_tlb_ops,
+			.quirks = IO_PGTABLE_QUIRK_UNMAP_INVAL,
 		};
 	}
 
@@ -1125,6 +1186,89 @@ static int smmu_detach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_dom
 	return ret;
 }
 
+static int smmu_map_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
+			  phys_addr_t paddr, size_t pgsize,
+			  size_t pgcount, int prot, size_t *total_mapped)
+{
+	size_t mapped;
+	size_t granule;
+	int ret;
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+	struct io_pgtable *pgtable = smmu_domain->pgtable;
+
+	if (!pgtable)
+		return -EINVAL;
+
+	granule = 1UL << __ffs(smmu_domain->pgtable->cfg.pgsize_bitmap);
+	if (!IS_ALIGNED(iova | paddr | pgsize, granule))
+		return -EINVAL;
+
+	hyp_spin_lock(&smmu_domain->pgt_lock);
+	while (pgcount && !ret) {
+		mapped = 0;
+		ret = pgtable->ops.map_pages(&pgtable->ops, iova, paddr,
+					     pgsize, pgcount, prot, 0, &mapped);
+		if (ret)
+			break;
+		WARN_ON(!IS_ALIGNED(mapped, pgsize));
+		WARN_ON(mapped > pgcount * pgsize);
+
+		pgcount -= mapped / pgsize;
+		*total_mapped += mapped;
+		iova += mapped;
+		paddr += mapped;
+	}
+	hyp_spin_unlock(&smmu_domain->pgt_lock);
+
+	return 0;
+}
+
+static size_t smmu_unmap_pages(struct kvm_hyp_iommu_domain *domain, unsigned long iova,
+			       size_t pgsize, size_t pgcount, struct iommu_iotlb_gather *gather)
+{
+	size_t granule, unmapped, total_unmapped = 0;
+	size_t size = pgsize * pgcount;
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+	struct io_pgtable *pgtable = smmu_domain->pgtable;
+
+	if (!pgtable)
+		return -EINVAL;
+
+	granule = 1UL << __ffs(smmu_domain->pgtable->cfg.pgsize_bitmap);
+	if (!IS_ALIGNED(iova | pgsize, granule))
+		return 0;
+
+	hyp_spin_lock(&smmu_domain->pgt_lock);
+	while (total_unmapped < size) {
+		unmapped = pgtable->ops.unmap_pages(&pgtable->ops, iova, pgsize,
+						    pgcount, gather);
+		if (!unmapped)
+			break;
+		iova += unmapped;
+		total_unmapped += unmapped;
+		pgcount -= unmapped / pgsize;
+	}
+	hyp_spin_unlock(&smmu_domain->pgt_lock);
+	return total_unmapped;
+}
+
+static phys_addr_t smmu_iova_to_phys(struct kvm_hyp_iommu_domain *domain,
+				     unsigned long iova)
+{
+	phys_addr_t paddr;
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+	struct io_pgtable *pgtable = smmu_domain->pgtable;
+
+	if (!pgtable)
+		return -EINVAL;
+
+	hyp_spin_lock(&smmu_domain->pgt_lock);
+	paddr = pgtable->ops.iova_to_phys(&pgtable->ops, iova);
+	hyp_spin_unlock(&smmu_domain->pgt_lock);
+
+	return paddr;
+}
+
 /* Shared with the kernel driver in EL1 */
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
@@ -1134,4 +1278,7 @@ struct kvm_iommu_ops smmu_ops = {
 	.iotlb_sync			= smmu_iotlb_sync,
 	.attach_dev			= smmu_attach_dev,
 	.detach_dev			= smmu_detach_dev,
+	.map_pages			= smmu_map_pages,
+	.unmap_pages			= smmu_unmap_pages,
+	.iova_to_phys			= smmu_iova_to_phys,
 };
-- 
2.47.0.338.g60cca15819-goog


