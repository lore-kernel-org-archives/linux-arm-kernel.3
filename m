Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9DBD44D5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0Hs6MfDCm9OBvKWZZJPXB/waj4QxbzOt9Cz60jbht4=; b=uACH/lRXpBW89CZmQ4qVVogSn2
	xltW3pUu71MhOLIou+PALhro4QsUEO8M1BfGJF+7xGRN3c0yWiUcaPUmQMc+16n7IHyE0s40Mkqlz
	QUyQsXI++SdMngHUnMz9/TQI7mkU4vw7SPgtR2m1ZDRfoLv6oLQYU087rTC9NYlW1KBoIUyEw1CFE
	vKd6lPUrvx/plEGQx5VOqJ4LRtC/UuiqB1SadBhpS/Csc+BcsnH1nZdi5wqzWh8pJNUzi//wVf/or
	N95FHKNiugAeRgEoooINWviVyr+5D6J7vUPd1TJBxdrwvVzsBGMQW8+4sIWnjkXVQOhYMn8wozJJQ
	GhXFS12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gTv-00000003V5Z-356y;
	Wed, 06 Nov 2024 13:53:59 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gFT-00000003RvM-0A6t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:39:04 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1730900016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L0Hs6MfDCm9OBvKWZZJPXB/waj4QxbzOt9Cz60jbht4=;
	b=LeRUpQNYFntxZ+/Nas9OV9ZCgqsiaBopA9T6kwwlVsGNY7e1+NIIFQWDTdcaRDu9qyf6ih
	w32tggnc5H2JES/qBsegQYw7JjbB3qsl3Pe0ToX/p8Tk51LfXoFKVroIcwN2K0WOJY01lc
	a3wcNKIQxJ/IDoxtK2cYh3niQWjxQuwJiDsoQpY200HRyjoDOAseFIJppgiqyyQvI292e2
	FEOb/J/BnmRdoRGOt5AAZzBxBvHt1XW7HIJJtWjGVbXl4RwUZovFtWBGl7ppBcaBiaA7Ma
	28nvs1fC+duP1hADHeC1H/nebhqJRclV4Apz6f9D51wkHChYLzV2bzs0Vcgvkw==
Content-Type: multipart/signed;
 boundary=941c37924af32141fe5e0f79007b5e08666732b6921ee74e1ee56a0ed058;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 06 Nov 2024 14:33:25 +0100
Message-Id: <D5F4UD59MUJG.2HFCTRSPELO98@cknow.org>
Cc: <andy.yan@rock-chips.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <quentin.schulz@cherry.de>, "Heiko Stuebner" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 3/3] drm/rockchip: Add MIPI DSI2 glue driver for RK3588
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Heiko Stuebner" <heiko@sntech.de>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-4-heiko@sntech.de>
In-Reply-To: <20241106123304.422854-4-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_053903_231560_B063EB74 
X-CRM114-Status: GOOD (  24.30  )
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

--941c37924af32141fe5e0f79007b5e08666732b6921ee74e1ee56a0ed058
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 6, 2024 at 1:33 PM CET, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>
> This adds the glue code for the MIPI DSI2 bridge on Rockchip SoCs and
> enables its use on the RK3588.
>
> Right now the DSI2 controller is always paired with a DC-phy based on a
> Samsung IP, so the interface values are set statically for now.
> This stays true for the upcoming RK3576 as well.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  drivers/gpu/drm/rockchip/Kconfig              |  10 +
>  drivers/gpu/drm/rockchip/Makefile             |   1 +
>  .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  | 524 ++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   2 +
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   1 +
>  5 files changed, 538 insertions(+)
>  create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
>
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/=
Kconfig
> index 448fadd4ba15..99d4b260de85 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -10,6 +10,7 @@ config DRM_ROCKCHIP
>  	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
>  	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
>  	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> +	select DRM_DW_MIPI_DSI2 if ROCKCHIP_DW_MIPI_DSI2
>  	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
>  	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
>  	select SND_SOC_HDMI_CODEC if ROCKCHIP_CDN_DP && SND_SOC
> @@ -81,6 +82,15 @@ config ROCKCHIP_DW_MIPI_DSI
>  	  enable MIPI DSI on RK3288 or RK3399 based SoC, you should
>  	  select this option.
> =20
> +config ROCKCHIP_DW_MIPI_DSI2
> +	bool "Rockchip specific extensions for Synopsys DW MIPI DSI"
> +	select GENERIC_PHY_MIPI_DPHY
> +	help
> +	  This selects support for Rockchip SoC specific extensions
> +	  for the Synopsys DesignWare dsi driver. If you want to
> +	  enable MIPI DSI on RK3288 or RK3399 based SoC, you should
> +	  select this option.

