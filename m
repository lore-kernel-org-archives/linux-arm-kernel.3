Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26974606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zYw24Pes;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Zf38XACO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=; b=zYw24PesvYmljtM2XPpwvJ3R2p
	Rd2Jcgu4dblLGOEMJ3eA162KACFQzcypPjXIgnEw/nNtqcrp0wASc7hCfcvxCHQBcmBjbeQEtyPQc
	eDHmAUhX0w4LnYTWL3CKfhQkzxk+0LlWcYSE7bdGD7zL5YQ6K1q93Liojl9IlgaqKqlB+B2HHRFeN
	RVNsKvX712VBdb7Oxa17HBh5ilbnkX52Ix/4LNmfUrHIWZ2shv43ELFzeOuM0Gr2BBrVC2mhezoVt
	uY9tAyplZ5xq8yA0Ce2DKmzh9rIT4INbIZIajNT3yfxXerl6yD/HR6Nkz1GSDh+kkvNj70CWNeYmr
	1CB6mrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl04-0000000BZsg-08s4;
	Fri, 30 Oct 2026 11:42:24 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl01-0000000BZr3-0abp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:42:22 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so373071a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 04:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360540; cv=none;
        d=google.com; s=arc-20260327;
        b=FvVmK6qIK/HlX9nfey7fWvdYCoKIoFM4Ihk8u2duiQDpzy/oCMHoReCtZTaLF3budj
         7+MwjrtmgVLTSfFR1CZih8mPnJ8NMNdq/BJ9q6hpl4hCA602hed0BZvyGrPoW3ASga41
         a9RlRIvBArGMJ0sBUgRBKfGlMa+K1Wzb2yo5rCLyAGr1c2gUoyg+2V1rBnGoIGtiGgTo
         dXbbe6UTJ2bW4V9MJw1KIjjaiYngz1+z8RF63JxqoOFMTDDkU00jSmfVKy91hGbKFfAC
         iOuwKdjAS+g9OI+oLMZfAA7lnO/CGmdnyvfN1OYi+SRTiO0+pokIVyeQ/0GaEUpD1iuP
         3ZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        fh=LBXNeimYSuF+C6IQ9kXLwQZG1Wm3I+n2CMFJpVx20A4=;
        b=dGkCMhdz44lO7PptQABsiHQMkJY/ZScu1i7dnVm0xhhc/Dl1llK7zDEplBq8NugZO/
         cMjk8V4VDWHlOx+u20nGPKsGAARt+hndm/rh8jlkChpRf900niBDwMsF5/jsAIHAmoQE
         1BEAxebgpd8KwghmWKewknXBAI71dc3uWpz5fJXSG1W5KnOvkCI2R41KJblpcC5Gl69C
         8ne0UuJSgGwug7OnRWPisuDunyIjzu42JUx95+PniF0axWrRY21m6OqTnuc/AebabwLg
         pcho0ose21tlOh8d73Wu0C9o9vA5mJxQG+kvnHkCbNE2Kj1jOtEHf2KAQcfNl02rww2/
         7HoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360540; x=1793965340; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        b=Zf38XACOrafcLaixdmiZszKAXJbYvNxg6Z6N+GTQSw1Gc2yuj8rhylPcYgdH4Tkwt/
         va2nyO2cnkPDIfyyQETA3trijCHw+ZCmwVFtK/aEH1AAlFPYAVbniMo6VFbUN1BU1GvM
         UUEokSB6kSJzG3gMK9QW5seLOrRzsc9/3tJBWJc+2lxXPnul2NfOuZWRULzsYQkTrocq
         7gO/B2KrvS+Lch1+BrW5cd0w/fbuB1fUIppAtxlq1ZDG2SyYP6JVZbie2kGkIVKcMcLO
         sVcFP6bNJxaUPV7XvPPTmOEuyv3GoOmwjHfCAxE+qiVknp1A1a9yAy/JK2TNCAXFkVqR
         NzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360540; x=1793965340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4lcETnvcA1FO4VShSmFGhX4tA8WQyd2jA8DOJ8G3k5s=;
        b=vWYlUJXuaxN4E1Op4JRuImufGfCVFaqjJp6i/wfQk3IC2b60QSPqTrmiN0+T1H0cNr
         ZlXFB6bPH/sKIg1blA1WhDpStq4dFOWBhZaGUomwviZWRYaCAl0RAeg6ndjw3fWeIuYD
         r+TpF7on8dwp3PkCOmVhysHgaak52s0JdStlfms5fCHAINKqb/bLS7s+r8jFdanwR2l+
         lc832Oa1kMCaxk7BUgDNE24552fVBx78DOjimK/LEfwdKEwEk/HoUMKYmiCfz/k+y+ci
         qQys37opS+V40QqExneKtQhsk7DxG/md2MLhrWFrWJMtKOrAMn5a5d12GFwM5j1joP8k
         v8mw==
