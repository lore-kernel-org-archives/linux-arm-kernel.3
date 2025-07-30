Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A840C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RD20S9/B4NdnAogMOR2KiY4OmUeYof6pQXYMHwBkIes=; b=1ktg7VDBwJAmnJBbbOt6jWahBf
	yKnBFY2K7WdJArbmG9LlO0cSwndNCBMI3/aRd7L+JlaxaAn74CgD5wyeXBFUptw3Ghr9d1E5ydZA/
	kU5JhRgCeUeKEjdp3eQOvJOLq8bI30pUvDmHZZ18gNSjCAEiboPGhB0psq2WgOSkI12tuHjOgeS7c
	sbtR2tfVNObHt8PmVCBp+8uZIkVDaOFNeDtb00xVeOAHu35D+rXWVWKPG4uK/qJwjIoR9spokHs9e
	HH0bkugeAzhPBclyUtln0fyWkZkyXPDaFT4GFzXNvPvnZun5bzF6ta3FfUkq0mzHnUXTEm9oNWk99
	i/DVZuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEA0-00000002T5i-3afs;
	Wed, 30 Jul 2025 21:16:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE5C-00000002SRj-1nbT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:11:31 +0000
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B548C0B;
	Wed, 30 Jul 2025 23:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753909842;
	bh=eTV7kQZVXkO0t6U/NUa8taJ4lj69rZbez7gVS/90+H8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EzqSyvXHkGuj7A/hvv3Z7k3FepbLPyx7DowhVF+p9Tb0z3v+dkHYfoolbQEcIF6Mi
	 P6HEhwX1e+h3Gu5dGm693URm7qbm930kJ8a462Gnhr1BrG0Y8ReYMDR6+sm+FYwk9d
	 JlOt+uxktWP+v6NHBRRK/eLUcd4oD5EN3PmsLZXE=
Message-ID: <7b6dbaab-ec40-4b84-8e8f-b53062568838@ideasonboard.com>
Date: Wed, 30 Jul 2025 22:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 18/19] media: platform: Add mali-c55 parameters video
 node
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
 jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org,
 mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-18-bc20e460e42a@ideasonboard.com>
 <aIot2pmuIIidZORo@kekkonen.localdomain>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <aIot2pmuIIidZORo@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_141130_616232_3C0D0574 
X-CRM114-Status: GOOD (  25.89  )
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

Hi Sakari, thanks for the comments

