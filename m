Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0505606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mNxQQFyp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z0yvMw1I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=; b=mNxQQFypjUDgbx7gxf3bnVS2/D
	8KmOEuX+k1iNAB08jr64T0YoALkI2V/P2xARDyukVEyqjyPVJ1i1ZhQqCYsqtnbJBx/7BTeZh//od
	RWqyJfOWMqUkHkw8B1WaWY6DGUmSuijgMEdlOWw4RQcQpk24+IqmyOjw6sUeCahrU34d2SNfOifNM
	UwEP8pid+bxKV5BhWKsg9kRB30nHPf1Sm+6ZFzxDkCKv4+SXnfzYryWgskdJzox3xRVUoHpSGUob9
	NWpE72JatmfZaBrLayzNYTpcWQYvGTzZbOMfE70usK8EEY+Biw1q0RNYmO1bfayf5kIVt8h+uBcO6
	LyouBrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9An-00000009hKv-45mg;
	Tue, 20 Oct 2026 12:42:33 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ak-00000009hJ7-2JVR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:42:32 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6dd4f3f696aso1894057eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 05:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500149; cv=none;
        d=google.com; s=arc-20260327;
        b=eRXDuKfldcImnX9c3QgYhf0FV5HGBcpTWWpDzQUE+nK4mNncKhVidE9TkQgIAh4Zjw
         cbBBxDOKE8SwLLGJXoIYiLBZLKOePiHfjlZp08vPPaivXJrS3mKhrm/u5f8XRDKDmAyl
         xbV4BAuJIncpKP/5loJrygimCcY+7DtXQi9IGMgqWmjQ+wfF6S29v3gHKf60ZfFU010a
         l+ubkslLNLyZ3Wwn5FOPQQIOJDi0zrkE06CGRYCFXWk17ZNFI0BiWhucr2DKqiR/3iwm
         U0XOPzWJ9oqezC6Ahpl6hwWnfjr/xHymR9XLqtXYNCuIGNviOQ6OT2t4eN3Xswa0G4Ge
         IkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=;
        fh=SGWb5pdwPlqV5I8f+ConJ4siQQnK8486/pDlxSCNhio=;
        b=DJPmULagfyoG3PiKjBPZaS5YqGNc9yEuJvBr7iAcxv1ABdUQUFyFwl/TgNobRQh3r1
         G5Bm/4h8MRQjN6fsPcQ2hbtf/qwsAbdCEZndHhYbg4gxuYQ6pPeefwbmNZpr87BJDOfg
         1ordwnTtQuP4qKJcHyZF4JwAYFjcnAlnuOYjSKuOs1bFwTGsjXXJ6jG0vFiXNekCF7Dl
         tEvqaT4UCtpr5sA/TKS+dfhJVmDJcnXo/LI5tgRwSCtivhudGNMo6nvEaBLEk7Zp9MDm
         nGmxyjOXRAAVj3qYhJn5kQskPJGtQkjQFNsG2sphng1fBIgS8Azkhp0pM8kRv+5wSbTl
         4jfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500149; x=1793104949; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=;
        b=Z0yvMw1It8kL63+w47kF84ZirYmxOdGlUwQSSNjyOTVXarVUGawmqWm7uAmCH2UC3R
         RAKDtBD7g59RzO9Z/tZ+QWFQVJMR6SbirlxtH5OgeFVVQn4b5a4ZEyXbc92tDD48rRpv
         7iI1oaRVitOiQLGrccmmxyP1EgCUILeaYWMnOMvk/QdjkTuIWodsm4WKBmbjX721xk6o
         WxgWoyJ1jkrnXr+PG3dkGm5hlxPME54qieU/npq3qedwzNSCUiJbXjuqJps3p0MDoorh
         I/146mRh7Hvsu5NeNM1hu9cW02NoLqoctJBDmPMrW6Oi35yIuA7gfDQncSVI4HeKUq+d
         5k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500149; x=1793104949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=;
        b=TLLuV8OwUlz7TGrkcXNWVZU8jT7UfVqsRcuDd+zuzUJsBVbt74wTDbMCZiomrHQcrZ
         +jTyiCob4DqKsMN5pwYK1FDYH1iAIn695pQQxbvejhz8tCMh0c9GyIVapR2lOpj3QkN2
         GS20Vtu5sK8sPuuhjoiZOx1ATDBjPEuV7s3nLqO9VFCvrl9hOWWrZW5fxJZEvU/udl5a
         dy21OXJKWLeHe8Fl3zgluVZf5iam3/Mk7cze5QdNybTKVyuTMxpt3ShHXfNHdWiXDj9x
         +c48SrJE4qCa4yz4jbAvzd5vrz68pfyvbdd4MyZ+PSiyvbWhNYlXfM9iMi3H9B7wdMgr
         XDKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPMZA2TQV8mG1AnE76AfSr0OQUx7Pvx9aWtoGFHR6HQeJzB+uYYfdMLSJp9kpnemAv3HcpeGS1N92MOZoqc0DZ@lists.infradead.org
