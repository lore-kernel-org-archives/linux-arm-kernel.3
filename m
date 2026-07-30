Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE26C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsUQy8M66IQC4lINcyq/oQdCxyYdqshF1zc1xBHxHA4=; b=wGxiyYfpV8rxNB/qMMJzbOz5mY
	zyekmGshg61tL8C2Oc2s4yTX02jPcsnZtBBlmagiJSXd0Nm9I3pKo9SGtBzrINbo4eecKOsBPLv9L
	+q/dE+XLGuMNMoxuugnt7X/t+LYLjdcVMaGYk8SWp4/8NWvIjRAqK7K2AfWn2Ex0rT+sMCoYWKOxL
	vazXfrmV7x1BdPtsg2jkVsT0MgB/PeuJW+erzqb/nrsNKuh18apdaHq5yB9oRF7P41hY1u4NH7FVp
	u3UmSGwImPgyIIr6HB4fKyFTJj+meAeZHlyrmysYXMheIaniKoazsK7Arx66FC64SB7iB/seYFiu/
	Q/WJk/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPWJ-0000000AQ4v-2Tzi;
	Thu, 30 Jul 2026 12:05:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPWG-0000000AQ3w-2IO7;
	Thu, 30 Jul 2026 12:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 482E84124E;
	Thu, 30 Jul 2026 12:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E571F000E9;
	Thu, 30 Jul 2026 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785413148;
	bh=qsUQy8M66IQC4lINcyq/oQdCxyYdqshF1zc1xBHxHA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e2gk9GyZgq8oQEURY5p40WzWG9z4659Vkf3Ehzzt6nAG7f59GgY9fEXIQKviG6uxV
	 s1OGPXVVbPk2Z7CX8V59491Lap2GC79ZUr2osPt9XIdbtvmgaqMec/nYObE7QyTBH+
	 nyGeYAAFXGdxJ3av2WpsMgeDjUd4boPv/Jkse01hSAhr07CmZGL/wzgL+vCIocG+/y
	 jw3UhkyxKZpYLecDHrSmL9Tn+YGyOKZUoltrU0XK1Z1ZQ9wkt49KNvHD+pyC5pQJMj
	 g0QgSNkP6K8T0f2euFhc4GFcujxYpeLWe8mnXiuo3RDYCG9PtfqYrPUeQN1V75C83T
	 XKE9oNVwsAw+w==
Date: Thu, 30 Jul 2026 13:05:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: meson-spifc: use devm_pm_runtime_set_active_enabled
Message-ID: <d91cc800-1f41-424d-baf8-c1b2fe935978@sirena.org.uk>
References: <20260722-spifc-v1-1-e4462a4c6a06@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/A/xRZp0AlOIxdtl"
Content-Disposition: inline
In-Reply-To: <20260722-spifc-v1-1-e4462a4c6a06@gmail.com>
X-Cookie: In specially marked packages only.
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


--/A/xRZp0AlOIxdtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2026 at 08:09:17PM +0800, Felix Gu wrote:
> Use devm_pm_runtime_set_active_enabled to replace
> pm_runtime_set_active() + pm_runtime_enable() and drop the out_pm
> error label and now-unnecessary remove function.

> -static void meson_spifc_remove(struct platform_device *pdev)
> -{
> -	pm_runtime_get_sync(&pdev->dev);
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_put_noidle(&pdev->dev);
>  }

We still need the pm_runtime_get_sync() here since the driver uses
devm_get_clk_enabled() - we need to exit remove() with the clock
enabled.  The other changes look OK.

--/A/xRZp0AlOIxdtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprPhcACgkQJNaLcl1U
h9BCFwf/fJYvAB49gnyQfVxHK32NXtzFjH+/iHS5QiweU/ilAXloDOMCGhHxw6Bt
wEUpzncjFa+GP0Cy3L3uqO5+o2daTAh1JjfRsai8wCZ2OSa20PqmVJDmw+liiL0c
jf86aCksazxg9Cx19/wyEPJ98mqcLUu3rLPrQ6VTi/DvWggukh3cs2o1q2XWK7qb
eJb/+X57ex9cffILOmueqjG9SJSQQstM9k2MhRCfTeZw0hKwigKeGZW1F9JY95JW
LqoAnFMbyx4Jk3Fcj6fr/KIYroMKNGSTaTh0mVQ5Cmnvp/lbYc0fWny861xwW0yb
g7yhZ0cNaCHvxq4U/zBKFslj5eznMA==
=JqfB
-----END PGP SIGNATURE-----

--/A/xRZp0AlOIxdtl--

