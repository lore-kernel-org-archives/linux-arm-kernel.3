Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54619E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 02:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Qfir7c7WLrv83V+tyvAYKqAUcaUO9npr2R5cAdgfC0=; b=O2lxUf0downLqlGyx8X/AG7/AF
	29kOxPMMtE88UviUrI5loepS3l17V5dusXbwItPqb2XUWEOXvtQqX8y0gR8AFIfuiSJ3CQJCtRLlv
	0GwlwSJUpcaj0UC1SGCMW+Q23x8/a+vSMOETgzbm15HAxWmflH/VyI+hWIhODjc9I0iF/kKEBuPWA
	d1ca2/ia0+UzeNFlwdjZFGqpTxFNLL/4bojJ9NL9jpZcDuCcWIf0O4DPJhdaNXHKXm546o3knkFJi
	Lgscv8mneIm2WOqXRYVZBzSfI+TTq3htCW47evq0rENGlzAwq2whPymgWktQhTIi+qGNspolxWi/i
	haTLDh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIex0-0000000BHBk-3sZs;
	Wed, 04 Dec 2024 02:17:14 +0000
Received: from mail-m15577.qiye.163.com ([101.71.155.77])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIevz-0000000BGyn-3fdZ;
	Wed, 04 Dec 2024 02:16:13 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a145995;
	Wed, 4 Dec 2024 10:16:00 +0800 (GMT+08:00)
Message-ID: <af1cce1a-c46d-470f-a1b9-bfbc90b46415@rock-chips.com>
Date: Wed, 4 Dec 2024 10:16:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/rockchip: Add MIPI DSI2 glue driver for RK3588
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Daniel Semkowicz <dse@thaumatec.com>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241203165450.1501219-4-heiko@sntech.de>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20241203165450.1501219-4-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh5IGlZDTkhCSRkdSh9DGhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a938f73f0f903afkunm4a145995
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBA6Hjo5NDIiQgsiEC4hFjQU
	ASIaC0JVSlVKTEhISUxDTk1JTUpOVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITUtDNwY+
DKIM-Signature: a=rsa-sha256;
	b=dzcA+s18pHeWsAvT8DU6Gsg9UZW7nRkXuem7SF0t2SffbzdYCfnk1RxngwDRz/caOzZYcCZaQu9jL1FTEb9tq/sSV+YyDZMacY5Qosl70MpbmQuFuO09iKrupIcEb66TLNKyZAFWaXQGYXAWgfTjBZerWwqAAwdoOs17GOk8h04=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7Qfir7c7WLrv83V+tyvAYKqAUcaUO9npr2R5cAdgfC0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_181612_451436_284EBAFA 
X-CRM114-Status: GOOD (  19.62  )
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

Hi Heiko,

On 2024/12/4 00:54, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>
> This adds the glue code for the MIPI DSI2 bridge on Rockchip SoCs and
> enables its use on the RK3588.
>
> Right now the DSI2 controller is always paired with a DC-phy based on a
> Samsung IP, so the interface values are set statically for now.
> This stays true for the upcoming RK3576 as well.
>
> Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/gpu/drm/rockchip/Kconfig              |  10 +
>   drivers/gpu/drm/rockchip/Makefile             |   1 +
>   .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  | 524 ++++++++++++++++++
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   2 +
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   1 +
>   5 files changed, 538 insertions(+)
>   create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
>
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 448fadd4ba15..84af423b7f90 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -10,6 +10,7 @@ config DRM_ROCKCHIP
>   	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
>   	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
>   	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> +	select DRM_DW_MIPI_DSI2 if ROCKCHIP_DW_MIPI_DSI2
>   	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
>   	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
>   	select SND_SOC_HDMI_CODEC if ROCKCHIP_CDN_DP && SND_SOC
> @@ -81,6 +82,15 @@ config ROCKCHIP_DW_MIPI_DSI
>   	  enable MIPI DSI on RK3288 or RK3399 based SoC, you should
>   	  select this option.
>   
> +config ROCKCHIP_DW_MIPI_DSI2
> +	bool "Rockchip specific extensions for Synopsys DW MIPI DSI2"
> +	select GENERIC_PHY_MIPI_DPHY
> +	help
> +	  This selects support for Rockchip SoC specific extensions
> +	  for the Synopsys DesignWare dsi driver. If you want to
> +	  enable MIPI DSI on RK3576 or RK3588 based SoC, you should
> +	  select this option.
> +
>   config ROCKCHIP_INNO_HDMI
>   	bool "Rockchip specific extensions for Innosilicon HDMI"
>   	select DRM_DISPLAY_HDMI_HELPER
> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
> index 3eab662a5a1d..2b867cebbc12 100644
> --- a/drivers/gpu/drm/rockchip/Makefile
> +++ b/drivers/gpu/drm/rockchip/Makefile
> @@ -13,6 +13,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o cdn-dp-reg.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI_QP) += dw_hdmi_qp-rockchip.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
> +rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI2) += dw-mipi-dsi2-rockchip.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) += rockchip_lvds.o
>   rockchipdrm-$(CONFIG_ROCKCHIP_RGB) += rockchip_rgb.o
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> new file mode 100644
> index 000000000000..55eed4001634
> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> @@ -0,0 +1,524 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2024 Rockchip Electronics Co.Ltd
This should be:

Rockchip Electronics Co., Ltd.

This typo is from vendor kernel, we will correct all this kind of issue locally,
and Andy is going to correct other files in drm for mainline kernel.

Thanks,
- Kever


