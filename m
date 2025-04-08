Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E518EC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0kSChIaVjiUvF7KPRtfs/Rzj6xLNw7GdiX4MA6xykE=; b=gfbPfewOh93xBxxtNr4a+4/Nrn
	kCxt0MaE7vXM84IgUC4OMeNhDdWu5GSIC/E0Xd8QnGeIxdTMaENePpQECwQJyaWaEJ1trrG1VggI6
	K9R8ag0veiTmeUgaI1f0iWo3376JzFZN0dXb8+J6OBwudzdTGawvgLL3sjdmuV2eA16ymgEnD/b6W
	UOQhwwXhMzBZOcBHHOsHLianfKm8kx/UkZR60b/CbxnWquYvmjuVxQQJp0HQvbDWQaKfIT3Rswm5e
	l9VhtZD5PTlTqWGM8BvdtWL4CFALqU7z3vA9MtC5HDdRo0jxTNRz3FtwancvzErw8TAmOg7rPFybr
	oZF9KOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24O1-00000003GVF-12LV;
	Tue, 08 Apr 2025 08:32:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24MF-00000003GCk-0nYO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A8A8A48FBA;
	Tue,  8 Apr 2025 08:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87130C4CEE5;
	Tue,  8 Apr 2025 08:30:54 +0000 (UTC)
Message-ID: <d5a8988f-1038-4a8b-8478-968ceca37879@xs4all.nl>
Date: Tue, 8 Apr 2025 10:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: v4l: dev-decoder: Add source change
 V4L2_EVENT_SRC_CH_COLORSPACE
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org
Cc: nicolas@ndufresne.ca, shawnguo@kernel.org, robh+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
 <3e5f003a-f689-4f5a-ac75-6bf95379637b@xs4all.nl>
 <50ce67b7-ef06-4e8e-bf4f-f4b0d5e40961@oss.nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <50ce67b7-ef06-4e8e-bf4f-f4b0d5e40961@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_013059_373234_24222F80 
X-CRM114-Status: GOOD (  28.03  )
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

On 08/04/2025 08:34, Ming Qian(OSS) wrote:
> Hi Hans,
> 
> On 2025/4/7 17:54, Hans Verkuil wrote:
>> On 17/01/2025 07:19, Ming Qian wrote:
>>> Add a new source change V4L2_EVENT_SRC_CH_COLORSPACE that
>>> indicates colorspace change in the stream.
>>> The change V4L2_EVENT_SRC_CH_RESOLUTION will always affect
>>> the allocation, but V4L2_EVENT_SRC_CH_COLORSPACE won't.
>>>
>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>> ---
>>>   Documentation/userspace-api/media/v4l/vidioc-dqevent.rst | 9 +++++++++
>>>   .../userspace-api/media/videodev2.h.rst.exceptions       | 1 +
>>>   include/uapi/linux/videodev2.h                           | 1 +
>>>   3 files changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>> index 8db103760930..91e6b86c976d 100644
>>> --- a/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-dqevent.rst
>>> @@ -369,6 +369,15 @@ call.
>>>   	loss of signal and so restarting streaming I/O is required in order for
>>>   	the hardware to synchronize to the video signal.
>>>   
>>> +    * - ``V4L2_EVENT_SRC_CH_COLORSPACE``
>>> +      - 0x0002
>>> +      - This event gets triggered when a colorsapce change is detected at
>>
>> colorsapce -> colorspace
>>
> 
> Will fix in v3
> 
>>> +	an input. This can come from a video decoder. Applications will query
>>
>> It can also come from a video receiver. E.g. an HDMI source changes colorspace
>> signaling, but not the resolution.
>>
>>> +	the new colorspace information (if any, the signal may also have been
>>> +	lost)
>>
>> Missing . at the end. Also, if the signal is lost, then that is a CH_RESOLUTION
>> change, not CH_COLORSPACE.
>>
> OK, will fix in v3
>>> +
>>> +	For stateful decoders follow the guidelines in :ref:`decoder`.
>>
>> I think this should emphasize that if CH_COLORSPACE is set, but not CH_RESOLUTION,
>> then only the colorspace changed and there is no need to reallocate buffers.
>>
> 
> OK, will add in v3
> 
>> I also wonder if the description of CH_RESOLUTION should be enhanced to explain
>> that this might also imply a colorspace change. I'm not sure what existing codec
>> drivers do if there is a colorspace change but no resolution change.
> 
> I think there is no uniform behavior at the moment, it depends on the
> behavior of the decoder. Maybe most decoders ignore this.

Can you try to do a quick analysis of this? Don't spend too much time on this,
but it is helpful to have an idea of how existing codecs handle this.

Regards,

	Hans

> 
>>
>> I'm a bit concerned about backwards compatibility issues: if a userspace application
>> doesn't understand this new flag and just honors CH_RESOLUTION, then it would
>> never react to just a colorspace change.
>>
>> Nicolas, does gstreamer look at these flags?
> 
> I checked the gstreamer code, it does check this flag:
> 
> if (event.type == V4L2_EVENT_SOURCE_CHANGE &&
>      (event.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION)) {
>    GST_DEBUG_OBJECT (v4l2object->dbg_obj,
>        "Can't streamon capture as the resolution have changed.");
>    ret = GST_V4L2_FLOW_RESOLUTION_CHANGE;
> }
> 
> Currently the gstreamer can't handle the CH_COLORSPACE flag.
> 
> Thanks,
> Ming
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +
>>>   Return Value
>>>   ============
>>>   
>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>> index 35d3456cc812..ac47c6d9448b 100644
>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>>> @@ -526,6 +526,7 @@ replace define V4L2_EVENT_CTRL_CH_RANGE ctrl-changes-flags
>>>   replace define V4L2_EVENT_CTRL_CH_DIMENSIONS ctrl-changes-flags
>>>   
>>>   replace define V4L2_EVENT_SRC_CH_RESOLUTION src-changes-flags
>>> +replace define V4L2_EVENT_SRC_CH_COLORSPACE src-changes-flags
>>>   
>>>   replace define V4L2_EVENT_MD_FL_HAVE_FRAME_SEQ :c:type:`v4l2_event_motion_det`
>>>   
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index c8cb2796130f..242242c8e57b 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -2559,6 +2559,7 @@ struct v4l2_event_frame_sync {
>>>   };
>>>   
>>>   #define V4L2_EVENT_SRC_CH_RESOLUTION		(1 << 0)
>>> +#define V4L2_EVENT_SRC_CH_COLORSPACE		(1 << 1)
>>>   
>>>   struct v4l2_event_src_change {
>>>   	__u32 changes;
>>
> 


