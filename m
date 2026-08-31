Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D6DC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6oxC/12nbIyG/hWKvWHljzUeneLjy2WW6xRew8IQUw=; b=uadETdGvPWLGjqAzVz3OmpfX1z
	oOGeJmaRQZqCAJnlJe++oCYda4mZcG7W74V/a2uUq7XKYjHJ2yGqLwwNAIogLYYiWVxkKNqbHvr+w
	XIkD4bw3TUM5B7Kf5/mB3/sE6pJKuj1ljXZrjr6/eVMyMQx3NGOqnXgsSVwXJRZBAp+Mjihi+AVOF
	jmR4VaB8de0sEeRi/hPgrS0x4aAYmNuhMaiWnrODwXJjnXvKtSuanP89DPuw3HfrgsnXmBcm3DTF+
	Z6dfkJkBTcA07TpVtac4ihv7c4xRS2KhFH1dHEWLrkZnof8jCD2L9cWM0TTnnJzxgIAVsRaWwPhtN
	DcGB3npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xtG-00000008y6k-49sq;
	Mon, 31 Aug 2026 09:01:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xtD-00000008y5t-3VTC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:01:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F12CA1A18ED;
	Mon, 31 Aug 2026 09:01:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1D2A60231;
	Mon, 31 Aug 2026 09:01:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B0C311C78388;
	Mon, 31 Aug 2026 11:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788166868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T6oxC/12nbIyG/hWKvWHljzUeneLjy2WW6xRew8IQUw=;
	b=y8DDw05VRpqx6+EBYe8Kh0paGC4OlXEQn85iwNSnK6ozkBH8WL71eThmTB1aYF1yaZQ5az
	kde5NzGrZ9ZbFiP3PUTT40AAJlnEcuK8sX08rnulqazFr3bKAiuy7jUZcCV0/cu8znSHH0
	QUMv0uMuFhMNvWVLttVcDIpkjgRHkC6bF7J6bG7W7melvug4gfcB65hQHgVyQ9ArN498qE
	cCrdK6ofajyojrYumICdfGukAz55XBLYsklNukBtBdrlXbXWAJfX0Kn2pgXmhSzRGFJdQA
	j8Gso1ao1Fos2IGJym5rizTP9Fy6dYdsqyw1BQsuFEXuPOpAgfh5gxVWT5nE5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 11:01:00 +0200
Message-Id: <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select
 DRM_PANEL_BRIDGE
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Jitao Shi" <jitao.shi@mediatek.com>,
 "CK Hu" <ck.hu@mediatek.com>, "Pin-yen Lin" <treapking@chromium.org>,
 "Enric Balletbo i Serra" <eballetbo@kernel.org>
To: "Doug Anderson" <dianders@chromium.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com> <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com> <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
In-Reply-To: <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_020116_507828_8E802B81 
X-CRM114-Status: GOOD (  10.21  )
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

Hi,

On Thu Aug 27, 2026 at 6:23 PM CEST, Doug Anderson wrote:
> Hi,
>
> On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> This driver uses the drm_panel_bridge API and not the drm_panel API so i=
t
>> should select DRM_PANEL_BRIDGE and not DRM_PANEL.
>
> Which exact "drm_panel_bridge" API does it use? I don't see any...

It calls devm_drm_of_get_bridge() [0], which is in bridge/panel.c [1],
which is enabled by CONFIG_DRM_PANEL_BRIDGE [2].

[0] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge/p=
arade-ps8640.c#L636
[1] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge/p=
anel.c#L483-L515
[2] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/Makefile=
#L159

> Certainly it's highly likely that the next bridge in the chain is a
> panel, but there are no API calls that I see. Maybe the scripts got
> confused because the variable name didn't get updated in commit

No script, just this humble human got confused X-)

> 5486eac81004 ("drm/bridge: parade-ps8640: switch to
> devm_drm_of_get_bridge") ?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

