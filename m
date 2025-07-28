Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23292C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e/2TheqBDOEi4HSiBuM8XyP32c0aQfj3qnc6fRtrsM=; b=fNp8ZuPX4P663EdQE9oGEBq9oF
	D32ziWzhHoUs/nDkvavjvIo9VSJKl/fOaXJYtjffwFtTSP3WbVMWKnnaKEiyzFNzMKGAenz77bP2j
	7pGBVsakFiM2aN9xsomchV5WF5aRokdCpp9sHO75cN+MtPm53gzgPYXj6fsFALNVNGNFCOHGHxZhw
	uxORRp2EoiLUgetUHtnNXcCz2xdcgOshsMc2XkCSyi8VZTjuzRqg1jqrQi/qwkZK0UV81eT4yhU5p
	PINpJhR3hqSxNhq0ehl9eVcMBOzGH89UTFpA4he7jdGwa7/KiEZ3mPLleq6ThgWSdfZRdmkhUwgXq
	yw2KD1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTii-0000000FHs6-230C;
	Mon, 28 Jul 2025 19:41:12 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2j-0000000F8ud-0xyr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:46 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso2760480f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725223; x=1754330023; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6e/2TheqBDOEi4HSiBuM8XyP32c0aQfj3qnc6fRtrsM=;
        b=SCUe6Qtf0dXf0jwMFURrws6GgLCxB2iT7ndkzE7T61s1sFtbpHM7H6rQkN61wqHtwB
         los3gM78iCFdXXtLgPRhspfPHaHTuGbtCV1Z8aKbE3c3ZAfSMD8faYwvGlu1drmC0a+O
         j83fFKbS6dhgxFIeLuJXS45JNryPOPdJMsZ0/revDKXs6XmQ5drkSnv4+izmP2hphHI7
         LiAV6g6zkgW06AtbKtzRrhNyha/jz4uNvu63EyzKraSYeKgGQ5bvanCRrqcb46Vb3yLG
         QFwa30KwK7Aq87JGVH44WSt52+AUhND7JgkjyL04Ff1pegQ5YrtN+5FAK/FGV3QFuEeN
         QyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725223; x=1754330023;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6e/2TheqBDOEi4HSiBuM8XyP32c0aQfj3qnc6fRtrsM=;
        b=IAG6bQgRF6/XA0eix30PP4mLKvPkMn5WSyxiFDv4PA+jjyC+mp2lRVLPcU3Q2Pwi81
         VTZ3c6BFqGnTdN/6UNnrHJv7iL09S73ocvoWbGs0OvmCeyb3Y2RaeTdoYiqiVtcVBHou
         ZukiQ3G+ki76KI2/ETM2kfocugJ6tHPFdiei5iLSb9VrDzBK4xz2bgBkr195gLNzOvPA
         Z57s/RRzSmGlTs6oiX+wHG4/Gew7bIavArYCgl1ug+t9OzrtLkUCK+4HGh4YYvn9bMhk
         c1cWrypfAATxYiZBhvJViYHNtSHovLLT1O4yk5uB+2McJpr0anZ6uIgCVdkhMSFeiGsW
         tl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqMMgGI1PUseeecmFC6ZNClTaLY7QZdgaYZGuog5lAcqODPxLvRhbPyM3T+7kETSqLlI1f0nsCP27zm5hn5GCb@lists.infradead.org
X-Gm-Message-State: AOJu0YxO96feq8cXpidoIL+piJxsjhGh6Az1/wW0Fa0xyeCYE84lAxaV
	7TDSzjPmWKqr7OoosfI1Bd0CijJ69vlNDWLmYyyxajjZpi15lUJcstqJ8svnsj3wJbPQ3MaSFiI
	bTiBqW2Yu0cCuDg==
X-Google-Smtp-Source: AGHT+IEDIjSlCUVUxCpo1rhb6F+umTy0J4Onr6Gk0yVTZfYuvmOMhy6s8JdN8rpuLmzFtQt/COWBfeqeFpc2iQ==
X-Received: from wrbgv1.prod.google.com ([2002:a05:6000:4601:b0:3b7:8ac1:5f96])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4011:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3b7765e58a1mr8332168f8f.2.1753725223461;
 Mon, 28 Jul 2025 10:53:43 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:00 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-14-smostafa@google.com>
Subject: [PATCH v3 13/29] iommu/arm-smmu-v3: Move TLB range invalidation into
 a macro
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105345_275469_FD02B884 
X-CRM114-Status: GOOD (  21.01  )
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

Range TLB invalidation has a very specific algorithm, instead of
re-writing it for the hypervisor, put it in a macro so it can be
re-used.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common.h      | 65 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 59 +----------------
 2 files changed, 68 insertions(+), 56 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
index f115ff9a547f..ab6db8b4b9f2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.h
@@ -540,4 +540,69 @@ static inline void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
 	for (i = 0; i < n_dwords; ++i)
 		*dst++ = cpu_to_le64(*src++);
 }
