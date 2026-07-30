Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35BAC54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQFwobiLuRMvBfD36L24cZKMYVG6y7QlFnNffZWM8GY=; b=HQAb96SdIdazdbQWV1lmrprBKA
	kXpI9BFBBkvPqPSvnpbVYdVrZ8wDn4ThB6C9BtLcN/RoC3MNWLyE0yuIoVBrviVp+xkzFoGXDyCPs
	KKfKHckV293bGGow7o5rC6JTQXeo7S3nBszBEeXougbWs9nEMjAX5ttz53vveZHSE1zao50Jcoqab
	/AyHvXWShpOymzAgo1WuUZenWUT0WLs+U16jx3RIg0ztNp77X3WHrVWgAo6USEjzfkXX4o7w/IYW8
	FZHEU4XbQ4b6C6KtqYRXyD7yWImdprt7i+Takhavk6VgJM54FXSFzVvi2J6lL2VRvDgLKQfW1jv08
	A4XLs+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNkY-0000000A9Qt-1NkO;
	Thu, 30 Jul 2026 10:12:26 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNkF-0000000A9HE-25ws;
	Thu, 30 Jul 2026 10:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785406325; bh=YQFwobiLuRMvBfD36L24cZKMYVG6y7QlFnNffZWM8GY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=faa1ZszsR0lt16DZ84aFd1bGkALQe6xDoCutdKhnoTwEW83Fme6GemQDCeRkVoOdv
	 Spc0P4BR2+9tdYYwMtCjivzdFe6IDqN7FIK5+F1LvVAjEnTp6Ekyry0rtQPwoYo1sG
	 OgYJekRzH34BfB/0DyaNchsMFZJVCER+hE2kIeos=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2F88CE83; Thu, 30 Jul 2026 18:11:56 +0800
X-QQ-mid: xmsmtpt1785406322tvlj41r35
Message-ID: <tencent_73A6685E6540120E468C02F21189FCE69A09@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Jue+F2vLrGacWuRPAiusOrXz37hNLrpOWJ+hM1STmGXfYCO353Uf
	 83u4477GRCYaER8kTK0gxMKAf8ZNE4fMCPQP9Z2kDG2z5i5+VzVBlzeZjtj1Q9ExmUzVSRMS4/ri
	 knW6BXsL9fInKX0Ld69Oxry2Rj16szuxD9dSObDS2izDO4RC98AU1vvDxhq1J22W8lfwBdblp2S6
	 e08hzpAqFW3YuLMdOM1YQoZ4UbYe5U7tl6+HoiW7TNviBE1nsrGclNOC+MAgdKq4+jARR2pTBno9
	 lm/BrPpmyayNIW7fpf/zrkLCMd2lGx7SZ7iFuQ4n8/sqQy31lHq03yQp6ncG/ygoIxtKepe9uYZE
	 Ghq1h+YAFhweHA/h2nGhMo2jKnElXkziH0D+wC3mqSP6/qoeHEEfLuVC3DijRVLs3MAKtuaFWyBN
	 BsrgH60rb5typeoACqzTXVpzGZW8pfZbvA221TOcujXeX0edwKfdusk6sZrwTuIEYjCcvtNxWDGh
	 uPPuaTQzLF6baYvPttREUdVBo0vVtYIOPNYBcTFjp2u64ZsYVMvswMUtsNRwSmX7dxzj+NyJ0abW
	 ZAXnTwiSTp5Fhg4AeqABKEQQYpSnMaf8mrdzHrZDy1JH96JnQo+sqIhZV/pt2RxdLRxoszFdvJsY
	 fn3RYGEdBrRsO7SvBspHY/bcZVzOepj3psuVXL9P3difvMUx7iwAcF2PUbuZP5erypfMmxD12kDr
	 zpbQ/8H9caEryjVUeeBV54epjlvtyK+dzoA2Bmj1tYz9eBx1g/C+k7E7cJGmZux6DabAhuExoCdQ
	 m8Z4MxKjxNfv8tLOXz0GeMXqx/u5eMItpMgGo+Y3Y31YPr+bWMAI2oT6YmbTiZlTXjOiUGzsC7QC
	 NWrd355sTLWZM5sTA3fG0MKUsFpsct6nW7gnUTbJyLX2XLwj+p7gZbG6AcPeg53ax3Vy3G2j2Yr9
	 Lg9kFoylzUP+EnZLWsSZK1WHXK4xJNyzFIr2i+zEjomcCdDZ8PX2luQrwYuo8MUEGnE98tcvKy6O
	 gdGFGjjkX1IIDRXz/tM8Tw2xgPOJ9jgOZBOVtMm+yFrb2tKvn4WrxS1V7y+xWUj64PirllbH3Ku5
	 BBWQoOi9HLEfVKDZqZACyLHHm6UszmAbOp08zBKodmLWPiSVpSXF/beJ+NpsWransgZTwH
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 18:11:48 +0800
Subject: [PATCH v2 3/3] can: rockchip_canfd: serialize TX state and command
 writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v2-3-572974052400@qq.com>
