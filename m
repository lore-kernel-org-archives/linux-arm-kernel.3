Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E67E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMiEkVL3eBQjdfYa6SkIz02+65vfb5URR/rIDc4YUWc=; b=JFNUYiCwrBY8WgvtxJQ7HGA/1t
	+GJfFpZJ2NpwUpdKCrsyPQMoQUl/tsygAMuGkBo56hHS2W7NE/kt4Dv+5UAp9ZGO6bL41vo5XQnpR
	Eu1iQblvOEjDUzlkFMJnhkAPHGzO/ciiz1ogn9MNzpivkc6PqCuTHb4/neR4ib/dm6TzoOJvXH2CK
	bKjzGC8oj83iYbFZVIRIMBklKwj4gyg9/wE7o+qtp3T3iew5T85b4cpqm5rGMD660aHiQ+b/01bNc
	X1F+T64FCLZHBiAyIeEdC80JSLPCxH7VEbxTAsMgrTNXFNN+a97S3w/xF6mDv3p8gRNcwID+wNtk/
	b957vnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUMP-0000000D1mP-3l8g;
	Tue, 17 Dec 2024 09:59:25 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU1D-0000000Cx1z-0bkK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:37:32 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tNU0y-0006bG-N7; Tue, 17 Dec 2024 10:37:16 +0100
Message-ID: <8956e0daffc89f8c6791f8a53b1666ca31011a45.camel@pengutronix.de>
Subject: Re: imx8m-blk-ctrl: WARNING, no release() function
From: Lucas Stach <l.stach@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Peng Fan <peng.fan@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, Marek Vasut
 <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jindong Yue <jindong.yue@nxp.com>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Paul Elder
 <paul.elder@ideasonboard.com>,  =?ISO-8859-1?Q?Herv=E9?= Codina
 <herve.codina@bootlin.com>
Date: Tue, 17 Dec 2024 10:37:14 +0100
In-Reply-To: <20241217094219.788cad88@booty>
References: <20241212141003.GA44219@francesco-nb>
	 <PAXPR04MB8459AB53B142CB43782757D988042@PAXPR04MB8459.eurprd04.prod.outlook.com>
	 <20241217094219.788cad88@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_013731_181140_F409A57F 
X-CRM114-Status: GOOD (  13.33  )
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

Hi Luca,

Am Dienstag, dem 17.12.2024 um 09:42 +0100 schrieb Luca Ceresoli:
> Hello Peng,
>=20
> On Tue, 17 Dec 2024 01:39:09 +0000
> Peng Fan <peng.fan@nxp.com> wrote:
>=20
> > > Subject: imx8m-blk-ctrl: WARNING, no release() function =20
> >=20
> > Please try this patch.
> > https://lore.kernel.org/all/20241206112731.98244-1-peng.fan@oss.nxp.com=
/
>=20
> I cherry-picked the two patches from linux-next:
>=20
>   e1a875703470 ("pmdomain: imx-gpcv2: Suppress bind attrs")
>   afb2a86f002b ("pmdomain: imx8m[p]-blk-ctrl: Suppress bind attrs")
>=20
> but I still have the same warnings:
>=20
> [    5.427038] Device 'mediablk-mipi-csi2-1' does not have a release() fu=
nction, it is broken and must be fixed. See Documentation/core-api/kobject.=
rst.
> [    6.464219] Device 'mediablk-mipi-dsi-1' does not have a release() fun=
ction, it is broken and must be fixed. See Documentation/core-api/kobject.r=
st.
> [    6.752903] Device 'mediablk-mipi-csi2-1' does not have a release() fu=
nction, it is broken and must be fixed. See Documentation/core-api/kobject.=
rst.
> [    7.303529] Device 'mediablk-mipi-dsi-1' does not have a release() fun=
ction, it is broken and must be fixed. See Documentation/core-api/kobject.r=
st.
> [    8.006575] Device 'mediablk-mipi-csi2-1' does not have a release() fu=
nction, it is broken and must be fixed. See Documentation/core-api/kobject.=
rst.
> [    8.598453] Device 'mediablk-mipi-dsi-1' does not have a release() fun=
ction, it is broken and must be fixed. See Documentation/core-api/kobject.r=
st.
>=20
> This is with 6.13-rc3 on a imx8mp.

As far as I can see this isn't emitted due to the blk-ctrl device
itself missing the release function, but from the pseudo devices used
by genpd to control the power of the secondary power domains.

I think this needs to be fixed in genpd itself. I'll take a look.

Regards,
Lucas

