Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED11DE9539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scwbmnDAQMbJy7JGAQadbK9OUSIUtSXlwXTYzDGAsy0=; b=tJG82KPVU97x9J05q+qlByvdDr
	z2f9uaME6iGWGUGyRWtqqo/5oPVxm/banuWjJIZI4truEQdKIqjJqPuRTZodjGgwo3CcQGZR93T5z
	uaxYr2BBY2F1wfVKmS9x/Q9uXkLiOy9utRny7Gu+zf8GKG3BAR+ktShAVB0X3MNukwO6f3tp7GZeA
	gmER0iG8Jje55ZWzoNnnBuziwvoUJZ7u6r2FsQXFObjwhf0CXtH6EPZFWVuezL7ACze6u3fXdtd4R
	biYjRnI7gTdDYfsNbmona8zTUaoWYhex9Vhu5VZne2+u1c4jql8K6zemVPCqvBoY0pRIOG6Q6TB/r
	RB3ZxRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnd3I-00000008Wdu-0i4w;
	Wed, 04 Feb 2026 13:36:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnd3F-00000008Wcy-34lp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:36:15 +0000
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6D9833;
	Wed,  4 Feb 2026 14:35:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770212130;
	bh=vByC9itxiQ9gShJfLpgICw6sB6P2HQFDf8Ul63fSmmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BADzg8zUazGN1CZlxjlY9Kiebki4u+pBqDpj0ocjCRU2QlDtZyOTOKy+GIC3rT3Pd
	 gkORelKtCUNUNAGLDE67Ho+tbBPP9dHOTT9pR2TWgPSmQdP813htmDLyCQD6kNrsKq
	 BLJdGsr4/0k3LMuBPLio+dWAyaLNkXtviFN0YWfs=
Date: Wed, 4 Feb 2026 14:36:08 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, 
	frank.li@nxp.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 07/11] media: Add meta formats supported by NXP neoisp
 driver
Message-ID: <aYNK_fmqsDX_e8cd@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-8-antoine.bouyer@nxp.com>
 <aYIsHfpMc2DZXYBr@zed>
 <b81b6e6a-10b7-43eb-b857-6c0d2636427e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b81b6e6a-10b7-43eb-b857-6c0d2636427e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_053613_916210_B1EA4B20 
X-CRM114-Status: GOOD (  24.25  )
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

Hi Antoine

On Wed, Feb 04, 2026 at 02:31:47PM +0100, Antoine Bouyer wrote:
> Hi Jacopo
>
> Le 03/02/2026 à 18:11, Jacopo Mondi a écrit :
> >
> > Hi Antoine
> >
> > On Fri, Jan 23, 2026 at 09:09:34AM +0100, Antoine Bouyer wrote:
> > > This patch adds new v4l2 meta formats definitions and descriptions used by
> > > neoisp driver for the parameters and statistics buffers:
> > >   - `V4L2_META_FMT_NEO_ISP_PARAMS` used for the legacy fixed-size
> > > parameters buffer structure.
> > >   - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
> > > extensible parameters structure, supporting a non-fixed-size buffer and
> > > changeable ISP configuration blocks.
> > >   - `V4L2_META_FMT_NEO_ISP_STATS` used for the legacy fixed-size statistics
> > > buffer structure.
> > >   - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
> > > extensible statistics structure, supporting a non-fixed-size buffer
> > > and changeable ISP statistics blocks.
> >
> > Uh interesting, you have existing userspace that needs legacy formats ?
>
> Yes we do have some available here (version with extensible formats will be
> the next one):
> https://github.com/nxp-imx/libcamera
>
> Not in mainline, thought.

I see.

However I don't think the mainline driver should support both formats.

And looking at your libcamera branch, it seem it already supports the
extensible version.


>
> BR
> Antoine
>
> >
> > >
> > > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-ioctl.c | 4 ++++
> > >   include/uapi/linux/videodev2.h       | 6 ++++++
> > >   2 files changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index 37d33d4a363d..c797cf11be38 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1471,6 +1471,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >        case V4L2_META_FMT_C3ISP_STATS:         descr = "Amlogic C3 ISP Statistics"; break;
> > >        case V4L2_META_FMT_MALI_C55_PARAMS:     descr = "ARM Mali-C55 ISP Parameters"; break;
> > >        case V4L2_META_FMT_MALI_C55_STATS:      descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_PARAMS:      descr = "NXP Neo ISP 3A Parameters"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:  descr = "NXP Neo ISP ext 3A Parameters"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_STATS:       descr = "NXP Neo ISP 3A Statistics"; break;
> > > +     case V4L2_META_FMT_NEO_ISP_EXT_STATS:   descr = "NXP Neo ISP ext 3A Statistics"; break;
> > >        case V4L2_PIX_FMT_NV12_8L128:   descr = "NV12 (8x128 Linear)"; break;
> > >        case V4L2_PIX_FMT_NV12M_8L128:  descr = "NV12M (8x128 Linear)"; break;
> > >        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index 848e86617d5c..5f4992452c66 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -889,6 +889,12 @@ struct v4l2_pix_format {
> > >   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
> > >   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
> > >
> > > +/* Vendor specific - used for NXP NEOISP sub-system */
> > > +#define V4L2_META_FMT_NEO_ISP_PARAMS         v4l2_fourcc('N', 'N', 'I', 'P') /* NXP NEOISP Parameters */
> > > +#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS     v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Ext Params */
> > > +#define V4L2_META_FMT_NEO_ISP_STATS          v4l2_fourcc('N', 'N', 'I', 'S') /* NXP NEOISP Statistics */
> > > +#define V4L2_META_FMT_NEO_ISP_EXT_STATS              v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Ext Stats */
> > > +
> > >   #ifdef __KERNEL__
> > >   /*
> > >    * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> > > --
> > > 2.52.0
> > >
> > >
>

