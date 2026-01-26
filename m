Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A4FCF65FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WufY0k023adihvQzeLbP1fV/GdAlgow9OJPK9EaOvDg=; b=gNOAEoaVj3aKGZewWXJFDxAAcu
	jxVg0IC6Zi5qVN1nAlakWr0ii3Mey2js4TC7CVHeQQTetFkLTeuy2mnUbDfBc88KMQwjf3J/dWr6K
	mezwFEOLiPNMiI+ImiV0upeNlQB1/3SzZ/5W2DvK2EnwlGpg+Ou5Wpr9CxVid5SuPplo8sYLSd5DD
	uNV3H8sUkcKYthXQoN0YB0DaprNTLRmE7xzdJQH1wcTz7FBoeo6FRyvxj9P+m2DIQi1PT5LOmUhpz
	7YwLeBwUbk3R3tuO4YzfbDlXxa+XAREHhJxh0h7eri7Zug7IVCDy+yBPjsGgUhpIGtQIjcw6BfuNg
	8qODgpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkM3d-0000000CZme-1x0r;
	Mon, 26 Jan 2026 12:51:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkM3a-0000000CZlp-2M0V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 620454098F;
	Mon, 26 Jan 2026 12:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC40C2BC86;
	Mon, 26 Jan 2026 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769431861;
	bh=PgmZVcC9kDHnqvuy93sM0BA2cBmnDc5AuYF/Y20qPdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kK7xC3N9DxTpWyUYe79gL9fAT2eQ9vOAbTTcQC686/+2N0mb4wibE08CqepyLdXg0
	 8c8fMV6Z6jVT+lsYSn0FvupipM9EyrmOXBijrfI9onOBZpIv9dVBuLXacBHQ4uOUxA
	 fU5NBDbf4yTX6cTTaWxGNy5GMRBr9GfODSLrcojLZNLOxaqPXmdgYTsE0HPizv8YXo
	 Ojx/SFlB7luhHGKc/Q4cPvGC5zrKf+2SaCyG6ZclvGSdWvdArYLBO5bMazc2Hfq7Cw
	 PfK2w2yHuPCw9+6O0tTo3s7xX7+dR3YC+6wx7B51B3kWnI9T6RLTIF868CpnGP7hHA
	 9lJ+kSkuAPHzQ==
Date: Mon, 26 Jan 2026 13:50:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <20260126-caracara-of-sudden-unity-b4dcd7@houat>
References: <20260126085727.2568958-1-a0987203069@gmail.com>
 <20260126085727.2568958-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="g4r6sbvrwssiwjt7"
Content-Disposition: inline
In-Reply-To: <20260126085727.2568958-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_045102_656480_235ADF9D 
X-CRM114-Status: GOOD (  27.63  )
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


--g4r6sbvrwssiwjt7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/3] drm/nuvoton: add MA35D1 display controller driver
MIME-Version: 1.0

