Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24523CA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IT1YkemJVNo91PZ/vHFhpiJIZ6agvmdqx5nDY6WX42Q=; b=1nchJLplNLiQPTpR6chsRv/exE
	8nF+AcF8esm8TPFVLusTtoU8HJvE//AGhjyqUmrJqNkrUdRScUBNCeabjeVfgUDI1+MCM2C31pYKc
	TN0BRZuQL4LutkOAudoYZoJKfSGROlgPlX9Z8zB+baevpw866eMLuLJWzlJ5dvYqcSZEhEKXSe0EE
	6NBt4VdqeAsD97JSLf+pneXYG5oWyqxP3DlI17aKTDtJ96dc1ijVikESVhMI45W4DpbHgtuGcPwUk
	kP2tl8HCQVnC2XZ6FCdik7GP3zAMRQ/XI3nHuq6/c37dpjpczMAT3iwm+Muj7DybHSYqSVvQaDENc
	kpWk7+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0iM-00000009PfC-2WqR;
	Sun, 11 Oct 2026 21:04:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0iL-00000009Pf6-3Xbo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 21:04:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 034FD602A8;
	Sun, 11 Oct 2026 21:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46E61F0089B;
	Sun, 11 Oct 2026 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791752652;
	bh=IT1YkemJVNo91PZ/vHFhpiJIZ6agvmdqx5nDY6WX42Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WKd0gele+RANjoxMl1pzsmiQOrSU26DsT9tqLqZVOfOBX1CIoRkg8+aqmnM8o9t4x
	 yuSKooiYrRqOngIy0u9rTyETk7Tn7B4YqlM4mlS64CuRIg4154IgItYT0n9Xm4rZg9
	 TaSGmpvaRImJvRtLZAV1Rr8d+/Xu4o2Vr48uBY9cSmyXW/VagA353MXVwiMelRe8wF
	 ArVt9Q86gyzq76m5pSbOPuhr+g//4ozLXAGbLlvJ8INo3KKFC8YvVXMNK99FLyKFd9
	 Q6Np+HG6L7E4XAnCptiKklAmZ2qvTTB3EAMIVhVkBdvqXU55haHbr/pru9uL0T9VjI
	 +lAPknUCWaO+w==
Date: Sun, 11 Oct 2026 22:04:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <20261011-expulsion-frivolous-690de090cf9d@spud>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3EvCfSuoZ2pke+6"
Content-Disposition: inline
In-Reply-To: <20261002-prepaid-retired-3d2c9cbc035e@spud>
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

--q3EvCfSuoZ2pke+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >=20
> > Toradex boards route the sideband signals of their 24-pin camera
> > connectors to different GPIO controllers. Camera overlays which name
> > those controllers directly must therefore be duplicated for each host
> > board.
> >=20
> > Describe reset, power-down, detection and power-control as
> > connector-local GPIO functions. This lets an accessory overlay remain
> > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > remain described separately because the GPIO nexus does not abstract
> > them.
> >=20
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++=
++++++++
> >  1 file changed, 81 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera=
-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camer=
a-connector.yaml
> > new file mode 100644
> > index 000000000000..27fee3defde7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connec=
tor.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > +
> > +title: Toradex camera connector GPIO nexus
> > +
> > +maintainers:
> > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > +
> > +description: |
> > +  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC c=
amera
> > +  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO =
signals.
> > +  This binding describes the sideband signals as a GPIO nexus. The oth=
er
> > +  connector resources remain described by the surrounding board device=
 tree.
> > +
> > +  The nexus exposes connector-local GPIO function numbers to camera ov=
erlays
> > +  and maps the functions wired by a carrier board to their GPIO contro=
llers.
> > +  GPIO specifiers contain a function number followed by standard GPIO =
flags.
> > +  A board may omit functions which it does not wire.
> > +
> > +  The function numbers are:
> > +    - 0: Camera reset, connector pin 11
> > +    - 1: Camera power-down, connector pin 22
> > +    - 2: Camera identification, connector pin 23
> > +    - 3: Camera power control, connector pin 24
> > +
> > +properties:
> > +  compatible:
> > +    const: toradex,camera-connector
>=20
> This seems overly generic, but I assume that's what it's actually called
> and if you make a new camera connector the name will be
> "camera connector 2" or something.

Since this came up during last weeks conference, figured I should
clarify that I was commenting on how the generic name, which typically is
something we try to avoid (because it is usually used when someone does
something like "sony,8-megapixel-camera"), was probably actually fine
here. I wasn't looking for a version to be embedded in the string. I
already mentioned this to Ernest after the talk, but mentioning it here
for everyone's benefit..

--q3EvCfSuoZ2pke+6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasv5xAAKCRB4tDGHoIJi
0rp3AQDG2KmW+uhF4maDEpqvD2fEbdFwuOzCqEbgz6CUKjVH/AEAgfi94bnz2cvI
lHwJ8q0M8cKP9yx53nXNKy8NNFOTSwQ=
=kIsF
-----END PGP SIGNATURE-----

--q3EvCfSuoZ2pke+6--

