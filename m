Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38D3C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxG8gtNNyIzhGBL2XiKTh4vfPXWybyJyW/8C8tSXfMY=; b=aR0YXy2Uvs10b+i5YFJICR0QVl
	f7cvSWrJvfN2oLamdLzgg7lr+o6sktMbXq2vr6eZNDoHGBbN7ZKn3u/tJgbOV5HhT8hhNP2OCQdDt
	Yj/oZMdJSJeQcUGt/H6vMDVYzlPFT5KP8++/pL6FjWzjOoHbcTQohyfPyeTyBbhetwCDyQQRX/sBG
	C0HXrYSrU1Aq/WqJ3kCaDLcBEQkD782Jd9C5bkloAd/Op5gLnhWMxCPPJkxHLUsv+4F+g2pdMLWwg
	cxcXaMiCa2sWhKMxoLMVVvsiUROfx5R0WeQuWmsBTPZKpgVSymHGSNRQKqRuxlqHsjy6Z9CWvQsvi
	y0i7EpbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2g4-000000011Y8-0EnB;
	Thu, 07 Aug 2025 15:37:12 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2Yw-000000010iO-34om;
	Thu, 07 Aug 2025 15:29:53 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C28A81F0003D;
	Thu,  7 Aug 2025 15:29:41 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8EDEEB012C1; Thu,  7 Aug 2025 15:29:39 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6AAF7B012B0;
	Thu,  7 Aug 2025 15:29:37 +0000 (UTC)
Date: Thu, 7 Aug 2025 17:29:35 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 09/22] iommu: sun50i: make reset control optional
Message-ID: <aJTGX7z5QaneVAVs@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6JMmJ4BvieUD1JH"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_082951_079502_0C28690E 
X-CRM114-Status: GOOD (  20.76  )
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


--r6JMmJ4BvieUD1JH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> A133/A100 SoC doesn't have reset control from the CCU. Get reset
> control line optionally.

With the dt bindings fixed, this:
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

Although feel free to use a first uppercase later in the title after sun50i!

Cheers,

Paul

> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 8d8f11854676..2ba804d682dc 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -1030,7 +1030,7 @@ static int sun50i_iommu_probe(struct platform_devic=
e *pdev)
>  		goto err_free_cache;
>  	}
> =20
> -	iommu->reset =3D devm_reset_control_get(&pdev->dev, NULL);
> +	iommu->reset =3D devm_reset_control_get_optional(&pdev->dev, NULL);
>  	if (IS_ERR(iommu->reset)) {
>  		dev_err(&pdev->dev, "Couldn't get our reset line.\n");
>  		ret =3D PTR_ERR(iommu->reset);
>=20
> --=20
> 2.39.5
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--r6JMmJ4BvieUD1JH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiUxl8ACgkQhP3B6o/u
lQx11g//SV1ixRT6s+TozocWIV+MP1xw+AZD5hEjtTQ94o3x2r/fbEdRtxGLxRYM
YJe8mZkZCifNu+QgBg78/DiCw0wsnRXA3y7gfMnIvk501LovWrpX2lFmdYnVBu9O
WIJpWrZzMb3dku5kVhC87X7IOxLL4ORnM8BKOJ4T2iZvxlBTRmMyzV9iujvthL1M
wYhQDxJ+Dj6sDNjPE/HonEJQMlv8MiYWZHZSUPZxBMlxaCZ96gqPhjpS/ZF5VKdx
w8oVitiYduHemohWVRcqv8Rrl9ZLat5kLm5ikgMv3iv07lXrxd93v41x1nS1pYO6
ahBa8PwTf4AZ91eJfulyiteRqnUZgG3iyI0+Ao12tyeN8WOlBo009cW6j5Y6q8u7
Pxppv1+zfxY2VX+Ws0hCHYXLFPVeuaUzvMKsXlAVxai3NgOTj0PgEoOCGwCdQw3K
kQCq0/T9GCJa66mc8jyuslUTBPKuUTJBJa10s6X60rCQaAVMDYEv/TfM8Vo0MidK
Pw9VpmlUgPK/bLTAB7D9q2vYrSLP43UHMUOVC6OG+4dNEdpk10sx/qalZS1Ly/eN
eDA9iYwUFeJdc5iS6/BAM0dgylbnaBQ23nldgwYa8HdEGG+SpXfBafdRNKBk+rEI
NkzLWI9FRp/JLXkWCFoUSgAdIAvjaIqoeupMjNTS8UXLORXeebk=
=UG1q
-----END PGP SIGNATURE-----

--r6JMmJ4BvieUD1JH--

