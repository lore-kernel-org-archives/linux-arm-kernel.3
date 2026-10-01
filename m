Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD1CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGiWo6C+ycX09EU8H32CDb7AmZmrCKj9IV2lN2Mp/Hk=; b=E4Ty7q7yTGGGkGLC5ZETg5A3JX
	Ck/E+IjsUdB9lBRT96BQ68nvlUxJW9V2S8G2mqxbQkcXgBUm8si4XPe1n/0qURwXoT++XfbZxQAms
	j6qf5O5YhkXZ/XoRy51zssBpIEZc93rZYw8q7NB77FrlFQDhgEdj/oePfUZYBOhRUsYkG3W04j3NG
	s6Zm2AAO1iSKTy/o5bXTP0slIjOm6QIu9DGJzobQ5MdTWhMOqtnIF6FMRPm5gsiRrhvlMi4QDAdM2
	mOnIeMzmdKj7wFUrK49B/GTp5S6CcRA1ptc+EXMmHNTL1W/o55TKmZoWBvfOKNfJbo+14+u4OJMWr
	1TvdRNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ2p-00000009aP6-1Mty;
	Thu, 01 Oct 2026 15:50:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ2k-00000009aNq-11DQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:50:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 23B291A1360;
	Thu,  1 Oct 2026 15:49:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E56BF60343;
	Thu,  1 Oct 2026 15:49:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAD94103282D5;
	Thu,  1 Oct 2026 17:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790869792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uGiWo6C+ycX09EU8H32CDb7AmZmrCKj9IV2lN2Mp/Hk=;
	b=ieDfAB85stwwyZZSONxP4MucbdJVdGaD4CpTNy0XtKFsHuWU+pNP8OS+xoLFHBrWXaM/Vp
	1WYzN+Wc8w6iie1fbCnX32LrMk6e5YzcWJnq1SKuenvHkWs0XZytGUfVprH2foGRrwKqBn
	ZWNyWpZxptuyAsWuQ/dcVlL7W+hgLx0KBfqpf8PflbL0Np7aC6MD86rEJaMHhGC2TF9P+T
	pzorWpQcNQpiRbvbXIEUJXHGri4D5wGd1qywEMeZGLxL3XLDuoBwXb6DIiZNK3lK0/BF0j
	PPDx1NfHnVBER6DpUYsTEn45LfFjbpasGktZ1AsxhDb/j1/C1zMS+rJOgrwA7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 17:49:39 +0200
Message-Id: <DLTMCR2DR484.2J56NLPQEQO3M@bootlin.com>
Subject: Re: [PATCH v2 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Doug Anderson"
 <dianders@chromium.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>
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
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_084958_423590_1206753C 
X-CRM114-Status: GOOD (  11.38  )
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

On Tue Sep 29, 2026 at 3:39 PM CEST, Luca Ceresoli wrote:
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

Patches 1-4 and 7 applied to drm-misc-next. This includes all fixes to the
known regressions.

The two missing patches (5-6) are improvements, not bugfixes, and have
changes requested. I will send a v3 later on.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

