Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCE9606D839
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=krHxp2QL;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=X3m/64cs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=czHTZkJ3TKYgESCxC79vT1Kt+Z4QQw2HxdI0thihZ/8=; b=krHxp2QLInhHi2UsNiLJ8dFn6p
	fVeHF+3lz/zi/oBknD+WnduK7zTDfbZfo+sdPSq0AtkKZx3xPrvuhVcJ2xuH04PenLB37yKvx7xpj
	wOdjCvPRzNiPs85zBIG2ORSOusiMxcs6Le8ThYidJmiEUE5RfLD1TXfPjIOJn1gxbtO0h25BVSBZ4
	L52VBZFKwle/eteOyoX1VP8LTdyvQw6hvBR1ukOLuOakP2ZB4rAjkLSEDnqFirTP4AHLV69Ra/JCf
	tp8+eSFJ59XGuP3BDD9YDqVMR3MO3/16QrOYSWYA1qAkzbPVmoIdaUSy9Kws68/y1UOaOX6yf+Taz
	7oov0Dxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEth-0000000BW3T-2GLC;
	Fri, 06 Nov 2026 08:02:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEte-0000000BW24-3mbS;
	Fri, 06 Nov 2026 08:02:04 +0000
X-UUID: 5456daf4d9b811f1afed4741b24580c9-20261106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=czHTZkJ3TKYgESCxC79vT1Kt+Z4QQw2HxdI0thihZ/8=;
	b=X3m/64csSEQoss9lEcl0w3aRMXYmloJYOzZ6MV/zpobmSrH0RhDkbhq8h4gaVQSiQbpwnwgsrWQmfeSiRgyB/WkcvgGLY1Kh/6kYCbudzNDw9dqYeD/UCkJOamx5gVTlPxe/D5Ww2a1XYAylzFnl57YCyTtYOLq11e4ap0veDEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:879c7976-657a-4596-968e-6dbac48a75b6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:dca574bb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5456daf4d9b811f1afed4741b24580c9-20261106
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <fangwen.deng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1892671842; Fri, 06 Nov 2026 01:01:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 6 Nov 2026 16:01:51 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 6 Nov 2026 16:01:50 +0800
From: Fangwen Deng <fangwen.deng@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jarried.lin@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<justin.yeh@mediatek.com>, Fangwen Deng <fangwen.deng@mediatek.com>
Subject: [PATCH] usb: mtu3: cancel EP0 requests to prevent use-after-free
Date: Fri, 6 Nov 2026 16:00:58 +0800
Message-ID: <20261106080140.342107-1-fangwen.deng@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_000202_984755_B7C5663D 
X-CRM114-Status: GOOD (  19.09  )
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

mtu3_ep0_dequeue() always returns -EINVAL and leaves the request on
mep->req_list without unlinking or completing it, so an EP0 request
can never be cancelled.

FunctionFS assigns its temporary read buffer to ep0req and waits in
__ffs_ep0_queue_wait(). When that wait is interrupted by a signal it
calls usb_ep_dequeue(), does not check the return value, and its
caller ffs_ep0_read() frees the buffer on every exit path. With
-EINVAL returned the request stays queued and MTU3 still owns it.
When the host then sends the OUT data stage, ep0_rx_state() writes
the received bytes through the stale req->buf, giving the host a
content-controlled write into freed kernel memory. That corrupts
whichever object reuses the slab and can panic the kernel.

Implement mtu3_ep0_dequeue() following mtu3_gadget_dequeue() but
without QMU flush/start since EP0 uses PIO: validate the request
under mtu->lock, unlink it once and give it back with -ECONNRESET,
so ownership of the buffer returns to FunctionFS before it is freed.

Cancelling the request that backed the data stage also leaves the
transfer unable to finish, so retire the aborted transaction with a
protocol stall. That returns ep0_state to SETUP and stops a later
ep0_queue() from reading this transaction's leftover FIFO data into
the next request's buffer. The stall is skipped when the controller
is already powered down or no data stage is in flight.

The same stub is why functionfs_unbind() cannot cancel a pending EP0
request, which deadlocks against the FunctionFS thread holding
ffs->mutex.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Signed-off-by: Fangwen Deng <fangwen.deng@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 55 ++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index e4fd1bb14a55..73a1af8b6c65 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -857,8 +857,59 @@ static int mtu3_ep0_queue(struct usb_ep *ep,
 
 static int mtu3_ep0_dequeue(struct usb_ep *ep, struct usb_request *req)
 {
-	/* we just won't support this */
-	return -EINVAL;
+	struct mtu3_ep *mep;
+	struct mtu3_request *mreq = NULL;
+	struct mtu3_request *r = NULL;
+	struct mtu3 *mtu;
+	unsigned long flags;
+	int ret = 0;
+
+	if (!ep || !req)
+		return -EINVAL;
+
+	mep = to_mtu3_ep(ep);
+	mtu = mep->mtu;
+
+	spin_lock_irqsave(&mtu->lock, flags);
+
+	mreq = to_mtu3_request(req);
+
+	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
+
+	list_for_each_entry(r, &mep->req_list, list) {
+		if (r == mreq)
+			break;
+	}
+	if (r != mreq) {
+		dev_info(mtu->dev, "req=%p not queued to %s\n", req, ep->name);
+		ret = -EINVAL;
+		goto done;
+	}
+
+	if (mreq->mep != mep) {
+		dev_info(mtu->dev, "mreq->mep != mep, not queued.\n");
+		ret = -EINVAL;
+		goto done;
+	}
+
+	trace_mtu3_gadget_dequeue(mreq);
+
+	/*
+	 * The cancelled request backed the current control transfer, so abort it
+	 * with an EP0 STALL and reset ep0_state to SETUP to avoid FIFO leftovers
+	 * leaking into the next request. Clear happens in the EP0 ISR (W1C
+	 * EP0_SENTSTALL), so EP0 won't stay halted. Do this before
+	 * mtu3_req_complete() drops mtu->lock to avoid stalling a new transfer.
+	 */
+	if (mtu->is_active && mtu->ep0_state != MU3D_EP0_STATE_SETUP)
+		ep0_stall_set(mtu->ep0, true, 0);
+
+	/* ep0 uses PIO, so no QMU to flush/restart as mtu3_gadget_dequeue() does */
+	mtu3_req_complete(mep, req, -ECONNRESET);
+
+done:
+	spin_unlock_irqrestore(&mtu->lock, flags);
+	return ret;
 }
 
 static int mtu3_ep0_halt(struct usb_ep *ep, int value)
-- 
2.45.2


