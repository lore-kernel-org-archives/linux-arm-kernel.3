Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F4ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZBOxxe9LjsMKrI/zU1/E1LAyNYtyHYJb+/CBUi0jO4=; b=oLmp9STTmzWa8tX7Op/xGCgyNa
	/w723PvKEjNjhYRP9gWZM507Wm+TFNuZ/dFlt7+4bemlzZPir+5ZxlU26MR0QJRXIOR87M7K9lTXh
	A1CEurOS3eidbu9neBgiVs39Ph8+6Aa8gdjp+PFu338gchkWg6xbdebjriVF3C4vK2FSYW9ABs1+l
	OxT+szU4qcl7gCIQuaJ9T1eIrpaD7i3dGBWrmgH01UHEehUgHpqnBWNzrn1FVRhSoq1zVwc3Q0x20
	kUVf5Pjo17jT2UZ3RfMBfswSHqj9IV15P5UPlo43RpBYhFwLleTR6IpXwXEPwS/AL2ZtspvnpMTTs
	sij0xCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugWv-00000005UL9-0YaK;
	Sat, 06 Sep 2025 00:11:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubSb-00000003tbo-1dxV;
	Fri, 05 Sep 2025 18:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JZBOxxe9LjsMKrI/zU1/E1LAyNYtyHYJb+/CBUi0jO4=; b=Dsz8X+Dg1XLm85OZ4O9Ziq6UqF
	gI3/2OnVJMBnj/YGchHntfBoePrdTWvx/GQAqQoNBSzXF6G3Bkb4enSHK3FzeftZF0jKVvr4/E+na
	PNW8nIzMyz9cm9d4RC5wD2Bi09AG8guDjQAT/X4H1RH4iJDRzR53unDWozQG33WCyXTTrU6S7fHhj
	zIFjBBpJBEzZ4zVfWDP5obJPWDSDAaAN47TZAyhfbm4V5e8MoCCRa87Cftv3Ivn3lrLl6fIL3HBEd
	B1+QrDDsplai/9FwjaMpKEwp2XwJP1IBqzRy/J7b642pwDR/6omU0rgt1oXRmcagU+LKzdz8TvLbi
	Hdc+Y1GQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubSY-00000004fiT-0Kni;
	Fri, 05 Sep 2025 18:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E80543D26;
	Fri,  5 Sep 2025 18:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F18C4CEF1;
	Fri,  5 Sep 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757098004;
	bh=c8XeQ8AHKcUAr6EHs6+PRSWtjO1mvJ0xUlTR7B+dyj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuctfBdCL5a7s7Wae/HcmUrDnLIPVkl9jtf37ZUWtzkgxH8ZtSEDJ6betPnlQq6Kn
	 gXK+kRSQcThuJ0hZn7QCHLly79NPRzxb2AkQAgpALXtorYzQq74D7KtFSJ7bJDfHyG
	 z/i1sw7jxDyNrIZzigR/qL4BO/JmCf9dvdQ7qlsgSUyjfg2d1h7g8GELM/Nsx4HGj4
	 /tny3Lkgzqf4d/614ih4nUQzBIL4O2i8Z8MoM1g+vwZX+FU5jZL3J4EYRRib/P/vU3
	 HXlnx9706K1rVcFjIgxZP5wKzaPinHCqMDAhLRBeAl/M9Z0F9qSg81qz3XYUF3nn+P
	 vdryKfMyoSwrw==
Date: Fri, 5 Sep 2025 19:46:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi
 720x1280 v2 binding
Message-ID: <20250905-humble-framing-3d9b786c87a2@spud>
References: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8NT7fW0b+w7vAM07"
Content-Disposition: inline
In-Reply-To: <20250904200036.168222-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_194654_530496_C30F105A 
X-CRM114-Status: GOOD (  26.97  )
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


--8NT7fW0b+w7vAM07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 09:58:26PM +0200, Marek Vasut wrote:
> The 5" and 7" Raspberry Pi 720x1280 Display 2 MCU is a bit more
> complex than the original Display 1 ATTINY88 and the binding is
> also a bit more demanding. Split the binding into separate file
> and fill in required gpio-controller, #gpio-cells and #pwm-cells
> which must be present for the V2 MCU. Include mention of the 5"
> panel in the description of Display 2, as the 5" panel uses the
> same MCU.
>=20
> Fixes: 6d09c6e474bd ("regulator: dt-bindings: rpi-panel: Add regulator fo=
r 7" Raspberry Pi 720x1280")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  ...,7inch-touchscreen-panel-regulator-v2.yaml | 61 +++++++++++++++++++
>  ...ypi,7inch-touchscreen-panel-regulator.yaml |  7 +--
>  2 files changed, 63 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/raspberry=
pi,7inch-touchscreen-panel-regulator-v2.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inc=
h-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/r=
egulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> new file mode 100644
> index 0000000000000..efc7815a136b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator-v2.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscre=
en-panel-regulator-v2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RaspberryPi 5" and 7" display V2 MCU-based regulator/backlight co=
ntroller
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +description: |
> +  The RaspberryPi 5" and 7" display 2 has an MCU-based regulator, PWM
> +  backlight and GPIO controller on the PCB, which is used to turn the
> +  display unit on/off and control the backlight.
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +properties:
> +  compatible:
> +    const: raspberrypi,touchscreen-panel-regulator-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      The first cell is the pin number, and the second cell is used to
> +      specify the gpio polarity (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW).
> +
> +  "#pwm-cells":
> +    const: 3
> +    description: See ../../pwm/pwm.yaml for description of the cell form=
ats.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - "#pwm-cells"
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      gpio@45 {

ngl, seems strange to classify the device as a regulator in directory
and name, but use gpio as the node name in the example.

Otherwise, this seems fine - if you feel that the hardware is
substantively differentially to what's in the "v1" regulator then
keeping them apart is valid.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +        compatible =3D "raspberrypi,touchscreen-panel-regulator-v2";
> +        reg =3D <0x45>;
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        #pwm-cells =3D <3>;
> +      };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inc=
h-touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regu=
lator/raspberrypi,7inch-touchscreen-panel-regulator.yaml
> index 18944d39d08fc..41678400e63fa 100644
> --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touch=
screen-panel-regulator.yaml
> @@ -12,17 +12,14 @@ maintainers:
>  description: |
>    The RaspberryPi 7" display has an ATTINY88-based regulator/backlight
>    controller on the PCB, which is used to turn the display unit on/off
> -  and control the backlight. The V2 supports 5" and 7" panels and also
> -  offers PWM backlight control.
> +  and control the backlight.
> =20
>  allOf:
>    - $ref: regulator.yaml#
> =20
>  properties:
>    compatible:
> -    enum:
> -      - raspberrypi,7inch-touchscreen-panel-regulator
> -      - raspberrypi,touchscreen-panel-regulator-v2
> +    const: raspberrypi,7inch-touchscreen-panel-regulator
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.50.1
>=20

--8NT7fW0b+w7vAM07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLswDwAKCRB4tDGHoIJi
0tzQAPwIq5ZowCj5YDo5tdlwNeaRrtS/3b7s6nLfM0aAapmsgwD+IXNaBK3GbYBL
HkLI14b80zT4kJRYP61NmE5POzpW0gw=
=IvvS
-----END PGP SIGNATURE-----

--8NT7fW0b+w7vAM07--

