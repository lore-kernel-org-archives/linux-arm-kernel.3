Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DD7C71132
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oeMfzgpDyFenP1NeZBi5mnHFeuCvixDO862rdadX3U=; b=TRLIRkeux8uaXgpU5CCCGOqsr2
	gNpWGJ/VsuqeVx6sbadY4WYYCShQnA/NtMWZ1kuqnv8An8aXt57OltWFUTl5c8nAZaAH9BVRIE8G9
	JDM/V02N9aOrRRGtUZsKsUac66MSO15J//fEF78zQdUR1dl5uJioUwAETrIbYNfMiYn/LTamKPWHM
	0E17e9oiDGg7zig9Q9B7YQ8DrRVr6gUubEJ6Lum8Gw2TdaHbwU1Np6DRqE3l9qkBSi9FhWkVL6IJN
	HH526IhyIg2bOZVGsl0oL3k8j6YeiuiLotanQejuFPjIfUtGoMW+bwO29wL7tnnnJoFCtfCgm2eIC
	K5Ce773A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwep-00000006Xxl-1tZC;
	Tue, 10 Jun 2025 10:56:43 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvVG-00000006NPh-1t2S;
	Tue, 10 Jun 2025 09:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1749548543; x=1750153343; i=frank-w@public-files.de;
	bh=/oeMfzgpDyFenP1NeZBi5mnHFeuCvixDO862rdadX3U=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=O709jW9JdwF2bH69ynEqbMJT5oYUnmDgxbsYXX5lpRIOJ+Nw4UC3vDWbHXz4wKWz
	 V6p69e76Zgnu1UDi0x/c/uOh5jat48j2+DNZO9UMD737ERj289I57xk2uWffaceBm
	 U0VG4fO5VgR4w7wq2eIPPAepMaDrqjB17cQGlL0KPJKosqlLVeNqvmLWfBV5VXy0/
	 upwfKzQ9x/gBN/mU7ybt5hGOESEPKQD3laWnm/FzWQpgREp2484Tf/gnxXMcPV1PM
	 i35iRcV+2QsdA70ar9GHYbDOj0KksIxTqZDvCAE4J72pr4Hm0a1SBuutSQpDRplW2
	 sKOxyWQJeHfxJHCLFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.64.173.171] ([100.64.173.171]) by
 trinity-msg-rest-gmx-gmx-live-5d9b465786-6h7cc (via HTTP); Tue, 10 Jun 2025
 09:42:23 +0000
MIME-Version: 1.0
Message-ID: <trinity-ccdae81d-0e10-4e78-a29d-917b623095e8-1749548543301@trinity-msg-rest-gmx-gmx-live-5d9b465786-6h7cc>
From: Frank Wunderlich <frank-w@public-files.de>
To: andrew@lunn.ch
Cc: linux@fw-web.de, daniel@makrotopia.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, djakov@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johnson.wang@mediatek.com,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, lorenzo@kernel.org, nbd@nbd.name,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: Re: [PATCH v3 06/13] arm64: dts: mediatek: mt7988: add
 basic ethernet-nodes
Content-Type: text/plain; charset=UTF-8
Importance: normal
Date: Tue, 10 Jun 2025 09:42:23 +0000
Sensitivity: Normal
In-Reply-To: <9d27e0d3-5ecb-4dcd-b8aa-d4e0affbb915@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-7-linux@fw-web.de>
 <cc73b532-f31b-443e-8127-0e5667c3f9c3@lunn.ch>
 <trinity-87fadcdb-eee3-4e66-b62d-5cef65f1462d-1749464918307@trinity-msg-rest-gmx-gmx-live-5d9b465786-mldbm>
 <9d27e0d3-5ecb-4dcd-b8aa-d4e0affbb915@lunn.ch>
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:OFjOchg4Lqw5a2CcWeQW6D2v8sr1/Y8LlEK+V8kJRAC6XO3xezQhXNFFp4W0wJLFECOo+
 hwlRt6DSTEY7Jy3Og1AF+OGuqFbLdNJcnjmYFZl+qXQq/7in26PqtFhTKqMo0nQSayMzrCQgTIgw
 sJL9QmM19VHbi9WreLyIzlB+oIEMMSv5a5TXyC5RO4MaHZmk3CLiKz3UrbuH1/sphDTuZZt0ezlE
 9WQSzYVGw8TH6MSoxzzpbNZJltAaif+NqHVP8o6rLST2Apyir6IpzLsRc9i8NRMTFByR/Ze4tEoj
 +sPQzbVAFbmsYphGwXp85KZKULPNc5U5dUWBoOmswVymFwNljY3sY7Waf+QnR6Jo34=
