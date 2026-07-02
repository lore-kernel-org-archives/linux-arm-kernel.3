Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FB3C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG9IR5uHec66jFYbTFwqlNI1XrQsQ64Cpl138Qi8h5c=; b=z5iUs8Zwgo2mzpw4tm7bA3abGN
	8Xpq9e6rh6Q2UWZ3kVvEReznRD1HbW4h98PT97YtJJiZmrLCvnvfxoIAs+ETJ6LHdS8auj6zHf2Y9
	aBMJwbdnhGc2AZ0C2rTddN3fzY2nLHZYXtzjDH9X7XSY4k7O+UzuaMLsRD6gBRDIv112/u4WZwaTH
	I6DbO1m9ig+eppObUVwv6M7tDjcC0+b8g8GDIyGaiDqCZ6haQKWbHrjl3DlGOKfPgjEJ1pLGYoklw
	10jpUgJlrO5Aikv7/umsvIeBcNY8pNnf7iaOX2lJd/Lc6/+cRdDgwdbbzzTvmt4+LsLLvmoODdsCT
	TVqlwAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFKk-00000004HbM-2T9S;
	Thu, 02 Jul 2026 11:11:54 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfFKh-00000004Hab-1OiC;
	Thu, 02 Jul 2026 11:11:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C89A0200A6D;
	Thu, 02 Jul 2026 13:11:47 +0200 (CEST)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1wfFKd-005jUk-2D;
	Thu, 02 Jul 2026 13:11:47 +0200
Received: from pengutronix.de (ip-185-104-138-148.ptr.icomera.net [185.104.138.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 00F2F55E2E3;
	Thu, 02 Jul 2026 11:11:44 +0000 (UTC)
Date: Thu, 2 Jul 2026 13:11:43 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: heiko <heiko@sntech.de>, linux-can <linux-can@vger.kernel.org>, 
	mailhol <mailhol@kernel.org>, kernel <kernel@pengutronix.de>, robh <robh@kernel.org>, 
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] can: rockchip: add RK3588 CAN-FD support
Message-ID: <20260702-accelerated-shoebill-of-elevation-76f536-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <tencent_C422347432620914231601BC882C7E604D08@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g3juocogafd37lbu"
Content-Disposition: inline
In-Reply-To: <tencent_C422347432620914231601BC882C7E604D08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_041151_530636_FC84FAD7 
X-CRM114-Status: GOOD (  25.05  )
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


--g3juocogafd37lbu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] can: rockchip: add RK3588 CAN-FD support
MIME-Version: 1.0

On 02.07.2026 17:23:59, Cunhao Lu wrote:
> Hi Marc,
>
> > Is the SoC you're using actually a 'v2' silicon revision? At least on
> > the rk3568 the downstream kernel has code to read the revision.
>
> The kernel reports the CAN-FD controller as rk3588v2 rev2.2:
>
>   rockchip_canfd fea60000.can can0: Rockchip-CANFD rk3588v2 rev2.2 (errat=
a 0x0000) found
>   rockchip_canfd fea70000.can can1: Rockchip-CANFD rk3588v2 rev2.2 (errat=
a 0x0000) found
>
> Following your earlier feedback, I have changed the v2 series to use
> rockchip,rk3588-canfd instead of rockchip,rk3588v2-canfd unless we get
> more information about RK3588 CAN-FD errata and SoC silicon revisions
> from Rockchip.
>
> > Compile the latest https://github.com/linux-can/can-utils/ and test:
> >
> > $ cangen can0 -I 2 -Li -Di -p 10 -f -g 1 -c32 -b
> > $ cansequence -rv can1 -f
>
> I tested with can0 and can1 directly connected. The CAN clock was
> 200 MHz, and the interfaces were configured as follows:
>
>   ip link set can0 down
>   ip link set can0 type can bitrate 500000 sample-point 0.8 dbitrate 1000=
000 dsample-point 0.8 fd on
>   ip link set can0 up
>
>   ip link set can1 down
>   ip link set can1 type can bitrate 500000 sample-point 0.8 dbitrate 1000=
000 dsample-point 0.8 fd on
>   ip link set can1 up
>
> Without BRS, this test ran for 15 minutes without problems:
>
>   cangen can0 -I 2 -Li -Di -p 10 -f -g 1 -c32
>
> With BRS enabled:
>
>   cangen can0 -I 2 -Li -Di -p 10 -f -g 1 -c32 -b
>
> the test only worked when dbitrate was equal to bitrate, for example
> with both set to 1M. If dbitrate differed from bitrate, the
> controller went bus-off immediately.
>
> So my current conclusion is that CAN-FD itself works on RK3588, but the
> support appears incomplete: using a faster data phase with BRS does not
> work in my setup.

Then CAN-FD is broken. :/

Maybe in a later patch we can hack something, to allow working
configurations.

> This looks different from the issue described by the current
> RKCANFD_QUIRK_CANFD_BROKEN comment. That quirk is about specific
> CAN-FD frames triggering Error Interrupt or Error-Warning during
> reception. In my test the non-BRS CAN-FD frames work, while the failure
> is tied to using BRS with a data bitrate different from the nominal
> bitrate, which immediately drives the controller bus-off.

Can you update the description of the quirk for the rk3588 and add how
to reproduce it?

> Given this result, should I still keep CAN-FD disabled for RK3588, or is
> it acceptable to enable CAN-FD but document that BRS with a faster data
> phase is currently not working?

Please keep it disabled for now.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--g3juocogafd37lbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCakZHbAAKCRDMOmT6rpmt
0kH7APkB+Ph02O8jbLwNPVHdiuMu717y5tk5YAdnacU9kEQ/+gEAieWkfM/cPVcW
4Yv+JL1RKIjpy4cM0fRvq9mHrjox3QQ=
=m2rP
-----END PGP SIGNATURE-----

--g3juocogafd37lbu--

