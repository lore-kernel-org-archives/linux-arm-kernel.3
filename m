Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5281C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwBZWncXMFHUNfKxRF00wCCVLbZJy1TDoDay/M48Z+I=; b=vi8TsY6yHWil0w3ju7xUWBH2Zb
	N+9WwfZ0DfFHuC1nn8Q+BzVglJjD0sBrM63CqOyWyDaLG0pf3mOWrCU0bL29BlOe1+qDDNfNQmEuU
	5fKpX2mNku4jO2oaK4iciaTm0gL669VLi4g4ZzhQUFKNALvXLMLQ/ygpN2tjaXPmS4LrjtfqAgT/e
	PBcS8YegTm/n5w7CKhi+AXe9MMsVMnqc3WTkLNjtb1ZRVz88CwkiWpgEyClH0O5uQQCs+f8n3CNdA
	t/PNJBW+ETZMm12YsNOK+JeMb48g61zYrHWtPkdj2VBOozjlLx9D0wXnyyLPxGQOYNTuj6CDoZYaF
	MmXJTL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTet5-00000002Sts-0UTE;
	Mon, 23 Jun 2025 10:58:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe3N-00000002Hpo-2UZE;
	Mon, 23 Jun 2025 10:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CwBZWncXMFHUNfKxRF00wCCVLbZJy1TDoDay/M48Z+I=; b=L86h1ro29XqjaL+eCgRkkXLern
	75+0ic4ZPZQA9jgsZHU+m6s6A2g1sjBn8ch86nVuI/mPsm+t10x6oPsYBhqLPIQIrNtzVhkQykPlD
	GS6K5lvxSgSfYFgxVCGxHbCyZJr9sJG8cHlMxOsXGWp3xZSWPA+YRD0J0ug3eUzpFk8RG8q4SVWqQ
	TOR2KrK1AeFq1O+2IjRT6Sxz8JfV9KsVPDxIse6QRLv8ohmlIyxP9kaPKQw4t3nnlQoZnyzyHIkQL
	h6O0JmWJF9FZOYiJ72bt6fz7XaHXYoqvT90EPSJ6+HRhkGFcR9xFgmumcVFR0doDchPrQUOcr2uVj
	k3uVs64Q==;
Received: from [185.15.108.45] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uTe3H-00084G-Br; Mon, 23 Jun 2025 12:05:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Date: Mon, 23 Jun 2025 12:05:22 +0200
Message-ID: <13788127.uLZWGnKmhe@phil>
In-Reply-To: <aFj4kAXEhrR4Wbnz@kekkonen.localdomain>
References: <20250620-camera-v4-0-0201a8ed5fae@bootlin.com>
 <aFj4kAXEhrR4Wbnz@kekkonen.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_030529_635615_CA0B1B99 
X-CRM114-Status: GOOD (  21.61  )
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

Hi,

Am Montag, 23. Juni 2025, 08:47:44 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Sakari Ailus:
> Hi Olivier,
>=20
> On Fri, Jun 20, 2025 at 05:21:31PM +0200, Olivier Benjamin wrote:
> > This series adds support for the Pine64 PinePhone Pro's rear and front
> > cameras in Device Tree.
> > This is based on some of Ondrej Jirman's patches hosted in his tree at
> > https://codeberg.org/megi/linux, but I have also fully reviewed and
> > re-written the code from the RK3399 datasheet, the PinePhone Pro
> > schematic, and the IMX258-0AQH5 software reference manual.
> >=20
> > I have tested these changes on my PinePhone Pro and am able to take
> > photos from both cameras using libcamera's cam.
> >=20
> > This series has raised a question about the proper label name for the
> > front/user camera and rear/world camera for phones.
> > This series is using "ucam" and "wcam", which is used in a few other
> > Rockship DTBs:
> >  - arch/arm64/boot/dts/rockchip/px30-evb.dts
> >  - rk3399-gru-scarlet.dtsi
> >=20
> > Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>=20
> Thanks for the patches.
>=20
> I've picked the first two in the set, presumably the rest will be merged
> via another tree?

correct, and with the first two being applied, I can now also safely pick
the other two :-)

Thanks a lot
Heiko




