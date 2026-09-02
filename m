Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BE5C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MOJSt0tbAYCoMv0mWlV9WfNHa0zoZMLaNSvXKsUlR4=; b=TM+tld2Ka9Ci4UDfl5nlAJw7nl
	MR3eFtwlq+7Kf0DqJtSRAgvFH1A9An0c56lfff/j98ur69PUblsAf6YUN9IhvIb4CBe0GHz1QbNG6
	GAspduBME7TgkTOsnVsjYzel6Dg6Tlur2YeYhmNAtXfmZrbd+8DjnOJJKnKRu+v5AEH7HHEJoAMlk
	Wa+eVl5lK2+6NOYbgXId56YdlTSP3By6cRjC7Ofo0VvrZy8r/wRH0GkXM1WqCY1hyxCT6UDXpQl+Q
	JGJKe+FAUEfDTQ98maSLlBnSX3VZMyabhF1prXwzxi17pQvjuRto08HZmjJA2Ghe1b1Uf0GFXx88l
	EyHUXzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jv5-0000000EdeE-2UIk;
	Wed, 02 Sep 2026 12:18:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jv4-0000000EddX-24ey
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:18:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E90156020B;
	Wed,  2 Sep 2026 12:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90A41F000E9;
	Wed,  2 Sep 2026 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788351501;
	bh=3MOJSt0tbAYCoMv0mWlV9WfNHa0zoZMLaNSvXKsUlR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gZen3L4I53kv/y+z96SrlDbHDldx6Yg27LWEwNE9QbeY5s23lmiliQ7AoOnygMmpq
	 SKjayVQyVYnuJ9tOiUzGklB4gSgRC1jr/GsuobAevkH7GXw8Y5HRbUYvW4J8EYNpcA
	 TOazMZajjTVOtgy6bo9Ha9IHKHtavmLxxjy9AI5xdgqAFUrWqA9WCmGU//gyVGufdH
	 ACQjlJF07g3z+XgxphZ1UgPanfz6+u44S3Ua+dp5mff+qHMNr1RRqXB5K+oVtFBSJF
	 Ngj03+jarQyW1PanWjE6S3pWgkThwWZw+Xr+rfDh19e/V9uHTdOk8ucsS86dji/yBz
	 9czOiCqFtd7RA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 098E51980047;
	Wed,  2 Sep 2026 08:18:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 02 Sep 2026 08:18:19 -0400
X-ME-Sender: <xms:CRSYajN9fUD2uFLQroPQe6yqahQHNfhIOfkmZC5u0y6h6Y5ObR2Vbw>
    <xme:CRSYak5-0e3dRVAgGxLGKz_beknLOinqBDh8biPShnIV4am6D3IBKJY8dwmtWjWUP
    5-8yz4dlDeQaCQVZVl9OfNfZWzGLU7P179B9ay1NVhDF0WnrNnYJQ>
X-ME-Received: <xmr:CRSYanUthD9iyEn07JFU0tawpfwy3-AAQ61TfHost6r3rFTOFclBrVm0Mk0>
X-ME-Proxy-Cause: dmFkZTEXUpnCPuNV+2RXO89bJBzt4DT2UHlbCRCgM3H3femH/cw0lQ3qMUt20S/eAB+4J7
    iCaYJ5/K2JKOFbtN+ZbuperC7KlXF9+UEwTC9jegMZ9EKKwUKtedsborn38YXPNdlIFhn5
    8yR8pn5ZMAt7HfPjC9fJduXSS5GFb7KCir/ruu+hNM8Se2kuXS4kwTxk+QMNsiz+Iox9Fx
    Mv4zalhvjCm/q9/A7354UFOhJSCoU64B4kqmawSE3+O5l7rE5y4GJp7x4WQThnpB8pEDVG
    kdoS9tsZorczMO3BcsQTS31CT66MhUAezHkJ6n3d0Vd2ceKrMqxzcaAkir6ZUwSRiiCAo8
    YxFOUJix8sr2R/NhIrohmv1u0wUDXe0+Qq/P1h1f3FfQ9iLTY3/H9I2yv9v+Wkq7Vhyn6i
    vwbp7BHeTc9MDHe/bhvDLE1vw27v/SXFSR9/ISriWJgxq0IqkLovc1hAEy/7vJTfalCxaT
    4/KttY7KrDS/Sk0ZR0yOfOkiG0U9+JSRM76efCi8T2XeuxDtVZykA6f9MVBH4KALFZXCca
    kpRXcqGZjUx7bJ4vPtEGjp8kdFkFxmQ9J5S/eUYR0LwRRDecu0mjDuAvqmu8nYOMEz7qAH
    vvC9Z4cZij0h7fv7m9ZJ+rPn3TRbFr2LolZoOc7OQK0PLP8Jh2aW/JXB5jsg
