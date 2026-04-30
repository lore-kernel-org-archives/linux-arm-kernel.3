Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2922CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 18:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTpHeklC6RO0arWg/gqlIxXljGvUv5TozXjqL5OAPlo=; b=yyC6GDOEZJb/0urq7AI7bvMeMV
	t8jLGeQBGIwEU5327ew0Pq/3zungFKilxeiGYNN8q8V2/4QrN04u+BbncXLuEi06uUjX+uTTNzY8v
	1c8ID4HO8xx6/nicUG+KMlHxWUWIOt8vsitZuPc/h31RySi7n7siHmkBkL8Dp9Pw/MGJzwZ8oT0k8
	JJelY/y1HvWcHjYLS2tyzomE2j7yv4lOQAx5zjXEPZUqW+Rcmuyjx+GJBU8bIX7jDXmu5uC5Q9lMz
	iH9C4BmkSX1dcHCMeAB4TosUF5OhHXZKgkn0DRkEHb/h+i0ueJT/cQMUxJfoihhg61M1hgIgDAyVE
	na2nMMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWVz-00000005qc0-2KRr;
	Thu, 30 Apr 2026 18:53:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIWVt-00000005qaW-0CBw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 18:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58970441CA;
	Thu, 30 Apr 2026 18:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477E7C2BCB8;
	Thu, 30 Apr 2026 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777575208;
	bh=fwwPcQWOWqGnk9tycak+N0Nfom1/bWobWQp3LsvSbMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HYYQdIsb3BRSmWBGulj7gwK+RisK5UnSmL0v6Uql95ZJ91CIS3Z/Na5yOKCPnJkM/
	 CFUdYrcKqaJyGj05fQfcM5vePhU5XBHIvgKHBgPJWyEoJEgSgE08DtBOx0bDl+A3d3
	 ctOE5gRi0xHUSoS4mk5QhzmitJJrtpFGGjH2qkyyL9UgiCYAZziccu98mSKX2YDO4p
	 93DNOP/tDrgGRvpv2DLgEQ/1bH3/wpgS/fRNY5EIuGrABiWiDeEBUxjbVDo5RBciz/
	 uZrBgydmZNXs/6ZVDDu32rbQDf2tMGIYx67hnnuOfY7PsPP16d5hVVHmj1fvrmR3jR
	 7CgCIkFVv6uFA==
Date: Thu, 30 Apr 2026 19:53:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Florin Leotescu <florin.leotescu@oss.nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260430-breeching-directly-811a1b78182b@spud>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
 <20260429-shiftless-docile-e57509e967c4@spud>
 <afNE46C7GBswP8LG@ro-kernel-workstation>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CIKz425QYUwqIjTi"
Content-Disposition: inline
In-Reply-To: <afNE46C7GBswP8LG@ro-kernel-workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_115329_292111_405BE7AA 
X-CRM114-Status: GOOD (  22.44  )
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


--CIKz425QYUwqIjTi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 03:02:43PM +0300, Florin Leotescu wrote:
> On Wed, Apr 29, 2026 at 07:18:04PM +0100, Conor Dooley wrote:
> > On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com w=
rote:
> > > From: Florin Leotescu <florin.leotescu@nxp.com>
> > >=20
> > > The EMC2305 fan controller supports multiple independent PWM fan
> > > outputs. Some systems require fans to enter a defined safe state
> > > during system shutdown or reboot handoff, until firmware or the next
> > > boot stage reconfigures the controller.
> > >=20
> > > Add an optional "fan-shutdown-percent" property to fan child nodes
> > > allowing the PWM duty cycle applied during shutdown to be configured
> > > per fan output.
> > >=20
> > > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> >=20
> > Why didn't you pick up my tag from here:
> > https://lore.kernel.org/all/20260407-slang-scoff-795164352c62@spud/
> >
>=20
> Apologies, I missed your Acked-by tag when preparing the series.
> I will include it in the next revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Don't resend unless there's something else wrong with the series.

>=20
> > > ---
> > >  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++=
++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc230=
5.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > index d3f06ebc19fa..8c2548539d7f 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > @@ -54,6 +54,12 @@ patternProperties:
> > >            The fan number used to determine the associated PWM channe=
l.
> > >          maxItems: 1
> > > =20
> > > +      fan-shutdown-percent:
> > > +        description:
> > > +          PWM duty cycle in percent applied to the fan during shutdo=
wn.
> > > +        minimum: 0
> > > +        maximum: 100
> > > +
> > >      required:
> > >        - reg
> > > =20
> > > @@ -80,12 +86,14 @@ examples:
> > >              fan@0 {
> > >                  reg =3D <0x0>;
> > >                  pwms =3D <&fan_controller 26000 PWM_POLARITY_INVERTE=
D 1>;
> > > +                fan-shutdown-percent =3D <100>;
> > >                  #cooling-cells =3D <2>;
> > >              };
> > > =20
> > >              fan@1 {
> > >                  reg =3D <0x1>;
> > >                  pwms =3D <&fan_controller 26000 0 1>;
> > > +                fan-shutdown-percent =3D <50>;
> > >                  #cooling-cells =3D <2>;
> > >              };
> > > =20
> > > --=20
> > > 2.34.1
> > >=20
>=20
>=20

--CIKz425QYUwqIjTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafOlIgAKCRB4tDGHoIJi
0tzDAPoCZp0mN8oQj5I4vZNujEnYEEez3a7DkufwLlRs66MyAwD/UfOlbzrNu9E9
Tx1XmbVtEQZazMbIlyCCtrdKiJ+/2w0=
=Zgdq
-----END PGP SIGNATURE-----

--CIKz425QYUwqIjTi--

