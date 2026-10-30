Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C13F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fq/5yMkd;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=g3cb1ZJ+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=; b=fq/5yMkdvqDSOmEF4PriAWixuF
	qRi5SVvgTKmThcdIv9O8747gQFlJkN3ADCgW/n1ewWHddU5MYDD8bCf8+UReWcXll3cW5uzxRjj7f
	xtPErcSo20zWOQipmYxXxPiJw6PeSkdzy6YCaExBYPzb0K5elZUekSTg0QHP97jmiYlMVAxVS3aqK
	xgB+UpWwN9ariqzw2omBeajXilWdgQ/eR9MEpfgRLEM7FTpGrxJwzdoJzYE2i/t9KMqkz6+WczsSD
	mLVZU4n/TswNDL5dMnzKXN+g7g460z05n/NqGhTbHHcwcTExYPQHcLKvOTWJynsKc4vTFXJT2NX7y
	Dm+oF6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkt6-0000000BYzy-46Ig;
	Fri, 30 Oct 2026 11:35:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkt4-0000000BYyV-2ICy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:35:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e987b4a710so9379445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360109; cv=none;
        d=google.com; s=arc-20260327;
        b=POjiJhOf6H24xRGYFt/9oKNG50EcuJLyM/oBiLoNXdKSKh9Mkb4OhQxbWNT7Rvvayd
         B3bxZdghq7lqN+qndPKVRwce8OhQFhHLQWUdONilUYQ7HcsTDgrlZbfU2SzlXpQEEybe
         kkhKXOhDG+pHFHrBxL8dr3moLsjBJR3zx5o5TwlT6J9Utgc1X7f86ptCb58g6QAXPrLS
         LRV+fE7tuphLeVqFq/LjMhH25FfxNyQQlCFq/up0m8qKoY3q20ZER3jpcLEbfA06EG9/
         asC0R+uC0es1rOoDbokhyerw+2LJt5IWoxMRLj4rqWkdnyj2sGDL/f5DRcwGlcjaBWQ4
         cCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        fh=i8idniGYXu5sq2Z3APJmv+Uw9KTNLhZOEgJA7xtgyfo=;
        b=NstqHVawAksJ7LA88xV8ahmWH8wxXK3n+Hz8HZgEwttjr1vgOq6kniyVNy1uucK92k
         En8xT5/r4I8zLSaW5sVOE4v2R8ef9KwrFuhP/lqxoXTAWr+h8YdiCWJHq58iF9pouXvp
         sGkgprX75HR5uahWNOA3Im0Tc0iFmXhYOAe/iWX2mS12XJYyNJ6MoqGceouJIQG3CQsl
         lFFOLRBduUTlNAg2lkYra05Wms89JnhRM1NUw8rdYKAt5LT05eL49w4/vsiSdnJZiH3z
         1R/KS1VwNjISuM2c5grK0qPf7NH8jw7C2leGeftpSlv2IQiFLkUBtTVumIjEDJlrdLZP
         kRmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360109; x=1793964909; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        b=g3cb1ZJ+TN2Zak63xVBXdxtjE/fDsNkyMZBKgfgUsaGPv6ARjfejrqjjZP8tpDtjRH
         litUN7zR+DVnRz+6TsbfzSXVCKlC1HA2Km0iZVVbpcWC+N88JvYcWr21gu4583LEmE3b
         tbKoJOBwfyOpxUfEyHGcUYMdEUFEJB6jRZtrGSQPNq3/BdX7hwNpNyZrQ2bNe5Lx/YTw
         I2PMXT4aO6YQDWJr1bia2wqvxXHI7SJSSm5mFf6ivRYBrpit2nVDMSBTZexNJKI3+7NN
         99G14BoWUg4idBOsKDSKL6OM1CVoz4r5EPDI/dLt/nTtbavW8A2MhFawvKGkPlG+O9+O
         +NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360109; x=1793964909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1/uyCfgrexYOU1XKSxjmyAIj5YjfxeLRY3LwALyGTk8=;
        b=2jEPis9etvdE3dM3afMxkXKT211dcexPKz+ShHSmjU7D2He0g/3G0N1ltNNA90+0r3
         0Fv9HH8kGS8dTbu/S+LKjWyrec2wlnWx0fHsv1rQehqhNQqYkBdYSuUa1cJHckvRZ+Iv
         6Shm7QUmzDeKn7h/H42GpJdMDqdi4HYOM/MHCotSfKFjCdmshXA1evl8FX9P+0+M7lOz
         VH9lrY0r8ZTvK0Q8A++QYYYZkejOeyk6zQOKahC5jvE5hyHE/gkM1TTjhA1Kvqmo/8IS
         bkQGpElnM90t/xqFFMdH+u5LXnRsHvP131kUkeZAMKC+aFbMNrK81dkHvqQ7GQgLkW0/
         BPoA==
X-Forwarded-Encrypted: i=1; AKwUvBzvkcJ11cJMr7B3wb/uYuN6Dgz2mm8eDNDB9VZ9JvM2g5e67NyrGpZK4UEgo68EDcg3gz+xZFhICbJG1SaPrbsM@lists.infradead.org
X-Gm-Message-State: AFq9FYIO+/CLvxlncuA9g1dLA+M3QjFk3GAd7YdW6eGzuFU4JVO/6a1J
	f/9mud3Wv7r5QNbGsd2ldNHCWJO+Y1zS9a7FqTlbasg/H5HMVgW8u9KXOO4fF9fcuoEgMDr/xTs
	1hcyrlXy9q49Yy46vVNyqKMf3xA3S1HkM2OtLn0gzFg==
X-Gm-Gg: AYBFou0T6N2WH3g+7qhtQtOgplpcl99hjJ2AEaG+Sr8NSrtxBB1bogQuaix6Ff18az3
	YN54J97IwVxrStDiXa3fgf2ae7sn95UusebG1lP4P5wpv/hDiiM4ENHUMSqwO73EDcsM/ixVG/O
	+tvr8XQjO1lknSvCMvxj1GxxigPCCpYma0c3lnQmpZQ+gHzK65JeS1K84Se6ZuFbMB2ITRTLwQk
	AxE9zidhyMmT9U855sdTar1AeCs0gltHXL27nbeIbRE3aw03z2KF6oPS3gpap59wCf0v4ySPgsV
	tPGkmji1kTA3q6TNLp4E4BFuGuQgyHKXOH/6cOmoLAkLo7VMP6oNqlNSJWE3iCy1IuesL93br4V
	0xEPBQe2xYrejHCZMM449JRhTdDLGkHWOpobC
X-Received: by 2002:a17:902:e549:b0:2e5:41d6:178c with SMTP id
 d9443c01a7336-2eb364f8d9bmr16400675ad.33.1793360109306; Fri, 30 Oct 2026
 04:35:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-5-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-5-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:34:57 +0000
X-Gm-Features: AclHuK9zIGd0T_kGXOKSuNwCM4dWmBNTN1uB9T4b5-OFaEClVCp9NkMOArmh8_E
Message-ID: <CAPj87rMh7_Efefe3D7DyOFmMiFUtBYdC8e6EXfJYzhEu3DXDyg@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] drm/rockchip: vop2: Avoid division by zero when
 computing max_dclk
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
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_043510_584417_91E1DDEC 
X-CRM114-Status: UNSURE (   9.01  )
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

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Default bpc to 8 when it would otherwise be 0.  The resulting max_dclk
> value is a don't-care on the non-HDMI paths that trigger this, since the
> encoder loop will not select the PHY PLL as the DCLK source there.

Reviewed-by: Daniel Stone <daniels@collabora.com>

