Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41389C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xH6eLul/YhpJKKXYAPe1QjJEiXAaUod9+uNqxj4KWLg=; b=bRhRp/xT1qyLpTNGvOiYyEHQO7
	Gp1OAtAOQbqxbiHekE0H4cCdQtRa4fThP6DZowd/XmJH32691xvzhTcVfSqepxpqEt4AG298bro00
	WyqOvdJWZPoyFdJJf9b+CFKmG1XE2xuR6ALwR3WFd79SlqoaOvzP1X0NqF3Sl6+VvJ8VF+IFJ5gP0
	imQkVN2zXbZ8d4U/jt2lglxEaoLM+OPAOc/CgEyo/NrGAIMgx3ZgAKDwXhGr+KtYeRZFiVdsKGXqM
	uc1S7XJnazkKgXSFIBx2d/4SqMdd4EcKkb+cOHY/Jm8kySMx7UZTcYSSCFSW+7c405UsUkfE5iV5D
	ChzPFNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGOU-00000007TIK-3ari;
	Fri, 07 Aug 2026 08:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGOS-00000007TH9-3Vqp;
	Fri, 07 Aug 2026 08:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xH6eLul/YhpJKKXYAPe1QjJEiXAaUod9+uNqxj4KWLg=; b=re0BDsFAkfEolpm3YmxrlJLcNG
	ft20VuUPSIv7rriv86cR4KifPomLiRZJcsE97UlE/l78dudaSaqSYfhQVb/rSqUj3YuUoXAaDpISp
	NuSYS94V9rWaJP1zKAu/hJe/chLVCZLTWZhi36XAR8DdT7i5XSNZ1inLRXvN2hWEh3P2zhDIq6hAG
	ACzScEWE+cTTLZIGhQCJGh6KVVl3x7UhYwcJVhq1o/+TobkiQvFGQvZlpR1agC++HEYCY5AGuNUwI
	9m9Eebao8WQdfa214NA01+GADN1C+yVFvWAQMMyx6KP16mw8QaQ0Nh63AfrlFgCqb5m6ic9qQNqTH
	AbO8zfVA==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsGOM-0000000CDnw-3imp;
	Fri, 07 Aug 2026 08:57:31 +0000
X-UUID: ee63d038923d11f1aa26b74ffac11d73-20260807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b4704914-fd26-4b0c-b5cb-91c272e333fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f1a8bc65811c2fe3f19bea9bbe9be33c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ee63d038923d11f1aa26b74ffac11d73-20260807
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 404231109; Fri, 07 Aug 2026 16:56:51 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-riscv@lists.infradead.org
Cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 2/2] perf: RISC-V: store available counter mask as bitmap
Date: Fri, 07 Aug 2026 16:50:00 +0800
Message-ID: <prpmask02cmap.1786092600.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.1786092600.git.liuxixin@kylinos.cn>
References: <cover.1786092600.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_095729_753925_31624417 
X-CRM114-Status: GOOD (  17.34  )
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

The available-counter mask was a single unsigned long, but iteration
uses RISCV_MAX_COUNTERS (64). On RV32 that reads past the object. Filling
with BIT(i) is also wrong for i >= 32.

