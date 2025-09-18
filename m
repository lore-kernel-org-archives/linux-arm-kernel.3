Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DAECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXO8v5oVs7WS6kSxh37iwhPnB/x+TDrxNruA5gxFrZs=; b=QmDyKaoUqCNcC6c4+ZIDg/JdI7
	d3cK7BunrXMxV10cEPb/Xk2zslo7EqKpfi4nqbE5H8QhvGgsTiIrPXokOHq9kVpYumPK96+vp/ZRV
	E0goDujZ8rNySMJjwy6oxGphvMAogYu4ftOVhHFDHesaT/rO29cBnDbh/21u0kB2AWTvKYWou8bZc
	IOJi2QCz9GNc5FCawA2Cvt9eCywaudZpHhuKfhE1rM8UnojI4cNnw0+JgjH9kKRAbHB8J8m3n74xV
	6Y0JZjvspTUOF60eTlxSEa2GSFW0LKTo+GJVjR2b1OkF1XHOpXY/TWvoFeiE7AJIJ3p3U0X9nG3Zc
	WweTamvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGMU-00000000K5K-3iSx;
	Thu, 18 Sep 2025 15:15:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGMT-00000000K4B-2QM0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04E82601BC;
	Thu, 18 Sep 2025 15:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0847CC4CEE7;
	Thu, 18 Sep 2025 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208552;
	bh=r5o+CxqA/412fJ3eG2K654Tnc4D5Ezd5ce7Iv9F6Ko0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OxuJHyBhTOSdSdOyE3sNTRJKEkqCOLu3lc+WuNawPNbB1YNa8AUdfN6c0xuRTbn+6
	 z9vDG5mY/1RuI2XwdFpGaaFqvLRldDZoQ63XANTSEkxK4FD2U/sccEEWcX4LA1FeP8
	 mH/jLnVeQvNE6Y4Iu2nsJS2CuijVsYQMUruRoZhXbAa5tXJ17D4E9qR2ZK4Uz9fdGn
	 4sFSJiwBR+i9Ux/fSHZrKhbfyd6eFfbc9LIwixhZnIxzpINPydzoTlCcaSjO6aMAxI
	 Vf/Ldmyda6bwpe4ShtCAoKtmnE1R5KJ4K6rnN5iaWB0J81KP8zLm02bpbfa9ameAAW
	 getsmNBOO3ANg==
Date: Thu, 18 Sep 2025 16:15:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	lars.povlsen@microchip.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr, benjamin.ryzman@canonical.com
Subject: Re: [PATCH 1/2] dt-bindings: reset: microchip: Add LAN969x support
Message-ID: <20250918-truce-muster-d9a1818e7367@spud>
References: <20250917111323.60781-1-robert.marko@sartura.hr>
 <20250917-paparazzi-hermit-3a4aa686add3@spud>
 <CA+HBbNHS9TMd5u_Mysv21=nsqjeEb44oHFj06kS_hxkXZWutnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k2146MXiFzmmP5e7"
Content-Disposition: inline
In-Reply-To: <CA+HBbNHS9TMd5u_Mysv21=nsqjeEb44oHFj06kS_hxkXZWutnw@mail.gmail.com>
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


--k2146MXiFzmmP5e7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 01:45:32PM +0200, Robert Marko wrote:
> On Wed, Sep 17, 2025 at 7:38=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Sep 17, 2025 at 01:12:35PM +0200, Robert Marko wrote:
> > > LAN969x also uses the Microchip reset driver, so document its compati=
ble.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  Documentation/devicetree/bindings/reset/microchip,rst.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/reset/microchip,rst.ya=
ml b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> > > index f2da0693b05a..4d4dd47f830e 100644
> > > --- a/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> > > +++ b/Documentation/devicetree/bindings/reset/microchip,rst.yaml
> > > @@ -23,6 +23,7 @@ properties:
> > >      enum:
> > >        - microchip,sparx5-switch-reset
> > >        - microchip,lan966x-switch-reset
> > > +      - microchip,lan969x-switch-reset
> >
> > Driver patch makes a fallback compatible seem usable.
>=20
> Hi Conor,
> Will respin to simply use the fallback compatible, that will avoid
> adding more compatibles to the driver
> for no reason.
>=20
> But, can I ask what do you think about the
> microchip,lan969x-switch-reset compatible?
> Is lan969x fine or should I just make it lan9691 or like cause the
> whole series uses the same
> reset setup?

I'd rather the 1, I thought that the x was part of the name for some
reason.

--k2146MXiFzmmP5e7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwiIwAKCRB4tDGHoIJi
0g5zAQCnIRGhz+Srw14h0GSHIp6EAXNyzBx+jtrDNbBFA2EzOgEAyf4TNCUklcQO
3ZAB4lss+pXY/yNX2Taf7hhBxiEs2wY=
=XzuA
-----END PGP SIGNATURE-----

--k2146MXiFzmmP5e7--

