Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE535C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSwoV7JYFKwWDkDL4IDFclIBqtgIii8ZsKhV2r0CgdE=; b=aaLRpD71v4h4XKhwic6piFHjlf
	pIPBmpbHqz0+AmU74eURvLJc3rutktKkjzlIjV5CSjVauKbQKvW2AvseecHcyR0H6kpUc/PZaAXha
	4SvYU2XNrwBz26/WpluxGpMGUwvUdTqrP1tDNev8gYc2mjFcce6Aa7mjyQqZCyB6MIaRvQayvNI63
	hWLYezjjGl+IYfXHRGLuoWVeLiXc9Nc60uX1TIjJW3ivRytN41RFWvMPttVJztV4ixB4SopCZFlNr
	6AaPi+nA2IixFJJ2maKQEglU/jUqUf7g6kzNb50W54c48Tw3v4OeDWCQNqDIBNGKZFIFXKdQw5nXa
	7s265Uiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hFE-00000002tBw-3IWC;
	Mon, 21 Sep 2026 16:51:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8hFA-00000002tAG-3epI;
	Mon, 21 Sep 2026 16:51:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46F5E4E40755;
	Mon, 21 Sep 2026 16:51:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04BCA5FFB2;
	Mon, 21 Sep 2026 16:51:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59E35103291BD;
	Mon, 21 Sep 2026 18:51:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790009502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cSwoV7JYFKwWDkDL4IDFclIBqtgIii8ZsKhV2r0CgdE=;
	b=IjYWD3xIKW0KiAwSGgakYrxt0r+vUYd0qxiCiN/UWCsb/Lzv6F9MRJMiln7kdo9fS0L97I
	MsXakBjOTJ1+zKqPla6JTpP36tNNijKQuc05p4N/sYCzdy/c7URDCf+uJa5rryyF/pGD5K
	CvqGwT/3RpwqR10lvWnK934ts0XBX+qWLGQw+t4WaJu2BG8/qPF+HiQ1510dHvF6L28CmX
	ioTpVmqh4beeqW3L3IIl55sutm8DOpW/zT1po1oe7QbGwrjZOVXRXmuApmKzwv2DLncD2H
	1SpLtpGpNxBgOe0ek/Ku+tmxFQw0ujiCLjuQSMInGOlC5v95Mxni3AZCvi3qHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 18:51:25 +0200
Message-Id: <DLL5ELBGGCIU.3LL2QIE4I4MDS@bootlin.com>
Cc: <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
 <linux-fbdev@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
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
Subject: Re: [PATCH v11 12/74] drm/bridge: Fix unlocked list_del in
 drm_bridge_add()
X-Mailer: aerc 0.22.0
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260901-dw-hdmi-qp-scramb-v11-12-bc12954a0688@collabora.com>
 <DLKT61DMSLFT.JA03R1SO6WNU@bootlin.com>
 <DLKT9WH655L4.37F4JBC3Y14D8@bootlin.com>
In-Reply-To: <DLKT9WH655L4.37F4JBC3Y14D8@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_095153_065366_07A95136 
X-CRM114-Status: UNSURE (   8.36  )
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

On Mon Sep 21, 2026 at 9:21 AM CEST, Luca Ceresoli wrote:
> On Mon Sep 21, 2026 at 9:16 AM CEST, Luca Ceresoli wrote:
>> Hello Cristian,
>>
>> On Tue Sep 1, 2026 at 8:50 PM CEST, Cristian Ciocaltea wrote:
>>> When re-adding a bridge that was previously removed, drm_bridge_add()
>>> drops it from bridge_lingering_list without holding bridge_lock.
>>>
>>> Both bridge_list and bridge_lingering_list are protected by bridge_lock=
,
>>> as they are concurrently modified by drm_bridge_remove() and
>>> __drm_bridge_free(), and walked by the debugfs 'bridges' file.  Running
>>> the list_empty() test and the list_del_init() outside of the lock may
>>> therefore corrupt either list.
>>
>> The analysis appears correct, with a small nit: __drm_bridge_free() cann=
ot
>> touch the list concurrently to other functions, because it only runs whe=
n
>> the refcount is 0, and all other functions tounch the lists only when th=
ey
>> have a reference. (Should this sentence be wrong, that would be a big bu=
g!)
>
> Ah, no, I just realized my concern does not stand. Indeed
> __drm_bridge_free() can run concurrently on a different bridge than the o=
ne
> being handled by other functions, ending up in modifying the same list. S=
o
> your comment is fully correct:
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

And tested with bridge hotplug:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

