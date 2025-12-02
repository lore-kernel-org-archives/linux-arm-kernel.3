Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C5DCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WArC6OL7B5oE8PIh2iIwHlwHZM8BzUleCfIFcquPlo=; b=FuMOylliX4QD76GUTNVqfECOzT
	aOcMNkWm8K2x+zg608uClOUn0dtIsTlfUpDLUAY0yYwkBJQjeo9hObv3AbVK2CwIMAHECzebhp62y
	dOXOpZcVFssdtaTC6XCK1oLDkG6ryFlCJWxTC1U1uNwlhA9rW3LzOsu7FjvMpLnKtDlpUNb0pIcpr
	qTaZQsVr7YGo7bxXOfPLnoBl4uKgqIAQENdA+EMZ9zd/9WaRn7kpyoBpvYflHpcvQFiFfBiHwO6eh
	sOrpIJNLmQg2maB2LuDfBrfvEqhrkMKxuV21pFwbpWdTw5XIH69sRPwgcWATcBUU8EMibT0s9eNx/
	rO4TakUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNs2-00000005HHv-0FGX;
	Tue, 02 Dec 2025 10:44:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNry-00000005HHA-2vAn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:44:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6610DC17B75;
	Tue,  2 Dec 2025 10:44:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A15E606D3;
	Tue,  2 Dec 2025 10:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE85011919314;
	Tue,  2 Dec 2025 11:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764672266; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/WArC6OL7B5oE8PIh2iIwHlwHZM8BzUleCfIFcquPlo=;
	b=FtnTHSwh6bzVp73JDyCQFjgNMIlM5eLYd+3FXKT7elsm4qRBny30F1dBtB29Suhn3NgITk
	diL67dbtxwV+ZPjgkzDG1R71lWJ95juqtacKFa4RU8WskRM38yVS6cimNXjdODZa5F+uKr
	ov/cCVLaIGzi2a/T6Y/zf41/fM0V50MKqlOdR54nbNh2gTE4R8A51GanPP2Jh09yUkQDu7
	n67eXSZUpENq/FSdx8XqY+zmY5iiiyAdOJ+KNmYc5qif1zZs9KkJLtW7QCdaKTehC65iXZ
	CqFMog159pU4iZOSB4kdfjknae5dRsK0v4OViBEBmHYY9YvJaupvVg9xd9NB9A==
Date: Tue, 2 Dec 2025 11:44:16 +0100
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
Message-ID: <20251202114416.09624a4b@kmaincent-XPS-13-7390>
In-Reply-To: <d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
	<96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
	<3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
	<20251202104244.59a9e83d@kmaincent-XPS-13-7390>
	<d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_024431_240992_ACF62B1A 
X-CRM114-Status: GOOD (  15.51  )
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

On Tue, 2 Dec 2025 11:28:55 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/12/2025 10:42, Kory Maincent wrote:
> >   =20
> >> Stuffing DTS change in the middle of the driver change tries to hide
> >> impact, which is not nice on its own. =20
> >=20
> > As it needs driver change before the removal for not breaking things it
> > can't be done at the beginning of the series. =20
>=20
> And that is the problem which should stop you there and rethink how to
> organize it without impacting users. DTS cannot go via DRM. If that was
> your intention, that's my:
>=20
> NAK

My intention was to raise discussion over the ugly and legacy tilcdc-panel
binding and what to do with it. But it seems you don't want to, that's a sh=
ame.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

