Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2DDE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz+kmAzeakqXPQr9hfs7u9syD0YPvxKX8z2f6ege9pw=; b=F0B+xsyi9dq8Xtoixm+kqLFIFj
	72HG+GdAX4gd3w5DKsHBB4Pcs6mD3mafn36YBKG34r3VKmFc14HaEFbIoiu+7BRt5y+MqYXXw+hWq
	m08B3/g2KkISlBtDGV3rHTV4XjRrTY1WebFmawTg43ghALJ+1ZBd5oBjtG8qhyVeic3S28TMBYd5/
	qAQig1PAnvP7PtlBZPmg4hLmp6lDFeNBXMeauDvUw/Szxzm/RT0452IylWtrZ+JdMPgf5eW+SXCY7
	kEGecENIjZZR4pr3ip36ZvE380WzzORiVPtKLiF8+aZKvTpkNrWaMJRGWVA6UWQTzcsa1nbW0yMc0
	z2qMdmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb9b-00000007KWZ-2hVJ;
	Mon, 09 Dec 2024 10:38:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb3I-00000007IOJ-0Ckr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733740302;
	bh=U+WWAKmaH6IU4lWE0vkOIziLE7iYkDJyMK5lmAlWUE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H/rQsvNr+g2+qxOWIl6wk0zt3S+H8ODR1B2p0n1OBpi0J3cdps9aZCBbXBDeWABXg
	 /Piei4i1Yoc/TlGpNEPzXNuH06YCvZVbK7ySnB/9Kz4b0WTLBk2z3LuTUwTmUdSvUt
	 6hsDEwMHnX13AmNx4fDLzZcwhpuBQpTOdE5cD1Q1G+2cOyBJ+M303SsbVZOusqhd8d
	 obtNr1muyAoSgfuRKqROdFxJVF/c6kWeiUquinCJGD6eTRbdJHgef4NWALSTVxO3D2
	 cFLYZ/DrIuZvPwHfFu2SkuLj+/jB0nddspCRprbVOSsUc0T7sBXUmr9oU5iQzhtvmm
	 Ct/hnad/iXKyw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 261E817E35D0;
	Mon,  9 Dec 2024 11:31:41 +0100 (CET)
Message-ID: <75b15251-f72e-4306-a90c-0b875f745b7d@collabora.com>
Date: Mon, 9 Dec 2024 11:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,03/10] drm/tests: hdmi: return meaningful value from
 set_connector_edid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20241130-hdmi-mode-valid-v5-3-742644ec3b1f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-hdmi-mode-valid-v5-3-742644ec3b1f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023144_259073_D30EA578 
X-CRM114-Status: UNSURE (   7.01  )
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

Il 30/11/24 02:52, Dmitry Baryshkov ha scritto:
> The set_connector_edid() function returns a bogus 0, performing the
> check on the connector->funcs->fill_modes() result internally. Make the
> function pass the fill_modes()'s return value to the caller and move
> corresponding checks to the caller site.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



