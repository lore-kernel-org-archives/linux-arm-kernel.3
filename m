Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E3FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdLU5FlPjLZids9/fOk7HaPVx/dxCMM0+2J5/0eK6uQ=; b=Qyju6XfBLNT/2f1pP2mVojFvVP
	E049rQAoMGLgyrTYh8rsx8sqk3dXALpPf5zLdqlOjbP/0eLFXB0+eXw16EWSC/lFQ/CAPRaXPWGY5
	7jWdvD+NalFa9YvXIsDGP7xApntwnfngEmnVaySHlGw9xU3ZpgZTCsTOu14phuLCfUTfAT3wt+Q6K
	Qo0Q/7TOF5qHNjrZt5Gq5AWoKeoBvhBA6Om0Fe7XhPMhrSWOscIwyawVjbXo0i77YcDx/YpTGKAuL
	2xkN4vvq1KthPcZ6Z8DPuERXs4r0cEkjD+f+51nk+fh6DJqO9gWkCCTLPe3mony0LKNInupvwRzmZ
	1z8+f7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDNe-00000000FJ8-0Y9Y;
	Tue, 19 May 2026 05:52:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDNc-00000000FIG-2tFc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:52:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10471601FD;
	Tue, 19 May 2026 05:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065E6C2BCB3;
	Tue, 19 May 2026 05:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779169955;
	bh=K7UKJ6sYP2y8DZracD2ty+9g+TETER+ES7eLcMmhpa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hle+rkwIjgCpLvvRebMQjZUD4RpHe4vaD/NMGctxBCcJgKhOh/KxmTkh1IEWPeE0o
	 HvgQadE+/aDUPAjYedw+3kXpGLh501Egr0d3XQUWNHNcZyIqtSmVCE+paU4g1TV3Yv
	 mqX0kdDhiSwhrU8Q3e5Fi/sXH0TVxvuGTvwmLtXk8la7G8uqONvLtzi2UxI5LEJ3V5
	 QK3zQ8TBGnDL3bLaILxx3Z9xPCMNObwlzppslIwRzOueLfLeqRiQf2T3Xdw2Ia2q5o
	 Vc4zt4fBuUlGStJjsL5LNl3L1MAKli7+a3rCiBXuW7D+4MmTZ4Baf+hdRTTcW1mFL4
	 fTuYlLiQaLyDA==
Date: Tue, 19 May 2026 11:22:26 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	Hongxing Zhu <hongxing.zhu@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V14 02/12] PCI: host-generic: Add common helpers for
 parsing Root Port properties
Message-ID: <xyued2adtz2fs47nnl537aef7rsjuhswivcaieh6lxhlxpohkr@gpxmdcpczik7>
References: <20260422093549.407022-3-sherry.sun@nxp.com>
 <20260513224944.GA341451@bhelgaas>
 <VI0PR04MB1211452312EB9BC6EF1ED2E0192032@VI0PR04MB12114.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI0PR04MB1211452312EB9BC6EF1ED2E0192032@VI0PR04MB12114.eurprd04.prod.outlook.com>
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

On Mon, May 18, 2026 at 08:42:38AM +0000, Sherry Sun wrote:
> > Subject: Re: [PATCH V14 02/12] PCI: host-generic: Add common helpers for
> > parsing Root Port properties
> > 
> > On Wed, Apr 22, 2026 at 05:35:39PM +0800, Sherry Sun wrote:
> > > Introduce generic helper functions to parse Root Port device tree
> > > nodes and extract common properties like reset GPIOs. This allows
> > > multiple PCI host controller drivers to share the same parsing logic.
> > >
> > > Define struct pci_host_port to hold common Root Port properties
> > > (currently only list of PERST# GPIO descriptors) and add
> > > pci_host_common_parse_ports() to parse Root Port nodes from device
> > tree.
> > >
> > > Also add the 'ports' list to struct pci_host_bridge for better
> > > maintain parsed Root Port information.
> > > ...
> > 
> > > +static int pci_host_common_parse_port(struct device *dev,
> > > +				      struct pci_host_bridge *bridge,
> > > +				      struct device_node *node)
> > > +{
> > > +	struct pci_host_port *port;
> > > +	int ret;
> > > +
> > > +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> > > +	if (!port)
> > > +		return -ENOMEM;
> > > +
> > > +	INIT_LIST_HEAD(&port->perst);
> > > +
> > > +	ret = pci_host_common_parse_perst(dev, port, node);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * 1. PERST# found in RP or its child nodes - list is not empty, continue
> > > +	 * 2. PERST# not found in RP/children, but found in RC node - return -
> > ENODEV
> > > +	 *    to fallback legacy binding
> > > +	 * 3. PERST# not found anywhere - list is empty, continue (optional
> > PERST#)
> > > +	 */
> > > +	if (list_empty(&port->perst)) {
> > > +		if (of_property_present(dev->of_node, "reset-gpios") ||
> > > +		    of_property_present(dev->of_node, "reset-gpio"))
> > > +			return -ENODEV;
> > 
> > This doesn't seem right to me.  The parser of per-Root Port properties should
> > not be responsible for deciding whether legacy methods are valid, i.e.,
> > whether a property is in the Root Complex node.  I think it's up to the caller
> > to decide whether it needs to look elsewhere.
> > 
> > I don't think this even needs to return a "success/failure" value because there
> > may be more properties in the future, and not all will be required.  This
> > function can't tell which properties a specific driver requires and which are
> > optional.
> > 
> > The caller can check whether we found what it needs and fall back to a legacy
> > method as needed.
> 
> Hi Bjorn,
> The code here was suggested by Mani, https://lore.kernel.org/all/lnzprzrdwra7pn7d6m3sbj5pvjy64blwpjl6i3lmlnfbyho63b@czpyhpgz5vum/.
> I think your suggestion here is reasonable, the per-Root Port parser shouldn't
> check the RC-level binding. That's a policy decision that belongs to the caller.
> 
> Hi Mani, if you also agree, I'll rework this so that:
> 1. pci_host_common_parse_port() only parses properties from the Root Port
>     (and its children) without checking the RC node.
> 2. The function won't return failure for "property not found" - it will only return
>      errors for real failures (e.g., -ENOMEM, GPIO acquisition errors).
> 3. The legacy fallback logic will be moved to the caller, which can inspect the
>      parsed result and decide whether to fall back to the legacy binding.
> 

Fine with me. The reason for suggesting fallback within this API itself was to
avoid duplicating the fallback code as it will be mostly generic. But I do agree
with Bjorn on the fact that individual host controller drivers might have
optional properties in the RC node and we can't incorporate all of them here.

But no need to rework this series as it got applied for v7.2. You can send
rework patches on top of this series.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

