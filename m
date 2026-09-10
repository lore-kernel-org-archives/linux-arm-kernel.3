Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA02C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rE3GHc+0H+51fX4lp3Mtbohqk/k/dkObaohynPKicmQ=; b=ToI9ulMXlTfWsAAGgbvP6ho3jI
	MPmQPihEe9Avf4PK1oKL6OWy2f8fu2IM11aEl3y0z2J4Z8BaHYArjQj80FlUKgAnDI+Io0II8+8Qd
	+cYKlYpFJPhv5+LuE8gQdbXcS9zMqsAZc1gB4UogCgqozMq7QVnkQJx6wQQsDmPNvZyngmib+iGX8
	xjHxLQ05EEhsv/h+32Uts0XUfoGHK/1MDUAsgVJdHglX3gxHbK9TwOIkDIW1YCFjhAVCKF+4Wewsw
	OArHgP0jyKYFH0xOi93ryQXzjP21W0G/vqaZ97NGo3n6sL6n6cbWyx16p+Mq3uYkBRmHq9srbdw7a
	wR64Kp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTN-0000000EQTE-3Tyi;
	Thu, 10 Sep 2026 13:05:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTM-0000000EQS9-0l2v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E77C60209;
	Thu, 10 Sep 2026 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7D41F000FF;
	Thu, 10 Sep 2026 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789045547;
	bh=rE3GHc+0H+51fX4lp3Mtbohqk/k/dkObaohynPKicmQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LPWdEwTmkRKzf5gaZygpXVTKeFoY4Odzi9hUAFg/irGi+2AXB6oBnzTTYVDn4xdZg
	 3WRFBdYuiR+4B41IxacLYi1ruTMGBhMMm6tu6Qel1HP3TwgZSJbKtW8f/fQUjyAe/Z
	 +TD8085WnEk9bKnI0ahsV4qVAqdg1MZDAzVgakbBjiwhppC+S/WMMW+AuMm0lGrHsE
	 26vWi3lvYFTSEroMEfi8bYX7/UGKKpBuX9FqX3fqrmYZoOFI8y+WNNqxE9RQ+vlx31
	 F14ZxIyvSLQJsgO0bAiScMa4AAzO+a67OMjPL95GD18gjlx00UC6ukbFc1w/VHm3o8
	 eUJYjvafMnuwg==
Subject: Re: [PATCH net-next v6 09/14] net: lan966x: add shutdown callback to
 stop FDMA on reboot
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Sep 2026 13:05:45 +0000
Message-ID: <178904554582.219967.5262957308315602780@kernel.org>
In-Reply-To: <20260909-lan966x-pci-fdma-v6-9-6f48dab9d671@microchip.com>
References: <20260909-lan966x-pci-fdma-v6-9-6f48dab9d671@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 4 · Low: 1

- [Medium] lan966x_shutdown() leaves the shared NAPI permanently disabled
  (napi_disable() with no napi_enable() and no state marker) while the…
- [Medium] lan966x_shutdown() quiesces TX only with napi_disable() +
  netif_tx_disable() and then manipulates FDMA TX state…
- [Medium] lan966x_shutdown() masks the analyzer source with a plain
  lan_wr(0, ANA_ANAINTR) while the ANA interrupt is still requested and…
- [Medium] The new shutdown path relies on
  lan966x_fdma_rx_disable()/lan966x_fdma_tx_disable() to prove the…
- [Low] Claim: the `if (!lan966x->fdma) return;` guard in
  lan966x_shutdown() skips the ANA_ANAINTR mask, which lan966x_init()…

--

net: lan966x: add shutdown callback to stop FDMA on reboot

Adds a platform shutdown() callback that disables NAPI, stops the netdev
TX queues, disables the RX and TX FDMA channels and masks FDMA_INTR_ENA,
FDMA_INTR_DB_ENA and ANA_ANAINTR so a card that survives a host reboot
does not assert the shared PCIe INTx before re-probe.  FDMA_INTR_ENA is
also re-armed in lan966x_fdma_rx_start().

A few questions about the new shutdown path below.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> index 2695bc41e52a..5793a83268fc 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c

[ ... ]

> @@ -325,6 +329,21 @@ static void lan966x_fdma_stop_netdev(struct lan966x *lan966x)
>  	}
>  }
>  
> +/* Drain in-flight xmit callers and stop all TX queues on every port. */
> +void lan966x_fdma_tx_disable_netdev(struct lan966x *lan966x)
> +{
> +	struct lan966x_port *port;
> +	int i;
> +
> +	for (i = 0; i < lan966x->num_phys_ports; ++i) {
> +		port = lan966x->ports[i];
> +		if (!port)
> +			continue;
> +
> +		netif_tx_disable(port->dev);
> +	}
> +}

[Severity: Medium]

Does netif_tx_disable() really drain every in-flight xmit caller here?
lan966x also registers .ndo_xdp_xmit = lan966x_xdp_xmit in
lan966x_port_netdev_ops, and that entry point is dispatched from a foreign
device's NAPI/softirq (bq_xmit_all()) without the netdev txq locks and
without regard for the txq stopped state or lan966x's NAPI state:

  lan966x_xdp_xmit()
    lan966x_fdma_xmit_xdpf()
      spin_lock(&lan966x->tx_lock);
      ...
      /* Start the transmission */
      lan966x_fdma_tx_start(tx);

lan966x_fdma_tx_start() calls lan966x_fdma_tx_activate() when
tx->activated is false, and that re-sets BIT(channel_id) in
FDMA_INTR_DB_ENA and writes FDMA_CH_ACTIVATE.  lan966x_fdma_tx_disable()
in the new shutdown path sets tx->activated = false, and lan966x_shutdown()
touches FDMA_CH_DISABLE, tx->activated and FDMA_INTR_DB_ENA without taking
lan966x->tx_lock.

