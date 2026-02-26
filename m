Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3A1FD9E0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 20:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5/FLzOr4DlZPXi53jU6kGTmqQR1Tnswd4WLH8Jn2V8=; b=YaYQdb3YWPNy/Y73aslHJJfam8
	J/5P7AyVLM65DpFMlefaSWaQKmi+s6Vu535O4NvweXHEQyi8KT+xDqh/rQh0v8Wr5iTpgB0eFUL7h
	7xNIy0tK5Zeh545K6yzVfLYhHjVjCzoC7hJztMt85gPT6lsoHDbpmsf3wPI6ZMcUZBB327hH99BV3
	k44y3M1XWmVq1HhH87erGVFbBjGTUhNsC5/r9RYj2/uXZ0NPBtrqEUHXAkIF+v0EWC2EEABY5FZk0
	9Jad1DlXgUoSQ330GC58F/VQARqiaGF7cUtTZ/SRMQ4+Mr17heUmZDZaWHqOp6irc4pFYiYfTH1i1
	KuI3XHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviS4-00000007BlI-3QcG;
	Thu, 26 Feb 2026 20:59:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviS3-00000007Bl7-1VqB;
	Thu, 26 Feb 2026 20:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97C0960054;
	Thu, 26 Feb 2026 20:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287D0C116C6;
	Thu, 26 Feb 2026 20:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772139554;
	bh=cKcN2V29V13koNaaY/Nhem64w71cAay19I8PFL1jhi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC2QrcXJ1AQanIDOsmn+YKZ7wGHFs9oPx6b9VwtF0WgjGtvbgicPwBaatIuAGGPS7
	 +KqX0TAHuV5Qd9ZdHpmM/ZvbTReoXZqWLmOi/rT5QoSMD7WheVJIZ6JOtUdtkNsWrj
	 yRifcLVIJDbJ0Gk5/bRyvfXNGM1DLTFC7qzCrAE5NqbjhNQ1aBkwrA/EJnu58b8BAL
	 EaLA0DaAPhFA8RH3pTyMnVSw+FaZgIIutFVJ0hKeoVgY4cU4rPEIqeUSALZK2h00A/
	 vZopphsOuJJKk3Y2R5R5OBSYwh2+G8NkoyibQg3JlrSAk/tLkJfQbqdvfCX99fexAa
	 EYDmeCaCARX4Q==
Date: Thu, 26 Feb 2026 20:59:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260226-snide-foil-a05e1aa156a8@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TI6MRG6jfhf7gfkz"
Content-Disposition: inline
In-Reply-To: <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
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


--TI6MRG6jfhf7gfkz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> Le jeudi 26 f=E9vrier 2026 =E0 18:43 +0000, Conor Dooley a =E9crit=A0:
> > On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> > > With the introduction of the RK3588 SoC, and RK3576 afterwards, two m=
ore
> > > register blocks have been provided for the video decoder unit.
> > >=20
> > > However, the binding does not properly describe the new hardware layo=
ut,
> > > as it breaks the convention expecting the unit address to indicate the
> > > start of the first register range, i.e. 'function' block is listed
> > > before 'link' instead of the opposite.
> >=20
> > I don't understand this commit message or rationale for an ABI break.
> > Changing the unit address seems like a "free" fix to your problem,
> > especially when reg-names is not a required property that you can rely
> > on. Actually, there may be a bug in the driver - it expects reg-names
> > for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
> > presence for those devices.
>=20
> If the bindings had been held instead of released early, the order would =
be what
> is done in this patch for sure, and no one would have complained. These b=
inding
> have never been used by anyone so far, and what you are asking is to crea=
te a

20:35:32 conor /stuff/linux$ rg "rk3576-vdec"

arch/arm64/boot/dts/rockchip/rk3576.dtsi
1283:			compatible =3D "rockchip,rk3576-vdec";

20:35:34 conor /stuff/linux$ rg rk3588-vdec

arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
1357:		compatible =3D "rockchip,rk3588-vdec";
1389:		compatible =3D "rockchip,rk3588-vdec";

These look like users, at least at first look. Some elaboration on that
would be good - impact on users definitely should be covered in the
commit message of an ABI break.

> DTS that deviate from the vendor provided documentation for the IP base a=
ddress.
> I know you have all technical fancy reasoning, but I like when things are
> functional and effective to work with.

