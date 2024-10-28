Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D543D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=287KWmOfFKcs0dlBRnlt+d7btk7Hb/h6HiT3XKFPwiE=; b=4jdT+Hemy+U7zDv+TRZoyn0R8o
	DHi01gmUxOm3nMBinzT6B6wN0TrS7vVg3c3ObB8jV19rXp9K1LtwI3Qv2JZsMdEO2AGs1TVMyfKzn
	2DXtBwfgi3sRdZ3Rd4U29GXsHJvgcLSASBvsneCUK4AEG/vOeAzoehfDxuz5d48d8EsGD/198VDKi
	JBdBvH+o8ni7kaW5MCWfhvYJJK7bW8+zD3deULyvnyGeRaFp6MlhhocLdvWO4yDXB8cWR2gMJM4j2
	kKKT4kwrvwcBJ7zLVqxQmvxZzm1CWm1rPDFURYYAMxDB/Fg/RUMoCWY+E1XYaCZU0Hk5kkX2BWTch
	pTdD0bqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KKJ-00000009u3T-3qeG;
	Mon, 28 Oct 2024 07:38:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KGK-00000009so5-1yaF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2131A418DC;
	Mon, 28 Oct 2024 07:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E8CC4CEC3;
	Mon, 28 Oct 2024 07:33:59 +0000 (UTC)
Message-ID: <269ea671-e7cb-41fa-95a8-6d0a4cffff46@xs4all.nl>
Date: Mon, 28 Oct 2024 08:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 2/4] media: vivid: Add an rectangle control
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241022084040.3390878-1-ming.qian@nxp.com>
 <20241022084040.3390878-3-ming.qian@nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241022084040.3390878-3-ming.qian@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_003404_654369_1812356F 
X-CRM114-Status: GOOD (  15.29  )
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

On 22/10/2024 10:40, Ming Qian wrote:
> From: Yunke Cao <yunkec@google.com>
> 
> This control represents a generic read/write rectangle.
> It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This patch should come after patch 3/4 since it relies on the new
V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX flag introduced in 3/4.

Regards,

	Hans

> ---
>  .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index 8bb38bc7b8cc..bed5f4fb0c69 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -37,6 +37,7 @@
>  #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
>  #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
>  #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
> +#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
>  
>  #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
>  #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
> @@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
>  	.step = 1,
>  };
>  
> +static const struct v4l2_rect rect_def = {
> +	.top = 100,
> +	.left = 200,
> +	.width = 300,
> +	.height = 400,
> +};
> +
> +static const struct v4l2_rect rect_min = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 1,
> +	.height = 1,
> +};
> +
> +static const struct v4l2_rect rect_max = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 1000,
> +	.height = 2000,
> +};
> +
> +static const struct v4l2_ctrl_config vivid_ctrl_rect = {
> +	.ops = &vivid_user_gen_ctrl_ops,
> +	.id = VIVID_CID_RECT,
> +	.name = "Rect",
> +	.type = V4L2_CTRL_TYPE_RECT,
> +	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
> +	.p_def.p_const = &rect_def,
> +	.p_min.p_const = &rect_min,
> +	.p_max.p_const = &rect_max,
> +};
> +
>  /* Framebuffer Controls */
>  
>  static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
>  	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
> +	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
>  	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);


