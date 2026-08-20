Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92229C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkAiy/wgR/8kbgT2A4gjDwuuCsWMNesTQo7LikwOjss=; b=P0kMYE3TDBNHCQrqV8jgEhiodZ
	6ARQcCZGjMZHIKodQ83yGSfsNhUVWCfn9ZakEOrrI0rgaZ/GslNfiCPO0LSDeyVCxG//5bmVy0HCk
	j/7kahxnJwkj3p+91u85AJv3aaHs1z/jMxZU4TfOkMKoKiO1OnU5/phltdQqOS0qHjF1k0dHCFeZF
	fKH/VZSn9X38a0Exb6XIjffIRp4+TLyuwCm6oDPAPtDagEykF+xw5ChpEKvWfsu4sMtg7CjHf6gOc
	uwLZeuTPHwOfef3Ex4VznTMntL4tD4+xcTIhg4iSKu7VUcWUUA+40blJ1ZOT2MZdlN9jDPombaH+n
	sawCKY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzWt-0000000BJBI-2Sy7;
	Thu, 20 Aug 2026 09:57:47 +0000
Received: from [2a01:d0:333:0:d250:99ff:fe83:4d25] (helo=mini.riabenko.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzWp-0000000BJ9R-3HOM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=GkAiy/wgR/8kbgT2A4gjDwuuCsWMNesTQo7LikwOjss=; b=u
	grPLOCQMhAMUn6kw315OlBRIjQBkRQikWNh2MDO+VCoqxEVhj8M1k7+fX30OxyD2CHqFwKjU5Xzcy
	4THinkWHcFfG55YajMeQKTy36nEsycIB+sIsY4Lzq2YSF/RLik+3CGSBkraNMjdgO68wDeBAJ48IS
	V747+OWTP1nPJ19d+kUCKo4tkBqTHawxu8RwDxIE7NxRs93wY9e1VQTbtZ1sZfO542wpiju/Kgz2b
	4T1+hfVda5bIlOiZB3VM9Cqm7mp27LX97+9euYNaEZVhvVpDlVxnxNYF6X4nZIh1dI/OS/YoHowAB
	KYb6CXjw2imCEDjxYTKP6QnhPibaRqOEg==;
Received: from desk.lan ([2a01:d0:333::831] helo=desk.local)
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <roman@riabenko.com>)
	id 0000ng-0000000006W-0C1H;
	Thu, 20 Aug 2026 12:57:28 +0300
Message-ID: <badf09f4411ad450b7a5def37099af1edbb40d8e.camel@riabenko.com>
Subject: Re: [PATCH] arm64: dts: allwinner: sun50i-a64-olinuxino: Add RX
 delay
From: Roman Riabenko <roman@riabenko.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-sunxi@lists.linux.dev
Date: Thu, 20 Aug 2026 12:57:27 +0300
In-Reply-To: <e9c26d2a-2426-43b7-8c68-89cc52a2c7cb@lunn.ch>
References: <20260815005316.28998-1-roman@riabenko.com>
	 <e9c26d2a-2426-43b7-8c68-89cc52a2c7cb@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_025743_839015_776D3A96 
X-CRM114-Status: GOOD (  19.95  )
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

=D0=A3 =D1=81=D1=80, 2026-08-19 =D1=83 15:48 +0200, Andrew Lunn =D0=BF=D0=
=B8=D1=88=D0=B5:
> On Sat, Aug 15, 2026 at 03:53:16AM +0300, Roman Riabenko wrote:
> > The Ethernet on Olimex A64-OlinuXino computers requires an RX delay
> > greater than 0. If the value is not set or is 0, packet loss in the
> > downlink direction is severe enough to interfere with downloads and
> > disrupt software installation.
> >=20
> > The range of acceptable values is wide. The vendor has been
> > applying
> > 200 ps in its downstream DTs since 2021. This patch matches that
> > common practice.
> >=20
> > Signed-off-by: Roman Riabenko <roman@riabenko.com>
> > ---
> > =C2=A0arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > index fd3794678c33..6c8b79c257b9 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> > @@ -106,6 +106,7 @@ &emac {
> > =C2=A0	phy-handle =3D <&ext_rgmii_phy>;
> > =C2=A0	phy-supply =3D <&reg_dcdc1>;
> > =C2=A0	allwinner,tx-delay-ps =3D <600>;
> > +	allwinner,rx-delay-ps =3D <200>;
> > =C2=A0	status =3D "okay";
> > =C2=A0};
>=20
> The full node is:
>=20
> &emac {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&rgmii_pins>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-handle =3D <&ext_rgmii_phy=
>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-supply =3D <&reg_dcdc1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allwinner,tx-delay-ps =3D <600=
>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> };
>=20
> Please take a read of:
>=20
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bi=
ndings/net/ethernet-controller.yaml#L287
>=20
> phy-mode of "rgmii" is questionable. Does the PCB have extra long
> clock lines?

The PCB tracks for RX clock in comparison to RX data are approximately
the same in length in the PCB layout file (12 mm or so). The tracks for
TX clock in comparison to TX data are approximately the same as well
(roughly 14-16 mm). Thus, the tracks themselves do not appear to
implement the 2ns RGMII delay. Any delay from the tracks' lengths is
likely insignificant.

When I change the phy-mode to rgmii-id and remove allwinner,tx-delay-
ps, the connection is stable in both upstream and downstream direction.
There are no retries in my iperf3 tests. According to KSZ9031RNX
datasheet, it adds a typical 1.2 ns delay to RX_CLK with respect to
RX_DV and RXD by default, but no TX delay is provided by default. The
rgmii-id configuration causes the PHY driver to enable appropriate
internal RGMII delays.

I will submit a second version of the patch changing phy-mode to rgmii-
id and removing allwinner,tx-delay-ps.

Thank you for referring me to the linked document.

Roman

