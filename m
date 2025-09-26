Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82368CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 20:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=aZ889yD17b+aZV+N9EdJg5U6DjkfbLmdfsctr+C9ub0=; b=oKn+ftw5m6e8b5
	JyXDLvmoDKBxrhPqYrvu81LG7h4Xmfi49btODlouTYV7ZS2TGXIB/RWA+Bi/wTiC1CmbGzkemKNuQ
	iuTr0IZxPq4S+PIiuNzMntjP34rsG2pI+ytXtJHowLtG+HUUkMZoHKIYv6oJdzAIxeFEIWte41tX8
	9DrKllx+NqRxv60nagCXf8g6SD1I+Wm0rK/2p51Y/FsO2bYkRtXHi+HhfFQvdlEbtkUEFsSZzaPAg
	56wFzaeiehc5YiSrs5KmrT0THQiBp3YKMS0Eg1BGz3q3RAazZkUs5PyMw64sEtq1RM1Hh/MXtmPI6
	PBOKsYAQ2qBR9NOHErWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Ezb-00000004H0d-0tS1;
	Fri, 26 Sep 2025 20:24:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2EzZ-00000004Gzx-3Fpl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 20:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D30E601AB;
	Fri, 26 Sep 2025 20:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A293AC4CEF4;
	Fri, 26 Sep 2025 20:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758918272;
	bh=/MPD/u4t2P88SZ2+0r0a12nQc9p4Xw3KAEkXXioGITQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cvLnz60zbKZb2fagJbMrNIq5h1vEz+TsG3+VLKWlS+EkGFq9lSd+y5NzIKBRInoJH
	 GRksN1MO0P61n+VCf0HLJObhdgc4SAcvL7Vs/WMDdZoKDZpCln+WXpm2HbbueDUDcf
	 8F43oTrr4HwXk0a7qfhLhWLzx8KMe9gSuPcOMidSmtXT4ShZrXOsXgGWERt9WKDOLd
	 duBN12/yE6HX5kGbc2bv0HsWRschDz/H2L4JPsbjt/995NiCaP4zVwRdMSTrKl28gH
	 /NqWmg/Mg5XwkljYXlovgzg6M64J47OzsIAofLz5qMLEs843Nx5rCMCyFza99aGwpp
	 iSw4JaArBXwKQ==
Date: Fri, 26 Sep 2025 15:24:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] PCI: imx6: Add a method to handle CLKREQ#
 override active low
Message-ID: <20250926202431.GA2264754@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB88335EEF20BA7FCF723F81208C1EA@AS8PR04MB8833.eurprd04.prod.outlook.com>
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

On Fri, Sep 26, 2025 at 03:23:43AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>

> > On Fri, Sep 26, 2025 at 02:19:37AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas <helgaas@kernel.org> On Tue, Sep 23, 2025 at
> > > > 03:39:13PM +0800, Richard Zhu wrote:
> > > > > The CLKREQ# is an open drain, active low signal that is driven low
> > > > > by the card to request reference clock. It's an optional signal
> > > > > added in PCIe CEM r4.0, sec 2. Thus, this signal wouldn't be
> > > > > driven low if it's reserved.
> > > > >
> > > > > Since the reference clock controlled by CLKREQ# may be required by
> > > > > i.MX PCIe host too. To make sure this clock is ready even when the
> > > > > CLKREQ# isn't driven low by the card(e.x the scenario described
> > > > > above), force CLKREQ# override active low for i.MX PCIe host
> > > > > during initialization.
> > > > >
> > > > > The CLKREQ# override can be cleared safely when supports-clkreq is
> > > > > present and PCIe link is up later. Because the CLKREQ# would be
> > > > > driven low by the card at this time.
> > > >
> > > > What happens if we clear the CLKREQ# override (so the host doesn't
> > > > assert it), and the link is up but the card never asserts CLKREQ#
> > > > (since it's an optional signal)?
> > > >
> > > > Does the i.MX host still work?
> > >
> > > The CLKREQ# override active low only be cleared when link is up
> > > and supports-clkreq is present. In the other words, there is a
> > > remote endpoint  device, and the CLKREQ# would be driven active
> > > low by this endpoint device.
> > 
> > Assume an endpoint designed to CEM r2.0.  CLKREQ# doesn't exist in
> > CEM r2.0, so even if the endpoint is present and the link is up,
> > the endpoint will not assert CLKREQ#.
> > 
> > Will the i.MX host still work?
> > 
> > IIUC, CLKREQ# is required for ASPM L1 PM Substates.  Maybe the
> > CLKREQ# override should only be cleared if the endpoint advertises
> > L1 PM Substates support?
>
> CLKREQ# override active low only be cleared when the endpoint
> advertises that it has L1 PM Substates support or it always drives
> CLKREQ# low.

What?  That's not what the patch does.  It calls .clr_clkreq_override()
whenever the link is up and devicetree contains 'support-clkreq'.

A device advertises L1 PM Substates support by putting the L1 PM
Substates Capability in its config space.

> > > > > static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
> > > > >  		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
> > > > >  		dw_pcie_dbi_ro_wr_dis(pci);
> > > > >  	}
> > > > > +
> > > > > +	/* Clear CLKREQ# override if supports_clkreq is true and link is up */
> > > > > +	if (dw_pcie_link_up(pci) && imx_pcie->supports_clkreq) {
> > > > > +		if (imx_pcie->drvdata->clr_clkreq_override)
> > > > > +			imx_pcie->drvdata->clr_clkreq_override(imx_pcie);
> > > > > +	}

