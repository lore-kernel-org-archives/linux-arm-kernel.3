Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E191FCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pe+ofGofGVAowmQl0WU458XJTL+4J7BErszfqoz8Irs=; b=2DArly3hPG7RycGLzMytW9vQbY
	9PDHRCPLU+AtO6UiNE1ji5q7nWIAcX5IsEjnmZ6iWQ1SA9p7CIEXe2SZETof7d5MKQBBbs2kEhco2
	r3oblnYBGwSGFxCZVVV5VZgGGqqjnNvGDd3ZUEDzIedMeqtuegYmy0dRvt1hSG3nqbDcrh8/0z7dc
	f0rqRyc3NWyRFiDK8xT9hzl/Vhd0uJmUn8PqhL8rofBZ5rXP3JEVl3gHD4eNL115iTSfW787Ssfkk
	bZGXNEOyE1ODTjftkygSE0bFAR68QIyMAG0FwnBz4+gTSpv30ofc3pqQUegyuS6X3vJK5dvlCw0/k
	aK6wbGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjSD-0000000Gbw3-1lms;
	Mon, 05 Oct 2026 14:14:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjS9-0000000GbuL-31os
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 14:14:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1B3460A52;
	Mon,  5 Oct 2026 14:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C25D1F00899;
	Mon,  5 Oct 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209644;
	bh=pe+ofGofGVAowmQl0WU458XJTL+4J7BErszfqoz8Irs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PnOxGh//8xbxMLhUPHWoSqj6BrU4ttLVsGQ5lJ1hXsE/FdPRiUBgo9qir6RZs7RO1
	 PiZ94rWmpqHnlPpU3gyDRu2TegAkBJ3EEZxAvUS+9RETL7JMdCKH+BjecM+wWYDG87
	 PyoFRu998URkwrBXaX+5nf0XRJXNghksW2CO6Gn92s3k9mk6vICvNRAXoW9GAKoARK
	 qx1TdP+tl3sAH+ZBS3VD5DtzCpIk6wFeNytviVvPwNjW5BZwpzTgJV9FWhkW58t9kI
	 WB6zqXtPti3fOSdlbO5ytgwE41UoSzaRTI7ivRJ+O8txHBxo1hOoY/tuJNTi089I0d
	 vIPOBt1imh8uA==
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: add tc mqprio hw queue
 priority offload
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, olteanv@gmail.com,
 0x1207@gmail.com, daniel@riscstar.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dcaratti@redhat.com
Date: Mon, 05 Oct 2026 14:14:02 +0000
Message-ID: <179120964293.434549.16995730524706441271@kernel.org>
In-Reply-To: <20261001-stmmac-mqprio-prio-offload-v4-3-a74610d7f1e5@oss.qualcomm.com>
References: <20261001-stmmac-mqprio-prio-offload-v4-3-a74610d7f1e5@oss.qualcomm.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 (1) · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch adds two TX queue bounds checks to
  tc_setup_dwmac510_mqprio()…
- [Medium] In TC_MQPRIO_MODE_CHANNEL, mqprio_enable_offload()
  (net/sched/sch_mqprio.c) passes mqprio->flags to the driver, together…
- [Low] Channel-mode state is set in tc_mqprio_config_queue_prio(): MTL
  scheduler set to SP, PSTQ priorities written, xmit_qdisc.algo = SP,…
- [Low] The 'SP conflicts with AVB queues' rule is checked only once, in
  tc_mqprio_validate_chan_mode(), over queues 0..tx_queues_to_use-1.

Pre-existing issues:
- [Medium] stmmac_setup_tc() takes no runtime-PM reference.

--

net: stmmac: add tc mqprio hw queue priority offload

