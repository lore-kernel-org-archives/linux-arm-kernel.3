Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF444C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TozBWijXodrVUon6QJfDncNinfpv/1bQpJAQR3zwHk=; b=LkE1PehNO36aiSLXWCXnDXq9n6
	CM0Cwl1BgI6sLmNocB4gpYxuk6D8kFgJ32xex9vK3LFNgNpmzXwkUhqdEDOM5LQHVGpUoMfuSmVTK
	L9ATkh2CltP8fEfGeao4azeDdLyGNuBGPr3bGNLgAxqj8nDWW/LCi+AQd3U2fSaNVLxYAlBFEKdFr
	kVbS14qUGlw0/mFTPj6nZY7OVmbqXqXRBKts87qQFyVZqhymQiOPsWviXJiKlAuMNsjR11F5Ox/Xw
	tUYuDX2jC88lJAqqIDm4aH3lTmPBreyV6vBDsAfN/28o2JgPl3XuqhAIT0VrKPoUkG6oUsdbCGO7v
	SwDrBRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s6k-0000000Aorj-2hjI;
	Tue, 29 Apr 2025 21:03:14 +0000
Received: from smtp-16.smtpout.orange.fr ([80.12.242.16] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s3q-0000000AoSY-0OOn;
	Tue, 29 Apr 2025 21:00:15 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 9s3FuK4cRBfs49s3IuBIq6; Tue, 29 Apr 2025 22:59:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745960385;
	bh=+TozBWijXodrVUon6QJfDncNinfpv/1bQpJAQR3zwHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=aWaj4RCVHvwG0spz2veNVZYCrnM6nLNlGyfl8IqfdPa1TCsIeGu92xkP3nKUnmZQB
	 iE1ph39mdxBnpKYPgISulUUnSjatciPB0VOhhu3UNseGODeeaScNQyfQeUfXr6H9Ab
	 FdBUB3/lGF1wyxzCqhKt3KXO3s2C/t2kf/FAGdvsKF0loerODbMjXLxJDboeF7CeM7
	 yKqywcqMZ4qhiiMNCQCA0fagB9UG2+pxtuf271dJ9FEsnogOhvQeSw5TtBXDmtzSro
	 lSt2giOKSgCeWaTRAZW5BfagcjN7hoXWIgzEGRlyQQQWxpmR1h/9qZZxNtrhxooW0+
	 T7s3gEoxwIQrQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 29 Apr 2025 22:59:45 +0200
X-ME-IP: 90.11.132.44
Message-ID: <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
Date: Tue, 29 Apr 2025 23:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
To: I Hsin Cheng <richard120310@gmail.com>, neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20250429190724.330883-1-richard120310@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250429190724.330883-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_140014_273555_553DCB28 
X-CRM114-Status: GOOD (  12.03  )
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

Le 29/04/2025 à 21:07, I Hsin Cheng a écrit :
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Cast the type of "mode->clock" to "unsigned long long"
> when utilizing it to avoid potential integer overflow issue.
> 
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 7752d8ac85f0..fe3d3ff7c432 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   	unsigned long long venc_freq;
>   	unsigned long long hdmi_freq;
>   
> -	vclk_freq = mode->clock * 1000;
> +	vclk_freq = (unsigned long long) mode->clock * 1000;

Hi,

maybe, using 1000ULL instead would do the same, but would be less verbose?

CJ

>   
>   	/* For 420, pixel clock is half unlike venc clock */
>   	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> @@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>   	struct meson_drm *priv = encoder_hdmi->priv;
>   	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
> -	unsigned long long clock = mode->clock * 1000;
> +	unsigned long long clock = (unsigned long long) mode->clock * 1000;
>   	unsigned long long phy_freq;
>   	unsigned long long vclk_freq;
>   	unsigned long long venc_freq;


