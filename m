Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F12DC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHAoc0FofRKYJa47nuU2HcfzThh659ndI4EjYCLYT6I=; b=eqtF9jLvurOzd+vYqRiWGG2Ak7
	xz4kRmQ2nfy9sSPu65MnFVCVHKi5UJy/kMKhqLq0oEjScODw0SE98DgWIo/wLjysO9j4rnN98rJ6D
	EphgqvNc+63jInJsUjJtMlSmMRDgC5c0NjI56vV5hYwYgfy5gVQbl+B8nsKH85BVGDCBnwrgPDSmS
	QUspa4N61pIJbJTwiRdXr7ZYpQoF8OK4W6cUnL6Kmx7wBr4paaaOdCosOsAU/8XgnkmzGWu/NMdbA
	8u2ZCJLawhTxmat5GZEJNPpQYKbbW1y+eZ5qjslZ1wp/LlnCXB6untxQKXh9rtA2BeAwmDbSudr5+
	GxecfgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAhK-00000001jrf-2uYj;
	Mon, 30 Jun 2025 09:21:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAYp-00000001ihk-0vJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 09:12:24 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1CA20EFF;
	Mon, 30 Jun 2025 11:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751274720;
	bh=Xk1VTz99oaXPXWle19G2zMHoIPpOeSvs6Qc/pVHBAnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsKha93mqQrmPtUWxFH2IC0l8vxECmEaf2z03chq8Hrcd4Vt7rjcbA1BKUrT05/JQ
	 fbXrMTGnuNulIzMcsMqYEtud0xn+ApPjs8jGMut1pvsAnAoWGo9mJmvA5b0X/OCla1
	 qS76F+yZW/A4HkTwqCsliyLT+Vyvp+BZrQCRQWZM=
Date: Mon, 30 Jun 2025 12:11:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Michal Simek <michal.simek@amd.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630091156.GE24861@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630-psychedelic-tested-smilodon-adcbb3@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-psychedelic-tested-smilodon-adcbb3@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_021223_397254_7E5F3E59 
X-CRM114-Status: GOOD (  34.36  )
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

On Mon, Jun 30, 2025 at 10:27:55AM +0200, Maxime Ripard wrote:
> On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> > On 27-06-2025 20:19, Laurent Pinchart wrote:
> > > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> > > > XRGB8888 is the default mode that Xorg will want to use. Add support
> > > > for this to the Zynqmp DisplayPort driver, so that applications can use
> > > > 32-bit framebuffers. This solves that the X server would fail to start
> > > > unless one provided an xorg.conf that sets DefaultDepth to 16.
> > > > 
> > > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > > ---
> > > > 
> > > >   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > index 80d1e499a18d..501428437000 100644
> > > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
> > > >   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > >   		.swap		= true,
> > > >   		.sf		= scaling_factors_888,
> > > > +	}, {
> > > > +		.drm_fmt	= DRM_FORMAT_XRGB8888,
> > > > +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > +		.swap		= true,
> > > > +		.sf		= scaling_factors_888,
> > > 
> > > I'm afraid that's not enough. There's a crucial difference between
> > > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
> > > The graphics layer is blended on top of the video layer, and the blender
> > > uses both a global alpha parameter and the alpha channel of the graphics
> > > layer for 32-bit RGB formats. This will lead to incorrect operation when
> > > the 'X' component is not set to full opacity.
> > 
> > I spent a few hours digging in the source code and what I could find in the
> > TRM and register maps, but there's not enough information in there to
> > explain how the blender works. The obvious "XRGB" implementation would be to
> > just disable the blender.
> > 
> > What I got from experimenting so far is that the alpha component is ignored
> > anyway while the video path isn't active. So as long as one isn't using the
> > video blending path, the ARGB and XRGB modes are identical.
> > 
> > Guess I'll need assistance from AMD/Xilinx to completely implement the XRGB
> > modes.
> > 
> > (For our application, this patch is sufficient as it solves the issues like
> > X11 not starting up, OpenGL not working and horrendously slow scaling
> > performance)
> 
> Given that we consider XRGB8888 mandatory,

How about platforms that can't support it at all ?

> this patch is a good thing to
> have anyway, even if suboptimal, or broken in some scenario we can
> always fix later.

It needs to at least be updated to disallow XRGB8888 usage when the
video plan is enabled, or when global alpha is set to a non-opaque
value.

-- 
Regards,

Laurent Pinchart

