Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF7FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34mKcnYG3l4eTjM+8SIu4khpPgGPlig8uP/Rl4YzVG0=; b=p/d2P7YixkmUdLYvUqvYsKj56l
	jOtP0VzaGhfGfN0jAIF+xKc8LBEFbNpG+VWfBG7uEXVlDvbmwb3TZA73vkCXp7nyWZE/X3L+4Ub4D
	NKzlE2CSDTwDm/4gG0PwMbe4AnJB5GlqJdLg/zm+6cGNnHTVuRkV/She3VG2mXN1ZeXgV98+CTQVS
	EhC4WcQ7EZAe27fjNxnzmS0QdLn6na304k3Zo/jJ1Va2K84Qq+GblNPjPS8b04Fdv4xpFwBXuq8Wc
	6WwzWCKAih4Dxipda8GBnZcxRraT1Aedx2WZDZV03BreLsgYOoXfx7ra+ST11RmtRjin9wjX58wrS
	Uhn+t7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQSGh-0000000Dvlc-1U6N;
	Wed, 25 Dec 2024 14:21:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQSFV-0000000Dvd6-1mDw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 14:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96942A40404;
	Wed, 25 Dec 2024 14:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FABC4CECD;
	Wed, 25 Dec 2024 14:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735136432;
	bh=UgQVZjB1pmffoGVrWrpjv7ck7OetayH/qC7/X1DRQMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+JeCAvLMaNI8JrFYoFuro5tKwLF+o3ItGz5d/FRNm+WAvtky/4qVqqe1xjRKHqHf
	 78c1Wt4MRTsoyBqoKv3hvaPSF8oZBAB3+1azgFdRL55x+F37tE0HfQs6Fz0xbwIeH8
	 gGgdwQHNKB0cTr5Z0a2oCLngmnCQ3T4cQWhiN0D5RCKf8PripojoIiRf4H2h1zewBW
	 83NCSB+kaWSEdchLk+FP3Lq6hBagMR96/2srtyLuWf87GNYMgSHYnDvCGTz+WKDruX
	 djnCmdb74XqyhH4C/dEGLxR7OLkLYwlNzsAR+PAqdd6J3fm0L3nmGwuNrTJbTzAaqQ
	 EjSmGBhyJVXxQ==
Date: Wed, 25 Dec 2024 14:20:26 +0000
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
Message-ID: <20241225-untapped-flyover-47254d06d418@spud>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
 <20241219-lash-lather-31443ced0e0c@spud>
 <4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="24USIZEjsi+7fMqF"
Content-Disposition: inline
In-Reply-To: <4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_062033_608150_7B62DD56 
X-CRM114-Status: GOOD (  39.77  )
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


--24USIZEjsi+7fMqF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 09:14:10PM +0100, Ahmad Fatoum wrote:
> Hello Conor,
>=20
> On 19.12.24 20:49, Conor Dooley wrote:
> > On Thu, Dec 19, 2024 at 08:27:32AM +0100, Ahmad Fatoum wrote:
> >> The imx8m-clock.yaml binding covers the clock controller inside all
> >> of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
> >> support two operating modes: nominal and overdrive mode.
> >=20
> > This implies that only the two modes you mention are possible, but you
> > leave the option open to a dts author to use either. How come?
> >=20
> > Makes it seem like we only need one of these, for whatever the
> > non-default option is?
>=20
> There is no real default. The mode is configured implicitly by the
> bootloader setting VDD_SOC and then kernel needs to adhere to the
> limits that imposes.
>=20
> For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
> that are all achievable in nominal mode. For i.MX8MP, there are some
> rates only validated for overdrive mode.
>=20
> But even for the i.MX8M Mini/Nano boards, we don't know what rates they
> may configure at runtime, so it's not possible to infer from just the
> device tree what the mode is, which is why I need to allow for absence
> of either property. I can make it a single property with two possible
> values though if that's preferable.
>=20
> Theoretically, we could infer mode at runtime from VDD_SOC voltage,
> but we need to set up clocks to read out the PMIC and I want to
> apply the constraints as early as possible as I don't want the SoC
> to run outside of spec even for a short while.

Apologies for the delay responding to you, doing it today cos I feel
guilty! I think what you've explained here is fine, but could you add a
bit more of that info to the commit message, explaining why one cannot
be default? With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Thanks,
> Ahmad
>=20
> >=20
> >>
> >> While the overdrive mode allows for higher frequencies for many IPs,
> >> the nominal mode needs a lower SoC voltage, thereby reducing
> >> heat generation and power usage.
> >>
> >> In any case, software should respect the maximum clock rate limits
> >> described in the datasheet for each of the two operating modes.
> >>
> >> To allow device tree consumers to enforce these limits, document two n=
ew
> >> optional properties that can be used to sanity check the clock tree.
> >>
> >> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> ---
> >>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 +++++++=
+++++++
> >>  1 file changed, 14 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml =
b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> >> index c643d4a81478..a6ae5257ef53 100644
> >> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> >> @@ -43,6 +43,14 @@ properties:
> >>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/=
imx8m-clock.h
> >>        for the full list of i.MX8M clock IDs.
> >> =20
> >> +  fsl,nominal-mode:
> >> +    description: Set if SoC is operated in nominal mode
> >> +    $ref: /schemas/types.yaml#/definitions/flag
> >> +
> >> +  fsl,overdrive-mode:
> >> +    description: Set if SoC is operated in overdrive mode
> >> +    $ref: /schemas/types.yaml#/definitions/flag
> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >> @@ -95,6 +103,12 @@ allOf:
> >>              - const: clk_ext2
> >>              - const: clk_ext3
> >>              - const: clk_ext4
> >> +  - if:
> >> +      required:
> >> +        - fsl,overdrive-mode
> >> +    then:
> >> +      properties:
> >> +        fsl,nominal-mode: false
> >> =20
> >>  additionalProperties: false
> >> =20
> >>
> >> --=20
> >> 2.39.5
> >>
>=20
>=20
> --=20
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--24USIZEjsi+7fMqF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2wUqgAKCRB4tDGHoIJi
0hbzAQC65sEK2UR7g/h59lMD//eMqtEkiciZ/1hCYAlQJ3x5gwD/T+rnKe1r/9c6
nZAZoSKGnW67n9Nso3RjpYTwQfyYQwI=
=s/GH
-----END PGP SIGNATURE-----

--24USIZEjsi+7fMqF--

