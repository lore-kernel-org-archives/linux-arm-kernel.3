Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90853C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StkWCNmFAnM6AiAsS6IZ5kyLWMoCcfRQ3ISiXQefHh4=; b=LugQz6M5JGgyHyR37//BI3MxOe
	smktwziTZvOG8DytAKBecZrcrU90qns1Qbs50gn/+9mi3FowUaG/oyg2k01MBp8TDxgGSl6vgCQxr
	QJ2+AjNXGN8H5k9XS1a6gKhiW1MpSTfta2OmVp3sQx3HJWLuREbKD3iyGDeWUO1j4IxDCQwLSRb0E
	ZG78XLpwc1432YdBKpyFtn1xDaEhvfwCxWQEZAHHRfy8zwPUUqZSQiyRkTcTdRf3M77M47HWMOnoH
	zifTdal3OoquxaLMF03MGxUU8cedg1lkxG5lAnExegUp1q5vQcU1ZZK5ZX8BOTRkhBGNqPTAubiRs
	28p87KcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8MT-00000005R79-4BIt;
	Tue, 08 Jul 2025 13:27:53 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8FB-00000005PF4-2m9g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:20:23 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 850791F0004D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Jul 2025 13:20:17 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CB1E1ACB311; Tue,  8 Jul 2025 13:20:16 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id BDF2AACB19F;
	Tue,  8 Jul 2025 13:20:14 +0000 (UTC)
Date: Tue, 8 Jul 2025 15:20:12 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
Message-ID: <aG0bDAEdFOGUejxn@collins>
References: <20250707165155.581579-1-paulk@sys-base.io>
 <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
 <20250708004731.37fa5129@minigeek.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UXoQYDNF1awfe9Lb"
Content-Disposition: inline
In-Reply-To: <20250708004731.37fa5129@minigeek.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_062022_020420_7529D455 
X-CRM114-Status: GOOD (  34.51  )
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


--UXoQYDNF1awfe9Lb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Tue 08 Jul 25, 00:48, Andre Przywara a =C3=A9crit :
> On Tue, 8 Jul 2025 00:34:25 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
>=20
> Hi Paul,
>=20
> forgot to mention: can you please add an ethernet0 alias, to make
> U-Boot generate a MAC address, from the SID?

Ah yes, sorry I forgot to do that. Will respin the series then.

Cheers,

Paul

> Cheers,
> Andre
>=20
> > On Mon,  7 Jul 2025 18:51:55 +0200
> > Paul Kocialkowski <paulk@sys-base.io> wrote:
> >=20
> > Hi Paul,
> >=20
> > > The Liontron H-A133L board features an Ethernet controller with a
> > > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > >=20
> > > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > > order to let the MDIO core properly reset it before trying to read
> > > its identification registers. There's no other device on the MDIO bus=
=2E =20
> >=20
> > putting the PHY reset GPIO into the MDIO node is a clever solution, I
> > was struggling with putting it either in the MAC or PHY node, though
> > conceptually it would still belong in the latter, I think. But this
> > might be a more generic problem: for most other devices we activate
> > reset and clock gates *before* trying to access them, though this might
> > be historically different for Ethernet PHYs.
> > =20
> > > The datasheet of the PHY mentions that the reset signal must be held
> > > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > > be on the safe side without wasting too much time during boot.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io> =20
> >=20
> > Despite the above, this looks fine, and works for me:
> >=20
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > Tested-by: Andre Przywara <andre.przywara@arm.com>
> >=20
> > Cheers,
> > Andre
> >=20
> > > ---
> > >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++=
++
> > >  1 file changed, 19 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a13=
3l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > index fe77178d3e33..90a50910f07b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > @@ -65,6 +65,25 @@ &ehci1 {
> > >  	status =3D "okay";
> > >  };
> > > =20
> > > +&emac0 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&rmii0_pins>;
> > > +	phy-handle =3D <&rmii_phy>;
> > > +	phy-mode =3D "rmii";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&mdio0 {
> > > +	reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > > +	reset-delay-us =3D <2000>;
> > > +	reset-post-delay-us =3D <2000>;
> > > +
> > > +	rmii_phy: ethernet-phy@1 {
> > > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +		reg =3D <1>;
> > > +	};
> > > +};
> > > +
> > >  &mmc0 {
> > >  	vmmc-supply =3D <&reg_dcdc1>;
> > >  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */ =20
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--UXoQYDNF1awfe9Lb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhtGwwACgkQhP3B6o/u
lQzLLQ/+Pw5wVE4z1rxkYQTcF2Mvg737ilRn/gazwASk3lyRmY36noqeBeDrizYW
L8cUAwDU1ggWc0LG+6CYyD0V2jglITFzuHz+5qP1HPZv5unxWPqfl1c0IB6amFVq
+CGP8zlXwMIELM6XhYAhr5QHZcKk/vj9qkJ4GFOJ8c9dKWaFhYBM3DqZeeCaGInG
dSfrAERWYrUxGLnmRf/cYkV4I+VxsJOKAyh9W4BUDrcL/ip6k6KziCJpSx0FvJcy
Dzt33+1trnN2gKW+WMeAFMs2/8ntNYZY8S8idW0SGQ9q6o6iWl/Ppox1h57W7TSi
qzcD7mvoQutYxgNJeoVMT0RSnKnDkzjoxvK7xxLV1zVla7g2q3BtCg0mu8SqY0Fd
VHdJ5CeemfeAQ1268f+P4TCStmNdphhJCiEx62ORkx2k3DbMXfwTkq+MdmNzWLEb
vs1wc3avXcRPZg3ufBNMwkdufbWBJZ2R3qIoyM2rDfWYBo078oFoWmAgvupTly2a
AVSI3stjZQjm4bed/HZR2ZZo5NgmH1AF16hoQo+WjjeS1y0QVjAlw/rxSel6juxx
yPlHa2/5I0oeF9x0gHX0U8AI5nB27/7D0DY+yvtWtbCZIADlQpuMzU17HeDoYZ+K
Ypy3saPmDsSCfvKCqkYveWZq1wRy79iVf4tTyiPQ+fi+Gkamhso=
=2DGs
-----END PGP SIGNATURE-----

--UXoQYDNF1awfe9Lb--

