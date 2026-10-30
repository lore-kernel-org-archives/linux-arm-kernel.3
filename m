Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57670606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dtSKlog8;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=HZ5snsFi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=; b=dtSKlog8pAKsP2Dgf9JyDgzmId
	fp5SM3XWSeAKfLEKI61hnL1oYiT6QOiuR2jb3K5LFuQHQejD/F4uxnC71QfcQw4Qh8wEsf/kqtYSG
	vmKXM/O+BgRm9KlS9+XIAp2pa8Vr58O0GxBz9gTOdYE+laHxn/YLAPCLuL9SptDkxj9bHwU+Scl+G
	maPsCQJuq6DuasF2udRuVdOCfTFs/0XPdT58PBfk3pKy9pi+E6hKOndBVmnCs2JUmzJMBBljOiP/3
	TwgIVh9t/JOgi3NIySWllQeSUhK8+YEUkN6566yMO2z9iiwnmxnRNhUzZniUTmqxjqZZl5yNYdXTC
	WzzynYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlAD-0000000BbcR-0me5;
	Fri, 30 Oct 2026 11:52:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlA9-0000000Bbb9-3mN9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:52:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so358344a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793361168; cv=none;
        d=google.com; s=arc-20260327;
        b=kMW2/lZWaHTmVdrEpm8IOkCbGhxvjseNhpsmIYu5/j9wmknjcWxEdLIiAwMkOSqz8A
         87rb8GFjZphVA8Vc0gvmSel2GdbQJ/Rmo7U4nxrZZzAg2t1E3Rf19DiLNxIlW+f7Y5yV
         M4CnKQVypgWPWpMUjqxWpOlkpfu80R8lJwziRkr4/0/e+ANmlQ5WwhGT1dcUUdB1/7CY
         KxeNwDhkrnI5Dr+Y0/+99bFezRErcfzt+sh0gPWMpx3UbP9BR+rLLItM4MDjpMba9s99
         bGki+gerDyA6hNty2aO4vr/Tdpll2ycRa0XKTbDZ8CxS0Ri5cGL7QPi9QR1hL/pY4aoP
         JHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        fh=CgcBSDIwf+O+Pe+quDYjcDgThXgHO71dCRuv/ums7kQ=;
        b=qG2MX/j4ZL96W7PSO5LJrTtI8mp0Fb4jSo5sH+pma8oNMiZcT2nnYpLufIMPWOVmqB
         +k0SPSf/ml0MxGNVdIYVtzv7o4TK4Kci91KriLGqZk6vFnlZpcIAUGs8bDoEdqacKjzQ
         5oTh5eZoUCYKO9exMPZgm1PjLYlYodYNyF9+f4IzU+cdtH3mdcBL5S8zl2xAf1gIpNPf
         8KhCKr5R/Jqcj5u3ZYpIC4iCghnfzvrbo7BZkmZi02ZeblQ+1VAT39Mb7JbNzX8FZWm0
         P5cN4JT+A42wrXrThm3SWEmJvgF7Q68TOEtxRkrq+MAoqv9JikupT64mA1/X1WcE6PZI
         QPfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793361168; x=1793965968; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        b=HZ5snsFiHPa+EmBhti1qsfsYmqR3s4j+HNOGWCm+vhJa2KtAeeJDNWmDYmgiPiw6E5
         l4Dp6qiFK4I6maRp30GVcFDxDnBga7Gc1/eu6tPFjxuBYEPnQVfjmAqI3ij/4VTa2l+J
         MEeW3gVCDp3SoIwAcjZ9PftUtU/puGeuwmA728POzC52Gj5jHZe3vu3IlC+s/+fJfhGx
         pfGFk7HKYC+VVUm95x/0r7rYcKeNLMTYi1rRXSZDbNy2DTG7KdUFpvimJrhg4qRfMATm
         62ij7D0zCFRNRJeOpHGd+F9fhX2OnOPv1cspxgclL+/pzgKKTqa8efVcDYtkfImerr3W
         Iw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361168; x=1793965968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PX9RtW2X0oN+uy2podVJ42Ja19q2gn1FASRjTAuuRE=;
        b=xO7TWxh4P+Ot7CNBTOXus3/6szW8vDPWgioyufcz8sHWtdkNksXB70iGBBdHMyqtA9
         nmSGOv1Ipoi/pkqOFNBAan8jzayyagp+wMi45oj4+oU0RqdBqJMjXbdk/YP8gtq59+n9
         u2WNx/ywsv3oqwJG7WfaSGEbjezrTTWVrPgyWSG6t3r20Qq0hBReUA983BBL4lx+52I4
         y6WiegrcJPN9EQ2btSdVuldcPSqpuUhZ14I7giVg9v0tVdmidb0qe8wrbWslKVulxD1n
         Gb8kMoqFPB9Z/ufFx4dZ14IjeMaSNxvp1N+mb4nU+c37Erfz+TibmrGmzsZfWgOQeXxe
         2Hlw==
