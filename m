Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E18E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sb98FCKmeyAT2DVLwKOv3zAbNwq73exSEOZGxjhvBeY=; b=pu6lojDVlvw5QhOibvCywC5+tZ
	gmAvpGZE671xmqqgJCqccWARfnwnJQZfdkyFjn04DRQc83i8crPSdQYAGGwR6Rg+otmylsQFYVeMb
	WyajOvMYp9LcTPOS3vttJlmxxa1ztNRgjovcttDes4Xk6Rze/Uq7AwKPvCMRBEhL8gwbH5VKhr/ML
	xzQTV3kypwdk2YKBy4jBztfRjtIyUXahQxkgLkvi2PIf8XwEM9BX8pMXLeEjB4TLhru4IkgXXpJRh
	NCnrM9X9R7x9T39rmzw4by619Jj86FG7UDunix/fPAtwjXKd5B2eMwbV5WxbTEuQWQ2aJbA+0nk1A
	yw7SRu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuLo-0000000GMOW-2p01;
	Thu, 26 Dec 2024 20:20:56 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQuKc-0000000GMDo-2OiT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 20:19:44 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e537d9e3d75so7220633276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 12:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735244381; x=1735849181; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sb98FCKmeyAT2DVLwKOv3zAbNwq73exSEOZGxjhvBeY=;
        b=eEzEpwDRgpBeGWB2nEjIjQPOowrx1JMGlVAEuIQ/lawNqP3eObxmS+sc9ZS4B2YGOT
         GQzgyEBJaevzzc0MYKtHHNGrIbBF/XeXbZrj5aLM6vKaNViv/WamCmauX7plx7Q5X7UX
         GlpR8890qtJl/Nqqlm6w1mn2G3aqFhxIinthUFayHA/IzSzp91pmydWQj0wa4YEaYShz
         or8mXlpm+P+hyzmd21TYqzILXweLQCTPspPYIIl9GULdDcIXX5A+m6RAaiajgkzuw4Qx
         gmTzIKoT0hXI5BAqBjBEgWArnak1wEqi643kTuHzQ5Qw8Y6oOfLIvesw3WRE910c2ntH
         YX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735244381; x=1735849181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sb98FCKmeyAT2DVLwKOv3zAbNwq73exSEOZGxjhvBeY=;
        b=tsN6ngWCrFilEDzZC4dlJ7VGoVj+3BUtdcr3AcsXqUpbt+YVn5Y9nk7QXXjGKtlg12
         YF9Yi61kaekIygvqhlpaze2FFVnLuhF7s3Q+poZGdKRTmLG2/k/DRCHiA3Es6eAPqP8Q
         ++TPzfrVY16doPWW22Fm2N/baK7nGUwMrJEmQl9EqC3YldF/kcaRhCLbgtCm4CdUkSrI
         Z5XF2a6MXTS1uU5l7ZmB180odgCkVV1rqT5UTYkQ+Fib0+tH3FBe8PQP5yh7fZ+WqZ+x
         KiJD/783TytUoZzl4YWzY78GPnDlTLkIKvfCKAqc7evXI9vD7e/ha/wSU+O5q2x8f59h
         Mr+w==
X-Forwarded-Encrypted: i=1; AJvYcCXqu9gZPgIdZK29Wsohl4Lj4OFEqzSa6piYfap/oOUYLJ5iA/GMcHrQca+qY2yiGUUzvmJ4Q2kQHY8gpJ+tuPYz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk1rt56ZUII/83Di4TkWFHaM08GGd/AfZBmYf5VaAgN3/II4MF
	Wgi8QffW9dWxyM79pdujefqtN4XDz2dxHGv9vqgqCdJqrFdB+vnOFUl6W91+zQcw7C2LFSQd4or
	SozKhFWGkHfK3p+WRW+gBjD9bYbNhXURN20STAw==
X-Gm-Gg: ASbGnctOtwW8ywcXX943iYn+syEZygL39+UVcKpkJElP5mIMxVCLTYt6Lesp4LNJKXT
	0/fpG+pcH1KxPCZWzDcnxcQG0qjBNxGaqw1ctWu9GFws3G/MxNbgSImLJgYdALe2MDgXMeQ==
X-Google-Smtp-Source: AGHT+IGoBxXuv5ahv6Ndnqrf1Xf1S/+gYnZ7NrPaaZ39WftDOcJ5Lr0nHUjNy/jMupZW6W2JyistA+0q73RmPyQIxNE=
X-Received: by 2002:a05:690c:62c6:b0:6ef:59ef:f194 with SMTP id
 00721157ae682-6f3f80de678mr165847907b3.4.1735244380669; Thu, 26 Dec 2024
 12:19:40 -0800 (PST)
