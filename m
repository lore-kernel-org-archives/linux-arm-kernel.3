Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31863C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzbi36ITGsS4iWNXxtdP65zumc/0Hv+pIAeGTi+GcQ4=; b=bgMQPDAI0EnINl+dfJtzOENRcp
	++HI0kqSzrFR514YvSIZyA98JUtIn4i+D5IFCZ6yYPTSfe0zv8fItm1n2jcgeh40AfL5Ah8cBRd46
	V5qsnF1P9pzOoFSSL9DjvJE+F79UbJXx6zc6upx2Blt7pXbnMlwPkIyYjnVVGF9KLM0FzcmzT2ip7
	FyXkwYwnxRpPJhiVP2ZP6MzaDKq2k+20C/Jh550C8Dx5AH3vWBrbwdtyo+fRSW4++1L3lNSfvtTuC
	8l+6JPqH9U2rLFx/OiGuL/vLNmwD8BObpG2XBHaXm8wP9L89QwmeBCgVJ9/A/FnrSAQZu4/QbEWkW
	PeT4qhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YGF-00000001Avg-0cQ3;
	Mon, 21 Sep 2026 07:16:23 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YGB-00000001Aue-2nOP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:16:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DF96EC2C659;
	Mon, 21 Sep 2026 07:17:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D669E60339;
	Mon, 21 Sep 2026 07:16:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A850610329100;
	Mon, 21 Sep 2026 09:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789974974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pzbi36ITGsS4iWNXxtdP65zumc/0Hv+pIAeGTi+GcQ4=;
	b=AcujFY3uHm7+B7r1K++AlwOGnnnaQ6IU4z6IlMfOnRb/Rbb7s693ivo55BOAi8rpbWFYb7
	AJMthmWmZWixUW19PScUjnWdVmxbfZj/hiqx63zdpmcZ76XxfZ9C5N0aFwc3YQW6eNbfyJ
	W9ZPdRsgcyomRJWSgV2ft/aQqXVY/7Y/HYIi8BaFQPyk/1Fs5KGUK8tLKi+bLEm/ux4tvd
	qcid/BryvhoRufogP0l/4GxIEgglYPp+6R1uvwypfsJkQ/b32iRZBndLyq5nnLv+sbtsIT
	mhuvd67QwmP92llw1IOBVr+3lZQlxS8H4PGg4RrxtvV7qg3v0HkwAEbuFEOfOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 09:16:01 +0200
Message-Id: <DLKT61DMSLFT.JA03R1SO6WNU@bootlin.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Samuel Holland" <samuel@sholland.org>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Raphael Gallais-Pou"
 <rgallaispou@gmail.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Algea Cao" <algea.cao@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Liu Ying" <victor.liu@nxp.com>, "Phong LE"
 <ple@baylibre.com>, "Helge Deller" <deller@gmx.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v11 12/74] drm/bridge: Fix unlocked list_del in
 drm_bridge_add()
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-12-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-12-bc12954a0688@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_001619_888605_1B2C521D 
X-CRM114-Status: GOOD (  16.05  )
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

Hello Cristian,

On Tue Sep 1, 2026 at 8:50 PM CEST, Cristian Ciocaltea wrote:
> When re-adding a bridge that was previously removed, drm_bridge_add()
> drops it from bridge_lingering_list without holding bridge_lock.
>
> Both bridge_list and bridge_lingering_list are protected by bridge_lock,
> as they are concurrently modified by drm_bridge_remove() and
> __drm_bridge_free(), and walked by the debugfs 'bridges' file.  Running
> the list_empty() test and the list_del_init() outside of the lock may
> therefore corrupt either list.

The analysis appears correct, with a small nit: __drm_bridge_free() cannot
touch the list concurrently to other functions, because it only runs when
the refcount is 0, and all other functions tounch the lists only when they
have a reference. (Should this sentence be wrong, that would be a big bug!)

But definitely drm_bridge_remove() and debugfs can run concurrently.

> Perform both under bridge_lock.
>
> Fixes: 17805a15d175 ("drm/bridge: add list of removed refcounted bridges"=
)
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260723015004.1F5711F000E9@smtp.kern=
el.org/
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index afaae272347c..2c457ad74f3b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -454,8 +454,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  	 * in bridge_lingering_list. Remove it or bridge_lingering_list will be
>  	 * corrupted when adding this bridge to bridge_list below.
>  	 */
> +	mutex_lock(&bridge_lock);
>  	if (!list_empty(&bridge->list))
>  		list_del_init(&bridge->list);
> +	mutex_unlock(&bridge_lock);

The fix appears correct too, and consistent with the similar
mutex_lock/unlock() below.

So, with the "and __drm_bridge_free()," string removed from the commit
message you can add:

+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