On Mon, Jan 26, 2026 at 04:57:27PM +0800, Joey Lu wrote:
> +static int ma35_crtc_atomic_set_property(struct drm_crtc *drm_crtc,
> +					 struct drm_crtc_state *state,
> +					 struct drm_property *property,
> +					 uint64_t value)
> +{
> +	struct ma35_crtc *crtc = ma35_crtc(drm_crtc);
> +
> +	if (property == crtc->dpi_format_prop)
> +		crtc->dpi_format = value;
> +	else if (property == crtc->dither_enable_prop)
> +		crtc->dither_enable = value;
> +	else if (property == crtc->dither_depth_prop)
> +		crtc->dither_depth = value;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int ma35_crtc_atomic_get_property(struct drm_crtc *drm_crtc,
> +					 const struct drm_crtc_state *state,
> +					 struct drm_property *property,
> +					 uint64_t *value)
> +{
> +	struct ma35_crtc *crtc = ma35_crtc(drm_crtc);
> +
> +	if (property == crtc->dpi_format_prop)
> +		*value = crtc->dpi_format;
> +	else if (property == crtc->dither_enable_prop)
> +		*value = crtc->dither_enable;
> +	else if (property == crtc->dither_depth_prop)
> +		*value = crtc->dither_depth;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}

You shouldn't have any driver specific properties.

The bar to add new ones is pretty high too (see
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#requirements and
https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-userspace-requirements)

So I'd suggest you to drop them for now.

> +int ma35_crtc_init(struct ma35_drm *priv)
> +{
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +	struct device *dev = drm_dev->dev;
> +	struct ma35_crtc *crtc;
> +	struct ma35_layer *layer_primary, *layer_cursor;
> +	struct drm_plane *cursor_plane = NULL;
> +	int ret;
> +
> +	crtc = devm_kzalloc(dev, sizeof(*crtc), GFP_KERNEL);
> +	if (!crtc)
> +		return -ENOMEM;

Allocating a crtc with a devm helper isn't memory safe. You must use a
drmm helper.

> +static int ma35_drm_probe(struct platform_device *pdev)
> +{
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *mem_node;
> +	struct resource res;
> +	struct ma35_drm *priv;
> +	struct drm_device *drm_dev;
> +	void __iomem *base;
> +	struct regmap *regmap = NULL;
> +	int irq;
> +	int ret;
> +
> +	/* Check for reserved memory. Fallback to dynamic allocation if undefined */
> +	mem_node = of_parse_phandle(of_node, "memory-region", 0);
> +	if (mem_node) {
> +		ret = of_address_to_resource(mem_node, 0, &res);
> +		if (ret) {
> +			dev_err(dev, "Failed to parse reserved memory resource: %d\n", ret);
> +			of_node_put(mem_node);
> +			return ret;
> +		}
> +		of_node_put(mem_node);
> +		dev_info(dev, "registering reserved memory %pR\n", &res);
> +
> +		ret = of_reserved_mem_device_init(dev);
> +		if (ret && ret != -ENODEV) {
> +			dev_err(dev, "Failed to init memory region\n");
> +			goto error_early;
> +		}
> +	}

That part doesn't make much sense to me. Can you explain / add a comment
on why simply calling of_reserved_mem_device_init doesn't work?

> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base)) {
> +		dev_err(dev, "Failed to map I/O base\n");
> +		ret = PTR_ERR(base);
> +		goto error_reserved_mem;
> +	}
> +	regmap = devm_regmap_init_mmio(dev, base, &ma35_drm_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Failed to create regmap for I/O\n");
> +		ret = PTR_ERR(regmap);
> +		goto error_reserved_mem;
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret = -ENODEV;
> +		goto error_reserved_mem;
> +	}
> +
> +	priv = devm_drm_dev_alloc(dev, &ma35_drm_driver,
> +				     struct ma35_drm, drm_dev);
> +	if (IS_ERR(priv)) {
> +		ret = PTR_ERR(priv);
> +		goto error_reserved_mem;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	drm_dev = &priv->drm_dev;
> +	priv->regmap = regmap;
> +	INIT_LIST_HEAD(&priv->layers_list);
> +
> +	ret = ma35_clocks_prepare(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to prepare clocks\n");
> +		goto error_reserved_mem;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, ma35_drm_irq_handler, 0,
> +			       dev_name(dev), priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to request IRQ\n");
> +		goto error_clocks;
> +	}
> +
> +	/* modeset */
> +	ret = ma35_mode_init(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize KMS\n");
> +		goto error_clocks;
> +	}
> +
> +	/* plane */
> +	ret = ma35_plane_init(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize layers\n");
> +		goto error_clocks;
> +	}
> +
> +	/* crtc */
> +	ret = ma35_crtc_init(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize CRTC\n");
> +		goto error_clocks;
> +	}
> +
> +	/* interface */
> +	ret = ma35_interface_init(priv);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			drm_err(drm_dev, "Failed to initialize interface\n");
> +
> +		goto error_clocks;
> +	}
> +
> +	drm_mode_config_reset(drm_dev);
> +
> +	ret = drm_dev_register(drm_dev, 0);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to register DRM device\n");
> +		goto error_mode;
> +	}
> +
> +	drm_client_setup(drm_dev, NULL);
> +
> +	return 0;
> +
> +error_mode:
> +	ma35_mode_fini(priv);
> +
> +error_clocks:
> +	ma35_clocks_unprepare(priv);
> +
> +error_reserved_mem:
> +	of_reserved_mem_device_release(dev);
> +
> +error_early:
> +	return ret;
> +}
> +
> +static void ma35_drm_remove(struct platform_device *pdev)
> +{
> +	struct ma35_drm *priv = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +
> +	drm_dev_unregister(drm_dev);
> +	drm_atomic_helper_shutdown(drm_dev);
> +
> +	ma35_mode_fini(priv);
> +
> +	ma35_clocks_unprepare(priv);
> +
> +	of_reserved_mem_device_release(dev);
> +}
> +
> +static void ma35_drm_shutdown(struct platform_device *pdev)
> +{
> +	struct ma35_drm *priv = platform_get_drvdata(pdev);
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +
> +	drm_atomic_helper_shutdown(drm_dev);
> +}
> +
> +static __maybe_unused int ma35_drm_suspend(struct device *dev)
> +{
> +	struct ma35_drm *priv = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +
> +	return drm_mode_config_helper_suspend(drm_dev);
> +}
> +
> +static __maybe_unused int ma35_drm_resume(struct device *dev)
> +{
> +	struct ma35_drm *priv = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +
> +	return drm_mode_config_helper_resume(drm_dev);
> +}
> +
> +static const struct of_device_id ma35_drm_of_table[] = {
> +	{ .compatible = "nuvoton,ma35d1-dcu" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35_drm_of_table);
> +
> +static const struct dev_pm_ops ma35_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ma35_drm_suspend, ma35_drm_resume)
> +};
> +
> +static struct platform_driver ma35_drm_platform_driver = {
> +	.probe		= ma35_drm_probe,
> +	.remove		= ma35_drm_remove,
> +	.shutdown	= ma35_drm_shutdown,
> +	.driver		= {
> +		.name		= "ma35-drm",
> +		.of_match_table	= ma35_drm_of_table,
> +		.pm = &ma35_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(ma35_drm_platform_driver);
> +
> +MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
> +MODULE_DESCRIPTION("Nuvoton MA35 series DRM driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/nuvoton/ma35_drm.h b/drivers/gpu/drm/nuvoton/ma35_drm.h
> new file mode 100644
> index 000000000000..68da6b11a323
> --- /dev/null
> +++ b/drivers/gpu/drm/nuvoton/ma35_drm.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Nuvoton DRM driver
> + *
> + * Copyright (C) 2026 Nuvoton Technology Corp.
> + *
> + * Author: Joey Lu <a0987203069@gmail.com>
> + */
> +
> +#ifndef _MA35_DRM_H_
> +#define _MA35_DRM_H_
> +
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <drm/drm_device.h>
> +
> +#include "ma35_regs.h"
> +#include "ma35_plane.h"
> +#include "ma35_crtc.h"
> +#include "ma35_interface.h"
> +
> +#define DRIVER_MAJOR	1
> +#define DRIVER_MINOR	0
> +
> +#define MA35_INT_STATE_DISP0	BIT(0)
> +
> +#define MA35_DISPLAY_ALIGN_PIXELS	32
> +#define MA35_DISPLAY_PREFER_DEPTH	32
> +
> +#define MA35_CURSOR_WIDTH	32
> +#define MA35_CURSOR_HEIGHT	32
> +
> +#define MA35_DISPLAY_MAX_ZPOS	3
> +
> +#define ma35_drm(d) \
> +	container_of(d, struct ma35_drm, drm_dev)
> +
> +struct ma35_drm {
> +	struct drm_device drm_dev;
> +	struct regmap *regmap;
> +	struct list_head layers_list;
> +	struct ma35_crtc *crtc;
> +	struct ma35_interface *interface;
> +	struct clk *dcuclk;
> +	struct clk *dcupclk;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/nuvoton/ma35_interface.c b/drivers/gpu/drm/nuvoton/ma35_interface.c
> new file mode 100644
> index 000000000000..48d1535ace2f
> --- /dev/null
> +++ b/drivers/gpu/drm/nuvoton/ma35_interface.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Nuvoton DRM driver
> + *
> + * Copyright (C) 2026 Nuvoton Technology Corp.
> + *
> + * Author: Joey Lu <a0987203069@gmail.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/clk.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "ma35_drm.h"
> +
> +#define ma35_encoder(e) \
> +	container_of(e, struct ma35_interface, drm_encoder)
> +#define ma35_connector(c) \
> +	container_of(c, struct ma35_interface, drm_connector)
> +
> +static void ma35_encoder_mode_set(struct drm_encoder *encoder,
> +	struct drm_crtc_state *crtc_state,
> +	struct drm_connector_state *conn_state)
> +{
> +	struct drm_device *drm_dev = encoder->dev;
> +	struct ma35_drm *priv = ma35_drm(drm_dev);
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> +	int result;
> +
> +	clk_set_rate(priv->dcupclk, adjusted_mode->clock * 1000);
> +	result = DIV_ROUND_UP(clk_get_rate(priv->dcupclk), 1000);
> +	drm_dbg(drm_dev, "Pixel clock: %d kHz; request : %d kHz\n", result, adjusted_mode->clock);
> +}
> +
> +static int ma35_encoder_atomic_check(struct drm_encoder *encoder,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct ma35_interface *interface = ma35_encoder(encoder);
> +	struct drm_display_info *display_info = &conn_state->connector->display_info;
> +
> +	interface->bus_flags = display_info->bus_flags;
> +
> +	return 0;
> +}
> +
> +static const struct drm_encoder_helper_funcs ma35_encoder_helper_funcs = {
> +	.atomic_mode_set	= ma35_encoder_mode_set,
> +	.atomic_check		= ma35_encoder_atomic_check,
> +};
> +
> +static const struct drm_connector_funcs ma35_connector_funcs = {
> +	.reset			= drm_atomic_helper_connector_reset,
> +	.fill_modes		= drm_helper_probe_single_connector_modes,
> +	.destroy		= drm_connector_cleanup,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int ma35_connector_get_modes(struct drm_connector *drm_connector)
> +{
> +	struct ma35_drm *priv = ma35_drm(drm_connector->dev);
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +	struct drm_mode_config *mode_config = &drm_dev->mode_config;
> +	struct ma35_interface *interface = ma35_connector(drm_connector);
> +	int count;
> +
> +	if (!interface->drm_panel) {
> +		/* Use the default modes */
> +		count = drm_add_modes_noedid(drm_connector,
> +				mode_config->max_width, mode_config->max_height);
> +		drm_set_preferred_mode(drm_connector,
> +				mode_config->max_width, mode_config->max_height);
> +
> +		return count;
> +	} else {
> +		return drm_panel_get_modes(interface->drm_panel, drm_connector);
> +	}
> +}
> +
> +static const struct drm_connector_helper_funcs ma35_connector_helper_funcs = {
> +	.get_modes		= ma35_connector_get_modes,
> +};
> +
> +static void ma35_encoder_attach_crtc(struct ma35_drm *priv)
> +{
> +	uint32_t possible_crtcs = drm_crtc_mask(&priv->crtc->drm_crtc);
> +
> +	priv->interface->drm_encoder.possible_crtcs = possible_crtcs;
> +}
> +
> +static int ma35_bridge_try_attach(struct ma35_drm *priv, struct ma35_interface *interface)
> +{
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +	struct device *dev = drm_dev->dev;
> +	struct device_node *of_node = dev->of_node;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(of_node, 0, 0, &panel, &bridge);
> +
> +	if (ret) {
> +		drm_info(drm_dev, "No panel or bridge found\n");
> +		return ret;
> +	}
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +
> +	interface->drm_panel = panel;
> +	interface->drm_bridge = bridge;
> +
> +	ret = drm_bridge_attach(&interface->drm_encoder, bridge,
> +				NULL, 0);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to attach bridge to encoder\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int ma35_interface_init(struct ma35_drm *priv)
> +{
> +	struct ma35_interface *interface;
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +	struct drm_encoder *drm_encoder;
> +	int ret;
> +
> +	/* encoder */
> +	interface = drmm_simple_encoder_alloc(drm_dev,
> +					struct ma35_interface, drm_encoder, DRM_MODE_ENCODER_DPI);
> +	if (!interface) {
> +		drm_err(drm_dev, "Failed to initialize encoder\n");
> +		goto error_early;
> +	}
> +	priv->interface = interface;
> +	drm_encoder = &interface->drm_encoder;
> +	drm_encoder_helper_add(drm_encoder,
> +			       &ma35_encoder_helper_funcs);
> +
> +	/* attach encoder to crtc */
> +	ma35_encoder_attach_crtc(priv);
> +
> +	/* attach bridge to encoder if found one in device tree */
> +	ret = ma35_bridge_try_attach(priv, interface);
> +	if (!ret)
> +		return 0;
> +
> +	/* fallback to raw dpi connector */
> +	ret = drm_connector_init(drm_dev, &interface->drm_connector,
> +					&ma35_connector_funcs,
> +					DRM_MODE_CONNECTOR_DPI);

drmm_connector_init

> +static int ma35_plane_atomic_check(struct drm_plane *drm_plane,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm_dev = drm_plane->dev;
> +	struct ma35_layer *layer = ma35_layer(drm_plane);
> +	struct drm_plane_state *new_state =
> +		drm_atomic_get_new_plane_state(state, drm_plane);
> +	struct drm_crtc *crtc = new_state->crtc;
> +	struct drm_framebuffer *fb = new_state->fb;
> +	struct drm_crtc_state *crtc_state;
> +	bool can_position;
> +	u32 format;
> +
> +	if (!crtc)
> +		return 0;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;

You don't necessarily have a crtc state in drm_atomic_state. You should
use drm_atomic_get_crtc_state.

> +static int ma35_cursor_plane_atomic_check(struct drm_plane *drm_plane,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_device *drm_dev = drm_plane->dev;
> +	struct drm_plane_state *new_state =
> +		drm_atomic_get_new_plane_state(state, drm_plane);
> +	struct drm_framebuffer *fb = new_state->fb;
> +	struct drm_crtc *crtc = new_state->crtc;
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (!fb)
> +		return 0;
> +
> +	if (!crtc)
> +		return -EINVAL;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	if (WARN_ON(!crtc_state))
> +		return -EINVAL;

Ditto


> +static int ma35_plane_set_property(struct drm_plane *drm_plane,
> +	struct drm_plane_state *state, struct drm_property *property,
> +	uint64_t val)
> +{
> +	struct ma35_layer *layer = ma35_layer(drm_plane);
> +
> +	if (property == layer->blend_mode_prop)
> +		layer->config.blend_mode = val;
> +	else if (property == layer->src_alpha_mode_prop)
> +		layer->config.alpha_mode[0] = val;
> +	else if (property == layer->dst_alpha_mode_prop)
> +		layer->config.alpha_mode[1] = val;
> +	else if (property == layer->src_color_prop)
> +		layer->config.src_color = val;
> +	else if (property == layer->dst_color_prop)
> +		layer->config.dst_color = val;
> +	else if (property == layer->swizzle_prop)
> +		layer->config.swizzle = val;
> +	else if (property == layer->colorkeylo_prop)
> +		layer->config.colorkeylo = val;
> +	else if (property == layer->colorkeyup_prop)
> +		layer->config.colorkeyup = val;
> +	else if (property == layer->background_prop)
> +		layer->config.background = val;
> +	else if (property == layer->foreground_prop)
> +		layer->config.foreground = val;
> +	else if (property == drm_plane->hotspot_x_property)
> +		state->hotspot_x = val;
> +	else if (property == drm_plane->hotspot_y_property)
> +		state->hotspot_y = val;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int ma35_plane_get_property(struct drm_plane *drm_plane,
> +	const struct drm_plane_state *state, struct drm_property *property,
> +	uint64_t *val)
> +{
> +	struct ma35_layer *layer = ma35_layer(drm_plane);
> +
> +	if (property == layer->blend_mode_prop)
> +		*val = layer->config.blend_mode;
> +	else if (property == layer->src_alpha_mode_prop)
> +		*val = layer->config.alpha_mode[0];
> +	else if (property == layer->dst_alpha_mode_prop)
> +		*val = layer->config.alpha_mode[1];
> +	else if (property == layer->src_color_prop)
> +		*val = layer->config.src_color;
> +	else if (property == layer->dst_color_prop)
> +		*val = layer->config.dst_color;
> +	else if (property == layer->swizzle_prop)
> +		*val = layer->config.swizzle;
> +	else if (property == layer->colorkeylo_prop)
> +		*val = layer->config.colorkeylo;
> +	else if (property == layer->colorkeyup_prop)
> +		*val = layer->config.colorkeyup;
> +	else if (property == layer->background_prop)
> +		*val = layer->config.background;
> +	else if (property == layer->foreground_prop)
> +		*val = layer->config.foreground;
> +	else if (property == drm_plane->hotspot_x_property)
> +		*val = state->hotspot_x;
> +	else if (property == drm_plane->hotspot_y_property)
> +		*val = state->hotspot_y;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}

Same comment for the properties than for the CRTC.

> +static int ma35_layer_create(struct ma35_drm *priv,
> +			      struct device_node *of_node, u32 index,
> +			      enum drm_plane_type type)
> +{
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +	struct device *dev = drm_dev->dev;
> +	struct ma35_layer *layer;
> +	int ret;
> +
> +	layer = devm_kzalloc(dev, sizeof(*layer), GFP_KERNEL);
> +	if (!layer) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}

This needs to be allocated using drmm

Maxime

--g4r6sbvrwssiwjt7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXdjLQAKCRAnX84Zoj2+
dgd3AYDkBUaC2XYq45FLwg5T/LHxA4sH4x1YU4nZERTR0S87S4rvxqJPkMHCw/n5
zNGBnmwBfA5BCFbTw+yjdxtQ+ZMj0ClHdD0zpDTx76tj94y4OKB+qmdyXglB2F/3
qI04dQPCSQ==
=2vCo
-----END PGP SIGNATURE-----

--g4r6sbvrwssiwjt7--

