Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36507C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaouMrHf0sBpiH7oiFC52Kf32tgj7gpdzB/pLuk6TXE=; b=BzEwaY5om43sfv6piNk/QijT2t
	WCdA/UMUORMNBbNaEcXeriuW9iEKKXMQ99CID25D1pCVX6IrjVywSYSVnNSJysg4uDQsHGCjlpPRQ
	maiIR8W5NhEdNv+qPmn51T1zgOfGFDV3bBIhKsLpfOA/CZWrDkgHbwxwL48njHKvTHruN2ZejkAnw
	pkjkOU7bGyYNNI6SqG1kv3pU2NT4+6BGS/o/kl3sS/7iUziCknP04C7/W2PxGDYNdHi7NfE/BJJ47
	AdDRB7fgr7ZXB8v8p5uut86PDizsoNZtMvcQCYYz4cGBk84TCRjqPuBIMpgaeKV1U60xqjVXNNgJB
	raUSbH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Ft-0000000Gh3s-1rEz;
	Thu, 03 Sep 2026 07:53:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22Fs-0000000Gh2q-3ahV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CaouMrHf0sBpiH7oiFC52Kf32tgj7gpdzB/pLuk6TXE=; b=GiK4MZEOzYvA0MBSVzOBxNLQBU
	qvHDX+GJj6d1VqYHQcbGVtJXagKiN2D7IyNZK/0WUOmAzLwxFwMmUtclUBcd2kvHVdW6wa7a0qMFA
	s3FMOtCuAPAER8E7Mdwv1TdR5AYkSudvS3X0s4w+vwjywV5eJ1gMzXvON2rbOOK+Ta9Xstjv6Kvbb
	Nd7Zg6n5CjFNb7OL4Ub8MlBmNq7gsTwmdcRDSpdTnywx0zyRQz9WftOKPGoMz9z3Fp5xry0DxzXhr
	5CbQNomPjsKgB8q78UJCR3hIgIAAYZ0wiem6fJJkOH6TKvX9lkRKnEwxO3FC4h6lSJjE9ZX0c1W4Q
	R+zYluNA==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x22Fp-0000000Copg-1ih3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:53:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CaouMrHf0sBpiH7oiFC52Kf32tgj7gpdzB/pLuk6TXE=;
	b=QPcdzo9LzezfooH0eCR+FqKx6wKR0nt7K5LkOl6xwr4WTy+eevZBB22JIctC741u6HVe9vl8P
	0BKoN+OTu9GnhlXHE8vBlbMbctmmEt6UObCKvVNwve2k+xyHTL55d7A+FecuTUHTGE6yWC8JfOU
	SKXE/X7TQMyQm0SsEeFfWAo=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hbBPm4ZBSzcbQ9;
	Thu,  3 Sep 2026 15:42:04 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id EE07240575;
	Thu,  3 Sep 2026 15:52:51 +0800 (CST)
Received: from huawei.com (10.50.163.32) by whupemo200004.china.huawei.com
 (7.152.184.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:52:49 +0800
From: Sizhe Liu <liusizhe5@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <wangyushan12@huawei.com>,
	<wuzongyu1@huawei.com>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <liusizhe5@huawei.com>
Subject: [PATCH v3 3/8] perf hisi-ptt: Extract the raw data printing part
Date: Thu, 3 Sep 2026 15:52:36 +0800
Message-ID: <20260903075241.1445338-4-liusizhe5@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260903075241.1445338-1-liusizhe5@huawei.com>
References: <20260903075241.1445338-1-liusizhe5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_085302_141724_922DF410 
X-CRM114-Status: GOOD (  10.43  )
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

Extract the raw data printing part of the TLP header into
hisi_ptt_print_raw_record() for reuse by subsequent patches that
add field-level parsing of individual DW headers.

Reviewed-by: Yushan Wang <wangyushan12@huawei.com>
Signed-off-by: Sizhe Liu <liusizhe5@huawei.com>
---
 .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c   | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
index 766665414ad8..23ae99f33c9f 100644
--- a/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
+++ b/tools/perf/util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
@@ -79,23 +79,31 @@ static const char * const hisi_ptt_4dw_pkt_field_name[] = {
 	[HISI_PTT_4DW_HEAD3]	= "Header DW3",
 };
 
-static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
-			       const char *desc)
+static void hisi_ptt_print_raw_record(size_t offset, uint32_t value)
 {
 	const char *color = PERF_COLOR_BLUE;
 	uint8_t byte;
-	uint32_t dw;
 	int i;
 
-	dw = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
 	printf(".");
-	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
+	color_fprintf(stdout, color, "  %08zx: ", offset);
 	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
-		byte = (dw >> (24 - i * 8)) & 0xFF;
+		byte = (value >> (24 - i * 8)) & 0xFF;
 		color_fprintf(stdout, color, "%02x ", byte);
 	}
 	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
 		color_fprintf(stdout, color, "   ");
+}
+
+static void hisi_ptt_print_pkt(struct hisi_ptt_pkt_buf *pkt_buf,
+			       const char *desc)
+{
+	const char *color = PERF_COLOR_BLUE;
+	uint32_t value;
+
+	value = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
+	hisi_ptt_print_raw_record(pkt_buf->pos, value);
+
 	color_fprintf(stdout, color, "  %s\n", desc);
 	pkt_buf->pos += HISI_PTT_FIELD_LENGTH;
 }
@@ -120,19 +128,10 @@ static int hisi_ptt_8dw_pkt_desc(struct hisi_ptt_pkt_buf *pkt_buf)
 static void hisi_ptt_4dw_print_dw0(struct hisi_ptt_pkt_buf *pkt_buf)
 {
 	const char *color = PERF_COLOR_BLUE;
-	uint8_t byte;
 	uint32_t dw;
-	int i;
 
 	dw = get_unaligned_le32(pkt_buf->buf + pkt_buf->pos);
-	printf(".");
-	color_fprintf(stdout, color, "  %08zx: ", pkt_buf->pos);
-	for (i = 0; i < HISI_PTT_FIELD_LENGTH; i++) {
-		byte = (dw >> (24 - i * 8)) & 0xFF;
-		color_fprintf(stdout, color, "%02x ", byte);
-	}
-	for (i = 0; i < HISI_PTT_MAX_SPACE_LEN; i++)
-		color_fprintf(stdout, color, "   ");
+	hisi_ptt_print_raw_record(pkt_buf->pos, dw);
 
 	color_fprintf(stdout, color,
 		      "  %s %x %s %x %s %x %s %x %s %x %s %x %s %x %s %x\n",
-- 
2.33.0


