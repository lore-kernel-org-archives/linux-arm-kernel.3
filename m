Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qz8znbLo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZQW3ald
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=; b=Qz8znbLoHk+NvV
	Pme7qmSD7MeGNnPSLAb3P7oy4IDGDAaZ7uQgCFw3ixNfRdoZns+JGUVgwkKDtxmrldB7NjirdOlsg
	Jwu+PIlKWGy1UNzTSVLfzNLuM95gFu/fQxui0k4XYbHP4kKhEYrSjO+C7LNc3AJzfj45gS4cthaFt
	BkO57JvdiZ2B9Obl34gK4gm+ufdHUR1KR+LiC5CurkhF1/b3hBQJG1MHqtZ1YVqaq1zX6cpnFMpmg
	SQi1O4baglKXYUZ1XI4ckNkbMbstNBTwSAElhNPHCc5hueP24uyJRIX/JTTCzLXxQzNwN5FXTil3s
	jZVHwfg37+x1g4rLTNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyEX-0000000EnZC-0QEU;
	Thu, 22 Oct 2026 19:13:49 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJyEQ-0000000EnY3-1T8Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 19:13:47 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7c19c6721a3so29603137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 12:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792696421; cv=none;
        d=google.com; s=arc-20260327;
        b=qrfIAUCD1NFaZ8J7zOYOEXCDc4zNvY8VBAAK8cVfsTz4Rh3pz+a3MwQNRtNNeY92Xv
         05x1UUrpGNr1KRcdNSU4B6HWxgLJpYmWGjrvPfLq1Y+BMV3YYc2jIswboYKeWXy557Og
         MCppjivCArK8Y2sVhyPYtODMafsShEYmq/dVR8Xwk6ob/wbGjAXF5AjP/tGJ6S1HNtiK
         Qc78I5uBsDyqCq+/7kXloMrptHkdl2eYfc0/TDi9UugCkPLwm9RyKolAsE932OGsuO4Z
         qIo32lJ7FZgNm+ul0DqdRYs/ka76JHFh+s7LOdLnLQ7E++8FBy10Gn3wun+RC/XKz9D9
         QRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        fh=mivPJTMfARzIgcYzheNJPh4B5zOw/gSLZWkjNo3Z9fY=;
        b=Dkj6TIyJs/oRZNsB74ThsihngmDnOkmnO3xwLGsOiaurvvyGg/U8fwLVKQsvcsOgj7
         pW6oNbkaB5xz5LsZQK5kjo2VZwzrlQGEpYOYtAEMZuanpfzhisjVCvSfSMoqk91RYj+D
         DkUn/KYyYcG3RTOcccr55iv02b1/zuN5qdGoTwqC8vRhGzhGov0zBxxF/Zi/DdFXkNv2
         muoU3a7hnoaaEsiB2/wOmRgRVmaxRv5LCp/BU1uyjbzo+acZD0SRUUYVIx4Uf1dG8GSe
         JxORHdJtrinlENqnOzY3px4A4CFHuMFrbZ/ZiG8tHzRp5aFWJnJNH3a/Ajs3J1yOAkZn
         VUVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696421; x=1793301221; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=VZQW3aldmxKcOeFw0f6aFExxT2O7kr+gU2ZulJchapX54NRKoDhK1FwR7gGzXgm2no
         t6qz5FJ4vHmTKWTjcXQR6nLgxRtT+dpypd7/GyovOM3Kgz+K/z2oEly3+YmxAuq+4wlw
         TP1wnEsGVG0Gee4nKZvOxLnOAW5SWp3+rqpo19Oq+r0dwzeNww883s46pLQNgU/vwAhV
         kgim/WpDMZx7FfJgGugFe3T8VPCnhS0lTPDZd7L408dFE0y2XNURtkB+jQ4s7zhesDW7
         ama7mMbUsU8khtqHB834UtbkZ1emXwzZxZrVGElyRvudNyh+Czu9TA6yZWreYTbUPQSQ
         Y6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696421; x=1793301221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=GL9+NJ7gDe6xFbBuU0wT1lkITrU1RypeRT71C5kSMOPkfKMlsZzMDHqczEI87nUQhQ
         DDvgN+ED+L1N8zA+PChuOcRWVmImFscwpPZoIZN4VALxRO/D//O4HF3p2VOyCaR0WHic
         N4SwzGo1/06ZlxgxOGTlFaS3Gb/FAFACQVbGWrhWlQ/a2VFq1GeqcfNLyFZ8h8F6AVj8
         4GT0PTUOiQ3GjqJsVJZuiY6mV3KKPa4TsB66rPuS4f18z15IBAE/sRCgMa8kpdwyQsU9
         Y8hyEQNF+AQ44jd4ZpNzNbo+3jc+2YSSE7aK970Y5E1zIgbM+YhwZay5JS/gwdSqFvCG
         gFng==
X-Forwarded-Encrypted: i=1; AKwUvBzDrqSpd23KliK/fjx66jVgdF5hytIJAx/PUFWBaFDoTfoYYxl76h3mCeXmBhks5YYvffcOB2Nxak08+K4LObhJ@lists.infradead.org
X-Gm-Message-State: AFq9FYLNPp8fTOZWFxEt0HBqqc1TqvZr49//GzZWxjRF/QjFeDMejFyw
	cKX+Snozrkk5rNTjI6PdPXcsDHCQYyGY6sC9YEOjCcIVaWNt5G+dwRBpY1texFInVSeaQGgmxFh
	ZIMu0lK4/H9HWsxoRUtZXj4218PY1sWE=
