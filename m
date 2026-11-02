Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048BB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gpMUBIfG;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=j4w/+Vdo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nx9t0DBjKPEzI7mXKLL19DVrkZGWq9IzOdeDEWe3D9Y=; b=gpMUBIfGcbYzsr/kKHFsWCgQSy
	9Wr5eDgKvkyPvoE+FDdrVEa4fg+ZE/jvwtGRsaGNI3RhLRnxz3POLB4tPDUZt/vRZJGnMDBs2PTOi
	a4Mw3S0sqcK5kHX9ZEDa8B5q8p7LqONMo2yPuE9fhKC1uvQCdLc2I341y3qGG3PZ1X0PgUGBi++FN
	Gs8knEei4/fVMdEkQk7de1phfgBvVRKlCQM0nNN0yuh+P2LxEp5yxwZgJ73wEygQuuiwD+mxFF+7/
	fzBiQUnpQdZYy3L7m+sDmYHJgzPyvHaHIoxwkfCxbKNAqGtbV7qO216W2hmpZ/IPl+d7v07qH+duG
	l0PmtmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIH-0000000Fze1-347X;
	Mon, 02 Nov 2026 09:25:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoID-0000000FzWV-40Zi;
	Mon, 02 Nov 2026 09:25:30 +0000
X-UUID: 54ff2194d69f11f1acbe4559397dec65-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nx9t0DBjKPEzI7mXKLL19DVrkZGWq9IzOdeDEWe3D9Y=;
	b=j4w/+VdobJfZOmmxo2skt0/swVg3lpkdaG1SC93DouoBdgca1oiVkMgFzdKD1IsEIL4eKo2qd0MekTBaNpzphiuGYpmry+6L+gABzUnm1OhJocbmN1yu9P7L26XQMnYjwM5YA6TJS2Mf8HoljjEPUsqeh7N9kKN+ykalPir0jQk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:67b8e54c-c08c-4623-a1c9-e0226cd4e9f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:c8fc9978-4c28-42d9-a11b-3ae385bafce8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54ff2194d69f11f1acbe4559397dec65-20261102
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1327124901; Mon, 02 Nov 2026 02:25:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:25:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:25:21 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 06/11] soc: mediatek: dram-ecc: keep error counters across boots
Date: Mon, 2 Nov 2026 17:23:28 +0800
Message-ID: <20261102092334.138759-7-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012530_069967_9071B597 
X-CRM114-Status: GOOD (  21.39  )
X-Spam-Note: SpamAssassin invocation failed
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Santino Wang <santino.wang@mediatek.com>

Keep aggregate corrected and uncorrectable error counters in EFI
variables, so they survive a reboot. The firmware creates the
variables; the driver increments them.

EFI SetVariable() can take tens of milliseconds, so the increments are
accumulated and written from a work item instead of the GHES notifier
context.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/counters.c | 145 +++++++++++++++++-
 drivers/soc/mediatek/dram-ecc/core/counters.h |   3 +
 .../mediatek/dram-ecc/core/ghes_notifier.c    |   6 +-
 3 files changed, 150 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.c b/drivers/soc/mediatek/dram-ecc/core/counters.c
index 88d7961975db..8e3fd83cf60a 100644
--- a/drivers/soc/mediatek/dram-ecc/core/counters.c
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.c
@@ -3,13 +3,20 @@
  * Copyright (c) 2026 MediaTek Inc.
  */
 /*
- * Volatile (reset every boot) CE/UCE counters come from ghes_notifier.c's
- * in-memory tally; retired pages are tracked per PFN so each page is
- * counted once.
+ * Aggregate CE/UCE counters. "volatile" counters (reset every boot) come
+ * from ghes_notifier.c's in-memory tally; "agg" counters persist across
+ * boots via the same EFI NV variable UEFI RasDxe.c initializes
+ * (MtkDramEccCeCount, MtkDramEccUceCount_inline, MtkDramEccUceCount_ondie,
+ * GUID must match RasDxe.c's mMtkEccCounterGuid). The UCE count is kept
+ * per ECC source. Inline ECC detects every UCE, including one that
+ * originates in the DRAM die, so agg_uce_inline is the total; the
+ * agg_uce_ondie subset counts those that on-die ECC also flagged.
  */
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
+#include <linux/efi.h>
 #include <linux/export.h>
+#include <linux/workqueue.h>
 #include <linux/atomic.h>
 #include <linux/xarray.h>
 
@@ -17,12 +24,110 @@
 #include "ghes_notifier.h"
 #include "counters.h"
 
