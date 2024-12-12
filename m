Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6142BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5SVX+pTxiaENIFA7cNS8JIZZP5zL/TwARaJceYJqX8=; b=QcbFUu0/+4ZVmXr85EzaouO5OT
	B9ugK2GWiaD7HKz1Twh+qnc8aiUhCZzqbFlo7wuV2pWbgx9T32D269PN9751paQogk0iiowLoAt5X
	cjCRVlen7JJYkJ+9WG1M1ZkvjVxytoVWn3NlkYK7HNPY5wI3E/HWgERrPRfM9apWYZkIQxrRpdilq
	9U/Q6NCum5cpOerrRYifjFBx1kg5rch5jheoOIoWAwFzWgkTQWac9YeJGx9ER/r0C+shYDDx9wASR
	pKRUhbMavyZr9/Wtx214hdhkEf2tpLYy0cIH0cq2LiIKPW1X0LvA16By5KbinTSKNZf3NIc/eHPYM
	TuF+CFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoOt-00000001XZS-1lQq;
	Thu, 12 Dec 2024 18:59:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZz-00000001K71-48Kd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:29 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434fe2b605eso5728425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026786; x=1734631586; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5SVX+pTxiaENIFA7cNS8JIZZP5zL/TwARaJceYJqX8=;
        b=f6VMikgBKF97VP9FxXkVzni59qHEidGuT+KoBmXycojwF2EQHlgBMmDMwCFftnrzd2
         vo9BK/Qx8kD5bkCQurNOTXNiH1bZEDgAZhp6rQv3doSlinqZkGo8eo4squZmPjKfdOF5
         GK/s/Mch4sHhPksQ58K8GQyjyZTVKeNllXDuxAa+K1PpKVUioeImz9ezkcd+f6cKEAwG
         7b201Cbl9pbq3dL6hoVFO+D0a3QQSwQ1ypGvHVtybCQIp5AhGA9tQorSU66575EYHjCI
         HFcgbopP+e88TpVS7iXNNO3AuTe+INSDHQ/mvxcOlYQ6BgT0n3Op1v8AcrFDwmsaE0dt
         i9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026786; x=1734631586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5SVX+pTxiaENIFA7cNS8JIZZP5zL/TwARaJceYJqX8=;
        b=JkFkTQ+gCze6ufaPIGBt9y07mEizfJcZFwRd1aSaq85yOW0TgK2hTknhxVxx75fvTu
         m7s1FST1Dju611iNrS5lbNXJd5ZEfgB1jayX1jDinoYJn/jQoXQea93wv52KEF0UBtfB
         bp/U//UFihO0LFiBFkRMwkkq3Wa+tEwFs01zVu3tobpRulsQxGYcfXZMPA3K7kZenE5Y
         s1WSkTVcSWT2xpGi7Gdrgxcg6AVHtxxJ8zmvJm/EyihZbjJCjTrGA/mYExsF7edzp3zF
         SZzCLcgWXqbn2KJVwDquMsxmMCZbJtydxYdl6sDS2gFILdg53Xo0+fcpWn97QJqrsuXz
         8j1g==
X-Forwarded-Encrypted: i=1; AJvYcCWwp5+I1ExEB3AJLKu4ip0/savw9qdhzxwMbQI+FomUKq8iZr9QaaukeDzXWrcuaeigO/bkJkK0FtEeg+POEEfx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkk9yo0mHRwQ9nOlDdHLQr2MH0qDG8EGs/Q2LSZ/aHegFpCsyx
	5buEqz+aS2odhmHoXg0csZIqp7lFzDzYtr3Cg5mQtyvPighNXqu53YLyblpYKomZyI3JgCcsuA5
	JjyYG7tNJkw==
X-Google-Smtp-Source: AGHT+IHSna/pAUMpriFywfhuXQd4p7Z0BvqBnAxaoa4lXIc9lasdTGNcVYfL2Lq+5puAs9DWq8PJ6tvjCCUecw==
X-Received: from wmlf18.prod.google.com ([2002:a7b:c8d2:0:b0:434:9da4:2fa5])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f92:b0:434:a1d3:a326 with SMTP id 5b1f17b1804b1-4361c346248mr58749665e9.6.1734026786073;
 Thu, 12 Dec 2024 10:06:26 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:13 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-50-smostafa@google.com>
