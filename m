Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB230CE8E96
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNlMYjkVBvJFc9VwIfc+k5pvmz8KrMlvTknI26Z0q/0=; b=3gjJYk3XksU6uWZu02Cw2rY4en
	SO28O8SGdoZdfTV9V4+giG5w0F75ccU6pilzbMGWg5TskAym/KxKaRUiGe1JgfR2hmYhUwrHAUTrG
	BjCergfRgGbbVXBOIkDIMqlLHbqcjmSZScU47Vf7yIzP5gHVG1L8fUhWFYupTMfJzIoHJgOSUXLwX
	1I5x4UaUxwE8oNUtcxUcIZRXp0TXxH2IDo+fV0iJStb3U0/EZYWdAAEUP0u8dG4iFFiNT00KGs2RV
	6mfqBrEjqtmLyK5xvHwQeh6P0ok39u3hjCcKp/R6u898OCNhz1pkevtD84e21mTy0GlxVuMBTFKh8
	wTsv2wpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t416E-00000001BCf-1KWe;
	Thu, 24 Oct 2024 16:54:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t414H-00000001AnY-1wnO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA47DA4575B;
	Thu, 24 Oct 2024 16:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352A2C4CEC7;
	Thu, 24 Oct 2024 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729788731;
	bh=r3tslcMdhzBd/TeShHIMCrP8oQyKFhtQOLSCSOVBUHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QrqSXV9kUF3TqpF51VSGPHx7GUuoHwWa106yRznXQL0hWK/fa6CC6cMUWYAHASav/
	 QxMfRcVTwt5oIBZO05VyaH0YLS9TF9Lu57YmrLN/GLMOh0xI6KQGK1v4s3nleucnTf
	 xKpxu3R4l/xcluPYtRg8/OFi1ZGVQFuB7Puzyq0IWBHl0isJCZae7iwDIKyAoVRESx
	 3HXiAZLMe7jAN7S71KzIhfapz4Z28x4X6Wj8oZju+pLZJpohL2KojYHbfSDtI3Rnip
	 E7YNpC2kld+KtMQNCjUspX65R4EDUUfn4mfN0qexDQobOS3Su+5pNMWiLE4hykD1cI
	 MpiuxpYRQ2AGw==
Date: Thu, 24 Oct 2024 17:52:05 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 03/10] dt-bindings: dmaengine: Add Allwinner suniv
 F1C100s DMA
Message-ID: <20241024-recycler-borrowing-5d4296fd4a56@spud>
References: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
 <20241024064931.1144605-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CqzdtQmyY58U3O5U"
Content-Disposition: inline
In-Reply-To: <20241024064931.1144605-4-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_095213_588130_C78522AA 
X-CRM114-Status: GOOD (  17.65  )
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


--CqzdtQmyY58U3O5U
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 08:49:24AM +0200, Cs=F3k=E1s, Bence wrote:
> Add compatible string for Allwinner suniv F1C100s DMA.

> [ csokas.bence: reimplemented in YAML ]

This implies you took someone else's work and modified it, so I would
expect to see them mentioned here. However, I don't personally think a
compatible name is copyrightable and would suggest just dropping this.

<2 minutes later> I checked the rest of the series, you've got a lot of
missing signoffs from yourself on other patches. You sent them, so you
need to sign off even if you didn;t author them.

Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Cs=F3k=E1s, Bence <csokas.bence@prolan.hu>
> ---
>  .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dm=
a.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
> index 02d5bd035409..9b5180c0a7c4 100644
> --- a/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
> @@ -22,7 +22,9 @@ properties:
>        number.
> =20
>    compatible:
> -    const: allwinner,sun4i-a10-dma
> +    enum:
> +      - allwinner,sun4i-a10-dma
> +      - allwinner,suniv-f1c100s-dma
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20
>=20

--CqzdtQmyY58U3O5U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxp7NQAKCRB4tDGHoIJi
0kVVAQDIf6oJhRhzclI1CTid5giOG/kvB2MGrzj6VU6YX5l7agD/fGR3sowa78na
7GbS6JuJbow5pjzpsrjPdU2IMejCogo=
=6eZ/
-----END PGP SIGNATURE-----

--CqzdtQmyY58U3O5U--

