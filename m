Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4C2106ACD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rV6tB2UrIvebLsDTw0Q+b/NV2We2jfKg1ufjU1Bq7k=; b=r5JzhsavjVMLQBc3vKNYWXq/O1
	DDxe5iIVdqJwhY6TAdiLBxjAequwmnRBiBnGFmXn4cVRvglziMYZx3eTnCS6oG/daWLkq8Az2ibxx
	+ajyM5yaLQ8yP2GK9J1yRZF8ho7Kyj324S5N5k5LrGotkurq3d6G/v1qTT153+LyQj6CbtcYJRV+Z
	SJb1BP4kuGcSsBDl+5Qmxjqcc5S91HeewvtNVVQr3YMhiMMImH4Glz0uYbiYH8JrHlK1k+CozvBhZ
	8mhOy2vhh2RWNSBao+XW7Kiu3Rdfsm7dH2DMAU6OAml9+/ISSqDWW6yGOy8xeEYRJM4S6/D0FhZTK
	VqDUNyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k8J-0000000Elu7-348T;
	Thu, 12 Mar 2026 17:47:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k8I-0000000EltU-1qrq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD5EE61335;
	Thu, 12 Mar 2026 17:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13C9C4CEF7;
	Thu, 12 Mar 2026 17:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337657;
	bh=wMvtMWbR5Rj73AQJqGHUhW527Tb27PV6JT2/uOlrqcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeM3E+nJRDYrZQpRJ87vLFXFSyxyG/EAVXgwfF3EJGdwNfH1RCSsUSSIwbd+TiIcU
	 QbeY77pSfxF49LYTwJtaUs+ycd7DwArmo6+wxfeuO3799jx0i1clQXJP2VcBdhfMQx
	 G6modkOreHw4npBGs1w9WDOvcw+O1T02bj2oKCIMd9gSAx3554t8wjnapozKzYxmrB
	 W/e9uv6/Nw9WdARJsjF2MNYlYXcAa+quTQyIxK9hipKKNL+bx6Wjy9wPMS5CMLXcoc
	 0J8rTRg6OrGrIQN54n/hmwRS5/4bDP3m+OhI2fHHyVrzzxWksAPmlfS79rK1OTIx40
	 B2f+f5f33tD4Q==
Date: Thu, 12 Mar 2026 17:47:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, amitsd@google.com, gregkh@linuxfoundation.org,
	kyletso@google.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: connector: add pd-disable dependency
Message-ID: <20260312-facial-backshift-7e810ca5f996@spud>
References: <20260312071609.388047-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wr13SwXvugaUCQW1"
Content-Disposition: inline
In-Reply-To: <20260312071609.388047-1-xu.yang_2@nxp.com>
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


--wr13SwXvugaUCQW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 03:16:08PM +0800, Xu Yang wrote:
> When Power Delivery is not supported, the source is unable to obtain the
> current capability from the Source PDO. As a result, typec-power-opmode
> needs to be added to advertise such capability.

What's the impact on any users of making this a dependency?
I assume nothing negative, since this will only impact systems that
don't work properly at present?

>=20
> Fixes: 7a4440bc0d86 ("dt-bindings: connector: Add pd-disable property")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/connector/usb-connector.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.ya=
ml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 901986de3e2b..671d7775b635 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -335,6 +335,7 @@ properties:
>      maximum: 100000
> =20
>  dependencies:
> +  pd-disable: [typec-power-opmode]
>    sink-vdos-v1: [ sink-vdos ]
>    sink-vdos: [ sink-vdos-v1 ]
> =20
> --=20
> 2.34.1
>=20

--wr13SwXvugaUCQW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL8NAAKCRB4tDGHoIJi
0nwiAQDQ56ujTvFrDP3c0yVVvsagFKg0Z0+t5X7xitqXTKLfjQD/exOakRzb+SJA
CPWE9IyUVD27QdG5+TIUbF3XRVvcAg0=
=Jyu8
-----END PGP SIGNATURE-----

--wr13SwXvugaUCQW1--

