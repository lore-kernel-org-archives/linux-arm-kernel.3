Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96A6FD9E0C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Htt6VCrCH3vnq7s4qMqPAlg58/6Hv1w1mILXYmV4QWQ=; b=rT6pxe+TPDUnMAsqz7hwhpaz7y
	DOb9sWJW84gyvtKy6iDnhS6e0IONwz//Zf+Smyj9E4TDxCWHVCjg+KrzwawZJI1HUuw0cx6/EOWfG
	o02ZdnWptHx873OfcU0PV7k/pSNsPO/eyyW/8FFQk6twFtwTDd4rK49Tt0l7rM8WD47IIZaxHlHt9
	JmKypmVoCwtBtJ0CYIIEcrm13BSSGRpQQH1eJFi0fpCITZVIaLGw2zlkkmtRzhWUqdtz6Q6xNOd08
	vpDVVnZYRFwibmx9dDBxIjc8v4arW2qwbKg74KYGI98jipzTlJHlhCU0XhFRXZKNs5RzHEtCidF+v
	ggNDn5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhIY-000000076F3-1zTX;
	Thu, 26 Feb 2026 19:45:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhIV-000000076Eg-0nAX;
	Thu, 26 Feb 2026 19:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772135116;
	bh=Htt6VCrCH3vnq7s4qMqPAlg58/6Hv1w1mILXYmV4QWQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WgS5S/ZO7TSdqprtgR6bQsf4WDSFyI3gKW842oS+BDmb2aSoxhJ8bHRhe7gYSgD48
	 P9fRWTgB/6xaMAdt5rahzBB/Q6xzvZxKl9VNzettz97gPfSLwzFR6z4wlJeVhuJlUD
	 exJiPc/iFvlVB+sHms6+1RIf3D18aDqy330yz6+b2LFpDyvj/3FYjbjM5Q+RYSMySg
	 pIIj4sxpAD+QgtbpegyP9PUelLixra7m5Xjk+6M69sXi3md49fMZaZXlIu7JXHkRtN
	 tQUTUbm84a+z+MfeHpVtHkpbn73TY3IK1ygZN5rZpJDDtbMbJ3CDzAD2oCukD8EWt6
	 AZLkzEIWDFuLg==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFEED17E0948;
	Thu, 26 Feb 2026 20:45:13 +0100 (CET)
Message-ID: <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Conor Dooley <conor@kernel.org>, Cristian Ciocaltea
	 <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova	 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 kernel@collabora.com, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley	 <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
Date: Thu, 26 Feb 2026 14:45:11 -0500
In-Reply-To: <20260226-salute-threaten-a3eabb232396@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
	 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
	 <20260226-salute-threaten-a3eabb232396@spud>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6UGd8Ri2+YJO1QGD5T1b"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_114519_437602_0E6E09B1 
X-CRM114-Status: GOOD (  34.94  )
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


--=-6UGd8Ri2+YJO1QGD5T1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 f=C3=A9vrier 2026 =C3=A0 18:43 +0000, Conor Dooley a =C3=A9crit=
=C2=A0:
> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
> > With the introduction of the RK3588 SoC, and RK3576 afterwards, two mor=
e
> > register blocks have been provided for the video decoder unit.
> >=20
> > However, the binding does not properly describe the new hardware layout=
,
> > as it breaks the convention expecting the unit address to indicate the
> > start of the first register range, i.e. 'function' block is listed
> > before 'link' instead of the opposite.
>=20
> I don't understand this commit message or rationale for an ABI break.
> Changing the unit address seems like a "free" fix to your problem,
> especially when reg-names is not a required property that you can rely
> on. Actually, there may be a bug in the driver - it expects reg-names
> for rk3576-vdec and rk3588-vdec but the binding doesn't mandate their
> presence for those devices.

If the bindings had been held instead of released early, the order would be=
 what
is done in this patch for sure, and no one would have complained. These bin=
ding
have never been used by anyone so far, and what you are asking is to create=
 a
DTS that deviate from the vendor provided documentation for the IP base add=
ress.
I know you have all technical fancy reasoning, but I like when things are
functional and effective to work with.

>=20
> Deprecating the order also makes little sense to me, given that some of
> these devices only have one reg entry, which as far as I can tell from
> looking at the driver *is* the "function" region, so it can never be
> entirely deprecated.

What I'd like to see, is a binding expression that behave like a set, not a
list, and leave the ordering open. As people keep repeating, there is nothi=
ng in
a binding that assist to define the right ordering (its not address or base
addres aware). That basically means, we can't as reviewer see that ordering=
 is
going to imposing using a base address in the unit name (which is a conveni=
ence,
not a rule I suppose) that differ from the vendor documented base address.

By explicitly removing the ordering in the binding, we create a strict rule=
 that
driver should retrieve this by name, and never assume the ordering, which I
personally like.

thoughts ?

Nicolas

>=20
> Confused,
> Conor.
>=20
> >=20
> > Since the binding changes have been already released and a fix would
> > bring up an ABI break, mark the current 'reg-names' ordering as
> > deprecated and introduce an alternative 'link,function,cache' listing
> > which follows the address-based ordering according to the TRM.
> >=20
> > Additionally, drop the 'reg' description items as the order is not fixe=
d
> > anymore, while the information they offer is not very relevant anyway.
> >=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > =C2=A0.../devicetree/bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0 | 20 ++++++++++++-----
> > ---
> > =C2=A01 file changed, 12 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > index 809fda45b3bd..c513b68d2c72 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > @@ -28,16 +28,20 @@ properties:
> > =C2=A0
> > =C2=A0=C2=A0 reg:
> > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> > -=C2=A0=C2=A0=C2=A0 items:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The function configurati=
on registers base
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The link table configura=
tion registers base
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The cache configuration =
registers base
> > +=C2=A0=C2=A0=C2=A0 maxItems: 3
> > =C2=A0
> > =C2=A0=C2=A0 reg-names:
> > -=C2=A0=C2=A0=C2=A0 items:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0 oneOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: functi=
on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: functi=
on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deprecated: true
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: Use link,funct=
ion,cache block order instead.
> > =C2=A0
> > =C2=A0=C2=A0 interrupts:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> >=20
> > --=20
> > 2.52.0
> >=20

--=-6UGd8Ri2+YJO1QGD5T1b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaCixwAKCRDZQZRRKWBy
9JiHAP4os7RdZaABz35jtFTqxJdGRCHiZ2JyeJsCH7Yj8wqZ1gEAs/hIPqsAIIGJ
I/RUZ0zI4YsAWeThrjFOkFlZA7v8NwE=
=jF9G
-----END PGP SIGNATURE-----

--=-6UGd8Ri2+YJO1QGD5T1b--

