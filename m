Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7767C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHQvHrjkrqLVCr6LdWk7d98zBjrSRHDkPKO8e1vSq10=; b=ruxdwwsbAWUoXh819p8g9ZRpc2
	LvwemswKC3rmenc7jP2cFI3JPmzskwhKCprwp9c/WBydarstegMjHZV2scY5p5OfIUNzKaNz8MbzG
	st8ZkUxXy8dbthybFrsRRhTYpLnGSMPT0ZT5LqYG6zWem4YQRQzwPqDclWOBJKyUQBv/N+TpmaH3V
	cfH0I4liIolUem5VjBtMQ+xJvau9kRpGl/x2XHR809moqgBwgqD7XMvHY57VsdWCresBsIFiYX1jU
	CjJo4EXvVA/N179yJtaC3J6MqdeetR0si0m5sXZedZey6YAuCf+zfGhjxKba1FYaZMFZWp0IDVFo7
	KDynlWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QUU-00000005vr1-2Dqc;
	Tue, 15 Sep 2026 10:34:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QUR-00000005vpI-41Ve
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789468456; x=1821004456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UBzkm8sfFlelF87j09jVlqAKMXd3gOjZixvTSW1iNUM=;
  b=UdDZpaPrMhy9UxNDYdUQ2B9Vo+zb2aigrZK2mF/dN1kszowqBeQRZ+Ej
   dH9izaiNg1Lf8B81lRq6JXWs5TCCI58ZNEqoQbdbgrOyAP+UIcS0x/E+l
   EQNxbLCkU4L0CN+W/hrgzwhj3y/FTwtouppmpYkaY6KyWtHqDrGApMlGO
   BkP0/QiRwF9N3/VQgAQmP6Q98oWaJJVUPuxHratEEH8yqkCkQFwcapCQ4
   ZoMuYehqRKuOOf3AZi08YvI5wDztnGtAc/5UPpelIdurt/KO49rsCSkGx
   04Qjvb5/JUymDoIXY7W5dNXAi/Owf16rcsTCu6rC9dljFVzpBmGRujT/I
   w==;
X-CSE-ConnectionGUID: 1ACFrffETBiX3sMYoaXxFA==
X-CSE-MsgGUID: 0wEdiCWwSIuMmHBlYohsAQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="295033993"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2026 03:34:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 15 Sep 2026 03:34:14 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 15 Sep 2026 03:34:10 -0700
Date: Tue, 15 Sep 2026 12:34:09 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horatiu.vultur@microchip.com>,
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <hawk@kernel.org>,
	<john.fastabend@gmail.com>, <sdf@fomichev.me>, <herve.codina@bootlin.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <mohsin.bashr@gmail.com>,
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v6 12/14] net: lan966x: add PCIe FDMA XDP support
Message-ID: <20260915103409.6cwnskzb2bl43mxv@DEN-DL-M70577.microsemi.net>
References: <20260909-lan966x-pci-fdma-v6-12-6f48dab9d671@microchip.com>
 <178904555117.219967.2055099842496630976@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178904555117.219967.2055099842496630976@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_033416_023516_AFA87163 