UI-OutboundReport: notjunk:1;M01:P0:N0TFurw6qdA=;dnuAdwIY17K7lvPuKBOx2H95Knc
 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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_024246_779500_9D0B88CE 
X-CRM114-Status: GOOD (  28.72  )
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

Hi


> Gesendet: Montag, 9. Juni 2025 um 14:12
> Von: "Andrew Lunn" <andrew@lunn.ch>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Betreff: Re: Re: [PATCH v3 06/13] arm64: dts: mediatek: mt7988: add basi=
c ethernet-nodes
>
> > > > +			gmac0: mac@0 {
> > > > +				compatible =3D "mediatek,eth-mac";
> > > > +				reg =3D <0>;
> > > > +				phy-mode =3D "internal";
> > > > +
> > > > +				fixed-link {
> > > > +					speed =3D <10000>;
> > > > +					full-duplex;
> > > > +					pause;
> > > > +				};
> > >=20
> > > Maybe i've asked this before? What is on the other end of this link?
> > > phy-mode internal and fixed link seems an odd combination. It might
> > > just need some comments, if this is internally connected to a switch=
.
> >=20
> > yes you've asked in v1 and i responded :)
> >=20
> > https://patchwork.kernel.org/project/linux-mediatek/patch/202505111419=
42.10284-9-linux@fw-web.de/
> >=20
> > connected to internal (mt7530) switch. Which kind of comment do you wa=
nt here? Only "connected to internal switch"
> > or some more details?
>=20
> "Connected to internal switch" will do. The word switch explains the
> fixed-link, and internal the phy-mode.
>=20
> It is not the case here, but i've seen DT misused like this because
> the MAC is connected to a PHY and there is no PHY driver yet, so a
> fixed link is used instead.
>=20
> > > > +			mdio_bus: mdio-bus {
> > > > +				#address-cells =3D <1>;
> > > > +				#size-cells =3D <0>;
> > > > +
> > > > +				/* internal 2.5G PHY */
> > > > +				int_2p5g_phy: ethernet-phy@f {
> > > > +					reg =3D <15>;
> > >=20
> > > It is a bit odd mixing hex and decimal.
> >=20
> > do you prefer hex or decimal for both? for r3mini i used decimal for b=
oth, so i would change unit-address
> > to 15.
>=20
> I suspect decimal is more common, but i don't care.
>=20
> >=20
> > > > +					compatible =3D "ethernet-phy-ieee802.3-c45";
> > >=20
> > > I _think_ the coding standard say the compatible should be first.
> >=20
> > i can move this up of course
> >=20
> > > > +					phy-mode =3D "internal";
> > >=20
> > > A phy should not have a phy-mode.
> >=20
> > not sure if this is needed for mt7988 internal 2.5g phy driver, but se=
ems not when i look at the driver
> > (drivers/net/phy/mediatek/mtk-2p5ge.c). The switch phys also use this =
and also here i do not see any
> > access in the driver (drivers/net/dsa/mt7530-mmio.c + mt7530.c) on a q=
uick look.
> > Afaik binding required the property and should be read by phylink (to =
be not unknown, but looks like
> > handled the same way).
>=20
> Which binding requires this? This is a PHY node, but i don't see
> anything about it in ethernet-phy.yaml.

seems like only the cpu-port on switch requires the phy-mode for binding..=
.

  DTC [C] arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb
arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: switch@15020000:=
 ports:port@6: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.ya=
ml#

tested on hardware with the others disabled:

- phy-mode on gsw-ports are needed else i get this:
[    1.386586] mt7530-mmio 15020000.switch wan (uninitialized): validation=
 of gmii with support 0000000,00000000,00000000,000062ef and advertisement=
 0000000,00000000,00000000,000062ef failed: -EINVAL
[    1.408209] mt7530-mmio 15020000.switch wan (uninitialized): failed to =
connect to PHY: -EINVAL
[    1.421308] mt7530-mmio 15020000.switch wan (uninitialized): error -22 =
setting up PHY for tree 0, switch 0, port 0
- phy-mode on gmac0 is needed alse ethernet-controller (and switch) does n=
ot get up

the phy-modes (gsw_phyX) can be dropped, the 2g5 phy-mode is currently set=
 twice (mt7988a.dtsi and in 2g5 dts), so i would leave this in mt7988a.dts=
i

>=20
> 	Andrew

regards Frank

