Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO42XwNP83w3z5CFc+s0wvS8JJ79+rDi2PXVCc38KOM=; b=LU39NLSs1P/bOi9bPk4HMQzNlT
	uRKrnneD60OvyXaKMfbb0TzQ+2KZWGR+nTbJ8c2pciHQdNAsI+4v7FFfsDiHyV/BbiATEyDWfLXe5
	G69kq36ixapTR1rW5kXy3pX9cfT+LadohPu6rAokCIfLsJ6WUBq24g6NYyyYeCjlV0UU13ti7OBTd
	WQaa6EktHup7oC/EcP/0SO7+qEJWFZlfzhM+46kY9Mvu0Kl7XP//1dp9st3kMwLwP94tzEGUvVdSX
	6T+NiB44M/rU7oaTjZ9R9fxBeVNQafYARdtdRmHo7zIuFwUnCw9zgm6G0UN/pLMX1BN7HQeZ1yy8s
	p+E1dVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEKK-00000005IoH-0PZW;
	Fri, 10 Jul 2026 16:43:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEKI-00000005Iny-22HK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:43:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2609418CE;
	Fri, 10 Jul 2026 16:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A902D1F000E9;
	Fri, 10 Jul 2026 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783701825;
	bh=LO42XwNP83w3z5CFc+s0wvS8JJ79+rDi2PXVCc38KOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SJaBmO7tVG7y2hCdLEUg7YkQ2jQBkq+GVDN8ZQwA14XKU17rc/JYBGmTsLG5IL9D8
	 VZpyTOUzDzqfHR3nS5KE0cdIFlYKIXHjg5i+XA7zEOkYiclD5c83ByteDqLWXpRgs8
	 fovLd01f78SO/8ray2y7oRQdXMPVWDsXDPeTtvEi3i/Fl34hhPk2C/YgOE6WCi76Gi
	 Vox3g/oLJNF1t3H+oubRINiCCqp66X4g0Yh64jsa0zOBSdTCePlEOyjqemc4HNNcJo
	 +nAMNas8rTshaxKl+aK+iclCjFEEUfZav18ukel5e314LaMITfxCZW02mf8O+k0W3g
	 u+CN08jyxL7Mw==
Date: Fri, 10 Jul 2026 17:43:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Haoning.CHENG@cn.bosch.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
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
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: imx: Document calibration
 offset property
Message-ID: <20260710-diocese-gentleman-ec8fcff76398@spud>
References: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-0-db9fc2947c55@cn.bosch.com>
 <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-1-db9fc2947c55@cn.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YxTcWEGVuS17YjL2"
Content-Disposition: inline
In-Reply-To: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-1-db9fc2947c55@cn.bosch.com>
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

--YxTcWEGVuS17YjL2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 10:50:40AM +0800, HaoNing Cheng via B4 Relay wrote:
> From: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>
>=20
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements.
>=20
> Document the optional fsl,temp-calibration-offset-millicelsius property,
> a signed offset in millicelsius that is added to the calculated sensor
> temperature. The property is optional and the existing behaviour is kept
> when it is omitted.
>=20
> Update the binding example to show its usage.
>=20
> Signed-off-by: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 10 ++++++++=
++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b=
/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> index 949b154856c5..704bf2fa48cf 100644
> --- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> @@ -59,6 +59,15 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  fsl,temp-calibration-offset-millicelsius:
> +    maxItems: 1
> +    description:
> +      A signed calibration offset, in millicelsius, added to the calcula=
ted
> +      sensor temperature to compensate for board-level measurement
> +      differences. When absent, no offset is applied.
> +    minimum: -28580
> +    maximum: 28580
> +
>    "#thermal-sensor-cells":
>      const: 0
> =20
> @@ -109,6 +118,7 @@ examples:
>              nvmem-cells =3D <&tempmon_calib>, <&tempmon_temp_grade>;
>              nvmem-cell-names =3D "calib", "temp_grade";
>              clocks =3D <&clks IMX6SX_CLK_PLL3_USB_OTG>;
> +            fsl,temp-calibration-offset-millicelsius =3D <(-6400)>;
>              #thermal-sensor-cells =3D <0>;
>          };
>      };
>=20
> --=20
> 2.43.0
>=20
>=20

--YxTcWEGVuS17YjL2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalEhPAAKCRB4tDGHoIJi
0uLeAQDJi0oIsUXiFpOhsENkrPOBOVbkTK9/+jwt4V/Avu8pfgEAlx56YdWYvhF3
9fxQ5FOYGhVzjS0m80NhMCm/S1Z06Ak=
=pItJ
-----END PGP SIGNATURE-----

--YxTcWEGVuS17YjL2--

