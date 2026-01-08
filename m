Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F42D1489A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 03:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pxfiPpStKTinNfI3yLuxNFmLirLijh17vubfs0MnKI=; b=EvxWqeF34teXNDyfqEBmFgFbyr
	i8qK003uqjv0+LrTY/ya/8Pkvuk/ShnTRoobTmflRx+xXKed9BL+XliRxgzbwtoj2zNEk82bNHBnR
	zWSDIzcQ43OQX3ZrQbUdy5I4oqE3nBKZFYT0/6HYYl0FIr6W+VO67gy6CjSCNwO6EsA05QUR1pdqK
	owSCnPcqAI44z5KXSiRHeHLBk+XHtPWsloiuizFpdS5lJdOm4pB+2tVzC0c+pU56bqtbhijc0vbvw
	rdDZ7yrVKB+zXyPTLtZEE0/1rP4e2+O6ynQhYMP5dBiDRQ2jUS0MWAr7xNVoHt4P3t1ha5MHfiUSv
	XSp5YkYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgSm-0000000Frtx-0w54;
	Thu, 08 Jan 2026 03:13:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgSi-0000000Frss-1lrR;
	Thu, 08 Jan 2026 03:13:25 +0000
X-UUID: fa5b0c16ec3f11f09f706fa2197c6ceb-20260107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6pxfiPpStKTinNfI3yLuxNFmLirLijh17vubfs0MnKI=;
	b=N7oLt+zLYi0RJ7WZB/tpdu2rN9lcziTFqMkz0jsuz1UICNQeSgrf+gIAYfvG23GqFhKtooXZbgZsqtgu6J4Xd7iWLSTRx3TPmcWs0P6Tt2TPADMI99/vRY+LolYnaEqzYXrqoCiNHAJbWYEq0rZ7JrmvTsqJU8j7M71vyNHIA5M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:bc385076-fb56-4827-9cac-e3a61f0f20f6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:1
X-CID-META: VersionHash:5047765,CLOUDID:e1268a79-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa5b0c16ec3f11f09f706fa2197c6ceb-20260107
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <dengjun.su@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 611278669; Wed, 07 Jan 2026 20:13:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:13:14 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 11:13:14 +0800
From: Dengjun Su <dengjun.su@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <dengjun.su@mediatek.com>, <mike.zhang@mediatek.com>,
	<haiqiang.gong@mediatek.com>, <peijun.huang@mediatek.com>, Ingo Molnar
	<mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] sched/rt: fix incorrect schedstats for rt thread
Date: Thu, 8 Jan 2026 11:13:07 +0800
Message-ID: <20260108031309.2754003-1-dengjun.su@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_191324_472430_5BE97D87 
X-CRM114-Status: GOOD (  12.21  )
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

For RT thread, only 'set_next_task_rt' will call
'update_stats_wait_end_rt' to update schedstats information.
However, during the RT migration process,
'update_stats_wait_start_rt' will be called twice, which
will cause the values of wait_max and wait_sum to be incorrect.
The specific output as follows:
$ cat /proc/6046/task/6046/sched | grep wait
wait_start                                   :             0.000000
wait_max                                     :        496717.080029
wait_sum                                     :       7921540.776553

Add 'update_stats_wait_end_rt' in 'update_stats_dequeue_rt' to
update schedstats information when dequeue_task.

Signed-off-by: Dengjun Su <dengjun.su@mediatek.com>
---
 kernel/sched/rt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index f1867fe8e5c5..12f2efddca9f 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1302,13 +1302,18 @@ update_stats_dequeue_rt(struct rt_rq *rt_rq, struct sched_rt_entity *rt_se,
 			int flags)
 {
 	struct task_struct *p = NULL;
+	struct rq *rq = rq_of_rt_rq(rt_rq);
 
 	if (!schedstat_enabled())
 		return;
 
-	if (rt_entity_is_task(rt_se))
+	if (rt_entity_is_task(rt_se)) {
 		p = rt_task_of(rt_se);
 
+		if (p != rq->curr)
+			update_stats_wait_end_rt(rt_rq, rt_se);
+	}
+
 	if ((flags & DEQUEUE_SLEEP) && p) {
 		unsigned int state;
 
-- 
2.43.0


