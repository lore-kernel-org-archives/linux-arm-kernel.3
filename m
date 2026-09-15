Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF165C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX3go3nmGIEUWT44+c5nJraekgv5jQqXipKR4TJmW1U=; b=azNe6WT2YvncudcCKgEXUPyv7E
	LuGH+EKQvZjVNBenukxDcnCl1DCp5EMMPUwbP+GZWCM9juguHHuGb/NCjsKZEGQj4b1Q3082Yj6zw
	3dumk+Oxh7d72RC7xdf5a/Go61GjTdwNK0yqEizf3okSRzgY/ZCE1s0fWmCrkIWbXW6S1DpjtA2Pb
	QV+wpLknvmjf48QEak8ctMP9I5vY+hfd2Y5zZz45arWZIt4j7eJkqMZl5/Lbg8fkYBbpGYBLK0Rot
	m8eZ7a6qc1dZZbuhdMDmk7MUZHmv8Cc3PgtYqCe3AyPRYl6bYUwvEDVJHtGaHDAjfVEcK6V4l605E
	kLws3vwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qm9-000000061Cg-2axY;
	Tue, 15 Sep 2026 10:52:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qm4-000000061C4-2hc6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789469548; x=1821005548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HtFG603PXEqzpj0QOJ8wws45R27BlfrhSLuLOWM0nJI=;
  b=gwuYddms/CinuLSHvTQU3X2dLud2UDIHGwT6IhXWIe4UOxB7U0/N8RzS
   8lgthqFRcIiJcBunEWNQNdY0kqbXJhR5WeTEIVQOMt85WCpseifr1KfIp
   eK0G0ifaVt/T2cSz9cWx4ceGkVKcIAR31p28nccNxQ4fWzbObeG9qBiUx
   1n10v/zwDSPuZQ+BLLBBH/yVJUr1/ObuDqvjjC06BLNPm5mAgi6N1J19/
   fxrQbi14D1n/yZXb4qG5avG1n9Na+NePI458Md3iFWpcOFOXUHFeOItli
   ysksuJG0IlMG3WZibDchmoyRQMYRLY7BBj7lrx0wg5wHwlxjfhEdOSPOQ
   g==;
X-CSE-ConnectionGUID: txDYYXqPRfKs/UNfmy8rBw==
X-CSE-MsgGUID: 0HDZTiWpRQ+4dp5SFWUfYQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="73639701"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:52:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Tue, 15 Sep 2026 03:52:26 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 15 Sep 2026 03:52:22 -0700
Date: Tue, 15 Sep 2026 12:52:21 +0200
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
Subject: Re: [PATCH net-next v6 14/14] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
Message-ID: <20260915105221.dn7xpsizv4o7xhg4@DEN-DL-M70577.microsemi.net>
References: <20260909-lan966x-pci-fdma-v6-14-6f48dab9d671@microchip.com>
 <178904555475.219967.711870735307370384@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178904555475.219967.711870735307370384@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_035229_697863_DC00BACB 
