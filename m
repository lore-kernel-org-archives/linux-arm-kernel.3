Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41A8CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTahn3OCQfrZM5NApRyAEMP67DTIGs+u7+3aS8XJ5nU=; b=WuSglQ92PH7LutmBUDpmRHmsit
	Ym4tcnBoQVlF3UcHhnrXGLq7yE6odwJctwSFpJ4Al6GEdvDCU7zwGszvDpuXXt9yTAOBtb4YkrWDA
	VcAPgJnkxXKPG47Lhs4/CtEANn9DuYCuYhLSy4MMyPksMBK9UEmk/ZGppkHqsrQTq4pxitwVtTyk+
	p7rP3gA+IYQDGFKxXAZ0BhD3HxFnSu7+hOMR9FPMLhzj78ejZvs4sGU+ZZhtQGxK8EYuz5YOil7Qc
	8FTXNJ5wqsa0/NhYMiN+Te8xxvYMKWcCZR7BpoQo1Ins4k6NwSg4w1l/90aPQrP2UZUyhKXQZN3gP
	tctbMHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXjU-00000003elE-3nUS;
	Tue, 29 Sep 2026 13:18:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXjR-00000003ekO-0VjF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:18:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1C524E410B5;
	Tue, 29 Sep 2026 13:18:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B59C601BD;
	Tue, 29 Sep 2026 13:18:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8661210328354;
	Tue, 29 Sep 2026 15:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790687927; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HTahn3OCQfrZM5NApRyAEMP67DTIGs+u7+3aS8XJ5nU=;
	b=oQ3OHl0FvATBzcm419B9LA8f74qyf9KUlR9Ue7tTB/ndleZdO5uhgjuozrZKYrB8Syr3Fd
	EqOKL9eS3wSd1DCvdU/bGNtt+ibwe5nzKtn+TvDt9Pp0AyBzuvYLd5A2flgxD2t9e85VJ2
	Z+QzYx6L96UWbRVv5aCIwObWUGI77VGkxZHP7mq7pxferRqQPBEM0fBCf31UxCF4mcqOR7
	jFUkKJP+Sg9SbvQ7o4Aza0J0Nv+2r/qmVdbBSNv0UiPoJufJh0rM4CA8Q9Qe3WJBWnGdOB
	+4obJ0y6HPH8/53+1gG+BNlB42Z9vaRipb8kbTDCr9OL5mwzRRGMEJ4EG1M5yw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 15:18:35 +0200
Message-Id: <DLRTVZPMORU3.1FBSI0I9UQBM2@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Doug Anderson"
 <dianders@chromium.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
X-Mailer: aerc 0.22.0
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_061853_324617_3D5925AB 
X-CRM114-Status: GOOD (  12.28  )
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

Hello,

On Tue Sep 29, 2026 at 12:36 PM CEST, Luca Ceresoli wrote:
> After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to
> drm_panel.c") some drivers fail building:
>
>   error: implicit declaration of function 'devm_drm_of_get_bridge'
>
> This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge()) have
> been moved to drm-panel.h.
>
> The affected drivers are those which:
>
>  * can be built without CONFIG_OF, and
>  * don't include drm_panel.h
>
> The affected drivers are 3, fix them (patches 1-3) by replacing the
> deprecated *_of_get_bridge() calls with of_drm_get_bridge_by_endpoint().
>
> While there, do the same for all drivers which be built without CONFIG_OF=
,
> even if they don't fail (patches 4-7).
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

In the rush for sending fixes I introduced some bugs caught by sashiko,
mostly of the kind "bridge ref will leak if this function fails later". I'm
sending a v2 in a moment.

Sorry I guess I have to remove the review tags received. :-/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