+
+/**
+ * arm_smmu_tlb_inv_build - Create a range invalidation command
+ * @cmd: Base command initialized with OPCODE (S1, S2..), vmid and asid.
+ * @iova: Start IOVA to invalidate
+ * @size: Size of range
+ * @granule: Granule of invalidation
+ * @pgsize_bitmap: Page size bit map of the page table.
+ * @smmu: Struct for the smmu, must have ::features
+ * @add_cmd: Function to send/batch the invalidation command
+ * @cmds: Incase of batching, it includes the pointer to the batch
+ */
+#define arm_smmu_tlb_inv_build(cmd, iova, size, granule, pgsize_bitmap, smmu, add_cmd, cmds) \
+{ \
+	unsigned long _iova = (iova);						\
+	size_t _size = (size);							\
+	size_t _granule = (granule);						\
+	unsigned long end = _iova + _size, num_pages = 0, tg = 0;		\
+	size_t inv_range = _granule;						\
+	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {				\
+		/* Get the leaf page size */					\
+		tg = __ffs(pgsize_bitmap);					\
+		num_pages = _size >> tg;					\
+		/* Convert page size of 12,14,16 (log2) to 1,2,3 */		\
+		cmd->tlbi.tg = (tg - 10) / 2;					\
+		/*
+		 * Determine what level the granule is at. For non-leaf, both
+		 * io-pgtable and SVA pass a nominal last-level granule because
+		 * they don't know what level(s) actually apply, so ignore that
+		 * and leave TTL=0. However for various errata reasons we still
+		 * want to use a range command, so avoid the SVA corner case
+		 * where both scale and num could be 0 as well.
+		 */								\
+		if (cmd->tlbi.leaf)						\
+			cmd->tlbi.ttl = 4 - ((ilog2(_granule) - 3) / (tg - 3));	\
+		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)		\
+			num_pages++;						\
+	}									\
+	while (_iova < end) {							\
+		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {			\
+			/*
+			 * On each iteration of the loop, the range is 5 bits
+			 * worth of the aligned size remaining.
+			 * The range in pages is:
+			 *
+			 * range = (num_pages & (0x1f << __ffs(num_pages)))
+			 */							\
+			unsigned long scale, num;				\
+			/* Determine the power of 2 multiple number of pages */	\
+			scale = __ffs(num_pages);				\
+			cmd->tlbi.scale = scale;				\
+			/* Determine how many chunks of 2^scale size we have */	\
+			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;	\
+			cmd->tlbi.num = num - 1;				\
+			/* range is num * 2^scale * pgsize */			\
+			inv_range = num << (scale + tg);			\
+			/* Clear out the lower order bits for the next iteration */ \
+			num_pages -= num << scale;				\
+		}								\
+		cmd->tlbi.addr = iova;						\
+		add_cmd(smmu, cmds, cmd);					\
+		_iova += inv_range;						\
+	}									\
+}										\
+
 #endif /* _ARM_SMMU_V3_COMMON_H */
\ No newline at end of file
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 066d9d9e8088..245b39ddef66 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2075,68 +2075,15 @@ static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
 				     struct arm_smmu_domain *smmu_domain)
 {
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	unsigned long end = iova + size, num_pages = 0, tg = 0;
-	size_t inv_range = granule;
 	struct arm_smmu_cmdq_batch cmds;
 
 	if (!size)
 		return;
 
-	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-		/* Get the leaf page size */
-		tg = __ffs(smmu_domain->domain.pgsize_bitmap);
-
-		num_pages = size >> tg;
-
-		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
-		cmd->tlbi.tg = (tg - 10) / 2;
-
-		/*
-		 * Determine what level the granule is at. For non-leaf, both
-		 * io-pgtable and SVA pass a nominal last-level granule because
-		 * they don't know what level(s) actually apply, so ignore that
-		 * and leave TTL=0. However for various errata reasons we still
-		 * want to use a range command, so avoid the SVA corner case
-		 * where both scale and num could be 0 as well.
-		 */
-		if (cmd->tlbi.leaf)
-			cmd->tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
-		else if ((num_pages & CMDQ_TLBI_RANGE_NUM_MAX) == 1)
-			num_pages++;
-	}
-
 	arm_smmu_cmdq_batch_init(smmu, &cmds, cmd);
-
-	while (iova < end) {
-		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
-			/*
-			 * On each iteration of the loop, the range is 5 bits
-			 * worth of the aligned size remaining.
-			 * The range in pages is:
-			 *
-			 * range = (num_pages & (0x1f << __ffs(num_pages)))
-			 */
-			unsigned long scale, num;
-
-			/* Determine the power of 2 multiple number of pages */
-			scale = __ffs(num_pages);
-			cmd->tlbi.scale = scale;
-
-			/* Determine how many chunks of 2^scale size we have */
-			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
-			cmd->tlbi.num = num - 1;
-
-			/* range is num * 2^scale * pgsize */
-			inv_range = num << (scale + tg);
-
-			/* Clear out the lower order bits for the next iteration */
-			num_pages -= num << scale;
-		}
-
-		cmd->tlbi.addr = iova;
-		arm_smmu_cmdq_batch_add(smmu, &cmds, cmd);
-		iova += inv_range;
-	}
+	arm_smmu_tlb_inv_build(cmd, iova, size, granule,
+			       smmu_domain->domain.pgsize_bitmap,
+			       smmu, arm_smmu_cmdq_batch_add, &cmds);
 	arm_smmu_cmdq_batch_submit(smmu, &cmds);
 }
 
-- 
2.50.1.552.g942d659e1b-goog