X-Forwarded-Encrypted: i=1; AKwUvBym0CDsmKlSoi4qzYZDqvgTvq6lWty8HyExMKbczlhEfAEEz4Ecg3iV/Gz+goEEyc29MHlhLeFKRxMXbCc9JSRv@lists.infradead.org
X-Gm-Message-State: AFq9FYIwN/Y95LnanCC762FYU9A0MmZiBHb8XZd5AIpwb2skvd81vGmX
	6fPCT3okbtwC7FNwnPMky+0MyfeTwT5JeP2cZ3MPPfz6Y+Dy1RDphpTjSb25VZ+/iEy5z4+xopV
	Aiv5nSJx/dvjPmLKJaXAEn9fhOGfHIvrhmCmvTJJGBQ==
X-Gm-Gg: AYBFou2nDaILIPPTvGpzg3uHF1louVcPPtCZVK1Xgv7AoxVRlabV/AXszI8gUTQcuH5
	We/GTTH0P/5p/W1/E1dzrjmEPdlZXHX7m1Awidw/Pj/Bw03mu2ftcoiI8kbDiNqtWKYfd4AGT9D
	ovhDVpc4YIX2nmidOjTYr+yl7870tXum2F4mxclbEl+3KBHS5YuGWkQscNrA2+rFedTibhvR6HL
	9ZYB8744kuSu44ij4SlWhhbDnA4PAVKs7c4GRf2bO2SyHLyMgigaFwD/Hy7PHNEU5ZBlNgtH7V8
	LCNpBdpoVHhLnWgeouGH5I7XgFMS62pA7p2QD+yC/PJZqEE4mfC3gv3KQG0iqmti73u8TCk/ELe
	rcOPgJMKFgo+rXaSBGtOkVLwexaNle3eGpUrx
X-Received: by 2002:a17:90b:570c:b0:3ac:8897:7ba9 with SMTP id
 98e67ed59e1d1-3ae8985d52dmr1762888a91.56.1793360539713; Fri, 30 Oct 2026
 04:42:19 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:42:08 +0000
X-Gm-Features: AclHuK-tK26BAq3qSwy7dk58hnLMShmnME05ES1MHznr_rkGJBFi7nJKvVCEwy4
Message-ID: <CAPj87rPsh_cVQWtGEisDrXWiT+Zj6D6n5wXpmbuoFvMKtOi7TA@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] drm/rockchip: vop2: Avoid DCLK source switch for
 10-bit YUV422 output
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
X-CRM114-CacheID: sfid-20261030_044221_255110_59D6C021 
X-CRM114-Status: GOOD (  11.43  )
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

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>         if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
> -               unsigned int bpc = vcstate->output_bpc ?: 8;
> +               /*
> +                * YUV422 always transmits two 12-bit components per clock
> +                * cycle, regardless of the color depth, which from a rate
> +                * perspective is equivalent to three 8-bit RGB components.
> +                * Force 8 bpc here so the bandwidth check reflects the actual
> +                * TMDS rate and avoids an unnecessary DCLK source switch.
> +                */
> +               unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
> +                                       8 : (vcstate->output_bpc ?: 8);

The nested ternary is pretty violent; please write it out explicitly.
Either way, the equivalent clock adjustment for YUV420 is handled in
the setup_intf_mux() handler, so would it be better for YUV422 to also
live there, rather than mashed in with bpc here?

Cheers,
Daniel

