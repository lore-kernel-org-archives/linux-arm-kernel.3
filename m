Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D4DCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzklC7KBIiORDiPpvxIA/RiOGT5I3aaT1J/z+yclQsw=; b=QxvDEY5NixI7vF1vEwzb5z637Z
	ZpTyTO+RwiNvyDbbsJqHnZi/DBg3cYZAWhvdFoMrp3KRjkREiEjbPTaIXjtpMjaEK09nd2rC8MUIs
	bjjt38h9A5otPB+DJIqLrNChXhKvLCdAuld4jCsvqqh9egOle2BxbQ2HxFWT03F//t62S5G3lNPTv
	kLpIkOC9cSnbZgvMsyoZzZDweOcX5Xc1FE8aaWuKJ0HX6JqErNfri26bWeLam0wqJD96AAqUWBVL/
	UBwjxl5Zsf8hFCRb5HVolXgBn0voeMBf5USU2SznA4h4Q/nH5EywAHoJ67zszZZSXFFmG8VrEwosX
	PtmyvhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgS3-00000008uce-3wBg;
	Thu, 25 Jun 2026 09:32:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgRz-00000008ubn-3hmZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:32:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF6481A0997;
	Thu, 25 Jun 2026 09:32:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B48175FF03;
	Thu, 25 Jun 2026 09:32:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A91F8106F07A6;
	Thu, 25 Jun 2026 11:32:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782379962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzklC7KBIiORDiPpvxIA/RiOGT5I3aaT1J/z+yclQsw=;
	b=NVv/0kRPnXsXfA3t4Z35KoZxhi4rXMP0NjvjCK7e+pUAiE1yEzWyFjHOzRXycBAokON8Km
	3pEjntsgnjJQaztyKwn6+D5BW99kYL2b1WXbBFKqvBxnOWgtIZwd4Nkx7v05NP2C19M9lc
	xJxlbR8NOherY2tXngy74mGDJltt/mAITbaBccIKy+8ddeapqXKAlnyGVB6FXpxsau/BRv
	jsf9pbdO1NuJHTjsl8ltGwX1z4NWZ4NP7+WC2q4hmM+2UVF00gWaW8w9IP+OrSXp87vftB
	xGkQFopFQjmI55oD9do6bpHlZXV65REQHvcrdLz5aULQrJiUb5qxvuXVFmgm7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 11:32:32 +0200
Message-Id: <DJI0YM93PKAM.TMLLL1394R5D@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
 <20260608-rustling-infrared-turkey-e09af8@houat>
 <DJ72WOUW5FA2.G1MPCAHJQ13F@bootlin.com>
 <20260624-judicious-enigmatic-hippo-b13ffe@houat>
 <DJHE108R7TU6.35ECAUQ8ZX041@bootlin.com>
In-Reply-To: <DJHE108R7TU6.35ECAUQ8ZX041@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_023248_081460_ED2DD29F 
X-CRM114-Status: GOOD (  21.53  )
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

On Wed Jun 24, 2026 at 5:34 PM CEST, Luca Ceresoli wrote:
> Hi Maxime,
>
> thanks for the feedback.
>
> On Wed Jun 24, 2026 at 1:48 PM CEST, Maxime Ripard wrote:
>> On Fri, Jun 12, 2026 at 02:44:43PM +0200, Luca Ceresoli wrote:
>>> On Mon Jun 8, 2026 at 1:46 PM CEST, Maxime Ripard wrote:
>>> > On Tue, May 19, 2026 at 12:37:32PM +0200, Luca Ceresoli wrote:
>>> >> Currently the drm_bridge_connector has an embedded drm_connector, so=
 their
>>> >> allocation lifetimes are tied to each other. This is insufficient to
>>> >> support DRM bridge hotplugging, which requires the connector to be a=
dded
>>> >> and removed dynamically at runtime multiple times based on hotplug/u=
nplug
>>> >> events while the drm_bridge_connector is persistent.
>>> >>
>>> >> Moreover the drm_connector is exposed to user space and thus an ongo=
ing
>>> >> operation (e.g. an ioctl) might last for an arbitrarily long time ev=
en
>>> >> after the hardware gets removed. This means a new connector might ha=
ve to
>>> >> be added when the previous one is still referenced by user space.
>>> >>
>>> >> In preparation to handle hotplug, allocate the drm-connector dynamic=
ally,
>>> >> to allow:
>>> >>
>>> >>  * creating and destroying a connector multiple times during a singl=
e
>>> >>    drm_bridge_connector lifetime
>>> >>  * creating a new connector even though the previous one is still in=
 use
>>> >>    and thus still refcounted and not yet freed
>>> >>
>>> >> This commit does not introduce the actions in the two bullets (it wi=
ll
>>> >> happen in a later commit), it only moves to dynamic APIs for connect=
or
>>> >> allocation and init.
>>> >>
>>> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> >
>>> > I think this patch should be split in half, with the switch to using
>>> > destroy first, and then the actual move to the dynamically allocated
>>> > connector API.
>>>
>>> Is it doable? drm_connector_dynamic_init() mandates a .destroy callback=
,
>>> drm_connector_init() forbids it.
>>
>> drmm_connector_init forbids it. drm_connector_init mandates it.
>
> Something bogus in my reply, sorry. :)
>
> So you mean splitting in:
>
>  * first patch: move from drmm_connector[_hdmi]_init() to
>    drm_connector[_hdmi]_init() and add a .destroy
>  * second patch: move from drm_connector[_hdmi]_init() to
>    drm_connector[_hdmi]_dynamic_init() +
>    drm_connector_dynamic_register/unregister()

Ah, no, there's an annoyance here. drm_connector_hdmi_init() does not
exist, so it'd have to be created just for the sake of splitting this
patch, sitting unused after the second patch.

I don't think it's worth implementing (and maybe deleting) it just for
that, so I'm leaving this patch as is unless you have counteraguments.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

