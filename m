Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65E4CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWgaATuoAKFQpxfZIkw0EI47Xu+CY02gQbwSENrgRrc=; b=oTDSUyv8z8ovIba91TxQZk1ENQ
	wKXJ7HPu3fA9TMCxqdJOcsMEO3uQTVWucOJHdgDWZsNtJK5cK2v4+GrjbCCFQRCwl6OiN6kWaMiNv
	FkNHC+SAhROK6QXaTMcdfYpfNiYVGaUpxt2f/Sl7JAILz9/9a1Vb1P8YxUEoUHK8BWMxqTVYe0Yw7
	fC9eoMPy09WtE/jFnPfiVpL9tCk2vGl5bp3T3DJ4yUqt9qw4BkqmCikhmfVNZem9IPHdDAJWKGYOr
	00IDZ1EVJO0CEVwmPlqwVc5lMMa+fRZ72LCDJ8U9AXgunnLMmqZAQyPRgVxTYvdVBHmSibqgV0rYN
	YyDvvxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1RF-0000000Av4c-3Xf0;
	Fri, 12 Jun 2026 12:56:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1RD-0000000Av1c-0u2O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:56:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 575854E42E5A;
	Fri, 12 Jun 2026 12:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2103B60012;
	Fri, 12 Jun 2026 12:56:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08CF4106C8A54;
	Fri, 12 Jun 2026 14:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781268998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QWgaATuoAKFQpxfZIkw0EI47Xu+CY02gQbwSENrgRrc=;
	b=08oWSqoRpdjvs/baLaFBFKfqQKGcttUE+15yalrO+7G0oIcDfFlazuHuTuPalT8w6tUXHl
	H2M3D8KcQljoSCY/vWa/Co/s1CCAeQt8UrpDYp5zeCjSWsjpc6c+DN1zbn6owZT3T9Mj5d
	yolr65EuEGx5SLMIBHHfxQYy2fW10HLDXOx0wHG9be2QkY8S//pZVyBqDxsGWAw4Ul8DN5
	Hwe3IibqJeY8JRcRiVYY0lwW1NDbOnSrdNzsT2Abtl8pWxp6UsCP+hXDf4bMMN/axupjkR
	5dZWc0DJlQJRJvnIYPtGjtugZCd5vYk9wG2+LP4uECWVV5P7q5CjGPcmLINjUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 14:56:24 +0200
Message-Id: <DJ735MTNMYD1.3LPNV404V8PIU@bootlin.com>
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
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code
 creating the connector to a subfunction
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
 <20260608-mindful-heavy-frigatebird-be9faf@houat>
In-Reply-To: <20260608-mindful-heavy-frigatebird-be9faf@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055643_401147_A4CB4430 
X-CRM114-Status: GOOD (  10.08  )
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

On Mon Jun 8, 2026 at 1:40 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:22PM +0200, Luca Ceresoli wrote:
>> In preparation to introduce bridge hotplug, split out from
>> drm_bridge_connector_init() the code adding the drm_connector into a
>> dedicated function. This will be needed to be able to add (and re-add) t=
he
>> connector from different code paths.
>
> Same story here, explaining what you need later on that calls for that
> change would be nice.

Here's a more verbose version:

    Currently drm_bridge_connector_init() does two things:

     * allocate and initialize the drm_bridge_connector
       (which embeds a drm_connector)
     * initialize and register the embedded drm_connector

    For bridge hotplug we need to separate these two actions:

     * the drm_connector needs to be added and removed at any time based on
       hotplug events
     * the drm_bridge_connector is designated to create and remove the
       drm_connector, so it must be persistent for the card lifetime

    As the lifetimes of drm_bridge_connector and drm_connector become
    different, we need to create them in different moments.

    In preparation to support that, split out from
    drm_bridge_connector_init() the code adding the drm_connector into a
    dedicated function. No functional changes, just moving code around for
    now. A future commit will make the drm_connector be created based on
    hotplug events.

Looks good?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

