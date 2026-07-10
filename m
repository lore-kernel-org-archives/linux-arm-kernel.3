Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D8C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/0P6CjkFCqMXZpshxscC8fggHEtFDHkHgmueIFeARI=; b=XCTxFKqnBgBTPsFTHyd7af+hY9
	EcjwrWQ/o/ZTIxpiRl5xCpGmk95N17/MN5x3cKVmT3duhSlXE7vGZHZzvij1klmyWSfC1OU096F1V
	9v9r5DWNcUtU+G2fum3kbnYd4hFBtx9j0jNjyJXwPKN4jl6ZpZ8soN4O/UB9kQebF6fZhFbsEZ+2p
	Sk8nrqJ3mnLDmwHXefhPjraGPtZQ2zMYYAqERnJm+yPW5KJgklIg5lyYdzpowbYbooetfSOaGZekd
	E/atlsWdk7GpiQjh0ak2M0lS+qMcnXVewPYfBbFfg/tMungVTg3y+rviYAoyKnoBASmqDfWCFG/bn
	LazpcMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8WC-00000004iSc-30zg;
	Fri, 10 Jul 2026 10:31:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8WB-00000004iSP-10Zm;
	Fri, 10 Jul 2026 10:31:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id CA0174041E;
	Fri, 10 Jul 2026 10:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 305191F000E9;
	Fri, 10 Jul 2026 10:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679498;
	bh=B/0P6CjkFCqMXZpshxscC8fggHEtFDHkHgmueIFeARI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XrlteZyITiTdyCYT+QTMlv7oyxY4ow9O28q/YRWuSlvBnyi7poznDF/ThmSDZxxPB
	 w7veUv+18dltW9ecVdH1DQr9bE11YUPBPax5UthbczOYmgPmKccMut/QTjUQW7QTDK
	 oR0vbTQ3gtR2Sy4a/foGnQ+nHBkLHBYF5y6vF1wylkAEvRTd8ylBdhYjqRJf5clxM6
	 /ONYaZLt60BANJFnZ3KojsppG1VDEgJZm52ITUsC0PLcRxtB/T5/8KvzUgcd5HsQWS
	 Xd7MiWxZcvUluTvvQX5tKQTf72vMRMDUywzXzF38BUVRZ4LH2OH68tpVk6MNiznIIT
	 BHkOg3CcE8Hvg==
Date: Fri, 10 Jul 2026 12:31:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Damon Ding <damon.ding@rock-chips.com>, kernel@collabora.com, 
	Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@gmail.com>, 
	linux-rockchip@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: pwm: Add a new binding for
 rockchip,rk3576-pwm
Message-ID: <alCvmLX1ke0qjh99@monoceros>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-1-ae7cfbbe5427@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mnh6xjyjg3d65ymy"
Content-Disposition: inline
In-Reply-To: <20260420-rk3576-pwm-v5-1-ae7cfbbe5427@collabora.com>
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


--mnh6xjyjg3d65ymy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/6] dt-bindings: pwm: Add a new binding for
 rockchip,rk3576-pwm
MIME-Version: 1.0

Hello,

On Mon, Apr 20, 2026 at 03:52:38PM +0200, Nicolas Frattaroli wrote:
> The Rockchip RK3576 SoC has a newer PWM controller IP revision than
> previous Rockchip SoCs. This IP, called "PWMv4" by Rockchip, introduces
> several new features, and consequently differs in its bindings.
>=20
> Instead of expanding the ever-growing rockchip-pwm binding that already
> has an if-condition, add an entirely new binding to handle this.
>=20
> There are two additional clocks, "osc" and "rc". These are available for
> every PWM instance, and the PWM hardware can switch between the "pwm",
> "osc" and "rc" clock at runtime.
>=20
> The PWM controller also comes with an interrupt now. This interrupt is
> used to signal various conditions.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/pwm/rockchip,rk3576-pwm.yaml          | 77 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
> new file mode 100644
> index 000000000000..48d5055c8b06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/rockchip,rk3576-pwm.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/rockchip,rk3576-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip PWMv4 controller
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +description: |
> +  The Rockchip PWMv4 controller is a PWM controller found on several Roc=
kchip
> +  SoCs, such as the RK3576.
> +
> +  It supports both generating and capturing PWM signals.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: rockchip,rk3576-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Used to derive the PWM signal.
> +      - description: Used as the APB bus clock.
> +      - description: Used as an alternative to derive the PWM signal.
> +      - description: Used as another alternative to derive the PWM signa=
l.
> +
> +  clock-names:
> +    items:
> +      - const: pwm
> +      - const: pclk
> +      - const: osc
> +      - const: rc
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts

pwm.yaml has:

	required:
	  - "#pwm-cells"

Still Sashiko[1] claims:

	The binding defines #pwm-cells under properties, but omitting it from the
	required list allows device tree nodes missing the property to pass schema
	validation.

I played a bit around with dt-validate and I think Sashiko is wrong here
and pwm.yaml's requirement isn't overridden by the local required list.

So this patch should be fine.

Best regards
Uwe

[1] https://sashiko.dev/#/patchset/20260420-rk3576-pwm-v5-0-ae7cfbbe5427%40=
collabora.com

--mnh6xjyjg3d65ymy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQygUACgkQj4D7WH0S
/k530Qf/Yrgd15Oua0wX8H9DeijzIE3bpRLuqNvVEsc2me0Ww9zPov4iHylUuu1a
RubtMDQyyXRuiGSqbcmeNV8lWGFbd/moOm1pw/KXnkvtIuBd2S3tIlTC2qCKRwpF
MVE2yBKSN1h4IAZ88/ei1M2RCCTX6WQ13Tp3cvt1MEx9+y06qLmjgkrBixr/mPMq
JZYYzZh//1spbCmc6clKnfshjrRB1iDOQiS1VeTZgCv/bcNgYxIRDov/BJZzLnRZ
GYYcl6tFqfbJ8UA7sn7s9I6q6/1ZlHwjK7e7/DWPeyPgD7ncpJHr7a91ajTCtZmC
lnC4jZZBJcY1/1UCHZTUCTXDhQRwhQ==
=FvaV
-----END PGP SIGNATURE-----

--mnh6xjyjg3d65ymy--

