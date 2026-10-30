Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F9606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F+o9gviE;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NvTuasaA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=; b=F+o9gviESUA5SXfa4Tqcn7TcPr
	WEjbHWvKry6/SFdGU0CyIeeZGIGAqhX8V41it50l+Bv06FzAnkQns+0NSeB7nA4ohW+A+MbCY9drw
	AMty81JUkoC6hqTZW4AxF9qMSiyIkruLhCkvSnnn+/2TQISGpQ2jv1rbOIabIQiDanYXV4xyNctNi
	D+Z/VEUfI7fmpH45p6onkAM++QzXpvzlwd7afi8h7BemWx+DFMXDwzewqUoUhCHEh2ZVtx2ZPL6xS
	tW1oZlA1R8ckgARCk0zatOPBm2EnglPJrTmb40rbpVe8iyl7YjoF0oTt4IxLln2vxena6JoV8ZrLc
	63rvmkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl6D-0000000Bb2p-3mkS;
	Fri, 30 Oct 2026 11:48:45 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl6A-0000000Bb1G-1X9j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:48:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso375196a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360921; cv=none;
        d=google.com; s=arc-20260327;
        b=K+3CRuorUWXkDGpgWKJGsuIjh3S0+UiADd7DqdweVaHVTEXSJ+HtuohQnIZgGfdF0R
         j9MHMP4wzLKPQZgsJ3YG/KIvoiPRAISA9Z4EeLQakOaVVa5gasHmHR2+MR8MpPtND9ma
         L0SDn3SkdqqmRykuuI5hPjPHxRI+MxEInvPEC3yvO0PoJBQGuIDIJlpzeBAzHRydzCu+
         buVWsVUM2Wbi1dxRtRSogqnTCy7qHk0Hf1qVYGRef0RmPziw1jZGuE4LK8ZTy5Il8hKD
         JkKRGAtPBiI3amxsu42C/DJkdptj3abZWl256R+GtjgaSiO0ymfLEvhTvgRFRPg2d4u9
         5XjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        fh=CwewWkJpmTUjOLh4QHZweCZXdwhgs2C8nTtuPNIgxMU=;
        b=HVMnTSMGjAIUWqu3u/H1xbPjGQ7EWVO9JoUr/pWL+LHwcxp+qZQJx4FWe6Kaw7IPov
         XplwaMZLumivDSnZcQ7UdUamKCXVGP+QA1KF4ZButXEDnEiXl/Ip5nHkYyvWvc7ylVRB
         VR8g1UkYorHu/6f8R+ZELI5YI8wqrU0qu42gz8xkkrN3T6fwkV5y/RpppmKvVvCrcAXb
         ESeTAuSjsC2raxjqlw+ai4lcpAuVX/7KjjzY14zTnegPD8WZpZoKQUfAybHDQ/fGhs24
         yrNvPWwaUnmNQxadRzocEQEjuXLaqtErNxQ/x0KltWP2R//WAbtE8920r7wL5jWwmwYy
         +LBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360921; x=1793965721; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        b=NvTuasaAonDswJbA8uKU81n5kMwiqfct0XPrURmBvw/FhMAxaV/2DTOyF/S7YZt2wo
         +oR/twVG3F+W4RoDYrJZQQxnHd3N1bihuPe3WhwnM259p5igTDd2wGarF/9BANJv69Wo
         MdHov4TnBlpvXzIf6nZKLqDRpiECLwROuSfrdyeCiX8496s8gIQep8E1M1nJTRpW3xn8
         7yE6LHRFDHbgrYLTLpjlRPwBFeP0FSsjoJZiV/FoZ/uGo5fsOUTZi3FgJzUO7zb6i7l+
         xdlyW1yLbjLyHIyAF7ERuto/KLzIPKixTL3jr8jgVjQ9qdxbdI/9qsCrxG9lvYBRcnZn
         P9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360921; x=1793965721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rytTxuDwmZaxUvmFDOrr2QKEaKAyu/0j3T9Yur/Ie+Q=;
        b=NOB9bMrzAKrRx+9emcxkhyrpBKrPSf4T6dlcCd0VsUNFx0K8Trm9DHy8wywGuLRs8B
         OT2sfHbi/PxblvGioBkYMuN021A3webVd2mQKPJ8jTCR76ktrOqmNZ/2+OxpWtKYK7RV
         8rKLQDz5rJT1oeM4sn9xqPsDBUFvcj9ayvM9fEBOXEfHh9ziqYKEbY6wIltwL+5HQ8jp
         dOSlUTRLcdXlSIHxXOVj3e8F8NiwUetsQNkmDD4BdT/YvQalWYRJ5al9aysE26sSPH5T
         Bvw9ss3/NiWqTpmL0Rmv8g71COP0uWB1Bx/z0MOpv0qTNCODHLDI6urQ+/aktdAlI+6A
         OGpw==
