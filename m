Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98190D116FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nc88QLJ8slhOZGqyb1L1tn4ejxMI+zK58HeNRPD/E8=; b=Gw+exbKS5DWRAJkW1Pz0jivFTV
	Cm/SlL/H1tp6Y4xA4w9DjmaPmnNqkoLZ00zaTA3G/yEZWKVaFH18PDLNnZFIb1Dzq575/+oizCKtg
	Pabf4oh8LihWKQ8RUbkWZ7fp9xjqlZziWcRZu9oV5XJHVM7ipl203dc1GLJxQ3Sk5V8YR7wxvyB9A
	9+rEcJCBW9WuloEey0AYtWJh4P72gePVUZnuVR5jKZN6bRa0bxvYcYGDf7vAXnA5/+7dazimDoTG0
	0L/XAW0PlX9bikYNgz8ss69KR+czUu9hGe4RPwOgKQRh7qSjfRdf5L/WwoeIfzzC+R8KV3u6GAvg7
	3bfJnkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMuW-00000005Aml-0BGi;
	Tue, 02 Dec 2025 09:43:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMuS-00000005AlV-27Sp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:43:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B07C4C17B73;
	Tue,  2 Dec 2025 09:42:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB700606D3;
	Tue,  2 Dec 2025 09:42:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D1331191926E;
	Tue,  2 Dec 2025 10:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764668574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/nc88QLJ8slhOZGqyb1L1tn4ejxMI+zK58HeNRPD/E8=;
	b=luL3/4bRTXFIbWvIwBfEed7pUNN7/ssl5FuJjKODqCSo0tPivEZGF1V67Il+A3Yd++cPeJ
	Jg5//gi3Ff8QjsPmqcFnotj76TblUPueFxRUHphX9oUzyKB9ZZUrZZGbT1e1nFtP0xekaW
	AFgZ38nzpFtzQAkeV1fXucv8UCauxYzWUU7su/NPjHnJ+8roc8d5sgNU1PFSfsjqo3rh7x
	SXYFaEH2FuArbM3b7RLuJEth00k8dflo6mbYRHtWTxTjcmoMJsTk3YP3kJKz3eGJYj2xb0
	x4UxIxtk4gMViAXbvOLITkaZveVuMCf8XG/yPhAsbtC9Gk6tWmkpwLUYBaOBCg==
Date: Tue, 2 Dec 2025 10:42:44 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, Jyri
 Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead
 of ti,tilcdc,panel driver
Message-ID: <20251202104244.59a9e83d@kmaincent-XPS-13-7390>
In-Reply-To: <3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
	<96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
	<3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_014300_700776_15EE4EA9 
X-CRM114-Status: GOOD (  21.82  )
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

On Mon, 1 Dec 2025 22:46:01 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 01/12/2025 15:13, Tomi Valkeinen wrote:
> > Hi Kory,
> >=20
> > On 26/11/2025 19:35, Kory Maincent (TI.com) wrote: =20
> >> Use panel-dpi driver instead of the deprecated tilcdc-panel driver in
> >> preparation for removing the tilcdc-panel driver and binding.
> >>
> >> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> >> ---
> >>
> >> This patch is not tested. It would be nice if someone with one of this
> >> board could test and validate it.
> >> ---
> >>  arch/arm/boot/dts/ti/davinci/da850-evm.dts    | 26
> >> +++++++++++++------------- arch/arm/boot/dts/ti/omap/am335x-guardian.d=
ts |
> >> 25 +++++++++---------------- arch/arm/boot/dts/ti/omap/am335x-pdu001.d=
ts
> >> | 21 ++++++++++----------- arch/arm/boot/dts/ti/omap/am335x-pepper.dts=
   |
> >> 22 +++++++++++----------- arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dt=
s |
> >> 25 +++++++++++++------------ arch/arm/boot/dts/ti/omap/am335x-sl50.dts
> >> | 25 ++++++++++++------------- 6 files changed, 68 insertions(+), 76
> >> deletions(-)=20
> >=20
> > Doesn't this, or rather the following patches, break DTB compatibility
> > with all the above boards? =20

Yes, I know this but I still wanted to try and begin a discussion on this, =
as I
really thought it is not a good idea to add and maintain an new non-standard
panel driver solely for this tilcdc panel binding.
I have gathered more arguments on this topic on next patch.=20
=20
> Stuffing DTS change in the middle of the driver change tries to hide
> impact, which is not nice on its own.

As it needs driver change before the removal for not breaking things it can=
't
be done at the beginning of the series.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