X-Gm-Message-State: AFq9FYL/CC/3fJPrlp/v1r45gYDDS8DSY1N+W8NedXb0vYyuysCsuHzE
	1NmdznFvmH7XcpGyirR3jelCjLy8nGYia0AaQjF/wnDry5onI9kmcWf8NUSsmQ2ZVaH+bIerFzp
	HPpj6fX2/L68oSjeHA9Pu/LJMMaoq6B8=
X-Gm-Gg: AYBFou2UcE8UUT9enrGSWwGtXHxO5P+0szZsAY/dzrAL9/TVFVpl2FdgeHgbMk86FVm
	AutKVGtgTMU+0tUWcSOlAEGMb1vh8VopId9TX4hVdO/gg8PhmubpLFmS9CAfEO91rndwx2zoWqZ
	SCngIMXJLWouyNjVuiz0QhmvMjhRzJl6ZEsN3HHx0jWzhIU3c61oe74QBo+4qTDnz20w7sY5KGm
	g21TinTh6FSXnsGDOvBcvJ6TTB+ldq4qZJKHoDituoXK361Jq7FRPbiOCafiXPkXCGnrBPi3gfY
	dmy06X4yeuNIu1FGW9QPV+3ueNKwHBdE9C8cpLpXpxbU377O8TyEfhhWWUjNg7ylxQ==
X-Received: by 2002:a05:6808:4f62:b0:4f4:b5ba:a236 with SMTP id
 5614622812f47-53ccaf299bdmr10702127b6e.10.1792500149414; Tue, 20 Oct 2026
 05:42:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-wedfix-v5-5-8b02e78fd34f@gmail.com> <179249104567.3135.3150268582386164073@kernel.org>
In-Reply-To: <179249104567.3135.3150268582386164073@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 20:42:18 +0800
X-Gm-Features: AclHuK9W4Es3s2qEoBcM8btZ9Y3bS_NG69-SBXVVPIf84hDXQvp4ykMnqjjWBv0
Message-ID: <CAHGaMk9LPyH-kCGLxP0q8s4-_Soed_NBqLVtdvUB7KOB1xJikw@mail.gmail.com>
Subject: Re: [PATCH net v5 5/5] net: ethernet: mtk_wed: bail out when failed
 to set up rings in wed_start
