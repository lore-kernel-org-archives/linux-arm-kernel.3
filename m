Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350FEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pglP8IazTfpcrpmrCrPLOcUZGiWIOkDbPiDK9pBHjcA=; b=jQkiFu3nBcEnENdfw2gXW6pwhU
	PK1aRESSeMcUr55odtau4JkKH7ZCN7pZO94qwMGQv6dCixYgpYW4nqwHG1bVqaEN41iZ+oxC4CYaf
	w7xjmM7tJTXZa/Ws7qI3mqfv90X2S7wfhLTe/m5GY+v1gX9QKmlQSuzAcB99kKL+DrPVg+SRGL41i
	cvxChi4ZN6nCPtgFVJQKfnJfTmOfQQqQLmrRGSxLFcgyYvPgTlhYBX0JIYdzOFJV1cHIuG0tmi1mT
	p92S5E3Xoe9wO3um/L1w13/EHmCUAWtkodp1r3+Md0BUzIdMFitvS8LDCL9kfwUaYRKn1BcEeb8yl
	L6CLHetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn9i-00000007tqY-37WJ;
	Wed, 05 Mar 2025 11:43:18 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmJv-00000007k5q-48es;
	Wed, 05 Mar 2025 10:49:49 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 09A8B2026E;
	Wed,  5 Mar 2025 11:49:45 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvyoDwTIs3tR; Wed,  5 Mar 2025 11:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741171784; bh=UT5t5cKf18CdLlG0v7nt8XdrJciuVrvT8/nabp56tK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hV3BorJwYoE13cl35C7YCol2tfRnljeZvqKhzt+XpD0CAmG+tdRxaNJ9nniIDL62w
	 Q+qx6Z/AuWBqSKQuz8YW7ya4O+anACfd1937x6bQDqGOFNBzcSHpqdEQICG8tInvyH
	 bIpHKcCIFIubZS2n1U5bGC9FKaUupPgoc++iIhMTCkG83hWrC0N/hRxd5LjNAbT9hM
	 DZ9ee0boow8/b/1Ng5rWTYa3aG3mW6yqlIMLdyU4ckOU/h85w6heOv+9nEJdRGSndP
	 zxmwNxvibzGEGcBcK33uJZbMqO9foC9JhSFgCQHXdim6ldgoRuCQswkFOtolLggMHX
	 M/L8+zNE9m14A==
Date: Wed, 5 Mar 2025 10:49:21 +0000
From: Yao Zi <ziyao@disroot.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/8] clk: rockchip: rk3528: Add SD/SDIO tuning clocks in
 GRF region
Message-ID: <Z8gsGlZ7GgNF-zoc@pie.lan>
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104724.36399-1-ziyao@disroot.org>
 <2583035.OBFZWjSADL@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2583035.OBFZWjSADL@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_024948_442501_9DE50A8C 
X-CRM114-Status: GOOD (  22.04  )
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

On Wed, Mar 05, 2025 at 11:21:48AM +0100, Heiko Stübner wrote:
> Hi,
> 
> Am Samstag, 1. März 2025, 11:47:24 MEZ schrieb Yao Zi:
> > These clocks locate in VO and VPU GRF, serving for SD/SDIO controller
> > tuning purpose. Add their definitions and register them in driver if
> > corresponding GRF is available.
> 
> (no critique, just an observation :-) )
> 
> this puts a completely new meaning on the "general register files"
> as dumping ground ;-) .
> 
> Whoever got the idea of making sdmm/sdio tuning controls part
> of GRFs that are supposed display and/or video encoder parts :-D

Yes, the register layout is quite weird. Additionally some USB2 phy
registers locate in VO GRF as well...

> 
> > GRFs are looked up by compatible to simplify devicetree binding.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> 
> >  static int __init clk_rk3528_probe(struct platform_device *pdev)
> >  {
> > +	unsigned long nr_vpu_branches = ARRAY_SIZE(rk3528_vpu_clk_branches);
> > +	unsigned long nr_vo_branches = ARRAY_SIZE(rk3528_vo_clk_branches);
> > +	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
> >  	struct rockchip_clk_provider *ctx;
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *np = dev->of_node;
> > -	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
> > -	unsigned long nr_clks;
> > +	struct regmap *vo_grf, *vpu_grf;
> >  	void __iomem *reg_base;
> > -
> > -	nr_clks = rockchip_clk_find_max_clk_id(rk3528_clk_branches,
> > -					       nr_branches) + 1;
> > +	unsigned long nr_clks;
> >  
> >  	reg_base = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(reg_base))
> >  		return dev_err_probe(dev, PTR_ERR(reg_base),
> >  				     "could not map cru region");
> >  
> > +	nr_clks = rockchip_clk_find_max_clk_id(rk3528_clk_branches,
> > +					       nr_branches) + 1;
> > +
> > +	vo_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3528-vo-grf");
> > +	if (!IS_ERR(vo_grf))
> 
> for readability, please make this into something like
> 	if (!IS_ERR(vo_grf)) {
> 		nr_vo_clks = rockchip_clk_find_max_clk_id(rk3528_vo_clk_branches,
> 							   nr_vo_branches) + 1;
> 		nr_clks = max(nr_vo_clks, nr_clks);
> 	}

Thanks for the suggestion, will take it.

> > +	else if (PTR_ERR(vo_grf) != ENODEV)
> > +		return dev_err_probe(dev, PTR_ERR(vo_grf),
> > +				     "failed to look up VO GRF\n");
> > +
> > +	vpu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3528-vpu-grf");
> > +	if (!IS_ERR(vpu_grf))
> > +		nr_clks = MAX(rockchip_clk_find_max_clk_id(rk3528_vpu_clk_branches,
> > +							   nr_vpu_branches) + 1,
> > +			      nr_clks);
> 
> same here please
> 
> > +	else if (PTR_ERR(vpu_grf) != ENODEV)
> > +		return dev_err_probe(dev, PTR_ERR(vpu_grf),
> > +				     "failed to look up VPU GRF\n");
> > +
> >  	ctx = rockchip_clk_init(np, reg_base, nr_clks);
> >  	if (IS_ERR(ctx))
> >  		return dev_err_probe(dev, PTR_ERR(ctx),
> 
> Thanks
> Heiko
> 

Cheers,
Yao Zi