+#define MTK_ECC_EFI_ATTR \
+	(EFI_VARIABLE_NON_VOLATILE | \
+	 EFI_VARIABLE_BOOTSERVICE_ACCESS | \
+	 EFI_VARIABLE_RUNTIME_ACCESS)
+
+static efi_guid_t mtk_ecc_efi_guid =
+	EFI_GUID(0x5a3f1e8c, 0x0b2d, 0x4e7f,
+		 0x9c, 0x6a, 0x1d, 0x2b, 0x3e, 0x4f, 0x5a, 0x6b);
+
+static efi_char16_t mtk_ce_var_name[]  = L"MtkDramEccCeCount";
+static efi_char16_t mtk_uce_inline_var_name[] = L"MtkDramEccUceCount_inline";
+static efi_char16_t mtk_uce_ondie_var_name[]  = L"MtkDramEccUceCount_ondie";
+
 static struct kobject *counters_kobj;
 static struct kobject *retired_kobj;
 static atomic64_t retired_by_ce = ATOMIC64_INIT(0);
 static atomic64_t retired_by_uce = ATOMIC64_INIT(0);
 static DEFINE_XARRAY(retired_pfns);
 
+/*
+ * Deferred EFI variable write.  SetVariable NV can take tens of
+ * milliseconds, so it should not be called from the GHES vendor-record
+ * notifier's atomic/IRQ context.  We accumulate pending increments and
+ * flush them from a workqueue instead.
+ */
+static atomic_t pending_ce_inc  = ATOMIC_INIT(0);
+static atomic_t pending_uce_inline_inc = ATOMIC_INIT(0);
+static atomic_t pending_uce_ondie_inc  = ATOMIC_INIT(0);
+static void counters_flush_work_fn(struct work_struct *work);
+static DECLARE_WORK(counters_flush_work, counters_flush_work_fn);
+
+static u64 efi_counter_get(efi_char16_t *name)
+{
+	unsigned long size = sizeof(u64);
+	u64 val = 0;
+	efi_status_t status;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
+		return 0;
+
+	status = efi.get_variable(name, &mtk_ecc_efi_guid, NULL, &size, &val);
+
+	if (status != EFI_SUCCESS && status != EFI_NOT_FOUND)
+		pr_warn("mtk-dram-ecc: get EFI var failed: 0x%lx\n", status);
+
+	return (status == EFI_SUCCESS) ? val : 0;
+}
+
+static void efi_counter_inc(efi_char16_t *name, int delta)
+{
+	unsigned long size = sizeof(u64);
+	u64 val = 0;
+	efi_status_t status;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		return;
+
+	status = efi.get_variable(name, &mtk_ecc_efi_guid, NULL, &size, &val);
+	if (status == EFI_NOT_FOUND)
+		val = 0;
+	else if (status != EFI_SUCCESS)
+		return;
+
+	val += delta;
+	status = efi.set_variable(name, &mtk_ecc_efi_guid,
+				  MTK_ECC_EFI_ATTR, sizeof(u64), &val);
+	if (status != EFI_SUCCESS)
+		pr_warn("mtk-dram-ecc: set EFI var failed: 0x%lx\n", status);
+}
+
+static void counters_flush_work_fn(struct work_struct *work)
+{
+	int ce_delta, uce_inline_delta, uce_ondie_delta;
+
+	ce_delta = atomic_xchg(&pending_ce_inc, 0);
+	uce_inline_delta = atomic_xchg(&pending_uce_inline_inc, 0);
+	uce_ondie_delta = atomic_xchg(&pending_uce_ondie_inc, 0);
+
+	if (ce_delta > 0)
+		efi_counter_inc(mtk_ce_var_name, ce_delta);
+	if (uce_inline_delta > 0)
+		efi_counter_inc(mtk_uce_inline_var_name, uce_inline_delta);
+	if (uce_ondie_delta > 0)
+		efi_counter_inc(mtk_uce_ondie_var_name, uce_ondie_delta);
+}
+
+void mtk_dram_ecc_agg_ce_inc(void)
+{
+	atomic_inc(&pending_ce_inc);
+	schedule_work(&counters_flush_work);
+}
+
+void mtk_dram_ecc_agg_uce_inline_inc(void)
+{
+	atomic_inc(&pending_uce_inline_inc);
+	schedule_work(&counters_flush_work);
+}
+
+void mtk_dram_ecc_agg_uce_ondie_inc(void)
+{
+	atomic_inc(&pending_uce_ondie_inc);
+	schedule_work(&counters_flush_work);
+}
+
 void mtk_dram_ecc_record_retired_page(unsigned long pfn,
 				      enum mtk_dram_ecc_retire_reason reason,
 				      int memory_failure_ret)
