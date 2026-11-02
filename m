Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D0760A3817
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bCZbKoNt;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ElrDBMTT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lTjwY/2+/7AIo5B3ljUNqvFl2P2GrkRvV7sOf6/FKhc=; b=bCZbKoNt4uQgyX1B3iEFxt/0TR
	eQ+wgUKAFpFd1Yy7ADXr3Y04DBOK/Oj9AvQFaLRxujuqICAbKrNCrkkQOVyiJ0QnvQ5zSaCeo7MJo
	M2lomw7owRInXg4HfYaH74hmSX1bRPACEzDqMAlgyvcIQGEgY1Izj7yukAt+HKzWvuapbdAxNv5RL
	wnb8CB7L4wtpJFs+92A1jLVK0zh7Yw4h0ddBYPrbEZCAxdeXkMkZY876Xecp84qjV8zlCg7LuKEcc
	qM/UyquIBltbIMNRF0F7LTy1FqKqIOEznfW7B4qKpaMWBy4DQJ+3vUjSGKycn1szjaT9XCzgNhYSU
	gc7ASMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoII-0000000FzfI-0hAW;
	Mon, 02 Nov 2026 09:25:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIE-0000000FzUA-1coy;
	Mon, 02 Nov 2026 09:25:30 +0000
X-UUID: 55354e7cd69f11f1acbe4559397dec65-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lTjwY/2+/7AIo5B3ljUNqvFl2P2GrkRvV7sOf6/FKhc=;
	b=ElrDBMTTFLF3NC5YZeyHB6IYbG+6/RkLH9Z2NwMI8tEjZTAdgvoA+qWDQlnPeaczpP9Lt+MKeLcI8pa2C/0peItAfp1N0kwnELNLbeymnw4JWLyjfcLry5EhEfY9hsmNT6mXq6mKxTMT/Wh4xL2mbm4VoomX3zseLSylCbhT/gA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e787f3e6-f304-420c-bf27-aedabde18747,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:9a7c69a3-2f6f-43d1-a751-2a61c87fd6c5,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 55354e7cd69f11f1acbe4559397dec65-20261102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1553298251; Mon, 02 Nov 2026 02:25:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [RFC PATCH 09/11] soc: mediatek: dram-ecc: add a generic netlink event interface
Date: Mon, 2 Nov 2026 17:23:31 +0800
Message-ID: <20261102092334.138759-10-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012530_543946_65A4EC64 
X-CRM114-Status: GOOD (  24.43  )
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

Multicast every decoded corrected and uncorrectable error to user
space through a generic netlink family, so a monitoring daemon can
subscribe to events instead of polling the counters.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile   |  1 +
 .../mediatek/dram-ecc/core/ghes_notifier.c    |  3 +
 drivers/soc/mediatek/dram-ecc/core/main.c     | 10 ++-
 drivers/soc/mediatek/dram-ecc/core/netlink.c  | 83 +++++++++++++++++++
 drivers/soc/mediatek/dram-ecc/core/netlink.h  | 14 ++++
 include/uapi/linux/mtk_dram_ecc_netlink.h     | 44 ++++++++++
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.h
 create mode 100644 include/uapi/linux/mtk_dram_ecc_netlink.h

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 7c973831c9ef..1e2764914e9c 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -6,6 +6,7 @@ mtk_dram_ecc-y := \
 	main.o \
 	smc.o \
 	ghes_notifier.o \
+	netlink.o \
 	trace.o \
 	counters.o \
 	addresses.o \
diff --git a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
index a010ca652e86..701b0b28d358 100644
--- a/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
+++ b/drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
@@ -28,6 +28,7 @@
 #include "mtk_dram_ecc_event.h"
 #include "ghes_notifier.h"
 #include "counters.h"
+#include "netlink.h"
 #include "policy/policy.h"
 #include "trace.h"
 
@@ -256,6 +257,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 		if (ret == NOTIFY_BAD)
 			pr_warn_ratelimited("mtk-dram-ecc: kernel client rejected CE event for spa=0x%llx\n",
 					    evt.spa);
+		mtk_dram_ecc_netlink_notify(&evt);
 	} else {
 		unsigned long pfn = evt.spa >> PAGE_SHIFT;
 
@@ -305,6 +307,7 @@ static int mtk_ghes_vendor_cb(struct notifier_block *nb, unsigned long severity,
 		if (ret == NOTIFY_BAD)
 			pr_warn_ratelimited("mtk-dram-ecc: kernel client rejected UCE event for spa=0x%llx\n",
 					    evt.spa);
+		mtk_dram_ecc_netlink_notify(&evt);
 	}
 
 	return NOTIFY_OK;
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index 315bdcbd650a..320631b3a044 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -10,6 +10,7 @@
 #include "ghes_notifier.h"
 #include "counters.h"
 #include "addresses.h"
+#include "netlink.h"
 #include "trace.h"
 
 static struct class *mtk_dram_ecc_class;
@@ -37,10 +38,14 @@ static int __init mtk_dram_ecc_init(void)
 		goto err_class;
 	}
 
