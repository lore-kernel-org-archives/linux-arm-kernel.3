Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0BECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEI8j5MLwQIMmp/tto4y5edHY0QtHqsLOROzDCJAx8I=; b=ltU4muerIcW/GmIdjHBPFAGWWB
	iN4Y6BU5tWvxtjvNsds/M8NX3EPBf3Ww0Tv3OaLSNvmt4lYZ9xwCOb7HBzoo7p8nJ34Y7BkbPV2hi
	6JfU1c+VDfrxKuS5XP0QXGpWbafHF4yH6rALgwhcSPnxTeaMTjY7MpCJ5dkohfNp5qudYMHu1VaJL
	DZzk6nG1Ft3rRmVFX+IIgqCOHQSuu7UKWHlabXqzxhIw7UhQuo/mcSGLmJUDwAnv+5NFKzBeOkNp0
	yNpzoX0nLLH/Abd8ZoUJpl99Ix+CZZP6T9DIz/uEPzOdwZY2DivIbWXqLL13qIlNQmOAUf1naIPVa
	hmy6BmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0OP-000000087Aw-2TNN;
	Tue, 09 Sep 2025 15:36:25 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtuz-00000005dqj-0M6S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 08:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1757407296;
 bh=DEI8j5MLwQIMmp/tto4y5edHY0QtHqsLOROzDCJAx8I=;
 b=bTstcdOuPQP+DkGxFkjhEAId52fYNKQp+Tho5tlMwKe+dAA9SyHU0eD+lyd3hy4iRWxUa83Ub
 9CbY4tSPZwTE/4ciSJcI/NNXRKcP5dyXok8a889i1STsXb1aNOX18T2Op+mIeAfDcfAdnUU+fgh
 uc0IXYaBXHYRv3gZCUnXdBeoOQ3G61tDW5KfOW9wxgwjArpdVJBzxzhwTqMh9emylUfPOw5bcPy
 NFdY61HYdWZYZ35lNEOog5edfpciS85Q7AiueLWSY8ryElPU9ihdQgh2S2iVIgLkO8kFdxD2j0H
 GRiBWaxXZaaDFb0aBb9/uBAK8BgryJHg9r0qLr8hJgJw==
X-Forward-Email-ID: 68bfe832381b9a7fa9093c07
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <baaf6f27-aac1-4567-b69f-84945de45a44@kwiboo.se>
Date: Tue, 9 Sep 2025 10:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: rkvdec: Add variants support
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250905161942.3759717-1-jonas@kwiboo.se>
 <20250905161942.3759717-3-jonas@kwiboo.se>
 <c05ea992-b0d8-4ea4-8a11-660b9cae4820@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <c05ea992-b0d8-4ea4-8a11-660b9cae4820@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_014137_145070_68681B8C 
X-CRM114-Status: GOOD (  27.84  )
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

Hi Detlev,

On 9/8/2025 8:32 PM, Detlev Casanova wrote:
> Hi Jonas,
> 
> On 9/5/25 12:19, Jonas Karlman wrote:
>> From: Alex Bee <knaerzche@gmail.com>
>>
>> Different versions of the Rockchip VDEC IP exists and one way they can
>> differ is what decoding formats are supported.
>>
>> Add a variant implementation in order to support flagging different
>> capabilities.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Changes in v3:
>> - Use a reference to rkvdec_variant
>> - Add num_regs field
> 
> Why are you adding this field ? I don't see it being used in a later patch.

Correct, this was briefly mentioned in the cover letter change log for v3:

  Add num_regs field to rkvdec_variant, currently not used for anything

This addition was mostly to make us aware that there are different
number of swregs for the different variants of "rkvdev1".

> 
> Would that be useful for writing the right amount of registers later 
> when switching to structs and memcpy ?

Correct, to my knowledge there are 3 different register configurations
for "rkvdec1", all are mostly extended with more registers at the end.

  68 (rk3288) -> 78 (rk3399) -> 109 (rk3328)

Currently there are writel() that are blindly written to regs >68 and
>78 regardless of variant. If we are to move to use io memcpy we should
probably ensure to write to the regs that exists for each variant.

> 
> I haven't checked how different the register maps are between those 
> different variants.

As mentioned above they mostly differ at the end (more swregs), or use
additional previously unused bits of existing swregs. E.g. rk3328 has
sw_wr_ddr_align_en, sw_scl_down_en and sw_allow_not_wr_unref_bframe
added to swreg1.

The added num_regs can be dropped or replaced with proper structs (or
something different) if you think that is a better way to signal how the
variants regs differs.

Regards,
Jonas

