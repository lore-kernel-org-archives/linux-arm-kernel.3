Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E29CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqcvqiOIQW3HFLLVQYjxb9TRnEvhoxIYIMdzlNlxboQ=; b=qWd19ZTsKW7wCTvVFgBaaYBaEo
	9PcKwCJat0lowVIe0zSgXKJ14AzoGq9v96uq1RWoSRa7xX8Y3GAQPfx47eEwrZ/UUbLgu/7xpBQ7p
	R/Ka5oirVZoKPnNqYUrDOxhWt8v186eE6emhaMqmLmcy1ZoO9F+zx92dzzmOfYzvxjEPFwbRa7mXk
	k8pPgHFAAmbMcXXN9Popn0z/xoCMkV0ZCEtRq52BxyQmQlH46uT8DT8BbU+HAbp8heSF1yTGLKQx6
	+Vmc1OoJ72y2PmWAbmec1kt8pOTyo+AOPrlIvv3ABXtpzSCFvq3ziOLkzR/zXRvO/COKfV3PhSCb/
	0mUlt24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvXv-0000000FnTF-0pak;
	Mon, 17 Nov 2025 09:29:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvXs-0000000FnSt-39dp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB6D9439C3;
	Mon, 17 Nov 2025 09:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E040C4CEFB;
	Mon, 17 Nov 2025 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763371751;
	bh=EvfhddzpSjAUpbk6cAJyWuqhfd5As3u/pK+Q9MjlPCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s16gOmgGUVKPAqiWs++keSoec+8iplKd+ZA9c8CDc2VzfqMtJrvxEMaDUSkjFleol
	 62idgoBXux7xRBcbcaQeTCv8H1Evpz6gjxCa+gKuF3plPK4BO//7UwHc1L2Z/tWsay
	 o45oCTnOdifacpFCrKPTGoD6/Mc0wNGMEzfZjYavJDdvGwIiHmytTDTdB/gaZexbcE
	 4S8j3/Zu7jIq4tkZTgd9SgYjglZKH8LqfIZCzcfhuJejTUPwe3Ex/nvS4LCE0P+KAC
	 P+hppMncliPGWnBN3H/JeNcRVAIechrv7o/RHeB09M2+m4Ens6eiCEktgeuU24jlkg
	 cZCnkHf5xuWNA==
Date: Mon, 17 Nov 2025 14:58:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, bhelgaas@google.com, Chen Wang <unicorn_wang@outlook.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, stable@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH] PCI: cadence: Kconfig: change PCIE_CADENCE configs from
 tristate to bool
Message-ID: <k4yatufwwibauqxmm2nv6bh4clckk2j2xnpc2o5zjjpk7j7phk@ihrd2rsqdm64>
References: <20251113092721.3757387-1-s-vadapalli@ti.com>
 <084b804f-2999-4f8d-8372-43cfbf0c0d28@app.fastmail.com>
 <250d2b94d5785e70530200e00c1f0f46fde4311b.camel@ti.com>
 <201b9ad1-3ebd-4992-acdd-925d2e357d22@app.fastmail.com>
 <7eaa4d917f7639913838abd4fd64ae8fe73a8cfc.camel@ti.com>
 <37f6f8ce-12b2-44ee-a94c-f21b29c98821@app.fastmail.com>
 <8ac2ed36a85f854a54ee1d05599891632087869d.camel@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ac2ed36a85f854a54ee1d05599891632087869d.camel@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_012912_835210_E0F368A3 
X-CRM114-Status: GOOD (  27.47  )
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

On Mon, Nov 17, 2025 at 02:53:00PM +0530, Siddharth Vadapalli wrote:
> On Mon, 2025-11-17 at 10:06 +0100, Arnd Bergmann wrote:
> > On Mon, Nov 17, 2025, at 07:05, Siddharth Vadapalli wrote:
> > > On Fri, 2025-11-14 at 08:03 +0100, Arnd Bergmann wrote:
> > > > On Fri, Nov 14, 2025, at 06:47, Siddharth Vadapalli wrote:
> > 
> > > I understand that the solution should be fixing the pci-j721e.c driver
> > > rather than updating Kconfig or Makefile. Thank you for the feedback. I
> > > will update the pci-j721e.c driver to handle the case that is triggering
> > > the build error.
> > 
> > Ok, thanks!
> > 
> > I think a single if(IS_ENABLED(CONFIG_PCI_J721E_HOST)) check
> > is probably enough to avoid the link failure
> > 
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > @@ -669,7 +669,8 @@ static void j721e_pcie_remove(struct platform_device *pdev)
> >         struct cdns_pcie_ep *ep;
> >         struct cdns_pcie_rc *rc;
> >  
> > -       if (pcie->mode == PCI_MODE_RC) {
> > +       if (IS_ENABLED(CONFIG_PCI_J721E_HOST) &&
> > +           pcie->mode == PCI_MODE_RC) {
> >                 rc = container_of(cdns_pcie, struct cdns_pcie_rc, pcie);
> >                 cdns_pcie_host_disable(rc);
> > 
> > 
> > but you may want to split it up further to get better dead
> > code elimination and prevent similar bugs from reappearing when
> > another call gets added without this type of check.
> > 
> > If you split j721e_pcie_driver into a host and an ep driver
> > structure with their own probe/remove callbacks, you can
> > move the IS_ENABLED() check all the way into module_init()
> > function.
> 
> Thank you for the suggestion :)
> 
> Would it work if I send a quick fix for `cdns_pcie_host_disable` using
> IS_ENABLED in the existing driver implementation and then send the
> refactoring series later? This is to resolve the build error quickly until
> the refactoring series is ready.
> 

This will work for me so that this fix can be backported.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

