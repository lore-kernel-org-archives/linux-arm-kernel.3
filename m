Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37099CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt9dZpxojjv110F9/qNO1HGLQMuJ1Uj2pdh6BWMJfkw=; b=LwvI8GIecymRBS3hn+MDIfnPlk
	76ElJLYqSRxUoqaeLGHtypK+OJqa9XzUXKBdJf9e7pWooLJ5pODhP6mjrLjyY0bZFKnuUDGrnA8gg
	C1RT7295aYecUEhrnddZoAtjHLIgjleHHgT3UQthQybScrx1/a+QYUJ+Ic8FsKoYHCLEXgpdFw6lN
	Wj9s+/uIdjBI/ibYwLaGXsh6QiHdCtH/uG1VYt+KbTEAReFTbpP3bZDu7WlyfEVsTmkO40uKdi0kV
	l9LGQWcEje8YeTdW7qk24C3s2djqFtP55eYZwEac3khrnlQE5y3NBbBZ5ndaIlf9sSki3pUqHOl9g
	kq9DkWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjSD-0000000GbvO-0zod;
	Mon, 05 Oct 2026 14:14:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjS7-0000000Gbtr-1skC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 14:14:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D782143D0C;
	Mon,  5 Oct 2026 14:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE43A1F00893;
	Mon,  5 Oct 2026 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209642;
	bh=Lt9dZpxojjv110F9/qNO1HGLQMuJ1Uj2pdh6BWMJfkw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HkR71q0P/SSFsEv5krywK5rIUGBSxT2fQHit7S87uAu4621VAgesNSXIYoAkO5tZC
	 M2JKPROh1Ff94jR7v8wkz4PoddChwfH3AG3U3L/TcvbxUwj15k2TRyoO67OnK/kEkk
	 B6AtOwN+/xidFotBVcB/HZ59dKcYTJELXXkhSoMyc+W4eeVlRhvw/ne2SBehHCWgTB
	 sGWGTzbXwDO23jdPxYZ6pojgwRRGqrbGTpFxIEpkOlD16PhpIsG7eKOtJl1Fxww5Jq
	 SiVXJotidURqzckkGZY3Me2nX4icxx5Dj5Kb23Xn9ioOGFfm3pIVncKyUwKiM/X7jM
	 5XqmsaYo1wtpg==
Subject: Re: [PATCH net-next v4 2/3] net: stmmac: align real_num_tx_queues to
 mqprio configuration
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, olteanv@gmail.com,
 0x1207@gmail.com, daniel@riscstar.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dcaratti@redhat.com
Date: Mon, 05 Oct 2026 14:14:01 +0000
Message-ID: <179120964143.434549.16998694385185909374@kernel.org>
In-Reply-To: <20261001-stmmac-mqprio-prio-offload-v4-2-a74610d7f1e5@oss.qualcomm.com>
References: <20261001-stmmac-mqprio-prio-offload-v4-2-a74610d7f1e5@oss.qualcomm.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] At this commit, stmmac_hw_setup() (stmmac_main.c:3781) calls
  netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues) and…

Pre-existing issues:
- [Medium] After this patch, a device open (ifdown/ifup,
  stmmac_reinit_queues()/ethtool -L, resume) restores the software half…

--

net: stmmac: align real_num_tx_queues to mqprio configuration

This commit records the TX queue count of the current mqprio offload in
priv->xmit_qdisc.num_tx_queues. stmmac_hw_setup() then uses that value
for real_num_tx_queues on every open, so it stays consistent with the
netdev TC map. It also stops stmmac_reinit_queues() from lowering the TX
queue count below what an active mqprio offload needs.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d95482b7f6e5d..1dc9218bd4e9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3778,7 +3778,7 @@ static int stmmac_hw_setup(struct net_device *dev)
>  
>  	/* Configure real RX and TX queues */
>  	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
> -	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
> +	netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);

[Severity: High]
Can this expose TX queues that have no rings allocated?

