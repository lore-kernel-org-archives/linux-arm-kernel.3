Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F140C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8+TuwKUE2XBa2SuyOFw2XhfA4p/VrA5lusEOG2wO70=; b=S9GeU7RWBE79smJknoFn/w6Zq9
	ZBGxHRIqwg/iBbih7/u+wEDnu6fIlxNy9OuUI/cQ05Fjbh16nTIqRhq/Eo7nZiqdy9uLggBaFRRkD
	uXjGuvaFWelBvK2Z/Ej1SoYZIsGm1MziU+S46vBuB8h6AbGoXmIiP5TaZsUN3YkYzQzFhQTz6FPL4
	JfZkprJ33z/rYwdXk5OZCickbOy1yj7gfl0oSCyjvjpGs0lSZ3BeZWhfsfYw+U9GgAuMtNfTAUw6v
	YSuFMjlys0/ncq/JzV/Ipm2uNegkMs8O/j7iK5+utAhFzPw2iPcdlD2mu4w3X29S/zpaMQ9tkdgTK
	OaSwxvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hFg-00000002tLr-0Cfk;
	Mon, 21 Sep 2026 16:52:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hFN-00000002tF9-1iL5;
	Mon, 21 Sep 2026 16:52:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C077D4E40755;
	Mon, 21 Sep 2026 16:52:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CF895FFB2;
	Mon, 21 Sep 2026 16:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C859C1032913F;
	Mon, 21 Sep 2026 18:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790009517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E8+TuwKUE2XBa2SuyOFw2XhfA4p/VrA5lusEOG2wO70=;
	b=DOj1Y41gnblEuUbAcpP3/m5HMMS+8CCXjkY0nVms96dcQJVAg6eDcUo/6D1ViLtXTvg/t6
	dHQ7g26/B+Pl8hrOF9+FnEzM5qlsuFK/Qpep/KPqvJrDNIsGzH497zB30KindqOD11tjQU
	sVWzDA/oXW+BOeMjwphAXxrivYUOp7/mV0KOP+uqH+upCyq8Ed6J8v95Zu+EatW8JEmDya
	EzYiR1FyK+9ONJTnTx+Ho5A5MA+ZZdNDlSTWwXpMDgv3vhSYT2XghlFtBaVDM5Du/0Vp9s
	nKPzT/Qx4U8tvu2vyp1PkjsWu18hnjG7QKoc6NyrPox5y8/8QrUygXcs4LqaSw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 18:51:49 +0200
Message-Id: <DLL5EWC41AQ4.ZVQI9FO4EEVN@bootlin.com>
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Chen-Yu
 Tsai" <wens@kernel.org>, "Samuel Holland" <samuel@sholland.org>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Raspberry Pi Kernel
 Maintenance" <kernel-list@raspberrypi.com>, "Raphael Gallais-Pou"
 <rgallaispou@gmail.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Liu Ying" <victor.liu@nxp.com>, "Phong LE"
 <ple@baylibre.com>, "Helge Deller" <deller@gmx.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v11 14/74] drm/bridge: Fix unlocked list access in
 drm_bridge_attach()
X-Mailer: aerc 0.22.0
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-14-bc12954a0688@collabora.com>
 <DLKTC338JONX.CQ6L7JYQ4UDD@bootlin.com>
In-Reply-To: <DLKTC338JONX.CQ6L7JYQ4UDD@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_095205_611971_60EC127D 
X-CRM114-Status: UNSURE (   8.53  )
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

On Mon Sep 21, 2026 at 9:23 AM CEST, Luca Ceresoli wrote:
> On Tue Sep 1, 2026 at 8:50 PM CEST, Cristian Ciocaltea wrote:
>> drm_bridge_attach() inspects bridge->list to warn about bridges being
>> attached without a previous drm_bridge_add() call, but it does so
>> without holding bridge_lock.
>>
>> The list head can be concurrently written by drm_bridge_add(),
>> drm_bridge_remove() and __drm_bridge_free() while they operate on
>> neighbouring entries of bridge_list or bridge_lingering_list, all of
>> them under bridge_lock.  Hence the unlocked read is a data race, even
>> though it is unlikely to change the outcome of list_empty() in practice.
>>
>> Perform the check with bridge_lock held.
>>
>> Fixes: 76f1a9711b83 ("drm/bridge: add warning for bridges attached witho=
ut being added")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

And tested with bridge hotplug:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

