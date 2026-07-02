Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133BFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cEaUVNTt35/9gjndPgOFyykYqGHl4r842ag5IRhn4OA=; b=gxrGx7p8gvllm5RsnuwgZDUvep
	dV1NpRcmxaMRrgBd3WNPLUeNoSTcMHXb2NopWCQ1fbZlw9Rjyhdokr5Eklm/QSk7sO6suNBaJNJRe
	t/YHtCnP1e9rkf+PuVGkMacqzQlP5mhEjeChA7mmYVHxFpUXeStcg29C5VYimpPH6EFvyKvzgDRX5
	S08cpMjQWfXYXq4Ukt6eBsFZxJ48yChL//RuJ6g7fIXvnCopEpzXsY73wBYM2zbcwMWka+m9jCgj7
	vNcjM1tZQZzpd0OX/HsG/aDdNRwKHtYu7UktEP4wyHG82NUn4D5mP6hhPtk7okyczAtyP6+v/GvXe
	5UTTrqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFas-00000004JjU-1fic;
	Thu, 02 Jul 2026 11:28:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFaq-00000004JjO-2IWq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 11:28:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCA7443CE6;
	Thu,  2 Jul 2026 11:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B8E1F00A3A;
	Thu,  2 Jul 2026 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782991711;
	bh=cEaUVNTt35/9gjndPgOFyykYqGHl4r842ag5IRhn4OA=;
	h=From:To:Cc:Subject:Date;
	b=VjmsCVafUVSCuPPbaQWJH92Up9ypMgTuf/N9dV9j60mvfdgIDSFGqQrzFtPVDxmk6
	 e2jYeFkG+a+nX3eSYUzlsFf1Yf7nEeV36yvbAXraixxxoHnH7yQgUtB0JD1SI7Qod/
	 pEG/SxEWvPh622TZ4CbglNyo7Wmpg83EI5aZH9eYYFOoFm8WgGBjgWUdRcr+biCPnc
	 ioP297OLRTfCFzjFjR7xMrxqEEx2ScRjMhnWwyR5Dla4Z3MSwFgu8FMYxwcxfFRiZV
	 07lEixErf5nmKoDXHVrxAISuT8tGUY+4s9V7eNU/w82y3vac4oQI5tAo6y8YuKiPOw
	 ntJY47fIL06kw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7B128F40068;
	Thu,  2 Jul 2026 07:28:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 02 Jul 2026 07:28:30 -0400
X-ME-Sender: <xms:XktGajNL0AgV96PdEXQfYq-prm6p1Bw1-SFsdKq7h38rrJQ6aQV3Qw>
    <xme:XktGamGoQpx8L75omiiC9aif2jsSMFBjJAY7iMLdSDiFpFsXXxFW4o_Ch0yicHWsN
    tp_ND3o6amFQG7YzB6MMGtmZqrDPsYdUrY6O1pP_6A29q0B_B6Msn8>
X-ME-Received: <xmr:XktGahzlrYyivlAidKANg0iCfSPeNIc1Ce_koBquTHCO_-C-Gmmb5q-fGXWrSQ>
X-ME-Proxy-Cause: dmFkZTGDz2TgXYD15RfQJl3C1/PFcHSD6jKh/svFZqpNhYXxBkJjR5Fny7ZMYPRtBRXty0
    O8Lh42t82Rp0MOZw771Vs+6UYgwEZ0aEm8GOYOT1Gf6b08MaOkgiPSj/PP7kufaV4rS25j
    SbuEtcm2NTfjlY+vJM/W6AmTncqiZbnT3xko8EfR+JGAgSDA3eFv2WyubKH5etbgxr9ydS
    u+ZlevPd78XVZ+3jmtHfvGuzvlxsPzFZx4lx5yMK7cLLkxfl2w1urjhK/ZkDbfPJguti0W
    Rg88IS3FM1KRDa8mMpUINhuTpGxXL7vi00izNm3lYNPMnmWxzvoDrhTNFjTd//decMf5cE
    8jl+Lvf1u5iVwiB/lWpGsfaqkFBWsMOdr9GiaJyPM2iNtzrlIhbkQzRxOTXg4agDCXcXxp
    676r3wOFHH9YKLkDy89zgz04wTkPUGSPEWscSF9FplXqIh1wVyRNDhHOI6V5pkzfxN54cc
    u+q507o2EM0ctxFB3wMb0mjzbI3am4m+BpMtUib4XTM+JYKqPkRGFvPLTnyf924OJXWSpb
    fFKBfC3iYCvteDVFEDqQV5+2Pr822eZi/KHhL321w3np4c2UVOGC1gf9+UAL//zypxrVSa
    Lzi1tf/Fl9uHJtWYQnTvLj8BV1NtzSwY+x3AwoMQvHXT0D78/a6fMj+3kBXQ
