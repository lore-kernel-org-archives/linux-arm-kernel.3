Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD51CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGbiHINkHdj+BEyy30Si4Wj3e1RckJgbpESUr/nVpDM=; b=mq/sTvhzuUBi4ivdHBsap+846F
	/JYW4G1zCttl7G3o0aa6vHY3cvKwArHGcfQIhTzpOrKwhrs65+Q/aTovqLnC+dsWNEyVCasNlNpEb
	e944c9dm/hJ4qKyu+3uXX/my1oqU257gOtvbY0qPwKvvH3l2wEbvPDhv3ynZ0C6V8TUA7yCdpV3HH
	fqoBk6o3Sp6gaQhxgAw4fDAEYB9PfJb9Bm3uE0JT//aD7LBNr7f+J8X9yXdA85Z3NZ+DL+OGqyIZ0
	+hwKkTDfjImT+9ZZdPpktMsJD+tTdRBeucxhz1MV1szOLx9VGJ2vhk+zW//LA/aCHthSpnuCeQBT6
	1EvnP5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41eD-00000008lMV-0CBL;
	Wed, 01 Oct 2025 18:33:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41eA-00000008lLh-2CF6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:33:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0899D44F5A;
	Wed,  1 Oct 2025 18:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8B4C4CEF1;
	Wed,  1 Oct 2025 18:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759343629;
	bh=Xb2lH0sV16eeETFsmOI0Y8doM7vNsNLpecPTgoVug9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ0jdwUAbWT/9x4SadJIY2f4V/NL3jEI+DJHNGWWhIxzczO13aFPh/6klDqwA8bL9
	 cLcgoW557k6R40KFRWM8Tw9dxoZPfUa4sqnn8MgwMwVsxuoUTexDoY+TuVR2m1U1LS
	 n41xfrN/iRQlc0P/yScu/JOxqqa+e5I/Xtmu3ug1AsYLlMjpsxgNJxDZ3AO2ymxE33
	 FF51i9KgZCiSognZU8iMD11mIHZVDtNyEEG0T6AJJ0ptTU3EYOhaDlHvaGxzCvSmau
	 EIO8mt5aff/aLLg/CfFJgfFyqDGqOGBw0+yZ08QoUJXsAuH6HptbAodY1Tba5+7l2p
	 jFjG/5jVsEFpA==
Date: Wed, 1 Oct 2025 19:33:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Amithash Prasasd <amithash@meta.com>,
	Kevin Tung <Kevin.Tung@quantatw.com>,
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Message-ID: <20251001-bonding-surging-af8cd0d09e07@spud>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
 <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N49fSXuRnpf7iDQV"
Content-Disposition: inline
In-Reply-To: <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_113350_583974_E5718BDC 
X-CRM114-Status: GOOD (  14.16  )
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


--N49fSXuRnpf7iDQV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 04:47:50PM +0800, Kevin Tung wrote:
> Document the new compatibles used on Meta Yosemite5.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>

You've repeatedly ignored my ack, so I assume you don't want it.
Maybe you want a nak instead?

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175e109=
a78d931dffdfe28 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -89,6 +89,7 @@ properties:
>                - facebook,minerva-cmc
>                - facebook,santabarbara-bmc
>                - facebook,yosemite4-bmc
> +              - facebook,yosemite5-bmc
>                - ibm,blueridge-bmc
>                - ibm,everest-bmc
>                - ibm,fuji-bmc
>=20
> --=20
> 2.51.0
>=20

--N49fSXuRnpf7iDQV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN10CAAKCRB4tDGHoIJi
0rToAP48ObGVhLOzqtINSi0uK5cZGsYs4Yk4UKr5h8fYmM++rQD/bO5IqlbvGU3Q
ohXJpk3bM7P7wKsfp835IM8Bn2xMTAE=
=on5v
-----END PGP SIGNATURE-----

--N49fSXuRnpf7iDQV--

