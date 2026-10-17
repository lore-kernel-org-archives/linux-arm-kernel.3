Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF24CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkjlY/beaZgsUWOJV3FqYfYFw4hgkZcyLd/jvUyEvrY=; b=Fhd+XgHOpk10sfDGtQNs666Opn
	yd+feEMRiuzK58rw66+KEGaYGshCj6gDVIGgCiR7ObF6voQupCZKLW3hJXs0EHDDYSROqyihatFRh
	RuhNAg8QCQ1i/J0BuC1MDbGuEYNV5LBkO2GZFke24hCttsxpTdh1ZxkkyeOa6NOc7KhQqdboVuqVg
	BWxG2pVMQDIgYs/fZbNhn8WtbRtIdsOIelqQJqO5pSMILc/B9AeDY/bhhV55BTDbwfY3mN5B14Zwe
	PVUG2K1R2IJvq5ZT70YMlgLQskzWZ6ppK/Rcyyc6bVdYfG/utRq6OoUmsjAtg3tn8+LBswEXBvlQE
	93wyDquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8fB-000000052SW-1g2U;
	Sat, 17 Oct 2026 17:57:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8f9-000000052SJ-3fwB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 17:57:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4343241595;
	Sat, 17 Oct 2026 17:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738911F000C4;
	Sat, 17 Oct 2026 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259863;
	bh=BkjlY/beaZgsUWOJV3FqYfYFw4hgkZcyLd/jvUyEvrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iLPO7c74p99vVCGpVKY6iH8+IY8+3HTe1fDzw2F/f5sbjOi4lSoFsYNUyDYKMh77C
	 pjtQ5Qs5jLlrsXBtGHtkR+56TlmYM+l4f8N9di1swhh7KILpiQCSWyDRggyEn5nk+f
	 w/JXFv+Wo1Y8ZD3+1t/VHDTiAuz15uZ6/uMsG7t4tFLA3jwbbS5708poHtpotyRCNu
	 9IQiShE+/C/+mNemcsHoBSonfCUTsOFHhIweoSHDDk2PhSuP9UVcBo0MEufN3XoyKk
	 tnYRIEBl9aq58LuOrgmoqSsFVskYaUxRGuAwaQDktGMxT1U+8ikoJImcxIHT04XT8C
	 3XBME4mk0+rpw==
Date: Sat, 17 Oct 2026 19:57:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Simeon Marijon <simeon.marijon@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 3/3] nvmem: stm32: add TAMP nvmem driver
Message-ID: <20261017-positive-curassow-from-sirius-c283c0@quoll>
References: <20261016-upstream_nvram_reworked-v3-0-f65908490cf7@foss.st.com>
 <20261016-upstream_nvram_reworked-v3-3-f65908490cf7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-upstream_nvram_reworked-v3-3-f65908490cf7@foss.st.com>
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

