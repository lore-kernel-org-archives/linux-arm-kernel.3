Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD58606D804
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=btZhPVsv;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=TmlRDwjS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=; b=btZhPVsvDVerbLvJM7mtuw+DuT
	1fgO6qjtXVyG4pN8fHeJPX4eHWuiUuA+p2BiB6pP4udAqfUPOYz+kuPowksOcjQOR5AoI1SGH0Z68
	dqXnE+gn6xXJBFD1WUWTiWtpznzKhyvZKO5vL2SrqKCbM6IDGsn5v0MA/TvDWaSIkxs2jgw3B1Z/R
	8R1XBdF2F7+9va3PlOs49zmdoih+qarvAMAFdef3pEWXgmLIEhSwgThJiAoxYULb8eCEyVSruv/wb
	lxFz+ZAkto01H4eZygmSMFpQKVzPpl4n/sgisPa4aG0HVZPOnlSoSgKG4jYANHlilZ6De3KM0hI0H
	+xC/wxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwQz-00000008uJS-0eBd;
	Thu, 05 Nov 2026 12:19:13 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwQw-00000008uIN-0Yeu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:19:11 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdb681de50eso33002a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 04:19:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881149; cv=none;
        d=google.com; s=arc-20260327;
        b=jMYczd+vNXvB78AbNSUDRtUEC765FzQJ/QqxZZGGokn8DTsaWPQkiu6bGnFmsrGu2Q
         KSkeWaU9AvBv/1rpexLtJEuMcPqQb1aK8s5PSkaI/X61eWQr5T0Efb1qDKEHLcSnaI1d
         Lz3VLMjX/synf2qQzR+4Ol0coGkpxsEAiB2FEZCkzia2+Iu7wAamufe7lBICfWqUhqDa
         ymmvpqzitS5hxFCN1S14zocu+9Wbaj879ej5G+TmZzsXOhhfYLmRXM36TdbyTriYEbUr
         2jWOwduxjv9B3doeOiMRiVLIDHYdAfu86Xn3tJsq5jNFDI1MPM8a6Lq9+uwJZNij89oI
         iDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        fh=dbGnkYCPQXFS07G+/Pm5pd3tsi1SC2PfMXDfUaI8Pzw=;
        b=myvzkeOEjJ/AQSh+sH1ylwcJc6fcEM0Fw2VZ7v6Sx+6Zji947cJ77j+9TYeCuFv1OF
         X2HQdCZVoX1IUNwT6bgWiuDtOdl7BvBo+INjgjFCk6VN8aqSc1VSnP1wtFNUXo5czkvw
         zt+gUmVQlsE/2jPYZzylwTvOTUHPgvVuiKGy8iwvFsHErIO67feJw//J8omp7++rJCH5
         ngaRtP6Km9KHLvC2gR7TpJk1+wzc9UuqSRItr2xrqB8S4xgN+zO1440x/NgoLtc5JRWF
         k3dTw/Bca612wLhVTjbpB/hKrchlLwWBFZr2ICNKxiyA2VP8516dy/aJ/1PE2CBPvTgR
         B0eQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881149; x=1794485949; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        b=TmlRDwjSsHGp+1K55G9sIQJXF0/b6BImXkZ4mvhs7fLKBxz/dkIgjmrxbh/N6z2JxJ
         gUT5J0sIcGRKs86p0MSK6dE+eFHhmpFQOCz92DLgH8dlSqOK4nXjpXbHb3/PAiC47YWW
         BfEhJBUNJObXkhcJQoxuVrLf+di/iuq11+70EseqKwuJs5mfQtMAQmFRVG6xaDUQKFCu
         Zu8NY/vX7bK+wLgssr29CXW+8Lnw87ws0e06/aYGhv7ahNuOOEStv9yO3xvsiFNM1SC3
         9UoxTcg+E0FAnd3ZeLZOv/GzeoS48ThLGqCycXRq4/+TIL0y8fwot1LVrHD57UO/H9gE
         iFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881149; x=1794485949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        b=Ps0/0LxxcqESLoymuI46a+YEYs3HjU2JDO3D+o0Uv41YThinveYNZFeDT8HDyvkrDb
         SvvdHEF0CgtvpHHgZmOgx47FaJa1mQG/D9XsP2rPVakvh9CL4vc0ao+erYrI0dPh70Om
         59UlXwQvIqyCoeh+YOskJPKqWksN/iqe0/3egIr2EinMrfJFWpKK+4gqyqZaokDkDTCU
         wjElueU6E1/0kF3llKwBLsjZadP/VDOPx6eJhKYgpEx+xEloIKtxN84Mb9My8rc8yOIb
         xiG4ehnIV4sIs1S8OLat2dXRP/lBsoTfmVwsowj+7lGtNT8h/Uszsdw9dsyFVCqqQ0i8
         GUDQ==
X-Forwarded-Encrypted: i=1; AKwUvByUyEEfmOyChHSRt4DcLwI8qZKH3d0hzzHOpJnQJrJuEgolc4qEwswsZBXLwMEybSMXozDVZcayUya9i26sozQV@lists.infradead.org
X-Gm-Message-State: APuU4Z8/5WzFE/o3Hbt4lw1Yhy1rsarr8a9WYW9dVrBXaymFiPR2d9DE
	9tbTOnOiLHUopCY4CMgR0mcLbU53t4gY6uR6ZprV77Kjg277HAm3rThBqPhWm0fXLTE9LpR0s28
	P9xYtWEp/Iu+nVZzDFQgwc7hxNpivb0FVHgJHnK/kqg==
X-Gm-Gg: AYBFou12g6VRjxvlcstoYmgxmf4ymc5pcweT5EzD2NXolLGUy1KGgG1ebylyOw0Njz8
	xqLMbuJ5spMELt04Zl1tGe0GsqYSIhDPHzXZX8f6XS+ruYKM/iBYggVW7wTdoqzXSVoIgK4NaK5
	vLRirQ4XQETvFFfqEjV/OE/VDdXdra0QUexchZMo08IgeYzP6ri6zJ7jGIi8bW/t5R4vRjOGQ8q
	KUpYTP+KTyt53FwPYnM6WCLmSNxUjohqKMBmcqzVoiA1ChONbwGe4h5s4FpvKz2vnULmMOSaEuC
	3WO+E0CTH+HIiiihYrEqtsWQkAbvwUW851mCthWYNP615WrHl7uvdKDNgU2ti2YLIRXXm49EUiO
	nAZv62ajW+TUfUB+qY9ZivRcWuu0GEAWnI7Tb
X-Received: by 2002:a17:90b:2741:b0:3a0:e4ce:31fd with SMTP id
 98e67ed59e1d1-3ae896f8304mr16451431a91.10.1793881149147; Thu, 05 Nov 2026
 04:19:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:18:57 +0000
X-Gm-Features: AclHuK_2VZ_bwNEEFECKGIAUHsyDmb8_QQvXN9pJrwLdMDPCY5CttgkKVemI1Rw
Message-ID: <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261105_041910_174513_6604039E 
X-CRM114-Status: GOOD (  10.63  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> +               if (pll_hdmiphy) {
> +                       ret = clk_set_parent(vp->dclk, pll_hdmiphy);
> +                       if (ret < 0)
> +                               drm_warn(vop2->drm,
> +                                        "Failed to switch DCLK to HDMI PHY PLL: %d\n",
> +                                        ret);
> +               }

I'm confused ... if we have switched to the PHY for dclk, then a mode
switch wants us to come back to the CRU source, don't we need to
reparent to dclk_src?

Cheers,
Daniel

