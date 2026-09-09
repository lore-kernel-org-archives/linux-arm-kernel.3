Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42BEC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xREhCCmQut5OqUhu2FonBsKEd9tAnwUS1SZjlRQn5Tk=; b=XBKk2WgK9ZND3Sg/fb5wrMHDsm
	MxyXAdCy5J2dXhk9Wfd++oVXQCpvW0Di17MsKH6f9ly0hIzDAzSGvvJQIvkX3jvdxG12HYA5davIa
	QaG58qUwNzoNxDMay7qUueGRLz7zgMuwMIIbx0tracdslJNcVSemQMxx/kA+sdrEu+kzapgcHj+Qw
	zpyFuAFxO4nGxaBJPCkiy9j0nCVIPURRiYDozQLdni42lQ8CmQh44cUzxey7Z2dQlgXa9Utk71hgO
	Af/udYZVS6W6XPVkcnjx7z3fuCQnVl7t8j85xfsYuxENX66cGju5mDALgLkrEmozIn0yn/LQLvqpc
	n8HHMzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ez0-0000000BLuY-2jox;
	Wed, 09 Sep 2026 09:52:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eyx-0000000BLte-3xe4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1A2E44505;
	Wed,  9 Sep 2026 09:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E9E1F00A3E;
	Wed,  9 Sep 2026 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947563;
	bh=xREhCCmQut5OqUhu2FonBsKEd9tAnwUS1SZjlRQn5Tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oo8bKrguvp0jaON4K1HLlO/wnaHCGzvCjyQ4/R7cLEApbOdQCh8lOa7ERakQm8Y9O
	 EAaun27xpCVY3rNeVODgVyOyyccCoCRR1An7qtYOAC7Z8zfVfncfoKhFX+WEL7tA7H
	 s4ZjPINFw7Yxn7G1wiBEnORDTlgFRHij9YMR9ELkvMx4zN+13oWbRm/sc6Fde0M/Fd
	 f1WY1bcRFuRwfupTJDBGtGmRFG0wdKZWrcvrSIFp3U1ghesvWpk46/79Y9DKvSUtrj
	 6pdUcKYea0GZRoMy7fUtXmTTidm+Uj2V9c8n1x4CWb4dl8n45xHDOxeuceJOGs0Ocj
	 8zOD9uTEsZ8IA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id F3F621980050;
	Wed,  9 Sep 2026 05:52:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 09 Sep 2026 05:52:40 -0400
X-ME-Sender: <xms:ZiyhaiJ1YlF9a9F-NuOYqtgbEo_2Cm2cAXuoBvveq2onin9PlQ2v1w>
    <xme:ZiyhahHJY6iqH0e0faksVO9urlk0kvUb4dADFBa2GChmF4QxLuL-O42LkOtmnoq3l
    _eziuTvRP-DgJ_Iav2NReSI4Kdl61dSVv_56FMQFKcADqfpg2In4L3d>
X-ME-Received: <xmr:Ziyhanw0vSRha8SHZTNBPvp4LnRFjgtLTh0nwOXt6Ac-6BYPIlaO-zoOlrc>
X-ME-Proxy-Cause: dmFkZTFwytqU9uv+zciMa5eiBsRpKvX4YmxFZbte5QJE/5T/6q/HSSjzOFSNlPT7p9e1lE
    PTpgnqChmN3ZbKYH5UbWEuDv8kP6WobXh4X5TpTFdyxGfNaEzASUFSdB0DXqKbp4OIGNfq
    yJPDG8a7DW6hHbrdiX2lJ6EE068Q3CqPWAseh9kGGCl8d0YIl/umSHyM/XGd1r1u44Mi2i
    ydjHOJKozyF05s/P175LFkrCOjsBIGAMHr2SJYqGxHktLPF6GwxVb9Ig2s6x+/PsAX4txX
    AbtuJ6SRYJuN75XjzBaPIwlj/OUrzMbJ3O23dAJnQQynVKjIwTOeab2d7E0OHqSfreuLSj
    ajcSxHBAUbTpt6rf1wSYqKYHd49lR3TS+53Dj/Xyj5GscSwTkZJp25QCiwjkSmSUv7ZlJH
    dkyiwSF5HSv5TmDoRSxeMNIMX9Uuth3eLjdprACZT/DDUt0IPNd6XdVKqBS4lJWx1CMaza
    /jImr+e9YSXieyRkE3FVvXrSgfW8eToCZCmq+FF9YKdpwoptJisD0aDZBoXluifxAdMWBc
    z0aqYzh7M3snCtB39P9i83J82NriJZwW774lYFLTLftfwWgLILrkVtj5tNpjvLbIgL6mLz
    I68u3HEhT03mjl3NXlWMgIU6TRBPIto1hFamid8zzPglqbLG7Q1Z5xHT7fFg
