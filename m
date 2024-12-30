Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B40FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 22:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1aqRMHNMzLaQa6vxtrEZIq/gKd1oypuSqRY/qdQISU=; b=mmMzK+kCO5WcbGf8+hxDXP162o
	MCfb6mmoUb20tXsXJSymDLLgtgn6/DOmBssM8rf6B/62Nzv0qxfPsEdQqM/QCEel9BdSxWPtC+a1S
	8fknTpiGllEUiujCMOFWDR5xsYkcmLCw6QmW0/s3i63ocBrnAfGUDbkJlbORHRv+dKCt7rmaH9A1s
	Wr/2b+TZNJ2g5tFIU4tgBs8E8s9ZcbuEWnLz6cT87TiNp4aHuEeh5CjhpNwy7bJoLouh1FpDahpBm
	snZ6Dzq+1Sfu2I7aRbqkch6TZ+fHfyALKXM3WA2cN5pLvPBLtz9UjBD7WIb4ZmhQKt+cQmclIe++K
	lL6NUdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSOCd-00000005xQb-1zld;
	Mon, 30 Dec 2024 22:25:35 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSO81-00000005wgc-2nI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 22:20:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB676104855A5;
	Mon, 30 Dec 2024 23:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735597247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1aqRMHNMzLaQa6vxtrEZIq/gKd1oypuSqRY/qdQISU=;
	b=MQ8jQUC02Vi9tztaW6KMyrHmVikWXRPJCkNuOVO4p0MVDOBDA4BmRU0abBaUgXMLWYLQNe
	vgU3noAgdyo252spI9eoH2iWEoCPdiFyn39HYCwhDoP2KpEdMIS01r+JNscauPmHNTJuRm
	ye69UcjGudnOLbLXoJ9uwywMf4zN00A72tUWfEO4tdj3Rr5lVZfVDgqE8+kkQCSbaoTCo4
	fSoHdmOXrVy0XKVeNLEQ1djn0YFfHODWpTTuTR0iOcHELvuQ3714PP82hU5AYav/chKedE
	zXa1jpmoNIRm3g45ldfaQoKbCzHpAhRyM30Ikm661QTEDklXwYgJpyfuzplxMA==
Message-ID: <59523b40-dfdd-4293-9b02-e16be632d1d2@denx.de>
Date: Mon, 30 Dec 2024 23:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-2-marex@denx.de>
 <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_142049_852829_AA060B2E 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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

On 12/30/24 8:18 AM, Liu Ying wrote:

[...]

>> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
>> index 264e74f455547..07fb6901996ae 100644
>> --- a/drivers/gpu/drm/mxsfb/Kconfig
>> +++ b/drivers/gpu/drm/mxsfb/Kconfig
>> @@ -30,6 +30,7 @@ config DRM_IMX_LCDIF
>>   	select DRM_CLIENT_SELECTION
>>   	select DRM_MXS
>>   	select DRM_KMS_HELPER
>> +	select DRM_BRIDGE_CONNECTOR
> 
> Select DRM_DISPLAY_HELPER.
Without select DRM_BRIDGE_CONNECTOR, the drm_bridge_connector_init() is 
not defined .

