Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F372C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hDmSwpPfty2+80UUVW0t2AEqn99kE5Qq1qWxfl+xvk=; b=J9fsSz+FGVyDObU4MOvfIZuN3Q
	mfutQkMg+TIC52JviF0HVc4cqovxf+VynPmDrTSe+m+xL5XPtb786PqMPiRu6HbJcTdtV/oQeiLsF
	I5TeKA8j8ti7/lmwgOPsZutZCbcROY5QyQ1gi4hU+KYQQItt43sGhXasYbL224GAr0S2C/uADC8Yf
	TtLgdE6dHJikf6v6mPf9bMTboad9H9YVBA5we3xHi52/fhSozvP7v3JMpCj1lrcxYIig2KlK2w0Jz
	1kF4VVLtdPst2Fz4l58T1FA+GhKHL93Etc7Tl104C+qMP9AC8pUbJL+6yf7M+IdvZ/E3xBooqrBOo
	SSLFuscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9sj-00000001cAr-1qZz;
	Mon, 30 Jun 2025 08:28:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9lw-00000001bKA-3HEi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 08:21:54 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D4F0A669;
	Mon, 30 Jun 2025 10:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751271687;
	bh=EWa99hwmThBTiBF7TFwbpaAhJKWxk2bVrODee0yejRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vw5UtiKSbBsI7TgkpcllqmCEwNxX+52wJ7wHrhxZae0pY1G/5rbor/lVFhirKIH53
	 +e+k5HavIIjxHK/8F9H9ynXplWpRYgsbsIm/odpC4GLMrfck++Q7e9xKLV+6F4kRnp
	 aHtNudCty5qV+s6uPaAoC1vp9abgQuxrJiiaWdAs=
Date: Mon, 30 Jun 2025 11:21:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630082123.GA23516@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_012152_981580_600A9CFE 
X-CRM114-Status: GOOD (  31.23  )
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

On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> On 27-06-2025 20:19, Laurent Pinchart wrote:
> > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> >> XRGB8888 is the default mode that Xorg will want to use. Add support
> >> for this to the Zynqmp DisplayPort driver, so that applications can use
> >> 32-bit framebuffers. This solves that the X server would fail to start
> >> unless one provided an xorg.conf that sets DefaultDepth to 16.
> >>
> >> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >> ---
> >>
> >>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> >> index 80d1e499a18d..501428437000 100644
> >> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> >> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> >> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
> >>   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> >>   		.swap		= true,
> >>   		.sf		= scaling_factors_888,
> >> +	}, {
> >> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
> >> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> >> +		.swap		= true,
> >> +		.sf		= scaling_factors_888,
> >
> > I'm afraid that's not enough. There's a crucial difference between
> > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
> > The graphics layer is blended on top of the video layer, and the blender
> > uses both a global alpha parameter and the alpha channel of the graphics
> > layer for 32-bit RGB formats. This will lead to incorrect operation when
> > the 'X' component is not set to full opacity.
> 
> I spent a few hours digging in the source code and what I could find in 
> the TRM and register maps, but there's not enough information in there 
> to explain how the blender works. The obvious "XRGB" implementation 
> would be to just disable the blender.

That won't work when using global alpha unfortunately :-(

> What I got from experimenting so far is that the alpha component is 
> ignored anyway while the video path isn't active. So as long as one 
> isn't using the video blending path, the ARGB and XRGB modes are identical.

Correct, *if* global alpha is set to full opaque, then you can disable
the blender. That could confuse userspace though, enabling the graphics
plane with XRGB would work, and then enabling the video plane with
global alpha would fail.

> Guess I'll need assistance from AMD/Xilinx to completely implement the 
> XRGB modes.

The blender can ignore the alpha channel of the graphics plane for
formats that have no alpha channel. It would be nice if there was a bit
to force that behaviour for 32-bit RGB too, but I couldn't find any :-(
It's worth asking though.

> (For our application, this patch is sufficient as it solves the issues 
> like X11 not starting up, OpenGL not working and horrendously slow 
> scaling performance)
> 
> >>   	}, {
> >>   		.drm_fmt	= DRM_FORMAT_RGBA8888,
> >>   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,

-- 
Regards,

Laurent Pinchart

