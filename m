Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF044CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 07:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3huHVWh1kF0qHcGRWxpys1fWPp33qz0IdA6aub7Z2I4=; b=z+vi+rw4sLCFyFDke42l5tyPbu
	e3vezEcYz93/coV9pxK1FUoRJjwcEEokRDkEuq4iMB4lNwUctx78BSt5KK0YRGq3KYfiXHQJuIk6l
	yZ12OQnJJQJxCHNFJX/0S5OqlMBCrAY+CUdFuOD6JELcESYJ9AdeBrkDFWrkgU1ta8dqyvgdfNvKM
	UEFz/HfzxcH+K1qBhjkenaaEf3eG6CEFNVGcGgKlLz/7mSyPLb6N8uFK16JpSYov4oguW6l2fT2MR
	7Y2A5oPhb1EHE8R3lYMvwYJAww19YbnU9JJNIAtk+CIYXlSAVHM7Rts3MaJOsGdn12CIIom8TGMO4
	wuR7Hq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljqW-0000000AANe-1iYr;
	Tue, 12 Aug 2025 07:55:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljnu-0000000A9zL-11pI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 07:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3huHVWh1kF0qHcGRWxpys1fWPp33qz0IdA6aub7Z2I4=; b=nTl9QfeVXyhaU+/mQrAt2Bb3bk
	UvAbzatXFauRgbe4EB7aAn/jzaSAHEZAtpm0vi7e557o+Yc3sSfFaLzDTGXkS+zSiTkJWmD873HAm
	ahQrZWPXTZn2ii8hMJPTYn0wxgLnPzO5LK4li85HTM0+6lgA2Fh5uvt8xo3Xw8eaSUsSXTUd2K0eS
	j07dejGz4Ifby+f6evYu0f5p9CNQ0Ltm3jAlUf81+AoZynvVwgXb5WXW6w8yXIotoxEGK5RQI0wal
	dn91DicSOSuWmMfuMTK+nawbbCFPlnR/kY8vecEiuqMBlk9XdHbKDSKLH4sizpTLSs3MfiaqvGJuJ
	DWH4aA3w==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljnr-0000000FjdG-1UJg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 07:52:17 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8F2E9346;
	Tue, 12 Aug 2025 09:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754985080;
	bh=WeWSSBL8Nap6xqIoJm/Yt88k6wGSmXOsdouTKmVORWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbJW4ZCWkm05mqCROZZAxuq57T8H+l4IBFBE/7mq92UnDXATIteQjeKsBfQLBUy8l
	 Q5LMDKOeoDjxPZe3W8VintEGuP3lc199qpw4TAjT8OG8uL6IPdSYWMqDkV7l4tAasN
	 quJ9QQsKveyFC51uAzweu3wB4YY+eT0y2UZX8U7o=
Date: Tue, 12 Aug 2025 10:51:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 56/76] media: s5p-jpeg: Access v4l2_fh from file
Message-ID: <20250812075155.GG30054@pendragon.ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250810013100.29776-57-laurent.pinchart+renesas@ideasonboard.com>
 <b6f75a41-d5bb-46c7-966d-eeb1d47736e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6f75a41-d5bb-46c7-966d-eeb1d47736e5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_085215_539308_88099715 
X-CRM114-Status: GOOD (  23.59  )
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

Hi Andrzej,

On Tue, Aug 12, 2025 at 08:13:39AM +0200, Andrzej Pietrasiewicz wrote:
> Hi Laurent & Jacopo,
> 
> Thanks for taking care of this, this generally looks good to me,
> but please see inline.
> 
> W dniu 10.08.2025 o 03:30, Laurent Pinchart pisze:
> > From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > The v4l2_fh associated with an open file handle is now guaranteed
> > to be available in file->private_data, initialised by v4l2_fh_add().
> > 
> > Access the v4l2_fh, and from there the driver-specific structure,
> > from the file * in all ioctl handlers.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Update file-to-ctx macro due to removal of fh-to-ctx macro
> > ---
> >   .../platform/samsung/s5p-jpeg/jpeg-core.c     | 27 ++++++++-----------
> >   1 file changed, 11 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> > index 65f256db4c76..81792f7f8b16 100644
> > --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> > +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> > @@ -580,14 +580,9 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
> >   	return container_of(c->handler, struct s5p_jpeg_ctx, ctrl_handler);
> >   }
> >   
> > -static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
> > -{
> > -	return container_of(fh, struct s5p_jpeg_ctx, fh);
> > -}
> > -
> >   static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
> >   {
> > -	return fh_to_ctx(file_to_v4l2_fh(filp));
> > +	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
> >   }
> >   
> >   static int s5p_jpeg_to_user_subsampling(struct s5p_jpeg_ctx *ctx)
> > @@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
> >   
> >   static int s5p_jpeg_release(struct file *file)
> >   {
> > -	struct s5p_jpeg *jpeg = video_drvdata(file);
> >   	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> > +	struct s5p_jpeg *jpeg = video_drvdata(file);
> 
> What is the purpose of this change?

I don't think this is needed, I believe it can be dropped.

I'll send a new version (of this patch only, I don't want to respin the
whole series and spam everybody).

> >   
> >   	mutex_lock(&jpeg->lock);
> >   	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > @@ -1253,7 +1248,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
> >   static int s5p_jpeg_querycap(struct file *file, void *priv,
> >   			   struct v4l2_capability *cap)
> >   {
> > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> >   
> >   	if (ctx->mode == S5P_JPEG_ENCODE) {
> >   		strscpy(cap->driver, S5P_JPEG_M2M_NAME,
> > @@ -1301,7 +1296,7 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
> >   static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
> >   				   struct v4l2_fmtdesc *f)
> >   {
> > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> >   
> >   	if (ctx->mode == S5P_JPEG_ENCODE)
> >   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> > @@ -1314,7 +1309,7 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
> >   static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
> >   				   struct v4l2_fmtdesc *f)
> >   {
> > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> >   
> >   	if (ctx->mode == S5P_JPEG_ENCODE)
> >   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> > @@ -1340,7 +1335,7 @@ static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
> >   	struct vb2_queue *vq;
> >   	struct s5p_jpeg_q_data *q_data = NULL;
> >   	struct v4l2_pix_format *pix = &f->fmt.pix;
> > -	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
> > +	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
> >   
> >   	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
> >   	if (!vq)
> > @@ -1480,7 +1475,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
> >   static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
> >   				  struct v4l2_format *f)
> >   {
> > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> >   	struct v4l2_pix_format *pix = &f->fmt.pix;
> >   	struct s5p_jpeg_fmt *fmt;
> >   	int ret;
> > @@ -1539,7 +1534,7 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
> >   static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
> >   				  struct v4l2_format *f)
> >   {
> > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> >   	struct s5p_jpeg_fmt *fmt;
> >   
> >   	fmt = s5p_jpeg_find_format(ctx, f->fmt.pix.pixelformat,
> > @@ -1686,7 +1681,7 @@ static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
> >   	if (ret)
> >   		return ret;
> >   
> > -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> > +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
> >   }
> >   
> >   static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
> > @@ -1698,7 +1693,7 @@ static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
> >   	if (ret)
> >   		return ret;
> >   
> > -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> > +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
> >   }
> >   
> >   static int s5p_jpeg_subscribe_event(struct v4l2_fh *fh,
> > @@ -1795,7 +1790,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
> >   static int s5p_jpeg_g_selection(struct file *file, void *priv,
> >   			 struct v4l2_selection *s)
> >   {
> > -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> > +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> >   
> >   	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> >   	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)

-- 
Regards,

Laurent Pinchart

