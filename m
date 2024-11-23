Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441AD75E59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdhhpCg+taJ4xsLRypTZUl8HmDm+NFsq0ODj29ISJ0M=; b=Aly7vilZOvEbgrwLKnGMkSZro7
	fhTQtN2hNQeA04UYBMvEnepB6Q89LKXvFHb82DaQf+27DhGD4vJ8/5jdC/WWxlGf0CuPyPjoIn67Y
	6tl7t04LkBQ9AUXG7VohXgDLlIRFtfgBsTaXpW3AkWm8ufX2klIp3RPOz0lnEzwRiVgKECXMnNstj
	190docmAim3WSST2KkTCLM0U6mfFBEb1tdEWpoRndoqua5MhTwPnPCarcXYub36GQPaX3CT5U94xF
	YiEIfpVD/gcU1CeTEj0KM5WTCKicricYkSG7zEc7ro5upVssenZxWUs5Un7Cff59yF4yk1W4GEkYf
	79juT15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsW0-00000004YCj-2EF9;
	Sat, 23 Nov 2024 15:57:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEsV3-00000004Y6p-42tL;
	Sat, 23 Nov 2024 15:56:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2124ccf03edso30459905ad.2;
        Sat, 23 Nov 2024 07:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732377404; x=1732982204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdhhpCg+taJ4xsLRypTZUl8HmDm+NFsq0ODj29ISJ0M=;
        b=A4k4trfeKKdeT/AX14TKVizIUCkrQNcOzroRiT1llx9mZmuXJ9JOyViFqIxOYDZHXL
         7G8Fu/mB3h+IhAASXoxGXuDAmBGFAMJEa1KDnVasB+SmyNrGa13dc9vxCR9ZS18rm/cd
         OK+IpmdSi5mnI50oQEZvSfTRQcyCuVCziJvsHttKuakSdhQ+0cBO/R2bDWMpvqPsAd/k
         2KlLyteaGB2iAxu970QpPV0Fbyfc8q96mfkXxRTIaTVvTJtQPZoTKNymHzZrwUCJmeNw
         ay4kLl6zg9paHXr9gGMWifFcWxuPJQ5WZe0ldTtTrJKPdAIf/P0XEvRUg9qfLs6WSWXU
         OHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732377404; x=1732982204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdhhpCg+taJ4xsLRypTZUl8HmDm+NFsq0ODj29ISJ0M=;
        b=Mqxi+aWBO5sqlwlkzCCBiKCtIlLcwzmbtAk+sUSzruqr4KhtKlYAsQaLGXEG/Sm6mY
         ltWfx0IAGSUbhMhWqhk7tSFhEMn1doBCBhJRvY1k5cKqEr+DzA8pNm0hKVQabkgx8124
         D6hAaqNflV28/dC91Pi60+liR8opqna1tAZBvHGs4BupzYbB93HZDEVl8Re7JCV8f3qn
         gNy3ulrr/p0DNeuHhkaYfnYW81ZalRau1l1qrbc20QeSpNV8iw0/ErQHiQ07XKlVIxWs
         0Fd2tIQNq+WkgvbNXRNON4kWFpNz9LYZ2KVsj6xMACj4Q5WifUNeTaB+9nqOhRJgfKY9
         eEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNMKEEN3u43JwKHCPdry/Xg1NukcLBBwJisYdPDEBApYP1fWpqZGXuuBYA8x89/c5GgsIus5N1B+4wvWaO9P4=@lists.infradead.org, AJvYcCWM+Tkxd7iEkYjqrQYlmIUzzPEBqjShjuXJj4x1GIwgdbu5y8pX1WzCf6/+kOpGIhTeYZZE1n7GCidLnyjLGOgy@lists.infradead.org
X-Gm-Message-State: AOJu0YzgxiQNYPrHBff/+28l260oy4zcyzExu/tHNJC7FDIG5jAPEGxt
	iDRxmNQLMNEdYxs+DssVuGMBgcpm/CVg4nMaQkU2CIjhX1NhYUY9
X-Gm-Gg: ASbGncuzkckNBgAYeFRwxs/rgG0Eux0SDIUCsp0DRClc3CluQCkZ9QsZJMHEFWLYlSK
	m1UX/vR5bpT6qmyDf01i2DQGX+8ehqB7/lU39nVepSx1P+NnwXqt54T8DScnOYhu1m6iKZz7BM8
	G+KhfB4diX3CjFPzkvqgbwXkN/1+ojG6DwraJwdWfyWl4SsWENlR2GOpr81ucwbQBSHF0Zh3qoa
	+NHEhJzwGF/J2zz33bp/xb+T603pv7lFVH2OmQjfDBLtn9UNQDrQfCq+I5fsxU=
X-Google-Smtp-Source: AGHT+IHB49Ds6XF42rhaBzmjNmAHIN7vXsDlDSoz7p5lUyfP90T9HB2pni6uH8yauXHUV/+wJVdjQw==
X-Received: by 2002:a17:903:283:b0:20e:57c8:6ab3 with SMTP id d9443c01a7336-2129f7300c2mr99379585ad.4.1732377404385;
        Sat, 23 Nov 2024 07:56:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc131d1sm34098095ad.187.2024.11.23.07.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 07:56:43 -0800 (PST)
Date: Sat, 23 Nov 2024 07:56:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Yao <markyao0591@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
	Luis de Arquer <ldearquer@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [v10,3/3] drm/rockchip: Add basic RK3588 HDMI output support
Message-ID: <790091a1-00af-43bb-8cdf-814f4cc38d83@roeck-us.net>
References: <20241016-b4-rk3588-bridge-upstream-v10-3-87ef92a6d14e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-b4-rk3588-bridge-upstream-v10-3-87ef92a6d14e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_075646_022684_DBB03D66 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, Oct 16, 2024 at 11:06:53PM +0300, Cristian Ciocaltea wrote:
> The RK3588 SoC family integrates the newer Synopsys DesignWare HDMI 2.1
> Quad-Pixel (QP) TX controller IP and a HDMI/eDP TX Combo PHY based on a
> Samsung IP block.
> 
> Add just the basic support for now, i.e. RGB output up to 4K@60Hz,
> without audio, CEC or any of the HDMI 2.1 specific features.
> 
> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
[ ... ]

> +static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
> +	struct drm_crtc *crtc = encoder->crtc;
> +	unsigned long long rate;
> +
> +	/* Unconditionally switch to TMDS as FRL is not yet supported */
> +	gpiod_set_value(hdmi->enable_gpio, 1);
> +
> +	if (crtc && crtc->state) {
> +		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
> +						   8, HDMI_COLORSPACE_RGB);
> +		clk_set_rate(hdmi->ref_clk, rate);
> +		/*
> +		 * FIXME: Temporary workaround to pass pixel clock rate
> +		 * to the PHY driver until phy_configure_opts_hdmi
> +		 * becomes available in the PHY API. See also the related
> +		 * comment in rk_hdptx_phy_power_on() from
> +		 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +		 */
> +		phy_set_bus_width(hdmi->phy, rate / 100);

On 32-bit systems:

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

in the mainline kernel.

If the driver is not build tested (much less working) on 32-bit builds,
please consider restricting it to 64 bit builds.

Thanks,
Guenter