This patch offloads mqprio channel mode to the stmmac MTL TX scheduler. It
switches the scheduler to strict priority and programs the PSTQX/PSTC
per-queue priority bitmaps from prio_tc_map. Channel mode requires DCB hw
support and a 1:1 TC to TX queue mapping, and is rejected when AVB queues
are configured. DCB mode still offloads only the netdev TC map and the FPE
preemption class mapping.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index c889204a7aa5d..b6b5ef7c8fc48 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -230,7 +230,7 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
>  		if (count == 1)
>  			continue;
>  
> -		if (priv->plat->tx_sched_algorithm == MTL_TX_ALGORITHM_SP) {
> +		if (priv->xmit_qdisc.algo == MTL_TX_ALGORITHM_SP) {
>  			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
>  			return -EINVAL;
>  		}

[Severity: Low]
Can this check see a stale SP value left over from an earlier channel-mode
offload?

xmit_qdisc.algo is set back to plat->tx_sched_algorithm only in
stmmac_reset_tc_mqprio(), which only runs when num_tc == 0. The DCB branch
of tc_setup_dwmac510_mqprio() never looks at prio_offload, and it never
restores the DT scheduler or the DT queue priorities.

Suppose a channel-mode root mqprio is replaced with a DCB mqprio that uses a
different handle. __tc_modify_qdisc() then takes the create_n_graft path, so
the new qdisc's mqprio_init() calls ndo_setup_tc before the old instance is
torn down:

tc_setup_dwmac510_mqprio()          /* new DCB config */
  stmmac_fpe_map_preemption_class()
    dwmac5_fpe_map_preemption_class()
      priv->xmit_qdisc.algo == MTL_TX_ALGORITHM_SP   /* left over */

In that window, a DCB request with preemptible TCs and a TC with count > 1
fails with ALG_ERR_MSG and -EINVAL, even when the DT scheduler is not SP.

Should the DCB path undo the channel-mode state before the FPE validation
runs? The old instance's teardown resets the netdev TC config afterwards
anyway, but this setup/teardown asymmetry is new in this patch.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index d0c3feb45789f..e697e1c5bd6e4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c

[ ... ]

> @@ -1275,6 +1300,83 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
>  	return stmmac_fpe_map_preemption_class(priv, ndev, extack, 0);
>  }
>  
> +static void tc_mqprio_config_queue_prio(struct stmmac_priv *priv,
> +					struct tc_mqprio_qopt *qopt)
> +{

[ ... ]

> +		priv->xmit_qdisc.prio[i] = prio;
> +		if (i < priv->plat->tx_queues_to_use)
> +			stmmac_tx_queue_prio(priv, priv->hw, prio, i);
> +	}
> +
> +	stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_SP);
> +	priv->xmit_qdisc.algo = MTL_TX_ALGORITHM_SP;
> +	priv->xmit_qdisc.prio_offload = true;
> +}

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch.
stmmac_setup_tc() takes no runtime PM reference before it dispatches
TC_SETUP_QDISC_MQPRIO.

Once stmmac_release() has called pm_runtime_put() and
stmmac_runtime_suspend() has gated the bus clocks through
stmmac_bus_clks_config(priv, false), could these MTL register writes reach
an unclocked block? The same applies to the writes in the prio_offload
branch of stmmac_reset_tc_mqprio().

Before this patch, the same path already did MMIO through
dwmac5_fpe_map_preemption_class() and dwxgmac3_fpe_map_preemption_class()
on every mqprio setup and reset, so the patch doesn't widen the exposure.

