Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00828C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 05:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/jydh44zL9MyTYgQnDUOa2SDfkJA1CdKLvNt09TSV8=; b=mRsDFF+/Y25vECtXqMJZorerVw
	yGmTbitqQ1VZIK60pbbv0P3uKjU3srfQNaEfx8YNP54mmluXjvMKUsGYUnA0BBsK5yTXE0w7nl5lT
	9BX+dUowAi0hhov/CkQr4TrfwuQngWzxVl18un8M6HhZVH/dMpBTHzVwvHdpH1lewHFJeY6e6jcSN
	CApjUWRVJTmSgg0SzAu9B9mXpK9yMYopyZ4ULCiULFYtNlKwTB6I8WQxaXeuII7hD+Tj133CEUh8k
	YAEmPzv9vBnvrevy3P4noXEMu04O4c51r0Hn7umwa+3coDyEhIIfLkJDdAI5nyKNKjN9+9hgt0lcM
	X7uUaWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNZZ-00000008Hto-2rM9;
	Thu, 30 Jan 2025 05:58:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNYF-00000008Hlj-3VL4;
	Thu, 30 Jan 2025 05:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BBFB5A41B26;
	Thu, 30 Jan 2025 05:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934ADC4CED2;
	Thu, 30 Jan 2025 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738216638;
	bh=X24abUTAXgnJswQt6X0FZ/AXysH3Yn5qu50j+vpQ5ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XColdkuq70vFUPrtL8XBLp63hdV3wQvuWauVI4Q0yd6laj8xR6A9H5DkHEPYEb8FL
	 Pcb5At1PLJ62NSqaUzn3ChTCFdypcHF+lSVywHGYz9bMFUGqC8J8kY1hb5+ImaqUb6
	 KLZzecYOE/dx70u2lAFJm5vyvgQKjvaS/RxzwZHaC/PvR2XdKwdBS1wa8KjRJFTBW0
	 bh+yZ/wofDtYsEz9KfVJIYQuCAVLuOxYtgOnmtnaadts1A+7F4zgGNMRJ+uvTpNbp9
	 htgWVAlJu5nfgv1/dvz4ojg2PihPtDa1GAjwVc3ZFn1Dnzg7y6PqohU9E5ZyPl6Ri7
	 CDOW5i8v+Q8OQ==
Date: Thu, 30 Jan 2025 11:27:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
Message-ID: <Z5sUusWDCfFFeh0f@vaman>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <20250106100001.1344418-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106100001.1344418-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_215719_939372_5E919F4B 
X-CRM114-Status: GOOD (  16.95  )
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

On 06-01-25, 18:00, Chukun Pan wrote:
> The device tree of RK3568 did not specify reset-names before.
> So add fallback to old behaviour to be compatible with old DT.
> 
> Fixes: fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
> Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index a1532ef8bbe9..8c3ce57f8915 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -324,7 +324,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>  
>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>  
> -	priv->phy_rst = devm_reset_control_get(dev, "phy");
> +	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
> +	/* fallback to old behaviour */
> +	if (PTR_ERR(priv->phy_rst) == -ENOENT)
> +		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);

That is not *same* behaviour on fallback, why _exclusive() for the
fallback?

>  	if (IS_ERR(priv->phy_rst))
>  		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
>  
> -- 
> 2.25.1

-- 
~Vinod

