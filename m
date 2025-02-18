Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9j3FDtCSLrxBBi5ynX/ADgMlPdUEwdI7w+vv6UgkLA=; b=ZSJ7BB9eO9IRB+
	gUnqwVy4aAwBhaJDLfmtaL85/BrO9Uvn9ePOgwbIF9gch0YfCQy+Ydg1xy+jCJ51ld1DIzRHlkdvO
	HJNIanM2KGDaPwCg6LuRv2ublD7iph6Trct1dH4x0C5guNdukge8wweXcJctxL5OOiG8trNRjzaBc
	yWih5pIK4BMWGW1KYTwQQnmMU6DDgyadq+5zSHSBsxOP+nntdiOq0Mbs+PmCCkHFCT0CzKXXeFtTX
	wWfDBjmIllt3Rppz/G3XFJhk945g6XIjKpxQFBujoEG1MOShqF4h6QcdzZvTVtH/zspMPiMtdFMY0
	izTZ9jgjn2xSw9BNbIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKPb-00000007e25-3ISx;
	Tue, 18 Feb 2025 10:01:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkK8z-00000007Zny-1loi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:43:58 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5461cb12e39so2120425e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739871835; x=1740476635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9j3FDtCSLrxBBi5ynX/ADgMlPdUEwdI7w+vv6UgkLA=;
        b=RK8z912b0bm24m+H2DVAMlTQAGVv1kUyaoJfVQ1H9OBhgJa4tJ49HJJ3RjAYTklpHv
         DkRVw0M5zFgFIb7fjyPyaw3a8lV7EE2jE3Nkpw9K2HjLvM7jxbPoCh0xoaCsaHE0wsjI
         OtFGUAPwhxs4Bu4VjLnIeaxNqu0OOI/6EjLzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739871835; x=1740476635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9j3FDtCSLrxBBi5ynX/ADgMlPdUEwdI7w+vv6UgkLA=;
        b=hHXRRaVk7rCB1X4L5qqFvEIvDIl0CznKfxDYUIrAcN5xPeumr1Iw9Eg/ZwVppzS8fD
         exuG9DfoFEwt8dsDjxmGZWv7W18/TYjR/W7qwji1y2iQmn2gdhSX+sxWIlOP/qT6lclk
         kVjW+pGtFyi5upwOQj3pAQ1mqmVgyQG6bwu0q1yed+VjOhOA0zUANTT010ggk/dQjPeU
         6sjzVrnkP1uS0Ncsw2l3KNgc021oDYYpI2ydkH+FNhcMN4kTsLKPHBs5/sYEwf09trG2
         zLxMAkXKi6KMEQb+Uy4weBFUuzR7z0ZYDdFulHgE0LprQpuRKk/u1rrFkK4nJtKJC9xd
         dklg==
X-Forwarded-Encrypted: i=1; AJvYcCWRu173rXKO8AeBIsJvh1t5RohiDaAnd1/ZVthKqq9GwPIvV34wdPXUuTWqf9jo+3vqXzT4AWgYqS3ron+yFDck@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4IrVi5py9Glq2djYZkSttTs7nynef4utw3ai0zMOnmg9qfoZF
	KUg9jPcjE4nhOiD66nbBw4fKUAlqCbzzPvdLyruAWYWCKb135rF4DLHte8RcVEaa4b0YdRQSSNL
	1LdfwFuJ0a1QBbx7MFUdqpNTlkkwelIPSP/1C
X-Gm-Gg: ASbGncvK/wjE6C1jPKYhDX6hS+izGpVON7r2aBvtsCEqcenX5wlf/D1bmzBAI4nhJ08
	mInYwkJJUTfJFniiLxPjNda6r8umTCoX5nuKDE0O4b3LUIg5PmSmyfsaPms9xrL6s80B5krdy2A
	7EuUtlyY2hLBhjx3zhtmjtsZ4N
X-Google-Smtp-Source: AGHT+IFlFPI5zREPHuDeV35TrewF5xMFDi2pmIizcSEr1MF1Kyd27IzONQ06Tosq2K+bGbditdWvnMiF3nl6toSE7rk=
X-Received: by 2002:a05:6512:eaa:b0:540:1a40:ab0d with SMTP id
 2adb3069b0e04-5452fe65367mr4774141e87.28.1739871835497; Tue, 18 Feb 2025
 01:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com> <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
