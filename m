Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C45C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=; b=hZBs90hzuxIy/be8hVoggXFa1N
	LljhYCTkouTb56SpSPSS2/8H0o5646JoxYijSbAPwsfFaW1Nzi5OjL1eUVEnWDOB2bK1ybPzxu+mo
	WU780lDhhe9v4jeVBozM29w/LQNcWaRzc7clC110VRUveWTLUaTHWYucFYS0hHEsWW8V2S/heapUm
	301ndydzLSz+ED1KjRJBs0E8oWnZf64GkxEDEo82nTh1CsEOMa2P8vux+5AEVtfOmgrT4GD+049cL
	4lUfVnDWlngFAmO4sMia/0mjPK8VzI+c1SNRJq99zNj/DpJYaQxmReWTgjeTsoz4myH96TZacq6h/
	bf1QDbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13TQ-00000009kEm-2unf;
	Mon, 31 Aug 2026 14:59:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13TO-00000009kEK-3WYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:59:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c1677c91969so342523366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788188336; x=1788793136; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=;
        b=Nfl3FWP1I+K3HRTDNzGIpXlkFZU++qcdxLljpT6bN1In5vZ/+thV+rM/hqTqTlOMmC
         4KIbm6NursqJqCvsrwlfypOBadxhnJmGaMUrULiagbP/iGqQ7UdYiTpFTOcGxm4t8aQI
         gBPp3c4kwTXbFVr+8U1Pv7WWZEB83bYF4gRyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188336; x=1788793136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=;
        b=TRk+sDJ/ahXDjBXLBfNa2lvQYaaF1hoEKSNjTt53D45+Jsnczp3VkG/CoIrmm+hniC
         ExMPSadA0tOjnUbTAVz2l7eslxNJ+3Q9ib4JZJRlfjaSMJ9fc2cTZzLqNnjFuxSHsacb
         hf2Q9ifqDLhR48RXTrb5PMqt4+31ES0HFE0Wz8kVmoeznJiYbY435jsunPJBQSLJ10Cg
         MPPlGcbBDfocqp7Iuj0T4TUBTWtXk1jmSYTh5a0w2L/eORI+L7sShdn8zGxruNf06LbH
         D1BsM8Fsk7FrT2ex2HQk9mNwImWF/QL6bo+5LOa6BVha/c0RzZpWeuYimTY08+39T0j6
         oqZg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7MCPPdKypGPjJ8m54VsjMKthnkqTEVbiVcQSDQYcDSsSSGUIDCr/SrvLiv+uixYYT5/B/fT1M7cgaM/dqfXEW@lists.infradead.org
X-Gm-Message-State: AFuF++kT2YK/XYovSuL8K9mR52Ctj+8L5hV5cd+xjYKMj7JR2ic+KO5r
	ZbUgaJ1MilzgrtcikNc67BIGSURxKf4tgesvgRxP0IC0qwlBcqDU+gV3FxiFTBrKbeFvSLX4Ge+
	7fKi6vg==
X-Gm-Gg: AR+sD139+f9sA32j05hRorbmsR6MzgsIkXVsq0LnmqSZs2j2JOmBv+tIMowbl8VJJa0
	E3PuniEBYpNKcdg4Uy8FM994TQAsF8Ic72+SWbuaY34XArHqjspJnUJurE0Sfuv2YNLthOQjMmI
	a7vdYBXK6Wf2Gn7AWwn6tjBs3mKq4d92wX5wWDfhZo5swThn2uWuia5rRfXnGbMz1j6QKTmttUq
	UoE59axm/A/qKxqBH1Ts4w7pH3bT8Vz/plEHgA6uF3vvKxFnMgbZ+x0Ut6/ZS3+2SbxOQXgiw2W
	W+GRvOxdo5WL1Mc4hVR68rc8bql4pi40MQQkrbLwp11ipCt+F57LzyJVWmSygrJ7BGRP3Dsun1M
	uiWGXk+QYYDDNbbQCdspWfk3nKIl1fEq/8kE+foVvBxuYxIYmm1YxQTiVedd1tK4u037q4Db6aD
	bIjHfdmSOT/LndPXZnHQI7kXvmlEStm3Ti+3Zb+TTpAu8xX+limR/cGS7DgmpV1KaHcBn2uZ2Oz
	26ngWf+BxYXWKL2Vw4HAbUscCkyJzvmUw84JQ==
X-Received: by 2002:a17:907:928c:b0:c25:9b8:30d6 with SMTP id a640c23a62f3a-c2557030670mr1546099466b.12.1788188336368;
        Mon, 31 Aug 2026 07:58:56 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09c68sm448048166b.7.2026.08.31.07.58.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 07:58:55 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48433e9562bso298919f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx+2ZDo4pF0MbWV92OjR18/kU7Qan+FxTdOaX3wfoHq3LvNpjw/xt/tA5TlSrV/UoeFu8TbnRMJObqa8qtY7nSN@lists.infradead.org
X-Received: by 2002:a05:6000:2403:b0:484:3310:f394 with SMTP id
 ffacd0b85a97d-4843310f432mr23509935f8f.23.1788188332108; Mon, 31 Aug 2026
 07:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
 <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com> <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com>
In-Reply-To: <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 07:58:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
X-Gm-Features: AcwNN1Uwe20Iwwe3Thag0bGUZKeQo9OpK0wBSimBjMptkSoLanhwYwfNst4yWiY
Message-ID: <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Pin-yen Lin <treapking@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075858_932053_60278BBF 
X-CRM114-Status: GOOD (  17.30  )
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

On Mon, Aug 31, 2026 at 2:01=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hi,
>
> On Thu Aug 27, 2026 at 6:23 PM CEST, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> >>
> >> This driver uses the drm_panel_bridge API and not the drm_panel API so=
 it
> >> should select DRM_PANEL_BRIDGE and not DRM_PANEL.
> >
> > Which exact "drm_panel_bridge" API does it use? I don't see any...
>
> It calls devm_drm_of_get_bridge() [0], which is in bridge/panel.c [1],
> which is enabled by CONFIG_DRM_PANEL_BRIDGE [2].
>
> [0] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge=
/parade-ps8640.c#L636
> [1] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge=
/panel.c#L483-L515
> [2] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/Makefi=
le#L159

Ah, indeed! I missed that since it didn't have "panel" in the name.
FWIW, then I think for this patch:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...but, ironically, that means that for the other patch I looked at
(ti-sn65dsi86.c) we're missing the "select DRM_PANEL_BRIDGE" since it
uses the same API call, doesn't it?

-Doug

