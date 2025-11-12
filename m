Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FD7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEA1xX/GNVBZgUISU8dce8hyiLaD1jhv7o0BMyN83H8=; b=sL9OZ1SCO8jrTRFAqUYB4FDd1E
	E8xGv7K3jRkdg8DTDvyQzzGnj277o62PM1EK2wkvWyEbwuv2bXlz2LYLaGhD5Fqxf11zWbkCPfH26
	T8KAD/+jC6HVU3794/cMdVBsVyqEZIWuf81zme376griOthsdBfO6qPXDBM5E8ov+wdUBzSn4JlBe
	U1Zh/zAud43lCHUfJxWHX54AzF/D7pFtjIE74ia3srEfktKl/3K5Wu+0k4G6NiXUM9ftaN9KedaCp
	Gz8pQkmQwqr0QcHPrU6tsdynpVbISPxlGc0OV7l3P3SNV8TLZHQI0uXhKKk5KPbp5TmfTAZcsgLmB
	DyN235ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6aw-00000008Oku-010o;
	Wed, 12 Nov 2025 08:52:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6at-00000008Ok7-1Qvq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:52:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJ6ao-00035C-Q6; Wed, 12 Nov 2025 09:52:42 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vJ6an-0003Ix-2E;
	Wed, 12 Nov 2025 09:52:41 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6998949D946;
	Wed, 12 Nov 2025 08:52:41 +0000 (UTC)
Date: Wed, 12 Nov 2025 09:52:41 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v8 0/4] rockchip: add can for RK3576 Soc
Message-ID: <20251112-intrepid-toad-of-prestige-2e67d5-mkl@pengutronix.de>
References: <20251112015940.3695638-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tm5vc7kxorjsnqka"
Content-Disposition: inline
In-Reply-To: <20251112015940.3695638-1-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_005247_383496_1C6A2AA1 
X-CRM114-Status: GOOD (  15.11  )
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


--tm5vc7kxorjsnqka
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND PATCH v8 0/4] rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 12.11.2025 09:59:36, Elaine Zhang wrote:
> rk3576 can is a new controller,new register layout and Bit position
> definition:
> Support CAN protocol.
> Support Dma.
>
> There are major differences from the previous rk3568.
> All errata on the rk3568 have been fixed and redesigned.
>
> RK3576 CANFD requires authorization and permission. The software
> code is not open by default and needs to be authorized separately.

If you change your patches it's not a "RESEND", but a vN+1.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tm5vc7kxorjsnqka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkUStUACgkQDHRl3/mQ
kZyukgf/byzx++cihi0V3YP/622WNyMq4kHAykcsrenUFbYIK6lcjLznqueFBqYI
QFgSFML86Yfyw+jVB3UU4vXbP4Eq4qoqeppCzwQe4mOlYuoarCrjHEla8mtc/IY+
6hzitJnPpN+aahQIDO4KupHNRWnRlJEPmwKLr1ZsjBRfOuG1znCeyKlOco7JKNPe
yIqRdEk8DQcRcXiU8ycqn7/5a2cU25YRK4sdHqXQVLYbLbZ8rey095mIN8A4L5EY
yQKDUcS5pQ/H4cxwPNahP3aDpxqmOO4ut0wAW5hvBaLkpuPwBiLTJ41Lg13rXwKA
6SAfoIhar29+3EGW0YEDV+f6Js+JPg==
=pjXs
-----END PGP SIGNATURE-----

--tm5vc7kxorjsnqka--