To: netdev-bot+sashiko@kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_054230_613108_5B53212B 
X-CRM114-Status: GOOD (  49.73  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 6:10=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 (1) =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new bail-outs in mtk_wed_start()
>   (drivers/net/ethernet/mediatek/mtk_wed.c) log a dev_err() and return,=
=E2=80=A6
> - [Medium] net: ethernet: mtk_wed: memory leak on ring setup error paths
> - [Low] The commit fixes error handling for two calls in mtk_wed_start()
>   but has no Fixes: tag.
>
> Pre-existing issues:
> - [Critical] This problem wasn't introduced by this patch, but it is a
>   double free in the same reset -> start lifecycle.
>
> --
>
> net: ethernet: mtk_wed: bail out when failed to set up rings in wed_start
>
> This commit checks the return values of mtk_wed_wdma_rx_ring_setup() and
> mtk_wed_wdma_tx_ring_setup() in mtk_wed_start(). When either one fails, i=
t
> prints an error and returns early.
>
> Link: https://lore.kernel.org/all/179000700034.2160803.105942816913840150=
89@kernel.org/
>
> > Add error message and return when fail to set up tx/rx wdma rings.
> >
> > This is suggested by Sashiko.
>
> [Severity: Low]
> Should this patch have a Fixes: tag?
>
> The previous patch in this series, "net: ethernet: mtk_wed: setup
> WDMA_RING_TX(0) for non-DBDC MT7986", added the
> mtk_wed_wdma_tx_ring_setup(dev, 0, ...) call checked here, and that patch
> carries Fixes: 4c5de09eb0d0. Without a tag on this patch, a stable
> backport of the earlier one could land without its error check.
>
> The unchecked mtk_wed_wdma_rx_ring_setup() call comes from commit
> 23dca7a90017 ("net: ethernet: mtk_wed: add reset to tx_ring_setup
> callback").
>
> Every other patch in this series has a Fixes: tag. The line "This is
> suggested by Sashiko." is free text and does not say which bug is being
> fixed.
>
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index 3a7c2bb33691f..86845893ae20f 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -2353,14 +2353,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 i=
rq_mask)
> >
> >       for (i =3D 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
> >               if (!dev->rx_wdma[i].desc)
> > -                     mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> > +                     if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)=
) {
> > +                             dev_err(dev->hw->dev, "wdma rx ring %d se=
tup failed\n", i);
> > +                             return;
> > +                     }
>
> [Severity: Medium]
> Does the caller ever find out that start failed here? The same question
> applies to the tx_wdma[0] return below.
>
> mtk_wed_start() is static void and is installed as the .start op. In
> include/linux/soc/mediatek/mtk_wed.h the op is declared as:
>
>         void (*start)(struct mtk_wed_device *dev, u32 irq_mask);
>
> The early return therefore skips mtk_wed_hw_init(),
> mtk_wed_configure_irq(), mtk_wed_set_ext_int(), the v1 PCIe mirror map
> write, mtk_wed_rro_cfg(), mtk_wed_amsdu_init(), mtk_wed_dma_enable() and
> dev->running =3D true, and nothing is reported back.
>
> mtk_wed_device_active() only checks the ops pointer:
>
> #define mtk_wed_device_active(_dev) !!(_dev)->ops
>
> so mt76 still treats WED as active. mt7915_dma_start() has already put
> WFDMA into WED mode and written MT_INT_WED_MASK_CSR before it gets here:
>
>                 mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);
>         }
>
>         irq_mask =3D reset ? MT_INT_MCU_CMD : irq_mask;
>
>         mt7915_irq_enable(dev, irq_mask);
>
> It then returns 0, even though it returns int and could pass an error up.
> mt7996_dma_start() does the same after writing MT_INT_MASK_CSR.
>
> On WED v3 with hw_rro, mt76 later calls mtk_wed_start_hw_rro(). That
> function has no init or running check. It writes MTK_WED_WPDMA_INT_MASK
> and MTK_WED_INT_MASK and sets MTK_WED_RRO_MSDU_PG_DRV_EN. Because of the
> early return, mtk_wed_hw_init() never programmed MTK_WED_RX_BM_BASE or
> MTK_WED_RRO_PG_BM_BASE.
>
> Can this leave a half-initialized WED that the wlan driver keeps using as
> if it had started, with only the dev_err() to show anything went wrong?
>
> Would it be better to have ->start return an int, so that mtk_wed_start()
> and the mt76 callers can propagate the error and unwind?

I will let the maintainer decide what to do there.

Best regards,
Zhi-Jun

