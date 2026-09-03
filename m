Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6807EC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEeb2/7YL2GUruftN094qZjMqYgKj+V79G341wEwVdU=; b=26aFmtkpTfOSjC7JjD2ukZAtYQ
	QOB/4IgIc4o22B4OEq8vmJVC5cTBe5Ju1Zi69vCzhzLzfmg6ve44Ab8jRmGkjcXP8ln8YsdpalQn0
	MkmiDKg4lHs4arv4qnEgPv41Uwl33nq21zopKMjoQJmgA0X2GnGLex553nprQwNeSfx3mDtg8tjpj
	p3G7WWjJj3Ve942xg6YN9jwDBbNs0rpj2tUoJrLda8byWNZXa+P6MtxDlsFg4FsKKx4B9FXjPC040
	iJwgXh54hZHF8IiZ/UVPdCG4IlIMT43hfW8v0G+2FR+55x8/K30n+7Hh8t0w2sGWzYd+Nt5HTPY2X
	ScRoBZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BkF-00000000KEx-1lws;
	Thu, 03 Sep 2026 18:01:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BkE-00000000KES-0Hoe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:01:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3486F6020C;
	Thu,  3 Sep 2026 18:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D001F000E9;
	Thu,  3 Sep 2026 18:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788458460;
	bh=MEeb2/7YL2GUruftN094qZjMqYgKj+V79G341wEwVdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JQ6eEQpLEQTSNseCXtideIHM0n5SqjYMDYyFNDnN0/8XuxsTRlS8+mge9KN7HIay+
	 5O4d3vhBL/pOlKfCr9/CHTruSa1blpEhYYi881KEeCtC5ummkoHJ5Cr77Tamd0QSsA
	 Lt7LZdDFQGaNckPhwnYMZRkDOvUT9HfDgWxy3aUhmWVB3RHdmBNkRosImK9GACRr3q
	 YuAMnyaVbBhKmUS0WqhdNH47R4Gm+dwHrg2O5EhGAkvEAnvOVUHxTcdgK1V/caeFPG
	 tIQctEFBTfTCIDwHgYJWCbWmTKhpHH7SgrbYhuVM0CTfd9HMtzpL0Fv083xSd8nlJV
	 Yj2EV9DxosC4w==
Date: Thu, 3 Sep 2026 19:00:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Message-ID: <20260903-sandfish-likewise-820d64daae2b@spud>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-2-jm@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ovc8qnl0w6j+I93l"
Content-Disposition: inline
In-Reply-To: <20260902222759.736124-2-jm@ti.com>
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

--Ovc8qnl0w6j+I93l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2026 at 05:27:57PM -0500, Judith Mendez wrote:
> Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
> The uniphier-efuse driver can be used to read AM62P efuse registers as
> well for GP_SW silicon revision detection.
>=20
> Signed-off-by: Judith Mendez <jm@ti.com>

Why is a fallback compatible not suitable here?
Either it is, and you should add one, or you need to explain in hte
commit message why it is not.

pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-e=
fuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efus=
e.yaml
> index e27cbae2d63a0..5e1b90fc1ae45 100644
> --- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> +++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.ya=
ml
> @@ -16,7 +16,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: socionext,uniphier-efuse
> +    enum:
> +      - socionext,uniphier-efuse
> +      - ti,am62p-efuse
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--Ovc8qnl0w6j+I93l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapm12AAKCRB4tDGHoIJi
0mEIAP9Wg4TCyWqgwIeAjMW/q5Hh+9wLEALXbKS4v0y+J//NagD7BS/4ZyWf+Mzo
iz4cPCS7+6UGINi0ZS4J8+DsBF6ONAc=
=IYI1
-----END PGP SIGNATURE-----

--Ovc8qnl0w6j+I93l--

