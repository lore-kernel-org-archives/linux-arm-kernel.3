Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50977D3B998
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwjmPcSu14wQCPYgJgge82L9Ll6baGo005ISnWVoQlM=; b=uMZojxJGCF+J/Kn9MguGiFdjXL
	PYd15oHCXz/pMASArjKtrGD6MKSwZBGqhpLNM0CQH1qHuehXrQu10R/zKMzUYT4zS3ZWtKmO2tHET
	2D9h+OCvYe86nLullcYy42uEHn7ZsJsN6f94vneNh263GxYHCokWYEyE425iVSYzDBs0lTGLTPwCR
	O+9oXHzm7zDFIEl4Hja86kenmdbehEsgk26r2ge0wrA83ALOY5Leqig4S7K1Qp0iEbzwLvH9DdWI+
	fj3DHVbubq3xI32soOPNmPL0K7F9gQFB0Si6iNOBBdYcOC/f4xaIx+u3CtPtVkaWHA7zOOrb9coNu
	H6+lIcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwri-0000000Auiq-2La0;
	Tue, 26 Nov 2024 14:48:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwqi-0000000AuZB-44hb;
	Tue, 26 Nov 2024 14:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OwjmPcSu14wQCPYgJgge82L9Ll6baGo005ISnWVoQlM=; b=TuPA1sWR/GwtWBHkIHSECIpxQi
	Ghc2I/6IumfrTaeGyMaVa8vs0aaH6NeLNexkbnar4QlVWgmaOUelJYUl9h0nj9Y7u+t2lpgt6zeL+
	fwxZCNj+4sivu83rVU0tYihZoea1gWRDTE7/VeOPMMFTXhbDjzN2LckhvCYJbB9pNpuN/ZmrAytBd
	2Uf5gT0UPncgU4ZqzK9ZOW80lIaYRJFt8DR64Se0/qd3qHcqkPewXV3hxws/FAB/HEYlPDa8z0yR9
	bCGeKwhsjK2FIBJyiC2wiQySkPTz0D9AIIhlxTZhtvDLHSK1B/rYU3HAcOFCibU9JmW+2Rh75cFBG
	jHqwEgKA==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tFwq3-0000rm-TY; Tue, 26 Nov 2024 15:46:51 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/3] drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
Date: Tue, 26 Nov 2024 15:46:50 +0100
Message-ID: <1909309.CQOukoFCf9@diego>
In-Reply-To: <881f2820-ff18-4d60-8bf3-f8cca1be5914@linaro.org>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-2-heiko@sntech.de>
 <881f2820-ff18-4d60-8bf3-f8cca1be5914@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_064733_037148_86FEB331 
X-CRM114-Status: GOOD (  24.33  )
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

Hi,

Am Mittwoch, 6. November 2024, 14:54:39 CET schrieb neil.armstrong@linaro.org:
> > +#define UPDATE(v, h, l)			(((v) << (l)) & GENMASK((h), (l)))
> 
> I'm not super fan of this macro, overall I thinkg you should switch to
> regmap and make use of regmap_update_bits and drop dsi2_write/read wrappers
> to readl/writel.

Yep you're right. That macro acutally is just FIELD_PREP in disguise ;-)
So I've gone with that (and regmap).


