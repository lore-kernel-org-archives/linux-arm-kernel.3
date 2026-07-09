Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCciP92ZI0EnoorGeU/orSgjZQNLlRaKdMjI/vAlnK0=; b=emCh5NcbBERVzPpT0qSoksEqpp
	TcPokkFkwIOsx2+pL/xaw17+nDE9pzdU0KM9chEzq+uXej7CFtxJ1zh7mG6BXG2MqC5TQNkGG281Z
	QUSusH0ILiTCReh3I/FRZ8WKoxTodFvSThdqy8SAcE9EI0tOryQPdHRBuZvNN6gM9VSH2akpRnsdk
	d/yaVo3IIcXUi/sqBUqul7wpyNmKIoPFEJcbf4xTKOTIgfKuoTlNI8+gmiD1NDqzbi2uEa76yR5xc
	bteuTdU7ixxgzgnkOvJRhsJ36Wjze58bEgdwgweLtKyOKOVU+CMxiYFScLdzLa3MQ0wUaTswL2u5P
	GnrCnCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsqC-000000039TH-1ded;
	Thu, 09 Jul 2026 17:47:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whsqA-000000039Sk-17LP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:47:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 935CB600C3;
	Thu,  9 Jul 2026 17:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0799C1F000E9;
	Thu,  9 Jul 2026 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619233;
	bh=gCciP92ZI0EnoorGeU/orSgjZQNLlRaKdMjI/vAlnK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U8pqIKhbPDsdoeJpSjcgp87pmkIiG8SLSaM104p7/6Noev0pMwjI52LcII23HEWO1
	 p/CnZobolGGhszhYg0rYZbytwvseUaLPkQz6owhgSknDUNqPSPdgMHoIGgFH5bGQ6a
	 e2pXTexijUyOgmVBxenlQa9KnYrN4acDk2+pffZZ65o040KGZcRXrPWoD4O1koq6bn
	 pj1jfu1y/BZVny4Z/+eOSXKrHLq8jWjHZ6vzmfEZP0PjuYPzpso0W0g9NNz6UIKe7J
	 9ec4gwmG8oipma+65dC9mbfP66Tp9VohRD6gxX8fwFPysJuASgKIQgHH/Rn5Tvusy3
	 FsDMqyk6X17TQ==
Date: Thu, 9 Jul 2026 18:47:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Haoning.CHENG@cn.bosch.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: imx: Document calibration
 offset property
Message-ID: <20260709-send-mashed-bac8c44ead01@spud>
References: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-0-00ff72495e24@cn.bosch.com>
 <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-1-00ff72495e24@cn.bosch.com>
 <ak-5KdXFUldV2eTP@SMW015318>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="esoH4S///u0LPdL7"
Content-Disposition: inline
In-Reply-To: <ak-5KdXFUldV2eTP@SMW015318>
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

--esoH4S///u0LPdL7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 10:07:21AM -0500, Frank Li wrote:
> On Thu, Jul 09, 2026 at 04:10:21PM +0800, HaoNing Cheng via B4 Relay wrot=
e:
> > [You don't often get email from devnull+haoning.cheng.cn.bosch.com@kern=
el.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdent=
ification ]
> >
> > From: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
> >
> > Some boards need a small per-design correction to align the reported CPU
> > temperature with board-level measurements.
> >
> > Document the optional fsl,temp-calibration-offset-millicelsius property,
> > a signed offset in millicelsius that is added to the calculated sensor
> > temperature.
>=20
> why board difference cause such offset, I suppose it is cause by SoC
> variance. The offset may difference if you change to another chip. another
> words, if you have 1000 boards, Is this offset the same?

I think your "in other words" section here is confusing.
You're asking about "1000 boards", which would imply that it is 1000 of
the same design of board. The commit message says that the variance is
between designs. If 1000 of the same design of board have the same offset,
but 2 boards with different designs have different ones then this
property seems fair. Of course, if the variance is determined by the SoC
in use, then this should be deduced from the compatible, but the commit
message seems to be fairly clear about it not being SoC related.

>=20
>=20
> > The property is optional and the existing behaviour is kept
> > when it is omitted.
> >
> > Update the binding example to show its usage.
> >
> > Signed-off-by: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
> > ---
> >  Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml=
 b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> > index 949b154856c5..eb7243a7ebaf 100644
> > --- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> > @@ -59,6 +59,13 @@ properties:
> >    clocks:
> >      maxItems: 1
> >
> > +  fsl,temp-calibration-offset-millicelsius:
> > +    maxItems: 1
>=20
> suppose it int32, why need maxItems here?

  "-millicelsius$":
    $ref: types.yaml#/definitions/int32-array

What's missing are constraints on the max and min I think though.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Frank
>=20
> > +    description:
> > +      A signed calibration offset, in millicelsius, added to the calcu=
lated
> > +      sensor temperature to compensate for board-level measurement
> > +      differences. When absent, no offset is applied.
> > +
> >    "#thermal-sensor-cells":
> >      const: 0
> >
> > @@ -109,6 +116,7 @@ examples:
> >              nvmem-cells =3D <&tempmon_calib>, <&tempmon_temp_grade>;
> >              nvmem-cell-names =3D "calib", "temp_grade";
> >              clocks =3D <&clks IMX6SX_CLK_PLL3_USB_OTG>;
> > +            fsl,temp-calibration-offset-millicelsius =3D <(-6400)>;
> >              #thermal-sensor-cells =3D <0>;
> >          };
> >      };
> >
> > --
> > 2.43.0
> >
> >
> >

--esoH4S///u0LPdL7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/emwAKCRB4tDGHoIJi
0pBqAP9YPAYWXklSPugB1dtOWcQhoSeQTrfQ4C/39Titj+z0xgD+JthpB204U0Pz
+KA/7Y06/va7cFZAdZiJl66l+G+89Qs=
=0JsK
-----END PGP SIGNATURE-----

--esoH4S///u0LPdL7--