Use DECLARE_BITMAP, set_bit/bitmap helpers, and stop counters one word
at a time.

Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/perf/riscv_pmu_legacy.c |  5 +++--
 drivers/perf/riscv_pmu_sbi.c    | 29 ++++++++++++++++++-----------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 4d6461d6a..1b8e4789c 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -110,8 +110,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 {
 	pr_info("Legacy PMU implementation is available\n");
 
-	pmu->cmask = BIT(RISCV_PMU_LEGACY_CYCLE) |
-		BIT(RISCV_PMU_LEGACY_INSTRET);
+	bitmap_zero(pmu->cmask, RISCV_MAX_COUNTERS);
+	set_bit(RISCV_PMU_LEGACY_CYCLE, pmu->cmask);
+	set_bit(RISCV_PMU_LEGACY_INSTRET, pmu->cmask);
 	pmu->ctr_start = pmu_legacy_ctr_start;
 	pmu->ctr_stop = NULL;
 	pmu->event_map = pmu_legacy_event_map;
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index d6c66e375..c913d73f8 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -97,7 +97,7 @@ static unsigned int riscv_pmu_irq_mask;
 static unsigned int riscv_pmu_irq;
 
 /* Cache the available counters in a bitmask */
-static unsigned long cmask;
+static DECLARE_BITMAP(cmask, RISCV_MAX_COUNTERS);
 
 static int pmu_event_find_cache(u64 config);
 struct sbi_pmu_event_data {
@@ -364,7 +364,7 @@ static void pmu_sbi_check_event(struct sbi_pmu_event_data *edata)
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
-			0, cmask, 0, edata->event_idx, 0, 0);
+			0, cmask[0], 0, edata->event_idx, 0, 0);
 	if (!ret.error) {
 		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
 			  ret.value, 0x1, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
@@ -488,10 +488,10 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
 	union sbi_pmu_ctr_info *info;
 	u32 hpm_width = 0, hpm_count = 0;
 
-	if (!cmask)
+	if (bitmap_empty(cmask, RISCV_MAX_COUNTERS))
 		return -EINVAL;
 
-	for_each_set_bit(i, &cmask, RISCV_MAX_COUNTERS) {
+	for_each_set_bit(i, cmask, RISCV_MAX_COUNTERS) {
 		info = &pmu_ctr_list[i];
 		if (!info)
 			continue;
@@ -541,7 +541,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
 	struct sbiret ret;
 	int idx;
-	uint64_t cbase = 0, cmask = rvpmu->cmask;
+	uint64_t cbase = 0, cmask = rvpmu->cmask[0];
 	unsigned long cflags = 0;
 
 	cflags = pmu_sbi_get_filter_flags(event);
@@ -577,7 +577,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	}
 
 	idx = ret.value;
-	if (!test_bit(idx, &rvpmu->cmask) || !pmu_ctr_list[idx].value)
+	if (!test_bit(idx, rvpmu->cmask) || !pmu_ctr_list[idx].value)
 		return -ENOENT;
 
 	/* Additional sanity check for the counter id */
@@ -881,7 +881,7 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 			/* The logical counter ids are not expected to be contiguous */
 			continue;
 
-		*mask |= BIT(i);
+		set_bit(i, mask);
 
 		cinfo.value = ret.value;
 		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
@@ -898,12 +898,19 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
 
 static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
 {
+	int i;
+
 	/*
 	 * No need to check the error because we are disabling all the counters
 	 * which may include counters that are not enabled yet.
 	 */
-	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
-		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+	for (i = 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
+		if (!pmu->cmask[i])
+			continue;
+		sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
+			  i * BITS_PER_LONG, pmu->cmask[i],
+			  SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
+	}
 }
 
 static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
@@ -1442,7 +1449,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 
 	/* cache all the information about counters now */
-	if (pmu_sbi_get_ctrinfo(num_counters, &cmask))
+	if (pmu_sbi_get_ctrinfo(num_counters, cmask))
 		goto out_free;
 
 	ret = pmu_sbi_setup_irqs(pmu, pdev);
@@ -1454,7 +1461,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
-	pmu->cmask = cmask;
+	bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
 	pmu->ctr_start = pmu_sbi_ctr_start;
 	pmu->ctr_stop = pmu_sbi_ctr_stop;
 	pmu->event_map = pmu_sbi_event_map;
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index f82a28040..ecaa40370 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -55,7 +55,7 @@ struct riscv_pmu {
 
 	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
 
-	unsigned long	cmask;
+	DECLARE_BITMAP(cmask, RISCV_MAX_COUNTERS);
 	u64		(*ctr_read)(struct perf_event *event);
 	int		(*ctr_get_idx)(struct perf_event *event);
 	int		(*ctr_get_width)(int idx);


