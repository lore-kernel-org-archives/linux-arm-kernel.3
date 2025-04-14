Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F706C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 20:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNfZjFUF8tiixZr4lIXwI64Yf2XFIFSD4HDG3uAfy5Y=; b=J7l4bdPV859NoesHVOkOeRSBAq
	KK9Jk1TNhXVtiolWGbceRu/BbfMzV+357T6rCsjbDmHB0PvXQ4L4N+QSbkYpFww48JQN5mThqlxTh
	zTxj9274GRmN1vWSz1BJhwh0qV+2QrMkuL5m4oaufJ9Us6WCmRCTgIc+rleYL2VvxEt62SLV0jDjo
	YjsJEUch3CnXtN1boOXowtqIQ07iWH7OpIfWglj/SgFiWoYA3qO7yhP04lCdD+8wYZw5K/sI4ClZU
	ViMr7EBFVVWbzreSoWzzjUpoQNyA/wpZbHr2RIYfmSa4LTZwab/56AxsTUzBCnyJx0R9kj3eXpU5h
	DkJuQbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4QPg-00000003Sh2-01wy;
	Mon, 14 Apr 2025 20:28:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PMD-00000003J4n-3Wom;
	Mon, 14 Apr 2025 19:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eNfZjFUF8tiixZr4lIXwI64Yf2XFIFSD4HDG3uAfy5Y=; b=kUmTJcBf49jnaaAA65j/OijLqa
	0DYEVpxMghWUTpwJ5XokvdswnECl0d9mxLB3BTJnDS3j+2yGlBE2sHsY21e7HsuHYc0LJnqv/NKHn
	cxoW9sivYaBpGZQOSqAWsmAtQtzXZJSYCcLDRzA/r1DWWzn0wFVJwbE3LUj+s4UyphQRZjnttrN4I
	SMEELfIAIOM+MkHPlJoaVCNANPTSFUGDVjDKq9u9XGd+rv+vvYCuLw9J3PRN4ukHEecMA+LZAJHK/
	8ky4X2KWOD9N3cXJ1nQVp6W+JnTCZ53g0WVtDv3tddmVG7Lje9jSoO3LzD/ojguiKBJknJOOWiBqG
	DqiK5jeA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4PLw-00000009lBO-339F;
	Mon, 14 Apr 2025 19:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744658390;
	bh=5OW4OtjtSyBB2oKPfpNX3Y7CKOSwuIZGdOJ/RR0idGo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=f25TF4Y0FfGGEJNhRUjHuzeTyxe6aUlb6CUP4s97f12LFRjBK7jeu8bEuSL1NJUVT
	 eF2FKvulL4465Z2GVwWeSGBSx38bn5In78T0Qmf0ym0CSUl9daYBiBI9xpb+lB7ofa
	 ajtwNypoUMig5CIwQegKtxeS1dIoKSnNi3mWpiJVmkK9/rnHPKCQDCNEmDGqq5uM+d
	 vUFjyGClwgbiynHhHX6E15j2KQiU1rXm4yUbky0fpItXCDA3nq+9wpDlGUMp/nB/Bp
	 w6aw3kelbOy1Vay9YLQ9FwVxzam/gKiXPatuKJsq+NrI3w5y6/edkstBOwgKYoLWAL
	 kg56Xvc7LsKSQ==
