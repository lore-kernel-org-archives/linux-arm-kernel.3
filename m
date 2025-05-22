Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36B0C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4j4WHvnERIb72cK7Zp4QuKM4ysVlmWGJCxQ7ozUS70=; b=as6dVMBF0X6Li4IsxdjcvLAuU7
	x2LiqmYJr9fDOl3A0Es0uMLrw2MjZO9sX/OS/jMxps83POc5Ek/KtSuLbJcGJGV8iuMx9yeQMHLXW
	F9daXg1UbTnj0LBbeqgwcjiWr257Dgvm6GavGvj5XTQQlt8lBT2pDy/ncxUvo/XNfJsD09X+QhxPw
	sG3NmvrzeslwEJ8FbS38C1MLqeYlNCMhdo8iTAPYMMJmy1IwABa/ppNaksQpoJDQvhyxg87bqzrsn
	/Rx3wa1qz8o4JcfITxPRzbhlrC1zK7qkUSo46Rfd9NdDTheCyXfK+7TvOylEG869OMIhh9l3ihEnm
	g5SIZEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI91b-00000001eGP-47rj;
	Thu, 22 May 2025 16:44:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8zU-00000001e21-0Kqn;
	Thu, 22 May 2025 16:41:57 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 984D7605;
	Thu, 22 May 2025 18:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747932092;
	bh=SpacbBiVU2Pqfd4vTeSA9VS+2Q412z1EYkTywjIUPIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i59d+CEOAGVcQEkILZCTGVG8HgC4GGDp38wDv3SyLG6MrXwemerYL0q9SJQLFNImI
	 ifEBKqt5t1wuw5FD/maDZl90RNN/vaadS2qhq/eA0D0tmXmNFue5nBFyIPEQmv1aFY
	 +2ySTC4TBO3ntFS8scy5KyVCRst1VitxjNLuEmO0=
Date: Thu, 22 May 2025 18:41:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH 2/3] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
Message-ID: <20250522164147.GV12514@pendragon.ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
 <20250522150944.400046-4-stefan.klug@ideasonboard.com>
 <20250522155641.GU12514@pendragon.ideasonboard.com>
 <174793176608.244022.1396416000017796106@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174793176608.244022.1396416000017796106@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_094156_259244_85783EEB 
X-CRM114-Status: GOOD (  43.85  )
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

On Thu, May 22, 2025 at 06:36:06PM +0200, Stefan Klug wrote:
> Hi Laurent,
> 
> Thank you for the review.
> 
> Quoting Laurent Pinchart (2025-05-22 17:56:41)
> > Hi Stefan,
> > 
> > Thank you for the patch.
> > 
> > On Thu, May 22, 2025 at 05:08:39PM +0200, Stefan Klug wrote:
> > > Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> > > query the parameters blocks supported by the current kernel on the
> > > current hardware from user space.
> > > 
> > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > ---
> > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
> > >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 50 ++++++++++++++++++-
> > >  include/uapi/linux/rkisp1-config.h            | 10 ++++
> > >  include/uapi/linux/v4l2-controls.h            |  6 +++
> > >  4 files changed, 67 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > index ca952fd0829b..5f187f9efc7b 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > @@ -415,6 +415,8 @@ struct rkisp1_params {
> > >       spinlock_t config_lock; /* locks the buffers list 'params' */
> > >       struct list_head params;
> > >  
> > > +     struct v4l2_ctrl_handler ctrls;
> > > +
> > >       const struct v4l2_meta_format *metafmt;
> > >  
> > >       enum v4l2_quantization quantization;
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > index 918eb06c7465..60c9b3c46593 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > @@ -2736,6 +2736,45 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
> > >       return vb2_queue_init(q);
> > >  }
> > >  
> > > +static int rkisp1_ctrl_init(struct rkisp1_params *params)
> > > +{
> > > +     int ret;
> > > +
> > > +     v4l2_ctrl_handler_init(&params->ctrls, 1);
> > > +
> > > +     struct v4l2_ctrl_config ctrl_config = {
> > > +             .id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> > > +             .name = "Supported Params Blocks",
> > > +             .type = V4L2_CTRL_TYPE_BITMASK,
> > > +             .flags = V4L2_CTRL_FLAG_READ_ONLY,
> > > +     };
> > 
> >         struct v4l2_ctrl_config ctrl_config = {
> >                 .id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> >                 .name = "Supported Params Blocks",
> >                 .type = V4L2_CTRL_TYPE_BITMASK,
> >                 .flags = V4L2_CTRL_FLAG_READ_ONLY,
> >         };
> >         int ret;
> > 
> >         v4l2_ctrl_handler_init(&params->ctrls, 1);
> > 
> > Mixing code and variable declarations is still usually frown upon in the
> > kernel.
> 
> I thought frown upon is not a no. And as this structure is not yet
> complete and is modified afterwards it feels natural to me to put it
> close to that place. But I can move it above the function. You decide.

It obviously take someone to make the first move for things to change
:-) I however tend to favour consistency in coding style within a
driver.