>
> >
> >       /*
> >        * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] durin=
g setup
> >        * but tx_wdma[0] is also needed for WED to function.
> >        */
> >       if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> > -             mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE=
, !!dev->tx_wdma[0].desc);
> > +             if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_=
SIZE, !!dev->tx_wdma[0].desc)) {
> > +                     dev_err(dev->hw->dev, "wdma tx ring 0 setup faile=
d\n");
> > +                     return;
> > +             }
>
> [Severity: Medium]
> This is outside the lines changed here. It is the same ring setup
> error handling this patch is tightening, though, so it seems worth
> raising.
>
> In mtk_wed_rx_ring_setup(), mtk_wed_ring_alloc() first allocates the
> descriptor memory for dev->rx_ring[idx]. If the following
> mtk_wed_wdma_tx_ring_setup() call fails, the function returns -ENOMEM
> without setting MTK_WED_RING_CONFIGURED on that ring.
>
> mtk_wed_tx_ring_setup() has the same shape. dev->tx_ring[idx] is
> allocated, and a failure from mtk_wed_wdma_rx_ring_setup() returns
> without setting the flag.
>
> The teardown helpers only free rings that have
> MTK_WED_RING_CONFIGURED set. In both cases the coherent DMA buffer
> for the wlan-facing ring is therefore never released by
> mtk_wed_free_tx_rings() or mtk_wed_free_rx_rings(). If setup is
> later retried with reset =3D=3D false, mtk_wed_ring_alloc() overwrites
> ring->desc and the old buffer is lost for good.
>
> mtk_wed_free_rx_rings() also looks like it tests the wrong array. It
> frees dev->rx_ring[i] based on dev->tx_ring[i].flags. Whether an rx
> ring is freed or skipped then depends on the tx ring with the same
> index, not on the rx ring itself. That makes the rx side leak more
> easily still.
>
> Should the error paths in mtk_wed_rx_ring_setup() and
> mtk_wed_tx_ring_setup() free the ring they just allocated? Or should
> the free helpers key off ring->desc instead of the flag? And should
> the check in mtk_wed_free_rx_rings() test dev->rx_ring[i].flags?
>
> [ ... ]
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but it sits in the same reset
> and start lifecycle. mtk_wed_rx_reset() does:
>
>         mtk_wed_free_rx_buffer(dev);
>         mtk_wed_hwrro_free_buffer(dev);
>
> When dev->rx_buf_ring.desc is non-NULL, mtk_wed_free_rx_buffer() already
> ends with its own call:
>
>         dev->wlan.release_rx_buf(dev);
>         dma_free_coherent(dev->hw->dev, dev->rx_buf_ring.size * sizeof(*d=
esc),
>                           desc, dev->rx_buf_ring.desc_phys);
>
>         mtk_wed_hwrro_free_buffer(dev);
>
> mtk_wed_hwrro_free_buffer() frees everything but never clears
> dev->hw_rro.pages or dev->hw_rro.desc:
>
>         dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
>                           desc, dev->hw_rro.desc_phys);
>
> free_pagelist:
>         kfree(page_list);
>
> Does the second call in mtk_wed_rx_reset() then read page_list[] from
> freed memory? It would also __free_page() the hw_rro pages,
> dma_free_coherent() hw_rro.desc and kfree() the page list a second time.
>
> This looks reachable on every SER/DMA reset on WED v3 with wlan.hw_rro
> set, which mt7996 does for the primary WED:
>
> mt7996_dma_reset()
>   mtk_wed_device_dma_reset()
>     mtk_wed_reset_dma()
>       mtk_wed_rx_reset()
>         mtk_wed_free_rx_buffer()
>           mtk_wed_hwrro_free_buffer()
>         mtk_wed_hwrro_free_buffer()
>
> There is a second, separate issue: mtk_wed_free_rx_buffer() leaves
> dev->rx_buf_ring.desc pointing at freed memory. Suppose the next
> mtk_wed_start()->mtk_wed_rx_buffer_alloc() fails at dma_alloc_coherent()
> before that pointer is reassigned. Could a later
> __mtk_wed_detach()->mtk_wed_free_rx_rings()->mtk_wed_free_rx_buffer() the=
n
> free it again?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com

