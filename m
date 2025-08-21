Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60475CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzJex18BjP7dcCWTmV+HczcIBe0ny8dN27vBV7NIA0g=; b=WFSepAmv+F0lZJqx2c7wk6hoVJ
	QsK2hImZvAdOlPADe5FwzjBx9qMDwNBivpuZaNCj6GA33y2XGvLc28wdGh+Fsl1q0VDLqaizXf1jh
	mpYlZGVHG3v7dYSSYDdlNbVoG7xo+KXcBnwAwd5jqmqgoL2NdxmICKSytsdZ3p9z4G2pzHQEgE/77
	KP3J2MXo9Fx5yye85E3CUyWYad8btP+IICvKOEIBfBWQiL/YPkSzGNAyAV6xGCsrlEf7HmXQ3D8Uk
	rz0FJwCOrZSCAbt2+zUlu6pJlpNPxfCPCVviHFhBwdHUc+0doc62uiuKMWs359JU3lA2wdntOZNfz
	OAxYMeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Ev-0000000HMLs-3tvB;
	Thu, 21 Aug 2025 15:30:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3G7-0000000GisF-0hMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:15:08 +0000
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96A03FDB;
	Thu, 21 Aug 2025 13:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755774842;
	bh=HUiMLgcL3j24/5RU0RmlPCklcQKA3E1W0NlFWOnCsa8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qnTmU4gkWg3g5Pq5at2PXtDR52AIRZV+0RBirExbsRy8zNtMzeeQn9pVsR0km5GRK
	 Px8TNQmokC2cnHtbL8EPaSIeNu4N4T5lFKnHSsLatf2Dcuz2RtrZSamslnxidwGwaN
	 4mTcDCp1wYo342OKANQm94ihHcQ2g640FHc6L62E=
Message-ID: <d91abbd2-654b-46f0-8d0d-0e26321582a8@ideasonboard.com>
Date: Thu, 21 Aug 2025 12:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/19] media: uapi: Add controls for Mali-C55 ISP
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-8-bc20e460e42a@ideasonboard.com>
 <rixk2meihmzkixemu7uygd6ebojhwgxi5xfgcwbamydzk25yt5@j4t4eliandqq>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <rixk2meihmzkixemu7uygd6ebojhwgxi5xfgcwbamydzk25yt5@j4t4eliandqq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041507_352232_86B8612A 
X-CRM114-Status: GOOD (  28.85  )
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

Hi Jacopo

On 05/08/2025 12:27, Jacopo Mondi wrote:
> Hi Dan
> 
> On Mon, Jul 14, 2025 at 04:06:34PM +0100, Daniel Scally wrote:
>> Add definitions and documentation for the custom control that will
>> be needed by the Mali-C55 ISP driver. This will be a read only
>> bitmask of the driver's capabilities, informing userspace of which
>> blocks are fitted and which are absent.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v11:
>>
>> 	- Reserve 16 controls in line with other drivers
>>
>> Changes in v10:
>>
>> 	- None
>>
>> Changes in v9:
>>
>> 	- New patch
>> ---
>>   .../userspace-api/media/drivers/index.rst          |  1 +
>>   .../userspace-api/media/drivers/mali-c55.rst       | 55 ++++++++++++++++++++++
>>   include/uapi/linux/media/arm/mali-c55-config.h     | 26 ++++++++++
>>   include/uapi/linux/v4l2-controls.h                 |  6 +++
>>   4 files changed, 88 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
>> index d706cb47b1122b6e145a02ab826eb3ecc7997c2b..02967c9b18d6e90f414ccc1329c09bffee895e68 100644
>> --- a/Documentation/userspace-api/media/drivers/index.rst
>> +++ b/Documentation/userspace-api/media/drivers/index.rst
>> @@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
>>   	cx2341x-uapi
>>   	dw100
>>   	imx-uapi
>> +	mali-c55
>>   	max2175
>>   	npcm-video
>>   	omap3isp-uapi
>> diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Documentation/userspace-api/media/drivers/mali-c55.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e8519da77d737b91a931bbe47920af707eebf110
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/drivers/mali-c55.rst
>> @@ -0,0 +1,55 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +Arm Mali-C55 ISP driver
>> +=======================
>> +
>> +The Arm Mali-C55 ISP driver implements a single driver-specific control:
>> +
>> +``V4L2_CID_MALI_C55_CAPABILITIES``
>> +    Detail the capabilities of the ISP by giving detail about the fitted blocks.
> 
> This doesn't tell what is the control type. Just add "(bitmask)" to the
> control name
> 
> ``V4L2_CID_MALI_C55_CAPABILITIES (bitmask)``

Ack, thanks

