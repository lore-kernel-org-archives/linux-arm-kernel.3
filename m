Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FD8C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5WaM35pwxHwK28alQOsJh/6i4bHe6dG0o1Fudm0Ogw=; b=CJmjzXjrzkeK1v2gJbl58p9CQa
	SqDiMz3mFoz9ResAmVPp8yZdVrtP7A6s2cpwfn9NdTN1u+l7OM6l8tjhSTP74lsOuxjgUTgkKZSXs
	OsvQpo+7K8iz28DpqtNmzdLYGEEewYW4P2btzVh3puzWlhFkR7IzcKW9zqTCLoM3ZKQ0xZerznzpG
	I0XBxytyvWeo2UHlAvSbOWCgLC0R9ksWG7kFTLX/Kr+ec7wz867wIIEVRNns0gI5zvhuY6P0YNUMH
	kArzp+SaYe26oQs32sEkIqOpBAoq1jmgysjcQMUBSi0FGUAJmVQfs7EORVA8c5ngR/7tIw1P92ozS
	Wle7ediA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u230t-00000002zlB-3Efs;
	Tue, 08 Apr 2025 07:04:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22wx-00000002ylu-1MJj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 07:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FF2649B13;
	Tue,  8 Apr 2025 07:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0479AC4CEE5;
	Tue,  8 Apr 2025 07:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744095646;
	bh=42m28A8NBmP4XndDX2mAe2EuPrpPYHWaO9gsgxX4IUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJFNd62EvWR5e0ge0D3V4hsAoe7kHxorX/C3lzPxgu5wghnpM52S/nUzFtu9GhYYY
	 FCqZtqF+dTvsXf8G2oMIF4AyGHYtocxxnFfI3s8Q9xaNfiYhP2A9Es9oIoOaQ5dX11
	 ZjdvrtOCWVeK4LkPVtuAJK4M8tJFDTYGs0rX2Pd5WOBzksLBsLHMMRsIOHK3+dKI9j
	 jG8MyQvxg+C6GXsVAB4tYLAEP7tVHI4twEOZreXWpuuPyw+c6rzdqX8qngCtksdb7/
	 KwP5JtME2qwrzJzCl9uCPjU6XLOgXOhMMevxQ8RF20qsi0mxlCDnFHEacxZ0rQiBym
	 JJTjzxWvCnFog==
Date: Tue, 8 Apr 2025 09:00:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, christophe.kerello@foss.st.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 3/7] memory: Add STM32 Octo Memory Manager driver
Message-ID: <20250408-shiny-whimsical-pigeon-4e2c9a@shite>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-3-7b7716c1c1f6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407-upstream_ospi_v6-v8-3-7b7716c1c1f6@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_000047_417279_D1809EA2 
X-CRM114-Status: GOOD (  30.55  )
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