-	ret = mtk_dram_ecc_policy_init(mtk_dram_ecc_dev);
+	ret = mtk_dram_ecc_netlink_init();
 	if (ret)
 		goto err_dev;
 
+	ret = mtk_dram_ecc_policy_init(mtk_dram_ecc_dev);
+	if (ret)
+		goto err_netlink;
+
 	ret = mtk_dram_ecc_counters_init(&mtk_dram_ecc_dev->kobj);
 	if (ret)
 		goto err_policy;
@@ -68,6 +73,8 @@ static int __init mtk_dram_ecc_init(void)
 	mtk_dram_ecc_counters_exit();
 err_policy:
 	mtk_dram_ecc_policy_exit(mtk_dram_ecc_dev);
+err_netlink:
+	mtk_dram_ecc_netlink_exit();
 err_dev:
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 err_class:
@@ -86,6 +93,7 @@ static void __exit mtk_dram_ecc_exit(void)
 	mtk_dram_ecc_addresses_exit();
 	mtk_dram_ecc_counters_exit();
 	mtk_dram_ecc_policy_exit(mtk_dram_ecc_dev);
+	mtk_dram_ecc_netlink_exit();
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 	class_destroy(mtk_dram_ecc_class);
 	trace_mtk_dram_ecc_lifecycle(1);
