Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0B5E8784E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/RzIoETwq7EI8AtWKZybI6w+H5plu3IYaH4qKanRYc=; b=hj2DuGqBztimzUNT4mRgYIpFYX
	IHBZXPa743uHV7VP6R2c2xNd+P3gkDDGRR8+4SSsc6jJWHd8jz7fP5KW2ckYOaRzEqJg3u7Z9J3JJ
	lZOtae538AihjgFW2aQXtrbbtkARHCZOvp5ppoCbxUP3p6RBTfKzK1goP+sftS42cCMhRPfZQQBRe
	aVG4tIjf1Rky4wSIHFF3w8fCbOzaO9MNZW4PvDIRUM3tF+3fa7/BRAn2FqfSXpNunVuder1NdJk85
	J5RY8QJGnCeGJI5k4qtVtEuoqO0eNnCdxejg+6SGd1OXnc5NofF4GYjl6ILbOJsl2f5iSpPNdEzd2
	FUYXg6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJxJ-000000071gF-2Oxg;
	Tue, 03 Feb 2026 17:12:49 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJxF-000000071ff-0SEY;
	Tue, 03 Feb 2026 17:12:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id F2DB041C6B;
	Tue,  3 Feb 2026 18:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1770138761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q/RzIoETwq7EI8AtWKZybI6w+H5plu3IYaH4qKanRYc=;
	b=NuUOa/tWVQA88Evlzzmypa+ZhmtZ9WD5NE3qkTSvFW9VDfzrlzWn/ica/Oh19ldTQOQex1
	CG9Fzqx/MhWhIrx46uP60Hpriu/XwRWX0tUqFIbbDG19lngzHUuzJCSIS+GwVeQadyPf90
	VxkSaSy9cqfGiwqZM3p0SoZDp1w/pOF25hTsRFUJ99YTCucmLrE+ehN97OzMwKkEm3Xq/f
	ov+VWlccOepeSU/UKtDTG7Rom3SqhOaZgZr3a+oEmlU0ZQUEZdr69c7BNzN7k3IFODzDgL
	FduwERu9VmRpfmuGf7o30rvVO61f3yK3rO1DnmotOQR50cKw3Q49+moMFBH42g==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260203151013.305032-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <705908c9-4552-d808-783e-3ce0cf45bbff@manjaro.org> <20260203151013.305032-1-jerrysteve1101@gmail.com>
Date: Tue, 03 Feb 2026 18:12:37 +0100
Cc: alchark@gmail.com, andyshrk@163.com, conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, robh@kernel.org
To: "Jun Yan" <jerrysteve1101@gmail.com>
MIME-Version: 1.0
Message-ID: <f6eb572c-dd2c-9606-4fb5-b26b51bbbb06@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 3/3] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= Add OneThing Edge Cube series
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Rspamd-Fuzzy: 4d8686c9e18ae259edcb18fbfd3b0c43d48bb8492706122afcdcffd3f170db1beae6de266bce58e1b5874c7e84fd60e44ae1a487be8ceb28d76f935daafaea6c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_091245_560481_D68FCBA1 
X-CRM114-Status: GOOD (  27.63  )
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

Hello Jun,

On Tuesday, February 03, 2026 16:10 CET, Jun Yan <jerrysteve1101@gmail.=
com> wrote:
> > On Monday, February 02, 2026 16:04 CET, Jun Yan <jerrysteve1101@gma=
il.com> wrote:
> > > The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
> > > eMMC storage, and supports one SATA interface, one Gigabit Ethern=
et
> > > port, and one USB 3.0 port.
> > >=20
> > > Other than the difference in RAM capacity, the OEC and OEC-turbo =
are
> > > identical in all other specifications.
> > >=20
> > >   Specification:
> > >     - Rockchip RK3566
> > >     - LPDDR4X 2GB (OEC) / 4GB (OEC-turbo)
> > >     - eMMC 8GB
> > >     - Gigabit Ethernet port x 1
> > >     - USB 3.0 port x 1
> > >     - USB-C 2.0 port x 1
> > >     - 12V DC Power supply
> > >     - SATA 3.0 connector x 1
> > >=20
> > > These devices do not have a PMIC, and their hardware circuit desi=
gn
> > > is highly similar to that of the rk3566-box-demo[1]. Hardware sch=
ematics
> > > are not available at this time, with the vendor firmware dts avai=
lable
> > > for reference[2].
> > >=20
> > > Ethernet, USB 3.0 and SATA 3.0 ports tested, all working well.
> > >=20
> > > [1] https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/bo=
ot/dts/rockchip/rk3566-box-demo.dts
> > > [2] https://archive.org/download/wxy-oec-RK3566-4G-dump/wxy-oec-R=
K3566-4G-dump.dts
> > >=20
> > > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> > >  .../rockchip/rk3566-onething-oec-series.dts   | 312 ++++++++++++=
++++++
> > >  2 files changed, 313 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-=
oec-series.dts
> > >=20
> > > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/b=
oot/dts/rockchip/Makefile
> > > index 4d384f153c13..234fa53abe17 100644
> > > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > > @@ -104,6 +104,7 @@ dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-a=
nbernic-rg353v.dtb
> > >  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-anbernic-rg353vs.dtb
> > >  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-anbernic-rg503.dtb
> > >  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-odroid-m1s.dtb
> > > +dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-onething-oec-series.=
dtb
> > >  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-orangepi-3b-v1.1.dtb
> > >  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-orangepi-3b-v2.1.dtb
> > >  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-pinenote-v1.1.dtb
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-ser=
ies.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > > new file mode 100644
> > > index 000000000000..2007b93e190e
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > > @@ -0,0 +1,312 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/leds/common.h>
> > > +#include <dt-bindings/pinctrl/rockchip.h>
> > > +#include "rk3566.dtsi"
> > > +
> > > +/ {
> > > +	model =3D "OneThing OEC/OEC-turbo";
> > > +	compatible =3D "onething,oec-turbo", "onething,oec", "rockchip,=
rk3566";
> >=20
> > Thanks for the v3!  After thinking a bit more about it, it would be=
 better
> > to name the board dtb "rk3566-onething-edge-cube.dtb" and omit the =
"series"
> > part, because the only difference between the board variants is the=
 amount
> > of DRAM.  Also, "onething,oec-turbo" should be removed from the com=
patibles,
> > and the single compatible renamed to "onething,edge-cube", because =
I see no
> > need to have an additional compatible, which may be added later if =
really
> > needed for some unforeseen differentiating purpose.
> >=20
> > Also, it might be better to use "OneThing Edge Cube/Edge Cube Turbo=
" as the
> > combined name, because "Edge Cube" is more self-descriptive than ju=
st "OEC",
> > which may also help with various search engines down the road.
>=20
> Sorry for the quick follow-up.
> In official documentation (Most of it is in Chinese) from OneThing Te=
ch[1],=20
> the designations "OEC/OEC-turbo" are more commonly and widely used.
> for this reason, I propose retaining the "OEC/OEC-turbo" naming in th=
e model=20
> property.

I see, that's an interesting twist.  As some kind of a compromise, it w=
ould
be best to have the board dtb named "rk3566-onething-edge-cube.dtb" and=
 use
"OneThing Edge Cube (OEC)/OEC Turbo" as the combined name.  That way th=
e
board dtb name isn't too short, while "OEC" is present in the model nam=
e,
for search engines to pick it up, hopefully, and for people to see it i=
n
a few places. :)

> [1] https://help.onethingcloud.com/be81/OEC1/80c5


