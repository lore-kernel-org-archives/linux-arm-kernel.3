Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25F1CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9yR/iQvDBD3fVqX5zNUr7e6YuxSLAfgJx2C9bX9mSA=; b=ONVufhrOBn0uozptZR6NOCSapa
	Q9B+CT1XPPIo4pg0dTd57qIUnRjT1Ukoz8AyHEgOlFuBJZLAUqWIvHEGRDZdFiHNPQnLixXnhJ8kF
	FbJS2exRQ8D85UqHDyqE4umqDM7rN6RSpk9NKyrWhQDRhfuhuqzsnYeuBjvHbEvXX4wZFqcz4SNYK
	fHroNOU80M5gbZZuKqWXrr6Ki2lfAkqkbviDQjNJOk/wEkaaPOlW9IyhEt7gQi26NSuHobbDmzY4E
	9W39EInxYoISY4xjA1Lxrz5346W8dTwfbkY6+JKP12CNzBWO9nwvWtXGhE+dEM0SAWmL391EIqUtu
	FeczfqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgLq-0000000DhDo-1jX7;
	Tue, 13 Oct 2026 17:31:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgLp-0000000DhDN-1Vqe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:31:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E40C602C3;
	Tue, 13 Oct 2026 17:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED681F00893;
	Tue, 13 Oct 2026 17:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912704;
	bh=P9yR/iQvDBD3fVqX5zNUr7e6YuxSLAfgJx2C9bX9mSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RP0AZWagpWx8ooO3zve15EY0NR6XeW6zRpQCg83idaGBKc+gX7vR6qKKLyk+uS6jN
	 Yy7ZXuHwNEz2fjUp9OmlzJ8LJugiSviNiaL0SxxzJ8eXL6yvBihqKK1AHwj+MJMgsr
	 C5ONhehkgTm0Cw+F10gs19lNCT7q+NM4ZEcvufCDajHIOT+ckKsa/sB7Q2YuTsSEIx
	 8fiYDnYMoSCm98ahoETeDjmJDLBYBBl3YLK5x+46iVDZgkSxKg6fd2zGep5uHyfID8
	 fiFmPc0SlkJsI15Ti7wmOrgILq16GCtGZYZqySaqsjkCzovf3970Z4ynbMtNPVTCpy
	 zsDMRta+FQj7g==
Date: Tue, 13 Oct 2026 18:31:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan
 controller
Message-ID: <20261013-footwear-boxer-458afbcff303@spud>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013-stylized-plethora-2a9e27545adb@spud>
 <CA+HBbNHZZePJh6s2xujmjA57GYZTgwhMqBnf0atM9aPQJP77Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GZAyrRYchvfkwe6C"
Content-Disposition: inline
In-Reply-To: <CA+HBbNHZZePJh6s2xujmjA57GYZTgwhMqBnf0atM9aPQJP77Rw@mail.gmail.com>
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

