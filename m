Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291DAC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwmRpH1OMYfMW+wdngHC16XU1WHD68RBOexz3bP/ZHc=; b=kda6/S3rqPwPJZm6OphgEb7ulG
	Vi6a7NNTp9l9go/xMPZWYoVNvpWsbpdnGyN/1ozbm6NYZ7NEC1CeLcEgsXJocY2uyzmFMn93jdVgA
	KOpPhZqp6HVew4KfKrumeLTG8emCIezabgnWqG2TGSTR2IYxoxL/VB78LnOxR8JMIe6f+2xtnLl6o
	kZdqMVytJiUYB6EIoXkp2F/i+Q8++8q9Gl2dqTWGU5iV01Jl8uCbMpq7Hmyfg7/zMA3p4F9h20Gqx
	eJra+Kn/p44As2zQsy9Wxgd68qeWgqZxmpAjDLNUEV2MaJOZJZ0IgIZ3Vea62QzrjSypdgsjKdPsE
	HTB/4ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJos-0000000Cigd-2RA7;
	Fri, 21 Aug 2026 07:37:42 +0000
Received: from mail-m20521016472.xmail.ntesmail.com ([205.210.164.72])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJoo-0000000Cif5-1KlT;
	Fri, 21 Aug 2026 07:37:41 +0000
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ad31442e;
	Fri, 21 Aug 2026 15:37:19 +0800 (GMT+08:00)
Message-ID: <7087887e-95e9-4253-a86e-c074eef950fd@rock-chips.com>
Date: Fri, 21 Aug 2026 15:37:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/bridge: analogix_dp: Restore mandatory samsung
 DP DT properties
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-4-damon.ding@rock-chips.com>
 <178714408666.358642.12912882529209046607.b4-review@b4>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <178714408666.358642.12912882529209046607.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa02340b79c03a8kunm02f452e245569a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBkYVktCQ08aHU8ZS0NKTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=eEgOCGeoFhbUNQZl237hGLavdog8J0uivhVhnfoxC+IBAIjK4kKrxBv2c9mlueubt6b+KUIinNK38NkoOooSDGNP9C9T1GpTObhCiuWV0fj0/WtkZYMoYnhPyD74yZunKp71VxN4B/rZiRlKbl49qZxVZi3K+bXOy1Ob0T+dJko=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=vwmRpH1OMYfMW+wdngHC16XU1WHD68RBOexz3bP/ZHc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_003739_295620_A63706B6 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Luca,

On 8/19/2026 8:54 PM, Luca Ceresoli wrote:
>> Revert the change that made samsung,link-rate and samsung,lane-count
>> optional for Exynos DP. Add error checking to fail probe early if the
>> required DT properties are missing.
>>
>> If these properties are zero, &link_train.link_rate and
>> &link_train.lane_count used in the subsequent link training flow will
>> also be zero, resulting in link training failure. Although all existing
>> Exynos DP DT nodes already contain these two properties, this potential
>> logic issue still needs to be fixed.
>>
>> Fixes: 0d0abd894ead ("drm: bridge: analogix/dp: add max link rate and lane count limit for RK3288")
> 
> If it's a fix, please add 'Cc: stable' too.
> 
> Also please add to the commit message the detailed analysis you wrote in
> the v6 discussion, so that it will easy to find in the git history, in case
> it's needed in the future.
> 
> With that added you can add: Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> 

Yes, will do in v8.

Best regards,
Damon


