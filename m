Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CFCC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fq72bTv0aDg8FP/1veCJLfYhWi+ANAEEZ3M/sgNIuzQ=; b=oYCh6sbgiN2Qco4RfQq8BewhAe
	Z8SUvz/YsH3I4BRwh8OVYFoxIRClQPG9OZKDCaQD5BO7rnY+EJeT2abA3ibEmRXEl1/blUGCKZ5lO
	SijuoJsferDfR69Ex+QzGoVTwhug7xzNIFmD5H6weU3ZiXJeb8aaM6vN6YY3bn1nKLfIt/2Mh6L6d
	sMe8AtW+uzD8ET0//U+P9/KZlyljO56M+GKlbyAmNNH+BiBisvD9UdGGTcQt6mdZr09C9BGbutD1l
	GNGweyYtwNlC27CzjSqcH1N+AhZivCi+mdOzNSfmXKPjnyZ0fSJNRI6W5FdXuGa5YfLYMOVKQBo/g
	BzjHimhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mjP-0000000BfBA-0Jv2;
	Thu, 24 Sep 2026 16:55:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mjN-0000000BfAp-3UMF;
	Thu, 24 Sep 2026 16:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F290E601EF;
	Thu, 24 Sep 2026 16:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D951F000FF;
	Thu, 24 Sep 2026 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790268932;
	bh=fq72bTv0aDg8FP/1veCJLfYhWi+ANAEEZ3M/sgNIuzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8jyjQG5wgjV3njzYK5bFpjnqGZC1M20JAXdKp9H0BJ2imlh+/DPGGmFmM4ki+co4
	 k+OyAK/d4VWEP+/AxAqhE1w3+QSxvKozoMFwSBG3txdgWQlyQhMSczIN8hj2zkKZ79
	 ySKIcaOGnKWJi1eoCtoooaoyG13R5c/9C1aGRSaNvERVUX1qpCqEl5XsuqzDFRXomz
	 Icy/rFVg6U0+gL/QgdEWvPqTzDcCwPILCuEfN3z6KJmA2i18cStbLj8Qa7Z1nUdv19
	 dlGshJAyfLYAZ0ZKR6kPdeX959KosICrTQdt/YXLA9BdsQbSA6I3I/6mFwHHDZzZfl
	 B2EQW6jDQU5XA==
Date: Thu, 24 Sep 2026 17:55:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260924-compare-useable-3e2863b66924@spud>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GsCwYJZyFBXDIRyI"
Content-Disposition: inline
In-Reply-To: <20260924130453.196299-3-benjamin.gaignard@collabora.com>
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

--GsCwYJZyFBXDIRyI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 03:04:52PM +0200, Benjamin Gaignard wrote:
> nxp,imx8mq-vpu has been tagged has deprecated since a while.
> After driver clean up it is time to remove it.

No users in linux doesn't mean no users, but I am guessing that there's
genuinely no users elsewhere and anyone using out of tree devicetrees
should have updated due to the warning at runtime?

>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml      | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 19528262810a..69619d2c86fa 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -14,12 +14,10 @@ description:
> =20
>  properties:
>    compatible:
> -    oneOf:
> -      - const: nxp,imx8mq-vpu
> -        deprecated: true
> -      - const: nxp,imx8mq-vpu-g1
> -      - const: nxp,imx8mq-vpu-g2
> -      - const: nxp,imx8mm-vpu-g1
> +    enum:
> +      - nxp,imx8mq-vpu-g1
> +      - nxp,imx8mq-vpu-g2
> +      - nxp,imx8mm-vpu-g1
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.53.0
>=20

--GsCwYJZyFBXDIRyI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarVV/wAKCRB4tDGHoIJi
0o8JAP9bPWkftttTcroD/Ebf05mqIGTFa7OMd08w4VwH1mEEgQD+LPTr10IFTyQQ
y//zL0pKXfEzCfB463vA15kwJ030OAg=
=7zii
-----END PGP SIGNATURE-----

--GsCwYJZyFBXDIRyI--

