Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24F9CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRJ8yQ5ekmaWuQ8jXVrCJxPNXb/MK2xhK/Jtv1DOmw0=; b=KlgYwUgbBuLz65sdKE+/SNY7ah
	gaHoJ3+yDGbKSmyCPdHZT6iloIeg1f68WgMS+ndwK2EtU4o41hXY/yhusZceH4p4Sa2RkwTQ+YTc2
	o+w2OgM8L/qLJeJxxXqNvZ7L3siIwbO+iN18WUMsHRfDtnhMrPQQDUh+0FeTnUwvs0Psjd+3HDKeM
	pCQ/wmNoKDnun9H4XNXHcxrJAJz0lcFgN2QXLmBdNSZ41gc6ZIjuPJot4uBC+sY5/gtrHc8JIj1Ts
	hOyr8SvTsuRlVwuqfMEqYy+nM/ePxIaQfWpog4qiwGpRJELfIfThwlDBtqIdsFLBhuz6MCIXzjCLU
	k/DGpEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v399M-00000001mD7-3cx7;
	Mon, 29 Sep 2025 08:22:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v399K-00000001mC3-1rNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 08:22:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1v399G-0005Da-TJ; Mon, 29 Sep 2025 10:22:18 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1v399E-0012s9-1s;
	Mon, 29 Sep 2025 10:22:16 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 3786047C36C;
	Mon, 29 Sep 2025 08:22:16 +0000 (UTC)
Date: Mon, 29 Sep 2025 10:22:15 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Andrea Daoud <andreadaoud6@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, kernel@pengutronix.de, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: Re: Possible race condition of the rockchip_canfd driver
Message-ID: <20250929-curvy-cicada-of-sufficiency-a7f464-mkl@pengutronix.de>
References: <CAOprWosSvBmORh9NKk-uxoWZpD6zdnF=dODS-uxVnTDjmofL6g@mail.gmail.com>
 <20250919-lurking-agama-of-genius-96b832-mkl@pengutronix.de>
 <CAOprWott046xznChj7JBNmVw3Z65uOC1_bqTbVB=LA+YBw7TTQ@mail.gmail.com>
 <20250922-eccentric-rustling-gorilla-d2606f-mkl@pengutronix.de>
 <CAOprWoucfBm_BZOwU+qzo3YrpDE+f-x4YKNDS6phtOD2hvjsGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcxxquzapiv75lfm"
Content-Disposition: inline
In-Reply-To: <CAOprWoucfBm_BZOwU+qzo3YrpDE+f-x4YKNDS6phtOD2hvjsGg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_012222_477261_471B7A69 
X-CRM114-Status: GOOD (  16.86  )
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


--kcxxquzapiv75lfm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Possible race condition of the rockchip_canfd driver
MIME-Version: 1.0

On 28.09.2025 00:26:59, Andrea Daoud wrote:
> > Alexander Shiyan (Cc'ed) reads the information from an nvmem cell:
> >
> > | https://github.com/MacroGroup/barebox/blob/macro/arch/arm/boards/dias=
om-rk3568/board.c#L239-L257
> >
> > The idea is to fixup the device tree in the bootloader depending on the
> > SoC revision, so that the CAN driver uses only the needed workarounds.
>=20
> Thanks, it is not easy to correlate this because I am currently not using
> barebox. I'll try this later.

The most important information in this code is where the SoC revision is
located: there is a separate nvmem cell for this. You can read out the
information once manually and change your device tree accordingly.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--kcxxquzapiv75lfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjaQbQACgkQDHRl3/mQ
kZzG/QgAket73QctCSBYEFyXMkmAapZL5ozqRJ4nTbFGZ2D4bxX6sYSf72hYfyk7
irJ+U0i4XYPuRkFvswbR5TLLqnz+Miz2yB1TbhRiD0h8ChLKgZEKZtnrEXm8Inxn
QzEg3x5x6tYQytolcXFHKzIM9FBXGnZB+pSQxXXoLPo+O6E9wmHc6l1BJe1fhJNi
vn1G7zQsFQXxU2e3Mm4j9mi8iCG9k++0f6I1t+hVEg11egn/i3hgs2jpIbKW1uv4
z76o7HAvN7Rdehs+E4VZu91g95TcNfVBJrvFb9HrDST0JG8I0w0GdQtc0ixKkl/5
lXTDJ7pB+WBJmn4iGNmH3CXFgbx2TA==
=CV6U
-----END PGP SIGNATURE-----

--kcxxquzapiv75lfm--

