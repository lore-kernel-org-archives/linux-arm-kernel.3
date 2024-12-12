Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F913E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUMjhbgyZS8tSMuBeujFF8/B0cPiplUozEzmSYJ1apc=; b=gsPGAjFjuvxdRu8hsQekmspwo8
	sjuOxuowo1AODKbuJxJlDRfdJyMKaPfw4WacE2q9ZVqiYeT62P6P3M5f5wHkEgsdHKHFGalU71OTK
	5WzyJ8rzc6mOipJ/xPVgBKY3ms704tG1KKumkqHxtqLzY1YuKppwwwIG19xwL6FylfsaIqR3pRjCa
	xV54wZkCjbGS809PP6Nrv86pDyPh1zWVrvXo+5o3/dyyaLprdOet5AV8KK+aEGHNdjzx5li3+aAFI
	Irj/s6vnHXoRtd1hePy41+k9jQsYHqggpAHcmS4gFxJYw7r7cVnV5VeMmyIHdbM6fO4kYivnxVwhv
	5E/J4YeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoBF-00000001Tse-2KPj;
	Thu, 12 Dec 2024 18:44:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZY-00000001Jwu-3I2E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:01 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43625ceae52so5430985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026759; x=1734631559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUMjhbgyZS8tSMuBeujFF8/B0cPiplUozEzmSYJ1apc=;
        b=u0+7P4GrOa8ESYRpqZG7xhN41G8382j6buVXXsGvPuwA7jBrvxNkid9u0TH3301Zjo
         EB/KTenpUGqX4qqi67AjWGWAExjujKOFDCzWi+Ib66S6WeFOBGbZsVUVtHqy2rZJIR+H
         PI7Kq1odKdALznh1C4m4DstXRTByITCu0zEsFJMDLEmsKwiTTV0nAitdOUCtwsXz7yRA
         I8k2Vm182JKQ5P5fHmtrY1MhGmPoB5pHg+cfZy2EFsNGDs38HrjwdnkEzsJZx0f+gxdw
         8a+6J4mRsspxb31aUBG7by70/wBdWqqJvqzTu45zlRg71oCDsL/zvUfhEFS4Zjc2EX8B
         MxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026759; x=1734631559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUMjhbgyZS8tSMuBeujFF8/B0cPiplUozEzmSYJ1apc=;
        b=FG1ewi92F+ynM5owyEipl4ia6vFV+4WKj70zpRNbrY9uCv1syz5egQCPgz9i8eYXJz
         BHFtIpy4Rb6Q2wbFctSgDYM7UtEvP7swZvvDnpvd2j/7eIot6pItCZa62uPEBCeotex7
         yUSCrTSVakAwYnbr9G2uldgc1VwLn8Yh0NG02c8YHlxIp/CHVos98mxhWPF79SRAYnat
         KNlEo8yYZ+0y690eEyAxhNwiZGzy9EsGgGl/n1dZ9lNdWWC3EolOnxtzaH7ILtDjYWjQ
         DjNCPsWSlOTtDOzSr+c78eeqPU48TZ6oNS5tj4TkVvps1DaO/f6jgTf84ngE3mVue1aD
         rSug==
X-Forwarded-Encrypted: i=1; AJvYcCWk0qg+kZSvSKEma/TjZasbeUFgbvV46WBIPoSgsI4hkagcLZOPJaF3kRmFQ8aZiFeBQD5fG52r+nYsSf6eMT0z@lists.infradead.org
X-Gm-Message-State: AOJu0Ywthiq4T71ckcDAi0Rvr8lhPL9OuLhmyYdffo7qvb6zAusnSbw8
	UvauVPFdUhoifOsciCN9ZlmjsOLtolybmcs4uVroFQ7Cef2So+RLjf/UDwv5XPLT7pnWD2+qG5Z
	C9xgfBbKJ4g==
X-Google-Smtp-Source: AGHT+IFcyCwxNNcgpiKYzT5jMC9sdAfx92qcWV3X5IeJOyZQbObkA8pT7Uz0LF7/zxo+itcxy4bJEL7vJH7gOw==
X-Received: from wmro18.prod.google.com ([2002:a05:600c:3792:b0:434:f2eb:aa72])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3583:b0:434:f871:1b9d with SMTP id 5b1f17b1804b1-4362287091cmr39010485e9.33.1734026759052;
 Thu, 12 Dec 2024 10:05:59 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:00 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-37-smostafa@google.com>
