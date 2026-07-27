Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DC5C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BR47sFY02rjyaFgQpLpWrbsp2d8UGcBlVd/bchzIrY=; b=gyj69mBsIf85VQ/x2jVPIU7V3h
	WVpmtfIlM0NgawRFbAxNp2Zs/8jJgKeua6z523uGzQQhVCbmC7ropA9kuDOk5e7r8ajTT5fAjRFK/
	q8Y7QYciZLToFqb8Fgf9TjPONi4JuIwtP7cPOhQJB8+aIz4PJX14w4+3R+MEXfjwiMT5y2/rTezOH
	aW6ySm+udnDDdP5u2HrE8q7K47ftD/9MGWoIQHZf23l3938EDBb2kNB9aLEp3FeXN8WM2vztFd2cI
	KYafzJgdOuhqxAusuCXjulbIlN3QS7XjSNEVHbWI6sSJR1bc62tC+u5dIPxSEybjMRQgVOgSuL5zU
	j/j1CXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLld-00000002uFD-2GGL;
	Mon, 27 Jul 2026 13:53:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLlb-00000002uF5-3tkA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:53:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00AB5600AA;
	Mon, 27 Jul 2026 13:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F38B1F000E9;
	Mon, 27 Jul 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785160394;
	bh=/BR47sFY02rjyaFgQpLpWrbsp2d8UGcBlVd/bchzIrY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Iw7IFxE45Bj5UdZJOadM+BgQ3cYFvi2unUDh382kUCJhdJ/mZoJbxcz2wqlI2x+Ix
	 BiKpgy8hOzFv1595WZMfmm8djURcdaNgr2j1nqrwpwl4GRaPNbPkRgIL0Nipcu3Yii
	 sCfVVrdEJGvnX+ZKeOmmK32kIlE0Xsm9Y21z6XqssviqARhfO95f4+VlhzhYpC1tU5
	 O+MEy+ApQX0c3q+yusMquxtMNFU5JMJS+26vUwbFrlaTZfXHJ5o3gJv+F+MiFnx0Pr
	 f6IQTGwThBvA9jOJH1hL/f1SIBB3TmJ76ExoaO4j1HVh3gt/qyec3zS6Gr6o+0j1k2
	 KY2rWTriVjVSw==
Message-ID: <6decf51d-137c-4230-b823-64e61d76d0b8@kernel.org>
Date: Mon, 27 Jul 2026 15:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3 00/13] media: stm32: dcmipp: add support for MP2x pixel
 pipes
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
Content-Language: en-US, nl
In-Reply-To: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Alain,

On 24/07/2026 18:13, Alain Volmat wrote:
> This series add support for the main & aux pixel pipes
> available on the MP2x. In addition to the byte pipe
> already available, the DCMIPP is able to process two
> other streams in parallel, including ISP operations
> such as demosaicing, exposure etc, post-processing operations
> such as cropping, downscaling and various pixel formats
> output.
> 
> This series introduces the whole DCMIPP pipelines including
> static configuration of the ISP part (such as demosaicing).
> Dynamic control of the ISP as well as statistic extraction
> part will be added on top of this serie via usage of 2 other
> video devices (input & output) for statistics extraction and
> dynamic ISP parameter injection.

Since this adds a new subdev, can you post the output of
'v4l2-compliance -s' for the MP2x?

Just to be certain all corner cases have been handled.

Regards,

	Hans

> 
> Changes in v3:
> - Rebased on top of kernel v7.2-rc4
> - Fixed most of Sashiko review points
> - Link to v2: https://lore.kernel.org/r/20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com
> 
> Changes in v2:
> - Rebased on top of kernel v7.1-rc6
> - check-patch minor fixes
> - replaced kzalloc(.., sizeof(..),) with kzalloc_obj
> - Link to v1: https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com
> 
> ---
> Alain Volmat (13):
>       media: stm32: dcmipp: share struct dcmipp_device among subdevs
>       media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
>       media: stm32: dcmipp: bytecap: protect CMIER register access
>       media: stm32: dcmipp: move common structures in dcmipp-common.h
>       media: stm32: dcmipp: correct swap in YUYV data with parallel input
>       media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
>       media: stm32: dcmipp: introduce a dcmipp global media_pipeline
>       media: stm32: dcmipp: add pixel pipes helper functions
>       media: stm32: dcmipp: addition of a dcmipp-isp subdev
>       media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
>       media: stm32: dcmipp: add pixel-pipe support in bytecap
>       media: stm32: dcmipp: rename bytecap into capture
>       media: stm32: dcmipp: instantiate & link stm32mp25 subdevs
> 
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
>  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
>  .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 600 +++++++++----
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 124 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 491 +++++++++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 941 +++++++++++++++++++++
>  10 files changed, 2344 insertions(+), 285 deletions(-)
> ---
> base-commit: 48a5a7ab8d6ab7090564339e039c421f315de912
> change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
> 
> Best regards,
> --  
> Alain Volmat <alain.volmat@foss.st.com>
> 
> 


