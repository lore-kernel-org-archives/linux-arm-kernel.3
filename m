Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4F3106ACCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhJ24D6jd/KTQlwuWSfHWg5gzm1rQdjuNZ8XcmdrwKM=; b=NqJMVktc2rb1T6YKjs4DaBF6Ui
	U4FOQUlgmdRf8D6pAPS8hdTFluAfrg3DqSDx7sBbVg/JmlBI0AKB2CZh3uqWhuALtfyIg9XVegoVl
	xO6RqIWR9owTcLnWIi8Hyh91t8ml25bYlITd08MnJ85POMK76t6fryuQ44/f/wJSp+F2bQcA+YFcV
	Z+o6a6u8uQw8nCBD+WXgIXZTS0fRt0o3zZ610I4TErjSvt26QKfo50muhT6AykDgBwWV0FVynWGju
	KkI48FkstV/RYYJsYyKlCGMbbTPCfWL2T25ibvzl0gtQu28ShIYwPrr0YqNCkoRJaZLSBCdlLXhfp
	g8hxagWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jyz-0000000EkCI-40fV;
	Thu, 12 Mar 2026 17:38:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jyv-0000000EkBG-2Llm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DACB04383A;
	Thu, 12 Mar 2026 17:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1704C4CEF7;
	Thu, 12 Mar 2026 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337076;
	bh=aFQX/mwVXIQpPQX7qxE0nuMOaK4qcK/SeR4LGJuFsa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ff4qP7P0InVUnBUhM3Vtq96wZ0ILUUgkGrxZYHaddnDcFs6PP+8gyhTAdIIQHPk2Y
	 bOfSGdMdcc2cBbuQ1gxKzvzr5buWAShjm7rNFD+OvKTMrfvtiTh58eoQjFMc6UksGQ
	 6zzbiroo7h6rEQLex6MVQrAvRvw10XGGSbYCdRFNCe5ixJdrzrfagC7rKEuIvs9Umd
	 g/k72i7MWJ+/ClO8ORAOF7wiAw9nYo+oC9RiMeYljmAL/vq+NvPZzSSyBDxHdAFgKE
	 l31FhuKTIMQ1Yw6UGKNFZfHhTNYdEkMlfRmpiagxyWcWqUt28APqTDRU5v/lENzIFo
	 se6GtOW65l5aQ==
Date: Thu, 12 Mar 2026 17:37:51 +0000
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
Subject: Re: [RFC PATCH v2 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260312-triage-shallot-1b3d9f07d250@spud>
References: <20260312122248.1281572-1-florin.leotescu@oss.nxp.com>
 <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oDbvumbCQdRDhubR"
Content-Disposition: inline
In-Reply-To: <20260312122248.1281572-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_103757_637200_1CA3B938 
X-CRM114-Status: GOOD (  16.32  )
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


--oDbvumbCQdRDhubR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 02:22:47PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>=20
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
>=20
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the shutdown fan speed to be configured per fan output.
>=20
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> index d3f06ebc19fa..7bcadfab9fc4 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -54,6 +54,12 @@ patternProperties:
>            The fan number used to determine the associated PWM channel.
>          maxItems: 1
> =20
> +      fan-shutdown-percent:
> +        description:
> +          Fan RPM in percent set during shutdown.

This sounds like something generic, that other devices might need and
should be in fan-common.yaml?

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

--oDbvumbCQdRDhubR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL57wAKCRB4tDGHoIJi
0noHAP9z/fCiq8hV4ZCCK6xJrtd6hvHbeRv80Hgr1bMapjuwoAD/QTtp9v/Ab3J9
3q1keEgHBJviuIq0kTxW0wHKYbkL+g0=
=Y6RW
-----END PGP SIGNATURE-----

--oDbvumbCQdRDhubR--

