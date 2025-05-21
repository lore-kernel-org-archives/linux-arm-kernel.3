Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF00C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jjv82nsHDCUHgJ8TCRBumN+QQ/vlY53Lv/z+e9DnnNg=; b=zweGHGx6oHZVy0ac7jdzJR5Yng
	MoAYYUM0grFUgyuIBJHx7nYhMLoTERo0LskyWkXIftyXpFsP+APSr5KxQuORdudH50irpgmtltDV9
	zddMX0M2lv7zjrw0Pf1Mt1LWChR0AFPi0F3PM4ROsuLKMP2xx3ISJyvPh/xTxjvvdTFzmCoYR+ZP3
	qWGyLL8VuKulCsNeNtc2PTDobcrXjBI560ay99jI5ZSqOEoEJyqhq1rUdIg65//ef7NTFEA6Tf50G
	AmFSc+8Quxlifi9TFoFFbNe95ErEkJIW0/sRVPnT+FUpXXDYbpWR4tyNDZ2EP8iLb3Z80PexwlE+L
	fHmMshfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjXn-0000000Fwdk-2qYJ;
	Wed, 21 May 2025 13:31:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHj3C-0000000FrKJ-3UYH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:00:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHj32-00007s-NY; Wed, 21 May 2025 14:59:52 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHj32-000ZXv-1X;
	Wed, 21 May 2025 14:59:52 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8452641698E;
	Wed, 21 May 2025 12:59:51 +0000 (UTC)
Date: Wed, 21 May 2025 14:59:50 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <20250521-neon-yellow-groundhog-69f777-mkl@pengutronix.de>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
 <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
 <CABGWkvrmuhaF4iHqHRkrNrrHb2gUNDBJKCT-jZ8ZuwZGRvm7Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a46t33bhnuh43qgg"
Content-Disposition: inline
In-Reply-To: <CABGWkvrmuhaF4iHqHRkrNrrHb2gUNDBJKCT-jZ8ZuwZGRvm7Lw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_060002_874884_EC4231E2 
X-CRM114-Status: GOOD (  20.96  )
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


--a46t33bhnuh43qgg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
MIME-Version: 1.0

On 21.05.2025 12:32:19, Dario Binacchi wrote:
> Hello Marc,
>=20
> On Wed, May 21, 2025 at 11:35=E2=80=AFAM Marc Kleine-Budde <mkl@pengutron=
ix.de> wrote:
> >
> > On 21.05.2025 11:28:22, Dario Binacchi wrote:
> > > The board includes the following resources:
> > >  - 256 Mbytes NAND Flash
> > >  - 256 Mbytes SRAM
> > >  - LCD-TFT controller
> > >  - CAN
> >
> > [...]
> >
> > > +&can0 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&can0_pins_a>;
> > > +     xceiver-supply =3D <&reg_3v3>;
> >
> > Since v6.15-rc1 (d80bfde3c57a ("can: flexcan: add transceiver
> > capabilities")), the flexcan driver supports CAN transceivers via the
> > phy framework, see drivers/phy/phy-can-transceiver.c. Can you make use
> > of it?
>=20
> The board uses the SN65HVD233 transceiver, which is not listed among those
> supported by drivers/phy/phy-can-transceiver.c. So I can't use the PHY
> framework.

Hmmm, okay. Since the SN65HVD233 has features like loopback, we have to
think about it more than adding a new compatible to the existing driver.

> Do you agree?

Ok

> Or am I missing something?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--a46t33bhnuh43qgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgtzkIACgkQDHRl3/mQ
kZxORgf/WqqWv1YA6aA24pwIch/Mdi1hGSfsgp+sRP0Y+Rjp3ZFzW/NzCap+BoX8
VPtoygZEJLRnFjuApZePl2IwbhUX8gEjffcfl29qjLzAo6Z4MFQUlzzAr9+GZS8h
5XVxLVWher9z7xrW49Bhrebad+f9TEp+yFdez/W8LqTG6csHd2j/WhNvnA+iWp1u
1aNVS6/4dFWPgqB+aQItZ8WXJOalqhKEePqgONIWA61pPwtsF/u219pPYLLfVFAs
vL+7hVS2jph1b3sbLcUxTqZ6IV1kMUs8IyMmKyx9zYq7ziblcDGILMlPaJPkxvJO
xunHUUhFDU2GQso45w88F6DpSq2SCA==
=KaRh
-----END PGP SIGNATURE-----

--a46t33bhnuh43qgg--

