Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A35C54F55
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 01:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4MBbntBTw+WzVk7B5pQ1YM1qPjQxWB0im3ZJJbI4sU=; b=YVVym1CwkCIy1jOAD99tj0WdrZ
	05ILOqT+iRv5WeiA64usWpvU8uYySU1ApzTboR4ypy5GpFT86bAOm++jCBT/HTjhY6D8l5bwspL1p
	Pv7qd1W+yBQClcw3E1OnxY7qly5eIqaDl2O4aofAtqnmlMBWUTlFb3x61CZiCrgOs5eO1Zh8sBwhU
	edzssTTbUxs8Wlu/DEOqgsqLIiH5PEMXxm//zatO961XyzdmpGnTTA0E1/sVp2y7odPmciQzJKNAD
	c65LoGmxtK9Vu1DgIp3ZEJ8enKKSWnOvL0iXSxQKa7YnJK4bbqDgQaUKBopNlACt+tidYxlCW3Noz
	xULppW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotCM-00000006c0r-0aEt;
	Wed, 29 Jul 2026 01:35:06 +0000
Received: from mail-m6080.netease.com ([210.79.60.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotCE-00000006bw4-0Pj4;
	Wed, 29 Jul 2026 01:35:00 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47f0092e5;
	Wed, 29 Jul 2026 09:34:46 +0800 (GMT+08:00)
Message-ID: <e4b1051c-fc91-44a7-ab29-1da888fcc0c2@rock-chips.com>
Date: Wed, 29 Jul 2026 09:34:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] This series is split from the v15 "Add Type-C DP
 support for RK3399 EVB
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Vinod Koul <vkoul@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20260727064408.101-1-kernel@airkyi.com> <amgMXujurBrB5B0L@venus>
 <e22072d9-7fee-4f83-9ae9-5428e45c7507@rock-chips.com>
 <amh1sK_4KnD5zTlZ@venus>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <amh1sK_4KnD5zTlZ@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9fab82895203a7kunm36abcb353ae33c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHR0aVh1NT0xNSU0dS0hKSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=euk3LVDokfDwuFpxIXJN4jzuLkRvCtZqL8jRDZoAMRvU+JjIgJ35lxzKyNXNiyGRtGCK9NBFxvWfNY3AwjI7dfY2R/DKuVwUmhyZKQT6VIaXik4yqyNkfEz9392PYWmVGRCtPRe5Cchs2S75m7iquG3+ruNflhaXQLxwkVZbv1o=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=R4MBbntBTw+WzVk7B5pQ1YM1qPjQxWB0im3ZJJbI4sU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_183458_669118_E9135069 
X-CRM114-Status: GOOD (  17.86  )
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

Hi Sebastian,

On 7/28/2026 6:44 PM, Sebastian Reichel wrote:
> Hello Chaoyi,
> 
> On Tue, Jul 28, 2026 at 10:33:48AM +0800, Chaoyi Chen wrote:
>>>> Changes in v4:
>>>> - Link to v3: https://lore.kernel.org/all/20260717072323.96-1-kernel@airkyi.com/
>>>> - Scan the entire typec_bus and attempt to register the hpd bridge,
>>>>   so as not to miss devices that were already added during initialization.
>>>
>>> While that may help with the module being loaded late, it does not
>>> help with triggering the module load in the first place.
>>>
>>> The module does not have any MODULE_DEVICE_TABLE() helping with
>>> that. So basically any system relying on the automatic hpd bridge
>>> registration and using a modular kernel (e.g. the arm64 defconfig or
>>> the kernels usually provided by Linux distributions) requires
>>> manually loading that module to get any graphical output.
>>>
>>
>> Thank you for pointing this out. I will add it in v5.
> 
> Add what exactly? As this code is quite generic, you don't have
> anything for a MODULE_DEVICE_TABLE() (i.e. no OF, no I2C, ...).
> 

That is:

static const struct typec_device_id dp_typec_id[] = {
	{ USB_TYPEC_DP_SID },
	{ },
};
MODULE_DEVICE_TABLE(typec, dp_typec_id);

Just like the modules in drivers/usb/typec/altmodes/ .

> One solution I see to keep the notifier design would be to add
> 
> MODULE_SOFTDEP("pre: aux-hpd-typec-dp-bridge")
> 
> to some other module and piggy-back on it. Alternatively integrate
> it directly to some other module, such as "drm_display_helper",
> which already has DRM_DISPLAY_DP_HELPER and DRM_DISPLAY_DP_TUNNEL.
> Adding TypeC DP AltMode as part of it seems sensible to me.
>

I agree, placing it on the DRM side looks more reasonable.

> FWIW I suggest you test booting your patches work with the arm64
> defconfig before your next submission ;)
>

Oh, I will. It's just that I've always been using buildroot. I'll check 
the situation with other distributions.


> Greetings,
> 
> -- Sebastian

-- 
Best, 
Chaoyi

