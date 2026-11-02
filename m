Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244160A261E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jsYez9/+;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=FcbU5qEX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+Ov7OEX1vdj1zkQZUp4X36mr+q06C3STKhUZ+iM/WWU=; b=jsYez9/+VPe4dRerle3zfDHsqZ
	kPpM30GrTuI/luZTPI0TnWRDF4nrw+naRs56ZAHHbaDnHJ5oDT7wpq+4MRS1SpaUQZGd3J+BGb9i3
	z/yzc2bH+uuhfpMYBAdBSGHypDPgBgnsGqOou+stLrDnsZN1Y9x1x4gCoJeO/rsZ0bjalr7ipvy5F
	hv/2tD7MP7iWnckoxoIWsVcFY3AjB+FYMK+2mPJzMLgzFrH8R9sM1X5MNM1sctaIhzZF88wp6Z0GF
	YZIx+R4Q4OKKf6UkI8Hqsd5omzSwoG401IHWjzI70eIzVGnPYnGJrEw5RnmNED+cYROdCVqO2Wger
	M1VLCRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIL-0000000FzpB-2l1l;
	Mon, 02 Nov 2026 09:25:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIF-0000000FzaE-4C75;
	Mon, 02 Nov 2026 09:25:35 +0000
X-UUID: 55a0d1c4d69f11f1afed4741b24580c9-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+Ov7OEX1vdj1zkQZUp4X36mr+q06C3STKhUZ+iM/WWU=;
	b=FcbU5qEXTWx9OmZTigeGj97wnhgXRS5iYVnPRQSF1IINuDY9JZZ1ED5nVx2y38smjsputjELPsd2XNlElLLTppzHP/LLnwemfQ6sInnRUUhH3uf7uZ2KK2TrBxlI6VOSiqZczbuUomNLrTRB8tAFZ0DOo5GQqv1OUo/x51J1X1o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f5e3e355-dafc-45d8-9f94-7b172177b341,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:a77c69a3-2f6f-43d1-a751-2a61c87fd6c5,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 55a0d1c4d69f11f1afed4741b24580c9-20261102
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1528396510; Mon, 02 Nov 2026 02:25:24 -0700
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
Subject: [RFC PATCH 07/11] soc: mediatek: dram-ecc: add containment policy and storm protection
Date: Mon, 2 Nov 2026 17:23:29 +0800
Message-ID: <20261102092334.138759-8-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012532_092285_D3DFAE41 
X-CRM114-Status: GOOD (  26.17  )
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

Add the sysfs attributes that configure the error handling done by the
secure firmware and push each setting to it through SMC:

 - whether uncorrectable errors are contained and the default severity
   of a contained error,
 - the CE storm protection threshold, time window and cool-down,
 - per address range severity overrides.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile   |   6 +-
 drivers/soc/mediatek/dram-ecc/core/main.c     |   9 +-
 .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h |   3 +
 .../dram-ecc/core/policy/address_range.c      | 120 +++++++++++++++
 .../dram-ecc/core/policy/containment.c        | 107 ++++++++++++++
 .../mediatek/dram-ecc/core/policy/policy.c    |  50 +++++++
 .../mediatek/dram-ecc/core/policy/policy.h    |  19 +++
 .../dram-ecc/core/policy/storm_protection.c   | 137 ++++++++++++++++++
 8 files changed, 449 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/address_range.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/containment.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/storm_protection.c

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 96d37c6a3b9c..d8d878f321d4 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -8,6 +8,10 @@ mtk_dram_ecc-y := \
 	ghes_notifier.o \
 	trace.o \
 	counters.o \
-	addresses.o
+	addresses.o \
+	policy/policy.o \
+	policy/containment.o \
+	policy/storm_protection.o \
+	policy/address_range.o
 
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index b859af25bcc0..315bdcbd650a 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -37,10 +37,14 @@ static int __init mtk_dram_ecc_init(void)
 		goto err_class;
 	}
 
-	ret = mtk_dram_ecc_counters_init(&mtk_dram_ecc_dev->kobj);
+	ret = mtk_dram_ecc_policy_init(mtk_dram_ecc_dev);
 	if (ret)
 		goto err_dev;
 
