Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F244EEFCE4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T22TH8MET+b/4gZ8FkcXhYgAB4jyTwECZnc0Ae3vJfs=; b=d+OUuvNmXD5MZe0/xA33OKT9Cg
	yYkU4ofbzMkryfTH47JV0l6Qw0WkYkUi6VR7kVrsDksf35gvfC4PIkRaMRyPgBC/IrZ8tf+RHFgu2
	ZTf2G8PHHi5BuC/f8CWohJIkz6h6GGSa8cBiKzeqoHXFlBAzUybNPibIEaAkwfoNr0pxtQQ1zg6Ud
	B0dD+uIekBYGFy7Udj9DnrZRIObNVFGJsH/bn0JwrjHxtdHQEi+EDSCWJoe68ZuW4l1EyJ4i4XeSU
	hj/gd7/MV1s9yl2qTUOX5eTTkUokzniLnfqkJBqTJF5l39CrGmsozEcdzHmrKUOYFmgaLh8Kpyo1t
	E/u4twrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuiL-00000000aMj-3LBM;
	Wed, 04 Mar 2026 22:29:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuiK-00000000aMN-1rKt;
	Wed, 04 Mar 2026 22:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7740960053;
	Wed,  4 Mar 2026 22:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AD0C4CEF7;
	Wed,  4 Mar 2026 22:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772663347;
	bh=ORYQQGNYlwnQgy888AgkqY1bU5sv3cRTXo0nb+aOkbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OU3WRITIa8Au08wJ1jU2p9dBP01IwGSkDOCxNBL7XgBg6trhBqfW4Ma4uATYqAA9L
	 3ejgoDmg66mLFvZab4yEK1JF5QHuEDe6vcg7cH290T7LdhLrtp0LXXstY9WgkQK1b3
	 bIOThJ+xB6KrTCwwKCZuYoZ7vSuqGoCCm+7RvlXw1X+/XnXsNYE1FLGAKIxNGStdXa
	 P5MrB9tsMPJuk6qnOJNV0luFGZa0zafeMF19a7WtioPcW1+SQzTzVbEU2Hk2qlxW9u
	 OJSOemr7f22VbMRG6Vk5xBjr2DVGzuDTBtkkdh1xpelWs1ohTyOWIlzo/7wYYGlnPR
	 GG4+tsXGtc+aQ==
Date: Wed, 4 Mar 2026 22:29:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: eip93: add clock gate and reset
 line
Message-ID: <20260304-thinner-ungraded-67d7472b6c0b@spud>
References: <20260303193923.85242-1-olek2@wp.pl>
 <20260304-hardship-abreast-7a2d58cbe446@spud>
 <f9b266d7-f545-4088-b6c5-a0cc8676d60c@wp.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RUXrRWyOYYwphHi5"
Content-Disposition: inline
In-Reply-To: <f9b266d7-f545-4088-b6c5-a0cc8676d60c@wp.pl>
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


--RUXrRWyOYYwphHi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 10:46:41PM +0100, Aleksander Jan Bajkowski wrote:
> Hi Conor,
>=20
> On 3/4/26 20:08, Conor Dooley wrote:
> > On Tue, Mar 03, 2026 at 08:39:17PM +0100, Aleksander Jan Bajkowski wrot=
e:
> > > Add the clock gate and reset line, both of which are available
> > > on the Airoha AN7581. Both properties are optional.
> > Why are they optional?
>=20
> No reason. In theory, a hardware designer could connect the reset
> to a fixed input signal. In practice, all SoCs on the market have
> a built-in reset and clock controller. I can mark them as required
> in the next revision.

Right, the reset could be optional on some systems, but sounds like it
is always there on the an7581. The clock is probably mandatory always.
I think you should make it required in the binding, but not in the
driver since that needs to work with existing devicetrees.
Technically this is an ABI break (new required property), so at least
mention in the commit message that you're aware of this.


>=20
> > > Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> > > ---
> > >   .../crypto/inside-secure,safexcel-eip93.yaml         | 12 +++++++++=
+++
> > >   1 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,s=
afexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure=
,safexcel-eip93.yaml
> > > index 997bf9717f9e..058454b679b4 100644
> > > --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel=
-eip93.yaml
> > > +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel=
-eip93.yaml
> > > @@ -48,6 +48,12 @@ properties:
> > >     interrupts:
> > >       maxItems: 1
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > > @@ -57,11 +63,17 @@ additionalProperties: false
> > >   examples:
> > >     - |
> > > +    #include <dt-bindings/clock/en7523-clk.h>
> > >       #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/reset/airoha,en7581-reset.h>
> > >       crypto@1e004000 {
> > >         compatible =3D "airoha,en7581-eip93", "inside-secure,safexcel=
-eip93ies";
> > >         reg =3D <0x1fb70000 0x1000>;
> > > +      clocks =3D <&scuclk EN7523_CLK_CRYPTO>;
> > > +
> > >         interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +      resets =3D <&scuclk EN7581_CRYPTO_RST>;
> > >       };
> > > --=20
> > > 2.47.3
> > >=20
> Best regards,
> Aleksander
>=20
>=20

--RUXrRWyOYYwphHi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaiyLQAKCRB4tDGHoIJi
0ibOAQCXhDFN8QSYrxF47Qb/oFi3wBnPBFiMdgbEvxrc67IdFAEAyO/3v3UV4NE5
KvSZXTUIkTs0eodNUYw8zdjOzJ0vQAE=
=6PiR
-----END PGP SIGNATURE-----

--RUXrRWyOYYwphHi5--

