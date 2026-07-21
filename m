Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2FDC44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 00:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg74ge3VwUm0ONnQANVLbXaGABthTvXi3OL3+DwEe/0=; b=nLrVx5UOjtp72vreXaGTy0FSF7
	FsYuQIQwjhtQf+eyFyqiQ6S1aZiQ5cgI2kw6PPotvD6yr/c2gKZcLs3nWdtuPoWg39PMiCyfPtnQY
	+aSVFD0WJvg38gMrILQf8xxD1uGCSpU3ad4CDWkFnNKEKyW/wxNNJ6elSR3bp58KPx3YkVtIkX1QA
	Z8WlezrAfTflpqJBRwLUiIjqIVhVHhk2AhGCq+Wl1KKiwRj5Lc7/vPuWliTlyJVoYs4WVHDMvsNYw
	NFTIspyfu3ElJ6x5QsnuOTuFarOnLgLKsIBrdeeC9wPWERh1k/viUOoqs2s0hchGQwp1lzU4jggWZ
	Oqd1+FNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlySU-000000088k7-1EIs;
	Tue, 21 Jul 2026 00:35:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlySR-000000088jj-2312
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 00:35:41 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8B9D517;
	Tue, 21 Jul 2026 02:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784594079;
	bh=Lvn5frLrdeg6fXfiqJU2JIXyGGVkn3WbSOMkwEazTX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8+BC2pOEUVbPBsZ1GSJZIMVRcM3xdIFr8ctRjF3hIl0Nb6KkUdk4+RyYEbyzx+PT
	 FWQjJ7MspMnw7Zl/V1KcrhBsGsfX1AYZxWvMBKQIzCjWBZadTDuWiT62HvIgPreefm
	 zVj9/xTlh03q/15ngZpLA5WbUWOgEzisqeDWMglA=
Date: Tue, 21 Jul 2026 03:35:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 0/6] imx8-isi: Bug fixes and format support
 enhancements
Message-ID: <20260721003536.GH50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260721003240.GG50424@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721003240.GG50424@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_173539_687853_950D7079 
X-CRM114-Status: GOOD (  23.61  )
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

On Tue, Jul 21, 2026 at 03:32:41AM +0300, Laurent Pinchart wrote:
> On Mon, Jul 20, 2026 at 11:34:02AM +0800, Guoniu Zhou wrote:
> > This series addresses critical bugs in the imx8-isi driver and extends
> > format support for high-end sensors and Android requirements.
> > 
> > Patch 1 fixes a critical stream ID validation bug in the crossbar routing
> > where the validation loop iterates over the wrong routing table, allowing
> > userspace to bypass validation entirely and configure invalid routes.
> > 
> > Patch 2 adds additional stream ID validation to enforce hardware constraints
> > (SOURCE stream must be 0).
> > 
> > Patch 3 fixes a stream reference counting bug in the crossbar that prevents
> > multiple streams from different virtual channels on the same input pad from
> > being enabled correctly. Only the first stream gets enabled in hardware,
> > subsequent streams are silently ignored.
> > 
> > Patch 4 adds support for 16-bit raw Bayer formats (SBGGR16, SGBRG16,
> > SGRBG16, SRGGB16) commonly used by high-end image sensors.
> > 
> > Patch 5 fixes incorrect color mapping for XBGR32 format in memory-to-memory
> > mode (marked for stable backport).
> > 
> > Patch 6 extends RGB format support by adding BGRA32, RGBA32, BGRX32, RGBX32,
> > and ARGB2101010 formats with full M2M capabilities to meet Android
> > requirements.
> > 
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> 
> I have taken patches 1, 2 and 5 in my tree already ([1]). The CI
> pipeline is running ([2]). Once it completes successfully, I will send a
> pull request. You can base the next version of this series (patches 3, 4
> and 6) on top of [1].
> 
> [1] https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/commit/db30b841e534f6b97008583f6e63c93473f14afc
> [2] https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1710408

This failed due to a mistake on my side. I've submitted a new pipeline:

https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1710412

> > ---
> > Changes in v2:
> > - [1/6] Split v1 patch 1/5 into two patches: this patch fixes the core
> >   for_each_active_route() bug, next patch adds additional stream
> >   validation (Frank Li)
> > - [2/6] New patch split from v1 1/5: adds stream ID validation on top of
> >   for_each_active_route() fix (Frank Li)
> > - [2/6] Remove incorrect sink_stream validation
> > - [3/6] Use fixed-size array for enabled_count instead of dynamic allocation
> > - [3/6] Use BIT_ULL() macro for u64 bitmask operations
> > - [3/6] Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
> > - [3/6] Remove mxc_isi_stream_counters_alloc/free functions
> > - [4/6] Add Reviewed-by tag from Frank Li
> > - [5/6] Reword commit description for clarity (Frank Li)
> > - [6/6] Add Reviewed-by tag from Frank Li
> > - Link to v1: https://lore.kernel.org/r/20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com
> > 
> > ---
> > Guoniu Zhou (5):
> >       media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing
> >       media: nxp: imx8-isi: Add stream ID validation for crossbar routing
> >       media: nxp: imx8-isi: Fix per-stream reference counting for multiplexed streams
> >       media: nxp: imx8-isi: Correct color map between V4L2 and ISI
> >       media: nxp: imx8-isi: Add additional 32-bit RGB format support
> > 
> > Laurentiu Palcu (1):
> >       media: nxp: imx8-isi: Add 16-bit raw Bayer format support
> > 
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  7 +-
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 92 +++++++++++++++-----
> >  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 24 ++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 97 +++++++++++++++++++++-
> >  4 files changed, 196 insertions(+), 24 deletions(-)
> > ---
> > base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
> > change-id: 20260626-isi-00f05b044ac9

-- 
Regards,

Laurent Pinchart

