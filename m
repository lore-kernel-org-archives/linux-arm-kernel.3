Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A94606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BggbiRLR;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=oPY7SXKR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8RG5UWOy+Oi5cMAy5ucPw2zpot/eLI8FLZhQaGGGNbE=; b=BggbiRLRid2xRJVPLG2zPXa/nU
	wqek+BXdVlts1EXkS5lAQwTxJBNZ4us7xIsEa4I/70JpEEypZvcrBVpcX8NmnRy/FKxNLkpWRvxC2
	R5ocPFE3K3jLnnroQHxp0UuLIvf8E/J+6vSX9i1cHdOzVePxViEHRT4cmLAamQBHgJkdphiv/cHqz
	rqjDqvszDMF9aB1tfezALzu8WyTg5kqnxEMqE7lsESmavAaarHpizdS/RU1sQhCHMQBEVOBcuoHpe
	5W/FMc365ftXSlqoIAB9wLC5qYGl4H0SvV/PoWl3Egmn3GyKm+ND+XiVgLFJOG6iWM1PsjlBIzn3B
	r02UcGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoID-0000000FzUk-0Bww;
	Mon, 02 Nov 2026 09:25:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIA-0000000FzSp-3zh4;
	Mon, 02 Nov 2026 09:25:28 +0000
X-UUID: 54edc958d69f11f1afed4741b24580c9-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8RG5UWOy+Oi5cMAy5ucPw2zpot/eLI8FLZhQaGGGNbE=;
	b=oPY7SXKRpmGT66AkmsavvDiWGPa4ZVgigmY+BfZOrOWByZ+9JliuuEnWXEe+wJrqPNGqPTxD9xMmtj7Ic17CNmnzBGUwkYScsk/yeGPopMqHf0Qz6VWp6HA5Bg/SzgJx0aZnagthJ5xJVqZ7IvLLVSyXR14JFrUIt255PAxOUUM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:04772aa8-78ca-4ae6-b229-0d799d87ed2c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:549d4cbb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54edc958d69f11f1afed4741b24580c9-20261102
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 278917605; Mon, 02 Nov 2026 02:25:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
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
Subject: [RFC PATCH 05/11] soc: mediatek: dram-ecc: add error counters and the address lists
Date: Mon, 2 Nov 2026 17:23:27 +0800
Message-ID: <20261102092334.138759-6-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012527_040509_117D9541 
X-CRM114-Status: GOOD (  28.78  )
X-Spam-Score: -2.1 (--)
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

Export the volatile error counters, the pages retired because of
corrected and uncorrectable errors, and the recorded error addresses
through sysfs under the driver's class device.

A page is counted as retired once per boot. A page that generic GHES
already poisoned through memory_failure() before the vendor record
notifier runs (-EHWPOISON) counts as retired as well.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile   |   4 +-
 .../soc/mediatek/dram-ecc/core/addresses.c    |  88 +++++++++
 .../soc/mediatek/dram-ecc/core/addresses.h    |  13 ++
 drivers/soc/mediatek/dram-ecc/core/counters.c | 177 ++++++++++++++++++
 drivers/soc/mediatek/dram-ecc/core/counters.h |  25 +++
 .../mediatek/dram-ecc/core/ghes_notifier.c    |   4 +
 drivers/soc/mediatek/dram-ecc/core/main.c     |  28 ++-
 7 files changed, 337 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.h

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 304117845420..96d37c6a3b9c 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -6,6 +6,8 @@ mtk_dram_ecc-y := \
 	main.o \
 	smc.o \
 	ghes_notifier.o \