> > > +
> > > +     for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_ext_params_handlers); i++) {
> > > +             const struct rkisp1_ext_params_handler *block_handler;
> > > +
> > > +             block_handler = &rkisp1_ext_params_handlers[i];
> > > +             ctrl_config.max |= BIT(i);
> > > +
> > > +             if ((params->rkisp1->info->features & block_handler->features) !=
> > > +                 block_handler->features)
> > > +                     continue;
> > > +
> > > +             ctrl_config.def |= BIT(i);
> > > +     }
> > > +
> > > +     v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
> > > +
> > > +     params->vnode.vdev.ctrl_handler = &params->ctrls;
> > > +
> > > +     if (params->ctrls.error) {
> > > +             ret = params->ctrls.error;
> > > +             v4l2_ctrl_handler_free(&params->ctrls);
> > > +             return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  int rkisp1_params_register(struct rkisp1_device *rkisp1)
> > >  {
> > >       struct rkisp1_params *params = &rkisp1->params;
> > > @@ -2776,10 +2815,16 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
> > >  
> > >       video_set_drvdata(vdev, params);
> > >  
> > > +     ret = rkisp1_ctrl_init(params);
> > > +     if (ret) {
> > > +             dev_err(rkisp1->dev, "Control initialization error %d\n", ret);
> > > +             goto err_mutex;
> > > +     }
> > > +
> > >       node->pad.flags = MEDIA_PAD_FL_SOURCE;
> > >       ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> > >       if (ret)
> > > -             goto err_mutex;
> > > +             goto err_ctrl;
> > >  
> > >       ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > >       if (ret) {
> > > @@ -2792,6 +2837,8 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
> > >  
> > >  err_media:
> > >       media_entity_cleanup(&vdev->entity);
> > > +err_ctrl:
> > > +     v4l2_ctrl_handler_free(&params->ctrls);
> > >  err_mutex:
> > >       mutex_destroy(&node->vlock);
> > >       return ret;
> > > @@ -2808,5 +2855,6 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
> > >  
> > >       vb2_video_unregister_device(vdev);
> > >       media_entity_cleanup(&vdev->entity);
> > > +     v4l2_ctrl_handler_free(&params->ctrls);
> > >       mutex_destroy(&node->vlock);
> > >  }
> > > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > > index 2d995f3c1ca3..4fc8f221d0c4 100644
> > > --- a/include/uapi/linux/rkisp1-config.h
> > > +++ b/include/uapi/linux/rkisp1-config.h
> > > @@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
> > >  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE   (1U << 0)
> > >  #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE    (1U << 1)
> > >  
> > > +/* A bitmask of parameters blocks supported on the current hardware. */
> > > +#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS   (V4L2_CID_USER_RKISP1_BASE + 0x01)
> > > +
> > >  /**
> > >   * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
> > >   *                                      header
> > > @@ -1520,6 +1523,13 @@ enum rksip1_ext_param_buffer_version {
> > >   * V4L2 control. If such control is not available, userspace should assume only
> > >   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
> > >   *
> > > + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can be used
> > > + * to query the blocks supported by the current hardware. It contains a bitmask
> > 
> > s/current hardware/device/
> > 
> > > + * where each bit represents the availability of the corresponding entry
> > > + * from the :c:type:`rkisp1_ext_params_block_type` enum. The max value of the
> > > + * control represents the blocks supported by the current kernel (independent of
> > > + * the current hardware).
> > 
> >  * from the :c:type:`rkisp1_ext_params_block_type` enum. The current and default
> >  * values of the control represents the blocks supported by the device instance,
> >  * while the maximum value represents the blocks supported by the kernel driver,
> >  * independently of the device instance.
> > 
> > I was going to say that the control should be documented in
> > Documentation/userspace-api/drivers/rkisp1.rst, but rkisp1-config.h is
> > pulled in the documentation tree by
> > Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst, so I'm OK with
> > this. Hans, Mauro, are you fine as well with documenting the control
> > here ?
> 
> Looking at the docs, I realized that most people will read the already
> existing docs. So creating a completely new file just for the single
> control didn't feel good. As you like.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > + *
> > >   * For each ISP block that userspace wants to configure, a block-specific
> > >   * structure is appended to the @data buffer, one after the other without gaps
> > >   * in between nor overlaps. Userspace shall populate the @data_size field with
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > index 72e32814ea83..f836512e9deb 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -222,6 +222,12 @@ enum v4l2_colorfx {
> > >   */
> > >  #define V4L2_CID_USER_UVC_BASE                       (V4L2_CID_USER_BASE + 0x11e0)
> > >  
> > > +/*
> > > + * The base for Rockchip ISP1 driver controls.
> > > + * We reserve 16 controls for this driver.
> > > + */
> > > +#define V4L2_CID_USER_RKISP1_BASE            (V4L2_CID_USER_BASE + 0x1220)
> > > +
> > >  /* MPEG-class control IDs */
> > >  /* The MPEG controls are applicable to all codec controls
> > >   * and the 'MPEG' part of the define is historical */

-- 
Regards,

Laurent Pinchart

