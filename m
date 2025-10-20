Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD91CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVEAanITBJZickAzIeYCefpzmUtUmG7kbqRO0qEajPU=; b=mAJxM/ETaHLjlT3A3GrtIP8H2S
	NWh6rbnVdbAPIIAvL0cLyv822x11jqDrsqHnYIQAL6SqRsNa3/xZVMrobahWhIi5LeMT/Wx1D5J1b
	ny2j61n6Ixp94/gcusvI0r5b5zLDDRE11nOn6NkUseFvUJIli2kWaRDedRoZuKZ3EZQl3xMDO22dt
	GxZJRhQ5WWbD0QH+D9xCcF6zMzkPyXF9D9kZi3pJgVnytIhgr+zdkf7CpQOdDDjYIAe0eht+9mijb
	rHSGzWlnDXu3O6qy5J6F5RxB2RAK+gL+KirOLNg/ZeXqP3f2+jBjJ6WBDeTJ1VHZRN6+lgd40o2KR
	cus890OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlmc-0000000CVI6-1OBN;
	Mon, 20 Oct 2025 09:02:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlmZ-0000000CVG7-0ZDB;
	Mon, 20 Oct 2025 09:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760950936;
	bh=YgW7RNRwW3S6WCQfv24k0K5SqHiGiIgg9OudwDYb5iA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sq2ZDYeJHtu0a0w2PkpJpIiSAucFLbJgMlfcm76ReK44WnIthkxc9/6e3hcjvBnjX
	 wFD2BUrEpKjgnPrcuSlob6ClrT8xJVtNy0ma9u17UNqlzgTo4P95RsZ4m8fNyJ/dZV
	 BzTj5CNEG+WF/7RZ6So6VeS29HidWmHYIg1iQ24uGrAD5sLtDFwejy2SQoJ3u5o/sJ
	 XnvqZQHg9LKc2A1M8ZvU2AGZ5GOidoY0jeaZ6Y1M9/f3+1Kayc22MwY8wDCEl6BoHb
	 SzmUEqVsVSs6303MQXk/xG/4Kj+cMfNUlMI0pCP5ClqMzRmOMavmOv/Qb62AFt3h0U
	 q+UiQv1O7oRjQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6457C17E055D;
	Mon, 20 Oct 2025 11:02:16 +0200 (CEST)
Message-ID: <f5df8dfd-4bd4-412b-b5e7-a7fba7885c1a@collabora.com>
Date: Mon, 20 Oct 2025 11:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] media: Documentation: uapi: Add V4L2 ISP
 documentation
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-4-6628bed5ca98@ideasonboard.com>
 <e82e7c1d-b4ac-49a0-9b76-d101395c7040@collabora.com>
 <bprg66hg3xoetosl7dwt2rcs6mpcksfalymmyidla6qvdrnm7u@fpn6237j25ir>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <bprg66hg3xoetosl7dwt2rcs6mpcksfalymmyidla6qvdrnm7u@fpn6237j25ir>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_020223_506543_D3B16B8F 
X-CRM114-Status: GOOD (  27.03  )
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

Hi Jacopo,

On 10/20/25 10:09, Jacopo Mondi wrote:
> Hi Michael
> 
>   thanks for review. I took all comments in but..

Cool, thanks!

> 
> 
> On Tue, Oct 14, 2025 at 11:23:29AM +0200, Michael Riesch wrote:
>> Hi Jacopo,
>>
>> Thanks for your efforts!
>>
>> On 10/14/25 10:00, Jacopo Mondi wrote:
>>> [...]
>>> +
>>> +The uAPI/ABI problem
>>> +--------------------
>>> +
>>> +By upstreaming the metadata formats that describe the parameters and statistics
>>> +buffers layout, driver developers make them part of the Linux kernel ABI. As it
>>> +sometimes happens for most peripherals in Linux, ISP drivers development is
>>> +often an iterative process, where sometimes not all the hardware features are
>>> +supported in the first version that lands in the kernel, and some parts of the
>>> +interface have to later be modified for bug-fixes or improvements.
>>
>> Suggestion:
>>
>> As for most peripherals, ISP driver development in Linux is often an
>> iterative process, in which not all of the hardware features are
>> supported in the first version. The support for them and/or bug fixes
>> may land in the kernel at a later stage.
>>
>>> +
>>> +If any later bug-fix/improvement requires changes to the metadata formats,
>>
>> s/bug-fix/bug fix
>>
>>> +this is considered an ABI-breakage that is strictly forbidden by the Linux
>>
>> s/ABI-breakage/ABI breakage
>>
>>> +kernel policies. For this reason, any change in the ISP parameters and
>>> +statistics buffer layout would require defining a new metadata format.
>>> +
>>> +For these reasons Video4Linux2 has introduced support for generic ISP parameters
>>> +and statistics data types, designed with the goal of being:
>>> +
>>> +- Extensible: new features can be added later on without breaking the existing
>>> +  interface
>>> +- Versioned: different versions of the format can be defined without
>>> +  breaking the existing interface
>>> +
>>> +ISP configuration
>>> +=================
>>> +
>>> +Before the introduction of generic formats
>>> +------------------------------------------
>>> +
>>> +Metadata cature formats that describe ISP configuration parameters were most
>>
>> s/cature/capture
>>
>> s/most the time/"most of the time" or "typically" or "usually" or
>> "normally"?
>>
>>> +the time realized by defining C structures that reflect the ISP registers layout
>>> +and gets populated by userspace before queueing the buffer to the ISP. Each
>>
>> s/gets/get
>>
>>> +C structure usually corresponds to one ISP *processing block*, with each block
>>> +implementing one of the ISP supported features.
>>> +
>>> +The number of supported ISP blocks, the layout of their configuration data are
>>> +fixed by the format definition, incurring the in the above described uAPI/uABI
>>> +problems.
>>
>> incurring the described uAPI/ABI problems described above.
>>
> 
> .. this one, for which I think the correct form is
> 
>  > +The number of supported ISP blocks, the layout of their configuration data are
>  > +fixed by the format definition, incurring in the above described uAPI/uABI
>  > +problem.

