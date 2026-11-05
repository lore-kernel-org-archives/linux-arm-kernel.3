Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ECC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gJPVnZHB;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=PAsSpj/g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=; b=gJPVnZHBegBz4FNJddHXYRcLJ1
	+sB6MwoYziVLJl+RN1i50FNpQXqHHwdgn/neh+wGnK14nkmXAL1RHOV72smdqfEj8y8kmOvQB8q9B
	j/vgGIHTqTG/YgQid1xmZ+KVdyV69Yp48Pi4K+G8YgzKwtCloRfxomzTlU/C1ojNjxqPKDesd6e40
	6Fhdktk833p0xLt/elycChGH9/Re7pL025cfGYwIQWnZZuesMNiCvpVNLvmng6hOLUoW+QxgAja7G
	MwsUyMIVtM550iL/n7nzd2MhjaZOoeyM/iAamL8ZF2eAcmgYXjeV3cCikDDhJDhujFRiKiWKFdq52
	Z3tlxiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwI5-00000008qt1-0FQz;
	Thu, 05 Nov 2026 12:10:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwHt-00000008ql1-1orb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:09:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1335331a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:09:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880588; cv=none;
        d=google.com; s=arc-20260327;
        b=PbKIztn3EXrmKUMpXXsZUepyTpKdIuqX8nxDSYmIGsyNvBoAT4UF6KDII4yh5gznL/
         1agQ75RL4kBFAlxzuHWUafjan6/jwfbpMdt1aiM9wZPHqEZRLSxVDGkd8QAokYBoJ2h1
         sy/2aUpbI7bGP6Icpm56bDd0J1C41ZUVFfAJvXz74zQC53rJsjcG9VCtRkqGhIznua0c
         G/hTgG2xN+173ApzzFe87yLLUqf4t6DmER+4DJS38H4s6Xa/TAAMehXa3SG2NNJRsnvs
         P8DpGoNHaxlPaC8xQ/wvXSSDz1gxRTkmHHMMaiie2djYvJLz7jhL70E9xzrcBlsWxyRK
         sdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        fh=idJKbixtsNUQ01gbvJ8U0dqF3r+WGj/3UjwryG5TDlI=;
        b=Aj7314tOnMpYQ66OCVXP0vVV3PNCM75/Ly8SXyux7tIN84L0WVFTG/ERc+THqCh9Lf
         QrPuSW0Ge6ZdXztoBeD/+SrxsDOd0wsjHNzkNGaP4fTna4eLweeUbqkNh5PCyfkgO4BB
         y9s+ZKtipeQ52fYwnaED7wre4RCL+P7goQbUVdVj2MLGG0a1/KO0+NcQcYdhO7WM0WGO
         YNaa97O74Vnj3KDWj3eF+Z+3Z30k86S6LzZdEnl08gE7wfYi8dGwQ9x980rZRBPsfQle
         WTu/c7Nb5ThCWiccb/fhxGjATRJr7VOhgRO+5fRVdEYkdneLmF+xNfvbuc3zYX/oAsiy
         jjQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880588; x=1794485388; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        b=PAsSpj/g6EnUeBhHs9oRbCG5WiSP4tETK2MspemK0d6wOd4UaaordV+fNGXoTvF7Vg
         /hdc+PDqO81fW3ZV76frgQSStzRWZmpS9TL1xVXYPrSKEwuU9zLOK7UEBSwJ4fTXx2C7
         YJRRt0bw8o0lWvFlbYt+V4vHxAKUzUPwfYskrPgHYZbpFEh7fqqkD3tYgveCs3NvOiEF
         mohglsWu1l3YQSUc5fgu66Z45FjhDbVcJgkD6R2LmmTw7UwQPtkgjWzo+mJol17Kia8x
         mH7V6NnTc1kQoer5paHxsPBuT3RBXFR7pi0FOncpkOCQDSQANZe1V1qp70zEEuYGPqXQ
         pSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880588; x=1794485388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        b=jSXJR9Tjpjvol62jCxD3dlZEEIznYPvIBeN5Q3pR6C0t4irEKJC6vkoK/0mD0INoWw
         gqKFrHNZ1aH69Gvvzz+nq2Ml1ivqn+igyT2sb+YHrX9JjYErLGo9ZuMk10AZM9+SsW8d
         G/TI2gZKEpzQ2yNer/5rRCwKb/04rrDNEr8fpLgAoMLoKKL4MWQMBnkp0DoLf9WidiHf
         4/i2PlbV9arOSV4wQ0jXu4EUieB7rlq839yv3MRGCa8p8ltdob2e/7FvCpQfLPtY3LTh
         TbmRg7lDZHkTNz9hn2MdGeZEKsfNJ6mwvUCgRMNJsV6rq5V4Sh7bxn+MTKOd9zepkZUN
         2Qaw==