> <snip>
> 
> > +
> > +static struct dw_mipi_dsi2 *
> > +__dw_mipi_dsi2_probe(struct platform_device *pdev,
> > +		     const struct dw_mipi_dsi2_plat_data *plat_data)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct reset_control *apb_rst;
> > +	struct dw_mipi_dsi2 *dsi2;
> > +	int ret;
> > +
> > +	dsi2 = devm_kzalloc(dev, sizeof(*dsi2), GFP_KERNEL);
> > +	if (!dsi2)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	dsi2->dev = dev;
> > +	dsi2->plat_data = plat_data;
> > +
> > +	if (!plat_data->phy_ops->init || !plat_data->phy_ops->get_lane_mbps ||
> > +	    !plat_data->phy_ops->get_timing)
> > +		return dev_err_ptr_probe(dev, -ENODEV, "Phy not properly configured\n");
> > +
> > +	if (!plat_data->base) {
> > +		dsi2->base = devm_platform_ioremap_resource(pdev, 0);
> > +		if (IS_ERR(dsi2->base))
> > +			return ERR_PTR(-ENODEV);
> > +	} else {
> > +		dsi2->base = plat_data->base;
> > +	}
> > +
> > +	dsi2->pclk = devm_clk_get(dev, "pclk");
> > +	if (IS_ERR(dsi2->pclk))
> > +		return dev_err_cast_probe(dev, dsi2->pclk, "Unable to get pclk\n");
> > +
> > +	dsi2->sys_clk = devm_clk_get(dev, "sys");
> > +	if (IS_ERR(dsi2->sys_clk))
> > +		return dev_err_cast_probe(dev, dsi2->sys_clk, "Unable to get sys_clk\n");
> > +
> > +	/*
> > +	 * Note that the reset was not defined in the initial device tree, so
> > +	 * we have to be prepared for it not being found.
> > +	 */
> > +	apb_rst = devm_reset_control_get_optional_exclusive(dev, "apb");
> > +	if (IS_ERR(apb_rst))
> > +		return dev_err_cast_probe(dev, apb_rst, "Unable to get reset control\n");
> > +
> > +	if (apb_rst) {
> > +		ret = clk_prepare_enable(dsi2->pclk);
> > +		if (ret) {
> > +			dev_err(dev, "%s: Failed to enable pclk\n", __func__);
> > +			return ERR_PTR(ret);
> > +		}
> > +
> > +		reset_control_assert(apb_rst);
> > +		usleep_range(10, 20);
> > +		reset_control_deassert(apb_rst);
> > +
> > +		clk_disable_unprepare(dsi2->pclk);
> > +	}
> > +
> > +	pm_runtime_enable(dev);
> > +
> > +	dsi2->dsi_host.ops = &dw_mipi_dsi2_host_ops;
> > +	dsi2->dsi_host.dev = dev;
> > +	ret = mipi_dsi_host_register(&dsi2->dsi_host);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
> > +		pm_runtime_disable(dev);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	dsi2->bridge.driver_private = dsi2;
> > +	dsi2->bridge.funcs = &dw_mipi_dsi2_bridge_funcs;
> > +	dsi2->bridge.of_node = pdev->dev.of_node;
> > +
> > +	return dsi2;
> > +}
> > +
> > +static void __dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2)
> > +{
> > +	mipi_dsi_host_unregister(&dsi2->dsi_host);
> > +
> > +	pm_runtime_disable(dsi2->dev);
> > +}
> > +
> > +/*
> > + * Probe/remove API, used from platforms based on the DRM bridge API.
> > + */
> > +struct dw_mipi_dsi2 *
> > +dw_mipi_dsi2_probe(struct platform_device *pdev,
> > +		   const struct dw_mipi_dsi2_plat_data *plat_data)
> > +{
> > +	return __dw_mipi_dsi2_probe(pdev, plat_data);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_probe);
> > +
> > +void dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2)
> > +{
> > +	__dw_mipi_dsi2_remove(dsi2);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_remove);
> 
> Since it's not use yet, you should probably drop those since it's dead
> code.

Though it is used. The Rockchip glue in patch 3 calls 
	dsi2->dmd = dw_mipi_dsi2_probe(pdev, &dsi2->pdata);
in its dw_mipi_dsi2_rockchip_probe() and
	dw_mipi_dsi2_remove(dsi2->dmd);
in its dw_mipi_dsi2_rockchip_remove() for the whole bridge setup

Similarly the below bind/unbind functions are called for the bridge-attach
from the component part of the Rockchip glue.

Which is the same way the dsi1 driver handles things right now.


> > +
> > +/*
> > + * Bind/unbind API, used from platforms based on the component framework.
> > + */
> > +int dw_mipi_dsi2_bind(struct dw_mipi_dsi2 *dsi2, struct drm_encoder *encoder)
> > +{
> > +	return drm_bridge_attach(encoder, &dsi2->bridge, NULL, 0);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_bind);
> > +
> > +void dw_mipi_dsi2_unbind(struct dw_mipi_dsi2 *dsi2)
> > +{
> > +}
> > +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_unbind);

[...]

> > +struct dw_mipi_dsi2 *dw_mipi_dsi2_probe(struct platform_device *pdev,
> > +					const struct dw_mipi_dsi2_plat_data *plat_data);
> > +void dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2);
> > +int dw_mipi_dsi2_bind(struct dw_mipi_dsi2 *dsi2, struct drm_encoder *encoder);
> > +void dw_mipi_dsi2_unbind(struct dw_mipi_dsi2 *dsi2);
> > +
> > +#endif /* __DW_MIPI_DSI2__ */
> 
> Overall the driver is very close to dw-mipi-dsi, si it's overall good!

that was the intention ... so that I don't introduce issues that were
already solved elsewhere ;-) .

Heiko



