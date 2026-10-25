Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69558606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s1gYJ0Zj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KtuE3vyS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=; b=s1gYJ0Zjl5+oMK5QUKffooJXam
	zl/sG6HTRj3TU+6KK9h7Uir7Er+Qa8ZruNv2uogzooaHiQyKI4ys5uAwjiorJIS1dk94G3kXLyCh4
	in04xUc5S9OlEQWPxqFkLNuT5kvOHvU0WwqZanomYiFtaCuJLJ8xmb8X+sEV5uMzCT7hx3oeVgXZ8
	B9idaOUrP9yehRSBaIXPgkK7cZcQ3wtRg/dX9/Qs8DB+B0pOVJb6mXymrJo4LucJ9d/6i9kJYCmDR
	nrHZ/WKykpJtVjJnYuDOXtr8Y0IYOe+w0PbtsdbMBGPPh1lby/AEDYHwbBBx+5uJFR8tDst4ySYm4
	8Ryguhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL05K-00000001APf-2qfY;
	Sun, 25 Oct 2026 15:24:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL05I-00000001AOv-2yER
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 15:24:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so12734555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792941870; x=1793546670; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
        b=KtuE3vySV69aChNmXw1djZBCFUCD1EV8U8Ot/oDiQT020VEcod2NydyyaX0szmBq2b
         YICcbin+Z03iLJzLv1pRtIgNHIWb6SmvD5lTy8wd1x1Y4R8xODb4J0mVxzq6bas6Bp1/
         iQTnZr8Amrc5ypIZxroUJmd7eN4xnjUZpN1b8JSFeYBPRbiJ4dJciGVpOcXn9U08mXKR
         OCMm0vTRZ7ukZ8sO3V01N3bw/F21z2vhVFzGM5FTAr0sxH1EELgehLdXMpQn7MoMTpCN
         dtEwOx/IKUOUpamF0azANwMn15NiN3bK1b9chNnP+guytFjtm8H8zyQVidLT5M3tagsS
         LxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941870; x=1793546670;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gr7m8Jgx5qFfXx97jCHm/dv2wdINd/6dtVxf1769JNg=;
        b=tSFUBtGSncseMzQDl2HzWcsM5KCnJByg9ekqKilPUEyU2v+MzzmgRvJjimr7FMM/D0
         ntiO89pbhUqTRDj1vivPJ38dwP32Ln67LMDKhQ+ZX94qi4KFZdIxrS9G9BDJAm7V9skr
         44W5NluTRfRVRxi5nrcPH9yrGfrUUOnvqvJoqZDVtngG3bfomS+ZZRrcRz+FPl0tryPe
         kG4qO4uSAuUA1NgGu1rY78ESF1z3aC1J3YKCA1h4wCPvAMaaLQtFZ92vJqswwjQqf+kS
         ZwWWe/9WOImpdXtkmZmyXtgg/Ef/D9n8b14P4/Smi1ihyLTSbiLaPLNj2vpd1ERTaDyN
         xYJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7yaCZiCi1Ew3PnVMnPzNxAWtAnPgks9+br98e4DNs9XECR01CQafIM5JSVMUXQPDMwloPPbTreup6KiHBEuvw@lists.infradead.org
X-Gm-Message-State: AFq9FYL5INQyjIzTZuopVT4mtMu6PJgAnm81IGfGFP/g7Q18bSVxaRUf
	6AmCr1BZeJEZ5s5leMLPHskwH+aI+oNykRGYyidcrcalV+jLEYi8oS24
X-Gm-Gg: AYBFou3FJ35xJj4zhem9019wP96TL0xc2S5FjiQiae2iBVan/U4FOCYsdw5WT9/dCxJ
	ihBfP25y12qhjyrmiP+YJWKUknf8aS8+D2DwaXFTDZXmVMwIEv+Q2LgyfO8GNyrnWDX6mE02UUk
	COe5mRCqoYnLjDShNTW4fOkYd7a1lgjzQaPOpqLZMf0Jg5m4M6pTEdQa87vtTrK09yvxCb7SeiU
	Zi3poqQC+iDtV2ruNaWOakGUJnagkJ5ssfiCod/bGF635Q3ZElFxGvIiKLtGaQBI3DVr6UyBlj9
	asNbHCT6mN3tsXm1xbcrwCFoRl4xFssWKiCygfGyKfr/pE2YWkeZ5luIdtz7D/Qqx/oKm6HkNFp
	QBIPg3LgYpCdYUeeYa6iA09AMk1OGtcXE2l5IaOsaIJ5yWkdn5BXEG+sjSjXIFy5WuDVNaszEdG
	Z0GlVoduyj117Cm0yomlwOtET/55sHJY/3QE0aA/PdQllgaxYJsOWpjJqmKnHoIxpY8f7voe7FT
	MiPq4pTYAFciJkKBGK4SCoqR0GaCjyDeuu6t/HtVwHGoNhsF0VV2Q9fYGKfTQqnEYSs2HLTncgN
	AIi2j5K+yV6H4CYn+d6MQE8nzMB7uE2GK0apm1WfIKM=
X-Received: by 2002:a05:600c:c0c9:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4a587b3e000mr20792825e9.13.1792941870382;
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm132982575e9.2.2026.10.25.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: use the lane rate for lbcc when
 lanes run faster
Date: Sun, 25 Oct 2026 16:24:29 +0100
Message-ID: <179294186960.4141843.10824416552753869438@gmail.com>
In-Reply-To: <sashiko-outbox-184251@kernel.org>
References: <20261025142639.3454322-1-romain.tisserand@gmail.com>
 <sashiko-outbox-184251@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_082432_801485_F415A83A 
X-CRM114-Status: GOOD (  13.81  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 14:38:50 +0000, sashiko-bot@kernel.org wrote:
> For a 4-lane non-burst panel using MIPI_DSI_FMT_RGB666_PACKED (bpp = 18),
> (bpp / lanes) truncates from 4.5 to 4, giving a lane rate of 5 * mpclk Mbps.
> That is only 11.1% (1/9) above the 4.5 * mode->clock pixel bandwidth, rather
> than 25%.
[...]
> If the slack is only meant to ignore lane_mbps being rounded up to the next
> MHz, should the check compare dsi->lane_mbps against
> DIV_ROUND_UP_ULL(pixel_kbps, MSEC_PER_SEC) instead of adding pixel_kbps / 8?

Right, the 1/8 slack misses that case. v2 will use the lane rate when
lane_mbps is above the pixel bandwidth rounded up to the next MHz, which
keeps i.MX93, Meson and STM in non-burst mode on the pixel clock formula.

> Should pixel_kbps and the pixel-clock lbcc calculation divide by
> dw_mipi_dsi_get_lanes(dsi) instead of dsi->lanes to handle dual-DSI panels?

With dsi->lanes the patch doesn't change the timing of the dual-DSI Gru
Scarlet panel: its lane rate stays below the per-link pixel bandwidth, so
it keeps the current computation. Switching to the total lane count would
change that timing, and I can't test it, so I'll keep dsi->lanes in this
patch and leave the dual-DSI accounting to a separate one.

I'll send v2 in about a week.

Romain

