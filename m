Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA73AC02187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 01:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEdvPIkxs0AyPN5I1KLnG6c5mR46KG09278QoZxmjcw=; b=KOw107XtRIfRswJBJx4ZOBdMnv
	++wVK8R0iqha4J7y6FjW1W/WS93s9M+pGMKGCFfFAUUhvVScLnQCFQZNUQHoyJ8X12uK5vw5S2PKZ
	n1phwjgRmuTYl0lJ8VUX2ug+yEJHI43g1X5Pkf6tMoBvSMQHdyPxvO5SFRaAUHBk7+1E7GFlGKac4
	Ow0hNHTfjFY6sehsmQYmCtj2KVH+sjZtm+jld65Pm3wtt58b0PfL7Lr3SwcFYYyrug4XnQgJVzIib
	OrtF/JvVwIrs+DvCTpstAdTZQxRhZa9RIjY8jXWR6BhQzLkGQoewKJp3vt4QF5oNYc35Uhuqj9tMT
	VxqBee4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZgwl-00000004YG9-1aVp;
	Mon, 20 Jan 2025 01:51:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZgvT-00000004YAj-3DA0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 01:50:05 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCE2D6AF;
	Mon, 20 Jan 2025 02:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737337740;
	bh=tIAQ+WRbfhU71qAT4rI0eOeXoWqyEBTmMuq6XzgTKq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XurDVzNQ6diC1DxM7pYySIUNihycapGqGbCqYjMhHcpIKIZ0jpvXt59E783r6tEJz
	 sYddA3HHapyXFgBFqfXQoL1n3TMBnuKQpLEIFFEnxuZEjNYCrUiPCnQuwizuUeubOY
	 H61JaureXxgQMdxDgX/tPEA4b2yzKYX/dZdgpLCw=
Date: Mon, 20 Jan 2025 03:49:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: yuji2.ishikawa@toshiba.co.jp
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, nobuhiro1.iwamatsu@toshiba.co.jp,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer format
Message-ID: <20250120014955.GC2467@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
 <20250102131021.GG554@pendragon.ideasonboard.com>
 <TYWPR01MB9986F8A0AC34DCE0C1F35F2692E72@TYWPR01MB9986.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYWPR01MB9986F8A0AC34DCE0C1F35F2692E72@TYWPR01MB9986.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_175004_025914_BD32BD62 
X-CRM114-Status: GOOD (  23.66  )
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

On Mon, Jan 20, 2025 at 12:15:43AM +0000, yuji2.ishikawa@toshiba.co.jp wrote:
> On Thursday, January 2, 2025 10:10 PM, Laurent Pinchart wrote:
> > On Mon, Nov 25, 2024 at 06:21:41PM +0900, Yuji Ishikawa wrote:
> > > Adds the Toshiba Visconti VIIF specific metadata format
> > 
> > s/Adds/Add/
> > s/format/formats./
> 
> I'll fix the commit message.
> 
> > > - V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
> > > - V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics
> > >
> > > Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> > 
> > Assuming the documentation of the formats in subsequent patches is fine,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > ---
> > > Changelog v10:
> > > - add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
> > > - add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS
> > >
> > > Changelog v11:
> > > - no change
> > >
> > > Changelog v12:
> > > - add description for meta formats at v4l2-ioctl.c
> > >
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> > >  include/uapi/linux/videodev2.h       | 4 ++++
> > >  2 files changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 0304daa8471d..f7facb63b8ea 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1470,6 +1470,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >  	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
> > >  	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
> > >  	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
> > > +	case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP Parameters"; break;
> > > +	case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP Statistics"; break;
> 
> The media-ci has reported the following errors.
> Is it all right to leave these errors unfixed and keep the lines with
> the same style as other entries?

Yes, you can ignore those issues.

> # Test checkpatch:./0003-media-uapi-add-visconti-viif-meta-buffer-format.patch
> ERROR: trailing statements should be on next line
> #26: FILE: drivers/media/v4l2-core/v4l2-ioctl.c:1473:
> +case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP 
> +Parameters"; break;
> 
> ERROR: trailing statements should be on next line
> #27: FILE: drivers/media/v4l2-core/v4l2-ioctl.c:1474:
> +case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP 
> +Statistics"; break;
> 
> total: 2 errors, 0 warnings, 0 checks, 18 lines checked
> 
> > >  	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
> > >  	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
> > >  	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
> > > diff --git a/include/uapi/linux/videodev2.h
> > > b/include/uapi/linux/videodev2.h index a5418759e2ba..9e1f66fdf038
> > > 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -863,6 +863,10 @@ struct v4l2_pix_format {
> > >  #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
> > >  #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
> > >
> > > +/* Vendor specific - used for Visconti VIIF sub-system */
> > > +#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
> > > +#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
> > > +
> > >  #ifdef __KERNEL__
> > >  /*
> > >   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
Regards,

Laurent Pinchart

