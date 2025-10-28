Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BD6CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdSHPjlTxcHr5Usq1uaQu9v4MasYZBZuPy1sQRv5s0o=; b=LOb4Hha8i+lrsJKoCBvQgckPu4
	EFg3j0SwrhvwpxEg9BX59sw9sQQdj8kx2wY6b+bChEpBAhM11TaXzxxloUko1Ougi1TuNXUhoCSAh
	if7SsLBqACNE4wfnXLQS0zfn8+v8Z4mxfOCX2cDQdP00f57Wh/WV+lSVQ9pTmeQ/8MSIW0ebH6kJa
	qOgIShPpRuDZy10/NM4jPUKXxt0mpVbUKdPOvywXgKvuKW2qwgUtHyLQ+shbK/fE5+bt+HcnDzuMG
	qqRj1BghXFFzT3nygQXv3lZzjlZf0ENkvMl/zbLd3mBb3RXA+Z8ZoUkkz1oZSRJQAknm6xWxpVFx2
	sJZ4tlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpTI-0000000GYYM-1ZQF;
	Tue, 28 Oct 2025 19:35:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpTG-0000000GYYD-2nQj;
	Tue, 28 Oct 2025 19:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEB71602BE;
	Tue, 28 Oct 2025 19:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FDEC4CEE7;
	Tue, 28 Oct 2025 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761680105;
	bh=TduQ/dgw+UuyE9mcK4GdQk5Yb3BIZ3ZWL8E2yD0tmpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVCLQu91cK4OpYffGRZamj+PPqPn5Gscu6EfUvTLNA37ubHqnxoEvi7lkRhEUGzDU
	 xL7ajaFSUyzXsA42/xVNQ4czWtB1MBMqhIvkJRa5prxJSIfw7Kp3H0aY6iGWN7cvqL
	 DU+ZyTgdHiNVEh+Qk5neaRJecK1qppidmbUgTxG/SAgKOouzYEupm1cElGJlXC0/wj
	 2E6l3/tTjg+U6Fn3iJozbSxLR97mwx/psasiVkUP0OIuaP5z2jOnFeBvBW90b/IXrU
	 qZAspKr2+91BJwhGzKLTFSBj6DP9hVzPDA6reyF6X5dxROzHoXO68NWvz2H5XBajRg
	 213VaXtJCbnKw==
Date: Tue, 28 Oct 2025 19:35:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
Message-ID: <20251028-haste-amusing-78c28e834b5b@spud>
References: <20251026143645.917588-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gl+av2e7HRT0n/2a"
Content-Disposition: inline
In-Reply-To: <20251026143645.917588-2-coiaprant@gmail.com>
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


--Gl+av2e7HRT0n/2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 10:36:44PM +0800, Coia Prant wrote:
> Add NineTripod to the vendor prefixes.
>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index f1d188200..37687737e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1124,6 +1124,8 @@ patternProperties:
>      description: National Instruments
>    "^nicera,.*":
>      description: Nippon Ceramic Co., Ltd.
> +  "^ninetripod,.*":

Why ninetripod instead of 9tripod? That's what the company uses and in
the marketing fluff for the boards.

> +    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
>    "^nintendo,.*":
>      description: Nintendo
>    "^nlt,.*":
> --=20
> 2.47.3
>=20

--Gl+av2e7HRT0n/2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEa5QAKCRB4tDGHoIJi
0lLpAQCEq5o2AIeBeKU/HTLGiRDFRwZsauzXLY1N19v7WOrccAEAk2K6wBMBRl7P
WXToJKSFpArrZz2WIkOYuL/UaqrZ8w4=
=1enS
-----END PGP SIGNATURE-----

--Gl+av2e7HRT0n/2a--

