Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FA2C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFh9YtmuRxf4eh9UDdIrcg+KHXLK5k10/OU6AZkVzew=; b=Y3SqTH0J3LBlcvERbrWAUBz8Fx
	3zI1qIbmhaBaWwq8w4SxTOkK/9ZMzMJ1Kvn0vx4lhz8nIdDqJAC65OsrDZW+5meicNNtvjkvg2hUe
	A/f9jTb5j02mNL7qvFfaIRqImEdFxsxfqUKE/BtfN3Fmc0H/4zXJH+zyrSIoV0vfQUf339WQVG8ty
	AbZwpxolu3jGNJqOMIrvustXyxTFlvKGuvoC0iWkIiJnBE7V83aSiDkxtf+LQPYXj+EVhPYlt1vOi
	zOdMBoBy7mAuPEmWfGbNgdcmT8vcTwlRVNRVLlmJGIiQVaA2FFue71B55aDQAWeiBZBphJH5sx2SP
	IrTCZmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jv2-0000000Edcb-1boV;
	Wed, 02 Sep 2026 12:18:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jv1-0000000Edc2-09C9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:18:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49234600C8;
	Wed,  2 Sep 2026 12:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A821F00A3E;
	Wed,  2 Sep 2026 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788351498;
	bh=IFh9YtmuRxf4eh9UDdIrcg+KHXLK5k10/OU6AZkVzew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MigvAUEzA2aDVaVXDVkmh7QVts7LHEdW9HXsOLthq4g6Ysq1TNjpv7ddnrnFQ8slu
	 Kpf9jM1J5HXwDbPe03dMiv+d4ZwxiBm0uWB2YbU/yzZnUydGnClGpV5rEK0qpoREpj
	 xUELejHZdKUrL6GX24NH1hEqKTW94JD/WWHBvpPoHuPtBwAzxC5qkSBYpFgIuyyZBE
	 0bSMPCnTS/OTapJqgrcRxtfQN3p7qAWgUAcHJYo+FJ+9Z5UHQ0eZXmjHVWryebTm+H
	 lWfvaXRRSqMlgsM62Vn997Om4rTfXir+joOryU2w+vhAJg7xcVB+wQ2zYqVQTpJOO5
	 PgG4SIOOyU+4g==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 36313198004A;
	Wed,  2 Sep 2026 08:18:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 02 Sep 2026 08:18:15 -0400
X-ME-Sender: <xms:BRSYakVGvdfKBZVx8nDh5jNSuuYUh5QhXo27le4r4FmmMRM_MbIkpQ>
    <xme:BRSYaqA7RDhRUAv75LW3yu8wWgYNndp-nBgDt70Xh8PeBraQr-VKQ8FTBkgwakjiv
    qrdQ_hXkrHTZ0blEKPk_-jNaX3RFeOGzteTxdiwFiJEooldzVwJ84k>
X-ME-Received: <xmr:BRSYajxb1R4qSyn92YRXnF_B19cwGdI8lFZSoaSprdDcBdfX7oqn_ublQAM>
X-ME-Proxy-Cause: dmFkZTEXUpnCPuNV+2RXO89bJBzt4DT2UHlbCRCgM3H3femH/cw0lQ3qMUt20S/eAB+4J7
    iCaYJ5/K2JKOFbtN+ZbuperC7KlXF9+UEwTC9jegMZ9EKKwUKtedsborn38YXPNdlIFhn5
    8yR8pn5ZMAt7HfPjC9fJduXSS5GFb7KCir/ruu+hNM8Se2kuXS4kwTxk+QMNsiz+Iox9Fx
    Mv4zalhvjCm/q9/A7354UFOhJSCoU64B4kqmawSE3+O5l7rE5y4GJp7x4WQThnpB8pEDVG
    kdoS9tsZorczMO3BcsQTS31CT66MhUAezHkJ6n3d0Vd2ceKrMqxzcaAkir6ZUwSRiiCAXT
    X5O4t6GQEG84cEuJR1O6/u0vHdGvcaTEdJsl3R6fleuQGjFAopm4n/DUORsny3kAxHS5WE
    YcpvpP0Z5XIlHZdSsBRx284k6U9xMYtZSYdcCX72OtrxiNShc7lwqc6Q7ufbb6pVWQyAgE
    NVi9qUzG8lADzZkro7IsbxbWhznfBHU5Ukhm8/pTzQwXBPBa51tBwAnfXalJV8Tqva5Omo
    NbZf6QGvx5opUIC0IroDVY5I7MllpUaJPEEsnv3YzFMl3nTcvaqRFBfk/AgfeQO/unS/Xk
    JImaoK5VMpoe+XntCM8jNP6fWoJVZ+8PgUQRX1R99GbLYVqwH+ji9uVc9xHg
X-ME-Proxy: <xmx:BRSYaga1fg5B7Sza_8TEG-2RPdoQq8qDEOMp_TsWRHWXomYM0WJGiQ>
    <xmx:BRSYagRP8JSJ6lEfwpVsnhcgqYTkv7qzylg6PvE90BdrHNkCo32eJQ>
    <xmx:BRSYajiFS9Rr33LP11sJcq7Ox7q8MK0LO-iFysFBflB1UGy6WgJk5w>
    <xmx:BRSYar5Xe3nsfU5GPRsr2vUnBC5VeYbSLzspvMOsc9DkQsGkmLfb1Q>
    <xmx:BRSYaun2lDpk6neIKvCunNwgC0zfDQnv3L5RYUnC_4kc9TwxI2yYNzjj>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 08:18:13 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
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
Subject: [PATCH v4 1/2] iommu/arm-smmu-v3: Add a cmdq_entries module parameter
Date: Wed,  2 Sep 2026 13:17:23 +0100
Message-ID: <20260902121724.3494954-2-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902121724.3494954-1-kas@kernel.org>
References: <20260902121724.3494954-1-kas@kernel.org>
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

