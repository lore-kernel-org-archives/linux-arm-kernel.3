Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714A16082BF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4eYIZSUD;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=RK52y14w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=; b=4eYIZSUDc/iH7t85kNYYNs7XY1
	utS2iP2v6RcHe2zzsNj0bUgo5nl0+jyQZEg57oetYlJHXZ1OOek34c5ZLwWFTOgkPWwrc4FBFpcTE
	h9IDrWoUZLtpSWvORbOFvWdk42o5Z7QHpkqeN68ffoCecOPLuG5QNAgpXaL5BDauvbGXUskFTdWvN
	4GCLdIqCpXE+F7WowxK1FqXZZr67n4lZP9qQ+ePUy+Jz+eDTiz7FnnWb4LOqQnliOSmh9HZAnR+Jn
	xc2pgS4NL9FknA8a1R1gJHtmJgMA7HKXZ2j5/hXQ9Tgl2AWseSNuM5WcBkWDOlS7P3NAbulLP6hpw
	WMjDFfWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvso-00000008iC1-33Oh;
	Thu, 05 Nov 2026 11:43:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvsm-00000008iAf-21NQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:43:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ed06b725fdso3302585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879031; cv=none;
        d=google.com; s=arc-20260327;
        b=EYYJH6acfLflN5xRC0pjwgxy5LdLbgevsEg6dTz8ZykmvopVUMD5MYYuXrWpCtaBlt
         ZhcQe55iksY8Fxh/nur/2PeQCsijGxHKoaaGZxzj9AHuO1BAXQDAVpts1pKXL9UmQRp5
         btXs1i5zo0N4UqHMkoYYJq2tIDUXmCDyawZEGzBOfZOPLB86g3e+i9TuwQtOioA0Ihqa
         bH1RtU3h6NC1jLEKY78SObHjdVSmAuj1Bx7tkgxufe3cpmMXcmdR+nI9Cb41cupDU9Z0
         20yuVMl5kF0jpfARx569gYGc0d1/alYVMfLjIQLKMc2Vy1QF4Zptr8nXH0RgbQh1VD8c
         t7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        fh=nFTmD8hfif6AT/Grm2E83alQ6Kemw3Rod/2id+ky5FY=;
        b=fJjpivfKcM36+gonwTXqEtQBb5zWAsbryVNoh3AtpxuJQZBMALuZbMCSnHfZRGZ4hb
         PaFEl5QLJv+APrlubi6yCS0g/8p2BhhB1QK2TIsbSDnXyO0dw1vOWZEwKTGfv4IQTLXH
         ymU1ohcFb22DlAWHjnBfhskf0zPIaP1NkXujFV7M43DHUB2FKlR6lhi/wWyDeaJ8YRhp
         i6otIepzZVU3nRaEn/afZJAIafSbOeKpPE/4z9Q4jDZ65dK2HmQg+0wcBJhU///l51+E
         BidV9CcrZi3quzQ/Z9jgSScDp0+ZBlhRavVdM6jkWUFHt4hgP1PXZYHcdlVyypym97LS
         Y96w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793879031; x=1794483831; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        b=RK52y14wGX7xDMAT6dlbCrkHGZvPtV/YlS1AhfZ/ckhQzoLOx+u7JNCTg8EhDXrg+u
         R6uhI+grAnggV2ksCBL6S+7DDF7hJU1OSJmcWKufNu0oCjCgV4S+y8CEeZZEHfm3ZKRo
         x/F/Czv32h2EpGf7G7xigbM+iH8OAgbg2+WiVi6FNFIU5Ivh/2Bc+dWJ0OKH1hlL9Rcb
         PJpWFhTeORbq6HJPAy8w4wP4C3sIaFDVdoO4mzdrD3dvsX1M2sSbQtJppKGsHtYQct7V
         KQVvDx1ZLXQGZCwJ1rJPovtQ4BsSY3h/WrcD9m4flRB2MO4A94PxuQNSdFQDCWfyRWlK
         cYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879031; x=1794483831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        b=o0VWGMC618l3Fs/OWPangM5BK5tNckWzTlxQ95kSxJx1uC7hxvidryrgOzERmIhkYm
         EsXWtxg9+JG3NLGWnGteaHgZiNEHhRH0jXqXPeudpg2tT5o1XEM0OhesTpiel3+Krv+t
         N51kpAlUm3W8wEkCxGhGJS1h77+tMoqgGnMfaJ4B5p58f7gUfXgJ9heoDcThg3okWJKx
         0VDXeI3c5FnyRtQCXBzYAikfKuePXOqUIf9mTcqoM+IQZizKWwRKrY68S4aCrYyBPfnC
         C0f7xkpH2qz3eCxRs0IAjdGkmOHwjX7HBAZN0N37wlns0dWx8LjSqmer2S9cNG7Gh6v3
         HV8g==
