Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7B6E677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtLFGHo/CKOzhBcbdHFevi2zOCn90VZvZvvhYIE9Xxg=; b=MmeXjlrXRcoickkYU/FLSAj/7p
	d+8FdzApcEeYcTNYpEe8ibJbXA42+MhfDN0KEUHtXlH/YgFB7pdNiDbT6vrsRWQ9Gv70hh8Wba5nG
	tCnWswkSpyohZ9L5GM5uj1r48fjZ+fee0fIyR//2+zfhEqeJ9tGYHbPikEMI/wbIEaad442K242A5
	rGmRgAM+z7HXrEvfAFE2NIlpN5EMT6vqQlc9mrtN0+A4axNEKg54d2siigytR4CDHH90jsEOHuble
	jpxRebket+bWlNElzxvL/OhRAQJ40OjHPORcxZjhZQZGL57ceb2ZMU2iALf/g2zIQ+kgexT+ZBk+Q
	hAupeY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t79sM-00000009KlA-1haT;
	Sat, 02 Nov 2024 08:52:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t79qh-00000009KbD-2rQh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A2DCA40296;
	Sat,  2 Nov 2024 08:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66ACEC4CEC3;
	Sat,  2 Nov 2024 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730537470;
	bh=njAvedrSitInShPszOayXefFcXhSEvi9AH1Gu+jbW6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnetYMcxdkzPOQG/JS1PIS7Ia2DrTgNM2VyGYT/4hVlYKKcBZ2j7/7I2xT+tLNowP
	 gAOe4uF1IKElJZ6vxg9uDMETem0QBrwuA9D8zdNWx9WUdrRmfQtP54eMoBqPn/iC9e
	 a7piVFmgOxXqJRclbb9RzaRm8fmN/sRI86TtC5gfSjmWLFXtNEV3Z4Dbr4jl0CyprE
	 GLCfVZ45gnvd7pqUV3m5tr6/q/8bLrfvK66LOTBZMqdlYQAdsthhAN0YWOP5sfGxFh
	 SOuIQOGPBhmhb0CCoP7jkkgKWgp4V3IbhdsKA6bNsgLcbHNR8CNEtoES1eDNrFuD1S
	 KiDeAr+cf0L1g==
Date: Sat, 2 Nov 2024 09:51:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
Message-ID: <5lgrrlmn3lgk7wtkxcujdtp47fslxxtt2gcaqqarpestswyorm@6fnlwtmxlvbe>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_015111_816859_1FC79403 
X-CRM114-Status: GOOD (  12.39  )
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

On Fri, Nov 01, 2024 at 10:06:10AM +0200, Andrei Stefanescu wrote:
> +	/* Order is MSCR regions first, then IMCR ones */
>  	for (i = 0; i < mem_regions; i++) {
> -		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
> -		if (IS_ERR(base))
> -			return PTR_ERR(base);
> -
> -		snprintf(ipctl->regions[i].name,
> -			 sizeof(ipctl->regions[i].name), "map%u", i);
> -
> -		s32_regmap_config.name = ipctl->regions[i].name;
> -		s32_regmap_config.max_register = resource_size(res) -
> -						 s32_regmap_config.reg_stride;
> -
> -		map = devm_regmap_init_mmio(&pdev->dev, base,
> -						&s32_regmap_config);
> -		if (IS_ERR(map)) {
> -			dev_err(&pdev->dev, "Failed to init regmap[%u]\n", i);
> -			return PTR_ERR(map);
> -		}
> -
> -		ipctl->regions[i].map = map;
> +		regmap_type = i < mem_regions / 2 ? SIUL2_MSCR : SIUL2_IMCR;
> +		j = i % mfd->num_siul2;
> +		ipctl->regions[i].map = mfd->siul2[j].regmaps[regmap_type];
>  		ipctl->regions[i].pin_range = &info->soc_data->mem_pin_ranges[i];

This looks like breaking all the users. Nothing in commit msg about
this: about rationale, impact or backwards compatibility.

Nothing in changelog in cover letter explaining such sudden change in
approach.

Sorry, that's a NAK.

Best regards,
Krzysztof