X-Forwarded-Encrypted: i=1; AKwUvBz3BohSJhls7SmXNP49nD/L4RHA2dzb60SpS8RNTf2X7NRcklIGJ8dZh48YYo8eslHxvFBJ+dMBw1AYycJyDXhS@lists.infradead.org
X-Gm-Message-State: AFq9FYLDuSKVoQj7B7vwmrTY8p0X4YYGmPZDzD+mLppORmOX7v8AmVT+
	LiXZqFwxA0x76dLyMZRYzMs26NBssl8fG32OpJoRhrxbgr+dwR69YImVvQBI0ws6nQkaix/cFZx
	9Q8LKrL6jf19x0tcd2Ds8u0VtosvtBqlXFhVOfUk96w==
X-Gm-Gg: AYBFou2enVj9K4tJvtK0gf1WF3EVaWeEWiZy78FZtYhVPyCbRC+47W2CsjdZy9sCxG0
	Tqx/MgqXP4EMoFYUme3iw9nX6ua6SgK8JDtJpOipKoIq3W27T0GNDcXi8HeKJho1/5XI4E4X79D
	Kcec/BkSl4Ndi1x/g1VWkyGJQf1X29EA2nVPotWbQ3AjJwVYdpXny7QejRYVwTfc8HwVeLPXG70
	OX+G2Hn+vXPztpLbBrTI2OoJVBSaFLxVoL5ieXGgvsVzTj4CmZhfEekqRbrH/S4tvjgDSLmxYCX
	Z62knChfBgK4gTyH6D+aHucXAcRAMiVabmtcTTHr5zOFdFeFwZbVg0misZ5id2M2d14LjPDvaFj
	61cjISjRbTUQoX2oVjZEONvhvlRgD9HoYy5UVS6wTLN5Br4dB530qlJVkwg==
X-Received: by 2002:a05:6a20:d10f:b0:3cd:3e77:1dcd with SMTP id
 adf61e73a8af0-3e928a7e442mr2014372637.1.1793360921012; Fri, 30 Oct 2026
 04:48:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-11-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-11-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:48:28 +0000
X-Gm-Features: AclHuK9bHaRXHNAR7u16We-RytuEmqtwRDDQT6RAcbrEMxFejcbNnPABR9ssHjo
Message-ID: <CAPj87rN7RWfEa_YypQq+quER7V6pt2A3q4fYRuUXF3_Ch7yL8A@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_044842_406840_6AACB956 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> The debug entry in the HDMI branch of dw_hdmi_qp_bridge_atomic_enable()
> previously printed the literal string 'HDMI' as the mode field, giving
> no information about the actual display timing being configured.
>
> Extend it to include the active resolution and refresh rate by
> retrieving the CRTC mode from the incoming atomic state:
>
>   dw_hdmi_qp_bridge_atomic_enable mode=HDMI:1920x1080@50Hz fmt=RGB rate=185625000 bpc=10
>
> This makes the log line self-contained and directly useful when
> debugging mode-setting issues, format negotiation, or TMDS rate
> mismatches without having to cross-reference a separate mode dump.

Reviewed-by: Daniel Stone <daniels@collabora.com>

