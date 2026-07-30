Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAF5C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1F245qQezDZ5rCXwhEsnhH1Zz5SLu6ydfX/1HeJj9k=; b=J71AP8/uQZ/Ue2l9U/WZ3u7S+1
	0tm6tNuVdmQywgCvNGV/JTH+/VvS6VkAxp+v0pmfH0ev+G6ESdn5385o6961iK009VcL/S2EaAvr3
	xX2PYbO+UVUnyERh6Y3tJ4Ml0dQCtPpXB50D52Hxmrc34UzO4pXassD/Pm2wauifMtXzUUlG3bF6O
	4r5YKRz7sJFX1BWul0HkrjlHbzBLYRQBuJjZZsZvxaF8YQQyE4ER6ZpTfCKxjkBAxMhWC9riMccl0
	ohSnujE1hk7iVkcEMjJNj6nQYqJgNnXHV7glpAGfqguhXpQUKQJOSK9GEggaLXOBMHqdtghs2Wwrr
	QkVXy0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKEv-00000009boR-2TW2;
	Thu, 30 Jul 2026 06:27:33 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKEm-00000009bls-1cPC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:27:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q1F245qQezDZ5rCXwhEsnhH1Zz5SLu6ydfX/1HeJj9k=;
	b=a9f9Mgq9p5R59tNJ75UG0VcRRwEco/g2Jxjqw5fxsBDvFR8bw5VdD6kRZgbY1qgA+F9qLPvh2
	19prZGB/qhArfmUVCyxQoj2BM94+86lcwJaUw0ctHNXvmc7D400SzikpZQN4Q2MmYonJAwoqUPZ
	xNw67ijbJJDFzDWE6rUnjfI=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h9fBp2QWvznTvp;
	Thu, 30 Jul 2026 14:17:54 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C01D4058E;
	Thu, 30 Jul 2026 14:27:21 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 30 Jul
 2026 14:27:18 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <wuyifan50@huawei.com>, <liusizhe5@huawei.com>
Subject: [PATCH v2 3/3] perf hisi-ptt: Fix spelling and abbreviation errors
Date: Thu, 30 Jul 2026 14:27:09 +0800
Message-ID: <20260730062709.534139-4-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260730062709.534139-1-liusizhe5@huawei.com>
References: <20260730062709.534139-1-liusizhe5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_232725_111644_773CE588 
X-CRM114-Status: GOOD (  13.62  )
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

Fix spelling and abbreviation errors in the PTT packet decoder:
- HISI_PTT_FIELD_LENTH -> HISI_PTT_FIELD_LENGTH
- hisi_ptt_8dw_kpt_desc -> hisi_ptt_8dw_pkt_desc
- hisi_ptt_4dw_kpt_desc -> hisi_ptt_4dw_pkt_desc

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 20 +++++++++----------
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.h   |  2 +-
 tools/perf/util/hisi-ptt.c                    |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 5db44556fc4f..72a877fd7236 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -85,7 +85,7 @@ static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *de
 	dw = get_unaligned_le32(buf + pos);
 	printf(".");
 	color_fprintf(stdout, color, "  %08x: ", pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++) {
+	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
 		byte = (dw >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
 	}
@@ -94,19 +94,19 @@ static void hisi_ptt_print_pkt(const unsigned char *buf, int pos, const char *de
 	color_fprintf(stdout, color, "  %s\n", desc);
 }
 
-static int hisi_ptt_8dw_kpt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_8dw_pkt_desc(const unsigned char *buf, int pos)
 {
 	int i;
 
 	for (i = 0; i < HISI_PTT_8DW_TYPE_MAX; i++) {
 		/* Do not show 8DW check field and reserved fields */
 		if (i == HISI_PTT_8DW_CHK_AND_RSV0 || i == HISI_PTT_8DW_RSV1) {
-			pos += HISI_PTT_FIELD_LENTH;
+			pos += HISI_PTT_FIELD_LENGTH;
 			continue;
 		}
 
 		hisi_ptt_print_pkt(buf, pos, hisi_ptt_8dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENTH;
+		pos += HISI_PTT_FIELD_LENGTH;
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_8DW_PKT];
@@ -122,7 +122,7 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 	dw = get_unaligned_le32(buf + pos);
 	printf(".");
 	color_fprintf(stdout, color, "  %08x: ", pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENTH; i++) {
+	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
 		byte = (dw >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
 	}
@@ -141,16 +141,16 @@ static void hisi_ptt_4dw_print_dw0(const unsigned char *buf, int pos)
 		      "Time", FIELD_GET(HISI_PTT_HEAD0_4DW_TIME, dw));
 }
 
-static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
+static int hisi_ptt_4dw_pkt_desc(const unsigned char *buf, int pos)
 {
 	int i;
 
 	hisi_ptt_4dw_print_dw0(buf, pos);
-	pos += HISI_PTT_FIELD_LENTH;
+	pos += HISI_PTT_FIELD_LENGTH;
 
 	for (i = 0; i < HISI_PTT_4DW_TYPE_MAX; i++) {
 		hisi_ptt_print_pkt(buf, pos, hisi_ptt_4dw_pkt_field_name[i]);
-		pos += HISI_PTT_FIELD_LENTH;
+		pos += HISI_PTT_FIELD_LENGTH;
 	}
 
 	return hisi_ptt_pkt_size[HISI_PTT_4DW_PKT];
@@ -159,7 +159,7 @@ static int hisi_ptt_4dw_kpt_desc(const unsigned char *buf, int pos)
 int hisi_ptt_pkt_desc(const unsigned char *buf, int pos, enum hisi_ptt_pkt_type type)
 {
 	if (type == HISI_PTT_8DW_PKT)
-		return hisi_ptt_8dw_kpt_desc(buf, pos);
+		return hisi_ptt_8dw_pkt_desc(buf, pos);
 
-	return hisi_ptt_4dw_kpt_desc(buf, pos);
+	return hisi_ptt_4dw_pkt_desc(buf, pos);
 }
diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
index 333eee02b19d..3b349fcc24ae 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h
@@ -15,7 +15,7 @@
 #define HISI_PTT_8DW_CHECK_MASK		GENMASK(31, 11)
 #define HISI_PTT_IS_8DW_PKT		GENMASK(31, 11)
 #define HISI_PTT_MAX_SPACE_LEN		10
-#define HISI_PTT_FIELD_LENTH		4
+#define HISI_PTT_FIELD_LENGTH		4
 
 /* Header DW0 fields for 4DW format */
 #define HISI_PTT_HEAD0_4DW_TIME		GENMASK_U32(10, 0)
diff --git a/tools/perf/util/hisi-ptt.c b/tools/perf/util/hisi-ptt.c
index d6f48993fdd6..e73c57f9e8a4 100644
--- a/tools/perf/util/hisi-ptt.c
+++ b/tools/perf/util/hisi-ptt.c
@@ -42,7 +42,7 @@ static enum hisi_ptt_pkt_type hisi_ptt_check_packet_type(unsigned char *buf,
 {
 	uint32_t head;
 
-	if (len < HISI_PTT_FIELD_LENTH)
+	if (len < HISI_PTT_FIELD_LENGTH)
 		return HISI_PTT_4DW_PKT;
 
 	head = get_unaligned_le32(buf);
-- 
2.33.0


