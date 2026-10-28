Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A938606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 16:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ABdSVYcp;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FHTuCfJj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=; b=ABdSVYcpeNvwWN
	I+jiBRgNr2lTegCrhagMeZcfV62TvagfleWlRfeadjFnZgNUS0xPZzWSUsQcWA51pSEM+5avylbc3
	tLAoCCEe0SWn8G/IkKhbXcE3mubvvlRA/8h7nRN0hiNIp8fkM+2umMUyIhL7TupNNF4OServ9eRM3
	rGNV7MNuwcN9mDmlljFrtPyya54netF+38behSE/Myl5Xj5uXQIK94MMNR36O0JBGcQ1+HV7IxMi5
	LKhzNNFCynuqx/fCaQqJJa2C5gzXwh+Fa1Bzim7iPEOqKex4s0oa0T4AK9M2javmy2y7hq0Sl/JaI
	fdF94euQk4JzbawEwSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6h7-00000007YqA-01l5;
	Wed, 28 Oct 2026 16:40:09 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6h4-00000007YnN-1AdP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 16:40:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3a75f960be3so11338271fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793205601; x=1793810401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
        b=FHTuCfJjsTDK69dsaJCAHOIITuqyNdCVNMlHA20NTjO+WNE0bSAnZ7/zIIKf2NaeSb
         thDucly6dK/8TUoy8L4Vcjdw+YK7Sl3siXQHGajE8QElllwIczjW7Su+sY3xLdeKy4W1
         f2PamN0PmxFdJCbnl3o3Q5OdsSqT6IAudy6ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205601; x=1793810401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aqqOJYr4Hmv6RgN8CmHQlYy+DEU2NSLFnHtd0L0hA4=;
        b=tSGxM0H+9Hz1bwv88br9Zp7Uj/C0rgZ2DMfcPs1VvZmQ4dRf6SWnDf3girD0zRMqFo
         W9Gq4kFmh6XyqG5VYGWdant3rnyBinzpeubk++UJ07keK3qxiO+GF8VmcJ+uxcLz9xYn
         sM02ge962EIMijGIwAb9Vhnxn9hYy+aVSH1Cf135tA/YnOC1wk+Yl70xFO1HOzeUUhWc
         b5addE2UzRSc3ErccHEwG+Nx6JX69Iu2G6nAir6xNjLbQqMoAZ/qAZFr9U4FZnv0Fh/Z
         fHTiT669XYnbMjco3bk69CAgIHTCha3KL9HHSvGWnV1a3pJe8IwhkOOM4IsWCCXI3Ufa
         4rAQ==
X-Forwarded-Encrypted: i=1; AKwUvByzUhcl3WUkLlvLrunsmZy1ZopZL87N2zfIlwHwZXEmygSyBt/LbyC7w1Wq9YuNWfRwmFA8O6w+V/zBoFQsqqRn@lists.infradead.org
X-Gm-Message-State: AFq9FYL+HqBmWJvEVepLplmG09TeamvUkm+exHTlPJ/Zp9MiIo9+ErDP
	cgV5BqPi5l86Vr3YcaVGZrH/fAV/7eOZ7TzODyvfQV2GAxjhx9HcgHLGijmbHCETLhKkGGIRvhH
	sWcHNF7Hp
