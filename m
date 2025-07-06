Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B980BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 00:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAB548LQDZBrJBh5YWoRXDTriGUozRf+t4s+9DCamyc=; b=cMDDaANXddUvP7ov1ag4TZ0pwX
	i6thg6X8XKJ9pn9JMvwGlLjMs4DivDZ5lQ2othEl4h3jA5lryg/qWPyFr9MgPBe5efqJpgfKFSnVX
	Zrz/SSis3Y2oE8BCPk8Bp8PTFHkKuwbqe6NBMbn3T5K7Qfcr14N94XyoRmLuOTKBtpAZ8h3S8L1hF
	X4frMz6VTEUvaH1LpMaQYksP3DN4TGhIvi6gpenpUE/p0eZo8gaw0F1ihltQXvNH9kN+K4XFStbdw
	XWqQMRcRXWb7yguHNHxzCMGU3nI5KTyTj0PyriwrpL2IoQP6M0XdaUL3oPeecAZJJiMRy/pxEISQi
	vP8/CKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYCwj-0000000HBgn-0yeB;
	Sun, 06 Jul 2025 00:09:29 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYCuN-0000000HBT1-2gIf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 00:07:05 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 96E031F00050
	for <linux-arm-kernel@lists.infradead.org>; Sun,  6 Jul 2025 00:06:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 69F59ACA8A4; Sun,  6 Jul 2025 00:06:57 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 71A79ACA89B;
	Sun,  6 Jul 2025 00:06:55 +0000 (UTC)
Date: Sun, 6 Jul 2025 02:06:53 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: v3s: Fix de clock definition
Message-ID: <aGm-HRnhxAQmj8d9@collins>
References: <20250704154008.3463257-1-paulk@sys-base.io>
 <4cd84b9e2227c9225d977107eb05b9c3813b8846.camel@icenowy.me>
 <aGhNFe3wGLX8aUC6@collins>
 <1d51b75f7b85ddb588bbb24366b36df63a60712e.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RtSzGXCSjNLtl0Rj"
Content-Disposition: inline
In-Reply-To: <1d51b75f7b85ddb588bbb24366b36df63a60712e.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_170704_006069_80E7F3BE 
X-CRM114-Status: GOOD (  37.62  )
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


--RtSzGXCSjNLtl0Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sat 05 Jul 25, 14:38, Icenowy Zheng a =C3=A9crit :
> =E5=9C=A8 2025-07-04=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 23:52 +0200=EF=
=BC=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >=20
> > Le Fri 04 Jul 25, 23:54, Icenowy Zheng a =C3=A9crit :
> > > =E5=9C=A8 2025-07-04=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 17:40 +0200=
=EF=BC=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> > > > The de clock is marked with CLK_SET_RATE_PARENT, which is really
> > > > not
> > > > necessary (as confirmed from experimentation) and significantly
> > > > restricts flexibility for other clocks using the same parent.
> > >=20
> > > With it not setting parent, is arbitary pixel clocks still
> > > possible?
> >=20
> > Absolutely and the clock tree is very much improved, I think the flag
> > was the
> > reason that was preventing it from naturally keeping the tcon and de
> > clocks
> > under the video pll in my case.
> >=20
> > Now it can provide both the 33 Mhz for the pixel clock and runs the
> > mixer at
> > nearly 150 MHz. The video pll now runs at 297 MHz which is a perfect
>=20
> Did you test other pixel clocks?
>=20
> I suggest you to try a RGB-to-VGA bridge and test possible pixel clocks
> on the VGA port.

I don't have any such bridge and the V3/V3s boards I have would not easily
allow connecting such a display. But I would be glad if someone wants to te=
st
the patch with such a setup.

Cheers,

Paul


> > fit for
> > csi-sclk camera main clock, so the algorithm is doing its job at its
> > best!
> >=20
> > So this means that I no longer have to change the mixer clock to 297
> > MHz to
> > keep it under the video pll. It pretty much solves all my problems at
> > once.
> >=20
> > Here is the relevant clk_summary extract:
> > =C2=A0=C2=A0=C2=A0 pll-video=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csi-sclk=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > 1cb8000.isp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 1cb0000.camera=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 1cb1000.csi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > 33000000=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1c0c000.lcd-
> > controller=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcon-c=
h0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcon-data-clock=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 33000000=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > 1000000.clock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wb-div=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 wb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 297000000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 N=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mixer0-div=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 148500000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > deviceless=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_conne=
ction_id=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 mixer0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> > 148500000=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=
=C2=A0=C2=A0 50000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Y=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > 1100000.mixer=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mod=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > >=20
> > > > In addition the source selection (parent) field is marked as
> > > > using
> > > > 2 bits, when it the documentation reports that it uses 3.
> > > >=20
> > > > Fix both issues in the de clock definition.
> > > >=20
> > > > Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > ---
> > > > =C2=A0drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +--
> > > > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > index 52e4369664c5..df345a620d8d 100644
> > > > --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> > > > @@ -347,8 +347,7 @@ static
> > > > SUNXI_CCU_GATE(dram_ohci_clk,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0"dram-ohci",=C2=A0=C2=A0=C2=A0=C2=A0"dram",
> > > > =C2=A0
> > > > =C2=A0static const char * const de_parents[] =3D { "pll-video", "pl=
l-
> > > > periph0" };
> > > > =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 2, BIT(31),
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 3, BIT(31), =
0);
> > > > =C2=A0
> > > > =C2=A0static const char * const tcon_parents[] =3D { "pll-video", "=
pll-
> > > > periph0" };
> > > > =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_paren=
ts,
> > >=20
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--RtSzGXCSjNLtl0Rj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhpvh0ACgkQhP3B6o/u
lQzw3BAAlZqZNsqv5fI1/5xfOK0MrnTVr2yeWJVICGYxyzcojdETTioT9fGpIvZd
+RTggHTRC5yXn6nHtfcsSZeJooEBQc327qTLBlZEilcr6eWaTwqvGzQujuO59oTK
ULLJk5dpMlTOYopK0zgIu7Yiv7bU0i1E3LG7A5a60JWT51qrWXKV8kvvRSFZYfRj
E+ckIIcJhcU4z8MkWuX2aVbORAVJCNa2P8pMbj03VxkaSFOG2fkblnX62Ke9UmZN
gJsPcvW3MLhYfUDQRJEs10EtvGrvOQ8b5/6sB8nyik3GJcTnQYoyCgNUlMd//qCL
mtkCJeWhxnKtFfrubCBut3zh79PE8eZj5Zqjk5XY8XgzEQsaXk6gU+UQExUrRYm0
+QBwLNwqlAkQkTP2Jo2W3DwptF1nh/npAMTYhxenA0MmAzm3iyu5MJRwSmOhSuw8
TiMGlysGjbZSHzYmXKoHQUlQ37gkIrOMDNpQZsbqfx9rmED1kVdwzN19fz7rojD4
+gBvLSc+56oJyPm267oXgfPort5tHncJlJtD6C2n66Z9wVWKWeUwWzq1PvTvn4IW
ePThwkZ3jLr9PO4l8rIADpl7MU0GpH6KyYtMdWG0jQ8EdY667T5ah+6teFmVZdA0
qmqpvetS96j0PTDhrzhBX7d47rOey3M9XO71qZ36QLbeNJxmO6o=
=LLPO
-----END PGP SIGNATURE-----

--RtSzGXCSjNLtl0Rj--

