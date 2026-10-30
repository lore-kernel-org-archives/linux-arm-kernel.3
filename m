Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a0KSf5A+;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=G/+Laos6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=; b=a0KSf5A+wI0HuiIysiBXA5Sn9V
	gWfuptAPEsyWChOf/u+nz/QTV1QkIncNmBcVf7OM8lxEupy1zE2PprbPTzrxpAFosjk7eUtc047sm
	9OHsQdaQ1VmkPK1RS5QzORORfC/KjXrl/4hSLPJGNMUejaa3byhaqu5NS8qKtveuJY7CVBz++/27V
	qlimMcKGh7KiFXLD8Fi5NRgBgvYLZkMbQVt318y14Vwd2pwMn/jXMkkL4oYKkBDmq6v4bdwmp3e73
	dXwsWbLevlCFZza+i7etmFX4gbT5fw+VJ9saJ9HCLfEuQydiFGcT81ps805yMDjBmYaMJEvCEjO8Y
	LandrVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl5F-0000000Ban6-20Zw;
	Fri, 30 Oct 2026 11:47:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl5B-0000000Bam3-3UP5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:47:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso3867625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360860; cv=none;
        d=google.com; s=arc-20260327;
        b=CCUqIqSbKOLdR7uu2tIpgU7p9lX0DPWYWKCmhlXj/22NJAkPDCNfWGdybDGKF4DD5J
         FKvffkeauWKSdUPMNfdUc9XljEr1cipmTV42NdBeiZpbsL8jQT/eQt9C746NmTGJdojF
         iZiKaCBM3JDD6keVyjUMMF4kpeXSqr792yixuh0bgduXlF4kifTymQo1bjGmUe0ow9+8
         W7a9vvAYlx8Tn6kSYb13TEvLKRu6mho71JIcOhK4iXR68kQhvCO1LozkpYCDaZF1OoV1
         qNU8dyWC3sDQpUiAAe9KEDybYe1uLvpXPMsRj+KiLV0zBx5yt5nXxf9f4UC17D4QdL+9
         n4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        fh=JgMRNOhgiWrJVaDdsAIOWAeby3kIwgSDP97bXr6GTOw=;
        b=gbi+yHwOtr7+uaTMdQB3Wa3FZGITi2ZGo1ecLgeI7ec3szQBI5zB6lEO9lBtWnAJDm
         WctsUbafVMIm1CIAh8ebsUZrhCUyYsjZVrR4u/LB5yD5Lzi+shmusGEQxSwVnmVoQ/Jb
         3Yj7UnYsg5p5VvdIqT4oeIZT9EZyxX3vV0izzvGq4ysBpHiLyVXPUkEyf6ZrTmzJ4LL+
         jtJsUZuOZLXZCDp/iptzo+xOFcZ1SLLZ15cIrPmWlYtr6hg//VX4GVfrBig9DrLY9k6/
         GSGg4/XXNed3Ox2y0u4YSSXMI39rtMcPWr+VZfaKzXtQh4az+CslGE4xh/e0pBWgnnHl
         ZXCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360860; x=1793965660; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        b=G/+Laos6VA3qF8FRW989FQw9QPcFAf3pACaFTpMe9NjPpmBvE33CGvaUERv6z24TSj
         UNhBApIj+vfxK2umPI4n5jyE8kWOJ3pqJi6GVXejy5OSzw7FlQyi1MhIx661ymkIAzES
         femOX6fKmduMQw1mdCSTfSE7Su0DtQfoK7qj1BNB+dwiH102aHCfrDvRWyEPAqazaYC8
         APlqhauso7GO3/Jv19VL7UkT9vegj1pRTMpzXnIfKhQSDwwZLXs6p5aC9XW9MdnbNfmF
         Qpt2BURVkf4R70IP+wbtLBoh/6qqqbR0RbjAvK+5MWabn2iqzjwSqfVazT5KvVY+6lFU
         8czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360860; x=1793965660;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jhQMGcD15ceeh2wLMh9Atxq0/hg3i7fdihgYRv3Ypv8=;
        b=M+sYznskRswvjOcxM7ksc3klbCXIxMuHnm9ALstCQ8nNRUFiMO7oz57Z2YDcXE4/Rl
         kuDTpqCx/Gx8y1yCb1rANhhF6jzwHB9kuyWqU5WMF2qSSVA5sJufwrnvH5Fo8Pb/dJUE
         BuI3iHSqHEbk2dkAi3kSBZBkkRTeSOiRtmfV27jRtoL9WjzwF3Vt9F7eyTPRDqrfpQ+L
         MjMPnRykANedkyPDd25oHw7l/y9PVDGm02iFMU8vBu+aF7yO+jyQB0mQ3tgw/28a0YEM
         FvwAEw9KTx6L10YiPXYMKdtQjqSJsRCKz2SCXcw7jksB3irPj7l+XNL8ggrztu5DzIw5
         5nyw==
