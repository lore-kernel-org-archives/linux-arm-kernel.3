Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F0ACD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYnW73ZKhs2n9I9VR6JYqea1nGTPU1XrhWIbCV3+368=; b=z/jEjG66QXhCWCSfB0hLiK6DEZ
	KAxuJTb3VOKTCDOwFEoJ1IqyYWpwd28CAREzZaxaRN3fgG/STo+iSrpRgz2W2DdSJhUa5qsOtm4CU
	n6Ccn7wsYxFS5B7tZSBC7dt7BND+EzS8Sxf0bLTyfS8Z5ZBIeXcLHINhioSQLMXECOozP2uEMbXZQ
	NWsE0Yj/3n3RuFcDusqpA+x6fI7ZT+9rI15VXu7npuG/YzygLL6yFag0TgiB4oN4jSbmCxt5pyRJt
	nUqktWx1iUC8ehxZ1ylPhqSPGk79xI4qag2Tz9U8OSbQmHc1DjaM+iGsIetquuoU5Ic63NJBtLYuH
	Rtp4oouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfTB-00000001Yuf-06Ww;
	Wed, 06 May 2026 16:51:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfTA-00000001Yu9-0MvB;
	Wed, 06 May 2026 16:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E33F60252;
	Wed,  6 May 2026 16:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50D0C2BCC7;
	Wed,  6 May 2026 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086291;
	bh=2K5E0k7GqmHaKFpr4e85ybCWT1y0qN91EcgSjpPThu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5m2Gt/OO1X9cbBX03L+ZmgwGKZk9TL/jelC96b0qzb7PDqRpz7z6PFkXJPx2RJap
	 QDw9p/gXe8lHT43hCVkWxmWKUjpDO69eDmIhBudMKaDBoJatu+IvQyntVyAbP2sDGj
	 6/hBYQ1TIbwEMqfVTJn+0gsoqIJnf9oFTWMF9l9VVOHVIs5uIZmI5wnZ0m1GF/klWk
	 6gA5/KoPyzeMJ9Z9eSPK3LsVkcd/HP2y5jFaILcDI0mTd06EQaKE6bHVsDokxz+kL4
	 UhdHRsvV5OyDOMkFOCU7PYCC4HQjCWq85lw9SQxX2hVmJI16UzZWwGqmS2LZ0LoKOP
	 G9tKqrrD3jNBw==
Date: Wed, 6 May 2026 22:21:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] PCI: j721e: Set max_link_speed to enable 100 ms
 delay after link up
Message-ID: <5gx6bpy2i65ij44itdfhlrx3tbrbf2yybmhivryw6rmtwwocyr@ppew2wb4ft47>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-5-18255117159@163.com>
 <rlsvpbo4gcix3mmbfsxvmfebnnn4bqm3cv34x4qkxuv3zwydnm@ehi3el63z664>
 <53e37127-975b-42cd-a1a2-35dd3018c45c@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53e37127-975b-42cd-a1a2-35dd3018c45c@163.com>
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

On Thu, May 07, 2026 at 12:11:22AM +0800, Hans Zhang wrote:
> 
> 
> On 5/7/26 00:04, Manivannan Sadhasivam wrote:
> > On Wed, May 06, 2026 at 11:23:42PM +0800, Hans Zhang wrote:
> > > Set cdns_pcie.max_link_speed to the maximum supported link speed
> > > (obtained from the device tree property "max-link-speed") in
> > > j721e_pcie_set_link_speed(). This activates the post-link delay logic
> > > added in cdns_pcie_host_start_link() when the controller supports
> > > speeds greater than 5 GT/s.
> > > 
> > > As required by PCIe r6.0 sec 6.6.1, and following the same approach as
> > > commit 80dc18a0cba8d ("PCI: dwc: Ensure that dw_pcie_wait_for_link()
> > > waits 100 ms after link up"), this ensures a 100 ms delay after link
> > > training completes before any Configuration Request is sent.
> > > 
> > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > ---
> > >   drivers/pci/controller/cadence/pci-j721e.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > > index bfdfe98d5aba..ee85b8e04f5b 100644
> > > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > > @@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
> > >   	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
> > >   		link_speed = 2;
> > > +	pcie->cdns_pcie.max_link_speed = link_speed;
> > 
> > What about other glue drivers?
> 
> Hi Mani,
> 
> pci-sky1.c:
> There is no time to handle the corresponding DTS yet, and the attribute
> "max-link-speed" has not been parsed either. There will be a plan for the
> subsequent upstream.
> 
> pcie-sg2042.c：
> I'm not familiar with this product.
> 

Since this helper gets called unconditionally for all glue drivers, not setting
'max_link_speed' would cause 100ms delay for all link speeds.

So either set 'max_link_speed' for all drivers, or call the helper directly from
glue drivers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