X-ME-Proxy: <xmx:Ziyhauj4vLCLLafTNJRTimoS8w5R2_8rC3PSLVdhrVGpfmYBVgj7pQ>
    <xmx:ZiyhakJfVcgF_r8n6mfDI2UbmO64YggCG9JVt7nhAPC8X1pF-GpQUQ>
    <xmx:ZiyhapCymImHRIG16MBYuRSnABRIne2woxIDo3JH_wtrotBZODJFBg>
    <xmx:ZiyhatSvfXZS1MlLr8cBM2wHp_97zsDG2l35cMBrG3IEvYVmDSBeUA>
    <xmx:Ziyhaiqk7yr2zq4e9A2RQrQlbQ2BI4BJdjJa6LrKUUGnVx6IPSAlLvwi>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 05:52:37 -0400 (EDT)
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
Subject: [PATCH v6 2/2] iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel
Date: Wed,  9 Sep 2026 10:52:28 +0100
Message-ID: <20260909095228.2174031-3-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909095228.2174031-1-kas@kernel.org>
References: <20260909095228.2174031-1-kas@kernel.org>
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

All three queues are sized from the maxima the hardware advertises in IDR1
and allocated at probe, up to 4 MB each on a 4K-page kernel. The capture
kernel already disables two of them: arm_smmu_device_reset() drops
CR0_EVTQEN and CR0_PRIQEN. It still allocates both at full size.

A kdump capture kernel runs from a small crashkernel reservation, and every
SMMUv3 instance pays that cost again, up to 12 MB apiece. It goes to queues
that either serve the handful of devices used to save the dump or are
switched off outright, and it is memory the dump itself needs.

Default all three depths to one page worth of entries when
is_kdump_kernel(). The queues carry commands and fault records rather than
DMA data, so dump throughput is unaffected. A shallower command queue only
bounds how many commands may be in flight before a sync, which does not
matter for the few devices that save the dump.

An explicit cmdq_max_n_shift still wins, so a capture kernel that wants a
deeper command queue can ask for one on the command line.

Suggested-by: Kyle McMartin <jkkm@meta.com>
Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 36 +++++++++++++++++----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 78618a9dfa8b..3a6de5e667e0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4424,6 +4424,9 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
  * @ent_sz_shift: log2 of the queue entry size in bytes
  * @shift: log2 depth asked for, or zero for the default
  *
+ * The default is @ceiling, except in a kdump capture kernel, which defaults to
+ * one page worth of entries.
+ *
  * @shift is floored at one page, because coherent DMA is page granular: a
  * shallower queue occupies the same memory as one that fills the page, and
  * arm_smmu_init_one_queue() stops shrinking at a page too.
@@ -4432,10 +4435,30 @@ static u32 arm_smmu_queue_max_n_shift(u32 ceiling, u32 ent_sz_shift, u32 shift)
 {
 	u32 floor = PAGE_SHIFT - ent_sz_shift;
 
-	if (!shift)
+	if (shift)
+		shift = max(shift, floor);
+	else if (is_kdump_kernel())
+		shift = floor;
+	else
 		return ceiling;
 
-	return min(ceiling, max(shift, floor));
+	return min(ceiling, shift);
+}
+
+static inline u32 arm_smmu_evtq_max_n_shift(u32 ceiling)
+{
+	/* Capped to ensure natural alignment */
+	ceiling = min(EVTQ_MAX_SZ_SHIFT, ceiling);
+
+	return arm_smmu_queue_max_n_shift(ceiling, EVTQ_ENT_SZ_SHIFT, 0);
+}
+
+static inline u32 arm_smmu_priq_max_n_shift(u32 ceiling)
+{
+	/* Capped to ensure natural alignment */
+	ceiling = min(PRIQ_MAX_SZ_SHIFT, ceiling);
+
+	return arm_smmu_queue_max_n_shift(ceiling, PRIQ_ENT_SZ_SHIFT, 0);
 }
 
 /*
@@ -5194,7 +5217,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	if (reg & IDR1_ATTR_TYPES_OVR)
 		smmu->features |= ARM_SMMU_FEAT_ATTR_TYPES_OVR;
 
-	/* Queue sizes, capped to ensure natural alignment */
 	smmu->cmdq.q.llq.max_n_shift =
 		arm_smmu_cmdq_max_n_shift(FIELD_GET(IDR1_CMDQS, reg));
 	if (smmu->cmdq.q.llq.max_n_shift <= ilog2(CMDQ_BATCH_ENTRIES)) {
@@ -5209,10 +5231,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		return -ENXIO;
 	}
 
-	smmu->evtq.q.llq.max_n_shift = min_t(u32, EVTQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_EVTQS, reg));
-	smmu->priq.q.llq.max_n_shift = min_t(u32, PRIQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_PRIQS, reg));
+	smmu->evtq.q.llq.max_n_shift =
+		arm_smmu_evtq_max_n_shift(FIELD_GET(IDR1_EVTQS, reg));
+	smmu->priq.q.llq.max_n_shift =
+		arm_smmu_priq_max_n_shift(FIELD_GET(IDR1_PRIQS, reg));
 
 	/* SID/SSID sizes */
 	smmu->ssid_bits = FIELD_GET(IDR1_SSIDSIZE, reg);
-- 
2.54.0