X-Forwarded-Encrypted: i=1; AKwUvBxpD2bRF1lsU417cIJHdbXN5PHhm7vtqjvTlNhueRZIOnMw94/jH0HHZVcRS4dj11ya+0HnfesBW2KpN7fkQSmB@lists.infradead.org
X-Gm-Message-State: APuU4Z/jvF40UJLMF6wr1w1I56jfSqnDrnYHEMpFwDKw9tRmX/1lmHh4
	df3lbkFMF+MgoMeCda2efi6NGhMJI3bdIZbSRC20hMDxr/4KmjQ3XJklBkcMfOknM9t2ekqLYvA
	miJrhzcHcD/5tXrPDe2zrlzgxZ9WEKdZIgUWl8Nkmnw==
X-Gm-Gg: AYBFou1LCMnDOFFUs+JkJ6d/s9Ts773M+xH3qG14LqdYrrlMyDD+Wloztlh4hVFxKVB
	RDk902G06LRsZDRWjFJuppq8KlfR0Kf2PwNe/JyKb61X/2zthTBA5WVY8XmoYHiqXeWnFugBgY9
	yMe3h6MikwKqh9gLSg8h38a54QKtT7cnjNNuel9dtk8uYME92P0kktyL2cWD50pkYB+HO/SpzEs
	/Y8KSX+zOGocobPSMoSR+7OUokWNn8LFJNSiUfDmaJeCMHtvPTA7N55hjso8+lb4bZZdAt3V8h3
	p9rM5S/vm2fdyWPzrsJheFVYRDfCvvH+Qo/p7FLEUuUKapr//H2xOPXcSj8D0gbroha6d0IyTIH
	Wj0UNA9Wd+IhAYNgtROQP8Jg/qPmLJ+HQpeEY
X-Received: by 2002:a17:903:acd:b0:2dd:c100:2521 with SMTP id
 d9443c01a7336-2ed2405ebe1mr15348025ad.42.1793879031149; Thu, 05 Nov 2026
 03:43:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-3-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-3-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 11:43:40 +0000
X-Gm-Features: AclHuK_G5HVtKeWQBX7RTZFBduxaJbvsY8isCNKQp8OLwXCa8s_PlYhYGah1Zi8
Message-ID: <CAPj87rN4sxAmb+Lw_xGeQMsQeD_hR-GNaCHeRFivAKfp+Ww=fA@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] drm/rockchip: vop2: Disable core clocks before
 dropping runtime PM reference
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
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_034352_622966_195554D6 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
> vop2_enable() acquires the runtime PM reference before enabling the core
> clocks, and its error path releases them in the reverse order.  However,
> vop2_disable() drops the runtime PM reference first, potentially
> powering off the VOP power domain while the core clocks are still
> running.
>
> Make the teardown mirror the bring-up sequence by disabling the core
> clocks before calling pm_runtime_put_sync().

Reviewed-by: Daniel Stone <daniels@collabora.com>