+	ret = mtk_dram_ecc_counters_init(&mtk_dram_ecc_dev->kobj);
+	if (ret)
+		goto err_policy;
+
 	ret = mtk_dram_ecc_addresses_init(&mtk_dram_ecc_dev->kobj);
 	if (ret)
 		goto err_counters;
@@ -62,6 +66,8 @@ static int __init mtk_dram_ecc_init(void)
 	mtk_dram_ecc_addresses_exit();
 err_counters:
 	mtk_dram_ecc_counters_exit();
+err_policy:
+	mtk_dram_ecc_policy_exit(mtk_dram_ecc_dev);
 err_dev:
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 err_class:
@@ -79,6 +85,7 @@ static void __exit mtk_dram_ecc_exit(void)
 	mtk_dram_ecc_ghes_exit();
 	mtk_dram_ecc_addresses_exit();
 	mtk_dram_ecc_counters_exit();
+	mtk_dram_ecc_policy_exit(mtk_dram_ecc_dev);
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 	class_destroy(mtk_dram_ecc_class);
 	trace_mtk_dram_ecc_lifecycle(1);
diff --git a/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h b/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
index 456961818ccd..c8a75450dac5 100644
--- a/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
+++ b/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
@@ -21,4 +21,7 @@ struct mtk_dram_ecc_data {
 
 extern struct mtk_dram_ecc_data mtk_ecc_data;
 
+int mtk_dram_ecc_policy_init(struct device *dev);
+void mtk_dram_ecc_policy_exit(struct device *dev);
+
 #endif /* _MTK_DRAM_ECC_H_ */
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/address_range.c b/drivers/soc/mediatek/dram-ecc/core/policy/address_range.c
new file mode 100644
index 000000000000..4ead23d52d7b
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/address_range.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/string.h>
+
+#include "../mtk_dram_ecc.h"
+#include "../smc.h"
+#include "policy.h"
+
+/*
+ * Kernel-side sanity cap on entries_show()'s enumeration loop only - not
+ * the real limit. ATF owns the actual table size (policy.c's
+ * DRAM_ECC_MAX_RANGE_ENTRIES) and is the source of truth; this just
+ * bounds the loop in case ATF ever misbehaves.
+ */
+#define ADDRESS_RANGE_ENUM_CAP 64
+
+static struct kobject *address_range_kobj;
+
+static ssize_t entries_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf)
+{
+	ssize_t len = 0;
+	u32 i;
+
+	for (i = 0; i < ADDRESS_RANGE_ENUM_CAP; i++) {
+		u64 addr_from, addr_to;
+		bool recoverable;
+
+		if (mtk_dram_ecc_smc_range_get(i, &addr_from, &addr_to, &recoverable))
+			break;
+
+		len += sysfs_emit_at(buf, len, "0x%llx 0x%llx %s\n",
+				     addr_from, addr_to, recoverable ? "recoverable" : "fatal");
+	}
+
+	return len;
+}
+
+/*
+ * entries_store - add or update one range. Format: "addr_from addr_to
+ * fatal|recoverable". No stored state on the kernel side - ATF holds the
+ * table; entries_show() always reads it back fresh.
+ */
+static ssize_t entries_store(struct kobject *kobj, struct kobj_attribute *attr,
+			     const char *buf, size_t count)
+{
+	u64 addr_from, addr_to;
+	char severity_str[16];
+	bool recoverable;
+	int ret;
+
+	if (sscanf(buf, "%llx %llx %15s", &addr_from, &addr_to, severity_str) != 3)
+		return -EINVAL;
+
+	if (sysfs_streq(severity_str, "recoverable"))
+		recoverable = true;
+	else if (sysfs_streq(severity_str, "fatal"))
+		recoverable = false;
+	else
+		return -EINVAL;
+
+	ret = mtk_dram_ecc_smc_range_add(addr_from, addr_to, recoverable);
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+/* clear_store - any write clears the whole ATF-side range table. */
+static ssize_t clear_store(struct kobject *kobj, struct kobj_attribute *attr,
+			   const char *buf, size_t count)
+{
+	int ret = mtk_dram_ecc_smc_range_clear();
+
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+static struct kobj_attribute entries_attr =
+	__ATTR(entries, 0644, entries_show, entries_store);
+static struct kobj_attribute clear_attr =
+	__ATTR(clear, 0200, NULL, clear_store);
+
+static struct attribute *attrs[] = {
+	&entries_attr.attr,
+	&clear_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group group = {
+	.attrs = attrs,
+};
+
+int address_range_init(struct kobject *parent)
+{
+	int ret;
+
+	address_range_kobj = kobject_create_and_add("address_range", parent);
+	if (!address_range_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(address_range_kobj, &group);
+	if (ret) {
+		kobject_put(address_range_kobj);
+		return ret;
+	}
+	return 0;
+}
+
+void address_range_exit(struct kobject *parent)
+{
+	sysfs_remove_group(address_range_kobj, &group);
+	kobject_put(address_range_kobj);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/containment.c b/drivers/soc/mediatek/dram-ecc/core/policy/containment.c
new file mode 100644
index 000000000000..98c7ec6fafb0
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/containment.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/string.h>
+
+#include "../mtk_dram_ecc.h"
+#include "../smc.h"
+#include "policy.h"
+
+static struct kobject *containment_kobj;
+
+static ssize_t enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf)
+{
+	bool enabled;
+
+	if (mtk_dram_ecc_smc_containment_get_enabled(&enabled))
+		return -EIO;
+	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
+}
+
+static ssize_t enabled_store(struct kobject *kobj, struct kobj_attribute *attr,
+			     const char *buf, size_t count)
+{
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
+	ret = mtk_dram_ecc_smc_containment_set_enabled(val);
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t default_severity_show(struct kobject *kobj, struct kobj_attribute *attr,
+				     char *buf)
+{
+	bool recoverable;
+
+	if (mtk_dram_ecc_smc_containment_get_default_severity(&recoverable))
+		return -EIO;
+	return sysfs_emit(buf, "%s\n", recoverable ? "recoverable" : "fatal");
+}
+
+static ssize_t default_severity_store(struct kobject *kobj, struct kobj_attribute *attr,
+				      const char *buf, size_t count)
+{
+	bool recoverable;
+	int ret;
+
+	if (sysfs_streq(buf, "recoverable"))
+		recoverable = true;
+	else if (sysfs_streq(buf, "fatal"))
+		recoverable = false;
+	else
+		return -EINVAL;
+
+	ret = mtk_dram_ecc_smc_containment_set_default_severity(recoverable);
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+static struct kobj_attribute enabled_attr =
+	__ATTR(enabled, 0644, enabled_show, enabled_store);
+static struct kobj_attribute default_severity_attr =
+	__ATTR(default_severity, 0644, default_severity_show, default_severity_store);
+
+static struct attribute *attrs[] = {
+	&enabled_attr.attr,
+	&default_severity_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group group = {
+	.attrs = attrs,
+};
+
+int containment_init(struct kobject *parent)
+{
+	int ret;
+
+	containment_kobj = kobject_create_and_add("containment", parent);
+	if (!containment_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(containment_kobj, &group);
+	if (ret) {
+		kobject_put(containment_kobj);
+		return ret;
+	}
+	return 0;
+}
+
+void containment_exit(struct kobject *parent)
+{
+	sysfs_remove_group(containment_kobj, &group);
+	kobject_put(containment_kobj);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.c b/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
new file mode 100644
index 000000000000..ecd0a430de6d
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/kobject.h>
+#include <linux/device.h>
+
+#include "../mtk_dram_ecc.h"
+#include "policy.h"
+
+static struct kobject *policy_kobj;
+
+int mtk_dram_ecc_policy_init(struct device *dev)
+{
+	int ret;
+
+	policy_kobj = kobject_create_and_add("policy", &dev->kobj);
+	if (!policy_kobj)
+		return -ENOMEM;
+
+	ret = containment_init(policy_kobj);
+	if (ret)
+		goto err_policy;
+
+	ret = storm_protection_init(policy_kobj);
+	if (ret)
+		goto err_containment;
+
+	ret = address_range_init(policy_kobj);
+	if (ret)
+		goto err_storm;
+
+	return 0;
+
+err_storm:
+	storm_protection_exit(policy_kobj);
+err_containment:
+	containment_exit(policy_kobj);
+err_policy:
+	kobject_put(policy_kobj);
+	return ret;
+}
+
+void mtk_dram_ecc_policy_exit(struct device *dev)
+{
+	address_range_exit(policy_kobj);
+	storm_protection_exit(policy_kobj);
+	containment_exit(policy_kobj);
+	kobject_put(policy_kobj);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/policy.h b/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
new file mode 100644
index 000000000000..a535e2ce0e6d
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/policy.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_POLICY_H_
+#define _MTK_DRAM_ECC_POLICY_H_
+
+#include <linux/kobject.h>
+
+int containment_init(struct kobject *parent);
+void containment_exit(struct kobject *parent);
+
+int storm_protection_init(struct kobject *parent);
+void storm_protection_exit(struct kobject *parent);
+
+int address_range_init(struct kobject *parent);
+void address_range_exit(struct kobject *parent);
+
+#endif /* _MTK_DRAM_ECC_POLICY_H_ */
diff --git a/drivers/soc/mediatek/dram-ecc/core/policy/storm_protection.c b/drivers/soc/mediatek/dram-ecc/core/policy/storm_protection.c
new file mode 100644
index 000000000000..971ad8bdbaae
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/policy/storm_protection.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include <linux/string.h>
+
+#include "../mtk_dram_ecc.h"
+#include "../smc.h"
+#include "policy.h"
+
+static struct kobject *storm_protection_kobj;
+
+static ssize_t threshold_show(struct kobject *kobj,
+			      struct kobj_attribute *attr, char *buf)
+{
+	u32 val;
+
+	if (mtk_dram_ecc_smc_storm_get_threshold(&val))
+		return -EIO;
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static ssize_t threshold_store(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+			       const char *buf, size_t count)
+{
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = mtk_dram_ecc_smc_storm_set_threshold(val);
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t time_window_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf)
+{
+	u32 val;
+
+	if (mtk_dram_ecc_smc_storm_get_time_window(&val))
+		return -EIO;
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static ssize_t time_window_store(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
+{
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = mtk_dram_ecc_smc_storm_set_time_window(val);
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t cooldown_show(struct kobject *kobj,
+			     struct kobj_attribute *attr, char *buf)
+{
+	u32 val;
+
+	if (mtk_dram_ecc_smc_storm_get_cooldown(&val))
+		return -EIO;
+	return sysfs_emit(buf, "%u\n", val);
+}
+
+static ssize_t cooldown_store(struct kobject *kobj,
+			      struct kobj_attribute *attr,
+			      const char *buf, size_t count)
+{
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = mtk_dram_ecc_smc_storm_set_cooldown(val);
+	if (ret)
+		return -EIO;
+
+	return count;
+}
+
+static struct kobj_attribute threshold_attr =
+	__ATTR_RW(threshold);
+static struct kobj_attribute time_window_attr =
+	__ATTR_RW(time_window);
+static struct kobj_attribute cooldown_attr =
+	__ATTR_RW(cooldown);
+
+static struct attribute *attrs[] = {
+	&threshold_attr.attr,
+	&time_window_attr.attr,
+	&cooldown_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group group = {
+	.attrs = attrs,
+};
+
+int storm_protection_init(struct kobject *parent)
+{
+	int ret;
+
+	storm_protection_kobj = kobject_create_and_add("storm_protection", parent);
+	if (!storm_protection_kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(storm_protection_kobj, &group);
+	if (ret) {
+		kobject_put(storm_protection_kobj);
+		return ret;
+	}
+	return 0;
+}
+
+void storm_protection_exit(struct kobject *parent)
+{
+	sysfs_remove_group(storm_protection_kobj, &group);
+	kobject_put(storm_protection_kobj);
+}
-- 
2.45.2


