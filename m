Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F712CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6B714fJIr1cKyRvLd8BqwboTpStsTovlsXJpNPNfh5M=; b=IU3thy9FBmxX5CF9NTTH2c0M5t
	ayzckdg28KwNk4tgK6QmrP1qzVqRyPzrxDEw7vbevV320gszTLG/twn/VsIMGcYZ+rJoEFx16Tvpt
	0sRz410AEwBABy9s5wSOMxLWFLS+NoDKLUx4A9j2rjo/NgpkHgZubED3ilNwIuhFNNR6YkhU7UcAZ
	ELO5ZDB52xK+8CcdV9INcKtPrTSrN97NZ6MHCJOmE+WNnWSiBkd90P3PRxkNdfU1mgWqiNuZhaAM3
	17kEbPkdn1mG+1gOHDP1CCO2sUJkBzI74de0XM3DWeqxsTenlD2sVhzPuVnXbjEy0SiGW8GafS09g
	xhKSywdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1SO-0000000AvTv-0JOo;
	Fri, 12 Jun 2026 12:57:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1SL-0000000AvTW-1f8m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:57:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C22534E42E6A;
	Fri, 12 Jun 2026 12:57:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DF0160012;
	Fri, 12 Jun 2026 12:57:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 356A1106C8654;
	Fri, 12 Jun 2026 14:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781269070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6B714fJIr1cKyRvLd8BqwboTpStsTovlsXJpNPNfh5M=;
	b=YBj5v2TlRFS7FzMpVJFcW9745pOLogkHXsOYMGcZc9CEbYT+XBawiZy9kRXA34i5OMG8n5
	IOU66bs2FCFw6mhk7OJsKDtj4qQ8L5sydbxQdb+bz3u9uj6uWjQes1KzkHfnANBKMnQW2O
	YjF38hRS2hqAsNuVZozosRTEgGfG1Cmb85s0XwlJczq1BesI8dZiX+u9NkDtTSZXAi4GeG
	xjBJXH4rLkIpQmPZJWUrF/p3lnYBTja4/7UHoofCpsthpcbkJy6DC8U5Ap5mZ4R7IJxsIK
	dtnliPNKVLCNbAnoAm4MTbSux2lUMax2Gi9dEuwhjaquhb89xSpxsPhxwP3QKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 14:57:39 +0200
Message-Id: <DJ736L2DR8H8.35296DRNZ1OW@bootlin.com>
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
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
 <20260608-little-lyrebird-of-competition-c25f7d@houat>
In-Reply-To: <20260608-little-lyrebird-of-competition-c25f7d@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055753_592520_6870365B 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon Jun 8, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:23PM +0200, Luca Ceresoli wrote:
>> Currently drm_bridge_connector_init() always returns the added connector=
 or
>> errors out. When adding bridge hotplug the bridge-connector can be
>> successfully initialized without creating a connector, which can be adde=
d
>> later when the pipeline will be complete.
>>
>> For this the internal function drm_bridge_connector_add_connector() must=
 be
>> able to return a valid drm_bridge_connector even without any drm_connect=
or.
>>
>> In preparation to support bridge hotplug, change its return value to be =
the
>> same drm_bridge_connector pointer it gets as input, or a PTR_ERR.
>>
>> No functional changes, just changing an internal API.
>>
>> Note the return value could now become an int (0 or negative error) beca=
use
>> returning the same value received as input does not carry any added
>> value. However this would be change a lot of lines, so leave such change=
 as
>> a future cleanup.
>
> You just created that function and changed "a lot of lines" already, so
> I'm not sure that argument holds.

Do you refer to the previous patch?

My comment is more about the following patches. It means I separated
changes moving code to a subfunction from changes to the the return value
in separate patches, so that each patch is trivial to review for
correctness.

Makes sense?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

