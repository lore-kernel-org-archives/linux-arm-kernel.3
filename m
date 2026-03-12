Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04515105A583
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srzef1m2vzdBOubJLzt/Mh362n1FMAaRIpcXrDz98lo=; b=ogfqpomNoVTm1kUE8Y1n8W8KoJ
	5rl3CmtScn60hYTtFtaJK7GVUpsTwhtJntuf3+wmOrogUXyiUKkIBHJ7sx9dQqB7HBW8Adt9qllne
	jY46UJTyd9PFvShnH6syLZ8AWQlnKGHfHTcRivkSHcnjBmnV1RPzDbVNKop6AyiSEpkfxS/rzKaFO
	0a543e/4EC+gH5Mz6en3Xa3tOgZhs70lh3tCs8kieXVbYTMC4dAjw8rKByEU52gOWiu7ZSUBZpvWH
	nRtSic+Y9nRVWvImKXzmNGp6B6VEwwSjEJ1TSpBIRZLM2J3/CNBQb5DCzSv3kbCUvEoZjA2WubKfP
	T3n48oaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0e39-0000000Dvji-3apj;
	Thu, 12 Mar 2026 11:17:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0e38-0000000DvjR-1evu;
	Thu, 12 Mar 2026 11:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9421760137;
	Thu, 12 Mar 2026 11:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DECC116C6;
	Thu, 12 Mar 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314271;
	bh=wBedHcPA+Jr+vf+qz66g3+kvQVhwPxMWfDbP3CM01lA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVs8wrlI91czMoggK0JSP9g8pChndUrcaYTLje9aIDwaobXvtLF5yzouiYPuJAf9D
	 BQtSjkyoL4qEaPUeQTw6b9FlDP0m3HgB2FNzFy1HVzWFh0u9yUBn+cNd9K0XMBb/mY
	 koTrTBKkI5FGPIhHw+uVBwzjAFR0HFUbWpWH9c2H9xzCr1ydJMLjsMcTHi1Zqe57TE
	 EKKyIPWzPeiuFPszClrntZ5mbiJkWb/eBzGmJRT5i5sw3k14YsyBe9dwmc9scNgZ1z
	 VICWYtn1PrwyGmeNHE0PVkhZytFNzf+bRoEw2RQlveiEYnFZA8IWmRyVYa9LMShJ/p
	 JR0qEpZE78ySA==
Date: Thu, 12 Mar 2026 11:17:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add support for Hynetek
 HUSB311
Message-ID: <20260312-malformed-cruelly-b27dc90fffff@spud>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
 <20260311-husb311-v1-3-f25bcb58cff7@flipper.net>
 <20260311-married-democrat-f6eb1c651e97@spud>
 <CAKTNdwFQnySkhpLDrFh5kwX=_tvci=g0Y6Q5y-15Qsogd=FxOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="288jPNk02s7OMmIL"
Content-Disposition: inline
In-Reply-To: <CAKTNdwFQnySkhpLDrFh5kwX=_tvci=g0Y6Q5y-15Qsogd=FxOw@mail.gmail.com>
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


--288jPNk02s7OMmIL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 11:09:43AM +0400, Alexey Charkov wrote:
> On Wed, Mar 11, 2026 at 10:33=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, Mar 11, 2026 at 08:20:46PM +0400, Alexey Charkov wrote:
> > > HUSB311 is a pin-compatible and register-compatible drop-in replaceme=
nt
> > > for RT1711H, so add its IDs to the existing driver.
> > >
> > > Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535=
-4f09-bacd-0440d2c21088.pdf
> > > Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20B=
ranch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%202021=
0526.pdf
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > ---
> > >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 21 +++++++++++++++++++--
> > >  1 file changed, 19 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typ=
ec/tcpm/tcpci_rt1711h.c
> > > index 88c50b984e8a..ac5917c1e253 100644
> > > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > > @@ -18,6 +18,9 @@
> > >  #include <linux/regmap.h>
> > >  #include <linux/regulator/consumer.h>
> > >
> > > +#define HUSB311_VID          0x2E99
> > > +#define HUSB311_PID          0x0311
> > > +#define HUSB311_DID          0x0000
> > >  #define RT1711H_VID          0x29CF
> > >  #define RT1711H_PID          0x1711
> > >  #define RT1711H_DID          0x2171
> > > @@ -55,6 +58,8 @@
> > >
> > >  struct rt1711h_chip_info {
> > >       u32 rxdz_sel;
> > > +     u16 vid;
> > > +     u16 pid;
> > >       u16 did;
> > >       bool enable_pd30_extended_message;
> > >  };
> > > @@ -308,14 +313,14 @@ static int rt1711h_check_revision(struct i2c_cl=
ient *i2c, struct rt1711h_chip *c
> > >       ret =3D i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
> > >       if (ret < 0)
> > >               return ret;
> > > -     if (ret !=3D RT1711H_VID) {
> > > +     if (ret !=3D chip->info->vid) {
> > >               dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
> >
> > Why are we checking vids and pids here? Rejecting a non-match prevents
> > using fallback compatibles, so I'd like to know why the code exists.
> >
> > Is it just here for the sake of it, or to prevent some actual issues?
> > Not really familiar with USB devices unfortunately.
>=20
> Hi Conor,
>=20
> It looks like a relic of some original vendor provided driver code.
> Rockchip's implementation of a HUSB311 driver [1] contains similar
> checks but I don't think it adds practical value in the world of
> Device Tree (after all, it's just an I2C device - I haven't seen many
> I2C drivers reject a DT match based on hardware IDs found in

There's been a lot of drivers in drivers/iio that do this kind of
although they're gradually being modified over time to support using
fallback compatibles.

> registers). I chose to avoid removing them with my patch though,
> because I don't have any Richtek hardware to test such a change.
>=20
> Maybe the error could be downgraded to a warning though.

To make use of a fallback, it can't produce a warning. If you wanna keep
it, just make them dev_dbg() I think.

Also, the devicetree binding should then be modified to support using
the fallback.

Cheers,
Conor.

--288jPNk02s7OMmIL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabKg2gAKCRB4tDGHoIJi
0kk2AQDyPSMsaOdJAVhjM9GUu81QMjVh+OQxeTyTVc9oxZggkgD+PwjQxS3n6dhI
EGB+VVnwp4ser4OBFZFXWgb3WuPt4AQ=
=6uRW
-----END PGP SIGNATURE-----

--288jPNk02s7OMmIL--