Add cmdq_entries, an upper bound on the number of command queue entries.
Apply it where the depth is decided, alongside the IDR1 maxima in
arm_smmu_device_hw_probe(), so the queue is allocated at the requested
size rather than allocated large and trimmed afterwards. The Tegra241
CMDQV sizes its VCMDQs from IDR1 itself, so route that through the same
helper.

Round the request down to a power of two and floor it at one page worth of
entries. Coherent DMA is page granular, so a shallower queue occupies the
same memory as one that fills the page, and the retry loop in
arm_smmu_init_one_queue() already stops at a page. On every page size arm64
supports, that floor leaves the queue well above CMDQ_BATCH_ENTRIES, so
command batching keeps working whatever is asked for.

Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Assisted-by: Claude-Code:claude-opus-5
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 42 ++++++++++++++++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  5 ++-
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5732f3ba0122..b371e9ddbfcc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -40,6 +40,11 @@ module_param(disable_msipolling, bool, 0444);
 MODULE_PARM_DESC(disable_msipolling,
 	"Disable MSI-based polling for CMD_SYNC completion.");
 
+static unsigned int cmdq_entries;
+module_param(cmdq_entries, uint, 0444);
+MODULE_PARM_DESC(cmdq_entries,
+	"Upper bound on the number of command queue entries, rounded down to a power of two. Zero means the hardware maximum.");
+
 static const struct iommu_ops arm_smmu_ops;
 static struct iommu_dirty_ops arm_smmu_dirty_ops;
 
@@ -4412,6 +4417,38 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
 };
 
 /* Probing and initialisation functions */
+
+/**
+ * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
+ * @hw_shift: log2 depth the hardware allows, capped for natural alignment
+ * @ent_sz_shift: log2 of the queue entry size in bytes
+ * @want: number of entries asked for, or zero to use @hw_shift
+ *
+ * @want is rounded down to a power of two. It never sizes a queue below one
+ * page, because coherent DMA is page granular: a shallower queue occupies the
+ * same memory as one that fills the page, and arm_smmu_init_one_queue() stops
+ * shrinking at a page too.
+ */
+static u32 arm_smmu_queue_max_n_shift(u32 hw_shift, u32 ent_sz_shift, u32 want)
+{
+	u32 page_shift = PAGE_SHIFT - ent_sz_shift;
+
+	if (!want)
+		return hw_shift;
+
+	return min(hw_shift, max(ilog2(want), page_shift));
+}
+
+/*
+ * Command queues are also allocated by the Tegra241 CMDQV for its VCMDQs, which
+ * need the same depth decision.
+ */
+u32 arm_smmu_cmdq_max_n_shift(u32 hw_shift)
+{
+	return arm_smmu_queue_max_n_shift(hw_shift, CMDQ_ENT_SZ_SHIFT,
+					  cmdq_entries);
+}
+
 int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue *q, void __iomem *page,
 			    unsigned long prod_off, unsigned long cons_off,
@@ -5048,6 +5085,7 @@ static void arm_smmu_get_httu(struct arm_smmu_device *smmu, u32 reg)
 
 static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 {
+	u32 hw_shift;
 	u32 reg;
 	bool coherent = smmu->features & ARM_SMMU_FEAT_COHERENCY;
 
@@ -5156,8 +5194,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
 	/* Queue sizes, capped to ensure natural alignment */
-	smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_CMDQS, reg));
+	hw_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_CMDQS, reg));
+	smmu->cmdq.q.llq.max_n_shift = arm_smmu_cmdq_max_n_shift(hw_shift);
 	if (smmu->cmdq.q.llq.max_n_shift <= ilog2(CMDQ_BATCH_ENTRIES)) {
 		/*
 		 * We don't support splitting up batches, so one batch of
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 50f8321e979c..a8cb6a69f03b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1165,6 +1165,7 @@ static inline void arm_smmu_domain_inv(struct arm_smmu_domain *smmu_domain)
 
 void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
 			      struct arm_smmu_cmdq *cmdq);
+u32 arm_smmu_cmdq_max_n_shift(u32 hw_shift);
 int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue *q, void __iomem *page,
 			    unsigned long prod_off, unsigned long cons_off,
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 6644075c1431..3fe1075a11a1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -655,6 +655,7 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
 	struct arm_smmu_cmdq *cmdq = &vcmdq->cmdq;
 	struct arm_smmu_queue *q = &cmdq->q;
 	char name[16];
+	u32 hw_shift;
 	u32 regval;
 	int ret;
 
@@ -662,8 +663,8 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
 
 	/* Cap queue size to SMMU's IDR1.CMDQS and ensure natural alignment */
 	regval = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
-	q->llq.max_n_shift =
-		min_t(u32, CMDQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_CMDQS, regval));
+	hw_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_CMDQS, regval));
+	q->llq.max_n_shift = arm_smmu_cmdq_max_n_shift(hw_shift);
 
 	/* Use the common helper to init the VCMDQ, and then... */
 	ret = arm_smmu_init_one_queue(smmu, q, vcmdq->page0,
-- 
2.54.0


