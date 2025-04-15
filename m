Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m78XJ7DFphQb2LGTN/ogyT1aKZ2+cwVT9xSjkZi+cx4=; b=1tpP2ZQZyyR6OB9JZ8Ddk8IbaJ
	+HkHE4t3HOXit1TcuANkiioudz202uzo0AfP57mKYgDtencn9SP618PwZnyRDoEQKBv0GTNORRODQ
	7RkZi72jYQC+i9EqHolvPOwfFDaBTEqqtXPt5G7M46lBQKf0eXU3ewHsdYpQaV6pHbrk35PJhJUHz
	gUyTePMeYr8k++8fRNnpFZLXPsZdXJyz/N2z5Uz1qZ4zgIfOtk5gkTWrGOnto1PNzZ4PVpw30KzQO
	XdsHHLt2BBt+QtI4cbZOputY+N8+tUjGF4hfb331LN/C44+0kcIpkzIu320gKCB3ALgWD2v13Fhl7
	VNX1p6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4de6-00000005M3s-3xQO;
	Tue, 15 Apr 2025 10:36:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dZS-00000005L7V-2Lgg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:31:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1u4dZP-0005vb-7M; Tue, 15 Apr 2025 12:31:11 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1u4dZO-000P3u-1l;
	Tue, 15 Apr 2025 12:31:10 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 45B213F9BCA;
	Tue, 15 Apr 2025 10:31:10 +0000 (UTC)
Date: Tue, 15 Apr 2025 12:31:10 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiko Stuebner <heiko@sntech.de>, kernel@pengutronix.de, linux-can@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] can: rockchip_canfd: fix broken quirks checks
Message-ID: <20250415-glorious-spider-of-imagination-2c084f-mkl@pengutronix.de>
References: <20250324114416.10160-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5niwputommw5d6bc"
Content-Disposition: inline
In-Reply-To: <20250324114416.10160-1-o451686892@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_033114_656140_F0059AD2 
X-CRM114-Status: GOOD (  11.70  )
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


--5niwputommw5d6bc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] can: rockchip_canfd: fix broken quirks checks
MIME-Version: 1.0

On 24.03.2025 19:44:16, Weizhao Ouyang wrote:
> First get the devtype_data then check quirks.
>=20
> Fixes: bbdffb341498 ("can: rockchip_canfd: add quirk for broken CAN-FD su=
pport")
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>

Applied to linux-can.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--5niwputommw5d6bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmf+NWsACgkQDHRl3/mQ
kZwmzgf9EQR3QqPh+Se+JjLbC/f3lT2pfHqQCqOiObr7flwz+27gHXmsQHjMfYt8
P8r00Km0qdMN37hnSWlrde5POFa+ubE2SQXyCILdcOUZc4fTs4Ehi8kX9nbuN76w
K39/SgcfCMTib4VGhzuB2ZBOpmIljZkKlfYkjolYMBmjoJXANe2P+D3eP2tM4HKu
pLXWLS0flXatk2Jt2q86d1ObggIFTakkog1AM3XKBX7DnE2si1vfc4AXFxx3SHGG
vpT9OD2snz91AMWweE9142o2ny1AVTSszTI8Z861/V6zZZ13EexTU6BvCXUjBabV
fHMRDSBSy4xFAaci/e3DJD8SRNNrFQ==
=/XME
-----END PGP SIGNATURE-----

--5niwputommw5d6bc--

