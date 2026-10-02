Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4624ECA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJpRtA7YfNY7FLwRil1Tu8BDj1dU3gFaPuIMEGQpFJs=; b=xFC2Qa8Hp7YmA1zseQ2zg8zCKG
	MUdHqJ8xVMXRyS6uj1qVayXICNyO8HxIgHNVCUxsTmScNDPD2go56DemGkwb6effq5Auifq5Gq/fj
	+kqU5W5FUktzz2iVllBxVqHB7JHiCWRw1W9aNDjV0XyACDDoShT9sYAALQJ3kIelUJxU7T3kbZYef
	2u/22jsjlJTd4uF5duygq6iFfXCxr0SzfH1LPuipcWvsLtX40eeuWiAb6dDoMKp0BKn2GKEfAInWz
	8LFtAX0OUS1hmXBphRE0qVVxID72cM1nvzdKmTUhbLz5Ch0jUA/yD/Ab+SQncZFnFMgvKXcSBjxGu
	6uJwPLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXm9-0000000Aq0w-0sTV;
	Fri, 02 Oct 2026 07:33:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXm7-0000000Apz5-1sQZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:33:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36929447DA;
	Fri,  2 Oct 2026 07:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6EA1F0089C;
	Fri,  2 Oct 2026 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790926427;
	bh=VJpRtA7YfNY7FLwRil1Tu8BDj1dU3gFaPuIMEGQpFJs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YQPt8va+VR/aMmniak9XBtA5aHiXrdataODQBNhtJAK9pReyu1sVIbL6meuFihwt7
	 cVuyPXowZ0OEMw+SfsKD5ECJcyZBIfhxqSb9ZRwCympbilgrLrDNyuuOCW/VOT6/DK
	 rt7xGMWzjGdgeIj1eI55yO5z1OZVEc7AwhIqLAk8h8inev2oNGHTZfhEZsCVmTngJY
	 825O0oBwQDRTa0wtf1B1491JG7b72Z4hA/6cvH/7fTzwhiB6zy+HYmjF5WkjPB9YBd
	 TF7ItV8iF2QowfcwI2Vd0A9/7Dffh0DUJHXP2+kcmEiJzknH83U1XFcucHA5BmdbSF
	 fajtE+YFst7eQ==
Subject: Re: [PATCH net-next v9 15/15] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, horms@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 02 Oct 2026 07:33:45 +0000
Message-ID: <179092642540.434549.1993526526960644611@kernel.org>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-15-a17caf60f89a@microchip.com>
References: <20260928-lan966x-pci-fdma-v9-15-a17caf60f89a@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Once this overlay adds the "fdma" interrupt, PCIe instances
  use lan966x_fdma_pci_ops, and a teardown ordering bug in that backend…

--

misc: lan966x-pci: dts: add fdma interrupt to overlay

This commit adds the fdma interrupt (OIC interrupt 14) to the lan966x PCI
device tree overlay. This turns on FDMA-based frame injection and extraction
when the switch is connected over PCIe.

> diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> index 7bb726550cafd..5bb12dbc08431 100644
> --- a/drivers/misc/lan966x_pci.dtso
> +++ b/drivers/misc/lan966x_pci.dtso
> @@ -141,8 +141,9 @@ switch: switch@e0000000 {
>  
>  					interrupt-parent = <&oic>;
>  					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
> +						     <14 IRQ_TYPE_LEVEL_HIGH>,
>  						     <9 IRQ_TYPE_LEVEL_HIGH>;
> -					interrupt-names = "xtr", "fdma", "ana";
> +					interrupt-names = "xtr", "fdma", "ana";

[Severity: Medium]
Once the "fdma" interrupt is present, PCIe instances use
lan966x_fdma_pci_ops. Does that make a teardown ordering problem in the PCIe
FDMA backend reachable?

lan966x_remove() tears down the FDMA before it unregisters the netdevs:

lan966x_main.c:lan966x_remove() {
    ...
	lan966x->ops->fdma_deinit(lan966x);
	lan966x_cleanup_ports(lan966x);
    ...
}

lan966x_fdma_pci_deinit() disables NAPI and frees both rings. It does not
clear lan966x->rx.lan966x, it does not detach the netdevs, and rtnl is not
held at this point:

lan966x_fdma_pci.c:lan966x_fdma_pci_deinit() {
	if (lan966x->fdma_ndev)
		napi_disable(&lan966x->napi);
    ...
	fdma_free_coherent_and_unmap(lan966x->dma_dev, &lan966x->rx.fdma);
	fdma_free_coherent_and_unmap(lan966x->dma_dev, &lan966x->tx.fdma);
}

fdma_free_coherent_and_unmap() only clears atu_region, so dcbs and dma
still hold their old values.

netif_set_mtu_ext() only checks netif_device_present(). That means an MTU
change that alters the max frame size can still run during this window:

lan966x_port_change_mtu()
  lan966x_fdma_pci_resize()
    __lan966x_fdma_pci_reload()
      lan966x_fdma_pci_reload()
        napi_disable(&lan966x->napi)

The resize guard is only this check:

	if (!lan966x->rx.lan966x)
		return 0;

rx.lan966x is still non-NULL after deinit. Would the second napi_disable()
on an already disabled NAPI spin forever while holding rtnl? That would also
block the unregister_netdev() that lan966x_remove() calls next.

The probe error path in lan966x_fdma_pci_init() looks like it has a similar
gap:

	err = lan966x_fdma_pci_tx_alloc(&lan966x->tx);
	if (err) {
		fdma_free_coherent_and_unmap(lan966x->dma_dev, rx_fdma);
		return err;
	}

rx.lan966x has already been set earlier in lan966x_fdma_pci_init(). The
netdevs registered by lan966x_probe_port() stay live until the cleanup_ports
label.

If an MTU change arrives in that window, NAPI is still enabled from
lan966x_port_init(). lan966x_fdma_pci_reload() then allocates new rings and
does:

	fdma_free_coherent_and_unmap(lan966x->dma_dev, &rx_fdma_old);

Is this a second dma_free_coherent() of the RX ring that the error path
already freed?

After that, reload re-arms the FDMA on the new rings. The probe error path
never calls fdma_deinit for them. Would the coherent memory for the new rings
leak, with the outbound ATU windows still mapped and DMA active after probe
fails?

The resize guard added in "net: lan966x: add PCIe FDMA MTU change support"
is meant to skip the resize until lan966x_fdma_pci_init() has built the
rings. It doesn't seem to cover rings that were torn down or only partly
built.

The shutdown callback from "net: lan966x: add shutdown callback to stop the
FDMA on reboot" avoids this by taking rtnl and calling netif_device_detach()
so that ndo_open and ndo_change_mtu can't re-enter the FDMA. Should the
remove and probe error paths get the same protection?

The platform backend already has the same remove ordering. The PCIe deinit,
resize and reload code is new in this series, though, and this overlay change
is what first makes it reachable.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-lan966x-pci-fdma-v9-0-a17caf60f89a%40microchip.com