Subject: [RFC PATCH v2 36/58] KVM: arm64: smmu-v3: Add detach_dev
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
X-CRM114-CacheID: sfid-20241212_100600_823147_FF36352A 
X-CRM114-Status: GOOD (  18.01  )
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

Add detach_dev for stage-1 and stage-2 domains.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c | 76 ++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
index a96eb6625c48..ec3f8d9749d3 100644
--- a/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
+++ b/arch/arm64/kvm/hyp/nvhe/iommu/arm-smmu-v3.c
@@ -335,7 +335,6 @@ static u64 *smmu_alloc_cd(struct hyp_arm_smmu_v3_device *smmu, u32 pasid_bits)
 	return (u64 *)hyp_virt_to_phys(cd_table);
 }
 
-__maybe_unused
 static void smmu_free_cd(u64 *cd_table, u32 pasid_bits)
 {
 	u32 order = get_order((1 << pasid_bits) *
@@ -1052,6 +1051,80 @@ static int smmu_attach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_dom
 	return ret;
 }
 
+static int smmu_detach_dev(struct kvm_hyp_iommu *iommu, struct kvm_hyp_iommu_domain *domain,
+			   u32 sid, u32 pasid)
+{
+	struct arm_smmu_ste *dst;
+	int i, ret;
+	struct hyp_arm_smmu_v3_device *smmu = to_smmu(iommu);
+	struct hyp_arm_smmu_v3_domain *smmu_domain = domain->priv;
+	u32 pasid_bits = 0;
+	u64 *cd_table, *cd;
+
+	kvm_iommu_lock(iommu);
+	dst = smmu_get_ste_ptr(smmu, sid);
+	if (!dst) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
+
+	/*
+	 * For stage-1:
+	 * - The kernel has to detach pasid = 0 the last.
+	 * - This will free the CD.
+	 */
+	if (smmu_domain->type == KVM_ARM_SMMU_DOMAIN_S1) {
+		pasid_bits = FIELD_GET(STRTAB_STE_0_S1CDMAX, dst->data[0]);
+		if (pasid >= (1 << pasid_bits)) {
+			ret = -E2BIG;
+			goto out_unlock;
+		}
+		cd_table = (u64 *)(dst->data[0] & STRTAB_STE_0_S1CTXPTR_MASK);
+		if (WARN_ON(!cd_table)) {
+			ret = -ENODEV;
+			goto out_unlock;
+		}
+
+		cd_table = hyp_phys_to_virt((phys_addr_t)cd_table);
+		if (pasid == 0) {
+			int j;
+
+			/* Ensure other pasids are detached. */
+			for (j = 1 ; j < (1 << pasid_bits) ; ++j) {
+				cd = smmu_get_cd_ptr(cd_table, j);
+				if (cd[0] & CTXDESC_CD_0_V) {
+					ret = -EINVAL;
+					goto out_unlock;
+				}
+			}
+		} else {
+			cd = smmu_get_cd_ptr(cd_table, pasid);
+			cd[0] = 0;
+			smmu_sync_cd(smmu, sid, pasid);
+			cd[1] = 0;
+			cd[2] = 0;
+			cd[3] = 0;
+			ret = smmu_sync_cd(smmu, sid, pasid);
+			goto out_unlock;
+		}
+	}
+	/* For stage-2 and pasid = 0 */
+	dst->data[0] = 0;
+	ret = smmu_sync_ste(smmu, sid);
+	if (ret)
+		goto out_unlock;
+	for (i = 1; i < STRTAB_STE_DWORDS; i++)
+		dst->data[i] = 0;
+
+	ret = smmu_sync_ste(smmu, sid);
+
+	smmu_free_cd(cd_table, pasid_bits);
+
+out_unlock:
+	kvm_iommu_unlock(iommu);
+	return ret;
+}
+
 /* Shared with the kernel driver in EL1 */
 struct kvm_iommu_ops smmu_ops = {
 	.init				= smmu_init,
@@ -1060,4 +1133,5 @@ struct kvm_iommu_ops smmu_ops = {
 	.free_domain			= smmu_free_domain,
 	.iotlb_sync			= smmu_iotlb_sync,
 	.attach_dev			= smmu_attach_dev,
+	.detach_dev			= smmu_detach_dev,
 };
-- 
2.47.0.338.g60cca15819-goog