-	trace.o
+	trace.o \
+	counters.o \
+	addresses.o
 
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/soc/mediatek/dram-ecc/core/addresses.c b/drivers/soc/mediatek/dram-ecc/core/addresses.c
new file mode 100644
index 000000000000..aeb61ea5deef
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/addresses.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/slab.h>
+
+#include "mtk_dram_ecc.h"
+#include "ghes_notifier.h"
+#include "addresses.h"
+
+static struct kobject *addresses_kobj;
+
+#define MTK_ADDR_BUF_SIZE (MTK_ECC_MAX_BOOT_ADDRS * sizeof(u64))
+
+static ssize_t current_boot_ce_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	u64 *addrs;
+	int count, i;
+	ssize_t len = 0;
+
+	addrs = kmalloc(MTK_ADDR_BUF_SIZE, GFP_KERNEL);
+	if (!addrs)
+		return -ENOMEM;
+
+	count = mtk_dram_ecc_get_ce_addrs(addrs, MTK_ECC_MAX_BOOT_ADDRS);
+	for (i = 0; i < count; i++)
+		len += sysfs_emit_at(buf, len, "0x%llx\n", addrs[i]);
+
+	kfree(addrs);
+	return len;
+}
+
+static ssize_t current_boot_uce_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	u64 *addrs;
+	int count, i;
+	ssize_t len = 0;
+
+	addrs = kmalloc(MTK_ADDR_BUF_SIZE, GFP_KERNEL);
+	if (!addrs)
+		return -ENOMEM;
+
+	count = mtk_dram_ecc_get_uce_addrs(addrs, MTK_ECC_MAX_BOOT_ADDRS);
+	for (i = 0; i < count; i++)
+		len += sysfs_emit_at(buf, len, "0x%llx\n", addrs[i]);
+
+	kfree(addrs);
+	return len;
+}
+
+static struct kobj_attribute ce_attr = __ATTR_RO(current_boot_ce);
+static struct kobj_attribute uce_attr = __ATTR_RO(current_boot_uce);
+
+static struct attribute *attrs[] = {
+	&ce_attr.attr,
+	&uce_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group group = {
+	.attrs = attrs,
+};
+
+int mtk_dram_ecc_addresses_init(struct kobject *parent)
+{
+	int ret;
+
+	addresses_kobj = kobject_create_and_add("addresses", parent);
+	if (!addresses_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(addresses_kobj, &group);
+	if (ret) {
+		kobject_put(addresses_kobj);
+		return ret;
+	}
+	return 0;
+}
+
+void mtk_dram_ecc_addresses_exit(void)
+{
+	sysfs_remove_group(addresses_kobj, &group);
+	kobject_put(addresses_kobj);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/addresses.h b/drivers/soc/mediatek/dram-ecc/core/addresses.h
new file mode 100644
index 000000000000..b55a067f9717
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/addresses.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_ADDRESSES_H_
+#define _MTK_DRAM_ECC_ADDRESSES_H_
+
+#include <linux/kobject.h>
+
+int mtk_dram_ecc_addresses_init(struct kobject *parent);
+void mtk_dram_ecc_addresses_exit(void);
+
+#endif /* _MTK_DRAM_ECC_ADDRESSES_H_ */
diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.c b/drivers/soc/mediatek/dram-ecc/core/counters.c
new file mode 100644
index 000000000000..88d7961975db
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+/*
+ * Volatile (reset every boot) CE/UCE counters come from ghes_notifier.c's
+ * in-memory tally; retired pages are tracked per PFN so each page is
+ * counted once.
+ */
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/export.h>
+#include <linux/atomic.h>
+#include <linux/xarray.h>
+
+#include "mtk_dram_ecc.h"
+#include "ghes_notifier.h"
+#include "counters.h"
+
+static struct kobject *counters_kobj;
+static struct kobject *retired_kobj;
+static atomic64_t retired_by_ce = ATOMIC64_INIT(0);
+static atomic64_t retired_by_uce = ATOMIC64_INIT(0);
+static DEFINE_XARRAY(retired_pfns);
+
+void mtk_dram_ecc_record_retired_page(unsigned long pfn,
+				      enum mtk_dram_ecc_retire_reason reason,
+				      int memory_failure_ret)
+{
+	int ret;
+
+	/*
+	 * With CONFIG_ACPI_APEI_MEMORY_FAILURE=y, generic GHES calls
+	 * memory_failure() off the standard CPER section and may poison a
+	 * recoverable-UCE page before the deferred MTK vendor callback runs.
+	 * Treating -EHWPOISON as already isolated is what makes that race
+	 * benign, so the page is still counted exactly once. Count each PFN
+	 * only once during the current boot.
+	 */
+	if (memory_failure_ret != 0 && memory_failure_ret != -EHWPOISON)
+		return;
+
+	ret = xa_insert(&retired_pfns, pfn, xa_mk_value(reason), GFP_KERNEL);
+	if (ret == -EBUSY)
+		return;
+	if (ret) {
+		pr_warn("mtk-dram-ecc: failed to track retired PFN 0x%lx: %d\n",
+			pfn, ret);
+		return;
+	}
+
+	if (reason == MTK_DRAM_ECC_RETIRE_CE)
+		atomic64_inc(&retired_by_ce);
+	else
+		atomic64_inc(&retired_by_uce);
+}
+
+u64 mtk_dram_ecc_get_retired_by_ce(void)
+{
+	return atomic64_read(&retired_by_ce);
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_retired_by_ce);
+
+u64 mtk_dram_ecc_get_retired_by_uce(void)
+{
+	return atomic64_read(&retired_by_uce);
+}
+EXPORT_SYMBOL_GPL(mtk_dram_ecc_get_retired_by_uce);
+
+static ssize_t volatile_ce_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_ce());
+}
+
+static ssize_t volatile_uce_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_uce());
+}
+
+static ssize_t volatile_uce_inline_show(struct kobject *kobj,
+					struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_uce_inline());
+}
+
+static ssize_t volatile_uce_ondie_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_volatile_uce_ondie());
+}
+
+static struct kobj_attribute volatile_ce_attr = __ATTR_RO(volatile_ce);
+static struct kobj_attribute volatile_uce_attr = __ATTR_RO(volatile_uce);
+static struct kobj_attribute volatile_uce_inline_attr = __ATTR_RO(volatile_uce_inline);
+static struct kobj_attribute volatile_uce_ondie_attr = __ATTR_RO(volatile_uce_ondie);
+
+static struct attribute *attrs[] = {
+	&volatile_ce_attr.attr,
+	&volatile_uce_attr.attr,
+	&volatile_uce_inline_attr.attr,
+	&volatile_uce_ondie_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group group = {
+	.attrs = attrs,
+};
+
+static ssize_t by_ce_show(struct kobject *kobj,
+			  struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_retired_by_ce());
+}
+
+static ssize_t by_uce_show(struct kobject *kobj,
+			   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", mtk_dram_ecc_get_retired_by_uce());
+}
+
+static struct kobj_attribute retired_by_ce_attr = __ATTR_RO(by_ce);
+static struct kobj_attribute retired_by_uce_attr = __ATTR_RO(by_uce);
+
+static struct attribute *retired_attrs[] = {
+	&retired_by_ce_attr.attr,
+	&retired_by_uce_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group retired_group = {
+	.attrs = retired_attrs,
+};
+
+int mtk_dram_ecc_counters_init(struct kobject *parent)
+{
+	int ret;
+
+	counters_kobj = kobject_create_and_add("counters", parent);
+	if (!counters_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(counters_kobj, &group);
+	if (ret) {
+		kobject_put(counters_kobj);
+		return ret;
+	}
+
+	retired_kobj = kobject_create_and_add("retired", parent);
+	if (!retired_kobj) {
+		ret = -ENOMEM;
+		goto err_counters;
+	}
+
+	ret = sysfs_create_group(retired_kobj, &retired_group);
+	if (ret)
+		goto err_retired;
+
+	return 0;
+
+err_retired:
+	kobject_put(retired_kobj);
+err_counters:
+	sysfs_remove_group(counters_kobj, &group);
+	kobject_put(counters_kobj);
+	return ret;
+}
+
+void mtk_dram_ecc_counters_exit(void)
+{
+	sysfs_remove_group(retired_kobj, &retired_group);
+	kobject_put(retired_kobj);
+	sysfs_remove_group(counters_kobj, &group);
+	kobject_put(counters_kobj);
+	xa_destroy(&retired_pfns);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/counters.h b/drivers/soc/mediatek/dram-ecc/core/counters.h
new file mode 100644
index 000000000000..fd718dc45ea6
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/counters.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_COUNTERS_H_
+#define _MTK_DRAM_ECC_COUNTERS_H_
+
+#include <linux/kobject.h>
+#include <linux/types.h>
+
+enum mtk_dram_ecc_retire_reason {
+	MTK_DRAM_ECC_RETIRE_CE = 1,
+	MTK_DRAM_ECC_RETIRE_UCE,
+};
+
+int mtk_dram_ecc_counters_init(struct kobject *parent);
+void mtk_dram_ecc_counters_exit(void);
+
+void mtk_dram_ecc_record_retired_page(unsigned long pfn,
+				      enum mtk_dram_ecc_retire_reason reason,
+				      int memory_failure_ret);
+u64 mtk_dram_ecc_get_retired_by_ce(void);
+u64 mtk_dram_ecc_get_retired_by_uce(void);
+
+#endif /* _MTK_DRAM_ECC_COUNTERS_H_ */
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
index 4ba65875e427..c1d885f0bf15 100644
--- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
@@ -27,6 +27,7 @@
 #include "mtk_dram_ecc.h"
 #include "mtk_dram_ecc_event.h"
 #include "ghes_notifier.h"
+#include "counters.h"
 #include "trace.h"
 
 static ATOMIC_NOTIFIER_HEAD(mtk_dram_ecc_notifier_chain);
@@ -286,6 +287,9 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 					 pfn, ret);
 				panic("DRAM ECC recoverable UCE isolation failed");
 			}
+			mtk_dram_ecc_record_retired_page(pfn,
+							 MTK_DRAM_ECC_RETIRE_UCE,
+							 ret);
 		} else {
 			pr_info("mtk-dram-ecc: notify-only UCE spa=0x%llx (not Linux-managed memory)\n",
 				evt.spa);
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index 3232046394e3..b859af25bcc0 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -8,6 +8,8 @@
 
 #include "mtk_dram_ecc.h"
 #include "ghes_notifier.h"
+#include "counters.h"
+#include "addresses.h"
 #include "trace.h"
 
 static struct class *mtk_dram_ecc_class;
@@ -35,14 +37,31 @@ static int __init mtk_dram_ecc_init(void)
 		goto err_class;
 	}
 
