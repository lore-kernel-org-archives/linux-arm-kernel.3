Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D99CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpmR9AFNLi59EffaTe/gPCFTZzey5PyTmgu1ydUeCYY=; b=wB+rpgKwfb/t45lkBGeRzwpu1m
	UkRTbiS72wjhP9KC0EEWHg98jFB7Iu8+ubcnRZ02JHux+/BmDmDRpxU28J/1jLoscaNyo3TOQ1LXL
	Z2JfgzCxDCVLbXi5gZhW1UU3t3Zcy+cAQ0Z6VttqibeSy3uF/0FIczocKmXtYkCLHduahg6wyAzod
	wgOQLVKKLSHjmSUl10EJCWTBEl92JbjDxbOV1104MlNjgcT6Z+mhqzTot6NTOHlqDgJ/0H8ZOof0O
	rBX5L7UBZfuljkLQfR8jzKgxUZrV6s1r67yFXOeklJAgjbHlONmKKRyKcje0RAKZUb2Zd+CPLR3is
	EecRnRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfQv-00000001YTt-0n2C;
	Wed, 06 May 2026 16:49:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfQt-00000001YTZ-47yG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEF2F60055;
	Wed,  6 May 2026 16:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA974C2BCB0;
	Wed,  6 May 2026 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086150;
	bh=LpmR9AFNLi59EffaTe/gPCFTZzey5PyTmgu1ydUeCYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYc9q7pURpzkQsrPDE6/qn0dzUe9BRF73KuvYzihczGQ3APxSBo/5KTgv4ynSpbZd
	 B3kiaEKujAl20u/qZgx5hbGyu3Epv7mGAmeD5AM7bSZYZ+HkD35I2MPsSJKEsbtSGu
	 32WLrWM8iDKbhqcnRdvumEfSWgnhh3U6kyoQprxqEkN5ot5X4/JWXThyzJuaX78eTp
	 5dwY26w3Eoi8PNn/r+5H7GkBCOecDi+gDjw0fwehbBrqPxqBGFnOkUEieL/+bfPzEK
	 aar/dJreAsP/0tCq5tHNGMyd54aO6jB30r+eOoKL4FgSvAlJvw66WUIkLLzX8DLKhS
	 xZgObms7FEcYA==
Date: Wed, 6 May 2026 17:49:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Message-ID: <20260506-bonanza-filter-8277d26632b6@spud>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
 <20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yyv9Sjbrp17gVtko"
Content-Disposition: inline
In-Reply-To: <20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com>
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


--Yyv9Sjbrp17gVtko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 03:01:55PM +0200, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
>=20
> Add DT compatible strings for the Aquila i.MX95 SoM and its supported
> carrier boards: the Aquila Development Board and the Clover carrier
> board.
>=20
> Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-i=
mx95
> Link: https://www.toradex.com/products/carrier-board/aquila-development-b=
oard-kit
> Link: https://www.toradex.com/products/carrier-board/clover
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Yyv9Sjbrp17gVtko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaftxAQAKCRB4tDGHoIJi
0gYDAQCoOkDa6HYxlnYVvMiZkqZ8BYpIA5UDBNrljTbPgLWv8wEAqE5T6yS34kGc
EfFQBlvn6rEZVTjD2qTFOLKKq8yP1gI=
=wHvP
-----END PGP SIGNATURE-----

--Yyv9Sjbrp17gVtko--