@@ -79,6 +184,12 @@ static ssize_t volatile_uce_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_uce());
 }
 
+static ssize_t agg_ce_show(struct kobject *kobj,
+			   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_ce_var_name));
+}
+
 static ssize_t volatile_uce_inline_show(struct kobject *kobj,
 					struct kobj_attribute *attr, char *buf)
 {
@@ -91,16 +202,43 @@ static ssize_t volatile_uce_ondie_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_uce_ondie());
 }
 
+static ssize_t agg_uce_inline_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_uce_inline_var_name));
+}
+
+static ssize_t agg_uce_ondie_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_uce_ondie_var_name));
+}
+
+/* Total UCE count across boots: every UCE is seen by inline ECC. */
+static ssize_t agg_uce_show(struct kobject *kobj,
+			    struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", efi_counter_get(mtk_uce_inline_var_name));
+}
+
 static struct kobj_attribute volatile_ce_attr = __ATTR_RO(volatile_ce);
 static struct kobj_attribute volatile_uce_attr = __ATTR_RO(volatile_uce);
+static struct kobj_attribute agg_ce_attr = __ATTR_RO(agg_ce);
+static struct kobj_attribute agg_uce_attr = __ATTR_RO(agg_uce);
 static struct kobj_attribute volatile_uce_inline_attr = __ATTR_RO(volatile_uce_inline);
 static struct kobj_attribute volatile_uce_ondie_attr = __ATTR_RO(volatile_uce_ondie);
+static struct kobj_attribute agg_uce_inline_attr = __ATTR_RO(agg_uce_inline);
+static struct kobj_attribute agg_uce_ondie_attr = __ATTR_RO(agg_uce_ondie);
 
 static struct attribute *attrs[] = {
 	&volatile_ce_attr.attr,
 	&volatile_uce_attr.attr,
+	&agg_ce_attr.attr,
+	&agg_uce_attr.attr,
 	&volatile_uce_inline_attr.attr,
 	&volatile_uce_ondie_attr.attr,
+	&agg_uce_inline_attr.attr,
+	&agg_uce_ondie_attr.attr,
 	NULL,
 };
 
@@ -169,6 +307,7 @@ int mtk_dram_ecc_counters_init(struct kobject *parent)
 
 void mtk_dram_ecc_counters_exit(void)
 {
+	cancel_work_sync(&counters_flush_work);
 	sysfs_remove_group(retired_kobj, &retired_group);
 	kobject_put(retired_kobj);
 	sysfs_remove_group(counters_kobj, &group);
diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.h b/drivers/soc/mediatek/dram-ecc/core/counters.h
index fd718dc45ea6..af2e5ea16b90 100644
--- a/drivers/soc/mediatek/dram-ecc/core/counters.h
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.h
@@ -16,6 +16,9 @@ enum mtk_dram_ecc_retire_reason {
 int mtk_dram_ecc_counters_init(struct kobject *parent);
 void mtk_dram_ecc_counters_exit(void);
 
+void mtk_dram_ecc_agg_ce_inc(void);
+void mtk_dram_ecc_agg_uce_inline_inc(void);
+void mtk_dram_ecc_agg_uce_ondie_inc(void);
 void mtk_dram_ecc_record_retired_page(unsigned long pfn,
 				      enum mtk_dram_ecc_retire_reason reason,
 				      int memory_failure_ret);
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
index c1d885f0bf15..633bf89e2231 100644
--- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
@@ -242,6 +242,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 
 	if (evt.severity == MTK_DRAM_ECC_NOTIFY_CE) {
 		atomic64_inc(&volatile_ce_count);
+		mtk_dram_ecc_agg_ce_inc();
 		spin_lock(&addr_lock);
 		if (ce_addr_count < MTK_ECC_MAX_BOOT_ADDRS)
 			ce_addrs[ce_addr_count++] = evt.spa;
@@ -258,8 +259,11 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 
 		/* Inline ECC detects every UCE, including an on-die one. */
 		atomic64_inc(&volatile_uce_inline_count);
-		if (vs->from_ondie_ecc)
+		mtk_dram_ecc_agg_uce_inline_inc();
+		if (vs->from_ondie_ecc) {
 			atomic64_inc(&volatile_uce_ondie_count);
+			mtk_dram_ecc_agg_uce_ondie_inc();
+		}
 		spin_lock(&addr_lock);
 		if (uce_addr_count < MTK_ECC_MAX_BOOT_ADDRS)
 			uce_addrs[uce_addr_count++] = evt.spa;
-- 
2.45.2


