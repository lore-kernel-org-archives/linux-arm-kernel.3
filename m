Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CEFE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCJ3Q4RDEDFkanPcBFMdGzIMPSBaGTsI4AxLsGenTuo=; b=mgKxVr4ODMRfJWs6HhQS2afxpu
	dII7b5pPVokEZxIrQhY6ostcSGMscEzO3fACPOwFzrmCrjzPYmdIVFUhx4Xea7CjHn4Gzfg+7OVV/
	qTIJBrKT1qlN95P3o0Ziy91zsGJ/y7AWH4uypmaTWBDa1tGH1+NadHGrCBFYau6LiRqf8rXnrgcK5
	ReluLY1eouRZ6AS4Rfw2Ro7tM3sKADq6VaY2O6Gfg0gCHBNi2rn6ATe7x7Ba+8QMhgT8mwoJOL8XQ
	D+RG9f/M1j6L3S3jvpqJ8EKVBn+EVYzwJ9Bybz5nc7gE61+k7R+McjR0R5pFijnMKXbqAszFlph7Y
	Y+Ix4M+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMdB-00000002uv5-0L5D;
	Thu, 19 Dec 2024 19:56:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMWu-00000002tqM-3wIu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72E115C68F3;
	Thu, 19 Dec 2024 19:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D7AC4CECE;
	Thu, 19 Dec 2024 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637792;
	bh=rGOvvqg02/2Kcbo+slRA09ppaoCh2Sdscv53DQPXwwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNoPFuaissLylLW6vl6ENQR11UJB32vS4pGe0DTWHhbfAVBov3DWOJsuyXWkZelOS
	 pwfPu7gX9wTE3VG6afRok5aMPh8fl2+kue6Y7MWSn8TFrSXRCMxHI9HL9FlbVuBbn9
	 GlcWNB00kAzw0WozKoRiLJfZ/UvcB1LjyDQbz3zWQlxbwzLJAsavKVPmnXVDf6Vp1O
	 n3fOWLMTn4H01vq1NdMltXKWdEsWV2h8t9dC3Htqv+TljtHKKHLFDco42BMBgIwboj
	 Wp+K1yH5BnL/3GWXnMTLd986iCZ/UHVIIk+Z793S9XuPKtEm8qv6itBSH8Rkcg6PKE
	 ETaU6H0R51U5g==
Date: Thu, 19 Dec 2024 19:49:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <20241219-lash-lather-31443ced0e0c@spud>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ngXsONZmUzjSKy68"
Content-Disposition: inline
In-Reply-To: <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114953_061142_A81DF332 
X-CRM114-Status: GOOD (  19.98  )
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


--ngXsONZmUzjSKy68
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 08:27:32AM +0100, Ahmad Fatoum wrote:
> The imx8m-clock.yaml binding covers the clock controller inside all
> of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
> support two operating modes: nominal and overdrive mode.

This implies that only the two modes you mention are possible, but you
leave the option open to a dts author to use either. How come?

Makes it seem like we only need one of these, for whatever the
non-default option is?

>=20
> While the overdrive mode allows for higher frequencies for many IPs,
> the nominal mode needs a lower SoC voltage, thereby reducing
> heat generation and power usage.
>=20
> In any case, software should respect the maximum clock rate limits
> described in the datasheet for each of the two operating modes.
>=20
> To allow device tree consumers to enforce these limits, document two new
> optional properties that can be used to sanity check the clock tree.
>=20
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 ++++++++++=
++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/D=
ocumentation/devicetree/bindings/clock/imx8m-clock.yaml
> index c643d4a81478..a6ae5257ef53 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,6 +43,14 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx=
8m-clock.h
>        for the full list of i.MX8M clock IDs.
> =20
> +  fsl,nominal-mode:
> +    description: Set if SoC is operated in nominal mode
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  fsl,overdrive-mode:
> +    description: Set if SoC is operated in overdrive mode
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
>  required:
>    - compatible
>    - reg
> @@ -95,6 +103,12 @@ allOf:
>              - const: clk_ext2
>              - const: clk_ext3
>              - const: clk_ext4
> +  - if:
> +      required:
> +        - fsl,overdrive-mode
> +    then:
> +      properties:
> +        fsl,nominal-mode: false
> =20
>  additionalProperties: false
> =20
>=20
> --=20
> 2.39.5
>=20

--ngXsONZmUzjSKy68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2R42gAKCRB4tDGHoIJi
0vi0AQDyo0dpjmecgbYGZWFjWTgwStcmLQ4GGpLpOk50s+I6rgEAhLl57IPin5RD
Msn0CDRtkfOYmjJkFXiEEwgZVTCHvgo=
=JUib
-----END PGP SIGNATURE-----

--ngXsONZmUzjSKy68--

