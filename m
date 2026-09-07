Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4ECC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhPP1JAiNiKkOvrHNFMFzIUMy7btuiCwX6565yHzAys=; b=uGRlYvGZg74fO5Dywwe6kbKIUT
	aCAJwB5gATZmE14GfsImboZV0EedIaF58zUa1IIVs139zvY4pjtDLMO04gP465E3G8/M1zl5IkT9I
	D6LKBlLZwAV5vDz5Og5RJhM/7grj7q3QOEN/maWbrE2zwhyvXfulVIt3ssQE2MYPr/8yutGdTY+N+
	mQsxJEJOK6WE6l4FHeVw/SZk9RtRlhPNXLuEndOO+j78zBTfuIZbLZ29KDP7j3W8KGpp5Ks29nwkp
	Q7bjch4auE0FxY6tXgcMrm78Xj5lCTq1LvzoY1I62SadQIrJkKRSd6lxrnLuKoVVeja96JThPyxcF
	B8JSzlpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7k-00000006PkJ-3uzD;
	Mon, 07 Sep 2026 09:58:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7j-00000006Pho-0jO1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E837243654;
	Mon,  7 Sep 2026 09:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF591F00A3E;
	Mon,  7 Sep 2026 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775126;
	bh=BhPP1JAiNiKkOvrHNFMFzIUMy7btuiCwX6565yHzAys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fz4Ajhqpy/aQn06cuNV2Fl9140Zf/vbs8qB/2MlQ/guvsCf1tbeiA4ZC5z2CPXODc
	 /nC2t6LPmlafDlBVk+51jkzjYkKILrxMjUalnAUy8XNPxFw2veWEofx991HtjTs3Eu
	 aFktyU2f6wR5Op/BBewpzons8Nvc6j+PS4IrU6qFMoE6aZMztp6Rptl0TqWf0eY5Mc
	 s278Ot7bG+8kycF+AbEES0ai2X2eXNUF2NmY4IZgdERMBm6CGFae2gmaCPsuTShVU5
	 bN5EfEWxp1T0hfoeLAOTAQINKUBYGC6ZzJ+QHt6EVliPFgHqExZ/9axGwwfdMOhnu9
	 w8b6FJuIj5eKQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4618F1980045;
	Mon,  7 Sep 2026 05:58:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 07 Sep 2026 05:58:44 -0400
X-ME-Sender: <xms:0oqealXkTF2WPLg9zFBxlw2nuVRgbJ2AHrlPE6iuyiwfO70vLal08g>
    <xme:0oqeasjzIBixyR5j4wJez9xF3cRB5vooHrfG8DUfuo6n9F4El6sebSO2DGl4zas5E
    nXfEWJqZLWUPbDZo_4_qEylJ0P9WFbgrwFaan1sy1C69RT4I9_SBZM>
X-ME-Received: <xmr:0oqeamfOXL_wnTUQXzpjMrol2RZ9eOtUzF1pbZXFJdUu38SHcwnWl2iMFe0>
X-ME-Proxy-Cause: dmFkZTEfmTDj/r+7N3SoJC/vnCUjsKNijMe1VXFD0b88h55H2gBIFouQJkZSZK1yyk30Sm
    mIpo4+lqFBdKW9tiCpcqxnDvXOftY/uwGIbts6csXqNfxsNqOfnYnFu40A0wAOj35G9s+w
    IAMv9bbisiS7ei9Uc4aFfDLSUxZi6vkR+vpXkb8NeS63qvjIFlVzXVDhwHvtwaAOtbHyG2
    EUUfEj73JOAPxGIHZGnc8vHsjF2mphj6z1w+QhR+1XLYLXNDi1frGA6EeIrPkmhp8ZYVyp
    w0DvRbQmjeBcjm+uOYs5drfpJJgg1sHnCQ9G2soFC7z9xfrcgmKRrSpzbA16VZVaATLmZT
    ZZpZOu0tl5/4gKg+qoZ5IZ7qaYPHwrqUKdHIExtFs7fioLI5gLTr0F4QHJVJBRKlkzLr4m
    K5YGuRZ4f8L82cQXLfUa4Kr66Wq5HTJN5P34au8kd6WXzHrq3dZjIsF2Jdg8ZgBGK8io1B
    XiVuO1rHVxWbmb57VJuGh/Xg5U2eq5i+YXPNRjXNOlFSJH7ixGQqALgROdryD6te1lBVi9
    +IvFds5vBbSeGlRVpA9VO8QgGbou5n3M858WuEy1X5lIyV8RaV/nZmfZ+RuJLshVtx9w8Q
    Ue+xTAtMVMu3jSx8F35nt7wB3L+lykYzzizAZTrw5mwcsVrOsTVaT2NhQoDw
