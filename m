Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92D5CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtHTE0ZUOjcMfiVh3eBEYex+oSym3DakLquUDoIGAK0=; b=Vs/jLcCXk/UeUWw0fdxrUA9Zbv
	/4SdQFbcHXhTsmZ53wQqmyTGF59Yd/nV8qb6beixRWx1Q2AQFlzxHt+fjFLo1L6fj1Kb+BcyEb9fA
	3pnlTI3OAa1ggOqGyMdJGlAgpNGT7YMyJgLfayON7vCrbguoP29PHSMS+jiHSz5PfgwH5hdHNeQaF
	HzIQ2daEcJCx0geUpTNu2ND/I3cy5Lg6v5Jxz5mJ4uQfHFdt06AIhX2sSiou/XpKNgFOGgAmqyHOF
	BQVpmNT2I1pqX3sSbWZpIwTFoSsbspfwPnP9zciYqwA28U7bDk5pBsJctlP0cPQhd/BYhSgpn5kaJ
	i3CcZXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmw0-00000009TyH-3NTY;
	Thu, 25 Jun 2026 16:28:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmw0-00000009Ty5-0G9a;
	Thu, 25 Jun 2026 16:28:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FA0360098;
	Thu, 25 Jun 2026 16:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC451F000E9;
	Thu, 25 Jun 2026 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404891;
	bh=WtHTE0ZUOjcMfiVh3eBEYex+oSym3DakLquUDoIGAK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OrnML/WHmTgEM8hECMVUFCXgOabcaUPalCHsOgPbadDyN2KlV0HJNHv1ek7iRlt5a
	 riZ/irtakiS2NB7d2Pv7N49R4idkhbhKD+VZx8CQqGX21ci6hnAwkK51k5eJOKHzu9
	 DvTL/S0QoaPEm/TkeEBoBRqEOgtaQPJliJLcKjooMTNjZLVKUGYl6Spt4ncBnpr4/z
	 VSjNzQ3EnUBZMMXPGCSsrDdteBgpgRYegtOiGjMnny9eqEXuNIrB6VnRxKzJYC+Vv9
	 f2BskVg3UcU1UO34mgOLs6gmIhp4z8Yh4TDMdmJ1AJARrSHkB3ob1qsFSyFM32/9LP
	 Pwy0rZN9EkTCQ==
Date: Thu, 25 Jun 2026 17:28:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
Message-ID: <20260625-cameo-siamese-cd78c349519c@spud>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpFCCusrIGXpI9Qc"
Content-Disposition: inline
In-Reply-To: <20260625104742.113803-2-l.scorcia@gmail.com>
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


--lpFCCusrIGXpI9Qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 12:46:30PM +0200, Luca Leonardo Scorcia wrote:
> Pinctrl settings for MediaTek mt8516-mt8167 SoCs use two reg base
> addresses, one for GPIO and the other for EINT, as it is common in the
> "Paris" pinctrl platform that is described in the MediaTek mt6795 docs.
>=20
> Move the binding compatible for these two SoCs from mt66xx to the mt6796
> one as a prerequisite for migrating the pinctrl driver to the
> pinctrl-paris platform.

I've not done a very through analysis, but this seems like a massive ABI
break.
The change you're trying to make here will mean that new kernels will
not work with older devicetrees AFAICT.

>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 2 --
>  .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml | 5 ++++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinc=
trl.yaml
> index 1468c6f87cfa..0cff2a352b1f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> @@ -22,9 +22,7 @@ properties:
>        - mediatek,mt7623-pinctrl
>        - mediatek,mt8127-pinctrl
>        - mediatek,mt8135-pinctrl
> -      - mediatek,mt8167-pinctrl
>        - mediatek,mt8173-pinctrl
> -      - mediatek,mt8516-pinctrl
> =20
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinc=
trl.yaml
> index 9a937f414cc9..c703de72e1d5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.y=
aml
> @@ -15,7 +15,10 @@ description:
> =20
>  properties:
>    compatible:
> -    const: mediatek,mt6795-pinctrl
> +    enum:
> +      - mediatek,mt6795-pinctrl
> +      - mediatek,mt8167-pinctrl
> +      - mediatek,mt8516-pinctrl
> =20
>    gpio-controller: true
> =20
> --=20
> 2.43.0
>=20

--lpFCCusrIGXpI9Qc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1XFgAKCRB4tDGHoIJi
0jrbAP97wobMnRO7HdyCFDRjLsINUhRhF1pHhFQuAEIeonbG2gEAsdjf82z1L2/O
CIqr2L2XbnkDV93d6huma3K037t9dQ8=
=uL4W
-----END PGP SIGNATURE-----

--lpFCCusrIGXpI9Qc--

