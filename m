Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7263BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 22:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0RN6NFic1SJk4BcW3RydaV5Qx5yppE2e75Iroc0II4=; b=scEMi0uMC8Rt/OY/tu3Wev6s0E
	cWng39fputPVFQDs00qmwIyBD/X44PvwAG2iERc4moL7zcVay6LGoAx6wHn/Lo9MeAc/rpBT8PMe/
	2m3mpczmgzYto9HwqsYMmEpw4grGxYgVnQQwlxlbOJp99O2KiBzhEX7/KHp455tadr6ucN6ANcp+w
	gC31TOdpTgjLhVqo15HUB1Tx8WosddjR8H3o0NFOurrD1/pqUXCahsV7H71fCMkLyfWJGu2l18mah
	3AqIEOrf8Hu9eukZIYzGfFXUeMj3t+NClAexYdySuhtjDTvm0DRBkijF3bp+uPBWThl9YiW6Etw4n
	rIHZ6uEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSOBS-00000005xB5-3Ws5;
	Mon, 30 Dec 2024 22:24:22 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSO7x-00000005wfl-2lQ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 22:20:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02A65104855A2;
	Mon, 30 Dec 2024 23:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735597243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0RN6NFic1SJk4BcW3RydaV5Qx5yppE2e75Iroc0II4=;
	b=YRVsLB4zoSRwpZ+/TbKt7LHkMVX7UexGNe1JYwsG6QOqBDN5gnh64f1ZwZp8b0o6ne/+94
	r7wuSjv6EQ6x1TTMSk76VSCPgqGZdGBN67H73nn8Qw4xG3FpvGcn/0SbiiLj0ZOATeyUm0
	gTRf+MC2iQf/gFTHVEIKUR2x1CNhCyPm2l4DC3o6G2z51+weRDnbpBx3sBrUu0vCPaV3Iw
	VP8311XQjM8/0ahL8WxudHySrjeM+/1/qVW2yvN7Ban+crr0xiANc3NtmFbHNcfrflkv7q
	OvNwpks+fIDwWksNvjOyxCALtY+lvi8N9xU2/NfgPJok+lazwti3L4ACU1LFnQ==
Message-ID: <828f28ce-007b-43c1-9ea4-98be5c14078e@denx.de>
Date: Mon, 30 Dec 2024 22:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
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
 <20241224014701.253490-3-marex@denx.de>
 <20f33e1e-b531-4755-b414-02ab897e16af@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20f33e1e-b531-4755-b414-02ab897e16af@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_142045_843657_8F92469F 
X-CRM114-Status: UNSURE (   6.61  )
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

On 12/30/24 8:29 AM, Liu Ying wrote:

[...]

>> @@ -139,21 +140,35 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>>   	if (!bridge)
>>   		return -ENODEV;
>>   
>> -	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
>> +	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
>> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>   	if (ret)
>>   		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
>>   
>> -	mxsfb->bridge = bridge;
>> +	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
> 
> Nit: Drop connector and use mxsfb->connector?
The code becomes too wide. The rest is fixed in V3.