The commit message and the cover letter talk about RK3588 (and RK3576),
so this seems like a copy-n-paste error (from DSI '1')?
I'd also prefer 'dsi' to be in capitals (thus 'DSI').

> +
>  config ROCKCHIP_INNO_HDMI
>  	bool "Rockchip specific extensions for Innosilicon HDMI"
>  	select DRM_DISPLAY_HDMI_HELPER
> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip=
/Makefile
> index 3eab662a5a1d..2b867cebbc12 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -13,6 +13,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) +=3D cdn-dp-core.=
o cdn-dp-reg.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) +=3D dw_hdmi-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI_QP) +=3D dw_hdmi_qp-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) +=3D dw-mipi-dsi-rockchip.o
> +rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI2) +=3D dw-mipi-dsi2-rockchip.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) +=3D inno_hdmi.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) +=3D rockchip_lvds.o
>  rockchipdrm-$(CONFIG_ROCKCHIP_RGB) +=3D rockchip_rgb.o
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/g=
pu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> new file mode 100644
> index 000000000000..42a7a80e2138
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> @@ -0,0 +1,524 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2024 Rockchip Electronics Co.Ltd
> + * Author:
> + *      Guochun Huang <hero.huang@rock-chips.com>
> + *      Heiko Stuebner <heiko.stuebner@cherry.de>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/gpio.h>
> +#include <linux/iopoll.h>
> +#include <linux/math64.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_platform.h>

In commit 722d4f06e560 ("drm: Explicitly include correct DT includes")
several changes were made to header includes.
One of the things I noticed is that ``of_device.h`` often was removed
and ``of.h`` added.
Thus are the above headers as they should be or should they be updated
like was done in commit 722d4f06e560?

> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/phy/phy.h>
> +
> +#include <drm/bridge/dw_mipi_dsi2.h>
> +
> +#include <drm/display/drm_dsc.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <video/mipi_display.h>
> +#include <video/videomode.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include <uapi/linux/videodev2.h>
> +
> +#include "rockchip_drm_drv.h"
> +#include "rockchip_drm_vop.h"
> +
> +#define PSEC_PER_SEC			1000000000000LL
> +
> +struct dsigrf_reg {
> +	u16 offset;
> +	u16 lsb;
> +	u16 msb;
> +};
> +
> +enum grf_reg_fields {
> +	TXREQCLKHS_EN,
> +	GATING_EN,
> +	IPI_SHUTDN,
> +	IPI_COLORM,
> +	IPI_COLOR_DEPTH,
> +	IPI_FORMAT,
> +	MAX_FIELDS,
> +};
> +
> +#define IPI_DEPTH_5_6_5_BITS		0x02
> +#define IPI_DEPTH_6_BITS		0x03
> +#define IPI_DEPTH_8_BITS		0x05
> +#define IPI_DEPTH_10_BITS		0x06

Possibly dumb remark (sorry):
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c also defines these
values, so wouldn't it be better if they're defined in 1 place?

Cheers,
  Diederik

--941c37924af32141fe5e0f79007b5e08666732b6921ee74e1ee56a0ed058
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZytwKgAKCRDXblvOeH7b
biV/AP4zAYHiHOY+G+ZWghI6d64xjETs3tPKgVHZL09dfdL/JwD/TSO6qqGeYLHi
B98Lhvs7MDrWNaq9pz6STkXM4wXDRQQ=
=9pLY
-----END PGP SIGNATURE-----

--941c37924af32141fe5e0f79007b5e08666732b6921ee74e1ee56a0ed058--

