Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA5CC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7Ihv0T2P6we3GUqiLwAvOmLN/x3dS2f6PeWzEGpsQg=; b=eob3VFXwdtcbjjW9ejbIR2fqyF
	AFs8/SOguLfHmdh9FQD90Cy9RK3v8kc8JcLgeJienyV1pFgQLqOZxubi9VXboqHzqMJB40pMisKPp
	mWI9zqFGHoq3VtKn/WqqpT8pTZkO+pFvtYZT+UCeK357ChjQM3qkI2oFgGLvKaZneKv/BTkbEXMGJ
	H4oSi1vAfuhZryQKkntl4KUIJzarynAczx3rB5yYQD1cuR8BKqQjY27xGngabqEkJCPBq290IHum9
	FaEVtSotYvRY1tfSTReSbvh8sNRpcr6aX8lMv82hqmvWC+JYgAwGLB+x/gdehHyyOwZkmuzMEsj8W
	Xoemdpdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k6w-0000000EgIk-1fnG;
	Wed, 02 Sep 2026 12:30:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1k6u-0000000EgI0-2Sbe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:30:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7D0C40A02;
	Wed,  2 Sep 2026 12:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148241F000E9;
	Wed,  2 Sep 2026 12:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352235;
	bh=C7Ihv0T2P6we3GUqiLwAvOmLN/x3dS2f6PeWzEGpsQg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IG7rPrNqeQCtteC5stxjBDstLFt8SR0Buv4YQ7JEnp2CycArCdDXXM8YwKOf12NqO
	 +Sasa5Q+8whMAVSui6XzZqA9Z4dE1tddTeL8WpiAwEljnJuXb74mXtDmPUVBKYc/cO
	 lrHc/WHufwfr0iDXpTW/t0ZlQkx5BdoJCHtvpXJprqY4G6x+mjNPn7OykxKhj4Rdx5
	 YE4hucT4WtjstozMD727Z0/JYbs1oWwrak2vwlxQYKBOYqjToprWqf4pBH1Mtmljz+
	 uHAnBOA4QySpFvSNsO30exweTA6gPEdmbaY8EAJFV88nIuHMXEvpzrV9q0ldprZxmD
	 TgEqvHmS0v2Fg==
Subject: Re: [net,1/2] net: stmmac: preserve real_num_tx_queues on mqprio
 setup failure
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 0x1207@gmail.com,
 olteanv@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 02 Sep 2026 12:30:34 +0000
Message-ID: <178835223459.3394541.6532073730409201403@kernel.org>
In-Reply-To: <20260829-stmmac-fix-graft-overwrite-v1-1-a4f84c4c264e@oss.qualcomm.com>
References: <20260829-stmmac-fix-graft-overwrite-v1-1-a4f84c4c264e@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 2 · Medium: 1 · Low: 0

- [High] The error path this patch is built around cannot be taken:
  `stmmac_fpe_map_preemption_class()` is dispatched through…
- [High] The new helper `stmmac_set_ndev_tcs()`
  (drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:1240) is a verbatim…
- [Medium] The commit message justifies dropping stmmac_reset_tc_mqprio()
  from the error path with 'the TC-to-queue mapping is restored to the…

--

net: stmmac: preserve real_num_tx_queues on mqprio setup failure

This reworks tc_setup_dwmac510_mqprio() so that the previous
real_num_tx_queues and TC-to-queue mapping are snapshotted and restored
if stmmac_fpe_map_preemption_class() fails, instead of falling back to
stmmac_reset_tc_mqprio().  A new stmmac_set_ndev_tcs() helper is added to
program and restore the netdev TC state.

