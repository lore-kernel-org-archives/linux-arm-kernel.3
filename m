Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58C5606D805
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AG1xxMzy;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=H5DzTiBh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=; b=AG1xxMzye1lMXpgQx+iTtSJRbd
	W+XOzlUfRYojtdN3PaRWuULNf3Mp4wNfjFNVyXVA9GKNO8xy6DimIWSbE4kjFf59Mm4OHBt3Flqys
	5eEx7n6S5oe2PnSH0fRiX8VR77xNJ39yj32/xRvAyLeurCLOVylTvzzyoO/M0ftDEm8iHIMiDevKG
	d5El+Egd9mzayDzy+Qdf0dIBCB5n3BK6OSYaRIv06Q2V0y5ZYeh8JM++yKFBzsQ/WPkSffeSsvQ9m
	k8pUy6c/RU0kWYM5B6u47+Hys3SNREtGIW9vY3LmfoNEeOhBPvbePleKFbSQ8JoiZdV6D54L6GusI
	cLgPe5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwH2-00000008qFP-1jb5;
	Thu, 05 Nov 2026 12:08:56 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwGw-00000008qB4-0QK3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:08:52 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so812442a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880529; cv=none;
        d=google.com; s=arc-20260327;
        b=WIl9d5pYE5L3FW3GIQhD0Lxw8k6AHqxcxek3J202lvxn4El/om3gRugIdI6AhDJOXH
         B5bcCy3ymeLcv4abgBtiNYKqoMuqZbmCW7QlQ0l+P9Zx8avOxrPPgOdsWv6BuHRFHWXw
         IwGnXMIYeeVMWARrpDuXQfNQHMzaWM6z4KUvS3IDSG3cKT6A8qBYNkti4OOAWa+dn8aw
         dHdP8bxbho8TuoAd9ouLUtwnLZVSe5uZL6oVZXkeo1Q9tX/xbYNrstY8XhqoWoelK4fZ
         vQJwbHNIBT89bMTaJuoNq/stnI8pXhhRsL9yBGU1uWQTuGnD9Jq1M1notAsx9NajQCyV
         OnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        fh=7LbUhsC8f/zAysTaxQzM5//yReXPHLIOhPxRk8Uuhr4=;
        b=hnPSfsjEKl4uXPSX+6jkWHpjy9c8eN7BuuD+FjcNL27WPF0V+gIcRJCyN9xhaGp15v
         JV83dtFevofKsiUY7U1t50WUDSa+k2LhnOvRTS+kpRa6LOlnrT416zXUYLT0GVKDiXVE
         EGeyb7S/uIxpHi4cUTy2TNjhg4ExRwGgzWAUVixyh/6dbKUYgQdQSXhOo025FOd7CZnl
         YJT+w/HRlxpkI5hT932/431sfu+r72YK3/FZ0hjyHxYjtdxoONJO1Di6lGUbvFCy21PJ
         JDahY7Z//wCfW6sRt69m2y08cYO5f6I+47dXPh11Pui+ltIZe473lsy3nQ2q/aYWTkkK
         O4IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880529; x=1794485329; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        b=H5DzTiBhEcwjut3CA1Xa4+TQQ2hk5+UwvyF66Gw/buFSXF6ayoK+/81IeE2ZfWxN5K
         lRp65opw71w06tPLkkj7FyoPKHE7fWDISbflvRi+F2mIpmrSq6hL9c6Z3uBIeqrNk6gb
         +aq7fOwkDzgRv/ZnmtK1d+iiXaKZdvWe2h9guwtxsPNNBhsXI8532L9uoB0sz86QlaF6
         c8/mftsoma6jY3CgsMkNc4pVQ1T+r6cjkj5qfc6+5lT4vqjkoBbCXF9Js/q1cjrsUB3c
         okclcyYADBNxwsYYMOuDgq8QSyoor8xkxGi9vqZ0r9+f40GPw+AdJhMv5G7+k36e7CNE
         aqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880529; x=1794485329;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        b=YgVyCxMSSf4ZNvpu/mvcBKGVhK9ZEmWSo+vrWqZa55LAK1UiuFl3hOGqSlHo9TsakP
         l8jZyC6pOeHYAMgv8+erdrGsgLh+7eg2TfhuKxtC2mHvvXliPF4mTbvyg67ZQxwQT65Q
         XUPb0DOYE+asuWPaIZyCq9KpwMyP9ce4YsZS4++uX58U2RsVxvsVg1whsRnpFaQP9NQA
         0ta4ohKx1lX6u4pERf+2rAV0InK5wt2meP0Xa04No+gwLtoqSjOpyaza82LQ8JROt8NF
         DAAPl+eBp0tAYsbKk5goKdniSWzc4QRfNHTjwjcQA2aYNrSRaNJ83iQA/INkC4vrafSF
         0MLw==