--GZAyrRYchvfkwe6C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 07:08:34PM +0200, Robert Marko wrote:
> On Tue, Oct 13, 2026 at 6:30=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Oct 13, 2026 at 02:56:25PM +0200, Robert Marko wrote:
> > > LAN969x integrates a PWM fan controller with a tachometer input in
> > > addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> > > hardware-monitor compatible and describe the second register region.
> > >
> > > Describe the fan as a child node using a two-cell PWM specifier for t=
he
> > > period and standard polarity flags. The child also carries the option=
al
> > > tachometer pulses-per-revolution and thermal cooling properties.
> > >
> > > Keep the existing microchip,lan9691-temp compatible for device tree A=
BI
> > > compatibility.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  .../bindings/hwmon/microchip,sparx5-temp.yaml | 90 +++++++++++++++++=
+-
> > >  1 file changed, 87 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5=
-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.=
yaml
> > > index 611fcadb1e771..e91c2a3ccd3c9 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.y=
aml
> > > +++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.y=
aml
> > > @@ -4,13 +4,15 @@
> > >  $id: http://devicetree.org/schemas/hwmon/microchip,sparx5-temp.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >
> > > -title: Microchip Sparx5 Temperature Monitor
> > > +title: Microchip Sparx5 Hardware Monitor
> > >
> > >  maintainers:
> > >    - Lars Povlsen <lars.povlsen@microchip.com>
> > >
> > >  description: |
> > > -  Microchip Sparx5 embedded temperature monitor
> > > +  Microchip Sparx5 temperature monitor with a fan controller on LAN9=
69x.
> > > +  The fan child's pwms property references this node to specify the
> > > +  PWM period and polarity.
> > >
> > >  properties:
> > >    compatible:
> > > @@ -18,11 +20,19 @@ properties:
> > >        - const: microchip,sparx5-temp
> > >        - items:
> > >            - enum:
> > > +              - microchip,lan9691-hwmon
> > >                - microchip,lan9691-temp
> > >            - const: microchip,sparx5-temp
> > >
> > >    reg:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  reg-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: temp
> > > +      - const: fan
> > >
> > >    clocks:
> > >      items:
> > > @@ -31,11 +41,67 @@ properties:
> > >    '#thermal-sensor-cells':
> > >      const: 0
> > >
> > > +  '#pwm-cells':
> > > +    const: 2
> > > +    description: |
> > > +      Number of cells in a PWM specifier.
> > > +      - cell 0: PWM period in nanoseconds
> > > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > > +
> > > +  fan:
> > > +    $ref: fan-common.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      cooling-levels:
> > > +        description:
> > > +          PWM duty-cycle values corresponding to thermal cooling sta=
tes.
> > > +        items:
> > > +          maximum: 255
> > > +
> > > +      pulses-per-revolution:
> > > +        minimum: 1
> > > +        maximum: 4
> > > +        default: 2
> > > +
> > > +    required:
> > > +      - pwms
> > > +
> > > +    dependencies:
> > > +      '#cooling-cells':
> > > +        - cooling-levels
> > > +      cooling-levels:
> > > +        - '#cooling-cells'
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > >    - clocks
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: microchip,lan9691-hwmon
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          minItems: 2
> > > +        reg-names:
> > > +          minItems: 2
> > > +      required:
> > > +        - '#pwm-cells'
> > > +        - reg-names
> > > +    else:
> > > +      properties:
> > > +        '#pwm-cells': false
> > > +        fan: false
> > > +        reg:
> > > +          maxItems: 1
> > > +        reg-names:
> > > +          maxItems: 1
> > > +
> > >  additionalProperties: false
> > >
> > >  examples:
> > > @@ -46,3 +112,21 @@ examples:
> > >          #thermal-sensor-cells =3D <0>;
> > >          clocks =3D <&sys_clk>;
> > >      };
> > > +
> > > +  - |
> > > +    #include <dt-bindings/pwm/pwm.h>
> > > +
> > > +    hwmon: hwmon@e2020100 {
> > > +        compatible =3D "microchip,lan9691-hwmon", "microchip,sparx5-=
temp";
> > > +        reg =3D <0xe2020100 0xc>, <0xe2010348 0xc>;
> >
> > Are these actually the same device? These are somewhat disparate
> > register regions - and the second is at a very odd offset.
>=20
> Not really, they can be separately configured and have their own register=
 space.
>=20
> I did not see a point in separate drivers, but we could model these as
> separate DT
> nodes with their individual bindings if that is more appropriate.

Doing that seems more appropriate to me.

--GZAyrRYchvfkwe6C
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas5q+wAKCRB4tDGHoIJi
0gzXAP9jIRVOGR1N1MGiguEHKD2U5b6VJpB8hxA7f8I8m727RQD/SdMGdtxaTCdp
/h5u8x95jfEpATwvdc9htfT3ghTakwo=
=tl+d
-----END PGP SIGNATURE-----

--GZAyrRYchvfkwe6C--

