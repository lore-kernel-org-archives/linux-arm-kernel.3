Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB609C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05JqaFBeFEoQ2fVd/vXC0wIOHHckjhCp9F0L301SgEs=; b=J5Riyxcgm2Pk+Fs6Rl/Xot1eUJ
	8ss7xhIGaFsIh4eTnvgbchNvYNeXnVE55i9LkJKw06PGAR91eoKwy+4pVFuho/cEFqURDoTM5c4MJ
	tW00dfyE0RwPY4jCeOA5FB//m1GfW9Had98Ekpi9hWtzeEBO+lmdqDxL/0yMGm/94sm/70oEwVBqV
	PkO2UQmHZoDtkgDDRfThVVpiWNKI45aQocBvHSqzJHkIRFNtY3ZA870awXchj0+FT03SXRa0T6Qpe
	xFllBS/IwApfU/8igrR6y4T4L+6jjPdkx8H/MWCKF2tD432Ry95aEYoEBF/7xpuKx5xY0tK4a/8pv
	BsTHPkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTX-0000000EQY2-0hvB;
	Thu, 10 Sep 2026 13:05:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eTR-0000000EQVD-0tEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:05:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F22BA40DF4;
	Thu, 10 Sep 2026 13:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4C11F00893;
	Thu, 10 Sep 2026 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789045552;
	bh=05JqaFBeFEoQ2fVd/vXC0wIOHHckjhCp9F0L301SgEs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oMswmUb6eg3Tll5EF2xsdbpXrhXxaQMiQvHzCNWSK+3kpuVxphOLK9YWNqTZElwsD
	 DM2oxIvfkfivDx8wV2DSRahqTgvZdRAiBeWRz9Da+58K+nnc8vA2FR1356iSNxTvZw
	 clX4CazWt7cxNDaSwsXRCrW+d4oEOFxGIPvRUkhszAYVSOL4i3qO/Gqh07H4KpkVSh
	 UJ8hGbYWIoc0ihmBOVkFU/W4LvPP2Lm1B8fJMolq/GMmM/WSweTrkEPvzGXWrsMgND
	 f7qL0PNKnwbP2lS5XmE5AQzc0fq0Ujp7k+/HKU+xpPSLJDjUvgRk46WAW9hGbR1rfP
	 k6jT5K9Quj3qw==
Subject: Re: [PATCH net-next v6 12/14] net: lan966x: add PCIe FDMA XDP support
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
Date: Thu, 10 Sep 2026 13:05:51 +0000
Message-ID: <178904555117.219967.2055099842496630976@kernel.org>
In-Reply-To: <20260909-lan966x-pci-fdma-v6-12-6f48dab9d671@microchip.com>
References: <20260909-lan966x-pci-fdma-v6-12-6f48dab9d671@microchip.com>
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
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] Inconsistent XDP frame presentation between the two RX hooks
  of the same driver: after this patch lan966x has two in-tree XDP RX…

--

net: lan966x: add PCIe FDMA XDP support

This adds XDP support to the lan966x PCIe FDMA path, using contiguous
ATU-mapped buffers and a memcpy-based XDP_TX instead of the page_pool
scheme used by the platform path. The IFH and FCS are stripped before
the BPF program runs, and lan966x_xdp_setup() now skips the page_pool
reload for the PCIe case. Only XDP_ACT_BASIC is advertised for PCIe.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> index 6cabbb8b47f2..02c021617a3e 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c

[ ... ]

> @@ -126,7 +127,123 @@ static bool lan966x_fdma_pci_rx_size_fits(struct fdma *fdma, u32 blockl)

[ ... ]

