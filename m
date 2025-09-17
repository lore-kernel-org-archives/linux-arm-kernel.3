Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96C6CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cn+PA3pp4H1jMyxkMP93w1hpd3bHpFTIKgV93PTzHCg=; b=4jVIwC8PYUlZNY
	UIFA1FhgaavE55HWybVx/Ne+PGd6Ylx06X5ID2HzHJPZFbAK3kMeTmpf8EeNDlN97NGNLT2ilObsd
	b+sMAudk3FQFuc1gSPyHM/Qbkb5Y0p5uUSB8vG3q9C+WcnSX/qVx/EMX2m05180dibgpg9ZNzSNKJ
	A5IhdNK5QiJ4nBXojX/9q/w3xN7bBagAJ2kKKjKq8R1CLBTs+Bmm2VOJXV52ls4ibr/DW/B9h6Sl5
	maalZZrTjYcxl5wagjA+88mtMa/5md17xCGsXxeyCADuaOuJG0Z0t/VmuvK8E0Dzx4gicmS5x7FlT
	f29slr0I8vYugjzAF4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzhc-0000000EvLK-2xyM;
	Wed, 17 Sep 2025 21:28:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzhc-0000000EvKe-0J3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B9FB601E9;
	Wed, 17 Sep 2025 21:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92193C4CEE7;
	Wed, 17 Sep 2025 21:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758144514;
	bh=sXeuIQMjL3ij8K65U8iZCGwbM5nnx/S7lPAqmUslGis=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bHvd1OUm79r3XEeX6f8axMNEa0NGPaqKHC9jl1m7C+c0nonFO2VZoF6uksqnhj59f
	 4fUfAP+VPXo+8qfg+E/5sszwLGo572XdGdc++XSGEkZi2/iceZkeBB7gVzuCKAgX8P
	 eeVrQjhLjrtUoMlHTmlEA8hoFRLL3jcvBYMw6FWP/+mHfgtn5q5R+ODbra9qR8z6Rr
	 5BtBboj5xHGS9PaZNd4gK8GT9nntFNsfr9ySCGXyAHYsWxmagjBTRylsJG3vmqdxC6
	 rdsHUjs0cQkCqlPepE7v2TZmrpvuFbRRg0QGPJlhUY+6x959gdEIyAQX5Ueh+gsRlM
	 sq0tsUpoiYN3A==
Date: Wed, 17 Sep 2025 16:28:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, chester62515@gmail.com,
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
Message-ID: <20250917212833.GA1873293@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e236uncj7qradf34elkmd2c4wjogc6pfkobuu7muyoyb2hrrai@tta36jq5fzsr>
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

On Wed, Sep 17, 2025 at 10:41:08PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Sep 16, 2025 at 09:23:13AM GMT, Bjorn Helgaas wrote:
> > On Tue, Sep 16, 2025 at 10:10:31AM +0200, Vincent Guittot wrote:
> > > On Sun, 14 Sept 2025 at 14:35, Vincent Guittot
> > > <vincent.guittot@linaro.org> wrote:
> > > > On Sat, 13 Sept 2025 at 00:50, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > > > > > Describe the PCIe controller available on the S32G platforms.
> > 
> > > > > > +                  num-lanes = <2>;
> > > > > > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > > > >
> > > > > num-lanes and phys are properties of a Root Port, not the host bridge.
> > > > > Please put them in a separate stanza.  See this for details and
> > > > > examples:
> > > > >
> > > > >   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/
> > > >
> > > > Ok, I'm going to have a look
> > > 
> > > This driver relies on dw_pcie_host_init() to get common resources like
> > > num-lane which doesn't look at childs to get num-lane.
> > > 
> > > I have to keep num-lane in the pcie node. Having this in mind should I
> > > keep phys as well as they are both linked ?

> > Huh, that sounds like an issue in the DWC core.  Jingoo, Mani?
> > 
> > dw_pcie_host_init() includes several things that assume a single Root
> > Port: num_lanes, of_pci_get_equalization_presets(),
> > dw_pcie_start_link() are all per-Root Port things.
> 
> Yeah, it is a gap right now. We only recently started moving the DWC
> platforms to per Root Port binding (like Qcom).

Do you need num-lanes in the devicetree?
dw_pcie_link_get_max_link_width() will read it from PCI_EXP_LNKCAP, so
if that works maybe you can omit it from the binding?

If you do need num-lanes in the binding, maybe you could make a Root
Port parser similar to mvebu_pcie_parse_port() or
qcom_pcie_parse_port() that would get num-lanes, the PHY, and
nxp,phy-mode from a Root Port node?

Then all this would be in one place, and if you set ->num_lanes there
it looks like the DWC core wouldn't do anything with it.

