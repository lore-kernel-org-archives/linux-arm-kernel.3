Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A875606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2S1Pf2wH;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=DEp92VjK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O6pHhLchO92FoXXuadqrfgLQ+YV6VJFDY3mJAGVLxuo=; b=2S1Pf2wHwfmcHmPSR5ujprocX0
	hc3kvi8mEwXFUNBGU5qrlgcu4J6JDQcPEBVN2LAy6AS5LCdH1TwM2Wat9kxz3hVADXkxTsNs4Augc
	5BCH6syVzJS+EObNqLgbg8ZGtOMBJGOF4TW4Cyot3CkgX0tE42cdhv57kI2w2CMP7RseCOx8n2+nK
	JBx+m7i/1L4ASjQmBXnOXj4PJGP/tfjiVbhLkCWKesM++faawxEAwocJz3mGFYdf6n3StywViBfbE
	CBAcdnb8arZ8rREmNmAY/O5iUbfvGIwoGwvJT6mXup/fyehn6tIAUaxaNRnrfno1uL+wR29Bynrce
	UbtTAo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIH-0000000FzeW-3pXQ;
	Mon, 02 Nov 2026 09:25:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoID-0000000FzWZ-4B5M;
	Mon, 02 Nov 2026 09:25:30 +0000
X-UUID: 55298650d69f11f1afed4741b24580c9-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O6pHhLchO92FoXXuadqrfgLQ+YV6VJFDY3mJAGVLxuo=;
	b=DEp92VjKvrBZa4+ZoBtce/nRLX3CKxG22SU8qUCddLgwqTsHSfl5ZeXOjHuLIybO3D823xFaEBYK9mcBCB0qxW1PU2YtZryh97+WfCmhgNOZOAVClSbqt+vCa3JKU83LPstzKLszV5yEDd2GDagTy+UtryYvI1eAd5O9OZMpnkI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:7c858609-5e85-4385-9ae8-19dfc2211aa6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:ecf1a340-45ea-40f0-99fe-3ce442058644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 55298650d69f11f1afed4741b24580c9-20261102
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 293040044; Mon, 02 Nov 2026 02:25:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [RFC PATCH 08/11] soc: mediatek: dram-ecc: add the corrected error leaky bucket
Date: Mon, 2 Nov 2026 17:23:30 +0800
Message-ID: <20261102092334.138759-9-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012530_082843_997ED355 
X-CRM114-Status: GOOD (  26.86  )
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

A page with repeated corrected errors is likely to fail. Count the
corrected errors per page in a leaky bucket and retire the page with
memory_failure() when the count reaches a threshold. The bucket decays
over time, and its threshold, decay interval and the number of tracked
pages are configurable through sysfs.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile   |   1 +
 .../mediatek/dram-ecc/core/ghes_notifier.c    |   2 +
 .../dram-ecc/core/policy/leaky_bucket.c       | 277 ++++++++++++++++++
 .../mediatek/dram-ecc/core/policy/policy.c    |   9 +-
 .../mediatek/dram-ecc/core/policy/policy.h    |   4 +
 5 files changed, 292 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index d8d878f321d4..7c973831c9ef 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -12,6 +12,7 @@ mtk_dram_ecc-y := \
 	policy/policy.o \
 	policy/containment.o \
 	policy/storm_protection.o \
+	policy/leaky_bucket.o \
 	policy/address_range.o
 
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
index 633bf89e2231..a010ca652e86 100644
--- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
@@ -28,6 +28,7 @@
 #include "mtk_dram_ecc_event.h"
 #include "ghes_notifier.h"
 #include "counters.h"
+#include "policy/policy.h"
 #include "trace.h"
 
 static ATOMIC_NOTIFIER_HEAD(mtk_dram_ecc_notifier_chain);
@@ -249,6 +250,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 		spin_unlock(&addr_lock);
 		trace_mtk_dram_ecc_ce(evt.spa, evt.channel, evt.subchannel, evt.rank,
 				      evt.bank, evt.row, evt.column);