Subject: [RFC PATCH v2 49/58] iommu/arm-smmu-v3-kvm: Add IOMMU ops
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
X-CRM114-CacheID: sfid-20241212_100628_027358_49959AA2 
X-CRM114-Status: GOOD (  21.10  )
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

Add iommu_ops: attach_dev, release_device, probe_device, domain_alloc/
free, capable, and some other common ops with the kernel SMMUv3
driver: device_group, of_xlate, get_resv_regions.

Other ops as map/unmap and iova_to_phys added next.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 284 ++++++++++++++++++
 1 file changed, 284 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index dab2d59b5a88..071743f5acf9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -7,6 +7,7 @@
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_mmu.h>
 
+#include <linux/arm-smccc.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
@@ -25,9 +26,26 @@ struct host_arm_smmu_device {
 #define smmu_to_host(_smmu) \
 	container_of(_smmu, struct host_arm_smmu_device, smmu);
 
+struct kvm_arm_smmu_master {
+	struct arm_smmu_device		*smmu;
+	struct device			*dev;
+	struct kvm_arm_smmu_domain      *domain;
+};
+
+struct kvm_arm_smmu_domain {
+	struct iommu_domain		domain;
+	struct arm_smmu_device		*smmu;
+	struct mutex			init_mutex;
+	pkvm_handle_t			id;
+};
+
+#define to_kvm_smmu_domain(_domain) \
+	container_of(_domain, struct kvm_arm_smmu_domain, domain)
+
 static size_t				kvm_arm_smmu_cur;
 static size_t				kvm_arm_smmu_count;
 static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
+static DEFINE_IDA(kvm_arm_smmu_domain_ida);
 
 static int kvm_arm_smmu_topup_memcache(struct arm_smccc_res *res, gfp_t gfp)
 {
@@ -68,6 +86,267 @@ static int kvm_arm_smmu_topup_memcache(struct arm_smccc_res *res, gfp_t gfp)
 	__res.a1;							\
 })
 
