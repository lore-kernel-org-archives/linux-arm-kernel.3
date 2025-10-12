Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D595CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0W7i31B7rZfdMHx5wssvo/Bp4mxlObCb2wx3nEZ38k=; b=k+k8LEBUh3zVzpv5D8IikVZM+R
	75PISOnw51FSHfxd5rxNNp8zeJKE/5MUj3Dh6K+QZhPrYbdh+6wtLaZG+qLqK9QV3LoFZMejkay28
	/4vH4TjrT52h0VTurT99A3J2u4KHcy2v2F/5FwKKukZMbY272A+jCsIlX/4O/MOgXR3R4BrD0nMnI
	A3b4hjQWUUu95f/Iqo7RnD9qTS94bvZtAXYre6y7qYjWLtgYsaSJFVeL4nEeeaym7hFhbSDmUbPR7
	0vMUdiLlAg/924AoDfYezz1M5FOXEEg3Ye7/f3PLZEMrdSBajLjPMWuIrJQ6KrVC4IRhKOHuil9x5
	e3Zuq6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7whx-0000000BP12-1GXp;
	Sun, 12 Oct 2025 14:05:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7whw-0000000BP0w-0i36
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 14:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A93860304;
	Sun, 12 Oct 2025 14:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED52C4CEFE;
	Sun, 12 Oct 2025 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760277954;
	bh=+UJhMGZLyCB4kTOPEaLd2P01YsA/qWwFEyrlQUBQcx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3PZwKLiwlWm2I2cNuHVGFdOaowBIIrTvOUxGlF8LH8q6n3x+TqguvNqYioYxRAoI
	 05Hvv8wgfL39oQEZIvYP5Dn+DubgzdvS5zIBqxY54kAYQO7DvA9KQEGwzbBeJduHTL
	 BKopD+6JZboWhlSxYI7Ej+5CRsbZ3tprz1ZFoGxyGoQLWyLgo5StZk+t0/ZJxJj2HN
	 Lf3GMTLshGK/v5276uYpsZZH0/T7L4t31OmoiQOdvzbLzQXEtac6aJlIylrAJ7Tq6/
	 GD6VGvq40yJcUxk/uBjYyg8jXbIs1wM7XUXcZ664/x9sGncUghLAy+wYOjDDoU0ID7
	 39nbFx0Od3O7g==
Date: Sun, 12 Oct 2025 16:05:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: pwm: samsung: add exynos8890 compatible
Message-ID: <hapruczvl5fknoxpuciwqe2fhhmnv6ybtvsr74fn2l2vl7r5t2@o6p3la4pskhw>
References: <20250914132033.2622886-1-ivo.ivanov.ivanov1@gmail.com>
 <f5b4ed0f-85a8-4476-898e-0a13dcdc2c6e@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z6wswybev2kbjalj"
Content-Disposition: inline
In-Reply-To: <f5b4ed0f-85a8-4476-898e-0a13dcdc2c6e@kernel.org>
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


--z6wswybev2kbjalj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] dt-bindings: pwm: samsung: add exynos8890 compatible
MIME-Version: 1.0

Hello Krzysztof,

On Fri, Oct 10, 2025 at 02:32:53PM +0200, Krzysztof Kozlowski wrote:
> On 14/09/2025 15:20, Ivaylo Ivanov wrote:
> > Add samsung,exynos8890-pwm compatible string to binding document.
> >=20
> > Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 +
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

While I'm usually slow picking up patches, that one already went into
Linus' tree with my PR for 6.18-rc1.

Best regards
Uwe

--z6wswybev2kbjalj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjrtb0ACgkQj4D7WH0S
/k6f8wf/VVy0eDHP5BQPfEP1qBLBXktw0c4YpVZ4E3p6s3El7je2gETUIqi2HqLF
+4qOx/oB0jOyKvXVhnDiU3+dh0QT5Ow0VKc2TUJoLf0o12E89OehJQtVJUKXjmTh
GRqlKo09MbvTG7/zC2lGLgJUDsoc0eCvbnbwUxb4CikGR5Vu4E1VVPj8JljPxkVJ
9D9kcuwh1zZjKi3NVQsR6UjDqsIpq+p7li9znwFJ7SAwqbVWtHyxGr94r+inFa0A
/PcWDjSe6pKKuxytENlPVZnO6X0pdhvE2ul5/bsfdQ9ic+l/HhSgcrkG72QU4lW+
AtZu0tD7AG53YJd8KA9baajd1KXGcw==
=s9Xt
-----END PGP SIGNATURE-----

--z6wswybev2kbjalj--

