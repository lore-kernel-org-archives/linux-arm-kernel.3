Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B405606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LyziOE0J;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=B/C4vLK5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=; b=LyziOE0JYVPvbJKAtfo8JZFhpS
	YtQA5QIrH04z2Z5ASgfRQ46LxumtP5NhqDWTPxsyN21ahVHjBtk1UstECDgtgRNrrtnltWhFYxK7X
	A4OIVAZdHbM4EmGh6F7RmwcxCTkXmdIy6wd95RfI3XkNI2vBZH6+Xgn0O5xeylrbjzLVF1fIUlePL
	5+uq+C/3VxW4yOw06yEZtEq5kDhzES/FvAaW8E8WmH7/NjZlRe2FIW0aAWmwRR2kTJdWkq7Xv4YMj
	bS6BgpYNCeOtChSY997rwhKRTf30fJQ+79gWmTHPUT0Rcuixvkyh1FWG0RZOCuKHUdzA+hJUal58E
	71ncwYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyXc-00000009IAK-1Mx3;
	Thu, 05 Nov 2026 14:34:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyXZ-00000009I9W-0tpi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:34:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1326735a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889248; cv=none;
        d=google.com; s=arc-20260327;
        b=bL7IglF/51eVKjTA6Q9qEzDACcu/SYjvjpWq4jAcVdIQGM2aEsb55jft0awfJD0hbG
         NuZWXGjQ6SlCqZrsscOYYFNaSH40bY+zBHONCmg8igUyrRIfk/KHffTjd7N0FZgyCSfb
         cfksPWWArSUOCNEQ1kiiSDKpnblxZVUwuiugaMN9gLGYFUADnx+jHc4TF5X1SqNczTWV
         xymXcbKR3vKECfCW9TfyMrSoFG8vGbJt0iYV78lw1GY3mOV0bkrBHHukmrhepjvuj/rK
         Hvv1036W4dHk7LKRH5yzscQ4wMMvY9CKzumltvDc+cRjkGa1bfJQo3Ldt7jJkslXMC9b
         fbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        fh=D85jMbs6up5No3EC6QnCIyBFdKDDEzJuTYAPhjJMsG0=;
        b=XX4pY9RQ92W84JmPBEQYXNANkFsRocJLJ9tPxCVqNHicXdowPbHaowBewXeNTSKeAT
         qUueUo7D1YNAEXdvN1f36O5Mq7RYPxc1DA4do507FdfgcQC1yTiHobxwQi/Q3rNKM++X
         YQgRwJNITLPepBeRwSZn+TNT2aaV5OgdwZcWH8eZTNvA1gRlchHGuk2tQ6do3I1pojpG
         p8rzmRYt33+FkxYd8Npqz/g9pQ/7qUNhkeJYQ6JF99Ma0E1XxYRai0Y0iSy2cctxQUzU
         KZqlFmvPvSPYrXgwkkbBEH1uvovBxt+NVgXoabrLw/EvXo6W/QQLZEn0DfEws7WXS3oK
         97hA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793889248; x=1794494048; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        b=B/C4vLK57QGu2V2D4XS4A2SBh2Ir+07lKhYQRZGFnSK9EWSOz0IBCZtrPO8kTIOSWv
         1oOgTQ9V8oJJah5FS3SCBI8E5Ajf62XUt0343h5CBcC8rYd/xvAMqNpJnSxK5sqCXf28
         stUwrybFiEFDE+6ZqsuxMzUZYFQ2GpLudi8ttVBLrwbxXlX8ghl4arSxnyg4XGCMe7WD
         cXu5LTlpybSP7o0doFMApkK4oo6P1vs6dTuAB+r5xNxK2ozlGlJyYfAh5DHWlrEe+l99
         mVMnWjLeL9BCy+GLhlkBVt+ulD3AHpNaW/DhQArovXvAwwtn5UvO2ucF6K8X6Ptp3nzL
         6vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889248; x=1794494048;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jZ8AIzpmZVSpEwlYYo7Zj/7Q72rSuq9gl+sxktWfs8=;
        b=MwnAPEi103K3xcUn/x0R8yS1bnlWPnztq8JUL1ltyLRN4Oo/YEwQpEdwzsrR5UYL0F
         JlXtcezkp7uVlmjI6t0Vn3nbLpg3GFpX2no0tzXOXDdVrWUNjnt2o/YrpN6zvmajVwwQ
         +T1husPfF+HxwAT/HTyuCNrbu98eMtEtbfJR3eURbY96fW4015GOnyd4zy7PBT3ku/2u
         8OK241ZL9vq3yp0yBKN62xAAhfZsqkFbgqhUJuiAEOoXm3DQGJTsjaNMgBylYaYN3mf4
         3t7P6xR5i7K5mCRW86JxtJJbAF2cqZEx/GMlDu2QP8mTucISW/s3U/FBLPznBvP9GaiH
         NwfA==
