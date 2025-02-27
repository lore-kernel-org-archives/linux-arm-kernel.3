Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F829C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4C6upIGFa4XgnfpHiJyhy0wCYQaINcoL0tKBcZ5m38U=; b=l3PRBMsnXzipWArS+CgAdX18uc
	DkMh3RouB8IafQm2PnbXiGt6+shtKQmqTZSQzzu52Nkv2rPRvhfBKIsaqgg8n6p+kvsLsxSvH/mj7
	u84BQnV+/JixoyLYaKXnHuGyojiJo8guE4ClkNoLnZrL90050YMIv6rK5CCnoWbZnHnrUjC1BGAI/
	AKNWfwBN0CTLPLLpeFOrw1uCi2nu9NT1L9gKtiruBUqnDhHhLn5hb+UDt1s6ynSEs9bwr9DXfHazf
	MCpNzUgaIOw0axhkUYO6kPsmn8VjyRDy1peLLD80maWnMv+hzQr+66SRDOvLIHAQsE10aSFqBpSTf
	rqhFImfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkmI-00000008odN-1S4v;
	Thu, 27 Feb 2025 20:46:42 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkgG-00000008nkH-3INY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:40:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13D7910382F1A;
	Thu, 27 Feb 2025 21:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740688827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C6upIGFa4XgnfpHiJyhy0wCYQaINcoL0tKBcZ5m38U=;
	b=YF9CFEjfZ0GpxPpqRJ6j5xaHMHPMjF1sd+yJPbXRk7QwKCt+htPCR9INIggWUbetdqYnxI
	jp9IfS3azj0kSTKEpSFBq39BOKenqAD/VeYiNpXA3lUVAfYNBRI+B1tJh6vlTyaf05fYIP
	1ethbF4yEYSJiOKCxtqxowbWBGzWmw8WAGF43opmSFFDdBonAt6r4wQ1tAJgcS79mi3Ij0
	TBCFHsUDYqUCAUxzmocgWHUo6ykI/0sQUmcVVWRYvU/7tgRzV/usYKXrcr+bn81RN79PuU
	N7KGp7fiQgL9tPyv3sPJwGioCj5O0Ff9LDsh2Hr/JFThXGHr6UbpkPm8jv0bbQ==
Message-ID: <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
Date: Thu, 27 Feb 2025 21:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Sebastian Reichel <sre@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
 <20250227201709.2diz57xv2tntw36q@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227201709.2diz57xv2tntw36q@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_124028_971133_76BC4248 
X-CRM114-Status: UNSURE (   9.80  )
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

On 2/27/25 9:17 PM, Marco Felsch wrote:

[...]

>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 06fe46e320738..2504a456d45c4 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>   ATTRIBUTE_GROUPS(panthor);
>>   
>>   static const struct of_device_id dt_match[] = {
>> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
> 			  ^
> 			 nxp?
> 
> Can we switch to nxp instead?
We can ... is that the current recommendation ?

Why not stick with fsl , is that deprecated now ?

