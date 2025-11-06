Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2944CCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a27NZ/JTWHNKO0KRMIKRFLyecqC3uTB0kLBlWpQPKA=; b=LyjnrYhQfO0u2tS8fxALEJsSLY
	6uhmtJ2z802GTa//1M5OY/H1O7A62XmASNykN7yattd/pkCAOEvEWmHFMZQIh+JZEsDRModqPtVVE
	BHJ2OqHgsR2qU8qgDPoghePMjsmWLlwpZaIW7Hx30RKlBUYwyf7UwCZY/Hq81cIoyATx6DV/CxVpR
	1gLRC6S01IM5kvKGMvtbVehGXWJpqUT6TH8XqGu7mGAZgD1OKtU7KI72iEZihHEYbBgKu25TELlSr
	xSt3FUGbq6dqHcY6w2a/9TEm9F1y+VO0X7CuuK4URjBKgVZRQ+FyZP6MyAjJkcsDI0MWR2Z/JGHk4
	PiS6Hv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGu5H-0000000EytC-2vRh;
	Thu, 06 Nov 2025 07:07:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGu5F-0000000Eysm-3TuI;
	Thu, 06 Nov 2025 07:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C713540972;
	Thu,  6 Nov 2025 07:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA158C4CEF7;
	Thu,  6 Nov 2025 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762412820;
	bh=bqDZ7dmuCre8a9mGu2kDTQ6hkin7PcxZjdNHk50TiWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiDW6Dy1rIG6NN+YGv8qsOLyDj/Z50R1sni61NB7SBu0+e9PLb9hRuawULnNetA+H
	 Gzae9u4SrXbCDwLC2qOfW/QXRTyqRZBnsXfQKeOE4w6WyykOzQ/yJF8utKHGlv5h6+
	 Had/D2JTRqvt+2gk5yxiIfVwsWgESP8SXYHdSLJdq/7YVQ3GGncikke5lrr2e5dlgx
	 TxvT7m9VtQcdS50cZFJQEOJdcbSFxNtY5scKNCkri30xwH+BS0VTreB7bQqvh3Hv5b
	 M+dOKk0JJnqhxGd55mIHk7grrBVtcg751Nea8zxyYbxDoekV/7w6BpW7kzRPSFlsP1
	 xDvK7CEmgemyg==
Date: Thu, 6 Nov 2025 12:36:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
Message-ID: <oa57mn3wrigno2kzigdo2lh46z5xmesv74nzjtg4jz4ea6urrh@icti3ewoll4r>
References: <0e32766b-b951-4ab4-ae3d-c802cf649edf@rock-chips.com>
 <20251104221724.GA1875081@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104221724.GA1875081@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_230701_908248_C8BC8C01 
X-CRM114-Status: GOOD (  36.04  )
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

On Tue, Nov 04, 2025 at 04:17:24PM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 04, 2025 at 08:58:02AM +0800, Shawn Lin wrote:
> > 在 2025/11/04 星期二 5:32, Bjorn Helgaas 写道:
> > > On Tue, Oct 28, 2025 at 02:02:18PM -0500, Bjorn Helgaas wrote:
> > > > On Fri, Oct 17, 2025 at 06:32:53PM +0200, Niklas Cassel wrote:
> > > > > The L1 substates support requires additional steps to work, namely:
> > > > > -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
> > > > >   hardware, but software still needs to set the clkreq fields in the
> > > > >   PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
> > > > > -Program the frequency of the aux clock into the
> > > > >   DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
> > > > >   is turned off and the aux_clk is used instead.)
> > > > ...
> > > 
> > > > > +static void rockchip_pcie_disable_l1sub(struct dw_pcie *pci)
> > > > > +{
> > > > > +	u32 cap, l1subcap;
> > > > > +
> > > > > +	cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
> > > > > +	if (cap) {
> > > > > +		l1subcap = dw_pcie_readl_dbi(pci, cap + PCI_L1SS_CAP);
> > > > > +		l1subcap &= ~(PCI_L1SS_CAP_L1_PM_SS | PCI_L1SS_CAP_ASPM_L1_1 |
> > > > > +			      PCI_L1SS_CAP_ASPM_L1_2 | PCI_L1SS_CAP_PCIPM_L1_1 |
> > > > > +			      PCI_L1SS_CAP_PCIPM_L1_2);
> > > > > +		dw_pcie_writel_dbi(pci, cap + PCI_L1SS_CAP, l1subcap);
> > > > > +	}
> > > > > +}
> > > > 
> > > > I like this.  But why should we do it just for dw-rockchip?  Is there
> > > > something special about dw-rockchip that makes this a problem?  Maybe
> > > > we should consider doing this in the dwc, cadence, mobiveil, and plda
> > > > cores instead of trying to do it for every driver individually?
> > > > 
> > > > Advertising L1SS support via PCI_EXT_CAP_ID_L1SS means users can
> > > > enable L1SS via CONFIG_PCIEASPM_POWER_SUPERSAVE=y or sysfs, and that
> > > > seems likely to cause problems unless CLKREQ# is supported.
> > > 
> > > Any thoughts on this?  There's nothing rockchip-specific in this
> > > patch.  What I'm proposing is something like this:
> > 
> > I like your idea, though. But could it be another form of regression
> > that we may breaks the platform which have already support L1SS
> > properly? It's even harder to detect because a functional break is easier to
> > notice than increased power consumption. 
> 
> True, but I think it's unlikely because the PCI core never enabled
> L1SS (except for CONFIG_PCIEASPM_POWER_SUPERSAVE=y or sysfs, which I
> doubt anybody really uses).
> 
> Devicetree platforms that use L1SS should have explicit code to enable
> it, like qcom does, so we should be able to find them and make sure
> they do what's needed to prevent the regression.
> 
> > Or maybe we could
> > just export dw_pcie_clear_l1ss_advert() in dwc for host drivers to
> > call it?
> 
> I don't like the idea of host drivers having to opt in for this
> because that requires changes to all of them, not just changes to
> drivers that have done the work to actually support L1SS.
> 

Otherwise, we may have to introduce a flag for the controller drivers to opt-out
of this disablement. Like, dw_pcie_rp::native_clkreq and bailing out early if
this flag is set.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

