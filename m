Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C19606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gertp0lt;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=KgHXtfpZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=; b=Gertp0ltLsyKwcLzsCOHvMMRVv
	uB8JKBVUZnEXE92e+wAxWaVDho0YpFnALxqXMFQ0CRfp9DDcDJiwT2A9XjxjjqrbZ7t8klZuYbiWb
	NkK5thLXKJhJfr5wpVJAiiY+j0FtCUDjj9OJjJ5T6sctfkEYfkBh9du5l0otCpoNli/0tYI1rNpVP
	vr4Z/PyYSFkozYFRbZce7vcqrkJwJxy3dTJDvhIw9NKyMpZ3ebbvagwdpjZIN4HYQvU4pg8iljV1E
	8dLIOI2+FRrutYNFyYGxOeJq7SLAlE8I1VHw4iXREEEGqdi9WQW8Uy4AmiFNCOJrcEVPw5jgOSWMR
	oudqtkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyYw-00000009IVJ-0jL5;
	Thu, 05 Nov 2026 14:35:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyYp-00000009IRz-46Wv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:35:33 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-89ff475a152so875454b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889327; cv=none;
        d=google.com; s=arc-20260327;
        b=hNlO2h/fEQA8J0F3vK7HoTPDSLl5luROiryiTDGjvWePB1TeVSUtxwuhK/8zom3gy1
         paaAquB8ka8Z4W8K7YvnFABfkUjrXKbrnPNRHHHUF0PD3BkgU4LnuHOcmr14OIv1Od4d
         sL88cPpd+FZjPb6X7YLAt0ZIjDJc2A9Zt98FhK2iX5JFWI0w+gt3COKSCTgc3CZlLVPX
         j8V1D2UBr22C/MkfG4LKoK9GrTRJ6b9H7SMW1G2sPV77opnaEtD0IV9sOlOEkaeOeDvT
         +pqBGV6PyOUMD0CzQfDK5nlTyHgy+L51fflxplLCyj59d5bOJ0PDwB64zFNltM6jtAUg
         tang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        fh=2V1VCmnOmLVP+t/0EHYORWsMMbdOrGHsKKAFknXGTSw=;
        b=sKGLNdpmkvPuFg+nXefrXUqAOI+Vq3VwhloohL5ctseEB21ac/HU94VRani7pyGe9a
         pBwPyMyICFBHaAxhafx6gmq4EIThDtidEfMnleTUsKIHMv8hCDrr9OXrTGgsZk/vo8qY
         99UdIzfE9Miu6CN/qYL2A91dDqem2/ICgWpRoW+Xextyy6UFVA/TpbK7w94cK/jlGT+S
         UkRpNLlicnvc8Ff9xzCKSEe3ClPug19CnOYbMJvTXTtx1hFqT/jSUaAacy4unAYnKaOx
         dHi57+hh5aTVbmTmQogYD/u7tlcwt80AYC8T2d8AVZ0cqBz6FrombTwlDulrdgEyF34v
         9mGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889327; x=1794494127; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        b=KgHXtfpZXzLkfCgw9ZW34TmIWoP1VxMYdLgwvQ1PZcv3w8tHA/jNeoqoZ7VeprQTmW
         OcwB/HaAmv8/w1sFhPFIQa1cZaDeM0DtdrFErE1863RgOMuyx/b+n4dAuYK7LWgph6js
         I6H6KckBJraeaJOgr6DwalWyvSTwRClPm8qR/XX6rpd16KQy3LnL8RJwAPjSdccLaB0g
         /nyeNCbKsbqU21QfrediRu9HWvd06WktUPtvmQtX0K3pMT+8yFtIoocXfiT1eAv5JhqK
         Ss3+k8PnNP0hgds681BjRTFaw05/0zarEoKK70tMGEP51v0NYM48BDdZOaj6e7TXJiYX
         MULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889327; x=1794494127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CKNrOVtQ7Tx/zqpAFEoFPOOWJYG2yTScVv26B8q6G5c=;
        b=OkzXGlrsEWFaO5ZU8drNMoV0kzqLLXjQdG0QIt6nrz2jx5VgaNznfEDyEPU16y/zYa
         Nrbi8zIIRa4twOc60LWprZcQvffRUcVTTpP9D0j0DCan3Abl5EUWviDWrb7dORFZaeKU
         CLesFsskiFnXLFwIEpvev+bIJdqcgUk4oJ1FfYzRU97croWjXhaicNORVNF9U7DccgYX
         VtJ6HyDLI38PW2D30Mme1sb/jwQAuAxojqJlYsjUOXonIsBW2ZQLvXOE73yZK+B4784D
         fXYqSDJY8LwYPPREokn3U9n/liVbSexCsnx0w/YQe6Zbir/hg1LJsDkMIEWKPUrDhK56
         uJzQ==
