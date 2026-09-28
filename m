Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACE6CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuEIbSM39AWn3fOJgnOsyJgctCK52FPvPnATEJOiJZY=; b=ym33qinR+RfdeNeSMf49Et7XXc
	qBNRlDV1KCqKSYNuNj44SO+pjhBl6MiPabtmeX2CYcL+Rn0RMM6p+EDBOaYE7KSxymrEsZTs7VSpv
	2i/7kyshbNFzbTo9UHIUAYYF/xcgJMp9VjVFdh0qn5sWnfGSVCBvhlHEYZJ0+7hD4cxSCYb/gR8ZW
	WpeodA9J4rCdWdHdomT5L2HgnVieSPUNre56dl4SEFCWSsXG5kl9tLQ55+4PdpzuJgTGRvZfBUgGu
	4CO3J6KpKS81GX4AZ/FdC3/EwLydPLRDXJX/2bGgXYiCvJ8G1LnhHd8IIp8A7m5QLW37uk4T4EDH7
	a8GPabXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEUv-000000014IV-3GLG;
	Mon, 28 Sep 2026 16:46:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEUu-000000014Hy-2fVd;
	Mon, 28 Sep 2026 16:46:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 126BE42DA5;
	Mon, 28 Sep 2026 16:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE241F000FF;
	Mon, 28 Sep 2026 16:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613996;
	bh=OuEIbSM39AWn3fOJgnOsyJgctCK52FPvPnATEJOiJZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kibERWQ7ya9eZx0yUmrvPFr3QcQrB8256DiRNHXVkXTRCfmO19BrG9dEIT1hDSB9h
	 X5bg0EOKOKoUm4Xx6tKtvs26iwkwQAlOWopPMVo9umQD8b5zTM/FY5etd+owpxmsUv
	 TYZleYU1VKWaoaIYGSxS5LFTuOGZp+XSkKdgqahN3OWPawEPhTeVsFrs7EVc7ypfG/
	 LZVxQJ4RbOva4eI6JOT/I6JiT6A4AlEvG0F9swMlOSveamz86iaLZ+bbaBc6liJYZv
	 lrSSeOFTXjZ/0MsFjtdhhld0V6+IXCprrfZsKc55brla+vOnI91aKphTua0zlT6/Mk
	 84MKCsRWNmRQg==
Date: Mon, 28 Sep 2026 17:46:31 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
Message-ID: <20260928-cardiac-relax-cdccdecdd4c2@spud>
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NO7UUlGWjKuFSfWY"
Content-Disposition: inline
In-Reply-To: <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
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

--NO7UUlGWjKuFSfWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 04:28:15PM +0200, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> The T7, A1, C3, and S4 PWM controllers have a system clock in
> addition to the two input clocks of channels A and B.
>=20
> The channel clocks are acquired by index in the pwm driver,
> where the core clock is fetched by name, with optional get
> which is silent when not provided.
>=20
> Require clock-names and minimum 3 items for S4, and devices
> which fallback to S4, where the PWM devices do not work
> without all 3 clocks.
>=20
> Add an example showing T7 usage with its fallback to
> amlogic,meson-s4-pwm.
>=20
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml        | 21 +++++++++++++++=
+++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Doc=
umentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index c337d85da40f1..e9cd5f1fdf264 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -62,7 +62,7 @@ properties:
> =20
>    clock-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
> =20
>    power-domains:
>      maxItems: 1
> @@ -143,9 +143,15 @@ allOf:
>            items:
>              - description: input clock of PWM channel A
>              - description: input clock of PWM channel B
> -        clock-names: false
> +            - description: gate clock for the PWM controller
> +        clock-names:
> +          items:
> +            - const: channel-a
> +            - const: channel-b
> +            - const: core
>        required:
>          - clocks
> +        - clock-names
> =20
>    - if:
>        properties:
> @@ -179,6 +185,15 @@ examples:
>      pwm@1000 {
>        compatible =3D "amlogic,meson-s4-pwm";
>        reg =3D <0x1000 0x10>;
> -      clocks =3D <&pwm_src_a>, <&pwm_src_b>;
> +      clocks =3D <&pwm_src_a>, <&pwm_src_b>, <&pwm_src_core>;
> +      clock-names =3D "channel-a", "channel-b", "core";
> +      #pwm-cells =3D <3>;
> +    };
> +  - |
> +    pwm@60000 {

If you respin, drop the second example please, since it doesn't actually
do anything different anymore.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +      compatible =3D "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
> +      reg =3D <0x60000 0x24>;
> +      clocks =3D <&channel_a>, <&channel_b>, <&core>;
> +      clock-names =3D "channel-a", "channel-b", "core";
>        #pwm-cells =3D <3>;
>      };
>=20
> --=20
> 2.49.0
>=20
>=20

--NO7UUlGWjKuFSfWY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqZ5wAKCRB4tDGHoIJi
0ok+APwNheWAYEM9WF+sBQYkU6EVCY1bbe9VWk1PlHlrguTn7QD/byNsbcsFBPVx
UFNlan7GYFGIaWMoGbPggPiiF1g1jwk=
=Zdvc
-----END PGP SIGNATURE-----

--NO7UUlGWjKuFSfWY--