If an XDP program on another interface redirects into a lan966x port in the
reboot window, can the TX channel end up re-activated (and the DB enable
bit re-set) after shutdown() returns?  The shutdown path deliberately keeps
the DCB rings mapped, so a re-activated channel would keep fetching DCBs
from and writing DCB status into host memory that the next kernel reuses,
which is the state the commit message says it eliminates.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index 11094a381ec2..d6ce1e3e373f 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -1324,9 +1324,35 @@ static void lan966x_remove(struct platform_device *pdev)
>  	debugfs_remove_recursive(lan966x->debugfs_root);
>  }
>  
> +static void lan966x_shutdown(struct platform_device *pdev)
> +{
> +	struct lan966x *lan966x = platform_get_drvdata(pdev);
> +
> +	if (!lan966x->fdma)
> +		return;
> +
> +	/* The reload paths disable this NAPI under rtnl; serialize with them. */
> +	rtnl_lock();
> +
> +	if (lan966x->fdma_ndev)
> +		napi_disable(&lan966x->napi);

[Severity: Medium]

The NAPI is disabled here and never re-enabled, and no state is recorded to
say the device has been shut down.  After rtnl_unlock() the netdevs are
still registered and their ndo callbacks are still live.

Can a later MTU change on any port hang?

  lan966x_port_change_mtu()          /* .ndo_change_mtu */
    lan966x->ops->fdma_resize()
      lan966x_fdma_change_mtu()
        __lan966x_fdma_reload()
          lan966x_fdma_reload()
            napi_synchronize(&lan966x->napi);
            napi_disable(&lan966x->napi);

The second napi_disable() lands in napi_disable_locked(), which spins:

	while (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
		usleep_range(20, 200);
		val = READ_ONCE(n->state);
	}

NAPIF_STATE_SCHED was set by the napi_disable() in lan966x_shutdown() and
is only cleared by napi_enable(), which shutdown() never calls.

Wouldn't the netlink task then loop with no timeout and no alternative wake
condition, while holding rtnl_mutex, blocking any later rtnl user in the
reboot sequence (including a second instance's lan966x_shutdown(), which
also takes rtnl_lock())?  device_shutdown() runs from
kernel_restart_prepare() with userspace still runnable, and an XDP attach
reaches the same napi_disable() through lan966x_xdp_setup() ->
lan966x_fdma_reload_page_pool() -> __lan966x_fdma_reload().

> +
> +	lan966x_fdma_tx_disable_netdev(lan966x);
> +
> +	lan966x_fdma_rx_disable(&lan966x->rx);
> +	lan966x_fdma_tx_disable(&lan966x->tx);

[Severity: Medium]

The commit message says "fdma_deinit() disables both channels and waits for
them to go idle", and shutdown() relies on the same two helpers for that
guarantee.  Both of them drop the poll result though:

lan966x_fdma_rx_disable() and lan966x_fdma_tx_disable() {
	readx_poll_timeout_atomic(lan966x_fdma_channel_active, lan966x,
				  val, !(val & BIT(fdma->channel_id)),
				  READL_SLEEP_US, READL_TIMEOUT_US);
}

Is a timeout on FDMA_CH_ACTIVE distinguishable from a channel that really
went idle here?  lan966x_fdma_tx_disable() sets tx->activated = false
regardless, and shutdown() then masks FDMA_INTR_ENA/FDMA_INTR_DB_ENA, which
hides the error sources that would report the still-active channel, and
returns.

Unlike the unbind path, shutdown() keeps the RX pages, the coherent DCB
rings and (on the PCIe backend) the outbound ATU window mapped, so a
channel that never reached the idle state keeps write access to memory the
next kernel will reuse.  Would it make sense to check the poll return and
at least report it?

> +
> +	lan_wr(0, lan966x, FDMA_INTR_ENA);
> +	lan_wr(0, lan966x, FDMA_INTR_DB_ENA);
> +	lan_wr(0, lan966x, ANA_ANAINTR);

[Severity: Medium]

Can the ANA_ANAINTR mask be undone right after it is written?  The ANA irq
is still requested and enabled at this point, and it is a threaded handler
(devm_request_threaded_irq() with lan966x_ana_irq_handler and IRQF_ONESHOT
in lan966x_probe()), whose tail does an unlocked read-modify-write of the
same register:

lan966x_mac_irq_handler() {
	...
	lan_rmw(ANA_ANAINTR_INTR_SET(0),
		ANA_ANAINTR_INTR,
		lan966x, ANA_ANAINTR);
}

lan_rmw() is readl() -> modify -> writel() and preserves ANA_ANAINTR_INTR_ENA
from the value it read.  If the handler thread has already done its readl()
(with INTR_ENA still 1) when shutdown() writes 0, wouldn't its write-back
restore ANA_ANAINTR_INTR_ENA = 1?

shutdown() holds only rtnl, which the threaded handler never takes, and it
neither disable_irq()s nor frees the ANA irq, so the source stays mapped
and unmasked.  The switch keeps learning and forwarding after the host
reboots, so MAC-table sync events keep arriving.  Would a
disable_irq()/synchronize_irq() on lan966x->ana_irq before the mask, or a
shared lock with the handler, close that window?

> +
> +	rtnl_unlock();
> +}
> +
>  static struct platform_driver lan966x_driver = {
>  	.probe = lan966x_probe,
>  	.remove = lan966x_remove,
> +	.shutdown = lan966x_shutdown,
>  	.driver = {
>  		.name = "lan966x-switch",
>  		.of_match_table = lan966x_match,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com

