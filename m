Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0B9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDsPUb0bWk00lVk5VrmMCzR9hOnWzhzOdUMd5hdynGI=; b=O91FniFHK4mRWP9PvLZaidVrbe
	l/ZdhgyYJznyT3/NkXZfLxWWjHzK0P+W0Y1aAy3Q58v8ObiWy4SPz0IGx++upXXwiplAY1XQmQZs9
	5VQOEds4cpmn9C25MKbY/z8H9Ahq5cNE+28JCzGBorkMKnKgwooTx/FR4LzxOUri6S6Qr4IoVRyDo
	gJ0l3nkzzsOd3C241SnKxzJ6sUn2KodEZpbqGQ0kJh5P8wL3IwfRvJ/PmFdxWRrnLKY3o6UOMKFB6
	ngdfjr6CuBfvS6PwSK21NlhXL80jWSZEJFHNCNLF6lWAss5kerX1cqiDJbiZi98uNboU8ZbZgXukj
	PfWJzwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofK-00000001aAk-3XhG;
	Thu, 12 Dec 2024 19:16:02 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLna4-00000001K85-1gwB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:33 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43582d49dacso8235195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026790; x=1734631590; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDsPUb0bWk00lVk5VrmMCzR9hOnWzhzOdUMd5hdynGI=;
        b=TSXxNSYbvx2NuIjhdsToqfCL/x9EQ3zeP3/76jHfIUdneN0wb2i25D23reMMhfJTLL
         SnIzursJP7Bo1P7CaK11oGag554k053saOHxeGOCrGGPcY0ZasU5pLZXEjgpXn+Jdawr
         fDuLiEbd6k2iA4MngXIvdmPfbIR3JrOAJuxgrvlht8N4c1emtq9K6N1OoPFRUnnKUSD4
         OBVdQ4ovqsgGC1A18QWNeZhpuyAUX6ciSVwzay945uu6/gQrY8Mr/XP0gtY8+G0Yw2uo
         2zbUI+RBSxKLa+AkV2ShiQYEWuagbRhqZXtDSn4QvLaOH0X63WC7EVMtqH2+F4HtZwF/
         enrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026790; x=1734631590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDsPUb0bWk00lVk5VrmMCzR9hOnWzhzOdUMd5hdynGI=;
        b=pO5+C9ZeouYQhSbi7vrEDHf/C3OHD4sZHa284yepnBsPTJlXrEEcNa6njF8OMJb25V
         zPkkqQ1uWhgUzzGbiDk1YlEZj1Bp8XSgvmYbXH5gVSe9sudFmjRMb5On/KaeaNchwpCz
         JX7G4sjBnsjYQ6dXVcn8mXpaznxCaeq9kmUPVfXOMD0EX5SwUiHqIG5tVqGTEqqToJoc
         5HykKAtEYYWGzFv7YzIBgR5cnLLTHIE/BABh0Fa3hevke2+sFEelu5nnJA6GwRmy23qE
         2UCMufMcMep6AKSZ4SaLqkuiBtddG33Imd+EDFlzod8fDQGifGIusI3/6cCvd0F7bEBs
         qbcA==
X-Forwarded-Encrypted: i=1; AJvYcCWIvTQndJL7Xz9iLaD0PhPxwHVI1C21vBggpxxeldIS8DW0EF1hP9nhwrYy5Ys+n78axlzLYhr6FmfbMFPNWBdp@lists.infradead.org
X-Gm-Message-State: AOJu0YwCXx4aRR95e1rfTL6U7ZKY/+bb0tHZ6I3fZruXp+t87XQb3GWb
	4/hkgC4hnzx8e1qcm9CRF0gxwuKRtHEIKgJiE9kZ8DmBIXvKQQO5uAKOxA2O+A/q5LncuEx0c8a
	/v3HJe6c/1w==
