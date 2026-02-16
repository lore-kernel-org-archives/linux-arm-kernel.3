Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDE0E81A40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpEX3ehZPTvsZP4gkkPPg/6VHi3iz7xJ7MiP8D1uQ74=; b=M5Ug0Ra+C6C0RYAHWT1RTkP95E
	9RYOOjqoBuF0sTmOq7aMjMxPSgbaiNkXpjdrg2MpzWuHilZgNK+8Aaa9VHkJwDH+dhwVA3nzJaJg4
	hJZennS4pdrIujrCDsexBP90+4WdhI3y34j83N2I7TygdFVK/fxmfWQiFHemXRie4GH5rE9h8XRlG
	3opLXtDI/lNbQLqi3t40fMPLatWD0x7olYmyqNwWEKtU1DnHo31/ophhvUrN3TotKbqS+dew5uIb4
	TG5iwywba1Z31O90N5mb2D/Vr8YASn3r4nvyldql3pBZU7MEceuhgoJD3Tn0Egu887gJzK4H7/pM7
	z4X6SdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Q6-000000071fL-1G8p;
	Mon, 16 Feb 2026 16:25:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Q3-000000071c2-0mSJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Feb 2026 16:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zpEX3ehZPTvsZP4gkkPPg/6VHi3iz7xJ7MiP8D1uQ74=; b=UiAqB1yCxo3KF4uahH7W0U9g/Z
	ZLmolzzNUu4Al/0QX3vandnRaR/aZt/T/Rwoae7cc1LWdA3bD58W3fnqRTxu8OiUU040TVvFgctkl
	T9De37sWDmkXHwNW1u2ddGlGJ8gtTVwyk7QckiSqrXNgFMjLZqlSdS/5varaNBig9cRKFgggXAeu0
	wlgGQwNBKxh0zgmj529Fw6GlQBArEOQFmUO+0c7X00riZyvy03PjStqQaAn97wEOyV1emlVjUj2Ui
	GTO8wjFV33AV3I/12nKT9mGkRrUTcUMj7o8zaP/3SRzy55N2DKMBsHLeF1qgXO6xjptMcOa8nV2LQ
	riM6Xl6Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1Q0-0000000ErMW-1Erb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4407C4434D;
	Mon, 16 Feb 2026 16:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DE2C116C6;
	Mon, 16 Feb 2026 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771259147;
	bh=1TdioR8FnQTdDm82rwBeRHYCvAui4kNi9uauXUkTD+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PqG0+0JJIHhN88iFpGAUKzkfebgoZc/5h4WeFN1JyACf0xTLktrs0xynTH6dIHJ7I
	 vgTlxuPl4lrK3dIU52n5LIzA4Stj9FhamImA2Y3HlAy59uvvMLL6AXmXRjBYGxQXxq
	 cYF66/QvXHMzprFWO3oeQ2d6c7/MDSZQEJ8Y0JZiFTBNSFO+NY26mon2CjCR8hEpuQ
	 pxKi95ECxvp3/Vg5ZCDIDqlxEKmk/m7cUpdb0zNftefmzDuKpWFdgEZUwhjFA8Ha1e
	 KASyaP9QtMhMMSXHzjjzA0BaJ2SwFluujuHRk7yhx1wOa/lrrNtkqgeLIqUJE8FeKv
	 ToET9ctbzy70A==
Date: Mon, 16 Feb 2026 21:55:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Sherry Sun <sherry.sun@nxp.com>, hongxing.zhu@nxp.com, 
	l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 03/12] PCI: dwc: Allow external allocation of
 pci_host_bridge
Message-ID: <ojqdb7ysx2ktosahpb2mm4uog3oijc7ni7xnz63xjjvy2fdcyg@upmxt7oxv6sr>
References: <20260213040852.3340547-1-sherry.sun@nxp.com>
 <20260213040852.3340547-4-sherry.sun@nxp.com>
 <aY9DSPaTCMhcR8GC@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY9DSPaTCMhcR8GC@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_162552_582246_1BD82330 
X-CRM114-Status: GOOD (  19.77  )
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

On Fri, Feb 13, 2026 at 10:29:12AM -0500, Frank Li wrote:
> On Fri, Feb 13, 2026 at 12:08:43PM +0800, Sherry Sun wrote:
> > Currently, dw_pcie_host_init() always allocates a new pci_host_bridge
> > structure internally using devm_pci_alloc_host_bridge(). This prevents
> > drivers from pre-allocating the bridge structure when needed.
> >
> > Modify dw_pcie_host_init() to check if pp->bridge is already set. If
> > set, use the pre-allocated bridge instead of allocating a new one. This
> > maintains backward compatibility with existing drivers that don't set
> > pp->bridge, while allowing new drivers to pre-allocate when needed.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 6ae6189e9b8a..c2de9830e1e9 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -575,11 +575,15 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >
> >  	raw_spin_lock_init(&pp->lock);
> >
> > -	bridge = devm_pci_alloc_host_bridge(dev, 0);
> > -	if (!bridge)
> > -		return -ENOMEM;
> > +	if (!pp->bridge) {
> > +		bridge = devm_pci_alloc_host_bridge(dev, 0);
> 
> It'd better call parse port here, or in devm_pci_alloc_host_bridge().
> 

Agree. We should try to avoid calling devm_pci_alloc_host_bridge() from glue
drivers.

- Mani

> If that, needn't check pp->bridge.
> 
> Frank
> > +		if (!bridge)
> > +			return -ENOMEM;
> >
> > -	pp->bridge = bridge;
> > +		pp->bridge = bridge;
> > +	} else {
> > +		bridge = pp->bridge;
> > +	}
> >
> >  	ret = dw_pcie_host_get_resources(pp);
> >  	if (ret)
> > --
> > 2.37.1
> >

-- 
மணிவண்ணன் சதாசிவம்