X-CRM114-Status: GOOD (  38.66  )
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

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] Inconsistent XDP frame presentation between the two RX hooks
>   of the same driver: after this patch lan966x has two in-tree XDP RX…
> 
> --
> 
> net: lan966x: add PCIe FDMA XDP support
> 
> This adds XDP support to the lan966x PCIe FDMA path, using contiguous
> ATU-mapped buffers and a memcpy-based XDP_TX instead of the page_pool
> scheme used by the platform path. The IFH and FCS are stripped before
> the BPF program runs, and lan966x_xdp_setup() now skips the page_pool
> reload for the PCIe case. Only XDP_ACT_BASIC is advertised for PCIe.
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > index 6cabbb8b47f2..02c021617a3e 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> 
> [ ... ]
> 
> > @@ -126,7 +127,123 @@ static bool lan966x_fdma_pci_rx_size_fits(struct fdma *fdma, u32 blockl)
> 
> [ ... ]
> 
> > +static int lan966x_xdp_pci_run(struct lan966x_port *port, void *data,
> > +                            u32 data_len, void **xdp_data, u32 *xdp_len)
> > +{
> 
> [ ... ]
> 
> > +     xdp_prepare_buff(&xdp,
> > +                      data - XDP_PACKET_HEADROOM,
> > +                      XDP_PACKET_HEADROOM + IFH_LEN_BYTES,
> > +                      data_len,
> > +                      false);
> > +
> > +     act = bpf_prog_run_xdp(xdp_prog, &xdp);
> 
> [ ... ]
> 
> > @@ -158,38 +275,33 @@ static int lan966x_fdma_pci_rx_check_frame(struct lan966x_rx *rx, u64 *src_port)
> >       if (!lan966x_fdma_pci_rx_size_fits(fdma, blockl))
> >               return FDMA_ERROR;
> >
> > -     return FDMA_PASS;
> > +     /* Present the Ethernet frame (no IFH, no FCS). HW re-inserts the
> > +      * FCS on TX; see lan966x_fdma_pci_xmit_xdpf(). May be overridden
> > +      * by XDP. The FCS strip is unconditional because NETIF_F_RXFCS
> > +      * is not advertised in hw_features.
> > +      */
> > +     *data = virt_addr + IFH_LEN_BYTES;
> > +     *data_len = blockl - IFH_LEN_BYTES - ETH_FCS_LEN;
> > +
> > +     return lan966x_xdp_pci_run(port, virt_addr, *data_len, data, data_len);
> >  }
> 
> [Severity: Medium]
> Should the two lan966x XDP receive hooks agree on whether the FCS is part
> of the window handed to the BPF program?
> 
> On the PCIe path, lan966x_fdma_pci_rx_check_frame() subtracts the FCS
> before calling into the program:
> 
>         *data_len = blockl - IFH_LEN_BYTES - ETH_FCS_LEN;
> 
>         return lan966x_xdp_pci_run(port, virt_addr, *data_len, data, data_len);
> 
> On the platform path, lan966x_fdma_rx_check_frame() passes the raw BLOCKL
> value and lan966x_xdp_run() only removes the IFH:
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:lan966x_fdma_rx_check_frame() {
>         ...
>         return lan966x_xdp_run(port, page, FDMA_DCB_STATUS_BLOCKL(db->status));
> }
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_xdp.c:lan966x_xdp_run() {
>         ...
>         xdp_prepare_buff(&xdp, page_address(page),
>                          IFH_LEN_BYTES + XDP_PACKET_HEADROOM,
>                          data_len - IFH_LEN_BYTES, false);
> }
> 
> That BLOCKL value still contains the FCS, as shown by the trim done later
> on the same path:
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:lan966x_fdma_rx_get_frame() {
>         ...
>         skb_put(skb, FDMA_DCB_STATUS_BLOCKL(db->status));
>         ...
>         skb_pull(skb, IFH_LEN_BYTES);
> 
>         if (likely(!(skb->dev->features & NETIF_F_RXFCS)))
>                 skb_trim(skb, skb->len - ETH_FCS_LEN);
> }
> 
> So xdp.data_end points four bytes past the end of the Ethernet payload on
> the platform path, and exactly at the end of the payload on the new PCIe
> path. Both windows stay inside the DMA buffer, so this looks like a
> behavioural difference rather than an out-of-bounds access.
> 
> A program that parses backwards from data_end, compares data_end - data
> against an L3 length field, or trims via bpf_xdp_adjust_tail() would get
> different results depending on whether the switch is platform- or
> PCIe-attached. The PCIe framing matches the usual XDP convention of no
> FCS, which would make the platform hook the one that differs from
> convention.
>

They should, and the PCIe framing is the one to keep. The strip was asked for by an
earlier round of this review, in v3, because the PCIe hook honours the post-program
window - lan966x_xdp_pci_run() writes back xdp.data_end - xdp.data and XDP_TX uses
it - so an FCS left in there would be delivered as payload whenever a program
touched the tail. The platform hook does not use them for XDP_PASS or XDP_TX at
all - it passes the pre-program length instead.

> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > index e089c08b9c37..9ada497767c6 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > @@ -874,11 +874,13 @@ static int lan966x_probe_port(struct lan966x *lan966x, u32 p,
> >
> >       port->phylink = phylink;
> >
> > -     /* XDP is not supported on the PCIe FDMA path. */
> > -     if (lan966x->fdma && !lan966x_is_pci(lan966x))
> > -             dev->xdp_features = NETDEV_XDP_ACT_BASIC |
> > -                                 NETDEV_XDP_ACT_REDIRECT |
> > -                                 NETDEV_XDP_ACT_NDO_XMIT;
> > +     if (lan966x->fdma) {
> > +             dev->xdp_features = NETDEV_XDP_ACT_BASIC;
> > +
> > +             if (!lan966x_is_pci(lan966x))
> > +                     dev->xdp_features |= NETDEV_XDP_ACT_REDIRECT |
> > +                                          NETDEV_XDP_ACT_NDO_XMIT;
> > +     }
> 
> [Severity: Medium]
> Both paths now report the same NETDEV_XDP_ACT_BASIC bit from
> lan966x_probe_port(), so is there anything in the uAPI that lets a
> program distinguish the FCS-included window of lan966x_xdp_run() from
> the FCS-stripped window of lan966x_xdp_pci_run()?
> 
> Would it make sense to make one of the two hooks match the other so that
> the frame presentation is the same for identically-advertised netdevs?

Same as above - the correct handling is removing the FCS, so the platform hook
is the one to move. There is no uAPI signal to describe the difference with
either, so converging is the only option.

> 
> --
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com

