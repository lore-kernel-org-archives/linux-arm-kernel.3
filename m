Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15340CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwubwH2pqHpYC78BeSsn597sAzYt6di6vYup6OBCGyI=; b=mQ/Y+VTM9DwKWumQueDhYeA1Ka
	/LzcrjJNdasHtNIvIt5MN+lIFCjvXzqJqSEJ1Y0tzHrqYQtu3bQcXpvfq3I6Uc0YKYb7bwWejIujg
	JOmcCUQ9RnKFsTMa3PjQCinuPMQG51d/XOzn6ZzJiw+3PzIiRKFO4B3t2a2R0sO2DHnb5dG75PC8C
	y3Bz+QUlUTwc/19LFJx6bT/JHhtkQuS7wSL4VV2L8u/+PDiI9htDFANXXIHOT7877Kknbbwt9rf8L
	mB7bkWYOiyX96L9J3gEfUAqXzXk2Rk3KLRuMauZCufhCW3AdYDp4YaRlbM/cmDzdBS0RPycGIcy5N
	q/W/zFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9UF-000000043mT-26Jn;
	Wed, 29 Apr 2026 18:18:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9UB-000000043lH-1JAF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 18:18:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3840F4454B;
	Wed, 29 Apr 2026 18:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD5BC2BCB8;
	Wed, 29 Apr 2026 18:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777486690;
	bh=UdSAZ4Ed89EsgnscyKgKTV5jZmvavrICMX4k55nyzeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbfBDsW/nyPye5VIbtgNiO28oc3SZxbKtVn2E3OWdbW/8KVI8GeIONNhieeZ/Z0hy
	 rlkPXrjvjPGCFiouw+FTywdjwyj9DC5DHI9MSwgKGpRNCH71Z4gfLHRdEqkO8g2gqv
	 rNq2ZrIotKFGd2U3KMTEk4auAnD9lH0Tou54X+TnEwUHXkYEAs329PYL4SGFgBepCR
	 2o+A7bgoRIih32zJtE5xIj4gD0fGPr6IfvNH8+SCn1G8F+VJcg+n31KzDtD+Ziej9N
	 gMCLSBlMxWQUvfsz3Wy20FMyFjWRirphFOCzPDs20giCnLZ6aNcuqksYnHX28BR9gX
	 Hv5CBJqO5Kefg==
Date: Wed, 29 Apr 2026 19:18:04 +0100
From: Conor Dooley <conor@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260429-shiftless-docile-e57509e967c4@spud>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O/6ha+tJR4ql1YNr"
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_111811_389506_E115AD56 
X-CRM114-Status: GOOD (  16.00  )
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


--O/6ha+tJR4ql1YNr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>=20
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
>=20
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
>=20
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Why didn't you pick up my tag from here:
https://lore.kernel.org/all/20260407-slang-scoff-795164352c62@spud/

> ---
>  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> index d3f06ebc19fa..8c2548539d7f 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -54,6 +54,12 @@ patternProperties:
>            The fan number used to determine the associated PWM channel.
>          maxItems: 1
> =20
> +      fan-shutdown-percent:
> +        description:
> +          PWM duty cycle in percent applied to the fan during shutdown.
> +        minimum: 0
> +        maximum: 100
> +
>      required:
>        - reg
> =20
> @@ -80,12 +86,14 @@ examples:
>              fan@0 {
>                  reg =3D <0x0>;
>                  pwms =3D <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
> +                fan-shutdown-percent =3D <100>;
>                  #cooling-cells =3D <2>;
>              };
> =20
>              fan@1 {
>                  reg =3D <0x1>;
>                  pwms =3D <&fan_controller 26000 0 1>;
> +                fan-shutdown-percent =3D <50>;
>                  #cooling-cells =3D <2>;
>              };
> =20
> --=20
> 2.34.1
>=20

--O/6ha+tJR4ql1YNr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafJLXAAKCRB4tDGHoIJi
0gavAQCPTKrm8kliUt98l4rMdBj0rVjas+i0gGIqNsxjP1AXLgD/Vp1BZn+P5YxZ
Odh6zOWq9LiWRscCj2gLht0B4n8sWQk=
=7V1K
-----END PGP SIGNATURE-----

--O/6ha+tJR4ql1YNr--