On 30/07/2025 15:36, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the update.
>
> On Mon, Jul 14, 2025 at 04:06:44PM +0100, Daniel Scally wrote:
>> +static int
>> +mali_c55_params_validate_buffer(struct device *dev,
>> +				const struct v4l2_params_buffer *buffer)
>> +{
>> +	/* Only v1 is supported at the moment. */
>> +	if (buffer->version != MALI_C55_PARAM_BUFFER_V1) {
>> +		dev_dbg(dev, "Unsupported extensible format version: %u\n",
>> +			buffer->version);
>> +		return -EINVAL;
>> +	}
> Is there anything else to validate here?


Not at this stage; the rest of the validation is done by Jacopo's new framework

>
> I guess nothing is done with the information other than the value is being
> checked above, but if it had an effect on something, one would need to copy
> the information to memory not accessible to the user.


Thats done later in .buf_prepare()

>
>> +
>> +	return 0;
>> +}
>> +
>> +static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>> +{
>> +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
>> +	struct mali_c55 *mali_c55 = params->mali_c55;
>> +	struct v4l2_params_buffer *config;
>> +	int ret;
>> +
>> +	ret = v4l2_params_buffer_validate(
>> +		mali_c55->dev, vb,
>> +		v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>> +		mali_c55_params_validate_buffer);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Copy the parameters buffer provided by userspace to the internal
>> +	 * scratch buffer. This protects against the chance of userspace making
>> +	 * changed to the buffer content whilst the driver processes it.
>> +	 */
>> +	config = vb2_plane_vaddr(vb, 0);
>> +	memcpy(buf->config, config, v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>> +
>> +	return v4l2_params_blocks_validate(mali_c55->dev, buf->config,
>> +					   mali_c55_block_handlers,
>> +					   ARRAY_SIZE(mali_c55_block_handlers),
>> +					   NULL);
>> +}
>> +
>> +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
>> +
>> +	spin_lock(&params->buffers.lock);
>> +	list_add_tail(&buf->queue, &params->buffers.queue);
>> +	spin_unlock(&params->buffers.lock);
>> +}
>> +
>> +static void mali_c55_params_return_buffers(struct mali_c55_params *params,
>> +					   enum vb2_buffer_state state)
>> +{
>> +	struct mali_c55_params_buf *buf, *tmp;
>> +
>> +	guard(spinlock)(&params->buffers.lock);
>> +
>> +	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, queue) {
>> +		list_del(&buf->queue);
>> +		vb2_buffer_done(&buf->vb.vb2_buf, state);
>> +	}
>> +}
>> +
>> +static int mali_c55_params_start_streaming(struct vb2_queue *q,
>> +					   unsigned int count)
>> +{
>> +	struct mali_c55_params *params = vb2_get_drv_priv(q);
>> +	struct mali_c55 *mali_c55 = params->mali_c55;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(mali_c55->dev);
>> +	if (ret)
>> +		goto err_return_buffers;
>> +
>> +	ret = video_device_pipeline_alloc_start(&params->vdev);
>> +	if (ret)
>> +		goto err_pm_put;
>> +
>> +	ret = video_device_pipeline_started(&params->vdev);
>> +	if (ret < 0)
>> +		goto err_stop_pipeline;
>> +
>> +	return 0;
>> +
>> +err_stop_pipeline:
>> +	video_device_pipeline_stop(&params->vdev);
>> +err_pm_put:
>> +	pm_runtime_put(mali_c55->dev);
>> +err_return_buffers:
>> +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
>> +
>> +	return ret;
>> +}
>> +
>> +static void mali_c55_params_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct mali_c55_params *params = vb2_get_drv_priv(q);
>> +	struct media_pipeline *pipe;
>> +
>> +	pipe = video_device_pipeline(&params->vdev);
>> +	if (mali_c55_pipeline_ready(pipe))
>> +		media_pipeline_stopped(pipe);
>> +
>> +	video_device_pipeline_stop(&params->vdev);
>> +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_ERROR);
>> +}
>> +
>> +static const struct vb2_ops mali_c55_params_vb2_ops = {
>> +	.queue_setup = mali_c55_params_queue_setup,
>> +	.buf_init = mali_c55_params_buf_init,
>> +	.buf_cleanup = mali_c55_params_buf_cleanup,
>> +	.buf_queue = mali_c55_params_buf_queue,
>> +	.buf_prepare = mali_c55_params_buf_prepare,
>> +	.wait_prepare = vb2_ops_wait_prepare,
>> +	.wait_finish = vb2_ops_wait_finish,
>> +	.start_streaming = mali_c55_params_start_streaming,
>> +	.stop_streaming = mali_c55_params_stop_streaming,
>> +};
>> +
>> +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
>> +{
>> +	struct mali_c55_params *params = &mali_c55->params;
>> +	struct v4l2_params_buffer *config;
>> +	struct mali_c55_params_buf *buf;
>> +	size_t block_offset = 0;
>> +	size_t max_offset;
>> +
>> +	spin_lock(&params->buffers.lock);
>> +
>> +	buf = list_first_entry_or_null(&params->buffers.queue,
>> +				       struct mali_c55_params_buf, queue);
>> +	if (buf)
>> +		list_del(&buf->queue);
>> +	spin_unlock(&params->buffers.lock);
>> +
>> +	if (!buf)
>> +		return;
>> +
>> +	buf->vb.sequence = mali_c55->isp.frame_sequence;
>> +	config = buf->config;
>> +
>> +	max_offset = config->data_size - sizeof(struct v4l2_params_block_header);
>> +
>> +	/*
>> +	 * Walk the list of parameter blocks and process them. No validation is
>> +	 * done here, as the contents of the config buffer are already checked
>> +	 * when the buffer is queued.
>> +	 */
>> +	while (block_offset < max_offset) {
>> +		const struct v4l2_params_handler *block_handler;
>> +		union mali_c55_params_block block;
>> +
>> +		block.data = &config->data[block_offset];
>> +
>> +		/* We checked the array index already in .buf_queue() */
> Not a lot seems to be done there in terms of validation.
>
> Even if that had been done, you can't trust the buffer contents as it
> remains mapped to the userspace.

Ah; a hangover of an earlier iteration before using the new v4l2-params helpers; the validation is 
done by those functions in .buf_prepare() now and the userspace buffer is memcopied to a scratch buffer.


Thanks

Dan

>> +		block_handler = &mali_c55_block_handlers[block.header->type];
>> +		block_handler->handler(mali_c55, block.header);
>> +
>> +		block_offset += block.header->size;
>> +	}
>> +
>> +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>> +}

