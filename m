Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FAEC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/xFL5MALDwY0UR+lAPMOd2gwlkMmh5BoEMS7wXPE6A=; b=DLrP8VUqruRlYj+mI40zNqpYwo
	wvD97rAdeSoL9tGo9o79pItExiQqMsdWv7/Cnn1VBGqfuGAmCyk/rHm/KICojZJ5l5abVLyhtcfv9
	dUX99+VqHa2ym9CnGuEv+OyMfL4MgBKG8JB4hbk9858I/SvvaQp4rTgJAPuK/3RJnatvqjoTVWWwI
	4pi4TK6lxW0w6csKMFC66HiVBxl+cz04IJ1Xrr8xzazJW8Ss3BjGv/KLlwmfE7PjArwPIbdokuQOf
	hgIZJJeYIBZuAzm4TclJW6+9OTsHr7C/BdMA5Z9VkY0Gs/WzuirikFw5A8YUqiDosqyWbMx/oM2Bs
	5Ghb0irg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6DU-00000008ste-3ANB;
	Tue, 21 Jul 2026 08:52:44 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6DR-00000008ssN-1OI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:52:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 711AF20268C;
	Tue, 21 Jul 2026 10:52:37 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wm6DN-000Xk5-1B;
	Tue, 21 Jul 2026 10:52:37 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wm6DN-00000009YGz-0wQ6;
	Tue, 21 Jul 2026 10:52:37 +0200
Date: Tue, 21 Jul 2026 10:52:37 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/4] drm: mxsfb: Allow optional LCDIF interface format
 override
Message-ID: <bfhx5yyyyqxa6aty4ybdmwp7t7q6kyh5jacotlugf6cyhohmwt@ygi7jioxbyt4>
References: <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-3-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717121847.488148-3-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_015241_526984_D4804248 
X-CRM114-Status: GOOD (  31.49  )
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

On 26-07-17, Francesco Dolcini wrote:
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
> Read the optional interface-pix-fmt property from the LCDIF node and use
> it to select the media bus format used to configure LCDIF. This allows
> the LCDIF bus mode to describe the physical interface independently of
> the downstream display format.
> 
> When the optional property is absent, continue using the format reported
> by the downstream display device, preserving the existing behavior.
> 
> This follows the same approach already implemented in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c.

According the driver comment, this is a legacy property. If you just
want to limit the physical bus width you could use the common of-graph
endpoint bus-width property.

Regards,
  Marco

> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 16 ++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  8 ++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 9b8fbda85d28..edf347968fd2 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -12,7 +12,9 @@
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/pm_runtime.h>
> @@ -209,7 +211,10 @@ static int mxsfb_load(struct drm_device *drm,
>  		      const struct mxsfb_devdata *devdata)
>  {
>  	struct platform_device *pdev = to_platform_device(drm->dev);
> +	struct device_node *np = pdev->dev.of_node;
>  	struct mxsfb_drm_private *mxsfb;
> +	u32 bus_format = 0;
> +	const char *fmt;
>  	int ret;
>  
>  	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
> @@ -236,6 +241,17 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (IS_ERR(mxsfb->clk_disp_axi))
>  		mxsfb->clk_disp_axi = NULL;
>  
> +	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
> +	if (!ret) {
> +		if (!strcmp(fmt, "rgb24"))
> +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		else if (!strcmp(fmt, "rgb565"))
> +			bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +		else if (!strcmp(fmt, "rgb666"))
> +			bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +	}
> +	mxsfb->bus_format = bus_format;
> +
>  	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index d160d921b25f..f64800f06a69 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -46,6 +46,8 @@ struct mxsfb_drm_private {
>  	struct drm_connector		*connector;
>  	struct drm_bridge		*bridge;
>  
> +	u32 bus_format;
> +
>  	bool				crc_active;
>  };
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index d8ebebc5314b..8b482727aed5 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -386,6 +386,14 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (!bus_format)
>  		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  
> +	/*
> +	 * Prefer bus format set via optional "interface-pix-fmt" DT property,
> +	 * over panel or next bridge bus format. This is necessary to support
> +	 * 24bit DPI panels connected to a 18bit interface, for example.
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

