Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6692CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Okm57YHWqP6DudQxxBoKKLC7I9Qfb5iqn9tysYDvME=; b=pny7irnLBcxbHmzeGW+d7Zf8jK
	rfcpVNzvcELTioxaZVSt+IpLsibgonRpjiDLaJ2rV/C2XVDOzjcpJwnMsiuSipN70bJhULSpnnekm
	r6nSBND4HFOBFSJLRfHZHqwHuYdRIwMIkTQ6fMwrZ9qNUq0zsWPycoD+kXtezllWR2IlaSc3UpdiJ
	WlrSRWNdOI9m8lHOpkkaRUupKsv43B62EyQHsFTBzcoq1//VnsU0NXOWapLH5kF/1GsIlHRgyRUj+
	+tzvcb1t7TQta/ejVdElc/5bHj0f/mFz9Z0qhWOmfSr1hr+iX8Vv9cj2HzjZOBc+jiSNhZHM9YjYE
	WVvPFmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSV8I-00000005G0L-0nn7;
	Thu, 28 May 2026 07:26:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSV8F-00000005Fzn-3564
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:26:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4905e190c71so48497365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 00:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1779953177; x=1780557977; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Okm57YHWqP6DudQxxBoKKLC7I9Qfb5iqn9tysYDvME=;
        b=UsV2xOzKZDjoTkUq5puYXVlrFR4ia016DWJlLhFezpV+Fm5efbbDCRxi6Qf0Mp9Kk+
         A9ancgCPtSakisgDHDoqrnTzoU3mtfpcnvDdj7NgPjjKJEecovcoum/MxeAi+5ocXFhC
         gXxi5SJPAccvFJoucALKttM4h2WXvoqR6yUVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779953177; x=1780557977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Okm57YHWqP6DudQxxBoKKLC7I9Qfb5iqn9tysYDvME=;
        b=cSLFPD4vUZbdvEHL+lwS3ZyhjDjq25qSF9w3PPPSqXONJOyAKpJXiVk4VrP4gtBr5I
         sFwv36x5GGEw8b7MfT6b5lWa0sOb2kLHvYOiwAXe17rPaLgpXiYt6Br/b2PsxYpfEyQ/
         jJtl+PPB6hfIJF4ulqUM45TERYH6NmN0e6NlQHN19V6zinOOgd8Nx6kmhiht0V2TgJAz
         Jn/b291u592uPyGqAmQ7lRTTdktYQyNFMAacIU6lH4ZefQZPFdbUts4Y5xq/LuyUosw7
         KFZVL1KVUSMRRR4KC2Ou0narXhCqI01sMTcvsoClWYD9DIJvcSKFQXACFe5hnrdgXgza
         cmHg==
X-Forwarded-Encrypted: i=1; AFNElJ+3BhOoAER4eipNWH1RT6Tus/8nuOD5NIPq8voAsSwP4QppPleaIk+7kurxqMCm9Ghuc8dl1oUj2dC4ce4fTRUz@lists.infradead.org
X-Gm-Message-State: AOJu0YxhyW6MOp/CrWprCGPozpxRBXgnTVyyDyREu+WtrT2knEMCLyol
	rzbNL8ACQp6jJGpmhrR61vwBWBW1Mu5eHIzeTATyNvWfySr4KKySP8eM9mojFwZghLk=
X-Gm-Gg: Acq92OF/oqnNNxn2IScKUoHcVDGIOfG3EPfB+mR13LYOAiCMLfMOU1C1KbaC3vuRF0E
	UbLzblDqoNneYAYW/Y/FRVoO7jOTSlxppXppRHRli3aKADbwHOzD3OyxkXzYXFlDVNgYJ7hkvdq
	/FHR5o5vkiM32w12ml5lbtoU7Eu05XYfSTdtVTVlwiQW4o8VS1uGtNOoazm0X5WDHwSd8a4ZFDE
	yo/0gA/OCGP0ZPSwhD/FFAfV/6SSkSXD+SP51Y9+TngAdXb+L2aC9d3HAvGanyVg4BVhNrMwwVc
	d8FaEH52Rx6A/EwEYdMLsCHVprJvD+IW5sd5d/wfFWKRmVfrtih11X4gbwTUBlMT360+xkx17Q+
	38NG9iQ+/fTy1maQBilmG81HhpnOqdSPCq9cBRpFBBXw7js/06xLm7vGskmi1T79LT0+jicg4vh
	vDhwdLRES/D51pJGvoDWZFlsHFLP4vp+p7gnbGGNwOIg9XbADlKDcGR8QC
X-Received: by 2002:a05:600c:4510:b0:48f:e230:72fc with SMTP id 5b1f17b1804b1-490428ee268mr403369655e9.33.1779953177104;
        Thu, 28 May 2026 00:26:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909235f98bsm30377995e9.1.2026.05.28.00.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:26:16 -0700 (PDT)
Date: Thu, 28 May 2026 09:26:14 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/exynos: fix size_t format string
Message-ID: <ahfuFv4_-bd47r4w@phenom.ffwll.local>
Mail-Followup-To: Chen-Yu Tsai <wenst@chromium.org>,
	Arnd Bergmann <arnd@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260527194525.45762-1-arnd@kernel.org>
 <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HvJiTkLJMZ13w0OHwgp+nPBftGAC-15nhJ3R=vOPWpUg@mail.gmail.com>
X-Operating-System: Linux phenom 6.19.10+deb14-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_002619_822822_92A57F1F 
X-CRM114-Status: GOOD (  29.06  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2026 at 11:03:03PM +0200, Chen-Yu Tsai wrote:
> On Wed, May 27, 2026 at 9:45 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The exynos_gem->base.size argument is a size_t rather than an
> > unsigned long, so adapt the printk() format string accordingly:
> >
> > In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
> > drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_buf':
> > drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
> >    69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
> >       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    70 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> >       |                                                              ~~~~~~~~~~~~~~~~~~~~~
> >       |                                                                              |
> >       |                                                                              size_t {aka unsigned int}
> >
> > The dma_addr in the same line is already printed using a cast
> > to unsigned long, so change that similarly to use the correct
> > %pad format.
> >
> > Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I posted the same patch [1] one and a half months ago when the culprit
> patch was queued up and I got a report about this from the bots.
> 
> Inki hasn't picked up my fix yet.
> 
> And it seems the exynos-drm-next stuff was only merged into drm-next
> yesterday, now causing the warnings to pop up all over.

Yeah that's some pretty bad fail for exynos and I guess also for Dave for
not compile-testing on 32bit before pushing drm-next out. I've noticed it
just this morning trying to do some stuff.

Picked up Arnd's patch as the first one that I've found (after I've typed
it myself already, but hey let's at least give some credit).

Cheers, Sima
> 
> ChenYu
> 
> [1] https://lore.kernel.org/all/20260408064936.1342321-1-wenst@chromium.org/
> 
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > index 297a93b087cd..8e357f2beb9e 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> > @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
> >         if (kvmap)
> >                 exynos_gem->kvaddr = exynos_gem->cookie;
> >
> > -       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> > +       DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size);
> >         return 0;
> >  }
> >
> > @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
> >                 return;
> >         }
> >
> > -       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> > -                       (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> > +       DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
> > +                         &exynos_gem->dma_addr, exynos_gem->base.size);
> >
> >         dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
> >                         (dma_addr_t)exynos_gem->dma_addr,
> > --
> > 2.39.5
> >

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

