Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7E4CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ugqk3paBNtkUpmNS8tCEk8xcfM99gRQHykB1GGB9Lao=; b=4LBXDeqz68hoqsqmOouo6ANbdk
	EbjkbmFl5I/noec7IBNVJ7qn+dih/T7WbEFXB+CXKs7g5VLNaOYroXjxSehP5vb2CJ1wumk51Biix
	tv64zlBSBcwmTukZLbM63g33RTp4U+0qOD2LLnEHKDBZ8+WM5EJl0rovRyxM/kypJMr0CSp9eF0rc
	KwqknWU3u4rANlYGGsvb6A0dmZtao8EbRrTrtmVQ14LFD7PqURchdxvxe0c+rmG5Mx+ZptwBEKj6I
	DQ4mPXyuKLEv0/jtRALOEbwYT6+Hb0pqixYGdXcLIomjC7ojse+NE/zGoq1D1q2dHrVGGB1YY3ZY5
	FE3mUHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1gU-0000000AwOs-3gka;
	Fri, 12 Jun 2026 13:12:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1gR-0000000AwOT-0cze
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:12:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E637E1A38E6;
	Fri, 12 Jun 2026 13:12:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B323F60012;
	Fri, 12 Jun 2026 13:12:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E79E3106C869D;
	Fri, 12 Jun 2026 15:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781269940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ugqk3paBNtkUpmNS8tCEk8xcfM99gRQHykB1GGB9Lao=;
	b=PbGQSTw+ZvVX1pFyLyVPEK3/vY1XM2NFXQyVjT3m3DmbXPwBOM0500DUhvgto0fxv7s51P
	ImghhWxXuM/T8KfimbSYI7lz58OYKRaaN6nF2kjm0sonGdmIRFidiSgJhAWrZeSz1JuRA3
	TILMuJmf3cEkky7ZairznuK2GLJSUQNdQSJUMlK0zFHt3nQNA2w4emEj1HHjYgrncwlM9h
	E61Qh3gdfPvoxd+5ENAVWTzko/DLed7oUf6W4s+rsbuz2V7Fm6coWhVynzuqe8trFTYH9C
	NyWLBB1HTqHWZoiMy16JIecyPXfvFWG8Pc8Ps2fkFkjlHFGweWzzto7L2oSpUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 15:12:09 +0200
Message-Id: <DJ73HOYATZN9.1FQ8X1O2QHKEW@bootlin.com>
Subject: Re: [PATCH 04/37] drm/display: bridge-connector: store the
 drm_device pointer
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
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-4-45e2bdb3dfb4@bootlin.com>
 <20260608-imposing-umber-tuatara-62daba@houat>
In-Reply-To: <20260608-imposing-umber-tuatara-62daba@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_061227_333227_F6855E83 
X-CRM114-Status: GOOD (  15.02  )
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

On Mon Jun 8, 2026 at 1:34 PM CEST, Maxime Ripard wrote:
> Hi,
>
> On Tue, May 19, 2026 at 12:37:21PM +0200, Luca Ceresoli wrote:
>> Currently the struct drm_device pointer is only needed during the initia=
l
>> drm_bridge_connector_init() and in drm_bridge_connector_handle_hpd() whi=
ch
>> gets it from the struct drm_connector.
>>
>> This will be insufficient when introducing bridge hotplugging, because:
>>
>>  * some of the actions in drm_bridge_connector_init() will have to be
>>    performed later on, when a bridge is hot(un)plugged
>>  * the connector will be removed and re-added based on hotplug events,
>>    so the drm_connector might just not exist or its content be cleared
>>
>> Store the drm_device pointer in struct drm_bridge_connector for any late=
r
>> needs. Also convert drm_bridge_connector_handle_hpd() to use the newly
>> stored value.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> This is already accessible as drm_connector->dev and drm_bridge->dev. I
> think it would be great to list why this is different, and how it is
> different (ie, when it's set, unset).

With hotplug the drm_connector will be created dynamically, so it cannot be
used.

The drm_bridge->dev maybe.

But we have a pointer to the encoder, which is supposed to be always
present, so I'll try using next for v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

