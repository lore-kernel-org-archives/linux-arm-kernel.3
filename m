Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1395CCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7b+f0BJN5F7q2h3kXkqZXLOjgYpUpWcWRTtyGtuHDvU=; b=LK02bo7U2/PkUtRYVpJXtuRh2G
	RbG+1kN2fXbyj9haKOppwXTnIAeFFA3dK5ys1TeSCUGJNwl2jzXVd9Metg1EKpdVpoE16QFiekgSF
	S3re6pUAvi300wxHfayDXnA4j7Hb3M/p3yW1wBGEoOUjeIAHlIdFbCP3OorFjePUtLGgIRXmj4p0O
	iojvO/8RAeMV54e3aps8GsYQWGQnPxJQE2gQwFasoKCdfS/RwQqWis4g2seJZRa6IW7Q7CPck/HCH
	HHeS9BGJTo3kQ5osNkM3OC/XRE1gR0FZ1DJa9hlkEiLpSVZdGvUESiKGKK9BwyacQnbXNahY+z4eg
	4zs33J+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6bL-00000008OrQ-3Xpu;
	Wed, 12 Nov 2025 08:53:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6bJ-00000008Oqv-31AO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:53:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJ6bF-0003Cr-LJ; Wed, 12 Nov 2025 09:53:09 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJ6bF-0003JA-1K;
	Wed, 12 Nov 2025 09:53:09 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2AB8649D94F;
	Wed, 12 Nov 2025 08:53:09 +0000 (UTC)
Date: Wed, 12 Nov 2025 09:53:09 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v8 1/4] dt-bindings: can: rockchip_canfd: add
 rk3576 CAN controller
Message-ID: <20251112-faithful-olive-orangutan-0dd207-mkl@pengutronix.de>
References: <20251112015940.3695638-1-zhangqing@rock-chips.com>
 <20251112015940.3695638-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6j5z6jy5bzcqxtvr"
Content-Disposition: inline
In-Reply-To: <20251112015940.3695638-2-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_005313_757703_C533861B 
X-CRM114-Status: GOOD (  16.71  )
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


--6j5z6jy5bzcqxtvr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND PATCH v8 1/4] dt-bindings: can: rockchip_canfd: add
 rk3576 CAN controller
MIME-Version: 1.0

On 12.11.2025 09:59:37, Elaine Zhang wrote:
> Add documentation for the rockchip rk3576 CAN controller.
>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/net/can/rockchip,rk3568v2-canfd.yaml  | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-=
canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-ca=
nfd.yaml
> index a077c0330013..22e10494e7d1 100644
> --- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> +++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> @@ -10,13 +10,12 @@ title:
>  maintainers:
>    - Marc Kleine-Budde <mkl@pengutronix.de>
>
> -allOf:
> -  - $ref: can-controller.yaml#
> -

What happened to the allOf?

>  properties:
>    compatible:
>      oneOf:
> -      - const: rockchip,rk3568v2-canfd
> +      - enum:
> +          - rockchip,rk3568v2-canfd
> +          - rockchip,rk3576-can
>        - items:
>            - const: rockchip,rk3568v3-canfd
>            - const: rockchip,rk3568v2-canfd
> @@ -43,6 +42,13 @@ properties:
>        - const: core
>        - const: apb
>
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
>  required:
>    - compatible
>    - reg

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6j5z6jy5bzcqxtvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkUSvEACgkQDHRl3/mQ
kZxpxQf9HZ67/DDxNczIiTdL1rc5POLN6x4dvvla46CMBBsqZIYGLcy/POss2VvD
OPScDEziboS5XmeA7yGdbl3XwrGL9tnn4DyQX8Xk6WbqxNrsVcVbFfyon2xDcOYT
ulS67nJ5ZWjWqZIcU4BD5sZBMgko0x/nIdGH0n3omcb7h+Pi8s9dhI5RE2chc59z
jsCgNBHqO//Wf7hjm50LJBOQ6mUn/djAEJS4132v2EFpsCFNm/2j3TZKTT2N6P1S
Z0GMk0rpaSkltF5goiQy9v5WZYnD2Maoqqc3aCH2/d/bTtin07vdTZlw8iijm8r1
70MAitU6N1mjEufhlI5md6FOaui2FA==
=EB7b
-----END PGP SIGNATURE-----

--6j5z6jy5bzcqxtvr--