X-Forwarded-Encrypted: i=1; AKwUvByJaGJ2scJGu0IWOJfhywYCW+d65TN4JT+XSzzcN9qtyrt17+PDRMCvGlvp4wUYZllVp/jSfN7krJxrrSF8C6pU@lists.infradead.org
X-Gm-Message-State: APuU4Z+i+Bu+Yhl3ZFQfZacsNbqIifO/0jkdVKT5aFBCMSc6TsWP56WI
	XEoX4aO4XEl3xExm4oRbUT96Xtz23dWGMJhRsWui2417YGTkhSs3PYkcmQQO4HsfZo/qsZkwizt
	o1NtGuEe1Pkjl5kD+/00mLJBd8mtyfmejHfH0KNnADw==
X-Gm-Gg: AYBFou3n0PmQJYJp/MWZlLvSKKcRlbNonZrC37AcixCoM4iEfFCXD8gbPa0OO7FCzTz
	XZkwPLk4/v7/AOCx/4mzv8SUQICQs2jDbEcgCBxsqhjc3vUE9n4YMGhmvlCn2p4KwWJOsSjGuPN
	7kR6A5shxAbCRDKEfmxt2jo/dayzp7y0bGZJSXZr9q6JprWOJ4J079FY9wzj6ZHdWuVh9MTV27u
	RwCPg8LAi35Z+cKsHYwU0w1+USgmt76jQTieSX2C1E9Prcx4/6nvSj6dbkdSuUG7Im07jvRI0+9
	brsAsSvZ6F66UwrcjmjVRcixzy/RhD/yzVL44swIeklousOzQXCCOLnVVjVg4Lcli3b5u/j3rpk
	rOgQTIRP/bWPBh5dvfHRftOmenaJ+4OJYXK+hTEtnvQX8drjWGMfUCSCO/Q==
X-Received: by 2002:a05:6a00:21cb:b0:8a0:6860:cb16 with SMTP id
 d2e1a72fcca58-8a9ba806f4bmr13913523b3a.8.1793889327094; Thu, 05 Nov 2026
 06:35:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-9-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-9-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:35:16 +0000
X-Gm-Features: AclHuK_n1-N1ApR-k6d2Ij0iknOGmj4ALZ4zRGpX5gsfuT0639_6holwqyNMTac
Message-ID: <CAPj87rOutcy5VhtmqYg=YD4OB6dbRzxyaf1rG2kcASp477X6og@mail.gmail.com>
Subject: Re: [PATCH v6 09/15] drm/rockchip: vop2: Use TMDS character rate to
 select DCLK source
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
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_063531_980922_B2A75B01 
X-CRM114-Status: GOOD (  20.28  )
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
> The HDMI PHY PLL can only be used as DCLK source while the HDMI link
> operates in TMDS mode, i.e. for TMDS character rates up to 600 MHz.
> Beyond that, HDMI 2.1 FRL is required, in which case the PLL would run
> at the link rate and VOP2 must keep using the system CRU.
>
> Currently, this is decided by reconstructing the TMDS character rate
> from the DCLK rate and the color depth, i.e. DCLK * bpc / 8, which does
> not hold for all possible output configurations:
>
> - YUV422 always transmits two 12-bit components per clock cycle,
>   regardless of the color depth, which from a clock-rate perspective is
>   equivalent to three 8-bit RGB components.  For example, 4K@60Hz 10-bit
>   YUV422 requires the same bandwidth as 4K@60Hz 8-bit RGB, typically 594
>   MHz.  However, VOP2 wrongly assumes it needs 742.5 MHz (594 * 10 / 8)
>   and ends up switching the DCLK source.  As a consequence, modes
>   requiring uncommon pixel clocks, such as those corresponding to
>   fractional refresh rates, will fail.  An example is 3840x2160@59.94Hz,
>   which would likely rely on a 593.407 MHz clock rate, unsupported by
>   the system CRU.
>
> - When VOP2 processes multiple pixels per clock cycle, DCLK is only a
>   fraction of the pixel clock, e.g. RK3576 halves it for pixel clocks
>   above 600 MHz.  Hence, an FRL mode such as 4K@120Hz 8-bit RGB, with a
>   pixel clock of 1188 MHz, ends up with a 594 MHz DCLK, which slips
>   under the limit and wrongly selects the HDMI PHY PLL as DCLK source.
>
> In preparation for supporting the use cases above, rework the DCLK
> source switch logic to check the TMDS character rate computed by the
> HDMI connector state helpers, which already accounts for the output
> color format and depth.  Keep using the system CRU when the rate is not
> available.
>
> While at it, drop the VOP2_MAX_DCLK_RATE define in favor of the generic
> HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ, since the 600 MHz limit applies to the
> TMDS character rate rather than to DCLK.

Reviewed-by: Daniel Stone <daniels@collabora.com>

