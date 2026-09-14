Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6133C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0ItK3SnsZLhpkm8nRo5TKy/IR0j9i9PKGAzD/m1q8I=; b=CHDvC6ojpqpQ+4Gtkgq5NupvZF
	RJTC3HmMQ1+xD3Dd5pyRomBfrgHJDBNeDrUhDPy42VLtyOV8naaG3RiJpiGwUILYg7vmbzwdh4Xj4
	yD8DPf5pXY9tBD37crR6h75VTYUgBvMeQFfyknx+akid9x1OPH1CdP8WplYulpHlcqabK1zQb+9oy
	JosBRiSzExxqvzUgsGRKVG+KPdBXwxc0zMSzAblt1mRz0E0u87aVYLIn40TizwvpDlAvwQO+YR8gb
	B76bLwbGcc8Sa984fIAFwlC/eTVEiGCE0TQLMwLXJqaZlf3R2kGqfl1c5Hutw8+KwGqDZNPv+LVCK
	R2kGOpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67NR-00000003vje-1z12;
	Mon, 14 Sep 2026 14:09:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67NO-00000003viF-1z1g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 14:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789394982; x=1820930982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kXyZcf9mVRUP9nMLt2/MVgHhc0OPsuWGYpRhhFqEPKc=;
  b=H5tGliN43eeNCQVOifKg7mB6SrR+Cj1I8gAUeq/JhaDBZMIdjMMbRSvD
   hx7AQU1DtxgExhvejjB8OTYCxj6vEuYXU2Vhypli95yHoLICdRgwXlMB7
   U5aLNphzIbOpXTHI/WJNjKBLAORoCvkJzCr848JLV6ySTlfMaSFhEaq2q
   Xz3w66fElyHahc93MHBAOdYvCOhdyrvMMyDwBtCaGBIx+7bZE++fItaFF
   sAj9EuscyMpgAPICz+IZFMhlOdQEUzGK8gKMZ8Z+19So8N/RntGNWebTf
   KPh4hD2Q697Vbo1Q/o6eodt4HBWWKdr8cV3/B5RqcT6DxW0TZc4d39UK5
   w==;
X-CSE-ConnectionGUID: rVLQJSZ6ShGlku+t+zZqfg==
X-CSE-MsgGUID: +9pA80GKSjCe+q/7ZmKqbQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="62642258"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2026 07:09:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 14 Sep 2026 07:09:40 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 14 Sep 2026 07:09:36 -0700
Date: Mon, 14 Sep 2026 16:09:36 +0200
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
Subject: Re: [PATCH net-next v6 08/14] net: lan966x: clear FDMA interrupt
 stickies after switch reset
Message-ID: <20260914140936.kqsqxbovxvsihv42@DEN-DL-M70577>
References: <20260909-lan966x-pci-fdma-v6-8-6f48dab9d671@microchip.com>
 <178904554399.219967.11177166628090236711@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178904554399.219967.11177166628090236711@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_070942_547661_254E94F4 
X-CRM114-Status: GOOD (  31.26  )
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
> Critical: 0 · High: 0 · Medium: 0 · Low: 1
> 
> - [Low] Commit-message/comment vs. reachability at this revision: the
>   added FDMA sticky clear in lan966x_reset_switch()…
> 
> --
> 
> net: lan966x: clear FDMA interrupt stickies after switch reset
> 
> The patch acks FDMA_ERRORS, FDMA_INTR_ERR and FDMA_INTR_DB right after
> reset_control_reset() in lan966x_reset_switch(), so that spurious sticky
> bits latched by the GCB soft reset in PCI mode do not make the FDMA IRQ
> handler fire as soon as the IRQ is requested. The clear is unconditional and
> is described as a no-op on the platform path.
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > index 6e6c08bb8eea..11094a381ec2 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> > @@ -1067,6 +1067,15 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
> >
> >       reset_control_reset(switch_reset);
> >
> > +     /* When in PCI mode, the GCB soft reset issued by the reset
> > +      * controller can latch spurious bits in the FDMA error stickies.
> > +      * Clear them before request_irq hooks up the FDMA IRQ line,
> > +      * otherwise the handler fires immediately on probe.
> > +      */
> > +     lan_wr(lan_rd(lan966x, FDMA_ERRORS), lan966x, FDMA_ERRORS);
> > +     lan_wr(lan_rd(lan966x, FDMA_INTR_ERR), lan966x, FDMA_INTR_ERR);
> > +     lan_wr(lan_rd(lan966x, FDMA_INTR_DB), lan966x, FDMA_INTR_DB);
> 
> [Severity: Low]
> This isn't a bug in the register writes themselves, but is the failure
> described in the changelog reachable at this point in the series?

No, but this is a preparation patch that makes sure that once the FDMA support
lands, in a later patch, the failure is not introduced.

> 
> The commit message says the latched bits "sit in FDMA_INTR_ERR until the FDMA
> IRQ is requested later in probe, at which point the handler fires immediately
> and WARNs". In lan966x_probe() the FDMA handler is only installed when a named
> "fdma" interrupt exists:
> 
>         lan966x->fdma_irq = platform_get_irq_byname(pdev, "fdma");
>         if (lan966x->fdma_irq > 0) {
>                 err = devm_request_irq(&pdev->dev, lan966x->fdma_irq,
>                                        lan966x_fdma_irq_handler, 0,
>                                        "fdma irq", lan966x);
>                 ...
>                 lan966x->fdma = true;
>         }
> 
> At this commit the PCI overlay in drivers/misc/lan966x_pci.dtso does not
> describe that interrupt:
> 
>         interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
>                      <9 IRQ_TYPE_LEVEL_HIGH>;
>         interrupt-names = "xtr", "ana";
> 
> so platform_get_irq_byname(pdev, "fdma") fails and lan966x_fdma_irq_handler()
> is never requested on the PCI path.
> 
> The overlay also disagrees with the positional list in
> Documentation/devicetree/bindings/net/microchip,lan966x-switch.yaml, where the
> second entry is reserved for "fdma":
> 
>         interrupt-names:
>           minItems: 1
>           items:
>             - const: xtr
>             - const: fdma
>             - const: ana
> 
> Both points are resolved later in the same series by "misc: lan966x-pci: dts:
> add fdma interrupt to overlay", which switches the overlay to
> interrupts <12>,<14>,<9> and interrupt-names = "xtr", "fdma", "ana", so this is
> only an observation about the ordering of the changelog against the code state
> here rather than an actionable defect.
> 
> Would it help to mention in the commit message that the WARN only becomes
> reachable once the overlay gains the "fdma" interrupt?

The changelog already scopes itself with "When in PCI mode".

> 
> >       /* Don't reinitialize the switch core, if it is already initialized. In
> >        * case it is initialized twice, some pointers inside the queue system
> >        * in HW will get corrupted and then after a while the queue system gets
> 
> --
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-lan966x-pci-fdma-v6-0-6f48dab9d671%40microchip.com

