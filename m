Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8303CD3F06D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2EUlzmFY6dEaEJrzdiJ/Pa6JuxcgHs5UoDjOmmW5jQ=; b=hE4l4VhNiESQogHptqFqpABlck
	/SSL1w6VhILl1ejARpgx1D/h8UnjXSZxCGVOXnqAQIfbvSXDAgBFUl+7fhmr6dBgZAXq52VemeNkI
	dVgnQCLjdG2V+5CfvpoDy7Isi3TJBaoGlC/Vr2rIzpsROmHfsM1EUyW6mqQ+KR2HsObtzrIe9ASqP
	CDmdGGl40iXsqAM2PWCLoKDqQcV3zmonhyQmXC2dy8s842PGOZ3a+k2k7yUr6w4GLR014DuqlJ5TJ
	maezRwt/mwywQo8RkE3ZZZ6RDFikE/pTk2pOXja70d3wlrZY94B7Kr8N5lC9RE78ixzQyBTKJPjgU
	HMnC3xHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6Zs-0000000GAti-44jk;
	Wed, 28 Jan 2026 14:31:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6Zp-0000000GAtK-3Ocw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:31:27 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E785BC6F;
	Wed, 28 Jan 2026 15:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769610645;
	bh=BbfxFM8c+zZV6jFhrZFIgkTKht8egaHY7UZljGTtoKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puDk4IbqJ3SRReC0ZdCcCVJ4mPCzRNW+qDy6j8+3V3hvG+UL8GjKB1n9NHkL9q8/Q
	 Ju96SmQu7EaxR31Vb4dIHbUtLwd+Wr44L8JaMEsniO3TOJRBjxoObMD9xHFFlPoceq
	 ka1wO0NB94f2RmRGW3WNfpTsz9M/Jn1z/wqpkRyk=
Date: Wed, 28 Jan 2026 16:31:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pekka Paalanen <ppaalanen@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <20260128143120.GA3201622@killaraus>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
 <20251201-xilinx-formats-v7-2-1e1558adfefc@ideasonboard.com>
 <20260128122144.GJ2558360@killaraus>
 <d8051388-d48d-412b-84d3-55399ce68447@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8051388-d48d-412b-84d3-55399ce68447@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_063126_780433_FE7FE71F 
X-CRM114-Status: GOOD (  19.87  )
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

On Wed, Jan 28, 2026 at 03:53:21PM +0200, Tomi Valkeinen wrote:
> On 28/01/2026 14:21, Laurent Pinchart wrote:
> > On Mon, Dec 01, 2025 at 02:18:44PM +0200, Tomi Valkeinen wrote:
> >> Add two new pixel formats:
> >>
> >> DRM_FORMAT_XV15 ("XV15")
> >> DRM_FORMAT_XV20 ("XV20")
> >>
> >> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> >> subsampled whereas XV20 is 2x1 subsampled.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>  drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
> >>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
> >>  2 files changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> >> index e662aea9d105..b22ef86428a1 100644
> >> --- a/drivers/gpu/drm/drm_fourcc.c
> >> +++ b/drivers/gpu/drm/drm_fourcc.c
> >> @@ -381,6 +381,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >>  		{ .format = DRM_FORMAT_S416,            .depth = 0,  .num_planes = 3,
> >>  		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
> >>  		  .hsub = 1, .vsub = 1, .is_yuv = true},
> >> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
> >> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >> +		  .hsub = 2, .vsub = 2, .is_yuv = true },
> > 
> > Given the horizontal subsampling, don't we have 6 pixels in 8 bytes ?
> 
> No, the hsub is applied first.
> 
> If you look at framebuffer_check() and the called functions, the
> calculations for the min_pitch for a 1920 wide XV15 buffer for the
> second plane is:
> 
> width = frame_width / hsub
> min_pitch = width * char_per_block[plane] / block_w[plane]
> 
> So:
> 
> width = 1920 / 2 = 960
> min_pitch = 960 * 8 / 3 = 2560

Indeed. I was looking at drm_format_info_min_pitch() and missed that it
was supposed to be called with the subsampled with. The argument is
documented as

 * @buffer_width: buffer width in pixels

which is quite ambiguous. The char_per_block documentation also does not
mention subsampling, adding to the confusion. This should be fixed, but
as far as this patch is concerned,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

