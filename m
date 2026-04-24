Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0913FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnmvqSve67mSROwu3/beMnE8wPFOEh4SB0WFOJvTNDI=; b=rKznLrwGu6wkDlNtJBHj6db1C1
	dOkFinXZnbfO74W7VWUmIfFNtBVgmirtxNVKx/ZwZ7n1J1gr/3q/PvMOVL285YS1X0wAR047Ge2Ys
	UC0R88CfBrp81NLx7eqWcGVP/pUhkralyoxuFok9wpOVERpJzeR9rrGSf4PpBwG7DwT/McyyoGvua
	ACWfCosrOaDc/G7tPDQaVchebifTPZNnmK1q0x6pgSoosz528FiHH8BZAChBiIByAd5hG1KIFVCXK
	mSQx/SO/qmyJs7vy5lSKCjQW/xEy6nOzdWa2HXHqWZm1F3uXEkNsJOPoHoD8VlpDwuQ3WvFI4ctuI
	C6VQ7vaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAo-0000000Dp4W-0gvd;
	Fri, 24 Apr 2026 22:38:58 +0000
Received: from acj35aaf84.lhr1.oracleemaildelivery.com ([130.35.116.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAb-0000000Dox9-1Yim
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 22:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=GnmvqSve67mSROwu3/beMnE8wPFOEh4SB0WFOJvTNDI=;
 b=DtRy5q2P1RQwns0+iP2LhockANsnijAjGcA/eN6QkxMA22Yc9rljkUf98LZAHwIKf/hm7fhvslDL
   jbIYik8YKMPIZ5I5SFKUrQWOJR9vK3ZMZP5yqA214g60R3bNLZ3kALYv8qm8/eobq5QXXkJRqUDV
   zd97TINv7ySXD/nGUwsM+YsTW/zJ5HAwkyMxmpI+rc0VmTEdYWDo1wiw1LDpNtZyfPeFkNIMvg8Q
   ydJBcgqrZ3PIAQJNR5b357+Y0Qu7LrxJLpMk5rXcJgrF0AFTg8x99yFa5Y5Ss0daMcyQp+7G0mBU
   rRNCGmSVLhIEM46vYaXyXIYDgwkdqNyRlGDKow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=GnmvqSve67mSROwu3/beMnE8wPFOEh4SB0WFOJvTNDI=;
 b=iATG8IVUlDAHv04SbWZyFmyXEKAgLR6eNXoW4hYWtPy5QnsNf0H24xejBA94rtl18KlW0h4CB3MK
   9dLhqcUEgM8J1G5miV0ZOekIb1qU8INqeD4xpZSCYcf6XT5LJTI2pN4+gt7tm0Xwo+uF4MhyYJ6/
   Ow4wUkG4AtKzGYo5Lp+gXL+VC64Fq5wO0ZlrQHnPuCsufh91/wwiQMcJS7M3/1G0b0vetYiC8DgV
   rUmr6t8Dncf3Qx6e1N5UhglfZsOrcq4KWXzaiIT5mYK1Licf4+93csCH1zA6qRG6G27xoo/Rinx1
   usAWCsmA+kCSq8Xzxxu5zVebiuEXwWTOQJhr1Q==
Received: by omta-ad1-fd2-402-uk-london-1.omtaad1.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TE0008OPS8AMZ50@omta-ad1-fd2-402-uk-london-1.omtaad1.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Fri, 24 Apr 2026 22:38:34 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: [RFC PATCH net-next 3/3] net: macb: add TX stall watchdog as
 defence-in-depth safety net
Date: Fri, 24 Apr 2026 23:38:33 +0100
Message-id: <c0469642f42ada85d91a8a685eb7c0e04cb99131.1777064117.git.lukasz@raczylo.com>
X-Mailer: git-send-email 2.53.0
In-reply-to: <cover.1777064117.git.lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAFzDiYTuS9jvqSCDQoXiqVnkU2yDl7DFh57yZB8VktRLO86c1eFyO5ekvNWCLwV
 PHyd9gw8WA5srfV/TRAU0XPcqN0ckK5QcJJn1WGMY80Ot23Ko8xRUR56afncaClD
 IwcrzhTyEUg+V+dAD8gok13VxVE/I/VJ4RuHXNxj7BEclv19ZelDRDoVP3ydf02g
 Vzk4tkrHdi3GjxEjgp2h/yp4Ufj4ngiY/lZhVN5pmxa+LzCg5eUShBaZxj0K9poT
 ai2fE0HW0rYxqvxFwgpzGW8u2HVLxEAoJh47hheiK9GSkqbIpSYuo69DBhz6lTwv
 +WVuvJcbmLx1Mm4gyT88Bp5xwj33xShAUNfwOtrO40Zy/8P6cefU47P56sFu7vN9
 +q2lt8kwYwd8xBMMrSgftdlmcUYKqcCg5n8bm1hc5Jx5u2z8hUzbZt7YIWFbB4h9 8z0powOZ1A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_153845_412724_6ABD247D 
X-CRM114-Status: GOOD (  19.69  )
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

Patches 1/3 and 2/3 address two candidate races that could lead
to a TCOMP completion being missed on PCIe-attached macb
instances.  This patch adds a defence-in-depth safety net, in
case a further race remains that we have not identified.

The watchdog is a per-queue delayed_work that runs once per
second.  It snapshots queue->tx_tail; if the ring is non-empty
(queue->tx_head != queue->tx_tail) and tx_tail has not advanced
since the previous tick, it calls macb_tx_restart().

No new recovery logic is introduced.  macb_tx_restart() already
exists in this file, is correctly locked (tx_ptr_lock, bp->lock),
and verifies that the hardware's TBQP is behind the driver's
head index before re-asserting TSTART.  On a healthy ring it is
a no-op at the hardware level; the watchdog only supplies the
missing trigger.

On a healthy queue the per-tick cost is one spin_lock_irqsave()
/ spin_unlock_irqrestore() and one branch.  The delayed_work is
only scheduled between macb_open() and macb_close(), and is
cancelled synchronously on close.

Context for submission: on our 24-node Raspberry Pi 5 fleet,
before this series, an out-of-band user-space watchdog
(monitoring tx_packets from /sys/class/net/.../statistics and
toggling the link down/up when it froze) was required to keep
nodes usable.  We include this kernel-side watchdog as a cleaner
in-kernel equivalent for any residual stall that patches 1 and
2 do not cover.  We are willing to drop this patch if the view
is that 1 and 2 should stand alone.

Link: https://github.com/cilium/cilium/issues/43198
Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
---
 drivers/net/ethernet/cadence/macb.h      |  5 ++
 drivers/net/ethernet/cadence/macb_main.c | 59 ++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 2de56017e..9115f2b47 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1278,6 +1278,11 @@ struct macb_queue {
 	dma_addr_t		tx_ring_dma;
 	struct work_struct	tx_error_task;
 	bool			txubr_pending;
+
+	/* TX stall watchdog -- see macb_tx_stall_watchdog() in macb_main.c */
+	struct delayed_work	tx_stall_watchdog_work;
+	unsigned int		tx_stall_last_tail;
+
 	struct napi_struct	napi_tx;
 
 	dma_addr_t		rx_ring_dma;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index ea231b1c5..ea2306ef7 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -2002,6 +2002,59 @@ static int macb_tx_poll(struct napi_struct *napi, int budget)
 	return work_done;
 }
 
+#define MACB_TX_STALL_INTERVAL_MS	1000
+
+/*
+ * TX stall watchdog.
+ *
+ * Defence-in-depth against lost TCOMP interrupts.  macb already has a
+ * recovery chain (tx_pending -> txubr_pending -> macb_tx_restart())
+ * that fires on TCOMP; if TCOMP itself is lost the TX ring stalls
+ * silently until something else kicks TSTART.  This watchdog runs
+ * once per second per queue, snapshots tx_tail, and calls
+ * macb_tx_restart() if the ring is non-empty and tx_tail has not
+ * advanced since the previous tick.
+ *
+ * macb_tx_restart() already checks the hardware's TBQP against the
+ * driver's head index before re-asserting TSTART, so on a healthy
+ * ring this is a no-op at the hardware level.  The watchdog only
+ * adds the missing trigger.
+ */
+static void macb_tx_stall_watchdog(struct work_struct *work)
+{
+	struct macb_queue *queue = container_of(to_delayed_work(work),
+						struct macb_queue,
+						tx_stall_watchdog_work);
+	struct macb *bp = queue->bp;
+	unsigned int cur_tail, cur_head;
+	bool stalled = false;
+	unsigned long flags;
+
+	if (!netif_running(bp->dev))
+		return;
+
+	spin_lock_irqsave(&queue->tx_ptr_lock, flags);
+	cur_tail = queue->tx_tail;
+	cur_head = queue->tx_head;
+	if (cur_head != cur_tail &&
+	    cur_tail == queue->tx_stall_last_tail)
+		stalled = true;
+	else
+		queue->tx_stall_last_tail = cur_tail;
+	spin_unlock_irqrestore(&queue->tx_ptr_lock, flags);
+
+	if (stalled) {
+		netdev_warn_once(bp->dev,
+				 "TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
+				 (unsigned int)(queue - bp->queues),
+				 cur_tail, cur_head);
+		macb_tx_restart(queue);
+	}
+
+	schedule_delayed_work(&queue->tx_stall_watchdog_work,
+			      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
+}
+
 static void macb_hresp_error_task(struct work_struct *work)
 {
 	struct macb *bp = from_work(bp, work, hresp_err_bh_work);
@@ -3190,6 +3243,9 @@ static int macb_open(struct net_device *dev)
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
 		napi_enable(&queue->napi_rx);
 		napi_enable(&queue->napi_tx);
+		queue->tx_stall_last_tail = queue->tx_tail;
+		schedule_delayed_work(&queue->tx_stall_watchdog_work,
+				      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
 	}
 
 	macb_init_hw(bp);
@@ -3240,6 +3296,7 @@ static int macb_close(struct net_device *dev)
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
 		napi_disable(&queue->napi_rx);
 		napi_disable(&queue->napi_tx);
+		cancel_delayed_work_sync(&queue->tx_stall_watchdog_work);
 		netdev_tx_reset_queue(netdev_get_tx_queue(dev, q));
 	}
 
@@ -4802,6 +4859,8 @@ static int macb_init_dflt(struct platform_device *pdev)
 		}
 
 		INIT_WORK(&queue->tx_error_task, macb_tx_error_task);
+		INIT_DELAYED_WORK(&queue->tx_stall_watchdog_work,
+				  macb_tx_stall_watchdog);
 		q++;
 	}
 
-- 
2.53.0