-	ret = mtk_dram_ecc_ghes_init();
+	ret = mtk_dram_ecc_counters_init(&mtk_dram_ecc_dev->kobj);
 	if (ret)
 		goto err_dev;
 
+	ret = mtk_dram_ecc_addresses_init(&mtk_dram_ecc_dev->kobj);
+	if (ret)
+		goto err_counters;
+
+	/*
+	 * Register the GHES vendor notifier last: the callback uses the policy,
+	 * counter and address state above, so a record delivered before they
+	 * are ready would run leaky_bucket_hit() against uninitialised state.
+	 */
+	ret = mtk_dram_ecc_ghes_init();
+	if (ret)
+		goto err_addresses;
+
 	trace_mtk_dram_ecc_lifecycle(0);
 	dev_info(mtk_dram_ecc_dev, "initialized (GHES vendor notifier registered)\n");
 	return 0;
 
+err_addresses:
+	mtk_dram_ecc_addresses_exit();
+err_counters:
+	mtk_dram_ecc_counters_exit();
 err_dev:
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 err_class:
@@ -52,7 +71,14 @@ static int __init mtk_dram_ecc_init(void)
 
 static void __exit mtk_dram_ecc_exit(void)
 {
+	/*
+	 * Unregister the GHES vendor notifier first, so the blocking-notifier
+	 * unregistration synchronises against an in-flight callback before the
+	 * state it touches is torn down.
+	 */
 	mtk_dram_ecc_ghes_exit();
+	mtk_dram_ecc_addresses_exit();
+	mtk_dram_ecc_counters_exit();
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 	class_destroy(mtk_dram_ecc_class);
 	trace_mtk_dram_ecc_lifecycle(1);
-- 
2.45.2


