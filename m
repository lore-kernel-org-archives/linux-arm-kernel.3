Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F754CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX2BpxvDPdOOusTWC31XxGnyftfbM4DWjxTo9mGkzUM=; b=E2paoweUtuuqWMJ1fV85I6Tdf9
	6IvqvtITECivR2tfCUwnR5y1vr7MReSbMDpiABnSxcEdIW86hpe/BnkFl8ENTbAOKXNhWbwwtlo9F
	4ZpWPw1LygXePIsgqIrG5EcpblZNTPSDbkuQKm3CtkcDoQOunrr5Y5LuaYwD07sD09MYc+ERLkkTw
	T9T3TWyrkoF8oGSZG1lT/AEuWg7Ln9YSCEJPUasjkCnVmiI/J/PXB9Y5tdfbGB7CPMsT6b4p6qF0F
	48IvRDoRoYzuYi4Ibauoc2B27+FrfuZiVSJn9vCc/jvG1dT4cz+ixjwFTJNT6VXIIT6181uihWk0/
	I5dcn2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZNv-0000000B76g-0S9V;
	Fri, 02 Oct 2026 09:16:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZNr-0000000B75F-3zrT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790932611; x=1822468611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GfB4AangzbGer9ZinOHaC9/Iw6vF2BIgUKhcXiugwjs=;
  b=Wit8YHmB5ovBBYZL7nsbfW+T/YTOM2yCMDh+pxyHRSRiuM3ToXz0QCDE
   gEDlC0nx6891aVg727I17lEjrGnlBR2gbFJ3odtrl9dMt4hpVGoz347gN
   /bWRgOCd61gZV4OxrqNRfdFPpi6j5X72Aoev9maTCraAldU6Jzk6bugf8
   9QibypLoWQSkPR8Q77J2Sj2E06a7bqaKqmcQpP4mZKG/0+S7JAH8x2v2U
   7tgbWM+Nz1NZ+6Sb4VF4yg/lIoyqrGERGUZZrTuh3s/NP82YdBBdcNPMN
   15xT3iKsI4/xqoMHpGzfIOV+CFt3ix/gILkXrEXkB0HUqT6KQUjI+SVs6
   A==;
X-CSE-ConnectionGUID: 1B6BoPspRIaa6wrCNHZR3Q==
X-CSE-MsgGUID: ZvhM4zZUR1OcZNmWWtJ1aA==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="63547603"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:16:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 2 Oct 2026 02:16:50 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 02:16:46 -0700
Date: Fri, 2 Oct 2026 11:16:45 +0200
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
Subject: Re: [PATCH net-next v9 15/15] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
Message-ID: <20261002091645.tbhmk64qsf5wllni@DEN-DL-M70577>
References: <20260928-lan966x-pci-fdma-v9-15-a17caf60f89a@microchip.com>
 <179092642540.434549.1993526526960644611@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179092642540.434549.1993526526960644611@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021652_059786_BF64B009 
