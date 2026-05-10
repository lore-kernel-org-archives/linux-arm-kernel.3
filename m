Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED039CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXfZDjohjcuqqa3l+apN8rP0uDgPRGjuDvE54ZzEqGY=; b=CWcXfC5Ua2BgVbOZA3DSmrPGJg
	KJAQ+kS/QUPvag6j9ax1fmQjENjqWNoJTMqLExAdwFecGoyLspaIqcHsTEZVi78sgBqPiJoJDivfD
	LAkYLjSv8bkw1kJl/6iTV7FYtlDdI1S3Muj21+MnXnN5iYBZQcq8f7/ariU5NtOw/JWgWoD+xOh8z
	AOGtaw+KmxsJvsa3K7wO0JzA0ySPfGNz8U39ezfnvM6tS1pgsnQLy6j/EDkazUMLr85apGXLUfv2+
	XsDilV1FCvNOi7iFIjfKWSgneJ+8Df+4m2ZwuIZtkTxoPSf/Ifuy1L9ivErKtjzuO+m5g8vbk5zIg
	+snyWLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9G4-0000000BPw1-2LbE;
	Sun, 10 May 2026 18:52:08 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM9G1-0000000BPv6-1gVP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 18:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778439116;
 bh=zXfZDjohjcuqqa3l+apN8rP0uDgPRGjuDvE54ZzEqGY=;
 b=mJ7Y4Q8v4CQJz/x/adeJOcqn0h1dmYpJBeWuScvMR/opPO+hsGbqLXLxp2FVu6xMKza0g9GeL
 wugfRgEujK1x6pwPeoTiVPNVIOcv+0ZC8lx7gG9qb8Bwl1+T8DzN5kpCZsuLgCO3jik/JSBC2Nt
 wmCch4gjL4Dah1AIP5Lu1lPBda7Ul13/GSNzniA5+uPWI+AwA5mDcdvtNnVzvwJm/2dmx+YDK4X
 JGxRxz/f93mscq2QVfAmmy3XlaSbTEG0moxVD5eJw3es7/dOWOF472d+RNVJa9tT0pMg0olsi/y
 jOUm7yV/YVUe1zwiaNRmA1e5f9c5skt/9jgaErEe60yA==
X-Forward-Email-ID: 6a00d34a0f7977181662816c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <ba52fb4e-72a1-4a92-a094-52e305e37c37@kwiboo.se>
Date: Sun, 10 May 2026 20:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] drm/bridge: dw-hdmi: Pass bridge attach flags for
 dw_hdmi_bind()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, wens@kernel.org, samuel@sholland.org,
 luca.ceresoli@bootlin.com, Laurent.pinchart@ideasonboard.com,
 jernej.skrabec@gmail.com, victor.liu@nxp.com,
 dmitry.baryshkov@oss.qualcomm.com, shengjiu.wang@nxp.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20260403070032.447102-1-damon.ding@rock-chips.com>
 <20260403070032.447102-2-damon.ding@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260403070032.447102-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_115205_543141_AAE38951 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Damon,

On 4/3/2026 9:00 AM, Damon Ding wrote:
> For Rockchip and Allwinner platforms, the HDMI encoder attaches the
> dw-hdmi bridge via dw_hdmi_bind(). This additional bridge attach flag
> serves as preparation for the Rockchip dw-hdmi driver to support the
> bridge-connector framework.

We should not extend the dw_hdmi_bind() function with a new flag.

Each driver can instead call dw_hdmi_probe() and drm_bridge_attach() on
their own, similar as the other dw-hdmi drivers that currently use the
bridge connector.

Regards,
Jonas

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 5 +++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       | 2 +-
>  include/drm/bridge/dw_hdmi.h                | 4 +++-
>  4 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index ada45e8b3e2c..dd50dda3a4f5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3619,7 +3619,8 @@ EXPORT_SYMBOL_GPL(dw_hdmi_remove);
>   */
>  struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>  			     struct drm_encoder *encoder,
> -			     const struct dw_hdmi_plat_data *plat_data)
> +			     const struct dw_hdmi_plat_data *plat_data,
> +			     enum drm_bridge_attach_flags flags)
>  {
>  	struct dw_hdmi *hdmi;
>  	int ret;
> @@ -3628,7 +3629,7 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>  	if (IS_ERR(hdmi))
>  		return hdmi;
>  
> -	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, 0);
> +	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, flags);
>  	if (ret) {
>  		dw_hdmi_remove(hdmi);
>  		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index 0dc1eb5d2ae3..21b141b7cb9c 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -608,7 +608,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
> -	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
> +	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, 0);
>  
>  	/*
>  	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 96532709c2a7..04173335f7e7 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -188,7 +188,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
> -	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
> +	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data, 0);
>  
>  	/*
>  	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 8500dd4f99d8..e789fb451ef2 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -6,6 +6,7 @@
>  #ifndef __DW_HDMI__
>  #define __DW_HDMI__
>  
> +#include <drm/drm_bridge.h>
>  #include <sound/hdmi-codec.h>
>  
>  struct drm_display_info;
> @@ -182,7 +183,8 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi);
>  void dw_hdmi_unbind(struct dw_hdmi *hdmi);
>  struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
>  			     struct drm_encoder *encoder,
> -			     const struct dw_hdmi_plat_data *plat_data);
> +			     const struct dw_hdmi_plat_data *plat_data,
> +			     enum drm_bridge_attach_flags flags);
>  
>  void dw_hdmi_resume(struct dw_hdmi *hdmi);
>  


