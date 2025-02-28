Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE3EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyEPM5mrGTn5rrR73FFHMdEx08PtiRTDMuqHCB2nPVc=; b=EeFdNgTJxh1fqJ5pxevAjzJVtA
	UsEVx/CA12z+bKl8I/g4eiPKnnTSvKddxEEsEkqTV5SSGu23TD7G5IRhGj90okhccJwdYh+qKSWwD
	V0utFppatVs/sx4/Byw3czYRwvITMIFwT0gZum98i6OVl9Nz2WtXg4sig0qpuZEykocJ1j4KdtMWK
	f+1c2IAa/m7A2VT0I17NhTyZVJuvMvgcMeDW6czaiOBYQdUFBxPEXXC2tDrXipXMSJY3TQJMUQci+
	0OEpvBeOicCvpITRM1NvB23yJCc3d9MYFGbuiDsPETNc+JIHdoam9zQ7e/6/YngZaPL9Kc5N2rNqm
	8Y0lTYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5LN-0000000CCzx-3qGc;
	Fri, 28 Feb 2025 18:44:17 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to550-0000000C8JI-3PvH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C285C102901D4;
	Fri, 28 Feb 2025 19:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyEPM5mrGTn5rrR73FFHMdEx08PtiRTDMuqHCB2nPVc=;
	b=RKRgORqcnqV3NSzwt7DVV5LwK/q/7kkOp1UUtaXPcHOdglNIfxmpVp6+KDJ9EXQXEJ90rK
	2/OKj5kWm9R/F9XHGSmr+3wQtufmCv+k3CUVsYS4wAStAfurjNvneFGI21v/YwF4cbWeKM
	sGRecKE06EFQFROt+lYKNJHUcX3T46u+cakOr8Ucnx6FS9pR4JmSENfjYMZT64aeW4P+r4
	iDNBSiG5iD0B9Ryvc0HxqaG8/VsmzHlP83i8dM8sbL+dFCWLhQSxHs7G0PfBV0Wj6bYb+x
	jo43dHzCVZR5WzZODLERiZTF5s7FIt3uIo+LdSmF8Dev8qMCLy/sDboa4dmkjg==
Message-ID: <aa571158-a7ab-4bee-a7a7-e7a729301d7d@denx.de>
Date: Fri, 28 Feb 2025 18:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de> <4658624.cEBGB3zze1@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4658624.cEBGB3zze1@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102723_022917_AEC58A16 
X-CRM114-Status: GOOD (  10.29  )
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

On 2/28/25 11:21 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 0f07ef7d9aea7..2371ab8e50627 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -67,6 +67,7 @@ struct panthor_model {
>>   }
>>   
>>   static const struct panthor_model gpu_models[] = {
>> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
> 
> Are you sure about 0, 0?

I am not.

> With this I get
>> [drm] mali-unknown id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> Using GPU_MODEL(g310, 10, 4) I get:
>> [drm] mali-g310 id 0xac74 major 0x0 minor 0x0 status 0x1
> 
> Note the output is GPU_VER_MAJOR() but this table is for GPU_ARCH_MAJOR()
> (and the corresponding minor).
The major 0x0 minor 0x0 is where I took the 0,0 from. Lemme update this.

