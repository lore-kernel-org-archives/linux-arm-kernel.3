Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B07E77182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR1p8S8LwPyQNTvUjkaWT5KmeMMzb+jLodOVwCBm1UI=; b=mxu3d68hK66dz7VdfgVXgbg7J8
	RpP0NJ6u+FBzkVzTIWfVKSxoxBLltWdMZAPxqV0jled0VAGDAS5m2QhF+JLQCU6CK5vpUzGlEIzVD
	m7EQaJJoh6d/IQFojl+DTWCSpARc0cEhVir9MJYO7ykYldtGhHScgfY4rbJGBKqupezslp7VMKCG/
	7kdmqSUno4zY9u7Wa7sP4xDLXBo6UI45/mUl5ZhYJknilRbTPptBf4iqOrjWfPeLv9lWGbFCP0E4m
	ptNKex6Ki3MM0dnTiivBPKjoocdJLoFFVMQd8kWyhJeBr5oau4Cg7t0WtCVGeLsxAwzvByASJJp8j
	DTEemfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnej-00000001LdQ-136Q;
	Thu, 12 Dec 2024 18:11:21 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYW-00000001JXq-0fFG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:04:57 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-436248d1240so5767315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026694; x=1734631494; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wR1p8S8LwPyQNTvUjkaWT5KmeMMzb+jLodOVwCBm1UI=;
        b=ZQLjC4dtRkAESMrRvZ5O02ONTZG6vni2zTz1lrc5o3eojlstxaApFtQUXHhzR9iCxV
         1fXHQtLBFrwcYOMuH++W5WScMyz6L1ffQn/2L5/HOwdH0sQQ7F3lzZeiNSJgd1KFfdX+
         2Ym7JwAktRhA8KLg0i3aBAeWPy/YxDtb5t4QFd5yfAg8BqGeicldgzyngp7fXa1p8fvm
         VD597Jmpf8Bk4ZIrvfflpWB6S3/eKldG2QXXwxiBQsUN44Itc6Ful4joOsPgTskXkvlm
         mfEgV7msEdhQKlCJGY2OJl4cAl+K7Yp+qDa1aKNV4ORlgGSafVdZKr1QTrivPmSyM8hp
         oLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026694; x=1734631494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wR1p8S8LwPyQNTvUjkaWT5KmeMMzb+jLodOVwCBm1UI=;
        b=nty87RypOgNp5KN3brcc2tnVBLQQNBklTcqLzkOMYLTZbG181f86QR0m3oZBN28DFS
         3J1QvDpgLmFYt5gSBdtONQ8H/gXCmtyaIwpeDa3wwzIjoqfdy4z94KQyqolzf5bhtXg0
         q0pOznOucwd38gVKUPw0OhJbrXBsYqyWy7Ht+gcOlKV+uafEx+bh9jyUJZALmjIfFOe1
         darKRX6aJWpoN/0MGZ3WezdTL4ZKNX1S1MU1IlWooBCEqKnnVuOrdJ93umTKoJ2pR0Sb
         zRZ5kOfj3eLA5lcfEy31Y9kTlCQ0Aj15tRu4zOBE9xgSLVJHkyw0TXUxamSvHHuu3oTl
         hqkA==
X-Forwarded-Encrypted: i=1; AJvYcCUQTY/RYn2J8PRitgK6Aobe7c0CaKJinxQvQ85fC97cKS9QUj2ioVSaG3z2h83mhMWJeRYdwl8gLinwVGMTJfVx@lists.infradead.org
X-Gm-Message-State: AOJu0YyfEEaqfh9a5GU2frA7d9otcgykPehMsz36/vEgMQ3fnLeesMTU
	LR2ogJeRoV75sN3ddW72AMB6qP1BL1ZwtOrT+/2ivqJ4zpCPOJeWzHMlPChGIxbvrdEdhXydRUD
	ZwW8M7TMEQA==
X-Google-Smtp-Source: AGHT+IGngLUe7hTwqwYMuDaVTAngV7BbFyaM98e5ARjhrfPTg7ZpE0c7NHe9zxYUAMAR9O6PlwiwJtr/rnZAWw==
X-Received: from wmbjl5.prod.google.com ([2002:a05:600c:6a85:b0:434:f119:f1a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b09:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-4361c3454dbmr64162005e9.1.1734026694237;
 Thu, 12 Dec 2024 10:04:54 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:29 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-6-smostafa@google.com>
Subject: [RFC PATCH v2 05/58] iommu/arm-smmu-v3: Extract driver-specific bits
 from probe function
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
X-CRM114-CacheID: sfid-20241212_100456_196550_0126F823 
X-CRM114-Status: GOOD (  12.81  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

As we're about to share the arm_smmu_device_hw_probe() function with the
KVM driver, extract bits that are specific to the normal driver.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 737c5b882355..702863c94f91 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4167,7 +4167,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	if (reg & IDR0_MSI) {
 		smmu->features |= ARM_SMMU_FEAT_MSI;
-		if (coherent && !disable_msipolling)
+		if (coherent)
 			smmu->options |= ARM_SMMU_OPT_MSIPOLL;
 	}
 
@@ -4316,11 +4316,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->oas = 48;
 	}
 
-	if (arm_smmu_ops.pgsize_bitmap == -1UL)
-		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
-	else
-		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
-
 	/* Set the DMA mask for our table walker */
 	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
 		dev_warn(smmu->dev,
@@ -4334,9 +4329,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	arm_smmu_device_iidr_probe(smmu);
 
-	if (arm_smmu_sva_supported(smmu))
-		smmu->features |= ARM_SMMU_FEAT_SVA;
-
 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
 		 smmu->ias, smmu->oas, smmu->features);
 	return 0;
@@ -4606,6 +4598,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (arm_smmu_sva_supported(smmu))
+		smmu->features |= ARM_SMMU_FEAT_SVA;
+
+	if (disable_msipolling)
+		smmu->options &= ~ARM_SMMU_OPT_MSIPOLL;
+
+	if (arm_smmu_ops.pgsize_bitmap == -1UL)
+		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
+	else
+		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
+
 	/* Initialise in-memory data structures */
 	ret = arm_smmu_init_structures(smmu);
 	if (ret)
-- 
2.47.0.338.g60cca15819-goog


