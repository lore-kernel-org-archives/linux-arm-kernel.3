Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB48C282DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4fDAkyw/uhxe8G05E84yrw6xnoFmgWvI3tKZtq2rSs=; b=Jtv3Nt3cYW2rpnLjmG5A6ELCvn
	UBFeZsUQa14tf6FE3ejE9w/jUyFgcGHkLe+v//y6vRbtzLP6ilpVzteRLqSVgX9WHloRL4JOnMxSn
	4s2zCyz0ERdQ/djUHArHoFlbYRdb8sfn+WctYVxlXSi2PEac/9djcUsk0S5Ox7GBzumDG9DLxZqy5
	HpYcxTDBgOykAla1iZApJs01h5S3P9vEP0VEHE2DdZF+zSSVd6OhFFYKBLFPUmzqJQ2fN5H/Pf2+I
	YOVTrTuEJT0rFFClfjay5ZN/hjsKHs3d5wXtY+hrYv4YpQWuBPLM0w0SSjxanOxxiKoOFrbg6gtgY
	rf3R95lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmNi-00000007kq4-1EXq;
	Wed, 05 Mar 2025 10:53:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplt1-00000007fBi-1hyh;
	Wed, 05 Mar 2025 10:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n4fDAkyw/uhxe8G05E84yrw6xnoFmgWvI3tKZtq2rSs=; b=pJid1FHlhmvhTprAPkmVDlJvPu
	wlwKv9FuKC1W+fwINcrFCnwCZMlBklUf16MB23bCw4dYQnEdsgf2oK86Dq8q7hykrf/j7nWSZ9i1I
	7lUJRhifm328x9fW03maoX2vFjcUB1GFKXFHMWTlBwIPW8/mO+gCkBYOZi4nDfSQmAyUNj85WSWau
	GsnxrHVqkW0bxdWiiTlHMwIG9P8zcwpZyyITy6dzyBNjkAXLVAOUlR/RESFl0FAg8nIBLybMHPJHX
	uI+fOnea8woEelqoHcL/DO8aIyJrQYazfVQ6IHS2wnU1gHr6QMRbhMzInehBh40QDKBP60hyY6Wzo
	4ash0VHQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tplsr-0001Y0-7Q; Wed, 05 Mar 2025 11:21:49 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Frank Wang <frank.wang@rock-chips.com>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 6/8] clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF
 region
Date: Wed, 05 Mar 2025 11:21:48 +0100
Message-ID: <2583035.OBFZWjSADL@diego>
In-Reply-To: <20250301104724.36399-1-ziyao@disroot.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
 <20250301104724.36399-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_022159_462494_7D085B39 
X-CRM114-Status: GOOD (  16.55  )
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

Am Samstag, 1. M=C3=A4rz 2025, 11:47:24 MEZ schrieb Yao Zi:
> These clocks locate in VO and VPU GRF, serving for SD/SDIO controller
> tuning purpose. Add their definitions and register them in driver if
> corresponding GRF is available.

(no critique, just an observation :-) )

this puts a completely new meaning on the "general register files"
as dumping ground ;-) .

Whoever got the idea of making sdmm/sdio tuning controls part
of GRFs that are supposed display and/or video encoder parts :-D


> GRFs are looked up by compatible to simplify devicetree binding.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---

>  static int __init clk_rk3528_probe(struct platform_device *pdev)
>  {
> +	unsigned long nr_vpu_branches =3D ARRAY_SIZE(rk3528_vpu_clk_branches);
> +	unsigned long nr_vo_branches =3D ARRAY_SIZE(rk3528_vo_clk_branches);
> +	unsigned long nr_branches =3D ARRAY_SIZE(rk3528_clk_branches);
>  	struct rockchip_clk_provider *ctx;
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *np =3D dev->of_node;
> -	unsigned long nr_branches =3D ARRAY_SIZE(rk3528_clk_branches);
> -	unsigned long nr_clks;
> +	struct regmap *vo_grf, *vpu_grf;
>  	void __iomem *reg_base;
> -
> -	nr_clks =3D rockchip_clk_find_max_clk_id(rk3528_clk_branches,
> -					       nr_branches) + 1;
> +	unsigned long nr_clks;
> =20
>  	reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(reg_base))
>  		return dev_err_probe(dev, PTR_ERR(reg_base),
>  				     "could not map cru region");
> =20
> +	nr_clks =3D rockchip_clk_find_max_clk_id(rk3528_clk_branches,
> +					       nr_branches) + 1;
> +
> +	vo_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3528-vo-grf");
> +	if (!IS_ERR(vo_grf))

for readability, please make this into something like
	if (!IS_ERR(vo_grf)) {
		nr_vo_clks =3D rockchip_clk_find_max_clk_id(rk3528_vo_clk_branches,
							   nr_vo_branches) + 1;
		nr_clks =3D max(nr_vo_clks, nr_clks);
	}

> +	else if (PTR_ERR(vo_grf) !=3D ENODEV)
> +		return dev_err_probe(dev, PTR_ERR(vo_grf),
> +				     "failed to look up VO GRF\n");
> +
> +	vpu_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3528-vpu-grf=
");
> +	if (!IS_ERR(vpu_grf))
> +		nr_clks =3D MAX(rockchip_clk_find_max_clk_id(rk3528_vpu_clk_branches,
> +							   nr_vpu_branches) + 1,
> +			      nr_clks);

same here please

> +	else if (PTR_ERR(vpu_grf) !=3D ENODEV)
> +		return dev_err_probe(dev, PTR_ERR(vpu_grf),
> +				     "failed to look up VPU GRF\n");
> +
>  	ctx =3D rockchip_clk_init(np, reg_base, nr_clks);
>  	if (IS_ERR(ctx))
>  		return dev_err_probe(dev, PTR_ERR(ctx),

Thanks
Heiko