X-Google-Smtp-Source: AGHT+IG5YT0EqzqwRu68YDl6GFjwRjdyDc1eUBljQvzlbHZ6i5XzGDeiAujVaOE5XHTme90ZWc1iBhvfMg1TXA==
X-Received: from wmdp19.prod.google.com ([2002:a05:600c:5d3:b0:434:f271:522e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e0b:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-43622827675mr38391595e9.5.1734026790384;
 Thu, 12 Dec 2024 10:06:30 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:15 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-52-smostafa@google.com>
Subject: [RFC PATCH v2 51/58] iommu/arm-smmu-v3-kvm: Support PASID operations
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
X-CRM114-CacheID: sfid-20241212_100632_440500_E9E2D853 
X-CRM114-Status: GOOD (  15.82  )
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

Add support for set_dev_pasid and remove_dev_pasid, the hypervisor
already supports pasid, so we just need to forward it in the
hypercalls in addition to proper tracking of domains per master.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 58 +++++++++++++++----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 82f0191b222c..cbcd8a75d562 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -29,7 +29,8 @@ struct host_arm_smmu_device {
 struct kvm_arm_smmu_master {
 	struct arm_smmu_device		*smmu;
 	struct device			*dev;
-	struct kvm_arm_smmu_domain      *domain;
+	struct xarray			domains;
+	u32				ssid_bits;
 };
 
 struct kvm_arm_smmu_domain {
@@ -119,6 +120,10 @@ static struct iommu_device *kvm_arm_smmu_probe_device(struct device *dev)
 
 	master->dev = dev;
 	master->smmu = smmu;
+
+	device_property_read_u32(dev, "pasid-num-bits", &master->ssid_bits);
+	master->ssid_bits = min(smmu->ssid_bits, master->ssid_bits);
+	xa_init(&master->domains);
 	dev_iommu_priv_set(dev, master);
 
 	return &smmu->iommu;
@@ -235,13 +240,14 @@ static void kvm_arm_smmu_domain_free(struct iommu_domain *domain)
 	kfree(kvm_smmu_domain);
 }
 
-static int kvm_arm_smmu_detach_dev(struct host_arm_smmu_device *host_smmu,
-				   struct kvm_arm_smmu_master *master)
+static int kvm_arm_smmu_detach_dev_pasid(struct host_arm_smmu_device *host_smmu,
+					 struct kvm_arm_smmu_master *master,
+					 ioasid_t pasid)
 {
 	int i, ret;
 	struct arm_smmu_device *smmu = &host_smmu->smmu;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
-	struct kvm_arm_smmu_domain *domain = master->domain;
+	struct kvm_arm_smmu_domain *domain = xa_load(&master->domains, pasid);
 
 	if (!domain)
 		return 0;
@@ -250,7 +256,7 @@ static int kvm_arm_smmu_detach_dev(struct host_arm_smmu_device *host_smmu,
 		int sid = fwspec->ids[i];
 
 		ret = kvm_call_hyp_nvhe(__pkvm_host_iommu_detach_dev,
-					host_smmu->id, domain->id, sid, 0);
+					host_smmu->id, domain->id, sid, pasid);
 		if (ret) {
 			dev_err(smmu->dev, "cannot detach device %s (0x%x): %d\n",
 				dev_name(master->dev), sid, ret);
@@ -258,22 +264,39 @@ static int kvm_arm_smmu_detach_dev(struct host_arm_smmu_device *host_smmu,
 		}
 	}
 
-	master->domain = NULL;
+	xa_erase(&master->domains, pasid);
 
 	return ret;
 }
 
+static int kvm_arm_smmu_detach_dev(struct host_arm_smmu_device *host_smmu,
+				   struct kvm_arm_smmu_master *master)
+{
+	return kvm_arm_smmu_detach_dev_pasid(host_smmu, master, 0);
+}
+
+static void kvm_arm_smmu_remove_dev_pasid(struct device *dev, ioasid_t pasid,
+					  struct iommu_domain *domain)
+{
+	struct kvm_arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct host_arm_smmu_device *host_smmu = smmu_to_host(master->smmu);
+
+	kvm_arm_smmu_detach_dev_pasid(host_smmu, master, pasid);
+}
+
 static void kvm_arm_smmu_release_device(struct device *dev)
 {
 	struct kvm_arm_smmu_master *master = dev_iommu_priv_get(dev);
 	struct host_arm_smmu_device *host_smmu = smmu_to_host(master->smmu);
 
 	kvm_arm_smmu_detach_dev(host_smmu, master);
+	xa_destroy(&master->domains);
 	kfree(master);
 	iommu_fwspec_free(dev);
 }
 
-static int kvm_arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
+static int kvm_arm_smmu_set_dev_pasid(struct iommu_domain *domain,
+				      struct device *dev, ioasid_t pasid)
 {
 	int i, ret;
 	struct arm_smmu_device *smmu;
@@ -288,7 +311,7 @@ static int kvm_arm_smmu_attach_dev(struct iommu_domain *domain, struct device *d
 	smmu = master->smmu;
 	host_smmu = smmu_to_host(smmu);
 
-	ret = kvm_arm_smmu_detach_dev(host_smmu, master);
+	ret = kvm_arm_smmu_detach_dev_pasid(host_smmu, master, pasid);
 	if (ret)
 		return ret;
 
@@ -303,14 +326,14 @@ static int kvm_arm_smmu_attach_dev(struct iommu_domain *domain, struct device *d
 
 		ret = kvm_call_hyp_nvhe_mc(__pkvm_host_iommu_attach_dev,
 					   host_smmu->id, kvm_smmu_domain->id,
-					   sid, 0, 0);
+					   sid, pasid, master->ssid_bits);
 		if (ret) {
 			dev_err(smmu->dev, "cannot attach device %s (0x%x): %d\n",
 				dev_name(dev), sid, ret);
 			goto out_ret;
 		}
 	}
-	master->domain = kvm_smmu_domain;
+	ret = xa_insert(&master->domains, pasid, kvm_smmu_domain, GFP_KERNEL);
 
 out_ret:
 	if (ret)
@@ -318,6 +341,19 @@ static int kvm_arm_smmu_attach_dev(struct iommu_domain *domain, struct device *d
 	return ret;
 }
 
+static int kvm_arm_smmu_attach_dev(struct iommu_domain *domain,
+				   struct device *dev)
+{
+	struct kvm_arm_smmu_master *master = dev_iommu_priv_get(dev);
+	unsigned long pasid = 0;
+
+	/* All pasids must be removed first. */
+	if (xa_find_after(&master->domains, &pasid, ULONG_MAX, XA_PRESENT))
+		return -EBUSY;
+
+	return kvm_arm_smmu_set_dev_pasid(domain, dev, 0);
+}
+
 static bool kvm_arm_smmu_capable(struct device *dev, enum iommu_cap cap)
 {
 	struct kvm_arm_smmu_master *master = dev_iommu_priv_get(dev);
@@ -409,6 +445,7 @@ static struct iommu_ops kvm_arm_smmu_ops = {
 	.release_device		= kvm_arm_smmu_release_device,
 	.domain_alloc		= kvm_arm_smmu_domain_alloc,
 	.pgsize_bitmap		= -1UL,
+	.remove_dev_pasid	= kvm_arm_smmu_remove_dev_pasid,
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= kvm_arm_smmu_attach_dev,
@@ -416,6 +453,7 @@ static struct iommu_ops kvm_arm_smmu_ops = {
 		.map_pages	= kvm_arm_smmu_map_pages,
 		.unmap_pages	= kvm_arm_smmu_unmap_pages,
 		.iova_to_phys	= kvm_arm_smmu_iova_to_phys,
+		.set_dev_pasid	= kvm_arm_smmu_set_dev_pasid,
 	}
 };
 
-- 
2.47.0.338.g60cca15819-goog