References: <20260730-master-v2-0-572974052400@qq.com>
In-Reply-To: <20260730-master-v2-0-572974052400@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_031207_895059_8D25F47B 
X-CRM114-Status: GOOD (  23.58  )
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

The TX completion path removes an echo skb before advancing tx_tail. In
parallel, the transmit path reads tx_head, tx_tail and the tail echo slot
when applying the erratum 6 queue restriction. There is no synchronization
between these operations.

On SMP, the transmit path can consequently observe a pending frame with
an empty echo slot:

  rockchip_canfd fea60000.can can0: rkcanfd_tx_tail_is_eff:
  echo_skb[0]=NULL tx_head=0x00060f7d tx_tail=0x00060f7c

It can also keep a pointer to an echo skb while the completion path removes
and queues it for NAPI, where it can be freed on another CPU. The
inconsistent snapshot can stop the netdev TX queue when there is no later
completion to wake it.

There is a second race in the command submission sequence.
rkcanfd_start_xmit() runs in softirq context while rkcanfd_xmit_retry() is
called from the RX interrupt handler. On controllers affected by erratum
12, both execute a MODE/CMD/MODE register sequence. The interrupt handler
can restore the default MODE between the softirq writes, causing the
resumed softirq to issue CMD without SPACE_RX_MODE and bypass the erratum
12 workaround.

Add a TX state lock and use it to protect tx_head, tx_tail and the echo skb
ring as one state. The same lock serializes the MODE/CMD/MODE sequence
between the transmit and interrupt paths. Keep the queue completion and
wake operation outside the lock to avoid nesting the TX state lock with
the netdev TX queue lock.

Tested on an RK3588 rev2.2 at 1 Mbit/s with 100,000 extended CAN frames.
The run triggered 138 erratum 6 retries and completed without drops, queue
stalls or driver warnings. RK3588 does not enable erratum 12, so this test
does not exercise that hardware workaround.

Fixes: ae002cc32ec4 ("can: rockchip_canfd: prepare to use full TX-FIFO depth")
Fixes: 83f9bd6bf39d ("can: rockchip_canfd: implement workaround for erratum 12")
Cc: stable@vger.kernel.org
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c |  1 +
 drivers/net/can/rockchip/rockchip_canfd-rx.c   | 31 +++++++++++++++++++-------
 drivers/net/can/rockchip/rockchip_canfd-tx.c   | 26 ++++++++++++++++++---
 drivers/net/can/rockchip/rockchip_canfd.h      |  4 +++-
 4 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 29de0c01e4ed..c8257858b452 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -904,6 +904,7 @@ static int rkcanfd_probe(struct platform_device *pdev)
 	priv->can.do_set_mode = rkcanfd_set_mode;
 	priv->can.do_get_berr_counter = rkcanfd_get_berr_counter;
 	priv->ndev = ndev;
