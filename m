Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C06C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=; b=Gby1DsA9PPoIY2qBixON4sBKGV
	LN9WChnzo3mXztDhr89nLRYN/Zd5PkUVDSKku9mzPUhvfCxxZAY13ulMcobY51jpIjkH5DK6Y+Kz2
	SjBk6Dqy2kWRBcirJ3IwEJQsmY9QiW6DklNKSvQl79WHZQUEZUiX7EpURnONhjGxxbQ1WWW8WkqMe
	h2nEFYhvBULpodQie2ZnD6RgpXBTUcRYTUlWnRSXbagp/mrh/P8GLpZtcMWyoasPGzPIaNI0nR1Rm
	24Bp0g6tmw5Tlmb4dHhmeyUCIsuZd6Wc/JdLe7Xn17eqXeKhEzgQt0JSDRlvWVe/t4BEF7S6RVc2N
	TD39d/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13wV-00000009rZB-3ngs;
	Mon, 31 Aug 2026 15:29:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13wP-00000009rWG-23Og
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:28:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso6109107a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788190135; x=1788794935; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=;
        b=V1haTN5qRqh5evspucHuUfZUauTh+5KGcRGoU7D29aYwZQC2WEZ3FBf/3YGMtre7gi
         hKnCmFY/CK6Ry3AdW/ZIpVHGXSaiF/Ojf+vVUnzfD8nJfsvP0tCHxo+Q+nj/Qe9Xnd15
         66NRz7X5NgVpWbZOT0AdXWs2lv1xNc97ngK+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190135; x=1788794935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MODz/yvQ0Z27mNvvvXpyLpRUHE/JQSAV0LJ+Rig2AKg=;
        b=F3nWcfivoA9wEG+zi2f6bafcjDXeme70Pt5R5MBesop/DvOMkPfinroF3QdW+jHg2d
         DhaTB1sMEyuJrTwZlPi8Px03KuTw+oGlQODpVYtlJAqqQJBtfp0S+VSBdSWcbFS+H49n
         2ddF39W0v1qf8uA7HED08HH7DFqvUHiaeBboi43xyfgxf8JH8QXd5WXID5JW1i5pILX3
         ihJ8XG9SrnppFqrbk13DwacfRslAisIl7KjzeCnQXHJInewOY4udTdFJ2rD5UcyiXoWo
         m2qNUIXAJhQPkgrocr26kSWHilAEL5HZWklHW8+SQakgRQ6g35sJQvBMNyKGGeUEsycm
         Zg2w==
X-Forwarded-Encrypted: i=1; AKwUvBzqgqFgr1LDv0zLSoOyA43l1RaT4Fmg7+pJgG7skosBJgKll4qRRdRwHsOLo14rlH7jX8z8cqGThfGtWfLuE8y3@lists.infradead.org
X-Gm-Message-State: AFuF++m7s8Uvp3p6yDpzOqd2OhQzkW1UDD6G0fG4UZhC8YAvmUMeQUOI
	olcAFDkjZRUQP6sndsLYE2hnutA8iJ5qx07xeimy3RKSL2rW49vxuDUJCoa8XsZYZQlbcb03RyR
	w6znqTQpY
X-Gm-Gg: AYBFou1XJyfAHFkx8Dgbw21SQnQq+i1FzuLDZ2SyCOnTaFpctKam02xA0U05+Rplw8j
	ZAHHARmQ28ULM/zcZSRxQPDIkQYVqM2o7AzQq3CTLxwFLQYjZO1nsf5lv0EgCGT8kUeJ5cMKMjh
	HzolILiXtWBMrnAaRsmwVFpNnfO0YkfTxZVrgrTIekPz/cVvZGUeXdP4WigU/WHQcqOKDu0oPAt
	tiHNgJpeOI7k2jDOzRFT59iqdNKJH5+a2A5CORvGvfc+20NageNnF9cJbI0aEowVsXBir/XR8LB
	lz9RWYW3I+YvwUzgQ+zHhSFCcz/ERfA1fNuahNjRNhaWHXCmDVrX9TxGqOanWOYTgAyhdJ9+mv0
	SEpOrhV96vQbNf1j0H97Vem+a4L1z3zYrHVlAteO/CyItFYh4KPJXUBxOfkWrOTLOUtqHG6ZCBE
	pxZU2nzoYsqzaxOKDwDwR+CCl7z73JUcSG4X1gzLKvbkenasJWSkuQNZm1Rw9+SwzBQ64Xynpio
	MBRNi+MUisRoZfkEA6pz3IjRqk=
X-Received: by 2002:a05:6402:2383:b0:69c:811f:8f5 with SMTP id 4fb4d7f45d1cf-6a663a8d2c6mr1204218a12.6.1788190135400;
        Mon, 31 Aug 2026 08:28:55 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c64f9fsm3904647a12.27.2026.08.31.08.28.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:28:53 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2133503f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:28:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQnxXK2HtKRHbxwb+AgUAbL+Z3DnxMg29/ErErHkr0GJzVvaAHDjEDnDbDQ6QJTVLm+T4biwdFlDwGzLcP/x2z@lists.infradead.org
X-Received: by 2002:a05:6000:46cb:b0:484:3600:35b2 with SMTP id
 ffacd0b85a97d-48440fcee03mr2458557f8f.5.1788190129893; Mon, 31 Aug 2026
 08:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
 <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
 <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com> <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
 <DL38FWMPAVYW.3H964111WXW4T@bootlin.com>
In-Reply-To: <DL38FWMPAVYW.3H964111WXW4T@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 08:28:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPzExBjY6KrNR_cDJTofua1nZtPNOhNciu+Y7awwaCTQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vw4mO8ILYq4ZDFw7i23F9T4GMkIdNzC_wyAjuyFKPOHb3FlBTxENhm96k
Message-ID: <CAD=FV=VPzExBjY6KrNR_cDJTofua1nZtPNOhNciu+Y7awwaCTQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260831_082857_614201_586F84F5 
X-CRM114-Status: GOOD (  16.33  )
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

On Mon, Aug 31, 2026 at 8:26=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> > Ah, indeed! I missed that since it didn't have "panel" in the name.
> > FWIW, then I think for this patch:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...but, ironically, that means that for the other patch I looked at
> > (ti-sn65dsi86.c) we're missing the "select DRM_PANEL_BRIDGE" since it
> > uses the same API call, doesn't it?
>
> Ouch, indeed! Thanks for noticing.

That was part of what confused me initially. I saw one of the drivers
selecting DRM_PANEL_BRIDGE and the other one not doing so, even though
(as far as I could tell) whey were both using the same API calls. ;-)


> I will send v3 with that fixed, can I keep your R-by if there's just that
> change to the sn65dsi86 patch?

Yeah, it's fine to keep my R-b.


-Doug