X-Gm-Gg: AYBFou0jpGFjrox7Na2IUcGPp+I9HciaVUmer1sUh9ZEcGDftsQFWhZV76nOJyASpKc
	bcfBTtQoddV7f8PQl8gKbSXG07gSqaBKSb6vMzxnOND7LoLdg+7xJznXf8uRdFMEdyc5CTIyZtI
	owXSoF39U/7GEATdC98GyeONHuvbHMAWL+89Bz6tnHhSaZt8yhIiqgA8K0BAOyhOfcQ0IiXOdrd
	EESDHZTDZEhS6KIbkI6vSGfTaK6f2uMPhvCKZlQ8HM40jdWnxhfITvciHos3pxT+RlZUX2bffgi
	D9zaRhbnqqi62WWKETUvQCKFWFHpQb17r3xVgWIG1KM7ttTX3vZvvLiHjeT+6nRMBeemhfQDKeI
	cOdapLsmk6bg4YkNYgFSxMnE5egtKHo4nY4/X0nH0HBdv93R16eOVlp7oyNBEvfGazhWQHRd34k
	mrddq612qgSk/RdVLfNql/DaDu+6zF5K00FB4O+zWi2RpZFYYIrcsQTiOC77O4D1qZxbFZ167Kb
	rvPG3g+izDllVuBpQjO+yP/d0vSNw==
X-Received: by 2002:a05:6102:4bc1:b0:7cc:1218:1d2a with SMTP id
 ada2fe7eead31-7ccc32eb44amr171247137.9.1792696420656; Thu, 22 Oct 2026
 12:13:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
 <ato1bMSJgTVZnOyd@SMW015318>
In-Reply-To: <ato1bMSJgTVZnOyd@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:13:29 -0600
X-Gm-Features: AclHuK8dUweaO7VirTuh-oMszxWLhvnB6Zh7PvCummnzZQmZVHWezvakVRYMIa4
Message-ID: <CADvTj4o+XjFjE4uhNSaaA78t0dqhXaOFkzux_CfWGyC1CCp6Yw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_121342_409615_96771550 
X-CRM114-Status: GOOD (  29.50  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:10=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 03:11:29PM -0600, James Hilliard wrote:
> > Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
> > chooses the memory zone from the device address mask, rather than accep=
ting
> > zone-selection flags from the driver. These flags can also reach the po=
ol
> > metadata allocation and trigger a slab allocator warning, as observed o=
n
> > H616 when preparing the first UART receive-DMA chain.
> >
> > Set a 32-bit coherent DMA mask before creating the descriptor pool and
> > remove GFP_DMA32 from its allocations. The driver does not encode the
> > extra descriptor-address bits supported by some variants, so descriptor
> > links must remain below 4 GiB. Keep the streaming mask unchanged for
> > variants with wider source and destination addresses.
>
> Spouse other dma address in src/dest in descriptor also limited to 32bit.

The src and dst fields contain the low 32 bits, but on variants with
has_high_addr, sun6i_dma_set_addr() stores address bits 33:32 in the
descriptor's para word: bits 17:16 for the source and bits 19:18 for the
destination. Those variants therefore support 34-bit payload addresses.
Variants without that capability retain 32-bit addressing.

> Do you means only descripor address have 32bit limiation, other have not
> such limiation?

For the current driver, yes: descriptor addresses must remain below
4 GiB, while payload addresses can use the wider range on supported
variants.

The descriptor restriction is not necessarily a hardware limitation.
Some variants also support extended descriptor addresses, but require
encoding their high bits into the otherwise-unused low address bits.
The driver does not implement that encoding: it writes the descriptor
address directly to DMA_CHAN_LLI_ADDR and stores the next descriptor
address directly in p_lli_next.

The patch preserves that existing restriction by setting the coherent
DMA mask used by dma_pool_alloc(), instead of passing GFP_DMA32.
The streaming mask and existing payload-address encoding remain
unchanged.

> Frank
> >
> > Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical=
 addresses")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 7704b016aed8..0ef6ed1f936e 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_memcpy(
> >       if (!txd)
> >               return NULL;
> >
> > -     v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_l=
li);
> > +     v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >       if (!v_lli) {
> >               dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
> >               goto err_txd_free;
> > @@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_slave_sg(
> >               return NULL;
> >
> >       for_each_sg(sgl, sg, sg_len, i) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli)
> >                       goto err_lli_free;
> >
> > @@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_cyclic(
> >               return NULL;
> >
> >       for (i =3D 0; i < periods; i++) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli) {
> >                       dev_err(sdev->slave.dev, "Failed to alloc lli mem=
ory\n");
> >                       goto err_lli_free;
> > @@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_devic=
e *pdev)
> >               return PTR_ERR(sdc->rstc);
> >       }
> >
> > +     /* This driver uses unextended 32-bit addresses for descriptor li=
nks. */
> > +     ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> > +     if (ret)
> > +             return ret;
> > +
> >       sdc->pool =3D dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
> >                                    sizeof(struct sun6i_dma_lli), 4, 0);
> >       if (!sdc->pool) {
> >
> > ---
> > base-commit: 93f51579e7df248780214094418f205253383cc5
> > change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
> >