tc_setup_dwmac510_mqprio() sets num_tx_queues to max(offset + count)
from the user's qopt. The only range check is in
mqprio_validate_queue_counts(), and it compares against
dev->real_num_tx_queues, not plat->tx_queues_to_use:

net/sched/sch_mqprio_lib.c:mqprio_validate_queue_counts() {
    ...
	if (qopt->offset[i] >= dev->real_num_tx_queues ||
	    last > dev->real_num_tx_queues) {
    ...
}

While the interface is down, real_num_tx_queues can be larger than
tx_queues_to_use:

  - __stmmac_dvr_probe() allocates the netdev with MTL_MAX_TX_QUEUES and
    doesn't lower real_num_tx_queues before the first open.

  - stmmac_reinit_queues() on a down interface changes tx_queues_to_use
    but leaves real_num_tx_queues as it was.

stmmac_setup_tc() has no netif_running() check. Take tx_queues_to_use = 4
on a down interface and this sequence:

  tc qdisc add ... mqprio num_tc 2 ... queues 4@0 4@4 hw 1
  ip link set ... up

That stores xmit_qdisc.num_tx_queues = 8. On open,
alloc_dma_tx_desc_resources() only allocates rings for
queue < tx_queues_to_use, but stmmac_hw_setup() now publishes 8 real TX
queues.

Traffic mapped to TC1 then goes to queues 4-7, and stmmac_xmit() does:

	tx_q = &priv->dma_conf.tx_queue[queue];
	...
	WARN_ON(tx_q->tx_skbuff[first_entry]);

For those queues, tx_skbuff and the descriptor ring are NULL. Would this
cause a NULL pointer dereference in the TX path?

Before this patch, open always reset real_num_tx_queues to
tx_queues_to_use and netif_setup_tc() dropped the invalid TC map, so
this path couldn't be reached.

Later in the series, "net: stmmac: add tc mqprio hw queue priority
offload" adds a check that offset + count does not exceed
plat->tx_queues_to_use in tc_setup_dwmac510_mqprio(), which closes this.
However, this patch carries a Fixes: tag and the later patch doesn't.
Would a stable backport of this patch alone bring back the oops?

Should the tx_queues_to_use bound be part of this patch instead?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 1aa80d51ab33a..d0c3feb45789f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c

[ ... ]

> @@ -1321,6 +1324,9 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
>  	if (err)
>  		goto error_reset_num_tx_queues;
>  
> +	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
> +	priv->xmit_qdisc.enabled = true;

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch. This
patch now restores the software side of the mqprio offload on every
open. Does anything restore the hardware side as well?

On open, stmmac_init_dma_engine() issues a DMA software reset. That
resets the MTL registers, including the FPE_MTL_PREEMPTION_CLASS field.

After that, stmmac_dma_operation_mode()->dwxgmac2_dma_tx_mode() rewrites
Q2TCMAP to the identity map:

	value |= FIELD_PREP(XGMAC_Q2TCMAP, channel);

The only function that programs the preemption class and the mqprio
Q2TCMAP is stmmac_fpe_map_preemption_class(). It is called only from the
taprio and mqprio setup and reset paths in stmmac_tc.c, never from open.

Consider ifdown/ifup, ethtool -L or resume. Afterwards real_num_tx_queues
and the netdev TC map still reflect the mqprio offload, and
xmit_qdisc.enabled stays true. The hardware, though, has no preemptible
queues and, on XGMAC, a 1:1 queue-to-TC map that doesn't match the qopt
offsets and counts.

mqprio->preemptible_tcs is not saved here, so the open path can't replay
it. The final patch in the series restores prio and algo from
xmit_qdisc in stmmac_mtl_configuration(). It still doesn't restore the
preemption class or Q2TCMAP.

Would it make sense to save preemptible_tcs in xmit_qdisc and reprogram
it from the open path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5%40oss.qualcomm.com

