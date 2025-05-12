Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6D7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04VoAZX1Pkj/3n7T0vHI9PPCpvGqL4ubX0zX6JWFyfs=; b=cgOluU3cO9H1SSGVOCgZVUmnAQ
	/f+sXx5GwPc1fT5/zMAxGlb153DX0V3Ohst+S/CdFVfwKwve5Z8obUi/zBN24PNlpBe/sPgVgZ+LX
	n9Hp2lPmfNmkVJP8XSq1DgA6tYohx6SDLqvWCptPmtxieKd0xDr52UgHf03xrQT6VNJ04dL6CFiZD
	l0xYB0CEt6C14BCjZloW6RzeDW6WQHteYw7BXrLEvraOpuNQSWi7MS78VaA5UwSrnrmPp2b1TiQwz
	9lyleOZJwfRQHiDYhcwURr6PLBTXd9hpzCAHOHz+2Z37mz2+qqwQsCdgtbX82G4NMPMlIqB8C4CCX
	CmPGImEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEW67-0000000A3pe-0LZo;
	Mon, 12 May 2025 16:33:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVbu-00000009y3W-3nr8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 16:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E12A4A212;
	Mon, 12 May 2025 16:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78F8C4CEE7;
	Mon, 12 May 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747065754;
	bh=TCE6Uw7LiVPLM8NbyISS0pYOwHNQf36YyFcNYjE50+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2fAoPc3oOidpqW2oxA1Nde74ERkCSXCK24/ljWYm+Eo+1nRNRqalv9bNLoxASorO
	 hfGrJOfu78egh50rDYD5YArzBmCDAzs8O0R5lSnJKfUidw2OHNrRVrhbTHWcKgCooY
	 V1pwpvywTIJuEEPraQRqeXLTcc89FpM8trEfhReW4pJUUwNA23cx7ASD3wF4DoTzAc
	 Xr7fHguA5SL6YyPl9vRpEunmR9KGkIdhpdWEIUyzmFpiNxLBpM5WCHSQ3wNQzc8v8Y
	 TPU3SRRPw7+F3XsTT/ebKZ0yvaDYxwcCs/ArxU6IAHcXpea3+9ZlNe6dtB0B5A4JxS
	 X8oJGBnWh75qQ==
Date: Mon, 12 May 2025 17:02:29 +0100
From: Conor Dooley <conor@kernel.org>
To: leo.jt.wang@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com, leo.jt.wang@fii-foxconn.com
Subject: Re: [dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings:
 arm: aspeed: add Meta Clemente board
Message-ID: <20250512-activism-dispute-e2549ab2b210@spud>
References: <20250512113026.264785-1-LeoWang>
 <6821dbfb.170a0220.3b15e.aba8@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EEzvPtStEzaz9LSn"
Content-Disposition: inline
In-Reply-To: <6821dbfb.170a0220.3b15e.aba8@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_090234_967603_77C3D171 
X-CRM114-Status: GOOD (  13.91  )
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


--EEzvPtStEzaz9LSn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 07:30:26PM +0800, leo.jt.wang@gmail.com wrote:
> From: Leo Wang <leo.jt.wang@fii-foxconn.com>
>=20
> Document the new compatibles used on Meta Clemente.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Please fix your subject lines for future submissions.
[dt-bindings: arm: aspeed: add Meta Clemente board] dt-bindings: arm: aspee=
d: add Meta Clemente board
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
None of this looks like standard output from git.
Take a look at what other patches and the kernel docs do.

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index a3736f134130..4416a40dcd86 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -81,6 +81,7 @@ properties:
>                - asus,x4tf-bmc
>                - facebook,bletchley-bmc
>                - facebook,catalina-bmc
> +              - facebook,clemente-bmc
>                - facebook,cloudripper-bmc
>                - facebook,elbert-bmc
>                - facebook,fuji-bmc
> --=20
> 2.43.0
>=20

--EEzvPtStEzaz9LSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIblQAKCRB4tDGHoIJi
0naYAP0YicZzkSoOLCHibdodAKfacK/bNJ38DYRNkT10N/l7XwD7B0kGA/gb7PRD
fZiB0rMbZNOPNyKk+FZszA5zj5HCpw4=
=t6md
-----END PGP SIGNATURE-----

--EEzvPtStEzaz9LSn--