+	spin_lock_init(&priv->tx_lock);
 
 	match = device_get_match_data(&pdev->dev);
 	if (match) {
diff --git a/drivers/net/can/rockchip/rockchip_canfd-rx.c b/drivers/net/can/rockchip/rockchip_canfd-rx.c
index 475c0409e215..9f57a35672ed 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-rx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-rx.c
@@ -99,15 +99,26 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *priv,
 	struct rkcanfd_stats *rkcanfd_stats = &priv->stats;
 	const struct canfd_frame *cfd_nominal;
 	const struct sk_buff *skb;
+	unsigned long flags;
 	unsigned int tx_tail;
 
+	spin_lock_irqsave(&priv->tx_lock, flags);
+
+	if (!rkcanfd_get_tx_pending(priv))
+		goto out_unlock;
+
 	tx_tail = rkcanfd_get_tx_tail(priv);
 	skb = priv->can.echo_skb[tx_tail];
 	if (!skb) {
+		const unsigned int tx_head = priv->tx_head;
+		const unsigned int tx_tail_full = priv->tx_tail;
+
+		spin_unlock_irqrestore(&priv->tx_lock, flags);
+
 		netdev_err(priv->ndev,
 			   "%s: echo_skb[%u]=NULL tx_head=0x%08x tx_tail=0x%08x\n",
 			   __func__, tx_tail,
-			   priv->tx_head, priv->tx_tail);
+			   tx_head, tx_tail_full);
 
 		return -ENOMSG;
 	}
@@ -123,17 +134,18 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *priv,
 		rkcanfd_handle_tx_done_one(priv, ts, &frame_len);
 
 		WRITE_ONCE(priv->tx_tail, priv->tx_tail + 1);
+		*tx_done = true;
+
+		spin_unlock_irqrestore(&priv->tx_lock, flags);
 		netif_subqueue_completed_wake(priv->ndev, 0, 1, frame_len,
 					      rkcanfd_get_effective_tx_free(priv),
 					      RKCANFD_TX_START_THRESHOLD);
 
-		*tx_done = true;
-
 		return 0;
 	}
 
 	if (!(priv->devtype_data.quirks & RKCANFD_QUIRK_RK3568_ERRATUM_6))
-		return 0;
+		goto out_unlock;
 
 	/* Erratum 6: Extended frames may be send as standard frames.
 	 *
@@ -143,7 +155,7 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *priv,
 	 */
 	if (!(cfd_nominal->can_id & CAN_EFF_FLAG) ||
 	    (cfd_rx->can_id & CAN_EFF_FLAG))
-		return 0;
+		goto out_unlock;
 
 	/* Not affected if:
 	 * - standard part and RTR flag of the TX'ed frame
@@ -151,20 +163,20 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *priv,
 	 */
 	if ((cfd_nominal->can_id & (CAN_RTR_FLAG | CAN_SFF_MASK)) !=
 	    (cfd_rx->can_id & (CAN_RTR_FLAG | CAN_SFF_MASK)))
-		return 0;
+		goto out_unlock;
 
 	/* Not affected if:
 	 * - length is not the same
 	 */
 	if (cfd_nominal->len != cfd_rx->len)
-		return 0;
+		goto out_unlock;
 
 	/* Not affected if:
 	 * - the data of non RTR frames is different
 	 */
 	if (!(cfd_nominal->can_id & CAN_RTR_FLAG) &&
 	    memcmp(cfd_nominal->data, cfd_rx->data, cfd_nominal->len))
-		return 0;
+		goto out_unlock;
 
 	/* Affected by Erratum 6 */
 	u64_stats_update_begin(&rkcanfd_stats->syncp);
@@ -185,6 +197,9 @@ static int rkcanfd_rxstx_filter(struct rkcanfd_priv *priv,
 
 	rkcanfd_xmit_retry(priv);
 
+out_unlock:
+	spin_unlock_irqrestore(&priv->tx_lock, flags);
+
 	return 0;
 }
 
diff --git a/drivers/net/can/rockchip/rockchip_canfd-tx.c b/drivers/net/can/rockchip/rockchip_canfd-tx.c
index c4ecdc9411cc..c3811d3179b6 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-tx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-tx.c
@@ -14,6 +14,8 @@ static bool rkcanfd_tx_tail_is_eff(const struct rkcanfd_priv *priv)
 	const struct sk_buff *skb;
 	unsigned int tx_tail;
 
+	lockdep_assert_held(&priv->tx_lock);
+
 	if (!rkcanfd_get_tx_pending(priv))
 		return false;
 
@@ -33,13 +35,22 @@ static bool rkcanfd_tx_tail_is_eff(const struct rkcanfd_priv *priv)
 	return cfd->can_id & CAN_EFF_FLAG;
 }
 