X-Forwarded-Encrypted: i=1; AKwUvBwtGVvAiL6+Yl0bKVSPyTdZ2SyJMeJaPMv9S6icUMJl0l/I4S1clawk6reBIn7Gwu3QouxSKRsOMf/qI3KNhx5m@lists.infradead.org
X-Gm-Message-State: AFq9FYInKbpMzAuYUpblhpE1zxgR9j+0Na8UvYPkLyDstD4quBoVIPIE
	s74IfZsCC4xDIE1rrfUvqnTEX9CsPnlvMYL5Nq5qmZVolS4c0bQi2L5PspsWQLEnON+mVBcuSoI
	dz9koDDA48SMc2YPF1lKKhGa6O4VvPH5/7jhqfMOyow==
X-Gm-Gg: AYBFou2+RkycRDCiZe/1ElnCSPwtnSXcXUDwFyy6zM5vd4zV3QqAxpAbbY2BWO6C/Zr
	mH58FcOZdh/UjbvAdI7xDyQd9Sof3D7TNoaXH68VelMK3Der4LuJ/epJFxZSkZ+n0SrgtyPvm1E
	WTRlEJAt8huc1NKtCp2epHs0DrcOJECP5lJBYK84h4oMIMz9lPCCh1CBDsZkZYn61+gLrMYHY/S
	YZlEvthGfLgyM3eL59DMmln19Sjy8OUHOOZ+vwbrluuQ+JpeRGxckyj7AEmJQMKiGT8RJmEYDLj
	w6S+BNkzVF3sw5q7Z9jMex50ljCjyGjS3aW2q92jGG61nMCz/gmxJZdc2ek4PKKTtX4iMXm1uKC
	ZkFW9K0D1iCMwCyoTmlKUMiTF+K7DOLg35pP9
X-Received: by 2002:a17:90b:4a46:b0:3aa:f2c4:12e9 with SMTP id
 98e67ed59e1d1-3ae8953617fmr1788397a91.3.1793360860430; Fri, 30 Oct 2026
 04:47:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-10-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-10-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:47:29 +0000
X-Gm-Features: AclHuK94pfXkqJW650Ejw1KMr2XP085nv_elOXQBTTnf3Z6vJhDk_9RcSiJIx78
Message-ID: <CAPj87rMMHpeE3WnPQp-M8KvAH9yZjT7goWU8dGtw+ykzvY1TGQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] drm/rockchip: vop2: Switch to enum vop_csc_format
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
X-CRM114-CacheID: sfid-20261030_044741_868571_FAF0E42F 
X-CRM114-Status: GOOD (  10.68  )
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
> Improve code readability in vop2_setup_csc_mode() by using enum
> vop_csc_format for the csc_mode variable, as well as for the return type
> of the vop2_convert_csc_mode() helper, which already returns CSC_*
> enumerators.
>
> While at it, replace the nonsensical 'csc_mode = false' assignment in
> the no-conversion branch with the equivalent CSC_BT601L, which carries
> the same value (0) but is type-correct.

Reviewed-by: Daniel Stone <daniels@collabora.com>

