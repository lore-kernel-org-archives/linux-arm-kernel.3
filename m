Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA06C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoimUg/B3WMdwPjCRvv8ClMn1Rr3hFGXgkVjA9JOOIg=; b=L25YL6bhgOPyE9tkmkI7j4bzIi
	IzL9CqXVEr+P79mVwtSKiSH3z0SGIAVLgrexbl4t6i0qVgoJBpfr0AQ4xrZzmlLTTdE+ISJddyTiW
	ZT/oWcpcb9su8axM9J0peDYdvTBf0bVbYaKKR/rQppjb9Mw2ijrtEM4+UrDIiqFRYEpuzDklSwZVY
	JR1Dl6QcoBL1Rbw0V7Zl6IetUfk8JY8PhCO//wOd0EF5pn0D2gjL3IRQzyKJHOcjGR6Wp3S1f6JES
	UgN40Qcek7qZ0uL0h7dnfPFL8FXqgTqSXcnpUiWBO8vythM4WcffGaGS6C53iyMoTIdftYGcZxjiK
	IJiLdEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKP-0000000C7wX-3s69;
	Mon, 26 Jan 2026 08:52:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIKE-0000000C7uH-3kvV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:52:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E1A41A2A52;
	Mon, 26 Jan 2026 08:51:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45F5960717;
	Mon, 26 Jan 2026 08:51:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0EF6119A80E2;
	Mon, 26 Jan 2026 09:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769417515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YoimUg/B3WMdwPjCRvv8ClMn1Rr3hFGXgkVjA9JOOIg=;
	b=QedPXVXDwD6tu/9yJqyZ7TIZOoQUoEcFq8esUex1XnWQ/7sm1bFOA2z39idJnnow/kk7jh
	4bX3+4Bql4HHg0wqoLaFx8rcPJlzoP4Ec7NI8I1sc3nY7unHATPwtp81uuyUwggtYUNuVF
	I11hqr3BcWARPJ5sA2i+jelLE8m0w/eeN3y3bC4ZDSuxCIlAw/aivEBPr+4u20+WMlshVO
	qfnQreqggUqpQoXr5MSEXcPPNYDOPot6IY7nWQSIqHWMNv8qoIQB16jWyOB9bin6jWH+x+
	jXD8zr35RSom94S4/PC3dmjDMKQYOvxdKgb5Wjd4Lu4JkspNxzPyBAQyrPRTmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:51:49 +0100
Message-Id: <DFYE5QDGOF28.2S7XJ1IFZIMX0@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
 <DFYDRSZBQBND.QSY119QND1GE@bootlin.com>
 <42f86084-5200-4dc0-86a7-4719d7d19cf7@nxp.com>
In-Reply-To: <42f86084-5200-4dc0-86a7-4719d7d19cf7@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005159_071229_030D93C1 
X-CRM114-Status: GOOD (  15.09  )
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

On Mon Jan 26, 2026 at 9:47 AM CET, Liu Ying wrote:
>
>
> On Mon, Jan 26, 2026 at 09:33:38AM +0100, Luca Ceresoli wrote:
>> On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
>>> In case the channel0 is unavailable and bailing out from free_child is
>>> needed when we fail to add a DRM bridge for the available channel1,
>>> pointer pc->ch[0] in the bailout path would be NULL and it would be
>>> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
>>> pc->ch[0] before dereferencing it.
>>
>> Thanks for checking this code and providing fixes! These drivers have a
>> complex code path so I had a hard time in following the logic without ne=
ing
>> able to test on hardware. Apologies for the issues emerged.
>
> Thanks for your quick review and hard work!
>
>>
>>> Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the n=
ext bridge")
>>> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to de=
vm_drm_bridge_alloc() API")
>>
>> The bug was introduced by 99764593528f, while ae754f049ce1 is not changi=
ng
>> the bug, so for the sake of precision we can remove the first 'Fixes:'
>> line.
>
> I added Fixes tag for ae754f049ce1 because it is the first commit which
> this commit could be applied upon properly.  Maybe this helps some tools
> apply this commit or maybe tools are smart enough to find ae754f049ce1
> automatically?

Uhm, good point, maybe it can be a useful reference for the stable team to
backport the fix... Well, let's leave both lines then:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I'm applying this series perhaps tomorrow (if no one does it before).

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

