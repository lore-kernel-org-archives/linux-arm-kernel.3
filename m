Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA9D29C41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1BMxjGrcSHHZi9/Yr11G0UX17OdQCikby1y4gUI09I=; b=NthF7UT5iLcZvsrWitS+e3Z5qL
	+l/lnmIpITIu7s06tlKcKm6W1DyvoaA52n0KBt9y58N/Wl+FOVOTmfHCfiV1hejXVhFfzBDA4TerF
	JDrSv0dEIbCk5DqtqtaaZZlCwFv0GVQAzHjkfAvf4e7DJO6OGv8WP7LyI1bGvKabkmqgCh9JiAtn7
	vRBsp7VluShIT7MY5tnnTpCIJ3TjE7RLbyKgfccFTqc/s9YuPt3U9xmpFnJQOa8gX/v5Es2TK/o4m
	8gGqImBgPnf0JOgPHxxj/E6prysFgGWUEelYIjv2t+9n6RPrmc23v9DYJN/celRTmBn+3q5g4D1Rx
	iluiKlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxy-00000002Rkp-1YTm;
	Mon, 19 Jan 2026 16:18:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrxY-00000002Rdq-2Djc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:18:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 12F5E4E42176;
	Mon, 19 Jan 2026 16:18:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBFD060731;
	Mon, 19 Jan 2026 16:18:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90B5810B6B157;
	Mon, 19 Jan 2026 17:18:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m1BMxjGrcSHHZi9/Yr11G0UX17OdQCikby1y4gUI09I=;
	b=IsIoNX19wW3fBEBYFPCNIYlfr7IqOroFHFj/s/A6LaaTaV13TtTM/6A/QaoX4Ndbw7bRyW
	gOIsAqIlL0G083Lwec87VIY4IsUSizWSLl1sUlwXaIAyQ5ELvFM/rYr3qDtCdEIpqBuK3N
	ebuv2//VcfIxyXvjr75c6P0pk2LCXNdBtXbdq+ekKUb9hlaxc6PfGN3n9c0fX061/AK6Ql
	WlREvzcy8HWNuVeL+XALNCpFH32waywDfxUSBfoCT/Df9nUNufAnFjfkuXyeOx7jrABgHI
	rmOVdXq8l6R2ePv0KfJfjPuJcXrGF9uBgVRk8jIyZliOAPauuAyOMUVakn6nhA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:26 +0100
Message-Id: <DFSP9V5ZJM1G.1MMOSI2T6BBHA@bootlin.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 15/25] drm/tilcdc: Move tilcdc_init/fini closer to
 probe/remove
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-15-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-15-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_081832_699604_3DD93266 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Move tilcdc_init/fini functions adjacent to the probe and remove function=
s
> in preparation for cleanup and modernization. This improves readability
> for subsequent commits that will refactor these functions.
>
> No functional changes, only code reorganization.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

