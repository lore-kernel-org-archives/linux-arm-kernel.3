Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE744C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjVgFSIpV2X04ea9AxQMDu3aUAqHlJDuyDyhBp2KhX4=; b=Bfgj/D7PNjPmSU4e+yVozZs1eg
	XUiDm6W3ecprIM6ZAmvEHheLJtK/DsahXKu844L0ge2CFihGAsTA3lSuPKAfR3JiN+QPPANRXEGdT
	26NZDuAFKF8xCbbUOxJaEYdsnsmIaNGnbay1NNsHDxWFEu6BD5RjD3dDqufvi+NfgSDHndCrBEFlX
	1FzrrsSCZjizUP4vywu0u2Ax9J6uc/ZTJ2+NdoeZxfSw2KQlNmErrYLto9oZAvgLisTsc6vfaf7mS
	2FoWF07FxA3Y6+4/rauMLsfSm/6m1+fe/CTnxZt0bQdY9R0gFYBOij26zmSIRIDBRDWerKn7BAJ3Y
	Diweahqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaBR-00000003xrd-3gKf;
	Mon, 09 Jun 2025 10:56:53 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZkG-00000003uPD-2300;
	Mon, 09 Jun 2025 10:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1749464918; x=1750069718; i=frank-w@public-files.de;
	bh=UjVgFSIpV2X04ea9AxQMDu3aUAqHlJDuyDyhBp2KhX4=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MS/0fkoKpCyad+CC+J4GnkAyF87kEu/JFzIgg5K4U+jerrW54U+QOyOsaXPpvRKr
	 LyCb8s0xH6ff+z6Nv3DomqSz0T0hAC7TjTfw5CUUiFu67M3Hso8pxSIW4hYIXPu8y
	 T2T4AC2rsVc6vVEfmGHJqTKelmohQ0y+JHAcphkSJO4Y1lAUu8jB0rSAxkbHhLP2v
	 w2RgfeS+BdRzDattHZZf2Q/p9ef6LzvK05Xw37ITnzQzcUja9Q7ZCuKBc9f7XWt2A
	 SpOVrpq3MKhRx884LzjMZRtAXRVs+WdzYVtwSBmZKPc0EwT5OszD77DHgelzJ8m2n
	 RY7cEaodwo7EOS+9Rg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.71.3.129] ([100.71.3.129]) by
 trinity-msg-rest-gmx-gmx-live-5d9b465786-mldbm (via HTTP); Mon, 9 Jun 2025
 10:28:38 +0000
MIME-Version: 1.0
Message-ID: <trinity-87fadcdb-eee3-4e66-b62d-5cef65f1462d-1749464918307@trinity-msg-rest-gmx-gmx-live-5d9b465786-mldbm>
From: Frank Wunderlich <frank-w@public-files.de>
To: andrew@lunn.ch, linux@fw-web.de, daniel@makrotopia.org
Cc: myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 cw00.choi@samsung.com, djakov@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jia-wei.chang@mediatek.com,
 johnson.wang@mediatek.com, arinc.unal@arinc9.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, lorenzo@kernel.org, nbd@nbd.name,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH v3 06/13] arm64: dts: mediatek: mt7988: add basic
 ethernet-nodes
Content-Type: text/plain; charset=UTF-8
Date: Mon, 9 Jun 2025 10:28:38 +0000
In-Reply-To: <cc73b532-f31b-443e-8127-0e5667c3f9c3@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-7-linux@fw-web.de>
 <cc73b532-f31b-443e-8127-0e5667c3f9c3@lunn.ch>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:5JwfFEh+N+ttjTh5vxuvvC5upKEDjso7yy21yl5pV/dtZv3anNKBvjY4rDfI6hKaUSOph
 u8cGAWJUMqq9DWNm8iKkqwO2Z5WJeQqxTWvWCSuzL4Xre7oAMDiEITW76an37MgkjRiA/VVTVBAn
 TCuY1ELiDsMHuFNrDzszDGVRqLzacVimbed2YZnRdNlsBYJjaqCXQLWiZPBfQq3r7GObmVg0ocIP
 A5WoGgxfMhiqvOzBnRLK+WX0OfUnkAXTuI00V5820/3i5E3zK5rBte6ZVcFLl2V5lBRpaDq949jq
 3zwHlZajQ3Yg+5V0ACqAG+LGF7OsDOtplghm9747djY/y9p/OJ653mxK7VE6jqn6OU=
UI-OutboundReport: notjunk:1;M01:P0:nc+zqxOfX0U=;I8/8WjzQbL4heqzXq4h8MsUMufe
 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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_032848_893963_3A71F28F 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Andrew

> Gesendet: Sonntag, 8. Juni 2025 um 23:23
> Von: "Andrew Lunn" <andrew@lunn.ch>
> An: "Frank Wunderlich" <linux@fw-web.de>
> Betreff: Re: [PATCH v3 06/13] arm64: dts: mediatek: mt7988: add basic et=
hernet-nodes
>
> > +			gmac0: mac@0 {
> > +				compatible =3D "mediatek,eth-mac";
> > +				reg =3D <0>;
> > +				phy-mode =3D "internal";
> > +
> > +				fixed-link {
> > +					speed =3D <10000>;
> > +					full-duplex;
> > +					pause;
> > +				};
>=20
> Maybe i've asked this before? What is on the other end of this link?
> phy-mode internal and fixed link seems an odd combination. It might
> just need some comments, if this is internally connected to a switch.

yes you've asked in v1 and i responded :)

https://patchwork.kernel.org/project/linux-mediatek/patch/20250511141942.1=
0284-9-linux@fw-web.de/

connected to internal (mt7530) switch. Which kind of comment do you want h=
ere? Only "connected to internal switch"
or some more details?

> > +			mdio_bus: mdio-bus {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				/* internal 2.5G PHY */
> > +				int_2p5g_phy: ethernet-phy@f {
> > +					reg =3D <15>;
>=20
> It is a bit odd mixing hex and decimal.

do you prefer hex or decimal for both? for r3mini i used decimal for both,=
 so i would change unit-address
to 15.

> > +					compatible =3D "ethernet-phy-ieee802.3-c45";
>=20
> I _think_ the coding standard say the compatible should be first.

i can move this up of course

> > +					phy-mode =3D "internal";
>=20
> A phy should not have a phy-mode.

not sure if this is needed for mt7988 internal 2.5g phy driver, but seems =
not when i look at the driver
(drivers/net/phy/mediatek/mtk-2p5ge.c). The switch phys also use this and =
also here i do not see any
access in the driver (drivers/net/dsa/mt7530-mmio.c + mt7530.c) on a quick=
 look.
Afaik binding required the property and should be read by phylink (to be n=
ot unknown, but looks like
handled the same way).

Maybe daniel can describe a bit deeper.

> 	Andrew

regards Frank