A few questions below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 14cabe76e53e..be8ddda2aa76 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1237,6 +1237,30 @@ static int tc_query_caps(struct stmmac_priv *priv,
>  	}
>  }
>  
> +static int stmmac_set_ndev_tcs(struct net_device *ndev, u8 ntc,
> +			       struct netdev_tc_txq *tc_to_txq)
> +{
> +	int i, err;
> +
> +	netdev_reset_tc(ndev);
> +	if (ntc == 1)
> +		return 0;

[Severity: High]
Is the "ntc == 1" early return correct for stmmac?

This shortcut matches mlx5e_netdev_set_tcs() in
drivers/net/ethernet/mellanox/mlx5/core/en_main.c, where one TC means "no
TC differentiation" and mlx5 keeps its own queue/TC bookkeeping.  In
stmmac the netdev TC state is the only input to the FPE programming
callbacks.

For a legal single-TC offload request, for example

  tc qdisc replace dev eth0 root mqprio num_tc 1 map 0 0 0 0 0 0 0 0 \
      queues 4@0 fp P hw 1

mqprio_validate_qopt() accepts num_tc 1 and mqprio_fp_to_offload() sets
mqprio->preemptible_tcs = BIT(0).  stmmac_set_ndev_tcs(ndev, 1, tc_to_txq)
then leaves dev->num_tc == 0 and tc_to_txq[] zeroed, and
tc_setup_dwmac510_mqprio() still returns 0.

Before this patch the same request ran netdev_set_num_tc(ndev, 1) followed
by netdev_set_tc_queue(ndev, 0, count, offset).

Does that change the hardware programming?  dwmac5_fpe_map_preemption_class()
derives everything from netdev_get_num_tc():

drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c:dwmac5_fpe_map_preemption_class() {
	int num_tc = netdev_get_num_tc(ndev);
	...
	for (u32 tc = 0; tc < num_tc; tc++) {
		...
		if (pclass & BIT(tc))
			preemptible_txqs |= GENMASK(offset + count - 1, offset);
		...
	}
update_mapping:
	val = readl(priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
	       priv->ioaddr + GMAC5_MTL_FPE_CTRL_STS);
}

With num_tc == 0 the loop body never runs, so FPE_MTL_PREEMPTION_CLASS is
written as 0 and the TC0 the user marked preemptible is never armed.  The
one-to-many SP-algorithm and equal-weight checks in the same loop are
skipped as well.

On XGMAC the effect is the opposite direction:

drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c:dwxgmac3_fpe_map_preemption_class() {
	if (!num_tc) {
		/* Restore default TC:Queue mapping */
		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
		}
	}

so the identity queue-to-TC map is reprogrammed even though the offload of
N queues into TC0 was reported as successful.  The netdev also ends up
reporting num_tc 0 to mqprio_dump() while the mqprio qdisc is installed.

> +
> +	err = netdev_set_num_tc(ndev, ntc);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < ntc; i++) {
> +		u16 count, offset;
> +
> +		count = tc_to_txq[i].count;
> +		offset = tc_to_txq[i].offset;
> +		netdev_set_tc_queue(ndev, i, count, offset);
> +	}
> +
> +	return 0;
> +}
> +
>  static void stmmac_reset_tc_mqprio(struct net_device *ndev,
>  				   struct netlink_ext_ack *extack)
>  {

[ ... ]

> @@ -1250,45 +1274,56 @@ static void stmmac_reset_tc_mqprio(struct net_device *ndev,
>  static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
>  				    struct tc_mqprio_qopt_offload *mqprio)
>  {

[ ... ]

> +	/* save current tc values for reset */
> +	ndev_ntc = netdev_get_num_tc(ndev) ? : 1;
> +	for (i = 0; i < ARRAY_SIZE(ndev->tc_to_txq); i++)
> +		ndev_tc_to_txq[i].combined =
> +			READ_ONCE(ndev->tc_to_txq[i].combined);

[Severity: Medium]
The snapshot covers num_tc and tc_to_txq[], but not ndev->prio_tc_map[].
stmmac_set_ndev_tcs() starts with netdev_reset_tc(), which clears all
three:

net/core/dev.c:netdev_reset_tc() {
	WRITE_ONCE(dev->num_tc, 0);
	for (i = 0; i < TC_MAX_QUEUE; i++)
		WRITE_ONCE(dev->tc_to_txq[i].combined, 0);
	for (i = 0; i <= TC_BITMASK; i++)
		WRITE_ONCE(dev->prio_tc_map[i], 0);
}

The core only repopulates prio_tc_map after a successful driver callback:

net/sched/sch_mqprio.c:mqprio_init() {
	...
	/* Always use supplied priority mappings */
	for (i = 0; i < TC_BITMASK + 1; i++)
		netdev_set_prio_tc_map(dev, i, qopt->prio_tc_map[i]);
}

so on the error path the previously active priority-to-TC map is lost.
Should prio_tc_map[] be saved and restored too?

Also, the "? : 1" encoding collapses an existing num_tc == 1 into the
helper's reset case, so a device that legitimately had one TC ends up with
num_tc == 0 after a failed attempt.

Separately, the commit message says "the TC-to-queue mapping is restored to
the previously saved values".  Is the num_tc restore observable in the
scenario the message describes (a new mqprio configuration over a working
one)?  qdisc_create() calls ops->destroy() even when ops->init() failed,
and mqprio_destroy() takes the non-offload branch because priv->hw_offload
was never set:

net/sched/sch_mqprio.c:mqprio_destroy() {
	if (priv->hw_offload && dev->netdev_ops->ndo_setup_tc)
		mqprio_disable_offload(sch);
	else
		netdev_set_num_tc(dev, 0);
}

which zeroes dev->num_tc again right after the driver restored it.

> +
> +	for (i = 0; i < qopt->num_tc; i++) {
> +		tc_to_txq[i] = (struct netdev_tc_txq) {
> +			.count = qopt->count[i],
> +			.offset = qopt->offset[i],
> +		};
> +		num_tx_queues += qopt->count[i];
>  	}
>  
> -	err = netif_set_real_num_tx_queues(ndev, num_stack_tx_queues);
> +	err = stmmac_set_ndev_tcs(ndev, qopt->num_tc, tc_to_txq);
> +	if (err)
> +		goto error_reset_tc;
> +
> +	ndev_num_tx_queues = ndev->real_num_tx_queues;
> +	err = netif_set_real_num_tx_queues(ndev, num_tx_queues);
>  	if (err)
> -		goto err_reset_tc;
> +		goto error_reset_tc;
>  
>  	err = stmmac_fpe_map_preemption_class(priv, ndev, extack,
>  					      mqprio->preemptible_tcs);
>  	if (err)
> -		goto err_reset_tc;
> +		goto error_reset_num_tx_queues;
>  
>  	return 0;
>  
> -err_reset_tc:
> -	stmmac_reset_tc_mqprio(ndev, extack);
> +error_reset_num_tx_queues:
> +	netif_set_real_num_tx_queues(ndev, ndev_num_tx_queues);
> +error_reset_tc:
> +	stmmac_set_ndev_tcs(ndev, ndev_ntc, ndev_tc_to_txq);
>  
>  	return err;
>  }

[Severity: High]
Can err here ever be non-zero on a MAC that reaches this function?
stmmac_fpe_map_preemption_class() is dispatched through the void wrapper:

drivers/net/ethernet/stmicro/stmmac/hwif.h {
#define stmmac_do_void_callback(__priv, __module, __cname,  __arg0, __args...) \
({ \
	int __result = -EINVAL; \
	if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) { \
		(__priv)->hw->__module->__cname((__arg0), ##__args); \
		__result = 0; \
	} \
	__result; \
})
...
#define stmmac_fpe_map_preemption_class(__priv, __args...) \
	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
}

The op is declared as returning int in struct stmmac_ops, but the wrapper
calls it as a bare statement and forces 0 whenever the pointer is set.
Every ops table paired with .tc = &dwmac510_tc_ops in hwif.c (dwmac410_ops,
dwmac510_ops, dwxgmac210_ops, dwxlgmac2_ops) populates
.fpe_map_preemption_class, so err is always 0 and the new
error_reset_num_tx_queues label looks unreachable.

If so, does that mean the failure described in the commit message,

  "if stmmac_fpe_map_preemption_class() fails after the number of real TX
   queues has been set to num_tx_queues"

cannot currently happen, and the Fixes: 195e4f409a40 tag is pointing at a
path that is not taken?

The same wrapper also drops the real rejections in
dwmac5_fpe_map_preemption_class():

drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c:dwmac5_fpe_map_preemption_class() {
		if (priv->plat->tx_sched_algorithm == MTL_TX_ALGORITHM_SP) {
			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
			return -EINVAL;
		}
		...
			if (priv->plat->tx_queues_cfg[offset + i].weight !=
			    queue_weight) {
				NL_SET_ERR_MSG_FMT_MOD(extack, WEIGHT_ERR_MSG,
						       queue_weight, tc);
				return -EINVAL;
			}
}

Both returns happen before the GMAC5_MTL_FPE_CTRL_STS write, so the
preemption-class register keeps its previous value while the qdisc layer is
told the offload succeeded.  Would switching the wrapper to
stmmac_do_callback() be the prerequisite change here, so that this new
error path can actually run?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260829-stmmac-fix-graft-overwrite-v1-0-a4f84c4c264e%40oss.qualcomm.com

