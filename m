Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 23:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbVTKj22DdIODp/G/2Y0eA7B9M37L5pcHT1rwZZk/Z8=; b=UVJDqF8OWFEBvuLl4PNA78pYfk
	EFTbmiIX4WTv0uS3dMDJa6tzYWQg9UxfK2zyH4e1OZZTy1fJlj5H9e6KccyjKzngcCjGCXsYoCWpF
	PjtzVYoCMe2Zu3+8O9xpG6uuYQWPb+8iyVpUOQRkA98yec+8fpwPaMlBllklvPy3GlV/ewSHGPSMz
	d4Ku21Kl51Sqm6q/HgZ4jzfQc0hpOLbC++LyIg8Cw5BxZAl9bdvDWMbLJB9iaxlshfg+1nTwyBa4a
	cl8Oua29cjBahWOmYmFYb5DT7DXyBee3o1wdq8VKTIi8IoBcEZ7WcxJL2RignuJJiJ7EHwO938ZvG
	Tr/snVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTUYn-0000000BfvG-2fTv;
	Thu, 02 Jan 2025 23:25:01 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTUXe-0000000Bfmu-1wNS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 23:23:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 629A4104811D0;
	Fri,  3 Jan 2025 00:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735860227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbVTKj22DdIODp/G/2Y0eA7B9M37L5pcHT1rwZZk/Z8=;
	b=Kqbeg/XqeuBhAlmLvyOM2Sizn2nbZv+MyR/M+3ljCa1k8+hadZA1KHSq1QhDmXt4aA/XEV
	wISkaeVHQP820WAs87CtyBZsX6bNVLr5xZcFi3TQJ1EojlrmXjEoJlPoo92MNK7QJWHzV1
	hlb6abGRd6cNSlTk3tDgNBJnqvklvZYl4+qYmqkPhMusO6Mnq2e6lR2GIUaMwdjoV8S1ul
	6m2/xwTy1pxswXg+5Fw5GhllyWtTUd5cT8GwIfkw0tW43b3G0El3x6egyGbEtMFxDZrjwL
	+AGD2jHyzmBhFaRMTATqc326P525I7PngwACEuFXwGHI4RB38xVWkoxcee6h2A==
Message-ID: <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
Date: Fri, 3 Jan 2025 00:20:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
 <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_152350_654795_A99147B3 
X-CRM114-Status: GOOD (  13.44  )
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

On 1/2/25 6:58 PM, Dmitry Baryshkov wrote:

[...]

>> @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>   			return ret;
>>   		}
>>   
>> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>> +		ret = drm_bridge_attach(encoder, bridge, NULL,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>   		if (ret) {
>>   			of_node_put(ep);
>>   			return dev_err_probe(dev, ret,
>>   					     "Failed to attach bridge for endpoint%u\n",
>>   					     of_ep.id);
>>   		}
>> +
>> +		nextbridge = drm_bridge_get_next_bridge(bridge);
>> +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
>> +		/* Test if connector node in DT, if not, it was created already */
> 
> By whom? And why?

By the HDMI bridge driver, see 1/4.

> There is no display-connector bridge, but there is a
> normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
> now it's a proper time to create drm_bridge_connector. You have added
> the next_bridge_optional flag, but it should just prevent the dw driver
> from returning the error if there is no next_bridge.
So what exactly should I do here ?

If dw_hdmi_parse_dt() only exits with 0 if there is no connector node in 
DT, I don't get any output on the HDMI. I have to create a connector in 
the HDMI bridge driver instead and not here, right ?

