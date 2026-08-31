Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D889C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZirCIc9EB7gtC4ijBO/mp3VXtz/a+lJqEgBTzaSoBGo=; b=z7rsuZSQmZhoczJQLKF0QD1PCI
	67zG58wlEQX2GedeoyeVkIM7sCl+s7+3rmX7Z5l2rIYSC4Rw92F/YG9d/g3xnCzZxxr17hmxJaVwQ
	dKfEbkPhfHSIda9vvWrqTL8ed5WtvWB1/7B7KbTm8wa4b95SZnWtA2O65R6IPmallz9rDHyrJg5ca
	dXKi/7w02VABa9tY3QOl9fMrSyQpZNSmP96XjyAutgrl6pCqlf6QuQs9MJ0kqRrrV3LwLuY88wAIO
	8uzJtdNqKWXkBAvABjnYodUPsUEWZwdIxuCLrDGUt78cu99tKslnCOHu7QHL1p6er4kp317cZ9rcY
	YQ0Nnzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15A9-0000000A6V3-1vPU;
	Mon, 31 Aug 2026 16:47:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15A7-0000000A6Us-2rxo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:47:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDB8C601DE;
	Mon, 31 Aug 2026 16:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7644F1F000E9;
	Mon, 31 Aug 2026 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194830;
	bh=ZirCIc9EB7gtC4ijBO/mp3VXtz/a+lJqEgBTzaSoBGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eOA81gsLbzo0G6Gp7gAbct5ooY0TMVh6T3outXooj1QVXbDFGdeVdLoFdKxSFOYbA
	 +edDxXzPXn6rdIkWDxOgsATtReLQWAQvXgdioNuUkIqAF/v6nwUMJd0/gg76Xvk8cl
	 6y9yiLsDGNi1cLzu0c8TsrXp4ZrRLlKkXHCL+ehmGe3ZKPobQBiu2UQleLzJb4o+Cs
	 UhxNS07lRalE3Tw1c2x6xJzf1sEdL7xNQAGmivKPUIWh1PpWEgsuDl5v4HWMQSvwaL
	 OhX5orc+5pKrEzzZMZz2uHHAZMs05ExxtGGcvUhH0/d0JdQsGR0f4mEZElbULw5pIV
	 8gleQREfAxHOw==
Date: Mon, 31 Aug 2026 17:47:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] dt-bindings: rtc: Add pinctrl for S35390A
Message-ID: <20260831-theorize-unnoticed-1e6ac97d5369@spud>
References: <20260829-rtc_s35390a_int1-v7-0-debcd31143ae@posteo.de>
 <20260829-rtc_s35390a_int1-v7-1-debcd31143ae@posteo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/S+o0lYrnjJZ6O8r"
Content-Disposition: inline
In-Reply-To: <20260829-rtc_s35390a_int1-v7-1-debcd31143ae@posteo.de>
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

--/S+o0lYrnjJZ6O8r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 02:22:56PM +0000, Markus Probst wrote:
> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
>=20
> Move devicetree bindings for sii,s35390a into its own file.
> Add necessary properties to configure the individual pins via pinctrl,
> which allows the interrupt signal 1 to be used for wakeup alarm.
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 111 +++++++++++++++=
++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml       |   3 -
>  2 files changed, 111 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Doc=
umentation/devicetree/bindings/rtc/sii,s35390a.yaml
> new file mode 100644
> index 000000000000..d9da3abbbd51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: S-35390A 2-WIRE REAL-TIME CLOCK
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>

Probably this should be you!

> +
> +description:
> +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with t=
he
> +  very low current consumption in the wide range of operation voltage.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: sii,s35390a
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description: Supports up to 2 interrupt lines via the INT1 and INT2 =
pins.

I think you need interrupt-names here, so that you know which is which?

> +
> +  wakeup-parent: true
> +
> +  wakeup-source: true
> +
> +  "#clock-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^pins":
> +    type: object
> +    patternProperties:
> +      "-pins$":
> +        type: object
> +        properties:
> +          pins:
> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pins
> +            minItems: 1

This construct here seems overly complicated.
You should be able to do
    patternProperties:
      '-pins$':
        type: object
        additionalProperties: false

        allOf:
          - $ref: pincfg-node.yaml#

	properties:
	  pins:
	    minItems: 1

cos the additionalProperties: false you have below will exclude the
parts of pinmux-node you don't want.

pw-bot: changes-requested

Thanks,
Conor.


> +            items:
> +              enum:
> +                - int1
> +                - int2
> +
> +          function:
> +            $ref: /schemas/types.yaml#/definitions/string
> +            description: |
> +              Pin function:
> +              - ignore:  Preserve the previous state.
> +              - disable: Disable pin output.
> +              - wakeup:  Output wakes up the system.
> +              - clock:   Output clock pulse.
> +              - pmin1:   Minute periodical output with 50% duty.
> +              - pmin2:   Minute periodical output L for 7.81 ms.
> +                         Can only be used with pin int1.
> +            enum:
> +              - ignore
> +              - disable
> +              - wakeup
> +              - clock
> +              - pmin1
> +              - pmin2
> +
> +        required:
> +          - pins
> +          - function
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        rtc@30 {
> +            compatible =3D "sii,s35390a";
> +            reg =3D <0x30>;
> +            pinctrl-0 =3D <&rtc_pins_default>;
> +            pinctrl-names =3D "default";
> +
> +            wakeup-parent =3D <&int>;
> +
> +            rtc_pins_default: pins {
> +              int1-pins {
> +                pins =3D "int1";
> +                function =3D "wakeup";
> +              };
> +              int2-pins {
> +                pins =3D "int2";
> +                function =3D "disable";
> +              };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Doc=
umentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index f4d0eed98a08..7b3f682ef4d5 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -81,8 +81,6 @@ properties:
>        - ricoh,rv5c386
>        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
>        - ricoh,rv5c387a
> -      # 2-wire CMOS real-time clock
> -      - sii,s35390a
>        # ST SPEAr Real-time Clock
>        - st,spear600-rtc
>        # VIA/Wondermedia VT8500 Real-time Clock
> @@ -105,5 +103,4 @@ required:
>    - reg
> =20
>  additionalProperties: false
> -
>  ...
>=20
> --=20
> 2.54.0
>=20

--/S+o0lYrnjJZ6O8r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWwCQAKCRB4tDGHoIJi
0jnVAQDHKr3Ggu9GiXbgWCOZibO91GsY120UnN4mo0ZWOJDTeAD9FYsMrH3OyB7A
PVZA6zfOGAPBH+3caffWVRLR213OwQQ=
=4Fr7
-----END PGP SIGNATURE-----

--/S+o0lYrnjJZ6O8r--

