Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8193CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpvKQ5RZmE4EfaTAo3mt11IS3VqOx6Zab6zSWyDeGd8=; b=dyNFhl84meGJwr58itD9lOLGxr
	G767ANC9nEpy4yZFm+w3nEV/KiShaqN8TI8CIDsxzDFaWLAkw+afSK/VB/+ETUkjq/OIAgltHDHIY
	7frYXII14NynP9pFMc2h/hmdog429n7/ae69zB3uRT9xpxeHzjYPzlKv09NDGLX8BvoPURGzNuSoT
	f0k7uJtfTCDz1jiL+SC/qXz8CujoEYfItH4Q324GinzadZtMPJFJcBY/R7tD2/4+9duNxF374e3Vj
	wxyc4ZTpDQ9vR8KaZByQ+kaHw0JlPRm8s9nizRRJi8a6s6UkhaBaqxCdu7UN29nX0O50+lmVM7PBO
	hnyxAymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxLG-00000005Ucd-2h55;
	Fri, 29 Aug 2025 11:32:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvEm-000000056rL-0uDz;
	Fri, 29 Aug 2025 09:17:37 +0000
X-UUID: fe1cdf6c84b811f09eb0dd999d3936bf-20250829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OpvKQ5RZmE4EfaTAo3mt11IS3VqOx6Zab6zSWyDeGd8=;
	b=Fte1++nL/Z4b5qTQNBqCSaIJV/hZ4+KJ5UQcDRJk8IBug5EATyUamXcBtHy1UaVdMtHSth7lQ0HIX0deMmRfB3TMHTV5ROTgnGanYt5Wr0kLoBUZZCwRX2X6f+H+52MlkHGJOUPCHvMyXdUNHh1nfLzV422WEh60PL4Vjt7AoYM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:9e004efa-f2fa-4154-8754-3c12bd7c6569,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9e37fe6b-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe1cdf6c84b811f09eb0dd999d3936bf-20250829
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 296025594; Fri, 29 Aug 2025 02:17:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 29 Aug 2025 17:17:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 29 Aug 2025 17:17:28 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jassi Brar
	<jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Jarried
 Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>
Subject: [PATCH v2 1/3] mailbox: mtk-cmdq: Remove pm_runtime APIs from cmdq_mbox_send_data()
Date: Fri, 29 Aug 2025 17:15:58 +0800
Message-ID: <20250829091727.3745415-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_021736_259622_8B3EBFCB 
X-CRM114-Status: GOOD (  13.78  )
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

pm_runtime_get_sync() and pm_runtime_put_autosuspend() were previously
called in cmdq_mbox_send_data(), which is under a spinlock in msg_submit()
(mailbox.c). This caused lockdep warnings such as "sleeping function
called from invalid context" when running with lockdebug enabled.

The BUG report:
  BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 3616, name: kworker/u17:3
    preempt_count: 1, expected: 0
    RCU nest depth: 0, expected: 0
    INFO: lockdep is turned off.
    irq event stamp: 0
    CPU: 1 PID: 3616 Comm: kworker/u17:3 Not tainted 6.1.87-lockdep-14133-g26e933aca785 #1
    Hardware name: Google Ciri sku0/unprovisioned board (DT)
    Workqueue: imgsys_runner imgsys_runner_func
    Call trace:
     dump_backtrace+0x100/0x120
     show_stack+0x20/0x2c
     dump_stack_lvl+0x84/0xb4
     dump_stack+0x18/0x48
     __might_resched+0x354/0x4c0
     __might_sleep+0x98/0xe4
     __pm_runtime_resume+0x70/0x124
     cmdq_mbox_send_data+0xe4/0xb1c
     msg_submit+0x194/0x2dc
     mbox_send_message+0x190/0x330
     imgsys_cmdq_sendtask+0x1618/0x2224
     imgsys_runner_func+0xac/0x11c
     process_one_work+0x638/0xf84
     worker_thread+0x808/0xcd0
     kthread+0x24c/0x324
     ret_from_fork+0x10/0x20

Additionally, pm_runtime_put_autosuspend() should be invoked from the
GCE IRQ handler to ensure the hardware has actually completed its work.

To resolve these issues, remove the pm_runtime calls from
cmdq_mbox_send_data() and delegate power management responsibilities
to the client driver.

Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM with autosuspend")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 532929916e99..654a60f63756 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -379,20 +379,13 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task;
 	unsigned long curr_pa, end_pa;
-	int ret;
 
 	/* Client should not flush new tasks if suspended. */
 	WARN_ON(cmdq->suspended);
 
-	ret = pm_runtime_get_sync(cmdq->mbox.dev);
-	if (ret < 0)
-		return ret;
-
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
-	if (!task) {
-		pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	if (!task)
 		return -ENOMEM;
-	}
 
 	task->cmdq = cmdq;
 	INIT_LIST_HEAD(&task->list_entry);
@@ -439,9 +432,6 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	}
 	list_move_tail(&task->list_entry, &thread->task_busy_list);
 
-	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
-
 	return 0;
 }
 
-- 
2.43.0