X-Forwarded-Encrypted: i=1; AKwUvByjRYFF+5w5VS71CY6NEz1/IRAr7s7pXo3wQjiSxwT8OBthil/qiajKhbNpj4BlNtmYumNwsekJgyoH2su+kIy8@lists.infradead.org
X-Gm-Message-State: AFq9FYLIYW5Kd3ekueWv/XVNCJ4zA00Y8ymQfASJwirrwdNXiiUVlGyl
	Iyaay6QC3E3l4UL597YhQmdo6brDKC1fXJchDavKSxIfvuiSkYAEJU0v1muYxww44PqmyVpkd3o
	ehAopbxTp28BHtCrTPZ4zajT4cKsQM+Y2BDRjchNK/A==
X-Gm-Gg: AYBFou0WY2cZySxsq3uH0K+nAE+Rvz22Dfn/S87xN5Ij8OANvCJ3OLGoUd9Sk++itsv
	ljH5ZnNXn+eV1+fuLShcDfrmKFicJN1UE01CKpyUt4+/k5d+uOskz086r7LnkElaYLHUeBlc1Rf
	2wILGBmcJTD1OpCQwPqNrp+eSt2dpZ5xWm9uBBWsmEuqFqdMgAvdjGmcre7j8tVi/Vk6CUt5aDk
	FAPPPFqwnIZ8vffycxEYmfBrT5WdEhIjhi3T6kJk8HM46N+c/CrAaDGMGLM3SfdZ1cpJPOMYZ8K
	5LGkk+fVuOmBi+dEWBmVYSoSZRy3+sKVWA0OLvX8egzJ1KrL6ilPmoEGY4pYAsSEa9+0ZZfW2pF
	fESLymjklEb1G4jskiP2UxuhmkHb85aXbDUrD
X-Received: by 2002:a17:90b:2f0f:b0:3a0:e568:ed63 with SMTP id
 98e67ed59e1d1-3ae896d7af2mr1070361a91.8.1793361168540; Fri, 30 Oct 2026
 04:52:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:52:35 +0000
X-Gm-Features: AclHuK-idMrAXuG27Lf8hdgtB5yVIMARZUjc-ne4rm8j_v5CZmkmZ5d54vPJbms
Message-ID: <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
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
X-CRM114-CacheID: sfid-20261030_045249_942200_CB92E7BC 
X-CRM114-Status: GOOD (  11.80  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 13 Oct 2026 at 23:52, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> @@ -229,7 +230,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
>         }
>
>         phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> -       phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
> +       /*
> +        * YUV422 always transmits two 12-bit components per clock cycle,
> +        * regardless of the color depth, which from a rate perspective is
> +        * equivalent to three 8-bit RGB components.  Force 8 bpc here to
> +        * keep the PHY PLL output aligned with the TMDS character rate.
> +        */
> +       phy_cfg.hdmi.bpc = (s->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
> +                               8 : conn_state->hdmi.output_bpc);

Same question as for the VOP2: why only special-case YUV422 when
YUV420 also needs special treatment? And presumably in a way which
can't just be mashed into bpc, because the maths doesn't work. So
would this be better off being handled as a separate output-mode
adjustment?

Cheers,
Daniel

