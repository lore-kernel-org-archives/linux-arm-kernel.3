Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E80C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lCH77eIOkpyT6UD6CNZ7GGsrspDZ0kqeiwmNw7g46I=; b=4VMICFBB/Bi8mKBI6X+1p/yjmc
	5N9gnxTvvF88DcB2sZrOpyZZ6eFLiPzjJ+IvgKpODpg8nHFS6AZkroZXfOCnTZTA/1saEnit2qioa
	O342r72pak56jaS/8gHdtsty6RrkXcMeLSoE77skkhat/Kn/BYxY8pDH/gOyRyBBJKPse92ZkSBqV
	c4IVc7+57Vt/NnKxlcfXZ21LL0D/SjJZwTtcQruM9dE+mZsiFjkPdW3Gy2mPFJekxzhYjw+fxP7UN
	uYPOasTKMXzaUI+g0oKoFsY7pzmF5rjblmpmhcUrBEu6IgkeiQlLKyIp+e0T1VyC5OzIUTAFiyAoU
	akXNmdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfenx-00000007FX3-20fq;
	Fri, 03 Jul 2026 14:23:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfent-00000007FVK-2xQn;
	Fri, 03 Jul 2026 14:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1lCH77eIOkpyT6UD6CNZ7GGsrspDZ0kqeiwmNw7g46I=; b=TPLyRFDV5oqX2oLuzs2c7r4tay
	CsE76Bq2bIY/IcZOm78Rj0OUPdsOmW/E9AL0oHE2vGBwCCUqRJcsCspd6RWCkl1FjrzE2yP8VjD5c
	o69aPl5YR/YB2/DP5acrfQX5WgAfQRCgG5hUs+PQ0JPOIFbH20tsG4BMCh3Wtdwe/bDwna5fkYl6X
	614NQpT8M06EOrbiSrzhf0Q/XhQycxO4Z8DIPHrXqSu/UCI9OjhdcEJqEf+TEfU95qDXwehdI/KDi
	WE1Of/5DDRF1pKFiqava9nEWMeJm1Mf4HrwFgoHnT1E/Qxs3G/ag/VLsvkz1bQyWEloSNWnjEjX1H
	oVkrIpwA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 kernel@pengutronix.de, Vincent Mailhol <mailhol@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: Enable CAN controller on
 RK3588-Tiger-Haikou
Date: Fri, 03 Jul 2026 16:23:22 +0200
Message-ID: <3078012.2VHbPRQshP@diego>
In-Reply-To: <e03fcd5c-de56-4f39-90c2-3ba0636a1cca@cherry.de>
References: <20260703-master-v4-0-47d40bbf5fda@qq.com>
 <tencent_F79E849B11AF805A4401BF9F263B1A469907@qq.com>
 <e03fcd5c-de56-4f39-90c2-3ba0636a1cca@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_072341_866295_CB029ED6 
X-CRM114-Status: GOOD (  30.82  )
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

Am Freitag, 3. Juli 2026, 16:05:18 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Quentin Schulz:
> Hi Heiko, Cunhao,
>=20
> On 7/3/26 10:01 AM, Cunhao Lu wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > CAN0 is piped through the Q7-connector to the CAN-Header on the Haikou
> > base-board, so enable support for it there.
> >=20
> > At least on RK3588-Tiger, the CAN clocks default to 99MHz, limiting
> > usable CAN bitrates without skew. Errata documentation mentions
> > 300MHz as the default frequency on RK3568, so replicate this here
> > to allow more bitrates.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > Signed-off-by: Cunhao Lu <1579567540@qq.com>
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arc=
h/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
> > index 873fbeb8daa1..6273e695b039 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
> > @@ -155,6 +155,12 @@ vddd_audio_1v6: regulator-vddd-audio-1v6 {
> >   	};
> >   };
> >  =20
> > +&can0 {
> > +	assigned-clocks =3D <&cru CLK_CAN0>;
> > +	assigned-clock-rates =3D <300000000>;
>=20
> Why is this not SoC-specific? We are only routing the signal from the=20
> SoC after all.

My main reason was that I have no clue what a reasonable controller
frequency is. The default on Tiger on boot  is 99MHz, which causes
problems with accurate rates.

Similarly the controller has issues with low clock rates (erratum 5 if
I'm not mistaken) and ther Mark wrote that at 300MHz the issue is less
visible. So I took that frequency, but have no clue what the "right"
frequency is.

Similarly, only Renesas socs seem to set their can frequency in the DT
and that to 40MHz.

In the Rockchip vendor-kernel I've seen rates to set to 150MHz, 200MHz
(or left alone) on a board-level

rk3568-ok3568c.dts even sets both 150MHZ AND 200MHz depending
on the CAN controller (200 for can0+1, 150 for can2) .

This does suggest the usable frequency being specific to the board-design.


> If it cannot be put into rk3588-base.dtsi for some reason and is=20
> product-specific... Why is this in the baseboard DTS and not in the SoM=20
> DTSI? I would like to avoid our customers to have to copy things over if=
=20
> they should just work on their baseboard too if they don't do crazy=20
> things there.

We can of course move the clk-rate to the tiger.dtsi.
(This should not affect the rest of the series, as I'll be applying the
dts patches anyway)


Heiko


> I'll try to find time to test the three CAN controllers on RK3588 Jaguar=
=20
> with the CAN1-CAN2-UART4 Mezzanine adapter board and will contribute an=20
> overlay for that if it goes well. I don't have a CAN-FD adapter though=20
> but I hope they reused the exact same IP for the three controllers in=20
> the SoC :)





