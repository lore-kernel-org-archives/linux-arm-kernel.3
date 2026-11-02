Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D87260A2609
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VsnY6Pna;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fG0zrikB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=182aLtUQDl6yVrGFjZWHHz/4bfGcfBF8JMLKZaHXAYg=; b=VsnY6PnaDnu39bxjmXQGk3zu9J
	Fac3Cm3AvtSOClfIzGeIV+POmpk6RkqDGc3WAHJfS1siVb5Elye8mejiG8DTBtJxhUKz3BSuj++xQ
	/qUtXD+uXoKZJ+vGbP21odXkQPxbwP7Lu7VDQIVde9izVc9Zxbd2/D+T0qkYP7RkjTYlxHANaGsSO
	7S0wOZLSgzdu0sBD7+KmGPXpx/oCqMPUrUmGxRvIB+6Y6e83thfP2CqTgNe0m8t4ry9yOnBp7EAj7
	g39TtISalv9j51qIx1Q9+vLmunzwnzj/+C1t1VPd+uuNts51+DdGtDqcB7hO+IVqQZpGP0XclLpdp
	IS7RUd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIF-0000000Fza6-3GlV;
	Mon, 02 Nov 2026 09:25:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoIB-0000000FzTL-4BQi;
	Mon, 02 Nov 2026 09:25:29 +0000
X-UUID: 54d00cc4d69f11f1acbe4559397dec65-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=182aLtUQDl6yVrGFjZWHHz/4bfGcfBF8JMLKZaHXAYg=;
	b=fG0zrikBP8S3c2fiLFaZVyZ9oEOTAKs0LlKRsb2VkwoqAfRkX+S/IWDKC+4hcdKZHX4iEUdBkU49lv37P6ZhYHmnDOTpvyOJtFi2fKB8n808Hr0styghDc1W7zqQU0ORcp3Nr28adnpc2TzaAdBWJ4jfQnwb8+EflGlSx4OLaKI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a841d82e-4ab0-41df-84e8-4f4abef54112,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:997c69a3-2f6f-43d1-a751-2a61c87fd6c5,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 54d00cc4d69f11f1acbe4559397dec65-20261102
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1093596365; Mon, 02 Nov 2026 02:25:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
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
Subject: [RFC PATCH 03/11] soc: mediatek: dram-ecc: add tracepoints
Date: Mon, 2 Nov 2026 17:23:25 +0800
Message-ID: <20261102092334.138759-4-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012528_047427_571B5875 
X-CRM114-Status: GOOD (  18.27  )
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

Add tracepoints for the driver lifecycle, corrected and uncorrectable
errors, and page retirement, so error handling can be followed with
ftrace without relying on the kernel log.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 drivers/soc/mediatek/dram-ecc/core/Makefile |   5 +-
 drivers/soc/mediatek/dram-ecc/core/main.c   |   3 +
 drivers/soc/mediatek/dram-ecc/core/trace.c  |   6 +
 drivers/soc/mediatek/dram-ecc/core/trace.h  | 119 ++++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.h

diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
index 429347bfd057..66ce5d306a45 100644
--- a/drivers/soc/mediatek/dram-ecc/core/Makefile
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -4,4 +4,7 @@ obj-$(CONFIG_MTK_DRAM_ECC) += mtk_dram_ecc.o
 
 mtk_dram_ecc-y := \
 	main.o \
-	smc.o
+	smc.o \
+	trace.o
+
+CFLAGS_trace.o := -I$(src)
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
index 5000d1f3c7e3..ce6bd39fa303 100644
--- a/drivers/soc/mediatek/dram-ecc/core/main.c
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -7,6 +7,7 @@
 #include <linux/device/class.h>
 
 #include "mtk_dram_ecc.h"
+#include "trace.h"
 
 static struct class *mtk_dram_ecc_class;
 static struct device *mtk_dram_ecc_dev;
@@ -33,6 +34,7 @@ static int __init mtk_dram_ecc_init(void)
 		goto err_class;
 	}
 
+	trace_mtk_dram_ecc_lifecycle(0);
 	dev_info(mtk_dram_ecc_dev, "initialized\n");
 	return 0;
 
@@ -45,6 +47,7 @@ static void __exit mtk_dram_ecc_exit(void)
 {
 	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
 	class_destroy(mtk_dram_ecc_class);
+	trace_mtk_dram_ecc_lifecycle(1);
 }
 
 module_init(mtk_dram_ecc_init);
diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.c b/drivers/soc/mediatek/dram-ecc/core/trace.c
new file mode 100644
index 000000000000..9a8b20e48069
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/trace.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#define CREATE_TRACE_POINTS
+#include "trace.h"
diff --git a/drivers/soc/mediatek/dram-ecc/core/trace.h b/drivers/soc/mediatek/dram-ecc/core/trace.h
new file mode 100644
index 000000000000..d603fc38f0a7
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/trace.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM mtk_dram_ecc
+
+#if !defined(_TRACE_MTK_DRAM_ECC_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_MTK_DRAM_ECC_H
+
+#include <linux/tracepoint.h>
+
+/* driver lifecycle - state: 0=init, 1=exit */
+
+TRACE_EVENT(mtk_dram_ecc_lifecycle,
+	TP_PROTO(int state),
+	TP_ARGS(state),
+	TP_STRUCT__entry(
+		__field(int, state)
+	),
+	TP_fast_assign(
+		__entry->state = state;
+	),
+	TP_printk("%s", __entry->state ? "driver removed" : "driver initialized")
+);
+
+/*
+ * ECC events - spa/channel/subchannel/rank/bank/row/column decoded from the
+ * ECCERR_INFO0/1 entry that determined severity (see ghes_notifier.c),
+ * mirroring ATF dram_ecc/mt8992/fiq.c's decode. No agent/master ID: ATF's
+ * GHES vendor section doesn't compute them (see mtk_dram_ecc_event.h).
+ */
+
+TRACE_EVENT(mtk_dram_ecc_ce,
+	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
+		 u16 column),
+	TP_ARGS(spa, channel, subch, rank, bank, row, column),
+	TP_STRUCT__entry(
+		__field(u64, spa)
+		__field(u8, channel)
+		__field(u8, subch)
+		__field(u16, rank)
+		__field(u16, bank)
+		__field(u32, row)
+		__field(u16, column)
+	),
+	TP_fast_assign(
+		__entry->spa     = spa;
+		__entry->channel = channel;
+		__entry->subch   = subch;
+		__entry->rank    = rank;
+		__entry->bank    = bank;
+		__entry->row     = row;
+		__entry->column  = column;
+	),
+	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
+		  __entry->spa, __entry->channel, __entry->subch,
+		  __entry->rank, __entry->bank, __entry->row,
+		  __entry->column)
+);
+
+TRACE_EVENT(mtk_dram_ecc_uce,
+	TP_PROTO(u64 spa, u8 channel, u8 subch, u16 rank, u16 bank, u32 row,
+		 u16 column),
+	TP_ARGS(spa, channel, subch, rank, bank, row, column),
+	TP_STRUCT__entry(
+		__field(u64, spa)
+		__field(u8, channel)
+		__field(u8, subch)
+		__field(u16, rank)
+		__field(u16, bank)
+		__field(u32, row)
+		__field(u16, column)
+	),
+	TP_fast_assign(
+		__entry->spa     = spa;
+		__entry->channel = channel;
+		__entry->subch   = subch;
+		__entry->rank    = rank;
+		__entry->bank    = bank;
+		__entry->row     = row;
+		__entry->column  = column;
+	),
+	TP_printk("spa=0x%016llx ch=%u subch=%u rank=%u bank=%u row=%u column=%u",
+		  __entry->spa, __entry->channel, __entry->subch,
+		  __entry->rank, __entry->bank, __entry->row,
+		  __entry->column)
+);
+
+/* page retire */
+
+TRACE_EVENT(mtk_dram_ecc_page_retire,
+	TP_PROTO(u64 pfn, u32 count, u32 threshold, bool retired),
+	TP_ARGS(pfn, count, threshold, retired),
+	TP_STRUCT__entry(
+		__field(u64,  pfn)
+		__field(u32,  count)
+		__field(u32,  threshold)
+		__field(bool, retired)
+	),
+	TP_fast_assign(
+		__entry->pfn       = pfn;
+		__entry->count     = count;
+		__entry->threshold = threshold;
+		__entry->retired   = retired;
+	),
+	TP_printk("pfn=0x%llx count=%u threshold=%u retired=%s",
+		  __entry->pfn, __entry->count, __entry->threshold,
+		  __entry->retired ? "yes" : "no")
+);
+
+#endif /* _TRACE_MTK_DRAM_ECC_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
-- 
2.45.2