> 
>> - Collect r-b tag
>>
>> Changes in v2:
>> - No change
>> ---
>>   .../media/platform/rockchip/rkvdec/rkvdec.c   | 22 ++++++++++++++++++-
>>   .../media/platform/rockchip/rkvdec/rkvdec.h   | 11 ++++++++++
>>   2 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index c15fc238d6af..daf6d9ab2d1d 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/iommu.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/of_device.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm.h>
>>   #include <linux/pm_runtime.h>
>> @@ -327,6 +328,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>   		.ops = &rkvdec_hevc_fmt_ops,
>>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>>   		.decoded_fmts = rkvdec_hevc_decoded_fmts,
>> +		.capability = RKVDEC_CAPABILITY_HEVC,
>>   	},
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>> @@ -343,6 +345,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>>   		.decoded_fmts = rkvdec_h264_decoded_fmts,
>>   		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> +		.capability = RKVDEC_CAPABILITY_H264,
>>   	},
>>   	{
>>   		.fourcc = V4L2_PIX_FMT_VP9_FRAME,
>> @@ -358,6 +361,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>   		.ops = &rkvdec_vp9_fmt_ops,
>>   		.num_decoded_fmts = ARRAY_SIZE(rkvdec_vp9_decoded_fmts),
>>   		.decoded_fmts = rkvdec_vp9_decoded_fmts,
>> +		.capability = RKVDEC_CAPABILITY_VP9,
>>   	}
>>   };
>>   
>> @@ -1186,8 +1190,18 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>>   	}
>>   }
>>   
>> +static const struct rkvdec_variant rk3399_rkvdec_variant = {
>> +	.num_regs = 78,
>> +	.capabilities = RKVDEC_CAPABILITY_HEVC |
>> +			RKVDEC_CAPABILITY_H264 |
>> +			RKVDEC_CAPABILITY_VP9,
>> +};
>> +
>>   static const struct of_device_id of_rkvdec_match[] = {
>> -	{ .compatible = "rockchip,rk3399-vdec" },
>> +	{
>> +		.compatible = "rockchip,rk3399-vdec",
>> +		.data = &rk3399_rkvdec_variant,
>> +	},
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_rkvdec_match);
>> @@ -1198,16 +1212,22 @@ static const char * const rkvdec_clk_names[] = {
>>   
>>   static int rkvdec_probe(struct platform_device *pdev)
>>   {
>> +	const struct rkvdec_variant *variant;
>>   	struct rkvdec_dev *rkvdec;
>>   	unsigned int i;
>>   	int ret, irq;
>>   
>> +	variant = of_device_get_match_data(&pdev->dev);
>> +	if (!variant)
>> +		return -EINVAL;
>> +
>>   	rkvdec = devm_kzalloc(&pdev->dev, sizeof(*rkvdec), GFP_KERNEL);
>>   	if (!rkvdec)
>>   		return -ENOMEM;
>>   
>>   	platform_set_drvdata(pdev, rkvdec);
>>   	rkvdec->dev = &pdev->dev;
>> +	rkvdec->variant = variant;
>>   	mutex_init(&rkvdec->vdev_lock);
>>   	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
>>   
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index 209dd79ce9bd..c47457c954e5 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -22,6 +22,10 @@
>>   #include <media/videobuf2-core.h>
>>   #include <media/videobuf2-dma-contig.h>
>>   
>> +#define RKVDEC_CAPABILITY_HEVC		BIT(0)
>> +#define RKVDEC_CAPABILITY_H264		BIT(1)
>> +#define RKVDEC_CAPABILITY_VP9		BIT(2)
>> +
>>   struct rkvdec_ctx;
>>   
>>   struct rkvdec_ctrl_desc {
>> @@ -63,6 +67,11 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>>   			    base.vb.vb2_buf);
>>   }
>>   
>> +struct rkvdec_variant {
>> +	unsigned int num_regs;
>> +	unsigned int capabilities;
>> +};
>> +
>>   struct rkvdec_coded_fmt_ops {
>>   	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
>>   			  struct v4l2_format *f);
>> @@ -98,6 +107,7 @@ struct rkvdec_coded_fmt_desc {
>>   	unsigned int num_decoded_fmts;
>>   	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
>>   	u32 subsystem_flags;
>> +	unsigned int capability;
>>   };
>>   
>>   struct rkvdec_dev {
>> @@ -111,6 +121,7 @@ struct rkvdec_dev {
>>   	struct mutex vdev_lock; /* serializes ioctls */
>>   	struct delayed_work watchdog_work;
>>   	struct iommu_domain *empty_domain;
>> +	const struct rkvdec_variant *variant;
>>   };
>>   
>>   struct rkvdec_ctx {
> 
> Regards,
> 
> Detlev
> 