On Fri, Oct 16, 2026 at 05:26:05PM +0200, Patrice Chotard wrote:
> +static int stm32_tamp_nvram_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct stm32_tamp_nvram_priv *priv;
> +	struct resource *res;
> +	struct device_node *of_node;
> +	const struct of_device_id *of_id;
> +	void __iomem *base_addr;
> +	int *zones_end;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +
> +	of_node = dev_of_node(dev);
> +	if (!of_node) {
> +		dev_err(dev, "Can't get of node of the device\n");
> +		return -ENODEV;

Entire dev_of_node and if() look not necessary.

> +	}
> +
> +	of_id = of_match_node(stm32_tamp_nvram_of_match, of_node);
> +	if (!of_id) {
> +		dev_err(dev, "Can't get of_id of the device\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->data = (struct stm32_tamp_nvram_plat *)of_id->data;

Use wrapper - device_get_match_data or something similar (don't remember
exactly).

> +	if (!priv->data) {
> +		dev_err(dev, "Can't get platform data of the node\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->config_regmap = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(priv->config_regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->config_regmap),
> +				     "Can't get TAMP syscon regmap\n");
> +
> +	priv->idx_bkpreg_zones_end = stm32_tamp_nvram_get_backup_zones(priv);
> +	if (IS_ERR(priv->idx_bkpreg_zones_end))
> +		return dev_err_probe(dev, PTR_ERR(priv->idx_bkpreg_zones_end),
> +				     "Can't determine protection zone\n");
> +
> +	zones_end = priv->idx_bkpreg_zones_end;
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +

Drop blank line

> +	if (!res) {
> +		dev_err(dev, "Can't get resource\n");
> +		return -ENODEV;
> +	}
> +
> +	base_addr = devm_ioremap_resource(dev, res);

You cannot use wrapper over these two? And I am a bit confused - device
takes syscon from the parent, so how does it map also another memory?

> +	if (IS_ERR(base_addr)) {
> +		dev_err(dev, "Can't remap resource\n");
> +		return PTR_ERR(base_addr);
> +	}
> +
> +	priv->cfg.name = "stm32-tamp-nvram";
> +	priv->cfg.word_size = 1;
> +	priv->cfg.stride = 1;
> +	priv->cfg.dev = dev;
> +	priv->cfg.priv = priv;
> +	priv->cfg.owner = THIS_MODULE;
> +	priv->cfg.type = NVMEM_TYPE_BATTERY_BACKED;
> +	priv->cfg.size = resource_size(res);
> +	priv->cfg.reg_read = stm32_tamp_nvram_read;
> +	priv->cfg.reg_write = stm32_tamp_nvram_write;
> +
> +	if (priv->data->nb_zones == NB_ZONES_STM32MP2) {
> +		priv->bkpreg_access = stm32_tamp_get_access_rights_mp2x(priv);
> +
> +		if (IS_ERR(priv->bkpreg_access))
> +			return PTR_ERR(priv->bkpreg_access);
> +
> +		dev_dbg(dev, "\n"
> +			"Zone 1-RIF1 %3d - %3d %c%c\n"
> +			"Zone 1-RIF2 %3d - %3d %c%c\n"
> +			"Zone 2-RIF1 %3d - %3d %c%c\n"
> +			"Zone 2-RIF2 %3d - %3d %c%c\n"
> +			"Zone 3-RIF1 %3d - %3d %c%c\n"
> +			"Zone 3-RIF0 %3d - %3d %c%c\n"
> +			"Zone 3-RIF2 %3d - %3d %c%c\n",
> +			0,
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
> +						false) ? 'W' : '-'
> +				);
> +	} else if (priv->data->nb_zones == NB_ZONES_STM32MP1) {
> +		priv->bkpreg_access = stm32mp1_tamp_bkpreg_access;
> +
> +		dev_dbg(dev, "\n"
> +			"Zone 1 %3d - %3d %c%c\n"
> +			"Zone 2 %3d - %3d %c%c\n"
> +			"Zone 3 %3d - %3d %c%c\n",
> +			0,
> +			zones_end[BKPREG_PROTECTION_ZONE_1],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_1],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_1] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_2],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_2],
> +						false) ? 'W' : '-',
> +			zones_end[BKPREG_PROTECTION_ZONE_2] + 1,
> +			zones_end[BKPREG_PROTECTION_ZONE_3],
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3],
> +						true) ? 'R' : '-',
> +			stm32_tamp_nvram_rights(priv,
> +						zones_end[BKPREG_PROTECTION_ZONE_3],
> +						false) ? 'W' : '-');
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->bkpregs_regmap = devm_regmap_init_mmio(dev, base_addr,
> +						     priv->data->bkpregs_regmap_cfg);
> +	if (IS_ERR(priv->bkpregs_regmap)) {
> +		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(priv->bkpregs_regmap));
> +		return PTR_ERR(priv->bkpregs_regmap);

return dev_err_probe


Best regards,
Krzysztof


