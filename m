Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BAFC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AsC7BFG5mj92FJSoHowKooJs6gEPFD7nWYs6mjDbh0=; b=Jt4ygdoQJw4CjJfVQ8y1GhPwKd
	bIdC9JRvHTI3+SDR/hqtumm5k9AHxpOYAuihFen/phEmw/ALNIDe3/LRCkgnTDIt/z5AuvKCZQjPj
	9IxNIiM2wXMI2yK8QldZyfaihiwhtIw9rJ7zTBmxCns3sGdijg0foMqJaMvFMTeU1iN4xKgSsqSgy
	s9Q8+Ye/QHZbgt3OoWx/eJ+9ZgAeRXc9yD71xcdGfMZjVc3pvtFR0/msMR9Da+hsnI5K/ziT2FPOy
	RcPfx851vReojSGjJgA+qOJexBPabcZMCs9i0LGkY7AkLpmw989tIWyDjyK/3llu2HarAYFWegKXj
	6YAdEXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma5L-0000000CNyo-1Zfy;
	Wed, 22 Jul 2026 16:46:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wma5K-0000000CNyQ-1gS3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:46:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C061600B0;
	Wed, 22 Jul 2026 16:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4934B1F000E9;
	Wed, 22 Jul 2026 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738777;
	bh=1AsC7BFG5mj92FJSoHowKooJs6gEPFD7nWYs6mjDbh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cnxW2ckTw/3C5NxLkORl5zEfiqs3MuVpK71LXlX/M3EOPYsLP4fEOP5TG3KFwmZwL
	 eXHbOns5sAw1gmrYHWLYxMzIJdRONeyyvIbd1rVKus/sJoBQ7iK1bKd6k+c+qvgZGU
	 Hc2HeW6o7Ex9GmPXO8x8WiJSQj98rj/KqpSOIIZeZpNiJ1sTS23LnrNC/H+aUIaSY9
	 oBilkqgwShMHwo1Y3GD2NInFd15JkDWknwaWMOC4XUTA3B05w2+xyXA5Ixpb8FuRwh
	 Tj/WMuZWZEQ06ZuHY36i8inF0GtRb5lX2xnHo2mxmw4bNIE0t81fkWFLzqSrzTHAM3
	 0ywAdQNCIO/aQ==
Date: Wed, 22 Jul 2026 17:46:12 +0100
From: Conor Dooley <conor@kernel.org>
To: han.xu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: nxp,imx94-xspi: add DMA
 properties
Message-ID: <20260722-divinity-urethane-da0cab030adb@spud>
References: <20260721-xspi_dma_upstream-v2-0-9e19d80e7762@nxp.com>
 <20260721-xspi_dma_upstream-v2-1-9e19d80e7762@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uzpimjthc/PatwgU"
Content-Disposition: inline
In-Reply-To: <20260721-xspi_dma_upstream-v2-1-9e19d80e7762@nxp.com>
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

--uzpimjthc/PatwgU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 04:01:42PM -0500, han.xu@oss.nxp.com wrote:
> From: Han Xu <han.xu@nxp.com>
>=20
> Add dmas and dma-names to describe TX and RX DMA channels for the i.MX94
> XSPI controller.
>=20
> Signed-off-by: Han Xu <han.xu@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml b/=
Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml
> index 16a0598c6d033..ccf841f194c06 100644
> --- a/Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/nxp,imx94-xspi.yaml
> @@ -30,6 +30,16 @@ properties:
>        - const: base
>        - const: mmap
> =20
> +  dmas:
> +    items:
> +      - description: Transmit DMA
> +      - description: Receive DMA
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
>    interrupts:
>      items:
>        - description: interrupt for EENV0
>=20
> --=20
> 2.34.1
>=20

--uzpimjthc/PatwgU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamDz1AAKCRB4tDGHoIJi
0gBjAQDDaTVY/p3HfrZwRPlKeI6O0mHfuCHsA7jzs8i8/hBsHQEAn37K39nj07xY
j6UCwmnMPTvle1FzwgbmdqflUB0/0Ao=
=Wa/1
-----END PGP SIGNATURE-----

--uzpimjthc/PatwgU--