X-ME-Proxy: <xmx:CRSYau2wsE5JFolNmGq016YIqfOz-dkfGCM4gwageMgLWOkYvW4BVw>
    <xmx:CRSYamM3C_sxHbhNkDlQL5kvCdYe7yfb7yI-EU2l0_alFfemSXflbg>
    <xmx:CRSYap1en10ewa2gKjvn36dBiEtsAdP5ixmp-SL4H3phkx2G7w5yPQ>
    <xmx:CRSYal2f5J1bam9lopW7NEuLvPSCQSA-MfbSECWBFto4c6-Y2wZn3Q>
    <xmx:CRSYan-3RA0tIkQu7axianU4kbWlHsfSY-AdB1ELxgSqCTJqPNkgNXag>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 08:18:16 -0400 (EDT)
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
Subject: [PATCH v4 2/2] iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel
Date: Wed,  2 Sep 2026 13:17:24 +0100
Message-ID: <20260902121724.3494954-3-kas@kernel.org>
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

All three queues are sized from the maxima the hardware advertises in IDR1
and allocated at probe, reaching megabytes of coherent DMA each. The
capture kernel already disables two of them: arm_smmu_device_reset() drops
CR0_EVTQEN and CR0_PRIQEN. It still allocates both at full size.

A kdump capture kernel runs from a small crashkernel reservation, and a
system with several SMMUv3 instances pays the full cost per instance. Tens
of megabytes go to queues that either serve the handful of devices used to
save the dump or are switched off outright, and that is memory the dump
itself needs.

Default all three depths to one page worth of entries when
is_kdump_kernel(). The queues carry commands and fault records rather than
DMA data, so dump throughput is unaffected. A shallower command queue only
bounds how many commands may be in flight before a sync, which does not
matter for the few devices that save the dump.

An explicit cmdq_entries still wins, so a capture kernel that wants a
deeper command queue can ask for one on the command line.

Suggested-by: Kyle McMartin <jkkm@meta.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Assisted-by: Claude-Code:claude-opus-5
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 25 +++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index b371e9ddbfcc..a786219f40ff 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4422,7 +4422,10 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
  * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
  * @hw_shift: log2 depth the hardware allows, capped for natural alignment
  * @ent_sz_shift: log2 of the queue entry size in bytes
- * @want: number of entries asked for, or zero to use @hw_shift
+ * @want: number of entries asked for, or zero to use the default
+ *
+ * The default is @hw_shift, except in a kdump capture kernel, which defaults
+ * to one page worth of entries.
  *
  * @want is rounded down to a power of two. It never sizes a queue below one
  * page, because coherent DMA is page granular: a shallower queue occupies the
@@ -4432,11 +4435,16 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
 static u32 arm_smmu_queue_max_n_shift(u32 hw_shift, u32 ent_sz_shift, u32 want)
 {
 	u32 page_shift = PAGE_SHIFT - ent_sz_shift;
+	u32 want_shift;
 
-	if (!want)
+	if (want)
+		want_shift = max(ilog2(want), page_shift);
+	else if (is_kdump_kernel())
+		want_shift = page_shift;
+	else
 		return hw_shift;
 
-	return min(hw_shift, max(ilog2(want), page_shift));
+	return min(hw_shift, want_shift);
 }
 
 /*
@@ -5208,10 +5216,13 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		return -ENXIO;
 	}
 
-	smmu->evtq.q.llq.max_n_shift = min_t(u32, EVTQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_EVTQS, reg));
-	smmu->priq.q.llq.max_n_shift = min_t(u32, PRIQ_MAX_SZ_SHIFT,
-					     FIELD_GET(IDR1_PRIQS, reg));
+	hw_shift = min_t(u32, EVTQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_EVTQS, reg));
+	smmu->evtq.q.llq.max_n_shift =
+		arm_smmu_queue_max_n_shift(hw_shift, EVTQ_ENT_SZ_SHIFT, 0);
+
+	hw_shift = min_t(u32, PRIQ_MAX_SZ_SHIFT, FIELD_GET(IDR1_PRIQS, reg));
+	smmu->priq.q.llq.max_n_shift =
+		arm_smmu_queue_max_n_shift(hw_shift, PRIQ_ENT_SZ_SHIFT, 0);
 
 	/* SID/SSID sizes */
 	smmu->ssid_bits = FIELD_GET(IDR1_SSIDSIZE, reg);
-- 
2.54.0


