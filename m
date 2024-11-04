Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D772D1BDE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMf33H4PgN3UMr3yLXtRbxPDtfqq7TRE0oa3AErsfxY=; b=KDK87Xj+f1q3QfGoyWAZIXff7N
	ft/sJ8oSSkiLhjwEc+RkgtBoLn3dov1Jchnd4PzDsk4cEm1enk2jOVPic3f8XTVu/K3Qoq780RJLA
	5WFI1AhOiKxhnM7bYw7ieQ3dLeWCEbmzqWh5cYmSfeWykt4JAG6cOsT76D9nz5hXj8ASH+CrwHyJu
	/nMlHnWZSsVW3DF61IYbbxVj36w1yxqYPI2dARAs4jxYOiRKBotZ/E0UIOjoG7mk5Sz0mxnodwpVW
	+7uAqjsufqb3paPrHF/M9XH8fdMgsGs3KPd2t3S0M9/NA/2PqOHgG1RaVioN9ZY/ydJN8GLMQSkUs
	Imdh2NZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8265-0000000EoQy-0p0Q;
	Mon, 04 Nov 2024 18:46:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t824N-0000000Enxl-0dTG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 953BAA4326D;
	Mon,  4 Nov 2024 18:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC926C4CECE;
	Mon,  4 Nov 2024 18:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730745893;
	bh=NyVQlMFDaeFVbSuBOFcWlKWF0LNcMOH+vquUoGrumDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbiDShIR362g7b/18qH1G6xpiy7jgylY+yFf0pA7MeeuWV7naItK3k4+IhwF4DbvM
	 y17iUtC3psiV61j7uMn20AUoUfVfo5jGYrmaCN/z1Bbl5KatvKCXXlhAHIx2m6QZb+
	 S7ZOL+Zhb+uPev7uH19R/bs0USYAfsCrWexUcD7qyD3rUEQcJ5odd/8KNj1xoZJi9d
	 /CBGTz/rcMyeZrOaogTAMm5LDPVjqvRyOesFK8gZ9BnNls2T5nvdW8YhyHP7v3tz9/
	 M6JWacSXYF1rv+AjRFW6+KSz8IQ+GSaVgT/i635DP8gahleh9xu9ugnVWKdARtLboK
	 G37IguSXP/jMw==
Date: Mon, 4 Nov 2024 18:44:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: imx: add SoC specific compatible
 strings for S32G
Message-ID: <20241104-stifling-remake-f5abdc8d82bc@spud>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
 <20241104100044.3634076-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v9eOVK6j83W6+2yi"
Content-Disposition: inline
In-Reply-To: <20241104100044.3634076-2-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_104455_338811_F7A7F095 
X-CRM114-Status: GOOD (  14.76  )
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


--v9eOVK6j83W6+2yi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 12:00:43PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> S32G2 and S32G3 SoCs use the same I2C controller as i.MX.
> But there are small differences such as specific
> <clock divider, register value> pairs.
> So add new compatible strings 'nxp,s32g2-i2c'and 'nxp,s32g3-i2c'
> for S32G2/S32G3 Socs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documen=
tation/devicetree/bindings/i2c/i2c-imx.yaml
> index 85ee1282d6d2..0682a5a10d41 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -18,6 +18,7 @@ properties:
>        - const: fsl,imx1-i2c
>        - const: fsl,imx21-i2c
>        - const: fsl,vf610-i2c
> +      - const: nxp,s32g2-i2c
>        - items:
>            - enum:
>                - fsl,ls1012a-i2c
> @@ -54,6 +55,9 @@ properties:
>                - fsl,imx8mn-i2c
>                - fsl,imx8mp-i2c
>            - const: fsl,imx21-i2c
> +      - items:
> +          - const: nxp,s32g3-i2c
> +          - const: nxp,s32g2-i2c
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.45.2
>=20

--v9eOVK6j83W6+2yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykWDQAKCRB4tDGHoIJi
0v8DAP9XNX1ulct9ojS/foqv8ALtBOLXzFnt7aMuq3U19E2PBAEA/KdNUxINJJt1
gfRtCEPII6vTAjZsDFZkIl1RvT4MFQA=
=eMVA
-----END PGP SIGNATURE-----

--v9eOVK6j83W6+2yi--