Received: from [IPv6:2606:6d00:11:e976::c41] (unknown [IPv6:2606:6d00:11:e976::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAF2517E0FD5;
	Mon, 14 Apr 2025 21:19:48 +0200 (CEST)
Message-ID: <4052616c2ee6dafe1c8889454df73da2c4452f04.camel@collabora.com>
Subject: Re: [PATCH v2 4/5] media: vcodec: Implement manual request
 completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger	
 <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org, Sebastian Fricke
 <sebastian.fricke@collabora.com>
Date: Mon, 14 Apr 2025 15:19:47 -0400
In-Reply-To: <d3da96bf-d1c8-4bf8-a22a-21a43f78f27d@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
	 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-4-5b99ec0450e6@collabora.com>
	 <d3da96bf-d1c8-4bf8-a22a-21a43f78f27d@collabora.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_202021_954298_2FBD4B72 
X-CRM114-Status: GOOD (  31.82  )
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

Le lundi 14 avril 2025 à 11:11 +0200, AngeloGioacchino Del Regno a écrit :
> Il 10/04/25 17:39, Nicolas Dufresne ha scritto:
> > From: Sebastian Fricke <sebastian.fricke@collabora.com>
> > 
> > Rework how requests are completed in the MediaTek VCodec driver, by
> > implementing the new manual request completion feature, which allows to
> > keep a request open while allowing to add new bitstream data.
> > This is useful in this case, because the hardware has a LAT and a core
> > decode work, after the LAT decode the bitstream isn't required anymore
> > so the source buffer can be set done and the request stays open until
> > the core decode work finishes.
> > 
> > Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> > Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> This patch is great - but looks like it's worsening naming consistency across the
> driver.
> 
> Please look below.
> 
> > ---
> >   .../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h    | 13 +++++
> >   .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  4 +-
> >   .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 50 +++++++++++++++++
> >   .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 19 +++++++
> >   .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 63 +++++++++++++---------
> >   5 files changed, 124 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> > index 6087e27bd604d24e5d37b48de5bb37eab86fc1ab..c5fd37cb60ca0cc5fd09c9243b36fbc716c56454 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> > @@ -105,6 +105,19 @@ enum mtk_instance_state {
> >   	MTK_STATE_ABORT = 4,
> >   };
> >   
> > +/**
> > + * enum mtk_request_state - Stages of processing a request
> > + * @MTK_REQUEST_RECEIVED: Hardware prepared for the LAT decode
> > + * @MTK_REQUEST_LAT_DONE: LAT decode finished, the bitstream is not
> > + *		      needed anymore
> > + * @MTK_REQUEST_CORE_DONE: CORE decode finished
> > + */
> > +enum mtk_request_state {
> > +	MTK_REQUEST_RECEIVED = 0,
> > +	MTK_REQUEST_LAT_DONE = 1,
> > +	MTK_REQUEST_CORE_DONE = 2,
> > +};
> > +
> >   enum mtk_fmt_type {
> >   	MTK_FMT_DEC = 0,
> >   	MTK_FMT_ENC = 1,
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > index 98838217b97d45ed2b5431fdf87c94e0ff79fc57..036ad191a9c3e644fe99b4ce25d6a089292f1e57 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > @@ -889,8 +889,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> >   					src_buf->vb2_buf.req_obj.req;
> >   				v4l2_m2m_buf_done(src_buf,
> >   						VB2_BUF_STATE_ERROR);
> > -				if (req)
> > +				if (req) {
> >   					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
> > +					media_request_manual_complete(req);
> > +				}
> >   			}
> >   		}
> >   		return;
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > index 9247d92d431d8570609423156b989878f7901f1c..c80c1db509eaadd449bfd183c5eb9db0a1fc22bd 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > @@ -26,6 +26,56 @@
> >   #include "mtk_vcodec_dec_pm.h"
> >   #include "../common/mtk_vcodec_intr.h"
> >   
> > +static const char *state_to_str(enum mtk_request_state state)
> 
> static const char *mtk_vcodec_req_state_to_str(enum mtk_request_state state)

I'd keep this one an exception, its local to this C file.

> 
> > +{
> > +	switch (state) {
> > +	case MTK_REQUEST_RECEIVED:
> > +		return "RECEIVED";
> > +	case MTK_REQUEST_LAT_DONE:
> > +		return "LAT_DONE";
> > +	case MTK_REQUEST_CORE_DONE:
> > +		return "CORE_DONE";
> > +	default:
> > +		return "UNKNOWN";
> > +	}
> > +}
> > +
> > +void mtk_request_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request_state state,
> 
> void mtk_vcodec_request_complete( ....)

Ack, though the namspace here seems to be "mtk_vcodec_dec", so I'll opt
for that.

> 
> 
> > +			  enum vb2_buffer_state buffer_state, struct media_request *src_buf_req)
> > +{
> > +	struct mtk_request *req = req_to_mtk_req(src_buf_req);
> > +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +
> > +	mutex_lock(&ctx->lock);
> > +
> > +	if (req->req_state >= state) {
> > +		mutex_unlock(&ctx->lock);
> > +		return;
> > +	}
> > +
> > +	switch (req->req_state) {
> > +	case MTK_REQUEST_RECEIVED:
> > +		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> > +		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +		v4l2_m2m_buf_done(src_buf, buffer_state);
> > +		if (state == MTK_REQUEST_LAT_DONE)
> > +			break;
> > +		fallthrough;
> > +	case MTK_REQUEST_LAT_DONE:
> > +		dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > +		v4l2_m2m_buf_done(dst_buf, buffer_state);
> > +		media_request_manual_complete(src_buf_req);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
> > +			  state_to_str(req->req_state), state_to_str(state));
> > +	req->req_state = state;
> > +	mutex_unlock(&ctx->lock);
> > +}
> > +
> >   static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_dec_dev *dev)
> >   {
> >   	switch (dev->vdec_pdata->hw_arch) {
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > index ac568ed14fa257d25b533b6fd6b3cd341227ecc2..cd61bf46de6918c27ed39ba64162e5f2637f93b2 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > @@ -126,6 +126,17 @@ struct mtk_vcodec_dec_pdata {
> >   	bool uses_stateless_api;
> >   };
> >   
> > +/**
> > + * struct mtk_request - Media request private data.
> > + *
> > + * @req_state: Request completion state
> > + * @req: Media Request structure
> > + */
> > +struct mtk_request {
> 
> Maybe mtk_vcodec_dec_request? :-)

Ack.

> 
> > +	enum mtk_request_state req_state;
> > +	struct media_request req;
> > +};
> > +
> >   /**
> >    * struct mtk_vcodec_dec_ctx - Context (instance) private data.
> >    *
> > @@ -317,6 +328,11 @@ static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
> >   	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx, ctrl_hdl);
> >   }
> >   
> > +static inline struct mtk_request *req_to_mtk_req(struct media_request *req)
> 
> ...and this could become req_to_dec_req ... but no strong opinions on this one
> specifically, so feel free to keep this as it is.

Something like that, very subtle at this point.

> 
> > +{
> > +	return container_of(req, struct mtk_request, req);
> > +}
> > +
> >   /* Wake up context wait_queue */
> >   static inline void
> >   wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason, unsigned int hw_id)
> 
> After which....
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

thanks,

-- 
Nicolas Dufresne
Principal Engineer at Collabora

