Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E21FE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mo6MP2QToWKxW6CHGPpfwk7yms3zeJ7L1O8Z7JM6ls=; b=4J07uhdUOJeFXSEGwJ+ISKUzAU
	aS/iFz0fs8zeFZky8nG23e8AmWGJ3mRqy4G46himopWk7j+p9h3d/ISU04nknGyO0fYypHXsHqBu4
	l/6oDmEmcQx6MVwfFnHxJ7TcwVzhiQSnjmDnsnip37FGUGhn8E/NdGC/JRSsfqjHufll7IhxaMZLA
	Zn44y5jFBXZaWemuVsaxhsTXInh36ga9iirgjrQX145RtfPbEgF0/pfs4lfBXQg/hxJ/7BG+SwwTq
	0hC8x6g5JMTxr9zWOTg3MOCvLMMUtyz6kdbJZjK46cRUHUZBtn8wUYMuC7qa4p5mhytP2qDvvohu/
	eDk1pZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgX3-00000009tI3-0qyd;
	Mon, 23 Dec 2024 11:23:29 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgPZ-00000009sIx-0uUD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 11:15:46 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3035210e2d1so35473211fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734952543; x=1735557343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3mo6MP2QToWKxW6CHGPpfwk7yms3zeJ7L1O8Z7JM6ls=;
        b=bzP9LD0uBjzNkyZMlzlRtAfhXHSY5/4aNIwWwcUauda0bgrVC58CncWRfRTfasIFom
         wzby+K0w+UWVfAUubUENw2ZVqKObzVq/lXh0DI/Cnz+PEzEFcr3rnaosgVgFhFM4GeBV
         Tnas+A2e1pWdFPq48uBRlp5fR07856698/aZwHHjpjGOTiWrqj6C9azbG2Zd6AdXwU3A
         wKKjd4W1H0hrPBdpReYSkjwowxonp2E2Ju2z72/drgOUC2s9z+NcFvG+G+ThdrIvrpoJ
         w2F4MDCjbRMRrQoxNaszv9rEDceQEfCYormUDNic1Im+ja1bCT3BYEuixKWjuBSwnyJc
         im+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734952543; x=1735557343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mo6MP2QToWKxW6CHGPpfwk7yms3zeJ7L1O8Z7JM6ls=;
        b=lGYOsnSjKEFPeMGdAvgEm20yyMgxpdVyeDu4nR2+52WYuGDUV/IuB+tb7fWGgNBhlN
         VELP1f1nBoiQ7BpLM7emq5F2jwX3F5xtfMpEd51wDW7ITIeNIhD7p867C0wowm0m5TtY
         mDavm7IeR+NRlUOG4kevQJSGKOA16iEx/bDGJSIddMYIeHD2HBDawtjP+Q7aya0NllUN
         OTj2HVkekfwssa9+IWcAmBU36sC+e1Ua1sbh8Kf5vYc07rjuPFeTivxNqQ8MY1hxwSkC
         x9Ju0od41L31NwKqbb5PRCxXP1v+3KgE1AbC8ewgCSMObbWLrRs+GaJZP5dJBCMM8BDH
         XpDw==
X-Forwarded-Encrypted: i=1; AJvYcCU2KKuV6iXZWuf3AJvu2vjuvsESxA8SF8XqPAkaLUMvxrViUnLlVVV5sSWpTvtyHgjqy0CbbNOMlv19ETMeyC+R@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd2SRvbuJEINocJ4mOYucEDX/2/ZxA3WB5fxLrkKPIF8sqS9yG
	65YVMutzFXG8JJSJqt5ySTQFT/MLoQaUih4+FsHwv7m3EBXm0+eX8yAAKQWTLpU=
X-Gm-Gg: ASbGnculNd7608UoSb/2te8VxMLUvOyMnItkyqMqOaIMXYma6sZB9+coLL4V010kPy4
	au1ZxoNHkjetlyEhfswjSSut9/c/Dl5WCRVS4sIwTlCD/6HAkoakQjqXPJVLDfgpm56XwZqZS0M
	XZB/Bc61y7wkCi3+kt73PsYdm9+dqBMjV+nvSE7WCGrgdTzhev5httAS/aa7BeK9bL11xOvfpat
	OZYxV1f9azlgIUICpVuepyRfkJpL+SZXaOcv3hoDnk786FKo9QWPSj1OM7e1xXevJoX8OwGBw2V
	+tk/OcnISinmRj7CUAgBseulkIX2l01wzw1K
X-Google-Smtp-Source: AGHT+IEgmX/5ATGHYxkBwsAFplT1zESRogm6vsP2Mbb2JNoPZ4jUEIIAF7+Dio6FJRuZVz2+3nzV0g==
X-Received: by 2002:a05:651c:b0a:b0:304:4cac:d8ef with SMTP id 38308e7fff4ca-304685487c2mr37661981fa.7.1734952543223;
        Mon, 23 Dec 2024 03:15:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b083e92sm12807641fa.116.2024.12.23.03.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:15:41 -0800 (PST)
Date: Mon, 23 Dec 2024 13:15:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, p.zabel@pengutronix.de, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, 
	kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, 
	u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v7 10/19] drm/imx: Add i.MX8qxp Display Controller pixel
 engine
Message-ID: <7k2jqpkpagm3x7shywgzvtst364f6dmmhuz2covpbvghoa5rzc@3dvlbdgtnjck>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
 <20241223064147.3961652-11-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223064147.3961652-11-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_031545_284344_CF5DEA05 
X-CRM114-Status: GOOD (  28.03  )
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

