Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD1D5C0D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78Y1JoVFkZuBkpLjUlEv4mMs5Q6hmXPT2whCgK1XDTI=; b=aOOP3nbo4TPCOO55s7lERMoW5k
	S0ULfQKXAbDGgwQWgZ1WOeogNEzV9bLqrM8d0+R03Rc/yD//jncmeX2aC0513HTRW1po2Gmbgkz2a
	u8Jw3/0bzFtR7f6wdr+YT/W2OTT1hpQITBDdVujEdf5sH9vzKrZdo1F6QR/rxUsuH5f2WZ7shO+RC
	McP6h7mOW8TL8M1WLxFtSYJutvfvFFmYxwl+Cw6AHaU+Ovodz0Ax7LGW5/dvr4G616bNRQyuYq6qA
	yzK438T2wJcw0rzbJMsnuN6FpXWbKyaawdRx9EKYI86P0tUiKG4WMMooMJp3WWtfBQJrbg+oIyFcU
	RHwD7Gng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QKk-0000000AuiT-02mb;
	Fri, 08 Nov 2024 14:51:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PU0-0000000Am3e-3EyL;
	Fri, 08 Nov 2024 13:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=78Y1JoVFkZuBkpLjUlEv4mMs5Q6hmXPT2whCgK1XDTI=; b=dNH0V0t0Ayw9j/OiJ5WjyYGdWj
	mgfTW3GzzqcQswfje4C5TAasrSb+TvY2D33GEfMuGWYB1q8scJuDIM+NhmKdS2Yf0lMjnnUee/ciq
	FPnaC0sBjtxxeIGnt8ZEDCldJVjR0n13xL5clhOpGd7MCnMFjCu0/BQ5DDXcCkwrS5on9J+s/I8lm
	BgMwWBvkx+3GVj3MA4nl8gzCBm1ulNgT+jz0ShHueQFUF1ntkovIwwCyBsyQe8pLcktDz7WlDchDG
	8VORumLcPYxc8deZHJY5qK7coYFae+JkFPxXS39Nsp74RSqh/VzuNWkVZYMFnkMJTWQjAbbAei0yK
	A14m9Eag==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9PTb-0006UM-JH; Fri, 08 Nov 2024 14:56:39 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dragan Simic <dsimic@manjaro.org>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/rockchip: dsi: Perform trivial code cleanups
Date: Fri, 08 Nov 2024 14:56:38 +0100
Message-ID: <13633881.uLZWGnKmhe@diego>
In-Reply-To: <35555b58a7284450fb16281514e4e6a3eb9c7b82.1731073565.git.dsimic@manjaro.org>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <35555b58a7284450fb16281514e4e6a3eb9c7b82.1731073565.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055704_822619_61B3A79D 
X-CRM114-Status: GOOD (  20.06  )
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

Hey Dragan,

Am Freitag, 8. November 2024, 14:53:57 CET schrieb Dragan Simic:
> Perform a few trivial code cleanups, to make one logged message a bit more
> consistent with the other logged messages by capitalizing its first word, and
> to avoid line wrapping by using the 100-column width better.
> 
> No intended functional changes are introduced by these code cleanups.
> 
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 58a44af0e9ad..f451e70efbdd 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -1379,7 +1379,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>  	}
>  
>  	if (!dsi->cdata) {
> -		DRM_DEV_ERROR(dev, "no dsi-config for %s node\n", np->name);
> +		DRM_DEV_ERROR(dev, "No dsi-config for %s node\n", np->name);

this is all probe-related, why not convert to dev_err_probe?

As the doc states [0], DRM_DEV_ERROR is deprecated in favor of dev_err.
So dev_err_probe would be the correct way to go?



[0] https://elixir.bootlin.com/linux/v6.11.6/source/include/drm/drm_print.h#L431

>  		return -EINVAL;
>  	}
>  
> @@ -1408,19 +1408,16 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>  			dsi->pllref_clk = NULL;
>  		} else {
>  			ret = PTR_ERR(dsi->pllref_clk);
> -			DRM_DEV_ERROR(dev,
> -				      "Unable to get pll reference clock: %d\n",
> -				      ret);
> +			DRM_DEV_ERROR(dev, "Unable to get pll reference clock: %d\n", ret);
>  			return ret;
>  		}
>  	}
>  
>  	if (dsi->cdata->flags & DW_MIPI_NEEDS_PHY_CFG_CLK) {
>  		dsi->phy_cfg_clk = devm_clk_get(dev, "phy_cfg");
>  		if (IS_ERR(dsi->phy_cfg_clk)) {
>  			ret = PTR_ERR(dsi->phy_cfg_clk);
> -			DRM_DEV_ERROR(dev,
> -				      "Unable to get phy_cfg_clk: %d\n", ret);
> +			DRM_DEV_ERROR(dev, "Unable to get phy_cfg_clk: %d\n", ret);
>  			return ret;
>  		}
>  	}
> @@ -1465,8 +1462,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->dmd)) {
>  		ret = PTR_ERR(dsi->dmd);
>  		if (ret != -EPROBE_DEFER)
> -			DRM_DEV_ERROR(dev,
> -				      "Failed to probe dw_mipi_dsi: %d\n", ret);
> +			DRM_DEV_ERROR(dev, "Failed to probe dw_mipi_dsi: %d\n", ret);
>  		return ret;
>  	}
>  
> 





