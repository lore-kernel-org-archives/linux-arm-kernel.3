Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA9CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shrZ7CpTKyIgEFXVs/ZXsWjGHpF8pSdJAOdanCrWqrg=; b=2drCG9l7/VzFMISXSojHlzIqTk
	2/smNyXAZbXP0fK6iU+CJWzmBMO77vTAdOkrA4IDZD+v2vrG1gQNcKeFy/urBAfGlv82R2Wm5OC95
	9+6UynakmqalumaBmFHIAEl88scdOrtHpem2eAzZrndWqmALOWQ7RWy4FFm42ZrR5eBCCUXiLPFU3
	n4uH6F36F+AhxXfd/nCohPoIBaw4xQlPJjr0oAUC4qrmq8KZ8mTYANCxKpL4b0ONHZISky/Ye/mhV
	Hn4a+X81IkOvuLfoKLjCuQKJMaOCCX5iw7BJ1Yv5c+PV//GSpr6+Fql3alc+Bq618qSi20bzZdABx
	eoL59IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ0j-00000007mUs-2XZX;
	Wed, 10 Jun 2026 13:30:25 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJ0g-00000007mUK-1SdR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:30:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 181C84E42DFB;
	Wed, 10 Jun 2026 13:30:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC5A65FFC9;
	Wed, 10 Jun 2026 13:30:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69C2A106B82D9;
	Wed, 10 Jun 2026 15:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781098218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shrZ7CpTKyIgEFXVs/ZXsWjGHpF8pSdJAOdanCrWqrg=;
	b=RpL3FUhPUcKqrnMh5NSyakg6RJXeX2sWTGp1hyfNIQYIEfnK6eyJbhv448ghySEjepxq8J
	JYrNz5epUEzxjS2cLc4hdYPhBVjfngOPS0+pFuqKPn0kQejY+G3j5dzI+06FkZaFMddDg7
	lndOEhaZkCidVj9Dip0DQiIlblX5NHGUQTvGTC4f3N0cxvrVCyUJfeYemclTa2hSrGRsUZ
	Gx5yWMSQKwsjfdMBnPh96uo4TCAP7yr2neSIwdBGg9O92IO019jRRQMRBp7Y519+92QaDa
	7n2/BQFsQpUw+yBiuj2mV6XVQUUpCem8KHzXzYL5S3cjz3Fu8O5MkVh3/EscWQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 15:30:10 +0200
Message-Id: <DJ5EMEA1QBQG.VPAA253STNJH@bootlin.com>
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
Subject: Re: [PATCH 17/37] drm/display: bridge-connector: protect dynconn
 creation and destruction with a mutex
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>
 <20260608-garrulous-silver-junglefowl-ea4dbe@houat>
In-Reply-To: <20260608-garrulous-silver-junglefowl-ea4dbe@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_063022_531187_2247DFC9 
X-CRM114-Status: GOOD (  11.57  )
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

On Mon Jun 8, 2026 at 1:49 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:34PM +0200, Luca Ceresoli wrote:
>> Bridge hotplug will make the connector dynamically created and destroyed
>> based on hotplug events.
>>
>> In preparation for that, add a mutex to mutually exclude connector creat=
ion
>> and destruction.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> What is the source of concurrency, and what are you protecting against
> exactly with that lock?

With bridge hotplug, the connector creation and destruction can be
triggered by different code paths, so we need to prevent to:

 * start destroying a connector that has not been created fully yet
 * start creating a connector while the previous one is still
   being destroyed

Both conditions might happen startig with patch 36.

So I guess I'll just squash this patch into patch 36. The commit message
will become quite verbose but it amkes sense to do it all at once.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