X-Forwarded-Encrypted: i=1; AKwUvBztW3EEluIDESEgLEzyAd0n83LMA9+z+L+U7jtP8rxUxsxxqwCOXU9CAUeStjCKtwF5oOi5sr7wmrcVacCvHgl3@lists.infradead.org
X-Gm-Message-State: APuU4Z935l8QGruBvYVF6A/G6Y55CQVY0Ymg/tsoxrT6e16bXGyJFbi5
	boi29AZEvJHdQ3gJBVdtTzA5x9JzqiTZvLGINnG0uM8AJTleLCgqxaX6YymixfNpGaOdXMe0Gmb
	E/Hd4WQRhV4xNmBj9gN5JBJg0hxzfGAFbqEKJHtX7IA==
X-Gm-Gg: AYBFou1qSGuzFxUmTB6YmPHy8qsh0oUDsMOD7S8JA8QfHSzt/tz5La2RJqhECFLiSv/
	rRETNTwBAvlIfgkdZtoTBiTEyphAqgTzDbam8wsa2QbIUjGlubvocJ+O1s79jO3/Mho3Yh/ehV2
	swmVkYSz2gQy5OIuYtMeHkP/+SUPvKMosRA2d8d410IoSrUMJ7tuNI3nd4KA14UJF81OFEEFdcd
	wSBfVAAnjtHwGGiy8/tv7eiIJz3vQNTVIYzRQKLrgxk3CiY4eQY2j8WKOpbRdHsuiJ8IrhXU0wg
	WtgJM6gRnvMf7mXKyDBBBF1ji5pa20dxg9GduTbaKhnxe8UlJgGajhnZ5v7HAUfiBOX4+KwYosb
	zSoOtjjGUt0dFBcDko+AmTAeL4j/WBjUp5QQXyTZjrtaSk+Ac+KROjOL4Ag==
X-Received: by 2002:a17:90b:4cd2:b0:3a8:a1f6:3b32 with SMTP id
 98e67ed59e1d1-3ae89772b3dmr14182837a91.38.1793889248197; Thu, 05 Nov 2026
 06:34:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com> <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
 <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
In-Reply-To: <7b86ca7f-fe7f-492a-bf88-0ac7afee3963@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 14:33:54 +0000
X-Gm-Features: AclHuK_cuDuuWPdBNDPf4-o5prQpG_rTSQHgkH5hHnp_VrKYmgc4urnB9GsSVjA
Message-ID: <CAPj87rMWa0wyopX6D2dUSYLXUYS9wvzVUFeKUh8coTxtF+Jf6w@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
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
X-CRM114-CacheID: sfid-20261105_063409_253733_DE114E58 
X-CRM114-Status: GOOD (  13.21  )
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

Hi,

On Thu, 5 Nov 2026 at 12:56, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 11/5/26 2:18 PM, Daniel Stone wrote:
> > I'm confused ... if we have switched to the PHY for dclk, then a mode
> > switch wants us to come back to the CRU source, don't we need to
> > reparent to dclk_src?
>
> This is actually done in vop2_crtc_atomic_disable():
>
>     if (vp->dclk_src)
>         clk_set_parent(vp->dclk, vp->dclk_src);
>
> Mostly to ensure the PHY related resources are released when not in use, e.g.
> after unplugging the display.

Right you are, sorry I missed that one.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

