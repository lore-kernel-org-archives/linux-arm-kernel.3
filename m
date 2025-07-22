Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF1BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub61d+GKqIiiSUeXbA0wZ1Ao5bgA07c0VDrjVnS3nvI=; b=Pel3d7qIjgUDWAFon6Ojl845Qm
	nEloZCX1oBhs/Zd1cSVW7r/7LqOyEjaRiFp22rrF4z8NG/ws2BLJ7wnyGJJFWJxktaHtfwAKtEbOK
	2gzh+a2TOaIf4lLs7FVM2npHIkkXxooTmf2y6Klic/E7r0xn4xxx3I6/jhm9dHvIUcsCBDxewnUIs
	cUpHhEqzoDYWX46sKQlifU9COz+tPRrT0NcQjjizn64+ETly32gVFaT1PHlrVLuqEAw2pW3T81n64
	b6JrTXCyLLEkwE/s+jPcv3wvgN9z6BxZWm22nTmVCS7itibUSInvTFgiXNW0sN05p8wWOUmsGQr3W
	pmwz9sng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueANV-00000002Ato-0XR0;
	Tue, 22 Jul 2025 10:37:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueA6h-000000028xM-2Xc8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 10:20:25 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bmY8949v4z6GDDg;
	Tue, 22 Jul 2025 18:16:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6FA181400E3;
	Tue, 22 Jul 2025 18:20:15 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Jul
 2025 12:20:14 +0200
Date: Tue, 22 Jul 2025 11:20:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <hs@denx.de>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown
	<broonie@kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrei Lalaev <andrey.lalaev@gmail.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>, Conor Dooley
	<conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Grant Peltier
	<grantpeltier93@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek
	<michal.simek@amd.com>, Naresh Solanki <naresh.solanki@9elements.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring
	<robh@kernel.org>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: (subset) [PATCH v1 0/3] spidev: introduce trivial abb sensor
 device
Message-ID: <20250722112013.0000597e@huawei.com>
In-Reply-To: <2e9c96c6-6dfb-4232-a9ab-a3e78b718fc2@roeck-us.net>
References: <20250719063355.73111-1-hs@denx.de>
	<175311337130.327079.7374455187420344577.b4-ty@kernel.org>
	<d677ecd9-42d6-43fe-8fe1-a5afd4d270e2@kernel.org>
	<8a8106ea-83d3-e02a-9ae7-ea4a66e4c248@denx.de>
	<2e9c96c6-6dfb-4232-a9ab-a3e78b718fc2@roeck-us.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_032023_936910_EDBE9B5E 
X-CRM114-Status: GOOD (  25.71  )
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

On Mon, 21 Jul 2025 21:58:10 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 7/21/25 21:05, Heiko Schocher wrote:
> > Hello Krzysztof,
> >=20
> > On 21.07.25 18:24, Krzysztof Kozlowski wrote: =20
> >> On 21/07/2025 17:56, Mark Brown wrote: =20
> >>> On Sat, 19 Jul 2025 08:33:51 +0200, Heiko Schocher wrote: =20
> >>>> This series introduces the changes needed for trivial spi
> >>>> based sensors from ABB, currently operated from userspace.
> >>>>
> >>>> The last patch adds the spidevices to the DTS files, already
> >>>> in mainline.
> >>>>
> >>>> make dtbs_check showed no errors/warnings for the dts files
> >>>>
> >>>> [...] =20
> >>>
> >>> Applied to
> >>>
> >>> =A0=A0=A0 https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi=
.git for-next
> >>>
> >>> Thanks!
> >>>
> >>> [1/3] dt-bindings: trivial-devices: Document ABB sensors
> >>> =A0=A0=A0=A0=A0=A0 commit: aad2f87cbcab56b322109d26d7b11842a09df91f
> >>> [2/3] spi: spidev: Add an entry for the ABB spi sensors
> >>> =A0=A0=A0=A0=A0=A0 commit: d60f7cab7c04944a79af16caa43c141e780a59c6
> >>> =20
> >>
> >>
> >> That's unexpected, Mark. Patches received two objections/comments and I
> >> don't think discussion was resolved.
> >>
> >> ABB is huge company, probably making hundreds or more of sensors. The
> >> patchset basically claims that all of them work with spidev. It does n=
ot
> >> providing any model names or details, so it seems really incomplete to
> >> call them trivial devices. =20
> >=20
> > I do not know how many different sensors they have, nor if that departm=
ent can
> > speak for the whole company...
> >=20
> > What I have as information is:
> > https://lore.kernel.org/linux-spi/2477dc64-92a0-9dc9-d168-56646d0d796e@=
denx.de/
> >=20
> > and I get no more information about them currently. May I should
> > add some sort of trivial into compatible name? Something like
> >=20
> > "abb,spi-trivial-sensor"
> > or
> > "abb,spidev-trivial-sensor"
> >=20
> > which makes it clearer, that only ABB trivial sensor, controlled throug=
h spidev
> > driver, is connected here?
> >  =20
>=20
> FWIW, I always thought that devicetree is not supposed to contain such ge=
neric
> information. Is it even appropriate to list something like this in device=
tree
> in the first place ?
>=20
> If so, what prevents anyone from submitting hundreds of
> "<company>,spidev-trivial-<device-type>" entries, using the same line of =
argument ?

Agreed.  These should have separate compatibles based on what any OS etc
might want to bind to them.  Just because their model in Linux is spidev etc
that shouldn't mean a generic ID is appropriate.

Can we at least have some examples to motivate the discussion?

Jonathan

>=20
> Guenter
>=20


