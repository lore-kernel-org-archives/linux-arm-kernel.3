Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870EBCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv8aCOtDxJxEXVixI/3l1McdtDLsb1UTPzit6MpIk3Q=; b=ZvWHYxh00GzkE1sR22XsT0JnB5
	ClsffaFvvvZ8Y9UJvz+NLGAe1NX55Th+sr4y45MYT/IeRJEBm0f5+vfkDklAWhzQOXVLcvWBmT/hK
	do6cjzDjfxBpeFsvj+Gm5fZkBDzhDUpser2nckioTXxYTIqiHtp2sHPJNAM/W2x8sSAMg+0Ft0lH1
	csRg4EXYIvHg6rPUwET745j4nOVHjAC3JnixPd0hq+GFZJlNSilR/fTcxSaDXqyAQjZQXC3laKSBn
	0mT2FspniStpX3mh6vRcsww/4pRUOQA7mMHGx7bzanO6g5/2HZxSgeTTQsy6GjuX8z5xmNuc/Bbsa
	80Vdf8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1M-00000006eMw-2WCT;
	Thu, 14 May 2026 21:55:08 +0000
Received: from acj35aaf122.lhr1.oracleemaildelivery.com ([130.35.116.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1H-00000006eIb-0zqs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=tv8aCOtDxJxEXVixI/3l1McdtDLsb1UTPzit6MpIk3Q=;
 b=ezAsRfcGHqzJ2s7GP/By63Mbhp4uBPf9dXe5/Z3snNfzp0PdkFVHuqB+bsXCysplRnfwVSO7ktaF
   RHznEKADtBsXy0N7PC/ntinfEAL4LQ6as1iA/nWyCnTuuCdkHlJuJ+/Uj5qFBrYqOON8ugGkQKLJ
   Fv5qWEQbxljpS6JHlkJvO932X4O0LQFnR9lusX95ajHa0Yms7NAwAdTDqWZE4H9EsVH9xi8ZWN4F
   31n5AqOyQITP9L95yWy4yXs962EpSi0onFhykEslkZK45byYQTbM9F3v2sQ3BzmmhA5vCSKZpx0G
   /ZpgCUvxm7glOVB6ZcsDx58OSHYviWWn73nIKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=tv8aCOtDxJxEXVixI/3l1McdtDLsb1UTPzit6MpIk3Q=;
 b=Ue0Q7vMiG7DeFOoNWigF5OOPWgji60KhHabfE6EQZS5LnKoDlaH374xWTbfUrGz6+Ceqg/CfGzqs
   cYpHPcSHOlAPtAaVfkfEu8M0uBAStot1cJ1uUPzg9xgCL9s4TqUH8e7jtqN9uoYAdU/tw89Nw7oN
   IUKZnnuA0SRLdNNzZyOcJXNHfWBLIhP0yM/GFlVf9lU7pzUXGbf81y+BJXNUvwsBhKQYIYljqiRB
   cRP8meIppX2iPN7jqSa9Ql/njVAwX3FgpYEc1AKXaQDSfx+HRn+MOBtt6+VGrEqR4y3qNEL7sz0q
   s3O/t9qMEyeWWTUCn6Jox91TrZMyEGQZvdIE2w==
Received: by omta-ad2-fd1-1402-uk-london-1.omtaad2.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TF10C8OKRJO1Y70@omta-ad2-fd1-1402-uk-london-1.omtaad2.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Thu, 14 May 2026 21:55:00 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH net-next v2 3/3] net: macb: add TX stall watchdog to recover
 from lost TCOMP interrupts
Date: Thu, 14 May 2026 22:54:59 +0100
Message-id: <20260514215459.36109-4-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <20260514215459.36109-1-lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215459.36109-1-lukasz@raczylo.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAHf+Z0YX8zBMsksb6gSGL9ZV3VCbo9am2PhbSO1iipMaVnbSZPP4U7YWpbXzRHK
 g669lhZ1JQctwueluqmGYAuNG1sS6Qw9c22rwM4n4X9J18nSI5/Oh7lCnWC0A3PD
 LGn6kIXp/8uw7DK7TJBoiI8SChWXtcpsIplE/oUEFsLQxv3t3VW4VGEZfqWYvKZg
 Ph5UXgljEYH/Kgpuh/awDDNjQ7zdOlqsBlHXq5JlLbqlDYS/BldzdkJZfYTyWU9E
 iMyjeifK80eK5vSFKMbvPji7fwk8HGt8kLGwm+ZKi/6s1is6c2q+AET8dqx82atR
 FqArfHYH9EeQ7kMhBmKzo86EvOSsCRG4jCEJ+5bhOAtnp/tZn+bmvgxAFEXJFCH2
 HztSqkz+lPCqctCsuIwLVvXxGhCJYMk1jpfB63bpGuBni+ukbhofW0LciDsyQy1p PMPSXDYAgpA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_145503_282888_51283D95 
X-CRM114-Status: GOOD (  22.02  )
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

On PCIe-attached macb instances (BCM2712 + RP1 PCIe south bridge
on Raspberry Pi 5 is the case I have in front of me), a TCOMP
interrupt can be lost: the TSTART doorbell can be lost in the
posted-write fabric (addressed by an earlier patch), or the
descriptor TX_USED DMA write can be observed late by the driver
(also addressed earlier).  When that happens the TX ring stalls
silently until something else kicks TSTART.

Add a per-queue delayed_work that runs once per second.  It
detects forward progress on the TX completion path via a per-queue
bool tx_stall_tail_moved that macb_tx_complete() sets when tx_tail
advances and the watchdog clears on each tick.  If the ring is
non-empty (queue->tx_head != queue->tx_tail) and the flag is
unset when the tick runs, the watchdog calls the existing
macb_tx_restart() to re-assert TSTART.

The bool form (rather than a tx_tail snapshot) sidesteps any
concern about ring-index aliasing between ticks and is the form
suggested by Phil Elwell when reviewing the same series anchored
against rpi-6.18.y at raspberrypi/linux#7340 (merged 2026-05-08).

No new recovery logic is introduced.  macb_tx_restart() already
exists in this file, is correctly locked (tx_ptr_lock, bp->lock),
and verifies that the hardware's TBQP is behind the driver's head
index before re-asserting TSTART.  On a healthy ring it is a
no-op at the hardware level.

Cost on a healthy queue: one spin_lock_irqsave / spin_unlock and
two field assignments per tick.  The delayed_work is only
scheduled between macb_open() and macb_close() and is cancelled
synchronously on close.

A netif_carrier_ok() gate at the top of the tick skips the stall
check when there is no carrier (no completion is possible without
a link), eliminating a boot-time false positive where queue->tx_head
can advance from kernel-queued packets between macb_open() and link
autoneg completion, while tx_tail stays unchanged because no TCOMPs
have arrived yet.

netdev_warn_ratelimited() is used rather than netdev_warn_once() so
operators can count occurrences across the lifetime of the netdev.

Link: https://github.com/cilium/cilium/issues/43198
Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
Link: https://github.com/raspberrypi/linux/pull/7340
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
---
 drivers/net/ethernet/cadence/macb.h      | 10 ++++
 drivers/net/ethernet/cadence/macb_main.c | 72 ++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index ce9037f9e..75df0f75b 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1282,6 +1282,16 @@ struct macb_queue {
 	dma_addr_t		tx_ring_dma;
 	struct work_struct	tx_error_task;
 	bool			txubr_pending;
+
+	/* TX stall watchdog -- see macb_tx_stall_watchdog() in macb_main.c.
+	 * tx_stall_tail_moved is set by macb_tx_complete() when tx_tail
+	 * advances and cleared by the watchdog tick on each pass (both
+	 * under tx_ptr_lock).  Using a bool sidesteps any ring-index
+	 * aliasing concern between ticks.
+	 */
+	struct delayed_work	tx_stall_watchdog_work;
+	bool			tx_stall_tail_moved;
+
 	struct napi_struct	napi_tx;
 
 	dma_addr_t		rx_ring_dma;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index f7fa9e7ad..8245c69e1 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1473,6 +1473,8 @@ static int macb_tx_complete(struct macb_queue *queue, int budget)
 				  packets, bytes);
 
 	queue->tx_tail = tail;
+	if (packets)
+		queue->tx_stall_tail_moved = true;
 	if (__netif_subqueue_stopped(bp->dev, queue_index) &&
 	    CIRC_CNT(queue->tx_head, queue->tx_tail,
 		     bp->tx_ring_size) <= MACB_TX_WAKEUP_THRESH(bp))
@@ -2003,6 +2005,70 @@ static int macb_tx_poll(struct napi_struct *napi, int budget)
 	return work_done;
 }
 
