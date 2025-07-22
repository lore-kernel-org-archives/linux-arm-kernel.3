Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D872C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxWhRXQrVEcxn5gObXZuxtAZC+0PEh2V+jVxRbLYFoM=; b=I0qY2UdMYaJ5SsWa3nTi7a/25B
	xG2cELly+bJ3dKuw9QGdnjnU3AOqntJ1IKfMxoQWhm+BagT3HUSVGHz7m+gSHcqMcWrL8PYu3N2li
	EM7eTKFBcX09bjvV+9ncAT2ssMVnEQer5wx4LrvR/7XSgy9bwqJQANo8pBvKDchR2eKNvLKhMhqZR
	DDvIOzeSn15w+9aU6fh99Mfk9vowUJw/AAy/ZbkxZxgFqMLJ+euIRs2Uuz7iJefoqhEnWnlYpuJBz
	Cm6L3BhsxIKrkJUfkU065tNwO66gm/NUdWflWvsS2oakL1PhFQRzhQ7bHby6SYrjpZGIlhpdhdRMG
	XCpQe98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue6L9-00000001PWM-1upX;
	Tue, 22 Jul 2025 06:19:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue6If-00000001PNU-1PSB;
	Tue, 22 Jul 2025 06:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753164987;
	bh=hQmYNw1nxxnjx5AEwNuBdEzfygugW6y3m3bQETQLK1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oNLRZH830rm/on4tkN3zXpzMq0pa4V7HFVCHhV+cb5mNxE5g84KOmLHpDLkzEroQX
	 +olYVd9AZj6OIj+GO5ETwk/R34sIhslu+G57OM03t1nOL4FIYTKo0UxIrVh4PrxeT8
	 5426rc6mK3G1PE+4HLHi5RLL7W9+LKjuSxWeBWpYZsIRJ6o1sP0o1po2+55EhCfpro
	 ymeA9lxg/w4n9gglwocZs6bqKz+dY7pk4cukbRtX5cQnycKHinZEvr+JqbAqXJnaQ2
	 tQY9xoK//oO9DHgu9nonm6PRg2fCxhuGqKiBG9Lwsgi/Q7WnXyCHD31Mn/fkFxi017
	 bkSfPZ1/PoXvg==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB2AC17E0F66;
	Tue, 22 Jul 2025 08:16:26 +0200 (CEST)
Message-ID: <c5624dad-93cb-4cc3-88ad-808dcc43274d@collabora.com>
Date: Tue, 22 Jul 2025 09:16:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/rockchip: vop2: Add high color depth support
To: Andy Yan <andyshrk@163.com>, Algea Cao <algea.cao@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com>
 <20250721-rk3588-10bpc-v1-1-e95a4abcf482@collabora.com>
 <3ceb2c70.2145.1982ff28b9c.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3ceb2c70.2145.1982ff28b9c.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_231629_522993_DB066F95 
X-CRM114-Status: GOOD (  18.61  )
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

Hi Andy,

On 7/22/25 5:24 AM, Andy Yan wrote:
> 
> Hello Cristian，
> 
> At 2025-07-22 01:39:04, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> Take the bits per color channel into consideration when computing DCLK
>> rate.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 186f6452a7d359f079662bc580850929632ea8fe..a714bcbb02de16267e7febbaeb1eb270c70aaef2 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1731,6 +1731,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>> 		clock *= 2;
>> 	}
>>
>> +	if (vcstate->output_bpc > 8)
>> +		clock = DIV_ROUND_CLOSEST(clock * vcstate->output_bpc, 8);
> 
> 
> This seems not right,  regardless of the value of bpc, the dclk of VOP must be
> consistent with mode->crtc_clock.
> If the dclk of VOP is increased in accordance with the BPC ratio here, then the refresh rate of VOP will also increase proportionally.
> This would be inconsistent with the timing described in the mode.
> For a hight color depth,  the frequency needs to be increased for the HDMI PHY's clock.

The HDMI PHY's clock is actually computed at HDMI connector framework level
[1], taking into account the current bpc value, which is determined as part
of hdmi_compute_config() [2].

That means conn_state->hdmi.tmds_char_rate in
dw_hdmi_qp_rockchip_encoder_atomic_check() does already include the bpc
related adjustment, and we pass that directly to the PHY via
phy_configure().  Note there's still the need to handle bpc separately via
phy_configure_opts in order to setup CMN_REG(0086) [3].

Since VOP2 switches to PHY PLL as DCLK source for modes up to 4K@60Hz, it
needs to take color depth into account, to keep them in sync.  As a matter
of fact, the clock adjustment in VOP2 is mainly necessary for legacy
reasons, since HDPTX PHY allowed changing TMDS char rate via the Common
Clock Framework API.  We landed a proper solution for that via the HDMI PHY
API, hence the plan would be to make CCF API readonly after the switch to
PHY API is completed, which means VOP2 shouldn't deal anymore with clock
calculations when using the PHY PLL as DCLK source.

Regardless, I should probably move this clock adjustment to the conditional
block handling DCLK source switch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/display/drm_hdmi_state_helper.c?h=v6.16-rc7#n525
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/display/drm_hdmi_state_helper.c?h=v6.16-rc7#n608
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c?h=v6.16-rc7#n1034