+		leaky_bucket_hit(evt.spa);
 		ret = atomic_notifier_call_chain(&mtk_dram_ecc_notifier_chain,
 						 MTK_DRAM_ECC_NOTIFY_CE, &evt);
 		if (ret == NOTIFY_BAD)
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c b/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
new file mode 100644
index 000000000000..a51793d53efb
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/string.h>
+#include <linux/hashtable.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include <linux/mm.h>
+#include <linux/jiffies.h>
+#include <linux/errno.h>
+#include <linux/printk.h>
+
+#include "../counters.h"
+#include "../mtk_dram_ecc.h"
+#include "../trace.h"
+#include "policy.h"
+
+/* ------------------------------------------------------------------ */
+/* Per-page counter table                                               */
+/* ------------------------------------------------------------------ */
+
+struct lb_entry {
+	struct hlist_node node;
+	u64 pfn;
+	u32 count;
+};
+
+#define LB_HASH_BITS 8   /* 256 buckets */
+
+static DECLARE_HASHTABLE(lb_table, LB_HASH_BITS);
+static DEFINE_SPINLOCK(lb_lock);
+static unsigned int lb_tracked;  /* number of entries currently in table */
+
+/* ------------------------------------------------------------------ */
+/* Decay timer (delayed_work)                                           */
+/* ------------------------------------------------------------------ */
+
+static struct delayed_work lb_decay_work;
+
+static void lb_decay_fn(struct work_struct *work)
+{
+	struct lb_entry *e;
+	struct hlist_node *tmp;
+	unsigned int bkt;
+	bool reschedule = false;
+
+	spin_lock(&lb_lock);
+	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
+		if (e->count > 0)
+			e->count--;
+		if (e->count == 0) {
+			hash_del(&e->node);
+			kfree(e);
+			lb_tracked--;
+		} else {
+			reschedule = true;
+		}
+	}
+	spin_unlock(&lb_lock);
+
+	if (reschedule)
+		schedule_delayed_work(&lb_decay_work,
+				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
+}
+
+/* ------------------------------------------------------------------ */
+/* leaky_bucket_hit - called from ghes_notifier.c on every CE event    */
+/* ------------------------------------------------------------------ */
+
+void leaky_bucket_hit(u64 spa)
+{
+	u64 pfn = spa >> PAGE_SHIFT;
+	struct lb_entry *e;
+	bool found = false;
+	bool start_timer = false;
+	bool retired = false;
+	u32 count = 0;
+	int ret;
+
+	spin_lock(&lb_lock);
+
+	hash_for_each_possible(lb_table, e, node, pfn) {
+		if (e->pfn == pfn) {
+			e->count++;
+			count = e->count;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		if (lb_tracked < mtk_ecc_data.lb_max_tracked) {
+			e = kzalloc_obj(*e, GFP_ATOMIC);
+			if (e) {
+				e->pfn   = pfn;
+				e->count = 1;
+				count    = 1;
+				hash_add(lb_table, &e->node, pfn);
+				lb_tracked++;
+				/* start timer only when table was empty */
+				if (lb_tracked == 1)
+					start_timer = true;
+			}
+		}
+	}
+
+	spin_unlock(&lb_lock);
+
+	if (start_timer)
+		schedule_delayed_work(&lb_decay_work,
+				      secs_to_jiffies(mtk_ecc_data.lb_decay_interval_sec));
+
+	if (count >= mtk_ecc_data.lb_threshold && mtk_ecc_data.lb_threshold > 0) {
+		ret = memory_failure(pfn, 0);
+		if (ret == 0 || ret == -EHWPOISON) {
+			mtk_dram_ecc_record_retired_page(pfn,
+							 MTK_DRAM_ECC_RETIRE_CE,
+							 ret);
+			retired = true;
+		} else {
+			pr_warn_ratelimited("mtk-dram-ecc: CE page isolation failed: pfn=0x%llx ret=%d\n",
+					    pfn, ret);
+		}
+	}
+
+	trace_mtk_dram_ecc_page_retire(pfn, count, mtk_ecc_data.lb_threshold,
+				       retired);
+}
+
+/* ------------------------------------------------------------------ */
+/* sysfs                                                                */
+/* ------------------------------------------------------------------ */
+
+static struct kobject *leaky_bucket_kobj;
+
+#define MTK_ECC_LB_THRESHOLD_MAX		10000U
+#define MTK_ECC_LB_DECAY_INTERVAL_MAX	86400U
+#define MTK_ECC_LB_MAX_TRACKED_MAX	16U
+
+static ssize_t threshold_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_threshold);
+}
+
+static ssize_t threshold_store(struct kobject *kobj, struct kobj_attribute *attr,
+			       const char *buf, size_t count)
+{
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val == 0)
+		val = MTK_ECC_LB_THRESHOLD_DEFAULT;
+	else if (val > MTK_ECC_LB_THRESHOLD_MAX)
+		return -EINVAL;
+
+	mtk_ecc_data.lb_threshold = val;
+	return count;
+}
+
+static ssize_t decay_interval_sec_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_decay_interval_sec);
+}
+
+static ssize_t decay_interval_sec_store(struct kobject *kobj,
+					struct kobj_attribute *attr,
+					const char *buf, size_t count)
+{
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val == 0)
+		val = MTK_ECC_LB_DECAY_INTERVAL_DEFAULT;
+	else if (val > MTK_ECC_LB_DECAY_INTERVAL_MAX)
+		return -EINVAL;
+
+	mtk_ecc_data.lb_decay_interval_sec = val;
+	return count;
+}
+
+static ssize_t max_tracked_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", mtk_ecc_data.lb_max_tracked);
+}
+
+static ssize_t max_tracked_store(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
+{
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val == 0)
+		val = MTK_ECC_LB_MAX_TRACKED_DEFAULT;
+	else if (val > MTK_ECC_LB_MAX_TRACKED_MAX)
+		return -EINVAL;
+
+	mtk_ecc_data.lb_max_tracked = val;
+	return count;
+}
+
+static struct kobj_attribute threshold_attr =
+	__ATTR(threshold, 0644, threshold_show, threshold_store);
+static struct kobj_attribute decay_interval_sec_attr =
+	__ATTR(decay_interval_sec, 0644, decay_interval_sec_show, decay_interval_sec_store);
+static struct kobj_attribute max_tracked_attr =
+	__ATTR(max_tracked, 0644, max_tracked_show, max_tracked_store);
+
+static struct attribute *attrs[] = {
+	&threshold_attr.attr,
+	&decay_interval_sec_attr.attr,
+	&max_tracked_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group group = {
+	.attrs = attrs,
+};
+
+/* ------------------------------------------------------------------ */
+/* init / exit                                                          */
+/* ------------------------------------------------------------------ */
+
+int leaky_bucket_init(struct kobject *parent)
+{
+	int ret;
+
+	hash_init(lb_table);
+	INIT_DELAYED_WORK(&lb_decay_work, lb_decay_fn);
+
+	leaky_bucket_kobj = kobject_create_and_add("leaky_bucket", parent);
+	if (!leaky_bucket_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(leaky_bucket_kobj, &group);
+	if (ret) {
+		kobject_put(leaky_bucket_kobj);
+		return ret;
+	}
+	return 0;
+}
+
+void leaky_bucket_exit(struct kobject *parent)
+{
+	struct lb_entry *e;
+	struct hlist_node *tmp;
+	unsigned int bkt;
+
+	cancel_delayed_work_sync(&lb_decay_work);
+
+	spin_lock(&lb_lock);
+	hash_for_each_safe(lb_table, bkt, tmp, e, node) {
+		hash_del(&e->node);
+		kfree(e);
+	}
+	lb_tracked = 0;
+	spin_unlock(&lb_lock);
+
+	sysfs_remove_group(leaky_bucket_kobj, &group);
+	kobject_put(leaky_bucket_kobj);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c b/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
index ecd0a430de6d..5a4181b8de7d 100644
--- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
@@ -26,12 +26,18 @@ int mtk_dram_ecc_policy_init(struct device *dev)
 	if (ret)
 		goto err_containment;
 
-	ret = address_range_init(policy_kobj);
+	ret = leaky_bucket_init(policy_kobj);
 	if (ret)
 		goto err_storm;
 
+	ret = address_range_init(policy_kobj);
+	if (ret)
+		goto err_leaky_bucket;
+
 	return 0;
 
+err_leaky_bucket:
+	leaky_bucket_exit(policy_kobj);
 err_storm:
 	storm_protection_exit(policy_kobj);
 err_containment:
@@ -44,6 +50,7 @@ int mtk_dram_ecc_policy_init(struct device *dev)
 void mtk_dram_ecc_policy_exit(struct device *dev)
 {
 	address_range_exit(policy_kobj);
+	leaky_bucket_exit(policy_kobj);
 	storm_protection_exit(policy_kobj);
 	containment_exit(policy_kobj);
 	kobject_put(policy_kobj);
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h b/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
index a535e2ce0e6d..c9926cbc11be 100644
--- a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
@@ -13,6 +13,10 @@ void containment_exit(struct kobject *parent);
 int storm_protection_init(struct kobject *parent);
 void storm_protection_exit(struct kobject *parent);
 
+int leaky_bucket_init(struct kobject *parent);
+void leaky_bucket_exit(struct kobject *parent);
+void leaky_bucket_hit(u64 spa);
+
 int address_range_init(struct kobject *parent);
 void address_range_exit(struct kobject *parent);
 
-- 
2.45.2


