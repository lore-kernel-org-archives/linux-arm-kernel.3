Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090F1CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 05:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80RmZrwXuKFVLAWjbGHY+VjBEIxT3ywEjfnnRscgprA=; b=05439ASI15JdDp8i2m/0ARym15
	Os9flHV48/4fhpwvgNSWeMy8IrgRu2+4UvGLkwePP559iE9R/0phyl6LfgB1SdwE51Syf6oK5PC6/
	GAIRV0ByWDqRTEodmN233xAt4b+/qHb38C/6adTTqY2kIA0zf4swp9/YE8txI4+wYrn6n7MaK3GHv
	BSsKvQ6nYk2yehuB2Re3TopHtXwUp4nCgSqiR4EJdx3WdO9DyBZV0diMBAnj/rm2uxtnCZyZFinQ0
	tWG3emQQQwLx1pt87n2gDcsawKjg95j2uuH1s+MBZZ7ul2Z1PNDPPeznAK5FXpWrrjdW3N+n3dCgE
	7PKpDMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMWO-0000000FFj8-3Kg8;
	Tue, 16 Jun 2026 05:39:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMWN-0000000FFim-2nuk;
	Tue, 16 Jun 2026 05:39:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADC7A601F0;
	Tue, 16 Jun 2026 05:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D581F00A3D;
	Tue, 16 Jun 2026 05:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781588374;
	bh=80RmZrwXuKFVLAWjbGHY+VjBEIxT3ywEjfnnRscgprA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bFxrHIdCaXCMK8Ds5Dzlp3idpjzEVT1sCk3OFQ/2GMb2VCvCA4245IBnL/WVAsJc5
	 JyniP+z5QEHf6RdWdWAcIcO2nXOFKYgTzElancuh0rzTGp/gg4jJsnvOERy4v9Ukuj
	 YhhkEs2qiVhq5ZjcG123PLk1Eo6qMy3fnz036gWF4f4Zyxq+gWvQ2/dBxRHRb1CX6J
	 aBHlyOha24fkmEjm3WTsrTytcPtC5QNzXqH+zESrTP9CG/yoLJ2njm5r3NI2S7BoSw
	 OVcVyVnKtu9etqcuzfjlWtUiDGbJbFcw0D+G/XU6C47Qt+Z4+izJcRwyG4o+NXKuh+
	 ieyxgDHfylEhQ==
Date: Tue, 16 Jun 2026 07:39:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Dragan Simic <dsimic@manjaro.org>, linux-rockchip@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] PCI: rockchip: drive at 2.5 GT/s, error other
 speeds
Message-ID: <2nhgubo6h6eo5t5mzzizhiatea2f6if6fgjumzb7qae7idw34x@nljy2gwgi64g>
References: <cover.1781207474.git.geraldogabriel@gmail.com>
 <4ac5cd7d2271df375ed6307f5c394247721395d9.1781207474.git.geraldogabriel@gmail.com>
 <ajBS3tGp0wqLyVq7@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajBS3tGp0wqLyVq7@geday>
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

On Mon, Jun 15, 2026 at 04:30:38PM -0300, Geraldo Nascimento wrote:
> Hi,
> 
> On Thu, Jun 11, 2026 at 05:04:22PM -0300, Geraldo Nascimento wrote:
> > Configure the core to be driven at 2.5 GT/s Link Speed and ignore
> > any other speed with a warning. Also drop the 5.0 GT/s Link Speed
> > defines from Rockchip PCIe header.
> > 
> > The reason is that Shawn Lin from Rockchip has reiterated that there
> > may be danger of "catastrophic failure" in using their PCIe with
> > 5.0 GT/s speeds.
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
> >  drivers/pci/controller/pcie-rockchip.c | 16 +++++++++-------
> >  drivers/pci/controller/pcie-rockchip.h |  3 ---
> >  2 files changed, 9 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> > index 0f88da3788054..5a2876d7c8547 100644
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
> > +		dev_warn(dev, "invalid max-link-speed, limited to 2.5 GT/s\n");
> > +	}
> >  
> >  	for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
> >  		rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
> > @@ -147,12 +149,12 @@ int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
> >  		goto err_exit_phy;
> >  	}
> >  
> > +	/* 5.0 GT/s may cause catastrophic failure for this core */
> >  	if (rockchip->link_gen == 2)
> > -		rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
> 
> Sashiko caught unreachable dead code rightfully here. It looks like I
> had got it right in v4 and then the fix regressed.
> 
> Will address this for v7 after I get more comments.
> 

I don't have any comments other than this.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