In-Reply-To: <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Feb 2025 17:43:43 +0800
X-Gm-Features: AWEUYZnscch0ATD4RPMuHj0VAYHapvvByEnogTVDzdPu_Io7G9wuKVum6WjojR4
Message-ID: <CAGXv+5GSF=YSiHTgty1J2suAvVYUtOgPShW2mmvuxYiFwK-yeg@mail.gmail.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every panel
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_014357_482258_3F4A380E 
X-CRM114-Status: GOOD (  39.36  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2025 at 2:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > Adding a panel does currently not add a panel_bridge wrapping it. Usual=
ly
> > the panel_bridge creation happens when some other driver (e.g. the prev=
ious
> > bridge or the encoder) calls *_of_get_bridge() and the following elemen=
t in
> > the pipeline is a panel.
> >
> > This has some drawbacks:
> >
> >  * the panel_bridge is not created in the context of the driver of the
> >    underlying physical device (the panel driver), but of some other dri=
ver
> >  * that "other driver" is not aware of whether the returned drm_bridge
> >    pointer is a panel_bridge created on the fly, a pre-existing
> >    panel_bridge or a non-panel bridge
> >  * removal of a panel_bridge requires calling drm_panel_bridge_remove()=
,
> >    but the "other driver" doesn't know whether this is needed because i=
t
> >    doesn't know whether it has created a panel_bridge or not
> >
> > So far this approach has been working because devm and drmm ensure the
> > panel bridge would be dealloacted at some later point. However with the
> > upcoming implementation of dynamic bridge lifetime this will get more
> > complicated.
> >
> > Correct removal of a panel_bridge might possibly be obtained by adding =
more
> > devm/drmm technology to have it freed correctly at all times. However t=
his
> > would add more complexity and not help making lifetime more understanda=
ble.
> >
> > Use a different approach instead: always create a panel_bridge with a
> > drm_panel, thus matching the lifetime of the drm_panel and the panel_br=
idge
> > wrapping it. This makes lifetime much more straightforward to understan=
d
> > and to further develop on.
> >
> > With the panel_bridge always created, the functions to get a bridge
> > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler beca=
use
> > the bridge they are looking for exists already (if it can exist at all)=
. In
> > turn, this is implemented based on a variant of
> > drm_of_find_panel_or_bridge() that only looks for panels:
> > of_drm_find_bridge_by_endpoint(). In the future
> > drm_of_find_panel_or_bridge() can be progressively removed because ther=
e
> > will never be a panel not exposing a bridge.
> >
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >
> > ---
> >
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++-=
--------
> >  include/drm/drm_panel.h        |  8 +++++
> >  2 files changed, 66 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pa=
nel.c
> > index 58570ff6952ca313b3def084262c9bb3772272ef..6995de605e7317dd1eb153a=
fd475746ced764712 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -69,6 +69,9 @@ EXPORT_SYMBOL(drm_panel_init);
> >   */
> >  void drm_panel_add(struct drm_panel *panel)
> >  {
> > +     panel->bridge =3D drm_panel_bridge_add(panel);
> > +     WARN_ON(!panel->bridge);
> > +
> >       mutex_lock(&panel_lock);
> >       list_add_tail(&panel->list, &panel_list);
> >       mutex_unlock(&panel_lock);
> > @@ -86,6 +89,9 @@ void drm_panel_remove(struct drm_panel *panel)
> >       mutex_lock(&panel_lock);
> >       list_del_init(&panel->list);
> >       mutex_unlock(&panel_lock);
> > +
> > +     drm_panel_bridge_remove(panel->bridge);
> > +     panel->bridge =3D NULL;
> >  }
> >  EXPORT_SYMBOL(drm_panel_remove);
>
> Given that drm_panel_add and drm_panel_remove are typically called at
> probe/remove, it's pretty much equivalent to using devm. Both of these
> solutions aren't safe, and the drm_panel lifetime is still broken.

FWIW I believe this solves the panel vs panel_bridge lifetime
inconsistencies we previously reported [1]. Of course, as you rightly
point out, any pointers to the bridge become stale if the panel gets
removed.

> I'd rather work on a solution that actually fixes those lifetime issues.

I think that can happen once the bridges are ref-counted?

Instead of removing the bridge from the list, it can just clear the
panel pointer and have all the callbacks skip any operations involving
the panel.

The other option is to have the panel itself be ref-counted. I don't
think that's worth pursuing if the idea is to move everything over to
panel_bridge and things are somewhat ready.

ChenYu

[1] https://lore.kernel.org/dri-devel/20241009052402.411978-1-fshao@chromiu=
m.org/