FWIW, I don't think you were trying to be dismissive, just trying to
make a valid point about usability being important, but providing clear
justifications for why the order of properties should be changed (or
other similar ABI breaks) is really important. This is v4, and the
rationale you've given here about the documentation, which is the actual
motivation for changing things around, doesn't appear in the commit
message, even after a back and forth with Krzysztof in an earlier
version.

> > Deprecating the order also makes little sense to me, given that some of
> > these devices only have one reg entry, which as far as I can tell from
> > looking at the driver *is* the "function" region, so it can never be
> > entirely deprecated.
>=20
> What I'd like to see, is a binding expression that behave like a set, not=
 a
> list, and leave the ordering open. As people keep repeating, there is not=
hing in
> a binding that assist to define the right ordering (its not address or ba=
se
> addres aware). That basically means, we can't as reviewer see that orderi=
ng is
> going to imposing using a base address in the unit name (which is a conve=
nience,
> not a rule I suppose) that differ from the vendor documented base address.
>=20
> By explicitly removing the ordering in the binding, we create a strict ru=
le that
> driver should retrieve this by name, and never assume the ordering, which=
 I
> personally like.
>=20
> thoughts ?

Yeah, you can do this, but to avoid potential breaks you have to do it
=66rom the start, not after the fact. Probably there's bindings that get
acked every day that do do this. Even the retcon is okay to do when
reg-names is mandated by the binding and the users use reg-names in my
opinion.

In this case, the driver is currently buggy, because, as I mentioned, it
uses reg-names without reg-names being required on the platforms with
more than 1 reg property. Probably the binding should make reg-names
mandatory for these platforms even without this patch, but it *has* to
IMO for this proposed change to be applicable.

But anyway, the takeaway from my original mail should be "Conor is not
happy with the rationale the commit message provides for this change,
as it doesn't explain why you want to do it". I necessarily object to
the change itself.

Conor.

> > > Since the binding changes have been already released and a fix would
> > > bring up an ABI break, mark the current 'reg-names' ordering as
> > > deprecated and introduce an alternative 'link,function,cache' listing
> > > which follows the address-based ordering according to the TRM.
> > >=20
> > > Additionally, drop the 'reg' description items as the order is not fi=
xed
> > > anymore, while the information they offer is not very relevant anyway.
> > >=20
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > ---
> > > =A0.../devicetree/bindings/media/rockchip,vdec.yaml=A0=A0=A0=A0 | 20 =
++++++++++++-----
> > > ---
> > > =A01 file changed, 12 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.ya=
ml
> > > b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > index 809fda45b3bd..c513b68d2c72 100644
> > > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > > @@ -28,16 +28,20 @@ properties:
> > > =A0
> > > =A0=A0 reg:
> > > =A0=A0=A0=A0 minItems: 1
> > > -=A0=A0=A0 items:
> > > -=A0=A0=A0=A0=A0 - description: The function configuration registers =
base
> > > -=A0=A0=A0=A0=A0 - description: The link table configuration register=
s base
> > > -=A0=A0=A0=A0=A0 - description: The cache configuration registers base
> > > +=A0=A0=A0 maxItems: 3
> > > =A0
> > > =A0=A0 reg-names:
> > > -=A0=A0=A0 items:
> > > -=A0=A0=A0=A0=A0 - const: function
> > > -=A0=A0=A0=A0=A0 - const: link
> > > -=A0=A0=A0=A0=A0 - const: cache
> > > +=A0=A0=A0 oneOf:
> > > +=A0=A0=A0=A0=A0 - items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: link
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: function
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: cache
> > > +=A0=A0=A0=A0=A0 - items:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: function
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: link
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: cache
> > > +=A0=A0=A0=A0=A0=A0=A0 deprecated: true
> > > +=A0=A0=A0=A0=A0=A0=A0 description: Use link,function,cache block ord=
er instead.
> > > =A0
> > > =A0=A0 interrupts:
> > > =A0=A0=A0=A0 maxItems: 1
> > >=20
> > > --=20
> > > 2.52.0
> > >=20



--TI6MRG6jfhf7gfkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaC0HAAKCRB4tDGHoIJi
0jkhAQCTkpi7tlZesS47tglTMIqrlcicor6nxmHd+4N/0T2JAgEAjirK8v2PqsXy
RSXj7VKrwxp+VuNFypnzfUONfv11Wgc=
=jxXf
-----END PGP SIGNATURE-----

--TI6MRG6jfhf7gfkz--