X-Forwarded-Encrypted: i=1; AKwUvByiVeWbzmwfKuN4AeeThUKM20ZkurkLKTVVy5WrQlx56jub3O8jeujRph54N6gCTiM88Ysmi2nC1rqa8iTRVQOY@lists.infradead.org
X-Gm-Message-State: APuU4Z/pyfec48Vpo3FbpTjydiM0CnEmTkb6C+Ya61Cb/N7DIKEnT28y
	lIfeS/d74IpsgjbRgVvFVvhwAHrUfC2epo4ekqs0R5tammRYtHA1ewtBPHVFkcSX7Qg7lLaB4Rd
	tT0KEdWQrvbJygtxG3gFo6LGprqVQMYzuxvUExfakRA==
X-Gm-Gg: AYBFou2k43JDGQOLFQgL4CZqsF5sCSM9bH8WUtaELHutldF33ESw8DxcP65pwnT6euy
	tjRTPjm0y9XxTE4KRADWmhWI1JXCqo9QOkhe6vRC6zXb6coWSeCfVpIJ1nYi2MSWVcGNbMTfv7H
	/aGAtiI4DxDXx4ekocgbFAvLdV+zZMQg9DCSiye/4BY36F+UCFWI5BlC5r78vuNPPGTXB9SboQT
	1jWs39E+t4yLh15n9+3/4PjkMUg9Kzi4zHkBOe5rgTCQ9gmbKakk9nKZ44YF1Ezkq0qERvKsrSn
	dFxdl9hE/KwBkH+OQMRLDHZJNvYGOctsj8J0hTj6Ac/4HsMRjUihYwfAOCZpvthn7GAY2x/1UOf
	iQRU2E+ZggdLIrTVjcDMrDQ+l8tKJPl4U3VMtfgA6JsH70lEp/7sQ4NTRp8E=
X-Received: by 2002:a17:90a:e7cc:b0:3ab:2737:3395 with SMTP id
 98e67ed59e1d1-3ae8979d3c7mr16512224a91.42.1793880588558; Thu, 05 Nov 2026
 04:09:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:09:36 +0000
X-Gm-Features: AclHuK_MHMThyHgJMV5RxoSYYJYLTJBQMatbDWcZrO2pg9eAtUGM46fm6kw3Mdw
Message-ID: <CAPj87rNp=Qen3CpxdBWHrKqmpDq=w=3fhbuJFM2uVLrwizWQRQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/15] drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
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
X-CRM114-CacheID: sfid-20261105_040953_458214_A1A60D20 
X-CRM114-Status: GOOD (  10.64  )
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
> Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
> color format, and the required bus-format handling and VOP2 support are
> already in place.  Advertise it via the platform supported formats so
> the HDMI core can select it.
>
> YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
> high-resolution modes such as 4K@60Hz on links that cannot otherwise
> carry the full-bandwidth signal.

Reviewed-by: Daniel Stone <daniels@collabora.com>

