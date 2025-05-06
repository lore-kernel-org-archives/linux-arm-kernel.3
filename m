Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8507C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWPvPltkUp3dklnzVWF0Zv1zTf1qDhEI2ezNa1+Nh4M=; b=Gp8wn3FE7nebBaq3R1/87Th/k+
	0KohpENLAkG8x/HZDZdutKuJd+kvYnVeT+LhRcYFR58rBFWOFc0WsFd9b6wNQWEJfhoLO2sPOecLF
	GdPwZPpZqDXDknAoHiWJPuut/8YVnarOoGZmaig5P4JBGhd5rXEwDoAhBMxN4Y9ZDgWyYtfoAjQQ0
	wnTEUi6rRjGaOgUkuor47lwFXTynN6mAAf/K+lqxThjZu/5/XPfB//eFtOVJJBGMVs8S103ymKbzn
	CErG/cAmtbldW4HyPlbbwN3EL5DsFaQ0xAUVLe9BB7mWuX5seyDThAWi17HhlxwUc8e+RHaoQkPxU
	x2H4LN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOQf-0000000DIMs-3Mfg;
	Tue, 06 May 2025 19:58:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKTX-0000000CXFN-1vgK;
	Tue, 06 May 2025 15:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C38BA4D60E;
	Tue,  6 May 2025 15:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B9FC4CEE4;
	Tue,  6 May 2025 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746546294;
	bh=WdalwAYyOdFnT6F6/VtNfBFmY7xcp4A2sZZoLMVgcmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQcq/68nTJwaMizQN0l8vr8X+LHw7GXqh0r0awClUcrhNistvP4OydRyEgk3l0InK
	 zw6ALhTQbWNipebmdzpQmps8C3Rs5P8jyx11Hr82Ab248hdjXnHwOxVHdJpH8QYwMq
	 UmJiHBVJ+s5fdxLnNj2Ut0QRAUVjB5EZykfsN+fGn4JweZ+niAvzahpoYBvCV9Wwkk
	 l6JfawGA5ye7zy9x5eKU5RdFfTngTJG56Mqhd6jm4hOmgOx+44OIl/xGQvLRtj54Zf
	 J8BgghwlVtG7pYsRlCtuiviaUbiw8zIc1puKmKW59Yqe9iuDP72sVtynBLwRjoKDv2
	 RIAIutCYU7GAA==
Date: Tue, 6 May 2025 16:44:49 +0100
From: Conor Dooley <conor@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	robh@kernel.org, krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org, jonas@kwiboo.se, frattaroli.nicolas@gmail.com,
	andrew@lunn.ch
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576
 and Core3576 bindings
Message-ID: <20250506-almighty-uncork-f7a0bc42d763@spud>
References: <20250506114115.613616-1-inindev@gmail.com>
 <20250506114115.613616-3-inindev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9x2/RhAmDqLYb1/P"
Content-Disposition: inline
In-Reply-To: <20250506114115.613616-3-inindev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_084455_561281_68C51CF5 
X-CRM114-Status: GOOD (  14.71  )
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


--9x2/RhAmDqLYb1/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 07:41:14AM -0400, John Clark wrote:
> Add device tree binding for the Luckfox Omni3576 Carrier Board with
> Core3576 Module, based on the Rockchip RK3576 SoC.
>=20
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Docume=
ntation/devicetree/bindings/arm/rockchip.yaml
> index 455fbb290b77..826dede32145 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> @@ -715,6 +715,16 @@ properties:
>            - const: lckfb,tspi-rk3566
>            - const: rockchip,rk3566
> =20
> +      - description: Luckfox Core3576 Module
> +        items:
> +          - const: luckfox,core3576
> +          - const: rockchip,rk3576
> +
> +      - description: Luckfox Omni3576 Carrier Board
> +        items:
> +          - const: luckfox,omni3576
> +          - const: rockchip,rk3576

Not sure this is correct, does the module not have to be attached to
this particular carrier to be used?

> +
>        - description: Lunzn FastRhino R66S / R68S
>          items:
>            - enum:
> --=20
> 2.39.5
>=20

--9x2/RhAmDqLYb1/P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBoucQAKCRB4tDGHoIJi
0iJcAP0aeskjOu/xrVMFMflVV16ukhNjSpo2tYNFY/pRnnzgvQEAqkb3TqJYOZR4
nrsDlRLQcH7Qtjo21/qxLcmF7Z0OEwE=
=pT+F
-----END PGP SIGNATURE-----

--9x2/RhAmDqLYb1/P--

