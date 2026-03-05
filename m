Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97239EDEC07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 04:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbsw8tseKrvocUrScVRPZ8jUa5DS9H3FddYAlk/lCFo=; b=gMq1kf9EA3WgVKrz+gCEVJriY4
	CXlJpvED3D/aA5Y6HST2ezTTq6H24HNDu/sRuwLiqSVHaeblwaaXiCBB2ntqTSK8Co6uPkxUzByD5
	dSOAVA2Gy3GAI3+73nb0MQozfwZmb6JhNTGcZr2baXv6zmn9ZRrmkYM8XtxYlfSA2SegaT9Ae0ElG
	ckggtWi1WcBhvjFGRn+8u35ydW0NarO5hN05eP5h1KCT+Ll5dGi5bPWrpallnt5WxgkIQoejsc2pt
	Bp1vJ1BvWSNScJbDJME1jeZFC8pBWNZxPPG0tYN1ZbDoXXpfGa46msEZ+MDtcNLS4pDhGMdm8f8+S
	mTnrDcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0dl-00000000utK-0jMP;
	Thu, 05 Mar 2026 04:48:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0dk-00000000ut9-08Mu;
	Thu, 05 Mar 2026 04:48:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21AA761339;
	Thu,  5 Mar 2026 04:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00028C116C6;
	Thu,  5 Mar 2026 04:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772686126;
	bh=5Q3URsPBWzntEDl70LI9PAp+r4nAgAt1MNhYpVp4hEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3bA/gjV3ndP5r3Zi44D96tB11TosErCdlIgf1xdIad5K1fRDakH4XIP7yS//xBL8
	 A/UN7UXZFh/oukVYgYBMzZwSEdV8UV20H7Spi485TXhvYNplJ3VwbmT/IkAbUr01Du
	 4VeTDOclWN927uXlFuid06cnWNhCJ312KqXz9KgUA7cwggXuIONgSLp6iccDSnEFVK
	 FDEoYscCdZ9NNI0wixGZCFlPnemaqare7/56DJO1YMvgKpN3wNMc0WSj3Y3SQacwvW
	 SP6t9YRgCxtk4tC4brfyZA5W6gUSaBSJZqP4R/nOdS2oRHMmfJ3UUCh7K4SHDXTeFX
	 Q2hesZJ9zIodQ==
Date: Thu, 5 Mar 2026 10:18:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] PCI: rockchip: drive at 2.5 GT/s, error other
 speeds
Message-ID: <l3y3isas7rfe47uwk3bcvx4qpkpfen3j32omy6r4rxe6kn4kas@c4z5ydkervkm>
References: <cover.1772239598.git.geraldogabriel@gmail.com>
 <2a0a4aa97bb8b0cb511cb651c5d66c9ec8bab97a.1772239598.git.geraldogabriel@gmail.com>
 <d2b91260-7666-3606-69ec-0e7cb7a48c02@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2b91260-7666-3606-69ec-0e7cb7a48c02@manjaro.org>
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

On Sat, Feb 28, 2026 at 07:16:41AM +0100, Dragan Simic wrote:
> Hello Geraldo,
> 
> On Saturday, February 28, 2026 01:55 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > Configure the core to be driven at 2.5 GT/s Link Speed and ignore
> > any other speed with a warning. The reason is that Shawn Lin from
> > Rockchip has reiterated that there may be danger of "catastrophic
> > failure" in using their PCIe with 5.0 GT/s speeds.
> > 
> > While Rockchip has done so informally without issuing a proper errata,
> > and the particulars are thus unknown, this may cause data loss or
> > worse.
> > 
> > This change is corroborated by RK3399 official datasheet [1], which
> > states maximum link speed for this platform is 2.5 GT/s.
> > 
> > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
> > 
> > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> > Cc: stable@vger.kernel.org
> > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> > index 0f88da378805..2f211d1f4c7c 100644
> > --- a/drivers/pci/controller/pcie-rockchip.c
> > +++ b/drivers/pci/controller/pcie-rockchip.c
> > @@ -66,8 +66,10 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
> >  	}
> >  
> >  	rockchip->link_gen = of_pci_get_max_link_speed(node);
> > -	if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> > -		rockchip->link_gen = 2;
> > +	if (rockchip->link_gen < 0 || rockchip->link_gen >= 2) {
> > +		rockchip->link_gen = 1;
> > +		dev_warn(dev, "invalid max-link-speed, fix your DT\n");
> > +	}
> 
> I'd suggest using a bit more formal message here, like the one below,
> which would also avoid addressing the user directly:
> 
>   "Invalid max-link-speed found, limited to Gen1 to avoid data corruption"
> 
> >  	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
> >  		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
> > @@ -147,12 +149,13 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
> >  		goto err_exit_phy;
> >  	}
> >  
> > -	if (rockchip->link_gen == 2)
> > -		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
> > -				    PCIE_CLIENT_CONFIG);
> > -	else
> > +	if (rockchip->link_gen == 2) {
> > +		/* 5.0 GT/s may cause catastrophic failure for this core */
> > +		dev_warn(dev, "5.0 GT/s may cause data loss or worse\n");
> > +	} else {
> >  		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_1,
> >  				    PCIE_CLIENT_CONFIG);
> > +	}
> 
> I don't think we need to emit a warning here, because, as we've already
> established through earlier discussions, the rockchip_pcie_init_port()
> function should never receive an invalid speed value.
> 
> >  	regs = PCIE_CLIENT_ARI_ENABLE |
> >  	       PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes);
> 
> It would make most sense to squash all three patches in this series
> into a single patch, because they all form a single logical unit, which
> introduces changes that are just going to be harder to track down later
> if it's all scattered into multiple separate patches.
> 
> The only possible issue with the squashing comes from the inability to
> have different patch subject prefixes for different driver changes, but
> I think that's actually not an issue.  The long-term benefits of having
> everything as a single patch outweighs the benefits of having different
> patch subjects with separate patches.
> 

Patches 3&4 can be squashed together, but the rest should be in separate patches
as they target different drivers. If we were to revert any of these in the
future, it becomes easy.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