X-CRM114-Status: GOOD (  32.43  )
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
> Critical: 0 � High: 0 � Medium: 1 � Low: 0
> 
> - [Medium] The FDMA interrupt is hooked up (and thereby unmasked in the
>   OIC) long before any FDMA state exists.
> 
> --
> 
> misc: lan966x-pci: dts: add fdma interrupt to overlay
> 
> This adds OIC interrupt 14 as the "fdma" named interrupt to the lan966x
> PCI device tree overlay, so FDMA-based injection/extraction can be used
> when the switch is reached over PCIe.
> 
> > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > index 7bb726550caf..5bb12dbc0843 100644
> > --- a/drivers/misc/lan966x_pci.dtso
> > +++ b/drivers/misc/lan966x_pci.dtso
> > @@ -141,8 +141,9 @@ switch: switch@e0000000 {
> >
> >                                       interrupt-parent = <&oic>;
> >                                       interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
> > +                                                  <14 IRQ_TYPE_LEVEL_HIGH>,
> >                                                    <9 IRQ_TYPE_LEVEL_HIGH>;
> > -                                     interrupt-names = "xtr", "ana";
> > +                                     interrupt-names = "xtr", "fdma", "ana";
> 
> [Severity: Medium]
> With source 14 now named "fdma", platform_get_irq_byname(pdev, "fdma")
> starts succeeding on the PCIe path, and lan966x_probe() requests the
> handler right there:
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_main.c:lan966x_probe() {
>         lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
>         if (lan966x->fdma_irq > 0) {
>                 err = devm_request_irq(&pdev->dev, lan966x->fdma_irq,
>                                        lan966x_fdma_irq_handler, 0,
>                                        "fdma irq", lan966x);
>                 ...
>                 lan966x->fdma = true;
>         }
> }
> 
> Is this ordering safe?  The OIC maps and unmasks source 14 at
> devm_request_irq() time, but at that point no FDMA state exists yet:
> 
> - netif_napi_add()/napi_enable() only run later, from
>   lan966x_port_init() -> lan966x_fdma_netdev_init() in the per-port
>   probe loop, so lan966x->napi is still the zeroed devm_kzalloc()
>   memory and napi.poll is NULL.
> 
> - the DCB rings, the LLP/ATU windows and the FDMA_CTRL NRESET pulse are
>   all done even later, from lan966x->ops->fdma_init() ->
>   lan966x_fdma_pci_init().
> 
> If the OIC delivers an FDMA interrupt in that window, the handler
> schedules NAPI unconditionally:
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:lan966x_fdma_irq_handler() {
>         db = lan_rd(lan966x, FDMA_INTR_DB);
>         err = lan_rd(lan966x, FDMA_INTR_ERR);
> 
>         if (db) {
>                 lan_wr(0, lan966x, FDMA_INTR_DB_ENA);
>                 lan_wr(db, lan966x, FDMA_INTR_DB);
> 
>                 napi_schedule(&lan966x->napi);
>         }
> }
> 
> Can this then oops in __napi_poll(), either calling n->poll() while it
> is still NULL, or running lan966x_fdma_pci_napi_poll() against
> rx->fdma.dcbs == NULL and n_dcbs == 0, where fdma_has_frames() ->
> fdma_db_get() dereferences the dcbs array?
> 
> How reachable is that window in practice?  The series itself describes
> the card arriving with FDMA state from a previous boot.  The commit
> "net: lan966x: clear FDMA interrupt stickies after switch reset" says
> the stickies "sit in FDMA_INTR_ERR until the FDMA IRQ is requested later
> in probe, at which point the handler fires immediately and WARNs", and
> "net: lan966x: add shutdown callback to stop FDMA on reboot" says that
> on the endpoint "channels stay active and interrupt sources stay armed
> across the reset" and that "FDMA_INTR_ENA persists on the card across a
> warm reboot".
> 
> The sticky clear in lan966x_reset_switch() clears the latched bits at
> one instant, but does not mask FDMA_INTR_ENA/FDMA_INTR_DB_ENA and does
> not stop the channels.  After a reboot that skips device_shutdown()
> (panic reboot, kexec/kdump, watchdog warm reset with the card still
> powered), could a still-active channel latch FDMA_INTR_DB again after
> the clear and have it delivered as soon as source 14 is unmasked?
> 
> Would it be more robust to reset and mask the FDMA block (the
> FDMA_CTRL NRESET pulse that already exists in lan966x_fdma_pci_init(),
> plus clearing FDMA_INTR_ENA/FDMA_INTR_DB_ENA) before
> devm_request_irq(), or to request the FDMA IRQ only after fdma_init()
> has built the rings and added the NAPI instance?
> 

I think this is pre-existing. It can oops, both variants, and yes - a channel the
previous kernel left active can re-latch FDMA_INTR_DB before devm_request_irq()
unmasks the source. Your second suggestion is the right fix; the reset half of the
first is what fdma_init()'s NRESET pulse already does.

None of this originates here: the request has sat before netif_napi_add() and
ops->fdma_init() since c8349639324a ("net: lan966x: Add FDMA functionality"), and
the SoC device tree has named "fdma" since 2952d32c0611 ("ARM: dts: lan966x: add
switch node") - this patch adds one entry to an interrupt-names list. Nothing to
change in this patch; it goes to net with the same reorder as the MTU-change problem
earlier in the series.

> --
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com