X-Gm-Gg: AYBFou3XXr6IdljInS3jW34t+H0Q1BGEX0CDLwQcVImHiKVeNeYZqCAOszZoK3tpVY+
	ypOicrdDf+HxMpNkj89Is2rOa1zxpFh4fB2392wVWOf8MXWveQP13KOjTqwowxn8cGEOAmxOWx6
	Y8sWJ+SAYKpk+ZUcU6Yzp29LVAnV5YfeOlFgEY/F9Csi6r9w51WxeN5gDuLuT1tUl92lzVGPPlD
	iBRD2ImbKuwhm3FeGvSeSZCYqGzcyssA/bhjZrWnvRynWoGNH7o59Uwc7mRN3qdiYQbwebyjCc9
	AFxgt1f6zUhQB++CdIUzLGbgt7j2ocakOaqlvKSyIbpU8jq2udvXg8v8V0y0klKsLBS6FV4S63Z
	5GEDLf7kOSjG/pNVUVRXkDhKw5xLM+9Z+dOc+/nVS1eG6Bjdar0aP4o3T9YLWeyveniIyMizvx3
	1sb8c0jCxCTzV1TSjbntAQMz9w+uD+g7VNdNcsMgBowWv9OoRqhvRnYYnfOxp4qfjG65P1dZPfJ
	ydzbYD93oaLrcdN9f5jJwUOty262WP153N4gUclJ8zhuEyhpFh08pcU4BiuJ4eqn52aTwJpX4UX
	hxUl0Ti5A9I3sawX5ps4NAMYfZEPmJW/IVxjGMTN6MOFG2J1eDQdqpdI0EJzSAT6lbZmVaTaC+L
	xBV1ImK6F4bwYcg==
X-Received: by 2002:a2e:a9a8:0:b0:3ab:690f:82ab with SMTP id 38308e7fff4ca-3ac9cfd33bfmr6758781fa.28.1793205600459;
        Wed, 28 Oct 2026 09:40:00 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709de214sm31225651fa.21.2026.10.28.09.40.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:40:00 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso975203e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 09:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5zN0nb2Fj7oBIa/z/5P/GfKxQ11P4z6E1FUqkvrQAePLpXoxIzXaCaMwwmfoKkffuwkyBN7CiyAjNUuu3546U@lists.infradead.org
X-Received: by 2002:a5d:5f07:0:b0:48b:9d2:1a6a with SMTP id
 ffacd0b85a97d-48e5d45a3c2mr6625980f8f.1.1793205267445; Wed, 28 Oct 2026
 09:34:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-drm-misc-next-manta-auxbus-v1-0-3a45c3cf531d@a-marquet.fr>
 <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
In-Reply-To: <20261027-drm-misc-next-manta-auxbus-v1-3-3a45c3cf531d@a-marquet.fr>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 09:34:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
X-Gm-Features: AclHuK_LwyJo9CN0zxlkO30oKOFraZ6PCLD3VchvtC_WbqyDogSG-WeDzg__Frs
Message-ID: <CAD=FV=XmfYM8diBOh3UidN7xEuB3n+n9oAm_zhopfFLERC2QpQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel_edp: Add SEC LTL101DL02-002 panel
To: tb@a-marquet.fr
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Lukas Timmermann <linux@timmermann.space>, Henrik Grimler <henrik@grimler.se>, 
	Hendrik Noack <hendrik-noack@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_094006_382867_9FC7917F 
X-CRM114-Status: GOOD (  18.66  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, Oct 27, 2026 at 5:01=E2=80=AFAM Alexandre Marquet via B4 Relay
<devnull+tb.a-marquet.fr@kernel.org> wrote:
>
> From: Alexandre Marquet <tb@a-marquet.fr>
>
> Add an entry for the eDP SEC LTL101DL02-002 panel used in
> google-manta.
>
> Raw EDID dump:
>
> 00 ff ff ff ff ff ff 00 4c a3 0f 9c 00 00 00 00
> 05 0e 01 03 80 21 19 78 0a 87 fe 98 57 51 8c 27
> 21 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 69 00 a0 a0 40 2e 60 30 20
> 36 00 1e d6 10 00 00 19 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e
>
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

nit: subject doesn't quite fit the pattern of recent commits (_ vs -).


> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 94bc54c3833a..c92985363093 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -2198,6 +2198,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, =
"134WT1"),
>         EDP_PANEL_ENTRY('L', 'G', 'D', 0x07fe, &delay_200_500_e200_d200, =
"LP116WHA-SPB1"),
>
> +       EDP_PANEL_ENTRY('S', 'E', 'C', 0x9c0f, &delay_200_500_e50, "LTL10=
1DL02-002"),
> +

It would also be good to note in the commit message where you got the
timings from. Datasheet? Downstream code? Guessing?

I had my AI agent take a look for itself. It found evidence suggesting
the enable delay should be 97ms, not 50ms. The other ones seem to be
OK.

-Doug

