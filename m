Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B75ECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dRvfc70r6OBDko7gZcc8Tn9kTuS8mmELAxhWXxRlI4=; b=dUH24WymArC/BeWcgx7M3bqCWX
	/OETcseQW35D4xne5xQoprpvKBZuGVzEjPSGQa5EWo2c5tfAWacK2bRw8ObN3aDfmQg+a28tq9em9
	WI0ljXT5IEMvCDwSz1r/2T+S36pAzWRFy1DrD3ffslKpWmW5B7g4zxUL5UdS9kWT/27DlTerNk2va
	cEgTHco8UPa6ESfRAGgmt4s0bqEl110kVCH1jjBvckvY80JarkNPPn9PNSBeGAP+J2DRw0YRPDAnB
	P0mJ8pxxRozwz1xlJYIEciLaDNukbLX16hWJUfOp6Je7qsNIlzBbV3duJBWZuZRbqLHNgQKIZssGY
	SSxTWVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZIs-0000000B5nn-0FAM;
	Fri, 02 Oct 2026 09:11:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZIn-0000000B5m7-0paK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 09:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7dRvfc70r6OBDko7gZcc8Tn9kTuS8mmELAxhWXxRlI4=; b=HrbkvRL9mCz1Tsp3Nv9Ve2afHO
	lTFofWfvQ4tn4Gdy6aFc8v8cjic6QIzrV/hFCv58Yoi18dcROzsX01V9L9k1CimXt7ATjPFLwqzkI
	vcpXfEPZBHignEJvtE34qOlDz1StYOM8wsilYJc2OqcjZIgFSBbYCXtz3gWVI1VKWXdSt6BztvDma
	3NW/RtPBtIqXTHgd71xrPoktDyeOBuJIn1sgmqiUhBovsf74wR5I8260rMZC9qZumIhw5Sqhh2xTR
	hBFYopQ4rLJdm7XdRtWVUAp4wTB9tffFM6RPSD42NK0DVhZ4rtiOOzmy2t6ggz8SqufoVzPnSlRyf
	TA4HDTzA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCZIi-00000005liG-24sb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790932292; x=1822468292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QyiqJbVNVVWpOjOeWDvCPx4TpBrd1c2J6poMC4kMREk=;
  b=eeONtBWGJ5vAFNE90H/7tPNquNuztx1439EDsRWhE1wH3tnE8IgTBawt
   tWlDk+wXAb94YTipgWbeW95XkZpWqcEyubURi7xzGGWukmwtFkYD/xR/g
   SqsMc6sbT/mkJWMbfoA1JONRrbmIfjkx9yyNLdRlMqe05LYi+lDn3PUZm
   fEyejB/5B3OwmUuICo0gCFPfMdIQ/oldvOK/m85/7/ptI+v5PLDVp+vvm
   iIkbGeXIN1C57up7pZYIrAhJOb1gcaivyMPX7LBA9FK8j9MwljtXBvJ56
   ZZAlvj8YVkvGrOCpY5ri8KpWhfSBfqYM9UeNtcPB5OO/Fq3L5j9oqVX0o
   w==;
X-CSE-ConnectionGUID: K6kcmqTgQBOroRaveL+Z0A==
X-CSE-MsgGUID: DyHNEIi1RiWBs0+eM9r5zA==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="63547435"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2026 02:11:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 2 Oct 2026 02:11:23 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 02:11:19 -0700
Date: Fri, 2 Oct 2026 11:11:18 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horatiu.vultur@microchip.com>,
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <hawk@kernel.org>,
	<john.fastabend@gmail.com>, <sdf@fomichev.me>, <herve.codina@bootlin.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <mohsin.bashr@gmail.com>,
	<horms@kernel.org>, <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v9 13/15] net: lan966x: add PCIe FDMA XDP support
Message-ID: <20261002091118.dnavfb3whz5enjcd@DEN-DL-M70577>
References: <20260928-lan966x-pci-fdma-v9-13-a17caf60f89a@microchip.com>
 <179092642155.434549.4173203120024624969@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179092642155.434549.4173203120024624969@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_101133_151999_3C670A79 