On Mon, Dec 23, 2024 at 02:41:38PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller pixel engine consists of all processing
> units that operate in the AXI bus clock domain.  Add drivers for
> ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend units, as
> well as a pixel engine driver, so that two displays with primary
> planes can be supported.  The pixel engine driver and those unit
> drivers are components to be aggregated by a master registered in
> the upcoming DRM driver.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7:
> * Add kernel doc for struct dc_drm_device. (Dmitry)
> * Fix regmap_config definitions by correcting name field, correcting read
>   ranges and setting max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases.
> * Collect Maxime's R-b tag.
> * Trivial tweaks.
> 
> v6:
> * Fix build warning by expanding sizeof(fu->name) from 13 to 21.
>   (kernel test robot)
> 
> v5:
> * Replace .remove_new with .remove in dc-{cf,de,fl,fw,lb,pe}.c. (Uwe)
> * Fix commit message to state that pixel engine driver is a component driver
>   instead of a master/aggregate driver.
> 
> v4:
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_lb_blendcontrol() function call from KMS routine to initialization
>   stage. (Dmitry)
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv.
> * Set suppress_bind_attrs driver flag to true to avoid unnecessary sys
>   interfaces to bind/unbind the drivers.
> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
> 
> v3:
> * No change.
> 
> v2:
> * Use OF alias id to get instance id.

Carrying several comments from previous patch:
- shdld vs shdload
- use of indices in the compat strings
- bind() behaviour depending on the particular order of device bindings

> 
> +
> +void dc_fu_common_hw_init(struct dc_fu *fu)
> +{
> +	enum dc_fu_frac frac;
> +	int i;
> +
> +	dc_fu_baddr_autoupdate(fu, 0x0);
> +	dc_fu_enable_shden(fu);
> +	dc_fu_set_linemode(fu, LINEMODE_DISPLAY);
> +	dc_fu_set_numbuffers(fu, 16);
> +
> +	for (i = 0; i < ARRAY_SIZE(dc_fetchunit_all_fracs); i++) {

for (i = DC_FETCHUNIT_FRAC0 ; i < DC_FETCHUNIT_FRAC_NUM; i++) ?

> +		frac = dc_fetchunit_all_fracs[i];
> +
> +		dc_fu_layeroffset(fu, frac, 0, 0);
> +		dc_fu_clipoffset(fu, frac, 0, 0);
> +		dc_fu_clipdimensions(fu, frac, 1, 1);
> +		dc_fu_disable_src_buf(fu, frac);
> +		dc_fu_set_pixel_blend_mode(fu, frac);
> +	}
> +}
> +

[...]

> +enum dc_link_id dc_lb_get_link_id(struct dc_lb *lb)
> +{
> +	return lb->link;
> +}
> +
> +void dc_lb_pec_dynamic_prim_sel(struct dc_lb *lb, enum dc_link_id prim)
> +{
> +	int fixed_sels_num = ARRAY_SIZE(prim_sels) - 4;
> +	int i;
> +
> +	for (i = 0; i < fixed_sels_num + lb->id; i++) {

This function and the next one silently skip writing link ID if it is
incorrect. Can it actually become incorrect? If not, I'd say, it is
better to drop the loop and the array. If you are not sure, there should
be some kind of dev_warn() or drm_warn().

> +		if (prim_sels[i] == prim) {
> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
> +					  PIXENGCFG_DYNAMIC_PRIM_SEL_MASK,
> +					  PIXENGCFG_DYNAMIC_PRIM_SEL(prim));
> +			return;
> +		}
> +	}
> +}
> +
> +void dc_lb_pec_dynamic_sec_sel(struct dc_lb *lb, enum dc_link_id sec)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sec_sels); i++) {
> +		if (sec_sels[i] == sec) {
> +			regmap_write_bits(lb->reg_pec, PIXENGCFG_DYNAMIC,
> +					  PIXENGCFG_DYNAMIC_SEC_SEL_MASK,
> +					  PIXENGCFG_DYNAMIC_SEC_SEL(sec));
> +			return;
> +		}
> +	}
> +}
> +

[...]

> +
> +static int dc_lb_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	struct dc_pe *pe = dc_drm->pe;
> +	void __iomem *base_pec;
> +	void __iomem *base_cfg;
> +	struct dc_lb *lb;
> +
> +	lb = devm_kzalloc(dev, sizeof(*lb), GFP_KERNEL);
> +	if (!lb)
> +		return -ENOMEM;
> +
> +	lb->id = (enum dc_lb_id)(uintptr_t)device_get_match_data(dev);
> +
> +	base_pec = devm_platform_ioremap_resource_byname(pdev, "pec");
> +	if (IS_ERR(base_pec))
> +		return PTR_ERR(base_pec);
> +
> +	base_cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
> +	if (IS_ERR(base_cfg))
> +		return PTR_ERR(base_cfg);
> +
> +	lb->reg_pec = devm_regmap_init_mmio(dev, base_pec,
> +					    &dc_lb_pec_regmap_config);
> +	if (IS_ERR(lb->reg_pec))
> +		return PTR_ERR(lb->reg_pec);
> +
> +	lb->reg_cfg = devm_regmap_init_mmio(dev, base_cfg,
> +					    &dc_lb_cfg_regmap_config);
> +	if (IS_ERR(lb->reg_cfg))
> +		return PTR_ERR(lb->reg_cfg);
> +
> +	lb->link = lb_links[lb->id];

lb->link = LINK_ID_LAYERBLEND0 + lb->id ?

> +
> +	pe->lb[lb->id] = lb;
> +
> +	return 0;
> +}
> +
> +static const struct component_ops dc_lb_ops = {
> +	.bind = dc_lb_bind,
> +};
> +

-- 
With best wishes
Dmitry

