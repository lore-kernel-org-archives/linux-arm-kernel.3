Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1131AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3yYRERUYUVytAtiWQSwuF+7Vjrvbm4KjZdNux6Gig8=; b=M6jaUAc1eqWEHIAI6KMirOLh54
	ivpV/6sL/S8MZOYuWtVTV3XsvrHgADYMxSeK/3QbVytxzFqF813IL9tzGlIFHqd9YHceOGlHov+xx
	+e1vho9rnGELd4tVWOvjdZrD8CFCfVssyQOVWo7Ncajc/TRloAer/B+dXCN8k/mktFlyzOud3dQA8
	Isz9Gc0XsFeAWqNhaD6CqoctzzqWzyk8V8wOGU7FLhVShFYc/AbtaywWvLmynJSV+lnka9J9NAC0w
	bgrEOiIWK6C1Py4XLTHrxFv/aT4RPr9vo/B1IK07T70TcEtmD8dMjn0ZZgxtXGnVf8fwkFXcQp1fq
	hOoak8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgg-0000000DWPN-1uS3;
	Tue, 06 May 2025 22:22:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLG4-0000000Ch32-2aBD;
	Tue, 06 May 2025 16:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE23CA4D6B2;
	Tue,  6 May 2025 16:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFBDC4CEE4;
	Tue,  6 May 2025 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549303;
	bh=uoptlTpW6qeK2AgUdwaGx1IisUVQuZQm4yEmqfnzTbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jxx0uI9/nEy5R97VUwfzVk64Y3uxY0P/9N69G2xEsBrshABBz6A7XyunpO7cDfLHy
	 /6KzEl+Ul8L0n7E9r5DPzBowSEsIX3/tvLbu9y49wkVZJ206+mt8aYKXRVF04cWaUM
	 qZB+6mMGzlwaFefNRQRB54mkuotGYGN7xxLhI2PaA0cicmE7Ami/iI/Y5BDGP9S34U
	 w2zYZEXyDvTXY52pImHjYKUVAR7SUiy2WK6C/jLhz4KZ81aVSE99EFZiE2qWePP8Vo
	 gjN37lTeMXPNGk7SvsP2lOelmt8TQqWUOrwQQR4I/FljuSZ6qd8oEJKrbZNpYqoClq
	 YDKGZcg0qlaGg==
Date: Tue, 6 May 2025 17:34:59 +0100
From: Conor Dooley <conor@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	robh@kernel.org, krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org, jonas@kwiboo.se, frattaroli.nicolas@gmail.com,
	andrew@lunn.ch
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576
 and Core3576 bindings
Message-ID: <20250506-navigate-cannabis-19078e498781@spud>
References: <20250506114115.613616-1-inindev@gmail.com>
 <20250506114115.613616-3-inindev@gmail.com>
 <20250506-almighty-uncork-f7a0bc42d763@spud>
 <c8114ff8-f207-4ea8-aaf1-298dcea9f030@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XP6d7CgI79zNHt7u"
Content-Disposition: inline
In-Reply-To: <c8114ff8-f207-4ea8-aaf1-298dcea9f030@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_093504_793223_965F5B76 
X-CRM114-Status: GOOD (  21.15  )
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


--XP6d7CgI79zNHt7u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 11:54:10AM -0400, John Clark wrote:
> On 5/6/25 11:44 AM, Conor Dooley wrote:
> > On Tue, May 06, 2025 at 07:41:14AM -0400, John Clark wrote:
> > > Add device tree binding for the Luckfox Omni3576 Carrier Board with
> > > Core3576 Module, based on the Rockchip RK3576 SoC.
> > >=20
> > > Signed-off-by: John Clark <inindev@gmail.com>
> > > ---
> > >   Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Do=
cumentation/devicetree/bindings/arm/rockchip.yaml
> > > index 455fbb290b77..826dede32145 100644
> > > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > @@ -715,6 +715,16 @@ properties:
> > >             - const: lckfb,tspi-rk3566
> > >             - const: rockchip,rk3566
> > > +      - description: Luckfox Core3576 Module
> > > +        items:
> > > +          - const: luckfox,core3576
> > > +          - const: rockchip,rk3576
> > > +
> > > +      - description: Luckfox Omni3576 Carrier Board
> > > +        items:
> > > +          - const: luckfox,omni3576
> > > +          - const: rockchip,rk3576
> >=20
> > Not sure this is correct, does the module not have to be attached to
> > this particular carrier to be used?
>=20
> The compute module and the carrier board together like the E25. Presumably
> the compute module would be used in other applications
> but the carrier board is not useful without it.
>=20
> Is the E25 done correctly here?  I can copy this format:

Yeah, the format below looks good for these type of carrier situations.

>=20
> model =3D "Radxa E25 Carrier Board";
> compatible =3D "radxa,e25", "radxa,cm3i", "rockchip,rk3568";
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts?h=3Dv6.15-rc5
>=20
> compatible =3D "radxa,cm3i", "rockchip,rk3568";
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi?h=3Dv6.15-rc5
>=20
> - description: Radxa Compute Module 3 (CM3)
> items:
>   - enum:
>       - radxa,cm3-io
>   - const: radxa,cm3
>   - const: rockchip,rk3566
>=20
> - description: Radxa CM3 Industrial
> items:
>   - enum:
>       - radxa,e25
>   - const: radxa,cm3i
>   - const: rockchip,rk3568
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/arm/rockchip.yaml?h=3Dv6.15-rc5
>=20
> >=20
> > > +
> > >         - description: Lunzn FastRhino R66S / R68S
> > >           items:
> > >             - enum:
> > > --=20
> > > 2.39.5
> > >=20

--XP6d7CgI79zNHt7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo6MwAKCRB4tDGHoIJi
0geLAQDJ0izzs/rvcwECsDGYdXwC3w9wY2NmGbJVdF3BaY+1IwD/dtUh8DTEiNhe
uHU2gI6ycQ+XgXFh1JRJ3eBwkC5n4QQ=
=8jtU
-----END PGP SIGNATURE-----

--XP6d7CgI79zNHt7u--

