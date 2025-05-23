Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B8BC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH/KcEGEb/R7yoqj2lqmNrLF6iQutC7FlTqqmbPe8/U=; b=hfHdcN9DQOQXOG+ersUcjHO17i
	tTUdhhTjE7cEaeHHHUNLYXceUFMLy3a/43rzTpGqUQ89owfE3uRFaFakkqSaVaXW8BCav56rXi44p
	Y+t6YkXfGE5/dSr47Khc0PyvxhOAL4LnAkDL6EN/D1nrAxV5bp7zzVsAsmO0pN9jx1Y9bD4Oz14L6
	HEvSZhkDnSj9JEJVK5kMljlpZupULAfKA3yE3wgd1JPFkuztu0KvgSRqO7M9cYQ64Cpg5ZD1vDI8g
	FAjh+ukHafi+IEOwyxfiMVXYdXUrFAxCmUi0+7Xq7BeUtdi3NqBk1RqCUNCYkYCAV7eZUe717qVRM
	F7J7/6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINUm-00000003H8G-33ks;
	Fri, 23 May 2025 08:11:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINHg-00000003F4s-3kj0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 07:57:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uINHZ-0002W0-6N; Fri, 23 May 2025 09:57:33 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uINHY-000riJ-29;
	Fri, 23 May 2025 09:57:32 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B5556418125;
	Fri, 23 May 2025 07:57:31 +0000 (UTC)
Date: Fri, 23 May 2025 09:57:31 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: can: rockchip_canfd: add rk3576
 CAN-FD controller
Message-ID: <20250523-sensible-sweet-hyrax-984f9b-mkl@pengutronix.de>
References: <20250523075422.4010083-1-zhangqing@rock-chips.com>
 <20250523075422.4010083-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6uuvyinhxjcnadv"
Content-Disposition: inline
In-Reply-To: <20250523075422.4010083-2-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_005740_933478_851A3C98 
X-CRM114-Status: GOOD (  16.12  )
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


--l6uuvyinhxjcnadv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/4] dt-bindings: can: rockchip_canfd: add rk3576
 CAN-FD controller
MIME-Version: 1.0

On 23.05.2025 15:54:19, Elaine Zhang wrote:
> Add documentation for the rockchip rk3576 CAN-FD controller.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../net/can/rockchip,rk3568v2-canfd.yaml      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-=
canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-ca=
nfd.yaml
> index a077c0330013..e5dfce382061 100644
> --- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> +++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - const: rockchip,rk3568v2-canfd
> +      - const: rockchip,rk3576-canfd
>        - items:
>            - const: rockchip,rk3568v3-canfd
>            - const: rockchip,rk3568v2-canfd
> @@ -43,6 +44,13 @@ properties:
>        - const: core
>        - const: apb
> =20
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +

DMA is only supported for rockchip,rk3576-canfd.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--l6uuvyinhxjcnadv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgwKmcACgkQDHRl3/mQ
kZyMbwf/XUVyqmirmNMJN5NTdOyyJ7ZdXwPRxOX7Hxi7c1ZhispUFBJFZB5CYRkj
ewRMjK27U12jhd4LQ8RWs5e2zp6WlH2CY21FfjEjK9gtgzzd1d0LcmyrgoH8BSQN
doM/l/i8tphiGjQmSE1eOtm0yIQRetIR6HJARSYYVAtgtfpDGiGtaO8digkJQRZt
Ll1VFI9G/aIeKpb7bWDF2uX8tsj1BHtab/vqz7kZ8RqHL70nJYViGoG1q9w9NyZv
tJSgvif35bC22wHmVFqPfxPc2QCrPuIhy8412ylkkzUIYjfz+AYyLpM6PjjT29Ma
GZ3OiW8x4+USrowh1cu4j5P9UdhjUw==
=AV9k
-----END PGP SIGNATURE-----

--l6uuvyinhxjcnadv--

