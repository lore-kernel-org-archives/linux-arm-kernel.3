Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BB2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2d/0aIR+DSzMRLHnftjO6nolBgZZizSG3szCtzMGe4=; b=AzI7suLh87VWZanLaYF5NynAHM
	hiKluyKrsfxN/Hw1li/Nzc74rJ0TqoeN7fbPYz5vTato9oVBo0Al7JYvmGP1VEt+r3VXcH+Drdb2O
	Q/aktIClGTVAA8bo/rEjoTJ7LgifvRJDzyjWQAI/W00JWvmQAvXtdXBWS1NhaLCYVsnsYJMG7nIrj
	OeEc8Q+ndgvxbRWrOMLQp3uDmZCev9Kda42BfuD1UtmgKjN9oYxqKkkOKiaiMZ5LbaTKICQT+SJiT
	Avv1CttYK8QHAXDghe/Ar9A7MBGC56+6hMw4DCxMwWEKAR/juMkgZVhTNkUpnLcO1tCMBzOCk/leo
	1nQzegbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKC0-0000000EC4a-1Jz1;
	Wed, 10 Sep 2025 12:44:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKBx-0000000EC2L-40bL;
	Wed, 10 Sep 2025 12:44:55 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 97ABE22E49;
	Wed, 10 Sep 2025 14:44:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26e2zTYJ4SXs; Wed, 10 Sep 2025 14:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757508289; bh=1wIPiHYTTcPWjGCqP0U9W2dlBav5LMFfAO50dplnTqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aOhbme1Kk8YPSM7ceJBX1pyRtZFnV6Xzm4KQUkHwsi2ZtEfCg1D3Jmay9A8yjIuha
	 T9PfaVp1+Oj0819jIECQbSUxU90t4Q5dA/YaUZ0RirFxfdHfrqOmf3QDbJH3EbcTvW
	 HN9pjMCWYvlUi9ngYSdf4nZ+8ccCTS8xsTcBvL8tK06I7Z15350HO1M6WNGDJfSpva
	 tWycDekr4RASfamzAsOutrIeTe3vOG22Ra+QVdqBcZG/jAIDr3KLWL50FWeYdfXw1S
	 TmZs5+UwrJ3GE76Ugr2loTQexId6Fk1OQABYonEbNT6uzkeOLwh4XS6J/rrBKz5UpS
	 nftRIbWCVNHSQ==
Date: Wed, 10 Sep 2025 12:44:23 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>, Vinod Koul <vkoul@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] phy: rockchip: naneng-combphy: use existing DT
 property check for rk3528
Message-ID: <aMFyp1pn5xUJOVtj@pie>
References: <20250910122000.951100-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910122000.951100-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_054454_428031_EFAD6771 
X-CRM114-Status: GOOD (  17.85  )
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

On Wed, Sep 10, 2025 at 08:20:00PM +0800, Chukun Pan wrote:
> The naneng-combphy driver already has DT property checks for
> "rockchip,enable-ssc" and "rockchip,ext-refclk", use it for
> the rk3528_combphy_cfg. Also aligned the indentation of the
> rk3528_combphy_grfcfgs parameters (using tabs).
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

I should have noticed this simplification. Thanks for following up,

Reviewed-by: Yao Zi <ziyao@disroot.org>

> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index a3ef19807b9e..ad6c8a11951b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -518,7 +518,7 @@ static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
>  		return -EINVAL;
>  	}
>  
> -	if (device_property_read_bool(priv->dev, "rockchip,ext-refclk")) {
> +	if (priv->ext_refclk) {
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_clk_ext, true);
>  
>  		if (priv->type == PHY_TYPE_PCIE && rate == REF_CLOCK_100MHz) {
> @@ -543,11 +543,9 @@ static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
>  		}
>  	}
>  
> -	if (priv->type == PHY_TYPE_PCIE) {
> -		if (device_property_read_bool(priv->dev, "rockchip,enable-ssc"))
> -			rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> -						 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
> -	}
> +	if (priv->type == PHY_TYPE_PCIE && priv->enable_ssc)
> +		rockchip_combphy_updatel(priv, RK3528_PHYREG40_SSC_EN,
> +					 RK3528_PHYREG40_SSC_EN, RK3528_PHYREG40);
>  
>  	return 0;
>  }
> @@ -571,7 +569,7 @@ static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
>  	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
>  	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
>  	/* pipe-grf */
> -	.u3otg0_port_en         = { 0x0044, 15, 0, 0x0181, 0x1100 },
> +	.u3otg0_port_en		= { 0x0044, 15, 0, 0x0181, 0x1100 },
>  };
>  
>  static const struct rockchip_combphy_cfg rk3528_combphy_cfgs = {
> -- 
> 2.25.1
> 