On Mon, Apr 07, 2025 at 03:27:34PM GMT, Patrice Chotard wrote:
> +	for (i = 0; i < omm->nb_child; i++) {
> +		idx = of_property_match_string(dev->of_node,
> +					       "memory-region-names",
> +					       mm_name[i]);
> +		if (idx < 0)
> +			continue;
> +
> +		/* res1 only used on second loop iteration */
> +		res1.start = res.start;
> +		res1.end = res.end;
> +
> +		node = of_parse_phandle(dev->of_node, "memory-region", idx);
> +		if (!node)
> +			continue;
> +
> +		ret = of_address_to_resource(node, 0, &res);
> +		if (ret) {
> +			dev_err(dev, "unable to resolve memory region\n");

Where do you drop reference to node?

> +			return ret;
> +		}
> +
> +		/* check that memory region fits inside OMM memory map area */
> +		if (!resource_contains(omm->mm_res, &res)) {
> +			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
> +				mm_name[i]);
> +			dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
> +
> +			return -EFAULT;
> +		}
> +
> +		if (i == 1) {
> +			mm_ospi2_size = resource_size(&res);
> +
> +			/* check that OMM memory region 1 doesn't overlap memory region 2 */
> +			if (resource_overlaps(&res, &res1)) {
> +				dev_err(dev, "OMM memory-region %s overlaps memory region %s\n",
> +					mm_name[0], mm_name[1]);
> +				dev_err(dev, "%pR overlaps %pR\n", &res1, &res);
> +
> +				return -EFAULT;
> +			}
> +		}
> +	}
> +
> +	syscfg_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "st,syscfg-amcr");
> +	if (IS_ERR(syscfg_regmap))
> +		return dev_err_probe(dev, PTR_ERR(syscfg_regmap),
> +				     "Failed to get st,syscfg-amcr property\n");
> +
> +	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 1,
> +					 &amcr_base);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32_index(dev->of_node, "st,syscfg-amcr", 2,
> +					 &amcr_mask);
> +	if (ret)
> +		return ret;
> +
> +	amcr = mm_ospi2_size / SZ_64M;
> +
> +	if (set)
> +		regmap_update_bits(syscfg_regmap, amcr_base, amcr_mask, amcr);
> +
> +	/* read AMCR and check coherency with memory-map areas defined in DT */
> +	regmap_read(syscfg_regmap, amcr_base, &read_amcr);
> +	read_amcr = read_amcr >> (ffs(amcr_mask) - 1);
> +
> +	if (amcr != read_amcr) {
> +		dev_err(dev, "AMCR value not coherent with DT memory-map areas\n");
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
> +{
> +	/* As there is only 2 children, remember first child in case of error */
> +	struct clk *first_child_clk = NULL;
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	u8 i;

iterations are always unsigned ints (or ints), not other types.

> +	int ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		if (enable) {
> +			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
> +			if (ret) {
> +				if (first_child_clk)
> +					clk_disable_unprepare(first_child_clk);
> +
> +				dev_err(dev, "Can not enable clock\n");

That's unnecessary complicated. Instead create error handling label,
goto it and unwind iterating from last position of 'i'.

> +				return ret;
> +			}
> +		} else {
> +			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
> +		}
> +
> +		first_child_clk = omm->clk_bulk[i + 1].clk;
> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32_omm_disable_child(struct device *dev)
> +{
> +	static const char * const resets_name[] = {"ospi1", "ospi2"};
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	struct reset_control *reset;
> +	int ret;
> +	u8 i;
> +
> +	ret = stm32_omm_toggle_child_clock(dev, true);
> +	if (!ret)
> +		return ret;
> +
> +	for (i = 0; i < omm->nb_child; i++) {
> +		reset = reset_control_get_exclusive(dev, resets_name[i]);
> +		if (IS_ERR(reset)) {
> +			dev_err(dev, "Can't get %s reset\n", resets_name[i]);

You should acquire resources in the probe, not on every suspend/resume.
Then you can use `return dev_err_probe`.

> +			return PTR_ERR(reset);
> +		};
> +
> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
> +		reset_control_assert(reset);
> +		udelay(2);
> +		reset_control_deassert(reset);
> +
> +		reset_control_put(reset);
> +	}
> +
> +	return stm32_omm_toggle_child_clock(dev, false);
> +}
> +
> +static int stm32_omm_configure(struct device *dev)
> +{
> +	static const char * const clocks_name[] = {"omm", "ospi1", "ospi2"};
> +	struct stm32_omm *omm = dev_get_drvdata(dev);
> +	unsigned long clk_rate_max = 0;
> +	u32 mux = 0;
> +	u32 cssel_ovr = 0;
> +	u32 req2ack = 0;
> +	struct reset_control *rstc;
> +	unsigned long clk_rate;
> +	int ret;
> +	u8 i;
> +
> +	for (i = 0; i < OMM_CLK_NB; i++)
> +		omm->clk_bulk[i].id = clocks_name[i];
> +
> +	/* retrieve OMM, OSPI1 and OSPI2 clocks */
> +	ret = devm_clk_bulk_get(dev, OMM_CLK_NB, omm->clk_bulk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get OMM/OSPI's clocks\n");
> +
> +	/* Ensure both OSPI instance are disabled before configuring OMM */
> +	ret = stm32_omm_disable_child(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* parse children's clock */
> +	for (i = 1; i <= omm->nb_child; i++) {
> +		clk_rate = clk_get_rate(omm->clk_bulk[i].clk);
> +		if (!clk_rate) {
> +			dev_err(dev, "Invalid clock rate\n");
> +			goto err_clk_disable;

That's a confusing label - it jumps to PM put, not clk disable. It
isn't matching the source of error either (get rate, not clock disable).

> +		}
> +
> +		if (clk_rate > clk_rate_max)
> +			clk_rate_max = clk_rate;
> +	}
> +
> +	rstc = devm_reset_control_get_exclusive(dev, "omm");
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
> +
> +	reset_control_assert(rstc);
> +	udelay(2);
> +	reset_control_deassert(rstc);
> +
> +	omm->cr = readl_relaxed(omm->io_base + OMM_CR);
> +	/* optional */
> +	ret = of_property_read_u32(dev->of_node, "st,omm-mux", &mux);
> +	if (!ret) {
> +		if (mux & CR_MUXEN) {
> +			ret = of_property_read_u32(dev->of_node, "st,omm-req2ack-ns",
> +						   &req2ack);
> +			if (!ret && !req2ack) {
> +				req2ack = DIV_ROUND_UP(req2ack, NSEC_PER_SEC / clk_rate_max) - 1;
> +
> +				if (req2ack > 256)
> +					req2ack = 256;
> +			}
> +
> +			req2ack = FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
> +
> +			omm->cr &= ~CR_REQ2ACK_MASK;
> +			omm->cr |= FIELD_PREP(CR_REQ2ACK_MASK, req2ack);
> +
> +			/*
> +			 * If the mux is enabled, the 2 OSPI clocks have to be
> +			 * always enabled
> +			 */
> +			ret = stm32_omm_toggle_child_clock(dev, true);
> +			if (ret)
> +				goto err_clk_disable;
> +		}
> +
> +		omm->cr &= ~CR_MUXENMODE_MASK;
> +		omm->cr |= FIELD_PREP(CR_MUXENMODE_MASK, mux);
> +	}
> +
> +	/* optional */
> +	ret = of_property_read_u32(dev->of_node, "st,omm-cssel-ovr", &cssel_ovr);
> +	if (!ret) {
> +		omm->cr &= ~CR_CSSEL_OVR_MASK;
> +		omm->cr |= FIELD_PREP(CR_CSSEL_OVR_MASK, cssel_ovr);
> +		omm->cr |= CR_CSSEL_OVR_EN;
> +	}
> +
> +	omm->restore_omm = true;
> +	writel_relaxed(omm->cr, omm->io_base + OMM_CR);
> +
> +	ret = stm32_omm_set_amcr(dev, true);
> +
> +err_clk_disable:
> +	pm_runtime_put_sync_suspend(dev);
> +
> +	return ret;
> +}
> +
> +static int stm32_omm_check_access(struct device_node *np)
> +{
> +	struct stm32_firewall firewall;
> +	int ret;
> +
> +	ret = stm32_firewall_get_firewall(np, &firewall, 1);
> +	if (ret)
> +		return ret;
> +
> +	return stm32_firewall_grant_access(&firewall);
> +}
> +
> +static int stm32_omm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	u8 child_access_granted = 0;
> +	struct stm32_omm *omm;
> +	int ret;
> +
> +	omm = devm_kzalloc(dev, sizeof(*omm), GFP_KERNEL);
> +	if (!omm)
> +		return -ENOMEM;
> +
> +	omm->io_base = devm_platform_ioremap_resource_byname(pdev, "regs");
> +	if (IS_ERR(omm->io_base))
> +		return PTR_ERR(omm->io_base);
> +
> +	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
> +	if (IS_ERR(omm->mm_res))
> +		return PTR_ERR(omm->mm_res);
> +
> +	/* check child's access */
> +	for_each_child_of_node_scoped(dev->of_node, child) {
> +		if (omm->nb_child >= OMM_CHILD_NB) {
> +			dev_err(dev, "Bad DT, found too much children\n");
> +			return -E2BIG;
> +		}
> +
> +		if (!of_device_is_compatible(child, "st,stm32mp25-ospi"))
> +			return -EINVAL;

continue;

or better just drop the code - you are not supposed to validate the DTB.
DT schema's job is for that.

> +
> +		ret = stm32_omm_check_access(child);
> +		if (ret < 0 && ret != -EACCES)
> +			return ret;
> +
> +		if (!ret)
> +			child_access_granted++;
> +
> +		omm->nb_child++;
> +	}
> +
> +	if (omm->nb_child != OMM_CHILD_NB)
> +		return -EINVAL;
> +
> +	platform_set_drvdata(pdev, omm);
> +
> +	pm_runtime_enable(dev);
> +
> +	/* check if OMM's resource access is granted */
> +	ret = stm32_omm_check_access(dev->of_node);
> +	if (ret < 0 && ret != -EACCES)
> +		goto error;
> +
> +	if (!ret && child_access_granted == OMM_CHILD_NB) {
> +		ret = stm32_omm_configure(dev);
> +		if (ret)
> +			goto error;
> +	} else {
> +		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
> +		/*
> +		 * AMCR can't be set, so check if current value is coherent
> +		 * with memory-map areas defined in DT
> +		 */
> +		ret = stm32_omm_set_amcr(dev, false);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to create Octo Memory Manager child\n");
> +		of_platform_depopulate(dev);

That's odd. Why do you depopulate if populate did not happen? Anyway,
don't mix devm with standard error paths, so this all should be handled
by devm.

> +		ret = -EINVAL;
> +		goto error;
> +	}
> +
> +	return ret;
> +
> +error:
> +	pm_runtime_disable(dev);

This as well

> +
> +	return ret;
> +
> +}
> +
> +static void stm32_omm_remove(struct platform_device *pdev)
> +{
> +	struct stm32_omm *omm = platform_get_drvdata(pdev);
> +
> +	of_platform_depopulate(&pdev->dev);
> +	if (omm->cr & CR_MUXEN)
> +		stm32_omm_toggle_child_clock(&pdev->dev, false);

This as well, via devm calback.

> +
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static const struct of_device_id stm32_omm_of_match[] = {
> +	{ .compatible = "st,stm32mp25-omm", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, stm32_omm_of_match);

Best regards,
Krzysztof


