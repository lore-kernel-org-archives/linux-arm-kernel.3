Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53349C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lG8o7GXuxZX+JAJ5wwvlYurB2A3tztlS0yQP249B198=; b=m2qZT8VodDemT0+djcJGLiRDCZ
	8v8malXfzZA1pjY9VTZsG49RCxL/o8R5NwfimmghiYmgnAy+DF+9N7RpWfMyPd8HDY9Ma/Xm4LaSc
	smmagL9kYECO8V+gRWjBiQK5fYCKLlpri5rt1hjEd4vjJuADgcrolTIjTsOeAAS/NS0Ea8WBtEu6h
	acGdbIsDNcx451bQpGxVBU4j+/fbSt0Iwqs1/lCdrG92Hc5Xnu7PKljxilXs2HnpIUrZt2x/Du5VZ
	6JaM1t7GolIYRRa4xPDANLDSWlxDI/nw9w6yhnyVvwGnDtPv1uBt9aH9PiIx1uy/37A62oHN4Ee6F
	RTczuLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d91-00000007UWT-0pgk;
	Mon, 07 Sep 2026 17:28:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3d8z-00000007UWN-2pO6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:28:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29EDE4002F;
	Mon,  7 Sep 2026 17:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B093A1F00A3A;
	Mon,  7 Sep 2026 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788802113;
	bh=lG8o7GXuxZX+JAJ5wwvlYurB2A3tztlS0yQP249B198=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HY1KTOtQVDzcfBMo/HUr7NbDpE0BpzWUgV/gqCrf9tApeH0B1cQlH2hoZ0rzfb4Wm
	 M8URKzs++iSeMg51nUBz5+1e4gNzRQDhx/a3igEIV++4TG2AlRfmLDbGHA7oQpM5Rg
	 0TgVuO4hXFzBrFoO7VAG64sYp8l0RvyiyeAhP37NUUdUDg0KMzKAnoGQdJwKGpJcKe
	 EoUSaUmtBqJ0ui/P+y5/iXHrqGG493/z0FNFxi3c6l3AAvEqE+vyl4WDd4GnoutZUx
	 uiDnKErAucLXMydRPhFe0AykUMS8/yz3kZmGMLeQftICfrc3XU1vT9BmDoppQzEsjx
	 ZzlPtnOPTlz3g==
Date: Mon, 7 Sep 2026 18:28:28 +0100
From: Conor Dooley <conor@kernel.org>
To: jcarlosgl96@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
Message-ID: <20260907-stock-eggplant-d03a9df18a22@spud>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
 <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TEVY/w6YcpsZjCWR"
Content-Disposition: inline
In-Reply-To: <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me>
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

--TEVY/w6YcpsZjCWR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2026 at 04:05:49PM +0000, Juan Carlos Guti=E9rrez Lavado vi=
a B4 Relay wrote:
> From: Juan Carlos Guti=E9rrez Lavado <jcarlosgl96@proton.me>
>=20
> Add the Smart Products Connection vendor prefix and the board
> compatible for the SPC Glee 10.1 tablet based on the Allwinner A64.
>=20
> Signed-off-by: Juan Carlos Guti=E9rrez Lavado <jcarlosgl96@proton.me>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml       | 5 +++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index f04db28c6..ce425938c 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -902,6 +902,11 @@ properties:
>            - const: allwinner,suniv-f1c200s
>            - const: allwinner,suniv-f1c100s
> =20
> +      - description: SPC Glee 10.1 A64 tablet
> +        items:
> +          - const: spc,glee-10-1-a64
> +          - const: allwinner,sun50i-a64
> +
>        - description: SL631 Action Camera with IMX179
>          items:
>            - const: allwinner,sl631-imx179
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969..ff462d6f0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1603,6 +1603,8 @@ patternProperties:
>      description: Spansion Inc.
>    "^sparkfun,.*":
>      description: SparkFun Electronics
> +  "^spc,.*":
> +    description: Smart Products Connection S.A.

Typically we look for these to match the vendor's website, which I think
in this case would be onspc?

>    "^spinalhdl,.*":
>      description: SpinalHDL
>    "^sprd,.*":
>=20
> --=20
> 2.55.0
>=20
>=20

--TEVY/w6YcpsZjCWR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap70PAAKCRB4tDGHoIJi
0vxzAQCi0QTrA0WKec0buuvAiV6kfKTDWQ3NX8CCtz11tIHWDQD7BQ8gEclMlvB2
r7x6V6ctZaTxbR6318OGYFCYYQr56AU=
=KFiq
-----END PGP SIGNATURE-----

--TEVY/w6YcpsZjCWR--