X-ME-Proxy: <xmx:0oqeavejnpkj9DshRpHV-EHWvSLETyqCwVmdfj4Le5Ha8riI9ZahSA>
    <xmx:0oqeaqWu7mMOgx40XlzHU_PBletIZ3WUpCym12-lUtLRS0kddKYEuw>
    <xmx:0oqeardxdpCkX47cG2-jLQWbfcXrUWkEw73ejK2ey5ukEokXfk397Q>
    <xmx:0oqeam8dmaY6ETqZy1QZxqXslHkrkaqvhvMmBS1kSMxwIp3X-rgJFA>
    <xmx:0oqeaimR-r9dbXUywGLTOhHtvjhgh_Ol1WVsl9pVa1YiVIEGgTK_EBbc>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 05:58:42 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v5 1/2] iommu/arm-smmu-v3: Add a cmdq_max_entries module parameter
Date: Mon,  7 Sep 2026 10:58:34 +0100
Message-ID: <20260907095835.1233352-2-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260907095835.1233352-1-kas@kernel.org>
References: <20260907095835.1233352-1-kas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The command queue depth comes straight from the maximum the hardware
advertises in IDR1, which reaches megabytes of coherent DMA per queue.
A system with several SMMUv3 instances pays that per instance, and the
Tegra241 CMDQV pays it again for every VCMDQ it preallocates.

Queue depth only bounds how many commands may be in flight before a sync.
A machine driving a handful of devices, or one with a tight memory budget,
has no use for the maximum, and no way to say so.

Add cmdq_max_entries, an upper bound on the number of command queue
entries. Decide the depth in arm_smmu_cmdq_max_n_shift(), which caps the
IDR1 value for natural alignment and then applies the parameter, so the
queue is allocated at the requested size. The Tegra241 CMDQV sizes its
VCMDQs from IDR1 itself, so route that through the same helper.

Round the request down to a power of two and floor it at one page worth of
entries. Without the floor, a small request trips the CMDQ_BATCH_ENTRIES
check in arm_smmu_device_hw_probe() and the SMMU fails to probe. The floor
also costs nothing: coherent DMA is page granular, so a shallower queue
occupies the same memory as one that fills the page.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Assisted-by: Claude-Code:claude-opus-5
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 45 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  2 +-
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..4550b1105e9c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -40,6 +40,11 @@ module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
 	"Disable MSI-based polling for CMD_SYNC completion.");
 
+static unsigned int cmdq_max_entries;
+module_param(cmdq_max_entries, uint, 0444);
+MODULE_PARM_DESC(cmdq_max_entries,
+	"Upper bound on the number of command queue entries, rounded down to a power of two and up to at least one page. Zero means the hardware maximum.");
+
 static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
@@ -4412,6 +4417,42 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
 };
 
 /* Probing and initialisation functions */
+
+/**
+ * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
+ * @ceiling: default log2 depth ceiling of the queue
+ * @ent_sz_shift: log2 of the queue entry size in bytes
+ * @entries: number of entries to cap the queue at, or zero for the default
+ *
+ * @entries is rounded down to a power of two and floored at one page, because
+ * coherent DMA is page granular: a shallower queue occupies the same memory as
+ * one that fills the page, and arm_smmu_init_one_queue() stops shrinking at a
+ * page too.
+ */
+static u32 arm_smmu_queue_max_n_shift(u32 ceiling, u32 ent_sz_shift,
+				      u32 entries)
+{
+	u32 floor = PAGE_SHIFT - ent_sz_shift;
+
+	if (!entries)
+		return ceiling;
+
+	return min(ceiling, max(ilog2(entries), floor));
+}
+
+/*
+ * Command queues are also allocated by the Tegra241 CMDQV for its VCMDQs, which
+ * need the same depth decision.
+ */
+u32 arm_smmu_cmdq_max_n_shift(u32 ceiling)
+{
+	/* Capped to ensure natural alignment */
+	ceiling = min(CMDQ_MAX_SZ_SHIFT, ceiling);
+
+	return arm_smmu_queue_max_n_shift(ceiling, CMDQ_ENT_SZ_SHIFT,
+					  cmdq_max_entries);
+}
+
 int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue *q, void __iomem *page,
 			    unsigned long prod_off, unsigned long cons_off,
@@ -5156,8 +5197,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
 	/* Queue sizes, capped to ensure natural alignment */
-	smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_CMDQS, reg));
+	smmu->cmdq.q.llq.max_n_shift =
+		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, reg));
 	if (smmu->cmdq.q.llq.max_n_shift <= ilog2(CMDQ_BATCH_ENTRIES)) {
 		/*
 		 * We don't support splitting up batches, so one batch of
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 50f8321e979c..11ae4d8f4ad2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1165,6 +1165,7 @@ static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
 
 void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
 			      struct arm_smmu_cmdq *cmdq);
+u32 arm_smmu_cmdq_max_n_shift(u32 ceiling);
 int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue *q, void __iomem *page,
 			    unsigned long prod_off, unsigned long cons_off,
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 6644075c1431..710a4c694b94 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -663,7 +663,7 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
 	/* Cap queue size to SMMU's IDR1.CMDQS and ensure natural alignment */
 	regval = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
 	q->llq.max_n_shift =
-		min_t(u32, CMDQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_CMDQS, regval));
+		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, regval));
 
 	/* Use the common helper to init the VCMDQ, and then... */
 	ret = arm_smmu_init_one_queue(smmu, q, vcmdq->page0,
-- 
2.54.0


