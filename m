Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614E4EC1EB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjCBSZG+k+B4T10VrINc6kvLxA4cDRHvyY5wJ6q8znQ=; b=H4aSDx1WHJ4y6l8VGUdyuKrGlL
	+dYuaysshuiP8pJAm4wt1dhpcvrKd27F8jIg03TBdvaV8y9YDEWXlVuig99RNltjY28CIBlcMQ/oV
	j5NvZ56Qpv+x7HUF1K7S57ELhuqKe91MviXn7XTPJoOrqsj/sWgPpRfmTVvji0f4g/tOH45nfDA9c
	t9dN4GxoxlzNLYa098PjDhVZvQKwvW0TB+0vC+zQWx9Y7QKS8Ua4AF295JLaUp1VDvEPx8JGIo3+t
	U/rNWESINfRBrDxupIELBMSxmhrhJNIRhNPwzLhDghv0RpdDjo2HvHyneOrKcezc1DTig904Z0cUQ
	/PNhLbxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzJV-00000009wPo-3XJ1;
	Thu, 05 Feb 2026 13:22:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzJQ-00000009wPT-3upO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3450544406;
	Thu,  5 Feb 2026 13:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8500AC4CEF7;
	Thu,  5 Feb 2026 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770297744;
	bh=TkfBnRNycUzOt57ZGltou8dZywkW6jXvCL0D1cY1hQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRt/BFMmWrKitSaNmQpRkeFL+wUlu0tz2R5EEbdfnxqfPxqObnM5CjORh/y3Pl1Yc
	 XgGI2FT5G8myHoMBFHQD2+SAPR4kEIABNiZaShlcIMcoXEgs8cyqfpNtzqrtK4sqfx
	 G4nadJP8LWubRDvacLfmFQYuTs/x1XJozZp5bRUEBzkb057RAo71EEtHU7uw99WOuX
	 VsdOlCtEBHgmUJfA7WKYre9QEwKqsJYhwI6mZxJ9QUnoqea6GRd9F17ATu+XpjuqdL
	 WlbtKvApqLx2dy5Ic3yIs4UxZrfrkOy6bdIQEPHEIWmNLnYgK14FxXLK2fMvlAw83n
	 K1z9AeIgYA7kg==
Date: Thu, 5 Feb 2026 14:22:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <20260205-classic-innocent-angelfish-5c3cd2@quoll>
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129040532.382693-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_052227_816544_582669F8 
X-CRM114-Status: GOOD (  20.89  )
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

On Thu, Jan 29, 2026 at 12:05:32PM +0800, Joey Lu wrote:
> Add DRM driver support for the Display Control Unit (DCU)
> found in Nuvoton MA35D1 SoCs.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig                  |   1 +
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/nuvoton/Kconfig          |  21 +
>  drivers/gpu/drm/nuvoton/Makefile         |   7 +
>  drivers/gpu/drm/nuvoton/ma35_crtc.c      | 372 ++++++++++++++
>  drivers/gpu/drm/nuvoton/ma35_crtc.h      |  67 +++
>  drivers/gpu/drm/nuvoton/ma35_drm.c       | 371 ++++++++++++++
>  drivers/gpu/drm/nuvoton/ma35_drm.h       |  48 ++
>  drivers/gpu/drm/nuvoton/ma35_interface.c | 193 ++++++++
>  drivers/gpu/drm/nuvoton/ma35_interface.h |  30 ++
>  drivers/gpu/drm/nuvoton/ma35_plane.c     | 603 +++++++++++++++++++++++
>  drivers/gpu/drm/nuvoton/ma35_plane.h     | 115 +++++
>  drivers/gpu/drm/nuvoton/ma35_regs.h      |  88 ++++

No maintainers? Why would we want to take unmaintained code?

> +static void ma35_mode_fini(struct ma35_drm *priv)
> +{
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +
> +	drm_kms_helper_poll_fini(drm_dev);
> +}
> +
> +static int ma35_clocks_prepare(struct ma35_drm *priv)
> +{
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +	struct device *dev = drm_dev->dev;
> +	int ret;
> +
> +	priv->dcuclk = devm_clk_get(dev, "dcu_gate");
> +	if (IS_ERR(priv->dcuclk)) {
> +		dev_err(dev, "Failed to get display core clock\n");

Don't spam logs on defers. Syntax is in entire probe path: return
dev_err_probe

> +		return PTR_ERR(priv->dcuclk);
> +	}
> +
> +	ret = clk_prepare_enable(priv->dcuclk);

Why this cannot be devm_clk_get_enabled?

> +	if (ret) {
> +		dev_err(dev, "Failed to enable display core clock\n");
> +		return ret;
> +	}
> +
> +	priv->dcupclk = devm_clk_get(dev, "dcup_div");
> +	if (IS_ERR(priv->dcupclk)) {
> +		dev_err(dev, "Failed to get display pixel clock\n");
> +		return PTR_ERR(priv->dcupclk);
> +	}
> +
> +	ret = clk_prepare_enable(priv->dcupclk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable display pixel clock\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ma35_clocks_unprepare(struct ma35_drm *priv)
> +{
> +	struct clk **clocks[] = {
> +		&priv->dcuclk,
> +		&priv->dcupclk,
> +	};
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(clocks); i++) {
> +		if (!*clocks[i])
> +			continue;
> +
> +		clk_disable_unprepare(*clocks[i]);
> +		*clocks[i] = NULL;

Huh, pretty complicated and pointless code. This should be devm and bulk
API...

> +	}
> +
> +	return 0;
> +}
> +
> +static int ma35_drm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ma35_drm *priv;
> +	struct drm_device *drm_dev;
> +	void __iomem *base;
> +	struct regmap *regmap = NULL;
> +	int irq;
> +	int ret;
> +
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret && ret != -ENODEV) {
> +		dev_err(dev, "Failed to get optional reserved memory: %d\n", ret);
> +		return ret;
> +	}
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base)) {
> +		dev_err(dev, "Failed to map I/O base\n");

Why aren't you using dev_err_probe?

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

Why do you print error twice? Once in the function, second time here?

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

Best regards,
Krzysztof


