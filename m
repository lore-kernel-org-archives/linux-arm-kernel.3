Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F10C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjMOhnWp11tKdSfcDwIGjTmqxaIJnUxDln+1DMKdeJM=; b=KovL/rsTXhQu0Fi1TEia+ldxVx
	4L/d2yb/jvRJk1cFsYQMfHjjb2ifnNPtF2dvyDhR+Nggo55/ZStW9xlQZUUqcrBT7OyrhOguQ+XiZ
	ph1uuaNxQShVaVv7qnVk4T/86v7dawyLQhvZwbZwa2MJwCQSYDz6OSxL1C12BMkw/c5EteO3QYDBM
	Bgae8wYIGxMbQ9OpToT/XFZKbDEEYoogyrcyTYoB3NIZ3ls4wTAR2rGtRDiKS2xEPIpeIT/wcSm1L
	feokc3pyD79gI0fAIMoAMyC7IyD08CUubg9sk+mRE/eBcd3bc78vm3bsYcG4I5Wgnvs76CJmwnrpE
	B6A25Myw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3MG-00000001AJQ-0qsD;
	Thu, 08 May 2025 15:40:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2ge-00000001157-3tKy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:57:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 279C45C6353;
	Thu,  8 May 2025 14:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932FCC4CEE7;
	Thu,  8 May 2025 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716244;
	bh=9ar8QWK+6HF5F4izWOQj3DNDEiLV3HwPtOjT2Z51yv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIlT50GWBoJI3mnGqjyogC67R8vDxXxo5QD9Hey3kuPw2J1mg/o0BgVW8IFOGk6S7
	 I/5njV5SUiyKkXWe2+BCOwM4tycbiHHyUS3MEIk2TmNhPJyIcirBYQ7J7zbRSbQrDh
	 216P6kLlSXMqbmx1osR97GnbKQOlY9qs8yPTtGR4c2tf9IQeKjQWe7/NJIELFE9ms/
	 rgWzpXJ+mZiigdN4fs1N6Ase7ywBylQLi4vOu18Gm59hJBISiguTicV/h5TRwCMrGq
	 gGiKYGN9imc8fMdLJP2SLV6IPj1KD4V3NNYemGuIxvTXpBYjVXnOOA1yeO1xB6QLYM
	 A5AtIaoEzmGBQ==
Date: Thu, 8 May 2025 15:57:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, upstream@lists.phytec.de,
	Benjamin Hahn <b.hahn@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: add imx95-libra-rdk-fpsc
Message-ID: <20250508-statistic-creation-ba17442921de@spud>
References: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de>
 <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uGPUkIg0ljVqE3bF"
Content-Disposition: inline
In-Reply-To: <20250507-wip-y-moog-phytec-de-imx95-libra-v1-1-4b73843ad4cd@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_075725_006840_66E79279 
X-CRM114-Status: GOOD (  14.84  )
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


--uGPUkIg0ljVqE3bF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 03:13:12PM +0200, Yannic Moog wrote:
> imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 95
> Plus FPSC SoM. Add its description and binding.
>=20
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 447054b52ea391f69d11409d51751a88bb8b539a..783550c61cd7e9aa12ffe78bf=
aa74478c19e0797 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1366,6 +1366,13 @@ properties:
>                - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
>            - const: fsl,imx95
> =20
> +      - description: PHYTEC i.MX 95 FPSC based Boards
> +        items:
> +          - enum:
> +            - phytec,imx95-libra-rdk-fpsc     # Libra-i.MX 95 FPSC
> +          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
> +          - const: fsl,imx95

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uGPUkIg0ljVqE3bF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGTgAKCRB4tDGHoIJi
0mIpAQDFZ7pwZBVIyTySKTZEy3Y13FwVLzSbzc+p71Y977kHbgEA8UuMBpqQg6DY
l00dUGbvIZiCgpxFiB6rSMZ+Z+o2LQ8=
=o519
-----END PGP SIGNATURE-----

--uGPUkIg0ljVqE3bF--

