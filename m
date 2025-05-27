Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE860C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFxVwoG4v/tI9dXCvxoc6Jj35graWV7F58OCxABwd3g=; b=kK7USTB7wezn421Zt/8eQaQwXW
	qmE5OTswM6tgHq2D4kf5BDmFuTkdm9A8SZp6p71qCB+zgMZ0HP/cv8JYAdeAi+jL22XX6L+SNuaKq
	6XZ/tnDPOfZy0rGoMOS+YT94Gd72lToUEfxEqDBUn1MHqkm/kyGFUvFCOCx7SnWkiV+cdOFMsDTn2
	ijPLYk+a1zeNoKqJ6kEK5f2iJG2AlDKWICCjNuQNxa1EgI5hc4JQoTS/j9ZNE0jclhsgee7FqmHHS
	2iAxS8CRP4EnqwD0H0HXdTAEOKT98+7VvCuVShkUQ0vIqtQ+kijBznmFVmbCCu66i54cQNtm0iJtx
	R405jj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJwjI-0000000B6ot-1H14;
	Tue, 27 May 2025 16:00:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJwh7-0000000B6ON-0qAN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 15:58:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uJwgz-0004eD-Ic; Tue, 27 May 2025 17:58:17 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uJwgx-000Rc3-37;
	Tue, 27 May 2025 17:58:15 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8E8EB41AA8E;
	Tue, 27 May 2025 15:58:15 +0000 (UTC)
Date: Tue, 27 May 2025 17:58:15 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 0/4] rockchip: add can for RK3576 Soc
Message-ID: <20250527-steady-dormouse-of-culture-c45bd6-mkl@pengutronix.de>
References: <20250526062559.2061311-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pckthsx2tg77kzdv"
Content-Disposition: inline
In-Reply-To: <20250526062559.2061311-1-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_085825_235781_A29973CE 
X-CRM114-Status: GOOD (  15.19  )
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


--pckthsx2tg77kzdv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/4] rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 26.05.2025 14:25:55, Elaine Zhang wrote:
> rk3576 can is a new controller,new register layout and Bit position
> definition:
> Support CAN and CANFD protocol.
> Support Dma.
>=20
> There are major differences from the previous rk3568.
> All errata on the rk3568 have been fixed and redesigned.

Can you configure the IP core for CAN-2.0 a.k.a. CAN-CC only mode, so
that it only receives CAN-CC frames only and not CAN-FD?

What happens if you configure register RKCAN_STR_CTL, ism_sel to 2'b01:
CAN Fixed and receive a CAN-FD frame?

Is there a more detailed description to "2'b00: Flexible; cover_mode
must disable" and "2'b11: Mixed. cover_mode must disable"?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pckthsx2tg77kzdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmg14RQACgkQDHRl3/mQ
kZyZQgf7BB/yyOkv3ry1psGUXvjfa6oVbkh/JVbPbds5HJPB50UhBhjmhbGKPq30
r4BTF8f4ZEPWK+cEbibjbBdW5DXR4VLJ1bMX4C2f53uDNua+5Z3C6TLq1R5IvDoy
PDvwfcRTEba9Oivuu9TNEpsV7hMN9opc4UORUId8yU/2vco4Pt3bQSUlbm9iRgMk
hrWJFWQ+YyEEiJfhVp7V5CarGiEB64ALiK7y8CTESWtc1IWINpFb7raFMF2RvSMW
/oVTymupsa9ltY8nVa+Mz7o4BXe1wG2ReXfn2QIB+S7+nN+ZGF2PMl/V4a1s9ByH
kBPX9qhW+6hvLQgeDJhzgFmF9bYpTQ==
=y8iK
-----END PGP SIGNATURE-----

--pckthsx2tg77kzdv--

