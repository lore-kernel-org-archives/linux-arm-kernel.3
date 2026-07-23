Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56206C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNXovR2Kgk/ugEF9ZAR+WvIMIzjhMzeA8GG4/5DDaOg=; b=FrEfQuwXelUE2m9RhKuccfpw87
	HVWCeFrY1FB0Dze0Q37UqDh1bmgyizhTWNlMYRkpUN3S834Gsr+UQJNlsBHqMhlcQXqrX/BJI/PNc
	Aa6fW3ETQTVl/qFV4uItzysHkzgmoXDX6B27e15aulKZtKVj9yB6dabVxRtLJf2BDMrzUD9ITQgkP
	avivzjZj2MR5YuqOVB5ZmSj+sCXHqps9MmwDXFHvBMWze3gXqv/t7mEb/MJ2z1CuNAqJV4YB/3a4p
	qDLgO5q6KRlHP9KqxYTskGfEkwgb0uj/eu9qNMTKPUKslijlmPAcqQt7XZfBSOhB05RG8RF5tAx/s
	ewnTqt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmq2D-0000000DwUc-0LPi;
	Thu, 23 Jul 2026 09:48:09 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmq29-0000000DwTd-38Jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:48:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C6150201FAF;
	Thu, 23 Jul 2026 11:48:03 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wmq27-000sTE-2J;
	Thu, 23 Jul 2026 11:48:03 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wmq27-0000000EdmK-2SNv;
	Thu, 23 Jul 2026 11:48:03 +0200
Date: Thu, 23 Jul 2026 11:48:03 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
Message-ID: <nwemnkwk5sjo5w6yelba5nmdlxgu7pxsalrxjixnrjlhfyceza@tamb54s7iswz>
References: <20260723093813.180089-1-francesco@dolcini.it>
 <20260723093813.180089-3-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723093813.180089-3-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_024805_943613_2E9E7A16 
X-CRM114-Status: GOOD (  32.30  )
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

Hi Francesco,

On 26-07-23, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> format reported by the downstream panel or bridge describes the display
> input, but it does not describe how the LCDIF data pins are physically
> wired on the board.
> 
> These can differ. For example, a 16-bit LCDIF bus can be connected to a
> 24-bit display by wiring the available color bits to the corresponding
> display inputs. In that case, using the display's 24-bit format to
> configure LCDIF selects the wrong data-bus mode and changes the assignment
> of color bits on the LCD_DATA pins.
> 
> Read the optional bus-width endpoint property from the LCDIF output port
> and use it to select the media bus format used to configure LCDIF. This
> allows the LCDIF bus mode to describe the physical interface
> independently of the downstream display format.
> 
> When the optional property is absent, continue using the format reported
> by the downstream display device, preserving the existing behavior.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2: use the common bus-width property instead of the legacy interface-pix-fmt
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 ++++++++++++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 9b8fbda85d28..0545718a4b65 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -12,7 +12,10 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/pm_runtime.h>
> @@ -209,7 +212,10 @@ static int mxsfb_load(struct drm_device *drm,
>  		      const struct mxsfb_devdata *devdata)
>  {
>  	struct platform_device *pdev = to_platform_device(drm->dev);
> +	struct device_node *np = pdev->dev.of_node;
>  	struct mxsfb_drm_private *mxsfb;
> +	struct device_node *ep;
> +	u32 bus_width = 0;

With this beeing set to '0' and ...

>  	int ret;
>  
>  	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
> @@ -236,6 +242,24 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (IS_ERR(mxsfb->clk_disp_axi))
>  		mxsfb->clk_disp_axi = NULL;
>  
> +	ep = of_graph_get_next_endpoint(np, NULL);
> +	if (ep) {
> +		of_property_read_u32(ep, "bus-width", &bus_width);

no bus-width property present, this ...

> +		of_node_put(ep);

Furthermore please see
20260723-v6-18-topic-imx93-parallel-display-v13-1-ccf3f9bbc0fc@nxp.com
for a proper error handling.

> +	}
> +
> +	switch (bus_width) {

switch should fail. Therefore I would recommend to set the default to
24 (bit) aka no limitation.

Regards,
  Marco

> +	case 16:
> +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +		break;
> +	case 18:
> +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +		break;
> +	case 24:
> +		mxsfb->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
>  	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index d160d921b25f..bdc47ce5be79 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -46,6 +46,8 @@ struct mxsfb_drm_private {
>  	struct drm_connector		*connector;
>  	struct drm_bridge		*bridge;
>  
> +	u32				bus_format;
> +
>  	bool				crc_active;
>  };
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index d8ebebc5314b..1d78c486d147 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -386,6 +386,18 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (!bus_format)
>  		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  
> +	/*
> +	 * Prefer the bus format derived from the OF graph endpoint "bus-width"
> +	 * property when available. Otherwise, use the bus format reported by
> +	 * the downstream bridge or panel.
> +	 *
> +	 * This supports mismatched display and interface bus widths, such as
> +	 * a 24-bit panel connected through an 18-bit interface or an 18-bit
> +	 * panel connected through a 24-bit interface.
> +	 */
> +	if (mxsfb->bus_format)
> +		bus_format = mxsfb->bus_format;
> +
>  	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
> -- 
> 2.47.3
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

