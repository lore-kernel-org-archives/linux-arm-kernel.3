Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A984DC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwCZx8c9t9hDTDMK5HhzdMJ8PVdlAqJvtZkV7eh2zIo=; b=Jq9ajZPcreI/xdh5l6xWIs2NT4
	AvZCe+4sR+seSnRh162NLDo8k4YpN42eSaQlQsZriRUJe98yXFq0wJVQIf/OlHjhtoRxg889rqd4d
	sKMrHDU3hVx3xzZB/nYKuV6hYCAqhUa7NAn17x+pLTlFYoHLjUZKajcTcZEJaDGR1C8EbHBV96gOt
	rqh7ZB6JoUkCX70QWCPSIuEUMLY9PVho9DHw6IFomBfA7eOHWR9kkkPlk54ZAkGID4QXyTUaicTWw
	mU1oppyBhXRluSp0roHCfJk7+r+F1OpMWrsa5h5jihifGsrky+Y75TJxfiT+tMrYyOP00LJF+7//y
	/mh6cXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEk-00000004FDZ-1qzh;
	Wed, 26 Feb 2025 15:22:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHS3-00000003tio-43bZ;
	Wed, 26 Feb 2025 13:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xwCZx8c9t9hDTDMK5HhzdMJ8PVdlAqJvtZkV7eh2zIo=; b=trd1pxjY8KRp9r5vAp9ja3gXUl
	hL0A6THYdInD64jg3MfZkHQ9K/wMCfYP5iiHsduBlLp6Z+qAl21vUnEX0iN0mREI6Nk6q1J1bwiJC
	cx8ASPnbr2JFwhj0iSnByu6mnqgTQfHgjk/35M5OqfxGRt23CrWrPg0uS7U7wnC1u4O6ddaBBhT0J
	6rQW61GUGFQaLxb04GHnpx6fOxrnUt3uilsFZLnOVtlqcViV5llwIZ7rUfXHeC7qtrmXN3pWLXNlX
	L6I7gkmDzyyd6PXUd4MLUoVOqNsTycyQEFlZf82iKNcUq0akjqi1TpWr0wUw0oU7ILtqI5Itfos2U
	OHSP1AAQ==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tnHS2-0008RO-4q; Wed, 26 Feb 2025 14:27:50 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, lukasz.czechowski@thaumatec.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add usb typec host support to
 rk3588-jaguar
Date: Wed, 26 Feb 2025 14:27:49 +0100
Message-ID: <3119048.xgJ6IN8ObU@diego>
In-Reply-To: <28a16ca5-42f7-4aa1-9bc7-fc6b72364556@cherry.de>
References: <20250226102507.3743437-1-heiko@sntech.de>
 <28a16ca5-42f7-4aa1-9bc7-fc6b72364556@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_052752_076188_B3773797 
X-CRM114-Status: GOOD (  35.81  )
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

Am Mittwoch, 26. Februar 2025, 14:17:37 MEZ schrieb Quentin Schulz:
> Hi Heiko,
>=20
> On 2/26/25 11:25 AM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Jaguar has two type-c ports connected to fusb302 controllers that can
> > work both in host and device mode and can also run in display-port
> > altmode.
> >=20
> > While these ports can work in dual-role data mode, they do not support
> > powering the device itself as power-sink. This causes issues because
> > the current infrastructure does not cope well with dual-role data
> > without dual-role power.
> >=20
> > So add the necessary nodes for the type-c controllers as well
> > as enable the relevant core usb nodes, but limit the mode to host-mode
> > for now until we figure out device mode.
> >=20
>=20
> We're not limiting the mode to host-mode anymore in v3.
>=20
> I tested and indeed peripheral mode doesn't work. While my ACM gadget=20
> device is created, I cannot communicate with it.
>=20
> Maybe reword in the commit log that only host mode is supported even=20
> though we don't enforce it?
>=20
> The USB2-only issue I experienced in v2 has been fixed with:
> https://lore.kernel.org/linux-rockchip/20250226103810.3746018-1-heiko@snt=
ech.de/T/#t
>=20
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> See below for further comments.
>=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> > changes in v3:
> > - more review comments from Quentin
> >    (sbu-pin pinctrl, comments)
> > changes in v2:
> > - address review comments from Quentin
> >    (comments, pinctrl, sbu-gpios and much more)
> >=20
> >   .../arm64/boot/dts/rockchip/rk3588-jaguar.dts | 218 ++++++++++++++++++
> >   1 file changed, 218 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm6=
4/boot/dts/rockchip/rk3588-jaguar.dts
> > index 20b566d4168f..5dbcdf67f0a5 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> [...]
> > @@ -483,6 +583,26 @@ pcie30x4_waken_m0: pcie30x4-waken-m0 {
> >   			rockchip,pins =3D <0 RK_PC7 12 &pcfg_pull_none>;
> >   		};
> >   	};
> > +
> > +	usb3 {
> > +		cc_int1: cc-int1 {
> > +			rockchip,pins =3D <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +
> > +		cc_int2: cc-int2 {
> > +			rockchip,pins =3D <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +
> > +		typec0_sbu_pins: typec0-sbu-pins {
>=20
> Please rename to typec<x>_sbu_dc_pins as they aren't SBU pins, they are=20
> pins for DC coupling of SBU as far as I could tell from the DT binding.
>=20
> > +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>,
> > +					<1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +
> > +		typec1_sbu_pins: typec1-sbu-pins {
> > +			rockchip,pins =3D <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>,
> > +					<1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
>=20
> We're the first ones to declare a pinmux/pinconf for the SBU-DC pins and=
=20
> I'm not too sure if we should let them "float" or not. The default=20
> pinconf for those pins is PD, so maybe we should keep that PD. (For C1=20
> they are PU).
>=20
> Rock 5 ITX routes the SBU-DC pins to GPIOs whose pinconf defaults to PU.=
=20
> CM3588 from FriendlyElec, Orange Pi 5, Orange Pi 5 Plus and NanoPC-T6=20
> use GPIOs whose pinconf defaults to PD.
>=20
> I don't see external HW PU/PD in our or their designs so I would=20
> recommend to respect the default pinconf and put PD for the sbu-dc pins=20
> for USB-C0 and PU for USB-C1?

But if you're worried about behaviour wrt. floating, having them pulled in
different direction for typec0 and typec1 also wouldn't result in differing
behaviour?

Also the pins are output-only, so the phy will always set them in some way?

But now you made me looks things up ;-)

=46or the TS3USBCA4 USB Type-C SBU Multiplexer [0], the sbu pins on it are
described as "This pin has an internal nominally 1.6-M=CE=A9 pull-down resi=
stor."

In the block-diagram of the NX20P0407 Protection IC [1], it also looks like
a pull down is the config of choice.


Heiko

[0] https://www.ti.com/lit/ds/symlink/ts3usbca4.pdf - page 3
[1] https://www.nxp.com/docs/en/data-sheet/NX20P0407.pdf - page 3



