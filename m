Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88DEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98SE4CKBkuC1U0dGD2ygGl2gM94/pCkblmzMnYwDQqk=; b=Y7m1rfA7xfwhdND9v1Ix9BJvpX
	Yu78yuCUDsAZX3StdBJYipgBPC7Nr20qIIj3XxzU4rUSAQp+PcSeVHkOJAJDPTGUCjr0pFB7PYZQ2
	mhnTHwgFoBz91A2uINQvIPyyPgoIiJ94Qkzp2507H7X9pSotGEX8mqCyftLEb8+5NqNevI5xIK85L
	D0WLOscPlf6zmmzz/YRktUm42iHSLNY0YxpJpXQ4RQVe8oXtuR8OmuY0d/rlRRgCH3kj5m86LRsM/
	SmNdNM3W+y3NwIe1Sr1mOXiwOmhzLfP22eUTd6MQAur5nKbROEL+6/vl7pq3+5rcyfMGoyhM6GraX
	enV/02aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQll-00000000Na8-0jLE;
	Thu, 16 Jul 2026 18:25:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQlh-00000000NZ7-2nDH;
	Thu, 16 Jul 2026 18:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=98SE4CKBkuC1U0dGD2ygGl2gM94/pCkblmzMnYwDQqk=; b=OuKGsbpn2os34BAQ6UizSxnUQW
	SiErxKki31XrzsoUiRG3NMh9rHPSwrQ8mzySswVcqMfO5xJJlHcLJtxpz1zuZxFdIUb57XwcLsoqu
	Qghoy1B3sQPtxT/G/pUs1+GYPI+eI2UyyMwHFwJmxQMq1CVarNqPBg0Jluz+9BJOkO7xHl4s5sDd+
	TpCBQo0w205KAOpL3XH4RgQP1cugrlx1g3YYlG0D9hzYq49l+gF/gDygDf5AByXWbAwKq7fFtCLSn
	mgeoQGnfJEYVqJgRLfk/zbUj0uzs/5zEJWg08CFB0xgYfHfiq8eAvGi4aigZjwboVwSq5Z7BM/u9N
	ANA5vnhA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 jonas@kwiboo.se
Subject: Re: [PATCH v3 03/12] arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing
 pcie rst pinctrl
Date: Thu, 16 Jul 2026 20:25:02 +0200
Message-ID: <2204997.bB369e8A3T@phil>
In-Reply-To: <CAPSPb=tTbdzBZFq9NE0PCiD8+7pbWhErauhOfjjkp0DnhDwvRA@mail.gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <DJYBBXE6SAG2.20OEJI5K6JIVM@cknow-tech.com>
 <CAPSPb=tTbdzBZFq9NE0PCiD8+7pbWhErauhOfjjkp0DnhDwvRA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_112509_708056_152D5AF0 
X-CRM114-Status: GOOD (  18.88  )
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

Am Donnerstag, 16. Juli 2026, 11:02:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Joachim Eastwood:
> Hi Diederik,
>=20
> On Tue, 14 Jul 2026 at 15:02, Diederik de Haas <diederik@cknow-tech.com> =
wrote:
> >
> > Hi Joachim,
> >
> > On Mon Jul 13, 2026 at 10:30 PM CEST, Joachim Eastwood via B4 Relay wro=
te:
> > > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> > >
> > > The pins are used as reset-gpios but not reserved through pinctrl.
> > >
> > > Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as=
 parents to dtsi files")
> > > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 +++++++++++=
+++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > > index 67e284a15c35..8df6e1a21180 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
> > > @@ -360,12 +360,16 @@ rgmii_phy1: ethernet-phy@1 {
> > >  };
> > >
> > >  &pcie2x1l1 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&pcie2_1_rst>;
> > >       reset-gpios =3D <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
> > >       vpcie3v3-supply =3D <&vcc_3v3_pcie20>;
> > >       status =3D "okay";
> > >  };
> > >
> > >  &pcie2x1l2 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&pcie2_2_rst>;
> > >       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> > >       vpcie3v3-supply =3D <&vcc_3v3_pcie20>;
> > >       status =3D "okay";
> > > @@ -420,6 +424,16 @@ rtc_int: rtc-int {
> > >               };
> > >       };
> > >
> > > +     pcie {
> > > +             pcie2_1_rst: pcie2-1-rst {
> >
> > ``pcie20x1_1_perstn_m2`` to match the schematic name?
> >
> > > +                     rockchip,pins =3D <1 RK_PA7 RK_FUNC_GPIO &pcfg_=
pull_none>;
> > > +             };
> > > +
> > > +             pcie2_2_rst: pcie2-2-rst {
> >
> > And ``pcie20x1_2_perstn_m0`` here?
>=20
> Can do.
> I see this used on a couple of other boards as well.

It's always a per-board thing. Matching pin-names to schematic
strings makes it just easier to reference from one to the other.

So yeah, it's very likely that schematics might be similar, but those
board designers sometimes also get waaaaay creative in their naming :-).


Heiko



