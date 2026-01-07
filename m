Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A15CF6C05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usWnJ1Rw5KKtaFN+POFS8USjtMWUxqAVJ7bixsDUg8k=; b=mHzp/DpcEKfdvJaaqt5ZZNQAbY
	ggp9bSlPsuyanaCwjXdI2FYP/bs4oBHEmfgCIS/JL9uIPpRfF0hCOoSG8lGz7UYfZoXMPxwUW9jQ+
	UMy2WQsmLy30xaLkBLRQcwEegDv7jMQ3HcCv60LYukTikgpRKT/aMcIWW1KPw8U8wgff6kjZ2OfxR
	HxDpcLAWD5YhV/dwF3KtDCLKwaoY421y8BjLLP8ZfNoufGJ7Pxf1q/U3GNCdSnOuVodNe+dzJuU5f
	GV+xYD1N8ORT1sMIjy12TTCp3ZKOCljj4PoTDpiLaiXgY6SqYdiZOt3aoDUuPgsZp1T3t5HmZSr+h
	CtY9Hg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOnJ-0000000EOLV-3FAI;
	Wed, 07 Jan 2026 08:21:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOnG-0000000EOKa-2Ql5;
	Wed, 07 Jan 2026 08:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=usWnJ1Rw5KKtaFN+POFS8USjtMWUxqAVJ7bixsDUg8k=; b=DLwSKyLYN/LdD0/WXvn2Rs89I5
	2v7J+yhxRIWB39YOFf9Z+MLBFr6j7l8KJ+dLztW8zknXyw1d3LrDfPZB3BuY84D3bzkkdpyk8AjQy
	YJmOSlFVD2/f+HDCpi1g/GZ/NbzkX2IZUPmXQXjIWA5bDSdFo2XSXs2Hakx4vKYeRPWll2qfWdOBA
	GWrbX6AG6PJfWD4krWsr8ycofxnY4W3Mhp2T4+FK3u9A10m1XHWobrxfIozmM81w+xbj3eW8PbHLa
	GTbii7pEW7P88JsVaZKUVyb7XW69PpO+fygTz9GcFYKOPPz+xAMELdWfL17wdp4+oBedV9vOneaX/
	PiinqkuA==;
Received: from i53875b57.versanet.de ([83.135.91.87] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdOmx-001Lir-9F; Wed, 07 Jan 2026 09:21:07 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chaoyi Chen <kernel@airkyi.com>, Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
Date: Wed, 07 Jan 2026 09:21:06 +0100
Message-ID: <2437891.BjyWNHgNrj@diego>
In-Reply-To: <CABjd4Yw1Dqsa9EsMRFT8LOvyU8QN1C8VP+j0tY6h1uJhhXRSSw@mail.gmail.com>
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
 <CABjd4Yw1Dqsa9EsMRFT8LOvyU8QN1C8VP+j0tY6h1uJhhXRSSw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_002126_888425_C08D280A 
X-CRM114-Status: GOOD (  19.75  )
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

Am Mittwoch, 7. Januar 2026, 08:56:04 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Alexey Charkov:
> Hi Chaoyi,
>=20
> On Wed, Jan 7, 2026 at 11:04=E2=80=AFAM Chaoyi Chen <kernel@airkyi.com> w=
rote:
> >
> > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >
> > General features for rk3576 evb2 board:
> >     - Rockchip RK3576
> >     - LPDDR4/4X
> >     - eMMC5.1
> >     - RK806-2x2pcs + DiscretePower
> >     - 1x HDMI2.1 TX / HDMI2.0 RX
> >     - 1x full size DP1.4 TX (Only 2 Lanes)
> >     - 2x 10/100/1000M Ethernet
> >     - 5x SATA3.0 7Pin Slot
> >     - 2x USB3.2 Gen1 Host
> >     - 3x USB2.0 Host
> >     - WIFI/BT
> >     - ...
> >
> > Tested with eMMC/SDMMC/HDMI/USB/Ethernet/WIFI/BT module.
> >
> > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

[...]

> > +       vbus5v0_typec: regulator-vbus5v0-typec {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vbus5v0_typec";
>=20
> This might better be renamed, given that last time you mentioned this
> board doesn't have a Type-C connector. Perhaps regulator-vbus5v0-otg?

Alternatively a comment above it.

I.e. regulator-naming should always follow the naming used in the
schematics, so that it gets easier to reference between schematics
and devicetree.


> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               enable-active-high;
> > +               gpio =3D <&gpio0 RK_PD1 GPIO_ACTIVE_HIGH>;
> > +               vin-supply =3D <&vcc5v0_device>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&usb_otg0_pwren>;
> > +       };
> > +
> > +       vcc12v_dcin: regulator-vcc12v-dcin {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc12v_dcin";
> > +               regulator-always-on;
> > +               regulator-boot-on;
> > +               regulator-min-microvolt =3D <12000000>;
> > +               regulator-max-microvolt =3D <12000000>;
> > +       };
> > +
> > +       vcc1v2_ufs_vccq_s0: regulator-vcc1v2-ufs-vccq-s0 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc1v2_ufs_vccq_s0";
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +               regulator-min-microvolt =3D <1200000>;
> > +               regulator-max-microvolt =3D <1200000>;
> > +               vin-supply =3D <&vcc_sys>;
> > +       };
> > +
> > +       vcc1v8_ufs_vccq2_s0: regulator-vcc1v8-ufs-vccq2-s0 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc1v8_ufs_vccq2_s0";
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +               regulator-min-microvolt =3D <1800000>;
> > +               regulator-max-microvolt =3D <1800000>;
> > +               vin-supply =3D <&vcc_1v8_s3>;
> > +       };
> > +
> > +       vcc3v3_hubreset: vcc3v3-hubreset {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc3v3_hubreset";
> > +               regulator-boot-on;
> > +               regulator-always-on;
>=20
> If this regulator supplies a soldered-on discrete hub and is required
> to power it up, won't it be better to describe the hub in the device
> tree (see binding at [1]), make the regulator its supply, and perhaps
> drop the "regulator-boot-on/regulator-always-on" annotation here,
> letting the regulator core deal with its enabling instead?
>=20
> [1] https://github.com/torvalds/linux/blob/master/Documentation/devicetre=
e/bindings/usb/usb-device.yaml

Yep, it would be nicer to it this way.
A live example can be found in the Rock 5 ITX [2]

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts#n1266


Heiko


> [snip]
>=20
> Other than these, LGTM - thanks for addressing my comments from v1!
> Feel free to include my:
>=20
> Reviewed-by: Alexey Charkov <alchark@gmail.com>
>=20
> Best regards,
> Alexey
>=20





