Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97612C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQh1G7D8sscjT709aiFuC7aKr317Yzlji9rp5/JLlHU=; b=P1kvHBuQehvBbYZsQEoivqTLBQ
	DdUYk6BqRdLCvgwjPsMimtG4+ERbHG6GKYX/GmXoTSLX28oPPb9ONmUeFdhkJCRktg+t7JSIkoYPJ
	UULeRS110V9pQY+a62FPfVaKgJfcV5mexTupZWqbkAkALX3dqAHDoAxpUSe8IL9FsRdxsQda3PJUe
	vk0MKLd6JSSebOKAIu9q5KojQDG3OU+G+rXR8Qp6p79qMBFAQbrWfY/SCOQB4jO5Gu9uZaLUbca8l
	1VXeENAL7rJIXrcrY3ZhNtw/GZZOdU10FVZqX6JAvufMRGlcNuNpBina0vuQHk9d91ILLGTfObzct
	huiZdhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4ta-0000000C61A-0TCh;
	Fri, 28 Feb 2025 18:15:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4s1-0000000C5bU-04IZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 021625C5C44;
	Fri, 28 Feb 2025 18:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7B8C4CED6;
	Fri, 28 Feb 2025 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740766435;
	bh=ujaLWoGzRpD5bp+OaKn0XkWzJ+NPJTlHvgtHU9Kct5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNOTwHYBSzMUSGZtW237K6ohmPV1n6y669RasxiCor9SnzKctUazO1qZOk90onpUD
	 fIHqxLBpTR9MvIxBh4TK+6J5O1tyYjLAcXNiBt7KQ9R4+IJ2+0BCPUjOK7FHE7E81z
	 fckX75em+/P+f1MzArcZ5WNfr4OqeayjqIlE1+RpcgUapPG8Gy/9k4Zw4RPfRzEiY7
	 MxUJS5pHxiJknpnbO1QpRJeidGW1mwRFwqpYwO5UibDHX8s5G6X8tlAwSmvo1yyR20
	 f3gyUqhDWUPU3xAbdGS09zyz1AHJF7oSq2392i1+AAcm/6OYnta+G0ezVI35FD/N9b
	 7LkgSueZGbcRA==
Date: Fri, 28 Feb 2025 18:13:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: dma: fsl-edma: increase maxItems of
 interrupts and interrupt-names
Message-ID: <20250228-frown-caretaker-4e3e3f2533e9@spud>
References: <20250228-edma_err-v1-0-d1869fe4163e@nxp.com>
 <20250228-edma_err-v1-1-d1869fe4163e@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ecjyfAuBw3hDMQz"
Content-Disposition: inline
In-Reply-To: <20250228-edma_err-v1-1-d1869fe4163e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_101357_096747_A53C661C 
X-CRM114-Status: GOOD (  17.01  )
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


--7ecjyfAuBw3hDMQz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 12:42:03PM -0500, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
>=20
> The edma controller support optional error interrupt, so update interrupts
> and interrupt-names's maxItems.

This seems like something were you would know based on the soc (or
compatible) whether or not 64 or 65 is the correct maximum for that
device?

>=20
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Docume=
ntation/devicetree/bindings/dma/fsl,edma.yaml
> index 4f925469533e7..900170b3606ef 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -40,11 +40,11 @@ properties:
> =20
>    interrupts:
>      minItems: 1
> -    maxItems: 64
> +    maxItems: 65
> =20
>    interrupt-names:
>      minItems: 1
> -    maxItems: 64
> +    maxItems: 65
> =20
>    "#dma-cells":
>      description: |
>=20
> --=20
> 2.34.1
>=20

--7ecjyfAuBw3hDMQz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8H83gAKCRB4tDGHoIJi
0iDIAQCAJibbrUSAhVgbcDTkSVf5JBxg4PcLzFSvWqN50xN88QD/bgebSksIAxxy
dvxF1HJNIum9n6cLpDMLCb8ISj3fag0=
=grw2
-----END PGP SIGNATURE-----

--7ecjyfAuBw3hDMQz--

