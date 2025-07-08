Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C7DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oheb/dER3KdeWjCUo6bv9klhmFV9w7DyJ3ar+Kf6irg=; b=4zNgA4CGxithv93JG4iKJ4y7+5
	MUimZD6RNSTo344Us2e9OTfDJ9MuDTKgCMu4g/2mQInPR2ZsObzdCE9lEZoTIixtFiMtCcLSTN6NW
	sY6I2Pji9RJpUnZW5ApyoXJK9zH8/YrMUfBG1bZ20rHqciyf4NfthVxMh7OAGCZi8kpMqwpze3/rh
	70ZUhtxBUoDA5761UpuvGZw5NjDx0bGo2v4CJ9pFEFsZNTVAy/0kJ5CXLI7WvnPCfVSvSYLcRXVN0
	WVZErPa6WVUr1AEX4jDFkVu4fXRF+UO/tz9V0/Hg/eersusc8aeShsWH+3fRr22eb5UmMz2mjjuKH
	DdqA5j1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8Ol-00000005RV9-3EQ5;
	Tue, 08 Jul 2025 13:30:15 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8Hi-00000005PkY-1yRU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:23:00 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C46161F00050
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 13:22:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 78DDFACB318; Tue,  8 Jul 2025 13:22:53 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id EF06CACB30D;
	Tue,  8 Jul 2025 13:22:51 +0000 (UTC)
Date: Tue, 8 Jul 2025 15:22:49 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
Message-ID: <aG0bqasOYUwwgiQY@collins>
References: <20250707165155.581579-1-paulk@sys-base.io>
 <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
 <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AKuaO1c0htNCAj0c"
Content-Disposition: inline
In-Reply-To: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_062258_819778_A0BC8290 
X-CRM114-Status: GOOD (  35.51  )
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


--AKuaO1c0htNCAj0c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue 08 Jul 25, 16:18, Chen-Yu Tsai a =C3=A9crit :
> On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@arm=
=2Ecom> wrote:
> >
> > On Mon,  7 Jul 2025 18:51:55 +0200
> > Paul Kocialkowski <paulk@sys-base.io> wrote:
> >
> > Hi Paul,
> >
> > > The Liontron H-A133L board features an Ethernet controller with a
> > > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > >
> > > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > > order to let the MDIO core properly reset it before trying to read
> > > its identification registers. There's no other device on the MDIO bus.
> >
> > putting the PHY reset GPIO into the MDIO node is a clever solution, I
> > was struggling with putting it either in the MAC or PHY node, though
> > conceptually it would still belong in the latter, I think. But this
> > might be a more generic problem: for most other devices we activate
> > reset and clock gates *before* trying to access them, though this might
> > be historically different for Ethernet PHYs.
>=20
> The phylib core has code to deal with reset GPIOs listed under the PHY no=
de.
> It might be worth checking why that doesn't work.

While this code does exist, it's too early to be called when the mdio bus is
trying to probe the phy. I was also surprised the existing reset gpio suppo=
rt
in the phylib core didn't take effect (that's how I tried to implement it f=
irst)
only to find that the code was never called. It's only called once the phy =
was
probed and registered.

Cheers,

Paul

> OOTH, there's no code to deal with regulator supplies for PHYs.
>=20
> ChenYu
>=20
> > > The datasheet of the PHY mentions that the reset signal must be held
> > > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > > be on the safe side without wasting too much time during boot.
> > >
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> >
> > Despite the above, this looks fine, and works for me:
> >
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > Tested-by: Andre Przywara <andre.przywara@arm.com>
> >
> > Cheers,
> > Andre
> >
> > > ---
> > >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++=
++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a13=
3l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > index fe77178d3e33..90a50910f07b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > @@ -65,6 +65,25 @@ &ehci1 {
> > >       status =3D "okay";
> > >  };
> > >
> > > +&emac0 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&rmii0_pins>;
> > > +     phy-handle =3D <&rmii_phy>;
> > > +     phy-mode =3D "rmii";
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&mdio0 {
> > > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > > +     reset-delay-us =3D <2000>;
> > > +     reset-post-delay-us =3D <2000>;
> > > +
> > > +     rmii_phy: ethernet-phy@1 {
> > > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +             reg =3D <1>;
> > > +     };
> > > +};
> > > +
> > >  &mmc0 {
> > >       vmmc-supply =3D <&reg_dcdc1>;
> > >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> >
> >

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--AKuaO1c0htNCAj0c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhtG6kACgkQhP3B6o/u
lQxyDQ//cjeBa5VAClnAeDGIbRC52Ala2SFJm9pL1Kkm6GPyKpaAbDPz4DkKtZqD
Rwt9Ti1nxSCtuhIg7pkHcAw0TSroMTZNFtQu4Y15216kq9bGylwSHVCMnWBCmpbz
SSps3qJzNVrIHJuPizt+Mc07Cl9ub18D1AoEgnIVmPRQwLI9UC9YPA7YpG2uO1fc
L+SQHu60k24t+5wDAWCs6YsTJhmkrDynisOiWD69By1idydb5pWdQJmWnUIHN6ep
y+B2E748yLeNcBVjnvW9oyIPUXk0sl/KuhnI5DVsHzvL2qIZc+qirsMMatC3soZC
rCRW3ggnKt0Ug7trxK0fR8/oEexl3q19uQcsJNH0U4a5qqDNvGWw1sYxBObQGjX9
Byyupz8Ob3q3ylq+KNTxXqXVmnGLqRf+RTaCuCs8ludvdc4aPsZvvLbZpbbYRBpM
GNaEFZafjW7eza5M/fvKvirSi8V9MrZbLfYS9ouN8Ge5qIYWl+1uZOjt1zSSj0SQ
LSmdHfKAVJ/0cNXp4x25AMb7GG0P/B/FdunNgLz+hPazZMKgAiyEcxDV5NeIQ48x
WVRb21+ijbWDrDM6p2VN+7+FNbnovBrbCxErK3QyrE1v9Om7pOHIFXpsUEX1RZOg
DR/j1w2Z8WoWAK45XWj6Ex9finr12EICE6OJUjw2zoI+smniwbs=
=O4+y
-----END PGP SIGNATURE-----

--AKuaO1c0htNCAj0c--