-unsigned int rkcanfd_get_effective_tx_free(const struct rkcanfd_priv *priv)
+unsigned int rkcanfd_get_effective_tx_free(struct rkcanfd_priv *priv)
 {
+	unsigned long flags;
+	unsigned int tx_free;
+
+	spin_lock_irqsave(&priv->tx_lock, flags);
+
 	if (priv->devtype_data.quirks & RKCANFD_QUIRK_RK3568_ERRATUM_6 &&
 	    rkcanfd_tx_tail_is_eff(priv))
-		return 0;
+		tx_free = 0;
+	else
+		tx_free = rkcanfd_get_tx_free(priv);
+
+	spin_unlock_irqrestore(&priv->tx_lock, flags);
 
-	return rkcanfd_get_tx_free(priv);
+	return tx_free;
 }
 
 static void rkcanfd_start_xmit_write_cmd(const struct rkcanfd_priv *priv,
@@ -60,6 +71,8 @@ void rkcanfd_xmit_retry(struct rkcanfd_priv *priv)
 	const unsigned int tx_tail = rkcanfd_get_tx_tail(priv);
 	const u32 reg_cmd = RKCANFD_REG_CMD_TX_REQ(tx_tail);
 
+	lockdep_assert_held(&priv->tx_lock);
+
 	rkcanfd_start_xmit_write_cmd(priv, reg_cmd);
 }
 
@@ -69,6 +82,7 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	u32 reg_frameinfo, reg_id, reg_cmd;
 	unsigned int tx_head, frame_len;
 	const struct canfd_frame *cfd;
+	unsigned long flags;
 	int err;
 	u8 i;
 
@@ -124,8 +138,11 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 			      *(u32 *)(cfd->data + i));
 
 	frame_len = can_skb_get_frame_len(skb);
+	spin_lock_irqsave(&priv->tx_lock, flags);
 	err = can_put_echo_skb(skb, ndev, tx_head, frame_len);
 	if (err) {
+		spin_unlock_irqrestore(&priv->tx_lock, flags);
+
 		if (err == -EINVAL)
 			dev_kfree_skb_any(skb);
 
@@ -141,6 +158,7 @@ netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	WRITE_ONCE(priv->tx_head, priv->tx_head + 1);
 
 	rkcanfd_start_xmit_write_cmd(priv, reg_cmd);
+	spin_unlock_irqrestore(&priv->tx_lock, flags);
 
 	netif_subqueue_maybe_stop(priv->ndev, 0,
 				  rkcanfd_get_effective_tx_free(priv),
@@ -157,6 +175,8 @@ void rkcanfd_handle_tx_done_one(struct rkcanfd_priv *priv, const u32 ts,
 	unsigned int tx_tail;
 	struct sk_buff *skb;
 
+	lockdep_assert_held(&priv->tx_lock);
+
 	tx_tail = rkcanfd_get_tx_tail(priv);
 	skb = priv->can.echo_skb[tx_tail];
 
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 93131c7d7f54..3cf283a7b380 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -15,6 +15,7 @@
 #include <linux/netdevice.h>
 #include <linux/reset.h>
 #include <linux/skbuff.h>
+#include <linux/spinlock.h>
 #include <linux/timecounter.h>
 #include <linux/types.h>
 #include <linux/u64_stats_sync.h>
@@ -462,6 +463,7 @@ struct rkcanfd_priv {
 	struct can_rx_offload offload;
 	struct net_device *ndev;
 
+	spinlock_t tx_lock; /* protects tx_head, tx_tail and echo_skb */
 	void __iomem *regs;
 	unsigned int tx_head;
 	unsigned int tx_tail;
@@ -544,7 +546,7 @@ void rkcanfd_timestamp_start(struct rkcanfd_priv *priv);
 void rkcanfd_timestamp_stop(struct rkcanfd_priv *priv);
 void rkcanfd_timestamp_stop_sync(struct rkcanfd_priv *priv);
 
-unsigned int rkcanfd_get_effective_tx_free(const struct rkcanfd_priv *priv);
+unsigned int rkcanfd_get_effective_tx_free(struct rkcanfd_priv *priv);
 void rkcanfd_xmit_retry(struct rkcanfd_priv *priv);
 netdev_tx_t rkcanfd_start_xmit(struct sk_buff *skb, struct net_device *ndev);
 void rkcanfd_handle_tx_done_one(struct rkcanfd_priv *priv, const u32 ts,

-- 
2.34.1