X-ME-Proxy: <xmx:XktGanozHPKmQEuV7DFmCke5iZ3GfEpuh59qRnym6_PqzjOJ0hyXcw>
    <xmx:XktGanmoqSnPSWUMiyxd_SGbZm2tPCFmNTn4SdmNV8_kp1E54cpTaA>
    <xmx:XktGahURk81tPf4P5nn1zqjyrF-57AYwDZBPEbMSRWs-L2atQ81thg>
    <xmx:XktGarouPTcWIXliYS42LQcI8KxLIkA4tDtV_XQXib0_7VU3Tg7I8Q>
    <xmx:XktGaiVNKupu9W6zZ0A1KTL1zob1ZcbPjJHqcVviTiML3xhMweySgcKz>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jul 2026 07:28:29 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kyle McMartin <jkkm@meta.com>,
	Breno Leitao <leitao@debian.org>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v2] iommu/arm-smmu-v3: Shrink command/event/PRI queues in kdump kernel
Date: Thu,  2 Jul 2026 12:28:25 +0100
Message-ID: <20260702112825.781750-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
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

The command, event and PRI queues are sized from the maxima the hardware
advertises in IDR1, which can be several megabytes each. On systems with
many SMMUv3 instances that cost is paid per instance and adds up to tens
of megabytes of coherent DMA in the capture kernel.

A kdump capture kernel runs from a small crashkernel reservation and only
has to drive the few devices used to save the dump, so deep queues serve
no purpose. The queues carry invalidation commands and fault records, not
DMA data, so dump throughput is unaffected; a shallower queue only bounds
how many commands may be in flight before a sync, which does not matter for
the capture kernel's small device count and modest I/O.

Clamp every queue to a single page when is_kdump_kernel() is true. Doing
it in arm_smmu_init_one_queue() covers the command, event and PRI queues
in one place. The command queue still holds at least one batch plus a sync
(256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
command batching keeps working.

Suggested-by: Kyle McMartin <jkkm@meta.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
v2:
 - Use min() instead of min_t(); both operands are u32 so the cast was
   redundant (Jason Gunthorpe, Breno Leitao).
 - Add Reviewed-by from Breno.

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..a4ec4a59e527 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4414,6 +4414,20 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 {
 	size_t qsz;
 
+	/*
+	 * A kdump capture kernel runs from a small crashkernel reservation and
+	 * only has to drive the few devices used to save the dump, so there is
+	 * no point sizing the queues for the (multi-megabyte) maxima the
+	 * hardware advertises. Clamp each queue to a single page. ent_sz_shift
+	 * is the log2 of the entry size in bytes (dwords * 8).
+	 */
+	if (is_kdump_kernel()) {
+		u32 ent_sz_shift = ilog2(dwords) + 3;
+
+		q->llq.max_n_shift = min(q->llq.max_n_shift,
+					 PAGE_SHIFT - ent_sz_shift);
+	}
+
 	do {
 		qsz = ((1 << q->llq.max_n_shift) * dwords) << 3;
 		q->base = dmam_alloc_coherent(smmu->dev, qsz, &q->base_dma,
-- 
2.54.0


