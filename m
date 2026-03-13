Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16173107BCE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeosVCWFM5PbBDLTlXN56FK5Cug85EkhWmxzg+O20oo=; b=43oEV8eHNA5aFxubqSp0L8LE8w
	eJXvF+aU1uSDGyAet2kSQ5AQonjUvZU4Gh6VWlt4jWopOROOF+TuHPnNp1g6dYInt4WLEj9NqTlEE
	ErJy4RyQyplnU7/LYujAL6B75FsDTT10k0kMiCkyjy7qJB7C61wbeY6kyrgKer19ZnPZKkmoDKx5O
	zBx7tZEAonUOhynSl56GivOntJ6FdVV7iZc4iGeWOjC3JPiezsgyeA5oUncSEbjiEgTMCsmYejqoj
	vULTBRZbuLft+LlicpdAQwz1DAKuCcp3jw2uantKwSkD+4w+eYw/pN9uYjZBovGc3m6Yj8JPWPvkR
	l9qOWJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19XV-00000001BrU-1nGm;
	Fri, 13 Mar 2026 20:55:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19XT-00000001Br8-0Wk8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 20:55:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F043D44475;
	Fri, 13 Mar 2026 20:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05240C19423;
	Fri, 13 Mar 2026 20:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773435317;
	bh=FRgbhMTwDoCjlSgH+Mbeik4GJjhM/BNxYxIy4SLYB14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VpVS97O7qvNeJqVE6E+LF3HR3DzzLy6d7TeMzjaxDwI4tCcgF7b+ZmRn67JL8AyS8
	 2BFOBUU6qFiU6mdlOyQcjwY1ISGkDA7JLWrcTlv1DLwNcAw/J8Iy1Wdv2aBuIOpLU9
	 5K2Jjl1wvCmQOu3v8s3Y0wSJIvb3wkDeIeFvRwpkozNtDQEjldO8yy8u0qwktH3Ex7
	 HvryAbVFI2ww5o2ORJILsR4WZMZ0P+wsJk/jnOk9o5F2lg0kugt2WZ3b3O3D1/d5Ic
	 McDw/M1PT9CWlINI8xt/f9OvWQT0JpP2har10PypIPGWTRiNoRj+bIjKryYKMGsBI1
	 yaO6MqoIU/PPg==
Date: Fri, 13 Mar 2026 20:55:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Florin Leotescu <florin.leotescu@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260313-jurist-atrophy-e145686d3145@spud>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
 <20260312-triage-shallot-1b3d9f07d250@spud>
 <abRF+TPKuXFDJc55@ro-kernel-workstation>
 <20260313-mulberry-glamorous-6afbfc52e42f@spud>
 <cbc1d09e-25b1-4b94-a59c-6b5e54af01f9@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s1dtOtEOTAf4qsN4"
Content-Disposition: inline
In-Reply-To: <cbc1d09e-25b1-4b94-a59c-6b5e54af01f9@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_135519_233047_097F7C39 
X-CRM114-Status: GOOD (  40.70  )
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


--s1dtOtEOTAf4qsN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 11:12:26AM -0700, Guenter Roeck wrote:
> On 3/13/26 10:38, Conor Dooley wrote:
> > On Fri, Mar 13, 2026 at 07:14:33PM +0200, Florin Leotescu wrote:
> > > On Thu, Mar 12, 2026 at 05:37:51PM +0000, Conor Dooley wrote:
> > > > On Thu, Mar 12, 2026 at 02:22:47PM +0200, florin.leotescu@oss.nxp.c=
om wrote:
> > > > > From: Florin Leotescu <florin.leotescu@nxp.com>
> > > > >=20
> > > > > The EMC2305 fan controller supports multiple independent PWM fan
> > > > > outputs. Some systems require fans to enter a defined safe state
> > > > > during system shutdown or reboot handoff, until firmware or the n=
ext
> > > > > boot stage reconfigures the controller.
> > > > >=20
> > > > > Add an optional "fan-shutdown-percent" property to fan child nodes
> > > > > allowing the shutdown fan speed to be configured per fan output.
> > > > >=20
> > > > > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> > > > > ---
> > > > >   .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 +=
+++++++
> > > > >   1 file changed, 8 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,em=
c2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > > > > index d3f06ebc19fa..7bcadfab9fc4 100644
> > > > > --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.y=
aml
> > > > > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.y=
aml
> > > > > @@ -54,6 +54,12 @@ patternProperties:
> > > > >             The fan number used to determine the associated PWM c=
hannel.
> > > > >           maxItems: 1
> > > > > +      fan-shutdown-percent:
> > > > > +        description:
> > > > > +          Fan RPM in percent set during shutdown.
> > > >=20
> > > > This sounds like something generic, that other devices might need a=
nd
> > > > should be in fan-common.yaml?
> > > >=20
> > > Thanks for the feedback.
> > >=20
> > > The property name was reused from pwm-fan.yaml where it already exists
> > > with the same meaning. I kept it local to minimize the scope of the c=
hange.
> > >=20
> > > However, if you prefer it to be modelled as a common property, I can =
adjust it in the next revision.
> >=20
> > I see. Makes me wonder why half the properties in pwm-fan aren't also in
> > fan-common.
> >=20
> > I suppose there's a reason for it, carry on I guess.. Can be lifted if
> > there are more users other than you and pwm-fan.
> >=20
> > > > > +        minimum: 0
> > > > > +        maximum: 100
> > > > > +
> > > > >       required:
> > > > >         - reg
> > > > > @@ -80,12 +86,14 @@ examples:
> > > > >               fan@0 {
> > > > >                   reg =3D <0x0>;
> > > > >                   pwms =3D <&fan_controller 26000 PWM_POLARITY_IN=
VERTED 1>;
> > > > > +                fan-shutdown-percent =3D <100>;
> >=20
> > Also leads to the question of why these devices aren't pwm-fans. Too
> > late now to change anything, I just wanna understand why.
> >=20
>=20
> They are dedicated fan controllers, with an internal tach -> pwm feedback
> loop. I don't mind modeling them as pwm controllers if there is a use case
> (such as someone using a PWM output to control a LED), but I don't even k=
now
> how modeling them as pwm fans using the pwm-fan compatible would even be
> possible since that would exclude the tach -> pwm feedback loop.
>=20
> Also, if that were to be done, we might end up with two hwmon drivers
> for one chip: one to report the fan speed, and one to report pwm values.
> On top of that, even if it is not currently supported by the driver,
> controlling the tach -> pwm feedback loop would become awkward.
>=20
> Yes, I understand, there is a strong push to model everything with
> a pwm output as pwm controller, but si far no one was able to describe
> to me how to model a fan controller, and especially its feedback loop,
> in such a scenario. That becomes even more complicated if temperatures
> are used to control the feedback loop.

FWIW, my wording choice was poor here. I said that it was too late to
change anything in an attempt to convey that I didn't want it to be
changed, but it came across as implying that it was wrong.
I just wanted to know why it was the way it was, not change it.

Thanks for the info you provided, that's useful.

--s1dtOtEOTAf4qsN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabR5sAAKCRB4tDGHoIJi
0hLqAP98tyg8o9VYgPVmjo979r729SYNjRFyycZPK3tbgPbguAEAo0lOn/tMvvNT
mNnoXkl58KlVWyGYBX29eQ8cp7taUQQ=
=NOEP
-----END PGP SIGNATURE-----

--s1dtOtEOTAf4qsN4--