> 
>> +
>> +    .. flat-table:: Bitmask meaning definitions
>> +	:header-rows: 1
>> +	:widths: 2 4 8
>> +
>> +	* - Bit
>> +	  - Macro
>> +	  - Meaning
>> +        * - 0
>> +          - MALI_C55_GPS_PONG_FITTED
> 
> Do we want "_FITTED" in the control values ?

I'll drop the suffix, I basically just copied it from the documentation but it should be clear from 
the control name that that's the meaning

> 
>> +          - Pong configuration space is fitted in the ISP
>> +        * - 1
>> +          - MALI_C55_GPS_WDR_FITTED
>> +          - WDR Framestitch, offset and gain is fitted in the ISP
>> +        * - 2
>> +          - MALI_C55_GPS_COMPRESSION_FITTED
>> +          - Temper compression is fitted in the ISP
>> +        * - 3
>> +          - MALI_C55_GPS_TEMPER_FITTED
>> +          - Temper is fitted in the ISP
>> +        * - 4
>> +          - MALI_C55_GPS_SINTER_LITE_FITTED
>> +          - Sinter Lite is fitted in the ISP instead of the full Sinter version
>> +        * - 5
>> +          - MALI_C55_GPS_SINTER_FITTED
>> +          - Sinter is fitted in the ISP
>> +        * - 6
>> +          - MALI_C55_GPS_IRIDIX_LTM_FITTED
>> +          - Iridix local tone mappine is fitted in the ISP
>> +        * - 7
>> +          - MALI_C55_GPS_IRIDIX_GTM_FITTED
>> +          - Iridix global tone mapping is fitted in the ISP
>> +        * - 8
>> +          - MALI_C55_GPS_CNR_FITTED
>> +          - Colour noise reduction is fitted in the ISP
>> +        * - 9
>> +          - MALI_C55_GPS_FRSCALER_FITTED
>> +          - The full resolution pipe scaler is fitted in the ISP
>> +        * - 10
>> +          - MALI_C55_GPS_DS_PIPE_FITTED
>> +          - The downscale pipe is fitted in the ISP
>> +
>> +    The Mali-C55 ISP can be configured in a number of ways to include or exclude
>> +    blocks which may not be necessary. This control provides a way for the
>> +    driver to communicate to userspace which of the blocks are fitted in the
>> +    design.
>> \ No newline at end of file
>> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2bd60a0d78786be368c2e51b1a0a63fd2a5f690b
>> --- /dev/null
>> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * ARM Mali-C55 ISP Driver - Userspace API
>> + *
>> + * Copyright (C) 2023 Ideas on Board Oy
>> + */
>> +
>> +#ifndef __UAPI_MALI_C55_CONFIG_H
>> +#define __UAPI_MALI_C55_CONFIG_H
>> +
>> +#include <linux/v4l2-controls.h>
>> +
>> +#define V4L2_CID_MALI_C55_CAPABILITIES		(V4L2_CID_USER_MALI_C55_BASE + 0x0)
>> +#define MALI_C55_GPS_PONG_FITTED		BIT(0)
> 
> afaik you can't use BIT() in uapi headers. Use (1U << 0)

Ack

> 
>> +#define MALI_C55_GPS_WDR_FITTED			BIT(1)
>> +#define MALI_C55_GPS_COMPRESSION_FITTED		BIT(2)
>> +#define MALI_C55_GPS_TEMPER_FITTED		BIT(3)
>> +#define MALI_C55_GPS_SINTER_LITE_FITTED		BIT(4)
>> +#define MALI_C55_GPS_SINTER_FITTED		BIT(5)
>> +#define MALI_C55_GPS_IRIDIX_LTM_FITTED		BIT(6)
>> +#define MALI_C55_GPS_IRIDIX_GTM_FITTED		BIT(7)
>> +#define MALI_C55_GPS_CNR_FITTED			BIT(8)
>> +#define MALI_C55_GPS_FRSCALER_FITTED		BIT(9)
>> +#define MALI_C55_GPS_DS_PIPE_FITTED		BIT(10)
>> +
>> +#endif /* __UAPI_MALI_C55_CONFIG_H */
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index f836512e9debbc65d62a9fe04069b056be42f7b2..9f07d80d7af1dfb347fca6e2c65b25bc2cb86af1 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -228,6 +228,12 @@ enum v4l2_colorfx {
>>    */
>>   #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
>>
>> +/*
>> + * The base for the Arm Mali-C55 ISP driver controls.
>> + * We reserve 8 controls for this driver
> 
> Doesn't the commit message says 16 ?

Yes...that was my intention; thanks!

> 
>> + */
>> +#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
>> +
>>   /* MPEG-class control IDs */
>>   /* The MPEG controls are applicable to all codec controls
>>    * and the 'MPEG' part of the define is historical */
>>
>> --
>> 2.34.1
>>
>>


