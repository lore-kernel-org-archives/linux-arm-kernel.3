Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB001CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3Yvr+8SuCRl1RyLn6jlwMKcKglGO98thwWD/+BwJt4=; b=Veq18EyPwP2l58pn5N4799pBxD
	2NDhsdkfcc/3v1/ZX7NArKpdbrmHkMno1DPuxT5wb19fikl4gHY7fBXGwCTgk0IUrBmDxAHYcqGpu
	C5/Fb2MnwurEpd6CnP3sIZMhy6DMcMiy8n3DopOD5ZlBPAIqwmxasAP5n6tHJzJpBQ6d9cxSxm9Tr
	Uylur1/VTD4LYHZfZ8SKIEYZiDQ2S5DJBkAkCbDiE8ykFPdnEFzJebo3ADMjBwzrjkxr0sByoeDMU
	xMOUXO4Xuq0sucPRsueb3eORwQZTrep7s+V3dGiCvFP4nGer1zEIBJ4cDoEoPYcH3Ua7ci2YqKGKI
	ZfDvPe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Wp-0000000B2dg-0ymk;
	Tue, 04 Nov 2025 03:16:15 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Wk-0000000B2au-052t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:16:13 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0trk2FMPz9tVW;
	Tue,  4 Nov 2025 04:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762226166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3Yvr+8SuCRl1RyLn6jlwMKcKglGO98thwWD/+BwJt4=;
	b=iqV0hYj2Q72Ncj+92jd5v1lUMpboNz0h376t9aKLhWCGluIdqUDvsm7MD9tMRjQVdc211A
	+FHB3OF1H9T83U3ClVJ96UG4xk0YsDNt21t3Rx7ne8ocohjgbUaTSz3/a25xIa1M4avbTt
	RXDvZh5bYXEzTpZ7cL0JswNBbQT510/M7z0eYvbdsjuheAhBng48A+fvR5AXuTDVCUBEbO
	o+wSKjN5hmyB9R7wH1unsPqoH3c2lhuISyXZPAvM4El3MYp3Sb5DN9wfFIwtCqXZzJdOj9
	eYrmrIrYMsWYyxZeCFwA7ZLfgR7bj+eAFmsZr+DaO5OM+FtIA8fN0nTkkYV2eQ==
Message-ID: <827cc330-4c0f-4495-9507-71c5e3e20319@mailbox.org>
Date: Tue, 4 Nov 2025 04:15:30 +0100
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH v2] drm/imx: dc-plane: Add more RGB swizzling options
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251102162359.49263-1-marek.vasut@mailbox.org>
 <9f77105f-4754-4a39-848d-c1f92e4f47d9@nxp.com>
Content-Language: en-US
In-Reply-To: <9f77105f-4754-4a39-848d-c1f92e4f47d9@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b3bbd08b7a8ac968fec
X-MBO-RS-META: 8uaszncsrawcdjqi8nogujxfksywtpsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_191610_201697_714728BA 
X-CRM114-Status: GOOD (  15.88  )
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

On 11/4/25 4:09 AM, Liu Ying wrote:
> On 11/3/25 00:23, Marek Vasut wrote:
>> Add additional buffer format swizzling options beyond XR24, the
>> hardware is capable of sampling other formats, fill them in.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Abel Vesa <abelvesa@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-clk@vger.kernel.org
>> ---
>> V2: - Adjust commit subject
>>      - Drop the alpha formats for now, add RGB888/BGR888 to dc_plane_formats[]
>> ---
>>   drivers/gpu/drm/imx/dc/dc-fu.c    | 24 ++++++++++++++++++++++++
>>   drivers/gpu/drm/imx/dc/dc-plane.c |  6 ++++++
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
>> index 1d8f74babef8a..b4a3f8c58cbb0 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
>> @@ -65,6 +65,30 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
>>   		DRM_FORMAT_XRGB8888,
>>   		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>   		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_XBGR8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_RGBX8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_BGRX8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_RGB888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_BGR888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_RGB565,
>> +		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
>> +		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
>>   	},
>>   };
>>   
>> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
>> index e40d5d66c5c1f..4fd58afef16bb 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
>> @@ -33,6 +33,12 @@ do {									\
>>   
>>   static const uint32_t dc_plane_formats[] = {
>>   	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_XBGR8888,
>> +	DRM_FORMAT_RGBX8888,
>> +	DRM_FORMAT_BGRX8888,
>> +	DRM_FORMAT_RGB888,
>> +	DRM_FORMAT_BGR888,
> 
> Can you please drop the above two formats, as I said in v1 comment that it
> would the driver a lot more complicated when prefetch engines are added?

Can you elaborate on that ? RGB888 is not packed and should be similar 
to RGBX8888, what kind of problem with prefetch would this cause ?