X-CRM114-Status: GOOD (  38.30  )
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

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] This patch removes the PCIe rejection from lan966x_xdp_setup()
>   (drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c), so a bond can…
> - [Low] In lan966x_xdp_pci_run(), xdp_init_buff() is called with frame_sz
>   = fdma->db_size, and hard_start is the slot start (virt_addr -…
> 
> --
> 
> net: lan966x: add PCIe FDMA XDP support
> 
> This commit adds XDP support to the lan966x PCIe FDMA path. The IFH and
> FCS are stripped before the program runs, and XDP_TX is done by copying
> the frame into a TX slot behind a newly built IFH. lan966x_xdp_setup()
> no longer rejects PCIe and skips the page_pool reload on that path.
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > index 758554c951c52..949994874ed96 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> 
> [ ... ]
> 
> > @@ -139,7 +140,123 @@ static bool lan966x_fdma_pci_rx_size_fits(struct fdma *fdma, u32 blockl)
> >  	       blockl <= fdma->db_size - XDP_PACKET_HEADROOM;
> >  }
> >  
> 
> [ ... ]
> 
> > +static int lan966x_xdp_pci_run(struct lan966x_port *port, void *data,
> > +			       u32 data_len, void **xdp_data, u32 *xdp_len)
> > +{
> 
> [ ... ]
> 
> > +	xdp_init_buff(&xdp, fdma->db_size, &port->xdp_rxq);
> > +
> > +	/* hard_start is set to slot start (virt_addr is XDP_PACKET_HEADROOM
> > +	 * into the slot). Headroom includes the IFH; BPF may grow into it
> > +	 * via adjust_head. IFH is rebuilt on XDP_TX and unread on XDP_PASS.
> > +	 */
> > +	xdp_prepare_buff(&xdp,
> > +			 data - XDP_PACKET_HEADROOM,
> > +			 XDP_PACKET_HEADROOM + IFH_LEN_BYTES,
> > +			 data_len,
> > +			 false);
> 
> [Severity: Low]
> Can data_end end up past xdp_data_hard_end() here?
> 
> frame_sz is the full db_size and hard_start is the start of the slot, so
> the XDP core computes the data limit as:
> 
> include/net/xdp.h:xdp_data_hard_end()
>     ((xdp)->data_hard_start + (xdp)->frame_sz -
>      SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
> 
> The upper bound in lan966x_fdma_pci_rx_size_fits(), shown in the context
> above, only reserves the headroom:
> 
>     blockl <= fdma->db_size - XDP_PACKET_HEADROOM;
> 
> lan966x_fdma_pci_rx_check_frame() sets data to slot + XDP_PACKET_HEADROOM
> + IFH_LEN_BYTES and data_len to blockl - IFH_LEN_BYTES - ETH_FCS_LEN. At
> the largest accepted blockl, data_end is then slot + db_size -
> ETH_FCS_LEN, roughly 316 bytes past xdp_data_hard_end().
> 
> For such a buffer, bpf_xdp_adjust_tail() returns -EINVAL for any offset,
> shrinks included, because it checks this first:
> 
>     if (unlikely(data_end > data_hard_end))
>         return -EINVAL;
> 
> Reaching this needs a blockl that eats into the shinfo reserve, for
> example a malformed BLOCKL. It could also be an oversized frame truncated
> to DATAL while lan966x_port_change_mtu() has raised MAXLEN but
> fdma_resize() has not yet reallocated the rings.
> 
> Memory safety is not affected, since data_end stays inside the slot the
> driver owns.
> 
> Should lan966x_fdma_pci_rx_size_fits() also reserve
> SKB_DATA_ALIGN(sizeof(struct skb_shared_info)) so it matches the frame_sz
> given to xdp_init_buff()?
> 
> > +
> > +	act = bpf_prog_run_xdp(xdp_prog, &xdp);
> > +
> > +	*xdp_data = xdp.data;
> > +	*xdp_len = xdp.data_end - xdp.data;
> > +
> > +	switch (act) {
> > +	case XDP_PASS:
> > +		return FDMA_PASS;
> > +	case XDP_TX:
> > +		return lan966x_fdma_pci_xmit_xdpf(port, *xdp_data, *xdp_len) ?
> > +		       FDMA_DROP : FDMA_TX;
> > +	default:
> > +		bpf_warn_invalid_xdp_action(port->dev, xdp_prog, act);
> > +		fallthrough;
> > +	case XDP_ABORTED:
> > +		trace_xdp_exception(port->dev, xdp_prog, act);
> > +		fallthrough;
> > +	case XDP_DROP:
> > +		return FDMA_DROP;
> > +	}
> > +}
> 
> [Severity: Medium]
> Now that lan966x_xdp_setup() no longer rejects PCIe, can a bond attach a
> program to lan966x PCIe ports and then have its XDP_TX frames silently
> dropped here?
> 
> The ports share lan966x_port_netdev_ops, which provides both .ndo_bpf and
> .ndo_xdp_xmit. That is all bond_xdp_set() checks, so it accepts these
> ports. It then pushes the program down:
> 
> bond_xdp_set()
>     dev_xdp_propagate()
>         lan966x_xdp_setup()    <- now succeeds on PCIe
> 
> bond_xdp_set() also calls
> static_branch_inc(&bpf_master_redirect_enabled_key). After that,
> bpf_prog_run_xdp() rewrites XDP_TX on a bond slave:
> 
>     if (act == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))
>         act = xdp_master_redirect(xdp);
> 
> In round-robin, XOR and 802.3ad modes, xdp_master_redirect() returns
> XDP_REDIRECT whenever the bond picks a transmit slave other than the
> receiving port. That action falls into the default case above:
> 
> bpf_warn_invalid_xdp_action() -> trace_xdp_exception() -> FDMA_DROP
> 
> A bond program that only returns XDP_TX attaches without error, but a
> hash- or round-robin-dependent share of its packets is dropped. With two
> slaves in round-robin, that is about half. Before this patch the attach
> failed with -EOPNOTSUPP.
> 
> Should the PCIe path handle XDP_REDIRECT, or keep refusing the attach
> when the port is a bond slave?

Re-raise of issue dismissed in v7. xdp_features doesn't advertise REDIRECT on
PCIe, and the warning path is the intended fallback

> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-lan966x-pci-fdma-v9-0-a17caf60f89a%40microchip.com

