Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8871BC28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fw65trX6XvxC2qVeASvsm19lok1nRhBNIXA5fJyExAU=; b=GpsvpCAJ3IxIMgaUn4VzAfELC1
	pyHLup4hngPrhhmCEy9n9+TaGuJHHuMmMCCF9CJkYpaIRQcFo0WXKvVxuohAkc7em/uzCp/MkuDOK
	Yu6GSafiDvlZ7+gmgJkGDKCdqd6UdBj6gJxQVeBMcD48wXAjsR3EtTHQ34DgxI2vC9bBPvY4eZ5D4
	47kIZDD8Iptobj8fpZBjWBo3F1y3OXfoDrh5gOYeLjLk2dpwYmgHfiWKsbYCUKL2IIqqncWuUyBxC
	7VTe3q+Ci63o5NNKlh9gw8S7oQSI/blKTvgr7sF1nXcnPcNCDTR9bUdpsANV88G6hDBI8XI5ybSTg
	Wjppba0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF6e-0000000BhYv-1LlE;
	Thu, 06 Mar 2025 17:34:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4e-0000000BTwO-2ftX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F1A35C58AE;
	Thu,  6 Mar 2025 16:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AA6C4CEE8;
	Thu,  6 Mar 2025 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278471;
	bh=6CMCRwOUYh67tKcbM/XuwZFGUiXaz18QVK9UO2VRh/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8/rVKxc+BgfIZHssN+untqD7OxtqqKGGYp4111h7EbNrivuEv3U2w9Mh7oJQvVgA
	 DKc3rDfXmRbLNPALNTjG568jXUYItcNWszXtsRGuMN24TsDMkZand/Rr+duoTls1ov
	 dBTvq7xsab29aDihh5RVA6HYbMgPAu9l8Hyvpq1g+iDQNbS8pfpErO9PwAakpw0xg/
	 Ahiv6QmtRPuYAPD+XYTSyf2e6wHrjMce3Wg6oRsLL9VNONpdKh+bYjLSWnXUJj2Bwq
	 53l5J80twC6Gpd5umt+wmer864ybaHC+ictKumNbw0Qth9cDBaG/yiSgSxBPrg/uwC
	 ViGMChagTidDQ==
Date: Thu, 6 Mar 2025 16:27:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE IMX LPI2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: i2c: imx-lpi2c: add i.MX94 LPI2C
Message-ID: <20250306-backstab-chewing-89e93ccba5d7@spud>
References: <20250306155815.110514-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FI7Itgj+bcYXrnFK"
Content-Disposition: inline
In-Reply-To: <20250306155815.110514-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082752_716351_20DAD22D 
X-CRM114-Status: GOOD (  13.73  )
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


--FI7Itgj+bcYXrnFK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 10:58:15AM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-lpi2c" for the i.MX94 chip, which is
> backward compatible with i.MX7ULP. Set it to fall back to
> "fsl,imx7ulp-lpi2c".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/D=
ocumentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> index 1dcb9c78de3b5..969030a6f82ab 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
> @@ -26,6 +26,7 @@ properties:
>                - fsl,imx8qm-lpi2c
>                - fsl,imx8ulp-lpi2c
>                - fsl,imx93-lpi2c
> +              - fsl,imx94-lpi2c
>                - fsl,imx95-lpi2c
>            - const: fsl,imx7ulp-lpi2c
> =20
> --=20
> 2.34.1
>=20

--FI7Itgj+bcYXrnFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8nNAgAKCRB4tDGHoIJi
0l57AQCqtv96l2iZhR6gqRjBt3zAi8MxJxWpWyM1j5TLuPotSAD9F+lDTHLtWifM
PYf5w7zIctNlp+bnBCKzUd2Nsh8yFAc=
=rJKT
-----END PGP SIGNATURE-----

--FI7Itgj+bcYXrnFK--