X-Forwarded-Encrypted: i=1; AKwUvByfkWvQOp0/ckMvrokkb+JxRmE/uqRkdmDxj818d1W0Rgc8Hh/o32wyyKYY7eDYGbeUN2L7ecd02Gzun9ih/HjQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9uGhOhjZVJDjAHkN/uiAL6HkfGgLr+4lKjRQFpRg8pwNIcVM41
	1iu/jX9Mi50XV1qmZ2jNyGArU6wjSDDEDexjuUKNgoEdYRJ1TXgCGibCJBwNv0/ZLMkPwNAgzon
	Dw/R+qHUjC84QNs5jPQBkVQDfvsQqxVkGYAajbERULw==
X-Gm-Gg: AYBFou0EYId5BPsZxa8EtAYDkIzIsO+cP9LBTm9vxxP1kmBGP8m9PNWR6mgBybaAEL4
	DcJsIqMoyQfXp8HWl7/DsF28MCy+asdHTrAQxjDoXa9pIpJosJcmdnLu8/CpZe9OsFkSUNuzsPR
	5AbQSI4LZ+eAzXYNJTpaCg5rBcE0ZWPtBzgyGy9tyQ5ereHc6N/jpv6zRQ9+cs75dTEOwv4KPT9
	Qjqwj8OMadj4IKJlgA7IeYznDkJrWhURYdG6wqCfOx7vn9oQJRfYJDqa3LcNpk84ePJoAWGsH59
	5VPgqQ75EIyIZ8+ox+y7mLYR716t+EjyrxSMMrPbICyfyA+is0tfolSb8etpDYrnBNuUvO9BnUw
	mDIq0Uu7QC74BQCeC7VUvkwQLLyhfY+qjs4Zs
X-Received: by 2002:a17:90a:ec90:b0:3b0:c11a:902d with SMTP id
 98e67ed59e1d1-3b0c11a91c6mr1036738a91.10.1793880529265; Thu, 05 Nov 2026
 04:08:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:08:38 +0000
X-Gm-Features: AclHuK9SHkBLRSAoFwhG6L3qgKeNZAN0mhWE5mO5no7yjWFPSRU-9JZ6TzN2VOg
Message-ID: <CAPj87rM=D4h-EfkTdqbumrM159M9Mb89nJt0K1AgcTrqwAqM6w@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040850_172599_A6AA1A97 
X-CRM114-Status: GOOD (  12.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Rockchip DW HDMI QP encoder supports YUV 4:2:2 output through
> ROCKCHIP_OUT_MODE_YUV422, but was limited to 8-bit depth via
> MEDIA_BUS_FMT_UYVY8_1X16.  Add support for its 10-bit counterpart
> MEDIA_BUS_FMT_UYVY10_1X20, which carries two 10-bit components per clock
> cycle on a 20-bit wide bus.
>
> The HDMI PHY scales its PLL output by 8/bpc to undo the deep color
> packing, such that it matches the DCLK rate expected by VOP2.  However,
> YUV 4:2:2 is never deep color packed, as it always transmits two 12-bit
> components per pixel, regardless of the color depth.  From a clock-rate
> perspective this is equivalent to three 8-bit RGB components, so
> configure the HDMI PHY with 8 bpc when YUV 4:2:2 is in use to keep its
> output clock aligned with the TMDS character rate.

Reviewed-by: Daniel Stone <daniels@collabora.com>

