Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DCAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofQxIAh6uo77nriH6JFKUEy3Ocq6GWrpqaZ0aFSJAUs=; b=wTOUTkjQ1VJ0FNHgZRtHo/KFVY
	An5Rvb837QOAyP8/t8t+JzWvLozBy4+QLCO9XHRkdx1qiSSjSuykjLa4ZW5vG1fCoftgOb7TPmhax
	AEgbsiP0vUattStbtpC5KyH9x4TTV7qSpFuP0hO2hs1Bavt8jgI6Sp2xqoQ8puEypy3lXVB+0Lndr
	UONqrVbYcsILw/e31JL1sjJmcQ50XxfL4lMx6gJyot96NT0KkP6YlVze2I4dQmhme2VnYIF0lksSp
	0SXB5lHlOW8NDMmniB8QGlQdQUD4fzM+yaTzK78Y08TFewhZeSP5F8PxtJkm8oYg131M4L8DQsYiZ
	p19pIYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqZA-0000000Bb2B-1L7Y;
	Thu, 27 Mar 2025 16:58:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqSj-0000000Ba1R-01D1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00817614AF;
	Thu, 27 Mar 2025 16:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E64C4CEE5;
	Thu, 27 Mar 2025 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743094331;
	bh=Q6l0WxcvGA33qOdr8wp9swxuv9Bj+Qu0ZUvn1W+I7YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uE1ia/7EcYXSQKPYqeHjXJ92g8XJaSXmJKG7Nm5xJg7UTxZu/e1bohqfu/55LCnuN
	 /N/9mSlT4h5YH748aokVV5f7NUQEhCPC3G8wJkIh/IwyoW4L+iZG1/2ivh6+KuQqO6
	 Ows792/CLe26HSPWU1jIqtbMOFUqpFHciMtiwicDVIRrmAYcm8rsKIBNK+ibfnxK1V
	 UeMGkeJa3C0ZhzDKdUH6kECN+KWfGOg1KDsbRjLCNx2RWLMl1x6SIadt/1DvVX2IYR
	 d5YZjc+LYt3GT1scHaCn6HJATCC3B9ECch8wkbmlUv6CTq370urK3SRvKXaKreAzEZ
	 fZuUwdSg0NcrQ==
Date: Thu, 27 Mar 2025 16:52:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matthew.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
Message-ID: <20250327-scribble-boogeyman-22788dda387f@spud>
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
 <20250327-kernel-upstreaming-add_gpio_support-v2-1-bbe51f8d66da@blaize.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KHT+zneIcFZM3R2g"
Content-Disposition: inline
In-Reply-To: <20250327-kernel-upstreaming-add_gpio_support-v2-1-bbe51f8d66da@blaize.com>
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


--KHT+zneIcFZM3R2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 11:27:04AM +0000, Nikolaos Pasaloukos wrote:
> This is a custom silicon GPIO driver provided by VeriSilicon
> Microelectronics. It has 32 input/output ports which can be
> configured as edge or level triggered interrupts. It also provides
> a de-bounce feature.
> This controller is used on the Blaize BLZP1600 SoC.
>=20
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>  .../bindings/gpio/blaize,blzp1600-gpio.yaml        | 77 ++++++++++++++++=
++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8b7842331a22b7b9fbfa42b9c=
711da99227de2e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/blaize,blzp1600-gpio.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/blaize,blzp1600-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Blaize BLZP1600 GPIO controller
> +
> +description:
> +  Blaize BLZP1600 GPIO controller is a design of VeriSilicon APB GPIO v0=
=2E2
> +  IP block. It has 32 ports each of which are intended to be represented
> +  as child noeds with the generic GPIO-controller properties as described
> +  in this binding's file.
> +
> +maintainers:
> +  - Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> +  - James Cowgill <james.cowgill@blaize.com>
> +  - Matt Redfearn <matt.redfearn@blaize.com>
> +  - Neil Jones <neil.jones@blaize.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - blaize,blzp1600-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  ngpios:
> +    default: 32
> +    minimum: 1
> +    maximum: 32
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +dependencies:
> +  interrupt-controller: [ interrupts ]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio: gpio@4c0000 {

Label is unused, please drop it if you respin.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +      compatible =3D "blaize,blzp1600-gpio";
> +      reg =3D <0x004c0000 0x1000>;
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +      ngpios =3D <32>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +      interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +...
>=20
> --=20
> 2.43.0
>=20

--KHT+zneIcFZM3R2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+WCNgAKCRB4tDGHoIJi
0l1GAP432iQj+leyJvycy9SxPrvJzxLLNYJJwPTn6loEoxhTKAD+Jwg9EBUrtu+9
xCJkgglUDVinhTMxrhKB0CyuJghf0Qo=
=QRox
-----END PGP SIGNATURE-----

--KHT+zneIcFZM3R2g--