> +
> +static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
> +					struct tc_mqprio_qopt_offload *mqprio)
> +{
> +	struct plat_stmmacenet_data *pdata = priv->plat;
> +	struct tc_mqprio_qopt *qopt = &mqprio->qopt;
> +	int i;
> +
> +	if (!priv->dma_cap.dcben) {
> +		NL_SET_ERR_MSG_MOD(mqprio->extack,
> +				   "hw DCB is required to offload mqprio");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* Forcing strict priority conflicts with the CBS algorithm
> +	 * of AVB queues, so reject the offload when any queue is
> +	 * configured as AVB.
> +	 */
> +	for (i = 0; i < pdata->tx_queues_to_use; i++) {
> +		if (pdata->tx_queues_cfg[i].mode_to_use == MTL_QUEUE_AVB) {
> +			NL_SET_ERR_MSG_MOD(mqprio->extack,
> +					   "SP conflicts with AVB queues");
> +			return -EOPNOTSUPP;
> +		}
> +	}

[Severity: Low]
Is this check enough to keep SP and CBS from running at the same time?

It only covers queues 0..tx_queues_to_use-1, and only at offload time.
While xmit_qdisc.enabled is set, stmmac_reinit_queues() only refuses
tx_cnt < xmit_qdisc.num_tx_queues. That means ethtool -L tx N can raise
the TX queue count while prio_offload is active.

On DT platforms, stmmac_mtl_setup() sets mode_to_use only for the queues
described in DT. The remaining tx_queues_cfg[] entries stay 0, which is
MTL_QUEUE_AVB. A DT AVB queue can also come back after the count was
lowered for a while.

On reopen, stmmac_mtl_configuration() programs SP from xmit_qdisc.algo.
stmmac_configure_cbs() then configures CBS on every queue whose
mode_to_use is not MTL_QUEUE_DCB.

Wouldn't that produce the SP plus AVB/CBS combination this function is
meant to reject? It would also bypass the new prio_offload check in
tc_setup_cbs(). The newly enabled queues sit beyond real_num_tx_queues, so
only XDP/AF_XDP traffic would reach them.

> +
> +	for (i = 0; i < qopt->num_tc; i++) {
> +		/* The offload switches the MTL scheduler to strict
> +		 * priority, which only supports a 1:1 TC to TX queue
> +		 * mapping.
> +		 */
> +		if (qopt->count[i] > 1 || qopt->offset[i] != i) {
> +			NL_SET_ERR_MSG_MOD(mqprio->extack,
> +					   "SP requires 1:1 TXQ map");
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
What happens to shaper and rate requests in channel mode?

mqprio_enable_offload() passes mqprio->flags to the driver, together with
mqprio->shaper (TC_MQPRIO_F_SHAPER) and min_rate[]/max_rate[]
(TC_MQPRIO_F_MIN_RATE / TC_MQPRIO_F_MAX_RATE). This function checks only
dcben, AVB queues and the 1:1 mapping. tc_setup_dwmac510_mqprio() reads
only TC_MQPRIO_F_MODE from mqprio->flags.

So would a "mode channel shaper bw_rlimit max_rate ..." request be
accepted and marked as hardware offloaded, even though only SP and the
PSTQ/PSTC maps get programmed and no rate limit is applied?

Other drivers such as am65-cpsw-qos, mvneta, cxgb4 and aq_main either
implement these fields or reject them. Should this return -EOPNOTSUPP when
TC_MQPRIO_F_SHAPER, TC_MQPRIO_F_MIN_RATE or TC_MQPRIO_F_MAX_RATE is set?

> +
>  static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
>  				    struct tc_mqprio_qopt_offload *mqprio)
>  {
> @@ -1285,23 +1387,22 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,

[ ... ]

>  	if (!qopt->num_tc)
>  		return stmmac_reset_tc_mqprio(ndev, extack);
>  
> -	if (qopt->num_tc > ARRAY_SIZE(tc_to_txq))
> +	if (qopt->num_tc > priv->plat->tx_queues_to_use)
>  		return -EINVAL;
>  

[ ... ]

>  	for (i = 0; i < qopt->num_tc; i++) {
> +		if (qopt->offset[i] + qopt->count[i] >
> +		    priv->plat->tx_queues_to_use) {
> +			NL_SET_ERR_MSG_MOD(extack,
> +					   "Queues exceed hw TX queues");
> +			return -EINVAL;
> +		}
> +

[Severity: Medium]
Both of these bounds checks apply in every mqprio mode, DCB included, and
the commit message doesn't mention them. Are they meant to be a fix on
their own?

Without them, an out-of-range TX queue seems reachable. stmmac sets
caps->validate_queue_counts, so mqprio_validate_queue_counts() only checks
offset + count against dev->real_num_tx_queues. Before the first open,
real_num_tx_queues is still MTL_MAX_TX_QUEUES, as set by
devm_alloc_etherdev_mqs().

Take tx_queues_to_use = 4 with the interface down. "queues 4@0 4@4 hw 1"
passed the old checks and set xmit_qdisc.num_tx_queues to 8. On open,
stmmac_hw_setup() then does:

    netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);

That exposes 8 real TX queues with only 4 descriptor rings. The xmit paths
index priv->dma_conf.tx_queue[skb_get_queue_mapping(skb)] with no bound.

The earlier commit in this series, "net: stmmac: align real_num_tx_queues
to mqprio configuration", makes this reachable. It carries
Fixes: 195e4f409a40, so it could be backported to stable without these
checks.

Should the checks be split into their own patch, or folded into that
commit, with a matching Fixes: tag and a note in the commit message?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5%40oss.qualcomm.com

