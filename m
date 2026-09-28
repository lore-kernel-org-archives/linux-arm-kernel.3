Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCBECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+GecGFatFN3gd4FU0zwdLZy3vmhqUQHcx2HZQZRqDY=; b=bxf4jVsFJ0qFkxkllP76WmvDk4
	nNkc3HPFzZWC/pvklXa287Lwv7DYzMtxkHz9RkNnagRX8c7IUxYGDjWFke8tLuBigfHpt1Igkix/r
	/Zqf/uMdS1pmjofngF+ZSiY5SUO4kLViBIlDlA8AGDgWA0cq0DBgi90R+VeBhLq/Y/fYbxsrY7vp6
	Fo0PmfQDfh1dJiQi+qfXeUaHsCQz+Rm0GYjUsCBcX83O/qcnbRKcK64SWt/iWkSfnf+/jRSRAlY99
	YVDATeFJO9yvkrT70dvBlt5cvzOhn2jOZiS9b5kMTIpzXJLVOMH+HcFgnLRqqGjBXlKddJiCoHDhD
	a5oEvDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEGL-000000012Ic-2tl7;
	Mon, 28 Sep 2026 16:31:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEGK-000000012IL-1yFN;
	Mon, 28 Sep 2026 16:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 827E860052;
	Mon, 28 Sep 2026 16:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F371F00893;
	Mon, 28 Sep 2026 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613091;
	bh=u+GecGFatFN3gd4FU0zwdLZy3vmhqUQHcx2HZQZRqDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQofYHM8uBma/8EpuyIQiXsLcSgWdZZ3UFAlUaDMJ1ELaYDqMqrVxvrMKXmoCMeRp
	 17/u0w+sJDqb779BLRn8Djc2yT38Az1pJque6e73DEmnCO77nUjppWY34d/qq+14PS
	 14dv5JESvVi/AhuXKzUYds6UTkCMMDodNL6w7NBlSsiyDOgc+vhQEzQqsymqQyhN6Y
	 risYv6rabELRHy4reEgIfyF+Z1yAxP///8CX+3dLTxPaJWPshFGvhjMYzeQLL0NHjq
	 DNYFzXZ5quj0r94QhcUaGC6zqUj1zV80KZIMiHcoqH3opWkdNm83Akin8f5phHNF85
	 zvATf4iWAUtGw==
Date: Mon, 28 Sep 2026 17:31:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Message-ID: <20260928-primal-figurine-2a87db42eab0@spud>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
 <20260928080822.19553-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojMyhCVrSd8uTcXb"
Content-Disposition: inline
In-Reply-To: <20260928080822.19553-3-benjamin.gaignard@collabora.com>
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

--ojMyhCVrSd8uTcXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:08:21AM +0200, Benjamin Gaignard wrote:
> nxp,imx8mq-vpu has been tagged has deprecated since a while and
> driver emitted a warning when this bindings was used.
> Vendor DT use the following node before they moved to mainline driver:
> vpu: vpu@38300000 {
> 	compatible =3D "nxp,imx8mq-hantro";
> 	...
> };
> but that binding has never be documented.
> After driver clean up it is time to remove it.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

This is not a tag that you should put in your commits btw, this was me
telling the dt patchwork that this patch has been handled.

> ---
> changes in v5:
> - add more details in commit message
> - add Conor Dooley accked-by tag
>=20
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

--ojMyhCVrSd8uTcXb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqWXQAKCRB4tDGHoIJi
0sBnAQC3KVZncC+oc93z8JEN+k1mmcQPrcPZ/QqF5cWDRv1gLAEAs6BKKnMf9fJD
qhFn2pNOcXaqd7qnzod8w2h8rp4NXgY=
=qoRO
-----END PGP SIGNATURE-----

--ojMyhCVrSd8uTcXb--

