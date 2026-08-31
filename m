Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6166C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOSEqx16yAn5Bafqgfej14UnvGnZ0sZeAYdUubBwfXw=; b=L7T+tDOQ2bcD6vEPDyVNKPpLBi
	KPbOhwh/BAN0UUjLZ78UiphHgnoBs6fJloMJBg7A+hVSugzr6jCrPfDD1MYFiS5eWxvEWDO0cGMBc
	3d48PW3V09N4MiU8/Eu6SeU8eEAlMZCJE1MZu6pY9d3QFbsmmOX/rBArsafOZ8Cs+Lb7eSNC1MoXm
	23w47t+lojsVIkmFHhYR0QNqPkPLl8E8sx6ANGSKaJhnLxCqcLIUbUKKDWpCUOVygmEZfemwQ3/tr
	ZjkaNszhgwmgpnc0PDj0CTMxtMNdRZC3J1OZ3Jiu5PtMQmVsbPthcAtnAOPc8GdGKBxLJ62iLKhzV
	G2PZGTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13u4-00000009r2r-0M4H;
	Mon, 31 Aug 2026 15:26:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13u0-00000009r1q-20pW;
	Mon, 31 Aug 2026 15:26:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B093E1A18F6;
	Mon, 31 Aug 2026 15:26:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78D0260231;
	Mon, 31 Aug 2026 15:26:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9386C11C78AC8;
	Mon, 31 Aug 2026 17:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788189981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MOSEqx16yAn5Bafqgfej14UnvGnZ0sZeAYdUubBwfXw=;
	b=Q2MLXKc/oRyrOrt5bUK/hzX58z7rF6JIiqY6ZUOPOSQIGKtaI5fg9Oeb1RV0NWqutDvaPv
	gOJ/0FOFFdpkdIwaF/Cvr45Mys4ZncMbplmBKHbMWqg9ZLspZSv8Ep00y2lumGKCRs4v2H
	6gQdw4/h+YXmx870Cy71EBf+ALZLLpxbk4uMOFlsizSLUt+shIDdx1iVxZi8WokNXjmlMZ
	G2hBOrntCutZ5ipOcFTONtGS0Tt6ujgIiHJf+jpm5CS7Zm1c7iHAuTxUtyIhKj4cmQW98y
	EYJDqIQaptAlVZQypV6Iqv5HNYDXKEDHTFaQ7QQ1NGkRvKNt+nqg4xnkotsgig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 17:26:12 +0200
Message-Id: <DL38FWMPAVYW.3H964111WXW4T@bootlin.com>
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
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select
 DRM_PANEL_BRIDGE
X-Mailer: aerc 0.22.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com> <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com> <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com> <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com> <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
In-Reply-To: <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_082628_657403_305EDB51 
X-CRM114-Status: GOOD (  14.46  )
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

On Mon Aug 31, 2026 at 4:58 PM CEST, Doug Anderson wrote:
> Hi,
>
> On Mon, Aug 31, 2026 at 2:01=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> Hi,
>>
>> On Thu Aug 27, 2026 at 6:23 PM CEST, Doug Anderson wrote:
>> > Hi,
>> >
>> > On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@b=
ootlin.com> wrote:
>> >>
>> >> This driver uses the drm_panel_bridge API and not the drm_panel API s=
o it
>> >> should select DRM_PANEL_BRIDGE and not DRM_PANEL.
>> >
>> > Which exact "drm_panel_bridge" API does it use? I don't see any...
>>
>> It calls devm_drm_of_get_bridge() [0], which is in bridge/panel.c [1],
>> which is enabled by CONFIG_DRM_PANEL_BRIDGE [2].
>>
>> [0] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridg=
e/parade-ps8640.c#L636
>> [1] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridg=
e/panel.c#L483-L515
>> [2] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/Makef=
ile#L159
>
> Ah, indeed! I missed that since it didn't have "panel" in the name.
> FWIW, then I think for this patch:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ...but, ironically, that means that for the other patch I looked at
> (ti-sn65dsi86.c) we're missing the "select DRM_PANEL_BRIDGE" since it
> uses the same API call, doesn't it?

Ouch, indeed! Thanks for noticing.

I will send v3 with that fixed, can I keep your R-by if there's just that
change to the sn65dsi86 patch?

I am also going to double check all patches for this mistake.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

