Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03120C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKLAC+IO8pCYlrYDk2zrvTOAk5sIAClKcqfDZ15WWoI=; b=W4YysyknVph0g2/gPpiu/V5EO2
	8MIy6gnGGeyGmdej763t2ChlQ1AEoyAPlmam1G/Cxztf7owsNSDMO3V8IifbmCQXp5kDH/pIaBecV
	l3EaERdGhEs2F0pF4CQIrKG4Bz9eUU+s7X+7EIQqtabMid7rQ3vrHoqIARm2zBIWUpvxntZkdmUSr
	aYrYP+Ttlqx8MkdpTogPBhRPHM5A0AueT1YlpShIcIwAV6CUx61WTChnzkbg/g8DkfCML2PAM0/Dt
	0Vv20NZZuD+itopWEni9PS3eW4HLqMfR64NQmFZ5aEvHolB609eTasEDP5r5u/rGxGCFa+5yzOgG7
	OkK3LXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmoy-0000000HDkh-0mlG;
	Tue, 29 Jul 2025 16:04:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmUq-0000000HAil-3dmY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:44:10 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9266420231;
	Tue, 29 Jul 2025 17:44:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVLsDY5o5ZQS; Tue, 29 Jul 2025 17:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753803843; bh=S3+XNf1yB0GDaxhHAShTKUqmAkpZEnuxO7naqLjaIp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iZQ1tSWYX5L6Yo1i6M+b1Tm3/khKQdTTo1AkT+gqo0UvP8q0D0/XAKFELWuBZ0A5U
	 cxunVuSc1jFRgl7lTjZA4lHi0ebzENkCXF4zD5BNTtL5rY/xm8yGg4fL4WHIFwTt1/
	 4PYG0blQXlUpcNA5bR6tVoEGTizlXc02GI5ISZ8NurKzjobaBO65D5gJfgJARGOaKD
	 E0AO5fEbhDT3Tur00p7H74RwpQohy3iSWq0jGqbS9Ph82/Bz3QG/Q4PtbpnW96pNP+
	 ZQDHwPJuy38mM3y999pZDeU36pa/Pd4Gvz3c0Xu6FpB7Nw7BvEmTIbLG3IDymWrVAC
	 8gmGiZmTNo/nQ==
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 15:44:03 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
In-Reply-To: <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
 <20250706-exynos7870-dsim-v3-9-9879fb9a644d@disroot.org>
 <CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9NFDu13VU5w@mail.gmail.com>
Message-ID: <b732d2588112932ab399df47fb58e3f5@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_084409_314171_A5D5DFF0 
X-CRM114-Status: GOOD (  25.25  )
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

On 2025-07-29 05:44, Inki Dae wrote:
> 2025년 7월 7일 (월) 오전 3:28, Kaustabh Chakraborty 
> <kauschluss@disroot.org>님이 작성:
>> 
>> Exynos7870's DSIM requires more time to stabilize its PLL. The current
>> timeout value, 1000, doesn't suffice. Increase the value to 3000, 
>> which
>> is just about enough as observed experimentally.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 
>> fb2cb09cfd5a4f2fb50f802dc434c0956107b4e9..4b49707730db76aa8fd3ab973b02507436750889 
>> 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -755,7 +755,7 @@ static unsigned long samsung_dsim_set_pll(struct 
>> samsung_dsim *dsi,
>> 
>>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>> 
>> -       timeout = 1000;
>> +       timeout = 3000;
> 
> Relying on an implicit loop to wait for PLL stabilization is not an
> ideal solution.
> According to the datasheet, this can be addressed more explicitly by
> using the DSIM_PLLTMR (PLL timer) register instead.
> 
> By configuring the pll timer field in DSIM_PLLTMR appropriately, we
> can avoid arbitrary loops.
> For example according to data sheet:
> If the APB clock is 80 MHz and the desired delay is 20 µs,
> the pll timer field should be set to:
> delay_time * apb_clock = 20 * 80 = 1600 (0x3E80)
> 
> Once this value is set and the MskPllStable field in the DSIM_INTMSK
> register is unmasked,
> the pll_stable field in the DSIM_INTSRC register will be set after the
> specified delay (20 µs in this example).
> We can then check this field to determine whether the PLL has 
> stabilized.
> 
> While the current patch relies on an implicit method, I’m fine with
> merging it as-is for now.
> However, since this patch series likely has sufficient time to
> mainline, I believe this is a good opportunity to improve the related
> logic.
> 
> Would you be open to trying the approach described above?

Interesting. I will try implementing it sometime in the near future.
(can't commit to it at the moment, preoccupied)

> 
> Thanks,
> Inki Dae
> 
>>         do {
>>                 if (timeout-- == 0) {
>>                         dev_err(dsi->dev, "PLL failed to 
>> stabilize\n");
>> 
>> --
>> 2.49.0
>> 
>> 