+#define MACB_TX_STALL_INTERVAL_MS	1000
+
+/*
+ * TX stall watchdog.
+ *
+ * Recovers from lost TCOMP interrupts on PCIe-attached macb
+ * instances.  macb already has a recovery chain
+ * (txubr_pending -> macb_tx_restart()) that fires on TCOMP; if
+ * TCOMP itself is lost the TX ring stalls silently until something
+ * else kicks TSTART.  This watchdog runs once per second per queue
+ * and calls macb_tx_restart() if the ring is non-empty and
+ * tx_tail has not advanced since the previous tick.
+ *
+ * Movement is tracked via the tx_stall_tail_moved boolean rather
+ * than a tx_tail snapshot, sidestepping any ring-index aliasing
+ * concern.  The bool is set by macb_tx_complete() when tx_tail
+ * advances and cleared here on each tick; both writes are under
+ * tx_ptr_lock so no atomic is required.
+ *
+ * macb_tx_restart() already checks the hardware's TBQP against
+ * the driver's head index before re-asserting TSTART, so on a
+ * healthy ring this is a no-op at the hardware level.  The
+ * watchdog only supplies the missing trigger.
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
+	/* No carrier => no completion is possible.  Skip the check
+	 * but keep the watchdog ticking for when carrier comes up.
+	 */
+	if (!netif_carrier_ok(bp->dev))
+		goto reschedule;
+
+	spin_lock_irqsave(&queue->tx_ptr_lock, flags);
+	cur_tail = queue->tx_tail;
+	cur_head = queue->tx_head;
+	if (cur_head != cur_tail && !queue->tx_stall_tail_moved)
+		stalled = true;
+	queue->tx_stall_tail_moved = false;
+	spin_unlock_irqrestore(&queue->tx_ptr_lock, flags);
+
+	if (stalled) {
+		netdev_warn_ratelimited(bp->dev,
+					"TX stall detected on queue %u (tail=%u head=%u); re-kicking TSTART\n",
+					(unsigned int)(queue - bp->queues),
+					cur_tail, cur_head);
+		macb_tx_restart(queue);
+	}
+
+reschedule:
+	schedule_delayed_work(&queue->tx_stall_watchdog_work,
+			      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
+}
+
 static void macb_hresp_error_task(struct work_struct *work)
 {
 	struct macb *bp = from_work(bp, work, hresp_err_bh_work);
@@ -3192,6 +3258,9 @@ static int macb_open(struct net_device *dev)
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
 		napi_enable(&queue->napi_rx);
 		napi_enable(&queue->napi_tx);
+		queue->tx_stall_tail_moved = true;
+		schedule_delayed_work(&queue->tx_stall_watchdog_work,
+				      msecs_to_jiffies(MACB_TX_STALL_INTERVAL_MS));
 	}
 
 	macb_init_hw(bp);
@@ -3242,6 +3311,7 @@ static int macb_close(struct net_device *dev)
 	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
 		napi_disable(&queue->napi_rx);
 		napi_disable(&queue->napi_tx);
+		cancel_delayed_work_sync(&queue->tx_stall_watchdog_work);
 		netdev_tx_reset_queue(netdev_get_tx_queue(dev, q));
 	}
 
@@ -4804,6 +4874,8 @@ static int macb_init_dflt(struct platform_device *pdev)
 		}
 
 		INIT_WORK(&queue->tx_error_task, macb_tx_error_task);
+		INIT_DELAYED_WORK(&queue->tx_stall_watchdog_work,
+				  macb_tx_stall_watchdog);
 		q++;
 	}
 
-- 
2.54.0


