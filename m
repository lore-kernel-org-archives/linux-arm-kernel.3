Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9304AC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdCzhVsNXpe5AUC2cbbE/8xzVg3QlWI9Hb+MzbVyv/U=; b=eQrDJz2lLXw33YAvgH/GuDbHwb
	oZ/eb6FSq3w++Om0zWfuGh+i3ZmwzyMOyFpL/n9reRzN63TiGxEWjO8k9G9jNQpNjZQPSwvOikKpz
	xPabrkyHAXesUVy1zFghz4G0/rt4zdX9xHVzkkjmpgDA5qPyosZFtxh0KPQXlPZR9WZu3/yqWUgGU
	17eIHyFU+oWyzz2ognmiGEW1qA1iSlan6Rq19JQjdmYyZ81cD+OG7tFhfKEuxOyAuDekU8GANscQi
	EC1T9d6t+YI3B8yBFwQSxhXKP+1FuClZPHFm9OaEREzJqfrrzcur50Essli2yuwtmnIE78nVSNyx0
	2SuUbPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBO7-00000001pV5-3dWn;
	Mon, 30 Jun 2025 10:05:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWB9W-00000001nUd-2ndk;
	Mon, 30 Jun 2025 09:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=fdCzhVsNXpe5AUC2cbbE/8xzVg3QlWI9Hb+MzbVyv/U=; b=OKbbifEZUNsRrPyg/milb2gP6P
	Lo2KatzmVJ+9ENyCsgIIQ5f4iQPQ1FOk5hemSdMqb+pbAsqtHLlUqf6VAhM1MOqOWy/GeDHNBy5xf
	ZIUEYXZdhdvfFeM4fDtf4+9FWUkluhSmHBG1yhA7ridYmCy63fgzTmHa5FGFfxJyWeUxaIuYM9Oot
	F4FbPP8wwK1npthTkVx3BkLHcVhJUZ5YpYbqPSDxHm7As9nAoXivSp4o6DHeFxxndUy/THVqBI3KW
	jbAN4pP3/DaJxjgM+nz6G3CaOhLIKUKEWuxejLgRMmHfNUVpXjeKtrK4f/3HCHy7Cm4Wb2Ua3XUKy
	s0DXQP7g==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB9Q-0006dy-Kw; Mon, 30 Jun 2025 11:50:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nicholas Roth <nicholas@rothemail.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
 ~diederik/pine64-discuss@lists.sr.ht, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH v4 0/4] Describe the cameras in the PinePhone Pro dts
Date: Mon, 30 Jun 2025 11:50:11 +0200
Message-ID: <7067942.rnE6jSC6OK@diego>
In-Reply-To: <aFknh7weIKoGKajQ@kekkonen.localdomain>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com> <13788127.uLZWGnKmhe@phil>
 <aFknh7weIKoGKajQ@kekkonen.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_025018_707362_6F184D72 
X-CRM114-Status: GOOD (  30.13  )
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

Am Montag, 23. Juni 2025, 12:08:07 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Sakari Ailus:
> Hi Heiko,
>=20
> On Mon, Jun 23, 2025 at 12:05:22PM +0200, Heiko Stuebner wrote:
> > Hi,
> >=20
> > Am Montag, 23. Juni 2025, 08:47:44 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sakari Ailus:
> > > Hi Olivier,
> > >=20
> > > On Fri, Jun 20, 2025 at 05:21:31PM +0200, Olivier Benjamin wrote:
> > > > This series adds support for the Pine64 PinePhone Pro's rear and fr=
ont
> > > > cameras in Device Tree.
> > > > This is based on some of Ondrej Jirman's patches hosted in his tree=
 at
> > > > https://codeberg.org/megi/linux, but I have also fully reviewed and
> > > > re-written the code from the RK3399 datasheet, the PinePhone Pro
> > > > schematic, and the IMX258-0AQH5 software reference manual.
> > > >=20
> > > > I have tested these changes on my PinePhone Pro and am able to take
> > > > photos from both cameras using libcamera's cam.
> > > >=20
> > > > This series has raised a question about the proper label name for t=
he
> > > > front/user camera and rear/world camera for phones.
> > > > This series is using "ucam" and "wcam", which is used in a few other
> > > > Rockship DTBs:
> > > >  - arch/arm64/boot/dts/rockchip/px30-evb.dts
> > > >  - rk3399-gru-scarlet.dtsi
> > > >=20
> > > > Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> > >=20
> > > Thanks for the patches.
> > >=20
> > > I've picked the first two in the set, presumably the rest will be mer=
ged
> > > via another tree?
> >=20
> > correct, and with the first two being applied, I can now also safely pi=
ck
> > the other two :-)
>=20
> Once in my tree, they'll next end up to the media committers' tree and
> after some time you should be able to find them in linux-next. This proce=
ss
> will take some time. Just FYI.

thanks for the heads up :-) .

So I'll give that a bit more time for the bindings to appear.

Thanks
Heiko