diff --git a/drivers/soc/mediatek/dram-ecc/core/netlink.c b/drivers/soc/mediatek/dram-ecc/core/netlink.c
new file mode 100644
index 000000000000..bad96bbe4ed6
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/netlink.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/netlink.h>
+#include <linux/printk.h>
+#include <net/genetlink.h>
+#include <uapi/linux/mtk_dram_ecc_netlink.h>
+
+#include "mtk_dram_ecc_event.h"
+#include "netlink.h"
+
+static const struct genl_multicast_group mtk_dram_ecc_mcgrps[] = {
+	{ .name = MTK_DRAM_ECC_MCAST_GRP },
+};
+
+static struct genl_family mtk_dram_ecc_genl_family = {
+	.name      = MTK_DRAM_ECC_GENL_NAME,
+	.version   = MTK_DRAM_ECC_GENL_VERSION,
+	.maxattr   = MTK_DRAM_ECC_ATTR_MAX,
+	.mcgrps    = mtk_dram_ecc_mcgrps,
+	.n_mcgrps  = ARRAY_SIZE(mtk_dram_ecc_mcgrps),
+	.module    = THIS_MODULE,
+};
+
+int mtk_dram_ecc_netlink_init(void)
+{
+	return genl_register_family(&mtk_dram_ecc_genl_family);
+}
+
+void mtk_dram_ecc_netlink_exit(void)
+{
+	genl_unregister_family(&mtk_dram_ecc_genl_family);
+}
+
+void mtk_dram_ecc_netlink_notify(const struct mtk_dram_ecc_event *evt)
+{
+	struct sk_buff *skb;
+	void *hdr;
+	int ret;
+	u8 severity;
+
+	skb = genlmsg_new(NLMSG_GOODSIZE, GFP_ATOMIC);
+	if (!skb) {
+		pr_warn_ratelimited("mtk-dram-ecc: failed to allocate netlink event for spa=0x%llx\n",
+				    evt->spa);
+		return;
+	}
+
+	hdr = genlmsg_put(skb, 0, 0, &mtk_dram_ecc_genl_family, 0,
+			  MTK_DRAM_ECC_CMD_EVENT);
+	if (!hdr)
+		goto err;
+
+	severity = (evt->severity == MTK_DRAM_ECC_NOTIFY_CE) ?
+		   MTK_DRAM_ECC_SEV_CE : MTK_DRAM_ECC_SEV_UCE;
+
+	if (nla_put_u64_64bit(skb, MTK_DRAM_ECC_ATTR_SPA, evt->spa,
+			      MTK_DRAM_ECC_ATTR_UNSPEC) ||
+	    nla_put_u8(skb, MTK_DRAM_ECC_ATTR_SEVERITY, severity) ||
+	    nla_put_u8(skb, MTK_DRAM_ECC_ATTR_CHANNEL, evt->channel) ||
+	    nla_put_u8(skb, MTK_DRAM_ECC_ATTR_SUBCHANNEL, evt->subchannel) ||
+	    nla_put_u16(skb, MTK_DRAM_ECC_ATTR_RANK, evt->rank) ||
+	    nla_put_u16(skb, MTK_DRAM_ECC_ATTR_BANK, evt->bank) ||
+	    nla_put_u32(skb, MTK_DRAM_ECC_ATTR_ROW, evt->row) ||
+	    nla_put_u16(skb, MTK_DRAM_ECC_ATTR_COLUMN, evt->column))
+		goto err;
+
+	genlmsg_end(skb, hdr);
+	ret = genlmsg_multicast(&mtk_dram_ecc_genl_family, skb, 0, 0,
+				GFP_ATOMIC);
+	if (ret && ret != -ESRCH)
+		pr_warn_ratelimited("mtk-dram-ecc: failed to publish netlink event for spa=0x%llx: %d\n",
+				    evt->spa, ret);
+	return;
+
+err:
+	pr_warn_ratelimited("mtk-dram-ecc: failed to build netlink event for spa=0x%llx\n",
+			    evt->spa);
+	nlmsg_free(skb);
+}
diff --git a/drivers/soc/mediatek/dram-ecc/core/netlink.h b/drivers/soc/mediatek/dram-ecc/core/netlink.h
new file mode 100644
index 000000000000..a2e64789d7d7
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/netlink.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_NETLINK_H_
+#define _MTK_DRAM_ECC_NETLINK_H_
+
+#include "mtk_dram_ecc_event.h"
+
+int mtk_dram_ecc_netlink_init(void);
+void mtk_dram_ecc_netlink_exit(void);
+void mtk_dram_ecc_netlink_notify(const struct mtk_dram_ecc_event *evt);
+
+#endif /* _MTK_DRAM_ECC_NETLINK_H_ */
diff --git a/include/uapi/linux/mtk_dram_ecc_netlink.h b/include/uapi/linux/mtk_dram_ecc_netlink.h
new file mode 100644
index 000000000000..8b4a77722bdb
--- /dev/null
+++ b/include/uapi/linux/mtk_dram_ecc_netlink.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _UAPI_MTK_DRAM_ECC_NETLINK_H_
+#define _UAPI_MTK_DRAM_ECC_NETLINK_H_
+
+#define MTK_DRAM_ECC_GENL_NAME    "mtk_dram_ecc"
+#define MTK_DRAM_ECC_GENL_VERSION 1
+#define MTK_DRAM_ECC_MCAST_GRP    "events"
+
+/* Commands */
+enum mtk_dram_ecc_cmd {
+	MTK_DRAM_ECC_CMD_UNSPEC,
+	MTK_DRAM_ECC_CMD_EVENT,
+	__MTK_DRAM_ECC_CMD_MAX,
+};
+
+#define MTK_DRAM_ECC_CMD_MAX (__MTK_DRAM_ECC_CMD_MAX - 1)
+
+/*
+ * Attributes. rank, bank, row and column are the DRAM controller address
+ * fields of the error.
+ */
+enum mtk_dram_ecc_attr {
+	MTK_DRAM_ECC_ATTR_UNSPEC,
+	MTK_DRAM_ECC_ATTR_SPA,       /* u64 - System Physical Address */
+	MTK_DRAM_ECC_ATTR_SEVERITY,  /* u8  - 0=CE, 1=UCE */
+	MTK_DRAM_ECC_ATTR_CHANNEL,   /* u8  - DRAM channel index */
+	MTK_DRAM_ECC_ATTR_SUBCHANNEL, /* u8  - DRAM sub-channel, 0 or 1 */
+	MTK_DRAM_ECC_ATTR_RANK,      /* u16 - DRAMC rank address */
+	MTK_DRAM_ECC_ATTR_BANK,      /* u16 - DRAMC bank address */
+	MTK_DRAM_ECC_ATTR_ROW,       /* u32 - DRAMC row address */
+	MTK_DRAM_ECC_ATTR_COLUMN,    /* u16 - DRAMC column address */
+	__MTK_DRAM_ECC_ATTR_MAX,
+};
+
+#define MTK_DRAM_ECC_ATTR_MAX (__MTK_DRAM_ECC_ATTR_MAX - 1)
+
+/* Severity values for MTK_DRAM_ECC_ATTR_SEVERITY */
+#define MTK_DRAM_ECC_SEV_CE  0
+#define MTK_DRAM_ECC_SEV_UCE 1
+
+#endif /* _UAPI_MTK_DRAM_ECC_NETLINK_H_ */
-- 
2.45.2


