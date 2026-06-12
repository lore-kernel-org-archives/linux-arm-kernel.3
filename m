Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205C2CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Z6c6qX789mmmGBQJuhMskaMEHhUxu2LgVgz4TJR5co=; b=uy7TGTGTgq53IhsJfTucbrgUnI
	36PQIgLzI3utno8WPrgOyKujU091xMVGH9RJB/WwyoZ3g05CjtG8XIg76cxR+pvkxnDOMWdulXz1Q
	gX27f6+dZFLW/v66kgTVtmUySjrEze4AhDT/pXpSKj+HFg3KD1+QibBwPRBjGiBCDtt7f94eR6zxR
	TajlYR52KGhOg7ahCOVafR9EQeqcLKoeOzlCmOh96LFUavXVDsGuBM50Asc340OV4Cze0SgXv1Fke
	DwHksArUpr0O1EjmvcgABNiEeap9qE60RIbcCuqF/ogyYl0ZU9iX35vxv7pkoE1eQYVJERUg+wBBM
	Rpvg0ZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY5rV-0000000BMH1-40CI;
	Fri, 12 Jun 2026 17:40:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY5rS-0000000BMGX-2qqq;
	Fri, 12 Jun 2026 17:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781286003;
	bh=XnsAVp/N05Bd286sY4AZGdYjANXS96ZvH0it40jhlpc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Prx1/PYH35axjUWlaKAj58+qPlDJxPz2Syb01q+23nOylMbl0JoWQ++KWFCER7kwo
	 ik5tWwOsAC5+rfZHlxGz/mEH2oWDA+PcrHt7KoThJi5kTFbpvYoMgsw3odq4EgvVyM
	 TYv0FqL3CDgdAmNfvYg9wC4Gl9OX3rkVx46iZU9cGOSrrIKOvonymjRw2j83SD+M19
	 TsLtWxxc68vkuJEdTUR48BdNWOBDKwFfYWO/oZienr1yTbop/+IprMYIVbXVZ+Ovuv
	 DcWClwpEU9sZlXLNSiPVN4NK1s+eMZ1PjFtp3by4xi/wTjAzfwnVaZM5UG/xvLHWT7
	 2zsMYU5CkrAIQ==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 41E7017E040C;
	Fri, 12 Jun 2026 19:40:02 +0200 (CEST)
Message-ID: <be231e53-3c4c-424d-bc62-4d3a0007af64@collabora.com>
Date: Fri, 12 Jun 2026 20:40:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/30] drm/fb-helper: Remove unused local variable in
 hotplug_event()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
 <20260602-dw-hdmi-qp-scramb-v7-1-445eb54ee1ed@collabora.com>
 <c7866bc4-bf37-4f8c-ae64-2d1d3a23f1ef@suse.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <c7866bc4-bf37-4f8c-ae64-2d1d3a23f1ef@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_104006_900493_C64F879D 
X-CRM114-Status: GOOD (  10.50  )
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

Hi Thomas,

On 6/12/26 4:46 PM, Thomas Zimmermann wrote:
> 
> 
> Am 02.06.26 um 00:44 schrieb Cristian Ciocaltea:
>> Remove the 'err' local variable in drm_fb_helper_hotplug_event() which
>> only stores a return value that is never used beyond the immediate
>> return statement.  This simplifies the code without behavior changes.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> But why is this patch hidden in this series? It has nothing to do with HDMI support.

I came across this while investigating some issues with the HPD-related changes
in the series (was part of the call path). 

Should I send the patch separately, or can it be picked up directly?

Thanks for reviewing,
Cristian