> +static int lan966x_xdp_pci_run(struct lan966x_port *port, void *data,
> +			       u32 data_len, void **xdp_data, u32 *xdp_len)
> +{

[ ... ]

> +	xdp_prepare_buff(&xdp,
> +			 data - XDP_PACKET_HEADROOM,
> +			 XDP_PACKET_HEADROOM + IFH_LEN_BYTES,
> +			 data_len,
> +			 false);
> +
> +	act = bpf_prog_run_xdp(xdp_prog, &xdp);

[ ... ]

> @@ -158,38 +275,33 @@ static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
>  	if (!lan966x_fdma_pci_rx_size_fits(fdma, blockl))
>  		return FDMA_ERROR;
>  
> -	return FDMA_PASS;
> +	/* Present the Ethernet frame (no IFH, no FCS). HW re-inserts the
> +	 * FCS on TX; see lan966x_fdma_pci_xmit_xdpf(). May be overridden
> +	 * by XDP. The FCS strip is unconditional because NETIF_F_RXFCS
> +	 * is not advertised in hw_features.
> +	 */
> +	*data = virt_addr + IFH_LEN_BYTES;
> +	*data_len = blockl - IFH_LEN_BYTES - ETH_FCS_LEN;
> +
> +	return lan966x_xdp_pci_run(port, virt_addr, *data_len, data, data_len);
>  }

[Severity: Medium]
Should the two lan966x XDP receive hooks agree on whether the FCS is part
of the window handed to the BPF program?

On the PCIe path, lan966x_fdma_pci_rx_check_frame() subtracts the FCS
before calling into the program:

	*data_len = blockl - IFH_LEN_BYTES - ETH_FCS_LEN;

	return lan966x_xdp_pci_run(port, virt_addr, *data_len, data, data_len);

On the platform path, lan966x_fdma_rx_check_frame() passes the raw BLOCKL
value and lan966x_xdp_run() only removes the IFH:

drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:lan966x_fdma_rx_check_frame() {
	...
	return lan966x_xdp_run(port, page, FDMA_DCB_STATUS_BLOCKL(db->status));
}

drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c:lan966x_xdp_run() {
	...
	xdp_prepare_buff(&xdp, page_address(page),
			 IFH_LEN_BYTES + XDP_PACKET_HEADROOM,
			 data_len - IFH_LEN_BYTES, false);
}

That BLOCKL value still contains the FCS, as shown by the trim done later
on the same path:

drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:lan966x_fdma_rx_get_frame() {
	...
	skb_put(skb, FDMA_DCB_STATUS_BLOCKL(db->status));
	...
	skb_pull(skb, IFH_LEN_BYTES);

	if (likely(!(skb->dev->features & NETIF_F_RXFCS)))
		skb_trim(skb, skb->len - ETH_FCS_LEN);
}

So xdp.data_end points four bytes past the end of the Ethernet payload on
the platform path, and exactly at the end of the payload on the new PCIe
path. Both windows stay inside the DMA buffer, so this looks like a
behavioural difference rather than an out-of-bounds access.

A program that parses backwards from data_end, compares data_end - data
against an L3 length field, or trims via bpf_xdp_adjust_tail() would get
different results depending on whether the switch is platform- or
PCIe-attached. The PCIe framing matches the usual XDP convention of no
FCS, which would make the platform hook the one that differs from
convention.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index e089c08b9c37..9ada497767c6 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -874,11 +874,13 @@ static int lan966x_probe_port(struct lan966x *lan966x, u32 p,
>  
>  	port->phylink = phylink;
>  
> -	/* XDP is not supported on the PCIe FDMA path. */
> -	if (lan966x->fdma && !lan966x_is_pci(lan966x))
> -		dev->xdp_features = NETDEV_XDP_ACT_BASIC |
> -				    NETDEV_XDP_ACT_REDIRECT |
> -				    NETDEV_XDP_ACT_NDO_XMIT;
> +	if (lan966x->fdma) {
> +		dev->xdp_features = NETDEV_XDP_ACT_BASIC;
> +
> +		if (!lan966x_is_pci(lan966x))
> +			dev->xdp_features |= NETDEV_XDP_ACT_REDIRECT |
> +					     NETDEV_XDP_ACT_NDO_XMIT;
> +	}

[Severity: Medium]
Both paths now report the same NETDEV_XDP_ACT_BASIC bit from
lan966x_probe_port(), so is there anything in the uAPI that lets a
program distinguish the FCS-included window of lan966x_xdp_run() from
the FCS-stripped window of lan966x_xdp_pci_run()?

Would it make sense to make one of the two hooks match the other so that
the frame presentation is the same for identically-advertised netdevs?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com