Maybe it's just me, but the sentence still does not sound correct to my
ears. First, you enumerate two items, so they should be joined with
"and", right? And then I understand that the two items have the
uAPI/uABI problem as consequence, correct? "to result in" or "to lead
to" seem to be better choices.

That said, don't hesitate to point out things that I misunderstood.

Best regards,
Michael

> 
> Thanks
>   j
> 
>>> +
>>> +Generic ISP parameters
>>> +----------------------
>>> +
>>> +The generic ISP configuration parameters format is realized by a defining a
>>> +single C structure that contains an header, followed by a binary buffer where
>>
>> s/an header/a header
>>
>>> +userspace programs a variable number of ISP configuration data block, one for
>>> +each supported ISP feature.
>>> +
>>> +The :c:type:`v4l2_isp_params_buffer` structure defines the parameters buffer
>>> +header which is followed by a binary buffer of ISP configuration parameters.
>>> +Userspace shall correctly populate the buffer header with the versioning
>>> +information and with the size (in bytes) of the binary data buffer where it will
>>> +store the ISP blocks configuration.
>>> +
>>> +Each *ISP configuration block* is preceded by an header implemented by the
>>> +:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
>>> +parameters for that specific block, defined by the ISP driver specific data
>>> +types.
>>> +
>>> +Userspace applications are responsible for correctly populating each block's
>>> +header fields (type, flags and size) and the block-specific parameters.
>>> +
>>> +ISP Block enabling, disabling and configuration
>>> +-----------------------------------------------
>>> +
>>> +When userspace wants to configure and enable an ISP block it shall fully
>>> +populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
>>> +bit in the block header's `flags` field.
>>> +
>>> +When userspace simply wants to disable an ISP block the
>>> +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bit should be set in block header's `flags`
>>> +field. Drivers accept a configuration parameters block with no additional
>>> +data after the header in this case.
>>> +
>>> +If the configuration of an already active ISP block has to be updated,
>>> +userspace shall fully populate the ISP block parameters and omit setting the
>>> +V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the
>>> +header's `flags` field.
>>> +
>>> +Setting both the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE and
>>> +V4L2_ISP_PARAMS_FL_BLOCK_DISABLE bits in the flags field is not allowed and not
>>> +accepted.
>>> +
>>> +Any further extension to the parameters layout that happens after the ISP driver
>>> +has been merged in Linux can be implemented by adding new blocks definition
>>> +without invalidating the existing ones.
>>> +
>>> +ISP statistics
>>> +==============
>>> +
>>> +Support for generic statistics format is not yet implemented in Video4Linux2.
>>> +
>>> +V4L2 ISP uAPI data types
>>> +========================
>>> +
>>> +.. kernel-doc:: include/uapi/linux/media/v4l2-isp.h
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index e9ac834d212f88222437e8d806800b2516d44f01..340353334299cd5eebf1f72132b7e91b6f5fdbfe 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>>>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>  L:	linux-media@vger.kernel.org
>>>  S:	Maintained
>>> +F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
>>>  F:	include/uapi/linux/media/v4l2-isp.h
>>>
>>>  VF610 NAND DRIVER
>>>
>>
>>
>> With the comments above addressed,
>>
>> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>>
>> Thanks and best regards,
>> Michael
>>
>>