X-CRM114-Status: GOOD (  33.77  )
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
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Once this overlay adds the "fdma" interrupt, PCIe instances
>   use lan966x_fdma_pci_ops, and a teardown ordering bug in that backend…
> 
> --
> 
> misc: lan966x-pci: dts: add fdma interrupt to overlay
> 
> This commit adds the fdma interrupt (OIC interrupt 14) to the lan966x PCI
> device tree overlay. This turns on FDMA-based frame injection and extraction
> when the switch is connected over PCIe.
> 
> > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > index 7bb726550cafd..5bb12dbc08431 100644
> > --- a/drivers/misc/lan966x_pci.dtso
> > +++ b/drivers/misc/lan966x_pci.dtso
> > @@ -141,8 +141,9 @@ switch: switch@e0000000 {
> >  
> >  					interrupt-parent = <&oic>;
> >  					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
> > +						     <14 IRQ_TYPE_LEVEL_HIGH>,
> >  						     <9 IRQ_TYPE_LEVEL_HIGH>;
> > -					interrupt-names = "xtr", "fdma", "ana";
> > +					interrupt-names = "xtr", "fdma", "ana";
> 
> [Severity: Medium]
> Once the "fdma" interrupt is present, PCIe instances use
> lan966x_fdma_pci_ops. Does that make a teardown ordering problem in the PCIe
> FDMA backend reachable?
> 
> lan966x_remove() tears down the FDMA before it unregisters the netdevs:
> 
> lan966x_main.c:lan966x_remove() {
>     ...
> 	lan966x->ops->fdma_deinit(lan966x);
> 	lan966x_cleanup_ports(lan966x);
>     ...
> }
> 
> lan966x_fdma_pci_deinit() disables NAPI and frees both rings. It does not
> clear lan966x->rx.lan966x, it does not detach the netdevs, and rtnl is not
> held at this point:
> 
> lan966x_fdma_pci.c:lan966x_fdma_pci_deinit() {
> 	if (lan966x->fdma_ndev)
> 		napi_disable(&lan966x->napi);
>     ...
> 	fdma_free_coherent_and_unmap(lan966x->dma_dev, &lan966x->rx.fdma);
> 	fdma_free_coherent_and_unmap(lan966x->dma_dev, &lan966x->tx.fdma);
> }
> 
> fdma_free_coherent_and_unmap() only clears atu_region, so dcbs and dma
> still hold their old values.
> 
> netif_set_mtu_ext() only checks netif_device_present(). That means an MTU
> change that alters the max frame size can still run during this window:
> 
> lan966x_port_change_mtu()
>   lan966x_fdma_pci_resize()
>     __lan966x_fdma_pci_reload()
>       lan966x_fdma_pci_reload()
>         napi_disable(&lan966x->napi)
> 
> The resize guard is only this check:
> 
> 	if (!lan966x->rx.lan966x)
> 		return 0;
> 
> rx.lan966x is still non-NULL after deinit. Would the second napi_disable()
> on an already disabled NAPI spin forever while holding rtnl? That would also
> block the unregister_netdev() that lan966x_remove() calls next.
> 
> The probe error path in lan966x_fdma_pci_init() looks like it has a similar
> gap:
> 
> 	err = lan966x_fdma_pci_tx_alloc(&lan966x->tx);
> 	if (err) {
> 		fdma_free_coherent_and_unmap(lan966x->dma_dev, rx_fdma);
> 		return err;
> 	}
> 
> rx.lan966x has already been set earlier in lan966x_fdma_pci_init(). The
> netdevs registered by lan966x_probe_port() stay live until the cleanup_ports
> label.
> 
> If an MTU change arrives in that window, NAPI is still enabled from
> lan966x_port_init(). lan966x_fdma_pci_reload() then allocates new rings and
> does:
> 
> 	fdma_free_coherent_and_unmap(lan966x->dma_dev, &rx_fdma_old);
> 
> Is this a second dma_free_coherent() of the RX ring that the error path
> already freed?
> 
> After that, reload re-arms the FDMA on the new rings. The probe error path
> never calls fdma_deinit for them. Would the coherent memory for the new rings
> leak, with the outbound ATU windows still mapped and DMA active after probe
> fails?
> 
> The resize guard added in "net: lan966x: add PCIe FDMA MTU change support"
> is meant to skip the resize until lan966x_fdma_pci_init() has built the
> rings. It doesn't seem to cover rings that were torn down or only partly
> built.
> 
> The shutdown callback from "net: lan966x: add shutdown callback to stop the
> FDMA on reboot" avoids this by taking rtnl and calling netif_device_detach()
> so that ndo_open and ndo_change_mtu can't re-enter the FDMA. Should the
> remove and probe error paths get the same protection?
> 
> The platform backend already has the same remove ordering. The PCIe deinit,
> resize and reload code is new in this series, though, and this overlay change
> is what first makes it reachable.
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928-lan966x-pci-fdma-v9-0-a17caf60f89a%40microchip.com

Pre-existing. Lan966x_remove() is a platform function. It's a re-raise of v7
11/14 / v8 15/15, the probe/remove ordering. The issue is real, but out-of-scope
for this series.


