Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B4CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1h+qVaCt4OHAgdENi+z8d2YGtEphNjqfMPnxu0iyxY=; b=2SAvraclk3sHNUJYI8diZc5ezz
	OTVDPCqi1L/gr1aLD8evjdJtgfJVF4yX1rfIUw0m1G4eJ1cPlmDnHyoXbdjtDqMylh2JT3nJLhBB7
	XVkwWeCRGElayMjqXncatEIRZojqsx+IqVIuUfuUEX+RJwefi/p36tbb9lJ9NucARrAhBg37CCFZD
	8p8SDFJrPuKpeppbhsIcKPXZ9j2iI+xjM9P3qvVGVIO9ToLkLplMwRHpC4xV+dYsFtxfR209gnTsk
	oG9udFWrWrO/u7cNfmOa/sKWQBZetoQ2n2fqHvFHuN2KunthWcFfp2NfKbCwI8JstwSiXqbMSGVAb
	Z7ZMhEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlZ4-0000000GAP3-2tgW;
	Tue, 28 Oct 2025 15:24:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlZ0-0000000GAOG-3FUW;
	Tue, 28 Oct 2025 15:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761665083;
	bh=aNk99UalTGwijupNSbWQmEeAIhQV4fyxuz2lZ6raB8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KE1qR1mcIPBMQqUvCOe8SKBlL6lza7JasYZqvvO4b+yB5WfVxZOIEO/mfAoOLAkU/
	 +RdF+PDdbqoUsbewOURnFmifJabsAdpv2em5BVXV+7q97zlFiE7Qyg9Z4VjslvysT7
	 Qjy0WeaDD08lo7onj8AJir70MxZEiGUjJ7PBZ8jkrEJpTEMqhRY7+miWxygdy3tN8j
	 uOWGKfL60s9uklDgn18/ZE67xH8i1BS1nVY/+74evb3NgbGB7WdMrcRbqgY7nMK0KF
	 UsO/4bdwBjeMeZRbXZH4qq/TOcI5xi9Gu8nVSG+AHDwb7Rci94DZ/7rIIa1saxcz5h
	 89AyVnQGBJXxQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF23917E055D;
	Tue, 28 Oct 2025 16:24:42 +0100 (CET)
Message-ID: <13c3810b-8197-4a42-9089-d20a78b8126f@collabora.com>
Date: Tue, 28 Oct 2025 17:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
To: Mark Brown <broonie@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
 <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
 <63003a7e-8d3d-433a-8a44-54fe8740bc3a@collabora.com>
 <5678895e-2647-42db-b3f0-86a21b9bc225@sirena.org.uk>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5678895e-2647-42db-b3f0-86a21b9bc225@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_082446_985429_CA6FDD98 
X-CRM114-Status: GOOD (  10.06  )
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

On 10/28/25 5:08 PM, Mark Brown wrote:
> On Tue, Oct 28, 2025 at 04:57:03PM +0200, Cristian Ciocaltea wrote:
> 
>> This seems to have been already addressed:
> 
>> https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/
> 
> Ah, good.  Hopefully that lands soon, do you have any idea what's
> holding it up?

I guess it's just the complexity, since that is part of a larger work concerning DRM bridges:

https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/