MIME-Version: 1.0
References: <20241223064147.3961652-1-victor.liu@nxp.com> <20241223064147.3961652-13-victor.liu@nxp.com>
 <wpxxedxabgo2kxf5wuosu76i5ud3ce2tywm2imhvad4nyy5u2d@qgfhev2hndba> <77540387-b1ac-46c1-a3c0-afbd34337d61@nxp.com>
In-Reply-To: <77540387-b1ac-46c1-a3c0-afbd34337d61@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Dec 2024 22:19:29 +0200
Message-ID: <CAA8EJpqwRfkjGCYfeRPj7u5hb_8fkMFDtcK1+YDG4nsez1WNXw@mail.gmail.com>
Subject: Re: [PATCH v7 12/19] drm/imx: Add i.MX8qxp Display Controller KMS
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, aisheng.dong@nxp.com, 
	agx@sigxcpu.org, u.kleine-koenig@baylibre.com, francesco@dolcini.it, 
	frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_121942_628387_8F511D91 
X-CRM114-Status: GOOD (  30.33  )
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

On Wed, 25 Dec 2024 at 09:18, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 12/23/2024, Dmitry Baryshkov wrote:
> > On Mon, Dec 23, 2024 at 02:41:40PM +0800, Liu Ying wrote:
> >> i.MX8qxp Display Controller(DC) is comprised of three main components that
> >> include a blit engine for 2D graphics accelerations, display controller for
> >> display output processing, as well as a command sequencer.  Add kernel
> >> mode setting support for the display controller part with two CRTCs and
> >> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
> >> registers of the display controller are accessed without command sequencer
> >> involved, instead just by using CPU.  The command sequencer is supposed to
> >> be used by the blit engine.
> >>
> >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v7:
> >> * Drop using typeof in macros and explicitly define variable types. (Dmitry)
> >> * Add a comment for disable_irq_nosync() to explain why _nosync. (Dmitry)
> >> * Inline dc_crtc_check_clock(). (Dmitry)
> >> * Use global drm_dc->pe. (Dmitry)
> >> * Drop dc_crtc_disable_at_unbind(). (Dmitry)
> >> * Add kernel doc for struct dc_{crtc,drm_device,plane}. (Dmitry)
> >> * Define common IRQ handlers separately for each IRQs. (Dmitry)
> >> * Rebase this patch upon next-20241220, so drop date entry from drm_driver
> >>   and correctly include drm/clients/drm_client_setup.h.
> >> * Collect Maxime's R-b tag.
> >>
> >> v6:
> >> * No change.
> >>
> >> v5:
> >> * Replace .remove_new with .remove in dc-drv.c. (Uwe)
> >>
> >> v4:
> >> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
> >>   function calls from KMS routine to initialization stage. (Dmitry)
> >> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
> >>   appropriate .h header files or .c source files. (Dmitry)
> >> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
> >> * Drop dc_drm->pe_rpm_count. (Dmitry)
> >> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
> >> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
> >>   Instead, put it in struct dc_crtc.  (Dmitry)
> >> * Call devm_request_irq() to request IRQs, instead of using drmm action.
> >>   (Dmitry)
> >> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
> >> * Select DRM_CLIENT_SELECTION due to rebase.
> >> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
> >> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
> >> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
> >>   rebase.
> >> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
> >>   register dc_drm_component_unbind_all() action.
> >> * Request interrupts in dc_crtc_post_init() after encoder initialization to
> >>   make sure next bridge is found first.
> >>
> >> v3:
> >> * No change.
> >>
> >> v2:
> >> * Find next bridge from TCon's port.
> >> * Drop drm/drm_module.h include from dc-drv.c.
> >>
> >>  drivers/gpu/drm/imx/dc/Kconfig    |   5 +
> >>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
> >>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 556 ++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
> >>  drivers/gpu/drm/imx/dc/dc-drv.c   | 238 +++++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-drv.h   |  22 ++
> >>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
> >>  drivers/gpu/drm/imx/dc/dc-kms.h   | 131 +++++++
> >>  drivers/gpu/drm/imx/dc/dc-plane.c | 241 +++++++++++++
> >>  9 files changed, 1342 insertions(+), 2 deletions(-)
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
> >>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
> >>
> >
> >
> >> +
> >> +static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
> >> +                                    struct drm_crtc_state *crtc_state)
> >> +{
> >> +    if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
> >> +        state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
> >> +        state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
> >> +            dc_plane_dbg(state->plane, "no off screen\n");
> >> +            return -EINVAL;
> >> +    }
> >
> > Nit: doesn't drm_atomic_helper_check_plane_state() ensure in this already?
>
> The can_position argument is set to true, though it is a bit unusual
> for primary plane.  If can_position is false, I think this should be
> ensured already by drm_atomic_helper_check_plane_state().

The function still calls drm_rect_clip_scaled() to clip the
plane_state->dst, does it not?

> > With that in mind
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Thanks.



-- 
With best wishes
Dmitry