+static struct platform_driver kvm_arm_smmu_driver;
+
+static struct arm_smmu_device *
+kvm_arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct device *dev;
+
+	dev = driver_find_device_by_fwnode(&kvm_arm_smmu_driver.driver, fwnode);
+	put_device(dev);
+	return dev ? dev_get_drvdata(dev) : NULL;
+}
+
+static struct iommu_ops kvm_arm_smmu_ops;
+
+static struct iommu_device *kvm_arm_smmu_probe_device(struct device *dev)
+{
+	struct arm_smmu_device *smmu;
+	struct kvm_arm_smmu_master *master;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
+		return ERR_PTR(-EBUSY);
+
+	smmu = kvm_arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
+	if (!smmu)
+		return ERR_PTR(-ENODEV);
+
+	master = kzalloc(sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return ERR_PTR(-ENOMEM);
+
+	master->dev = dev;
+	master->smmu = smmu;
+	dev_iommu_priv_set(dev, master);
+
+	return &smmu->iommu;
+}
+
+static struct iommu_domain *kvm_arm_smmu_domain_alloc(unsigned type)
+{
+	struct kvm_arm_smmu_domain *kvm_smmu_domain;
+
+	/*
+	 * We don't support
+	 * - IOMMU_DOMAIN_DMA_FQ because lazy unmap would clash with memory
+	 *   donation to guests.
+	 * - IOMMU_DOMAIN_IDENTITY: Requires a stage-2 only transparent domain.
+	 */
+	if (type != IOMMU_DOMAIN_DMA &&
+	    type != IOMMU_DOMAIN_UNMANAGED)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	kvm_smmu_domain = kzalloc(sizeof(*kvm_smmu_domain), GFP_KERNEL);
+	if (!kvm_smmu_domain)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&kvm_smmu_domain->init_mutex);
+
+	return &kvm_smmu_domain->domain;
+}
+
+static int kvm_arm_smmu_domain_finalize(struct kvm_arm_smmu_domain *kvm_smmu_domain,
+					struct kvm_arm_smmu_master *master)
+{
+	int ret = 0;
+	struct arm_smmu_device *smmu = master->smmu;
+	unsigned int max_domains;
+	enum kvm_arm_smmu_domain_type type;
+	struct io_pgtable_cfg cfg;
+	unsigned long ias;
+
+	if (kvm_smmu_domain->smmu && (kvm_smmu_domain->smmu != smmu))
+		return -EINVAL;
+
+	if (kvm_smmu_domain->smmu)
+		return 0;
+	/* Default to stage-1. */
+	if (smmu->features & ARM_SMMU_FEAT_TRANS_S1) {
+		ias = (smmu->features & ARM_SMMU_FEAT_VAX) ? 52 : 48;
+		cfg = (struct io_pgtable_cfg) {
+			.fmt = ARM_64_LPAE_S1,
+			.pgsize_bitmap = smmu->pgsize_bitmap,
+			.ias = min_t(unsigned long, ias, VA_BITS),
+			.oas = smmu->ias,
+			.coherent_walk = smmu->features & ARM_SMMU_FEAT_COHERENCY,
+		};
+		ret = io_pgtable_configure(&cfg);
+		if (ret)
+			return ret;
+
+		type = KVM_ARM_SMMU_DOMAIN_S1;
+		kvm_smmu_domain->domain.pgsize_bitmap = cfg.pgsize_bitmap;
+		kvm_smmu_domain->domain.geometry.aperture_end = (1UL << cfg.ias) - 1;
+		max_domains = 1 << smmu->asid_bits;
+	} else {
+		cfg = (struct io_pgtable_cfg) {
+			.fmt = ARM_64_LPAE_S2,
+			.pgsize_bitmap = smmu->pgsize_bitmap,
+			.ias = smmu->ias,
+			.oas = smmu->oas,
+			.coherent_walk = smmu->features & ARM_SMMU_FEAT_COHERENCY,
+		};
+		ret = io_pgtable_configure(&cfg);
+		if (ret)
+			return ret;
+
+		type = KVM_ARM_SMMU_DOMAIN_S2;
+		kvm_smmu_domain->domain.pgsize_bitmap = cfg.pgsize_bitmap;
+		kvm_smmu_domain->domain.geometry.aperture_end = (1UL << cfg.ias) - 1;
+		max_domains = 1 << smmu->vmid_bits;
+	}
+	kvm_smmu_domain->domain.geometry.force_aperture = true;
+
+	/*
+	 * The hypervisor uses the domain_id for asid/vmid so it has to be
+	 * unique, and it has to be in range of this smmu, which can be
+	 * either 8 or 16 bits.
+	 */
+	ret = ida_alloc_range(&kvm_arm_smmu_domain_ida, 0,
+			      min(KVM_IOMMU_MAX_DOMAINS, max_domains), GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	kvm_smmu_domain->id = ret;
+
+	ret = kvm_call_hyp_nvhe_mc(__pkvm_host_iommu_alloc_domain,
+				   kvm_smmu_domain->id, type);
+	if (ret) {
+		ida_free(&kvm_arm_smmu_domain_ida, kvm_smmu_domain->id);
+		return ret;
+	}
+
+	kvm_smmu_domain->smmu = smmu;
+	return 0;
+}
+
+static void kvm_arm_smmu_domain_free(struct iommu_domain *domain)
+{
+	int ret;
+	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
+	struct arm_smmu_device *smmu = kvm_smmu_domain->smmu;
+
+	if (smmu) {
+		ret = kvm_call_hyp_nvhe(__pkvm_host_iommu_free_domain, kvm_smmu_domain->id);
+		ida_free(&kvm_arm_smmu_domain_ida, kvm_smmu_domain->id);
+	}
+	kfree(kvm_smmu_domain);
+}
+
+static int kvm_arm_smmu_detach_dev(struct host_arm_smmu_device *host_smmu,
+				   struct kvm_arm_smmu_master *master)
+{
+	int i, ret;
+	struct arm_smmu_device *smmu = &host_smmu->smmu;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
+	struct kvm_arm_smmu_domain *domain = master->domain;
+
+	if (!domain)
+		return 0;
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		int sid = fwspec->ids[i];
+
+		ret = kvm_call_hyp_nvhe(__pkvm_host_iommu_detach_dev,
+					host_smmu->id, domain->id, sid, 0);
+		if (ret) {
+			dev_err(smmu->dev, "cannot detach device %s (0x%x): %d\n",
+				dev_name(master->dev), sid, ret);
+			break;
+		}
+	}
+
+	master->domain = NULL;
+
+	return ret;
+}
+
+static void kvm_arm_smmu_release_device(struct device *dev)
+{
+	struct kvm_arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(master->smmu);
+
+	kvm_arm_smmu_detach_dev(host_smmu, master);
+	kfree(master);
+	iommu_fwspec_free(dev);
+}
+
+static int kvm_arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
+{
+	int i, ret;
+	struct arm_smmu_device *smmu;
+	struct host_arm_smmu_device *host_smmu;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct kvm_arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct kvm_arm_smmu_domain *kvm_smmu_domain = to_kvm_smmu_domain(domain);
+
+	if (!master)
+		return -ENODEV;
+
+	smmu = master->smmu;
+	host_smmu = smmu_to_host(smmu);
+
+	ret = kvm_arm_smmu_detach_dev(host_smmu, master);
+	if (ret)
+		return ret;
+
+	mutex_lock(&kvm_smmu_domain->init_mutex);
+	ret = kvm_arm_smmu_domain_finalize(kvm_smmu_domain, master);
+	mutex_unlock(&kvm_smmu_domain->init_mutex);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < fwspec->num_ids; i++) {
+		int sid = fwspec->ids[i];
+
+		ret = kvm_call_hyp_nvhe_mc(__pkvm_host_iommu_attach_dev,
+					   host_smmu->id, kvm_smmu_domain->id,
+					   sid, 0, 0);
+		if (ret) {
+			dev_err(smmu->dev, "cannot attach device %s (0x%x): %d\n",
+				dev_name(dev), sid, ret);
+			goto out_ret;
+		}
+	}
+	master->domain = kvm_smmu_domain;
+
+out_ret:
+	if (ret)
+		kvm_arm_smmu_detach_dev(host_smmu, master);
+	return ret;
+}
+
+static bool kvm_arm_smmu_capable(struct device *dev, enum iommu_cap cap)
+{
+	struct kvm_arm_smmu_master *master = dev_iommu_priv_get(dev);
+
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return master->smmu->features & ARM_SMMU_FEAT_COHERENCY;
+	case IOMMU_CAP_NOEXEC:
+	default:
+		return false;
+	}
+}
+
+static struct iommu_ops kvm_arm_smmu_ops = {
+	.capable		= kvm_arm_smmu_capable,
+	.device_group		= arm_smmu_device_group,
+	.of_xlate		= arm_smmu_of_xlate,
+	.get_resv_regions	= arm_smmu_get_resv_regions,
+	.probe_device		= kvm_arm_smmu_probe_device,
+	.release_device		= kvm_arm_smmu_release_device,
+	.domain_alloc		= kvm_arm_smmu_domain_alloc,
+	.pgsize_bitmap		= -1UL,
+	.owner			= THIS_MODULE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.attach_dev	= kvm_arm_smmu_attach_dev,
+		.free		= kvm_arm_smmu_domain_free,
+	}
+};
+
 static bool kvm_arm_smmu_validate_features(struct arm_smmu_device *smmu)
 {
 	unsigned int required_features =
@@ -183,6 +462,11 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	if (!kvm_arm_smmu_validate_features(smmu))
 		return -ENODEV;
 
+	if (kvm_arm_smmu_ops.pgsize_bitmap == -1UL)
+		kvm_arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
+	else
+		kvm_arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
+
 	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, smmu->base,
 				      ARM_SMMU_CMDQ_PROD, ARM_SMMU_CMDQ_CONS,
 				      CMDQ_ENT_DWORDS, "cmdq");
-- 
2.47.0.338.g60cca15819-goog


