Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F5606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZk3/YQ8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hD0Mi7Gk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BetBMRYgFSc2DhIuFhDdmiOw1ARuIusJ4xRACgSZqH4=; b=gZk3/YQ8WHcBC8pUX0xcu3izx4
	upk0hYNp2OVmfow3+/GaGzT3k1ihaAygb3oruveTtwnI+8TeklEvtEel2nu7R4QG7xMB10yZ60/sY
	lduvpaEu4kpOifKsz44K9Hz18SjehzMDkj4D6O+P8MER20Xd1MxcDmVIS52+v/PI0g08BM82VPNTS
	W/FIZprgm902hkdjeuvwTNmF6thYncfLdPVwKzoF1ktoqgVJoJDp9JCbzLbxRN/xMuRcUhlgfXuIL
	LkLgXJa+WMizNCKRPpw2/DP8qdTDiHLTGgVHF8lPDgt61wBSVEeiesfjuDsSNImWBa+4OP1I0zX7C
	FcH3bO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ98V-00000009gul-04N2;
	Tue, 20 Oct 2026 12:40:11 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ98S-00000009gtl-1rbP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:40:09 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4a77761ff8aso1070883fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 05:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500007; cv=none;
        d=google.com; s=arc-20260327;
        b=Sg+lNXFsGvIgiE2vEBWuNb+HnMD+UrJLS0+9k+N9iLn/BMUuzaEZkWF0t+ccdNLFis
         LU6j4P5B073+ktHoagwzLxEA/+VrFixT9CAeONL+x4AuRzETbIjSx10avGeR8UlH0/Jn
         xesioBZEPaXHNeIBIbpKVzjfv9K0udZn67PcANijnLcuh3K+p8WE1YvPT5K2TrMQMWAP
         FuJE6MJ5T6tDtljbNwXYY/37QNF6bLlwoSuQ6XI3yaTKz3O0KvyMsGPuC1AzDiyO7DME
         Vlps2lehllrry7AjfBpkCBoPer03rGICv3SxaICvD35IudsvEH/SoH39GdUE+KCi8CCP
         xbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BetBMRYgFSc2DhIuFhDdmiOw1ARuIusJ4xRACgSZqH4=;
        fh=VMOS3bK1Nis3sVAbwrkEtom/2VKQdGQOXPS7GMmekIQ=;
        b=be5E6KJgLmOOSn8O/Ef/5tbyqa20n+Z9AJMeAZHfMlkwqCpXow/lJUCOrIsYU2hsma
         C5pi00G3ttriQgqOARBx8AWOJxHlX+bTvRTcZGYGMPN0jHrjx9GDUAHjnZ0MXZTROJma
         FwjhKgOLGwV8ovFvkU0P/J4/jXkOcjGeS6a4pxNCbx5/+5nXF92VCTyD0R6017yJBZAt
         +ViO/KcW0XwuPdluI+PVLOIySigqx36wg2oKTMT7GZy9meAnA2sc5KWHaWoZZ9Deg1+a
         NiprMOq5SX8Li5CKFxNA1wqXxHBpXOTi0julilGEQA6b9LJp4yEa2eLw+sMPZ4onJ/mY
         NNZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500007; x=1793104807; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BetBMRYgFSc2DhIuFhDdmiOw1ARuIusJ4xRACgSZqH4=;
        b=hD0Mi7GkOXXrRFWMZerxDPugk32n+EKtbCLz1NyHipUWEw9V4snTesKRGBJlrN+4Sx
         gMaGvFycSvN23GxHgKWScHyWG2MUjuqUgZXyMVXOwhm+KMYzASXe/zCEhzxy6HjYhrjY
         QLM712hSRpLV64IbaUc/GtHEqzjjHizNsXOVbHhiraKUzQJcljlwvY4aq9Xq95dsnJp9
         zBNLi5I/B7f1xDVakfdmdnWA8u153uiFrMTzpDsdnYnJmgxeKcMEyK1NJMwnzcSjIAKj
         IGXURWtg2nMe+utjmo5VYh0CK85+svrqMTO/7GrsWnkNfu9FWNw1dsam/wZHdsl9cAKD
         TS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500007; x=1793104807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BetBMRYgFSc2DhIuFhDdmiOw1ARuIusJ4xRACgSZqH4=;
        b=DCvkDw1fn7NGM723mtfCFQXBLjGYis5J3kmmO0leoPyf6L89sn+Evu01Gb6NwAzbWG
         rw++FYIQaAl1lWm0nF51w8Uayyqt38rr2JRzWK0bHb5uw8MHqm77HPZAmlNZjFkdaOb0
         7hEHaeuJliL5yXa1F8TLd6fKrLU8XH2qreUVr2Wsgnp3eEY+fFjW7fcJWuT5MuMQlaAf
         gfAhlP/UMP7DYSkgorwIHKgLxEZmdmtLuqOPwN2ZWpLK1O/yMGrJeVYLKuukJ0u9Jcx/
         elpdYW+xw9Sg4Xhl1OxgR3uKbKMfjHSU1I8mqWAvoxF7Ey6KkNMICzmbXOBdNyfZ7SP3
         QEKA==
X-Forwarded-Encrypted: i=1; AKwUvByiyBOclYd9UI2fdedsU8FWFjtMUYt5RGZj0FFe9YYvn/YEzA+/cAgX1acP5pR7ziShqcIBYXLpT0MLvK9mhek2@lists.infradead.org
X-Gm-Message-State: AFq9FYLwM5pYJK0evorszvFfzKOeBJhcxIr44cDuzuWp+dfmC4lmHtgM
	VfMp9Pm3orSD28H0YoGkGPn2MY5jvt7nfmG5Cm4IVwDqnSX2kZ5Att6ICk0K8dXrMKdopFE7qyW
	SoUVPPJNLB2GvoDOx7nLJ+6PyWvm2HZY=
X-Gm-Gg: AYBFou0+eP0nLlCaTncAebvW6laQUiDBBzmOsMSby2bgcs7AbU8PG/uvDkKyanZGggp
	r64iRXnIfARwfNwx091FyESswN1WCg6yaN3jpcuXM92K/cU/T/LTHmQELfoiW1q0nMrjsWlJXtC
	4vg1RoWn/mWhH/dAGIa6hpAiZCBr3eWipK9CBiKdBMksVqFhBwZpCCNZhZYBSOQw1vRSXecT9Vr
	5VM2cndbVAIc919UBvJCnrFFcWWgaTWDw9r3nh7aDgSQUzYdrmGONxCAAcL9sC1nqHgwR4MF7UL
	PSCRqD+mowirBowj1IAypYBaIptRGSpYL12Lb5WiHvPzoY9BhG7UMvr8
X-Received: by 2002:a05:6871:3318:b0:48f:e107:9092 with SMTP id
 586e51a60fabf-4a757aae6afmr8050396fac.59.1792500007232; Tue, 20 Oct 2026
 05:40:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-wedfix-v5-4-8b02e78fd34f@gmail.com> <179249104422.3135.15395792602371896876@kernel.org>
In-Reply-To: <179249104422.3135.15395792602371896876@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 20:39:57 +0800
X-Gm-Features: AclHuK_65U3PRBzb3igZvto9UCP0w6AudGK3kTF-_hnuxHejq2eqf-9Bb3Meip0
Message-ID: <CAHGaMk_vCEyCB2_oeH89VNdaizKQ9uRd2a_Xj1Lz7FEDEbyC0Q@mail.gmail.com>
Subject: Re: [PATCH net v5 4/5] net: ethernet: mtk_wed: setup WDMA_RING_TX(0)
 for non-DBDC MT7986
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
X-CRM114-CacheID: sfid-20261020_054008_518312_05F151D4 
X-CRM114-Status: GOOD (  39.26  )
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
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In mtk_wed_start()
>   (drivers/net/ethernet/mediatek/mtk_wed.c:2362-2363), this commit adds=
=E2=80=A6
> - [Medium] mtk_wed_free_rx_rings()
>   (drivers/net/ethernet/mediatek/mtk_wed.c:954-956) decides whether to=E2=
=80=A6
> - [Low] The new comment in mtk_wed_start() describes the motivating case,
>   a non-DBDC MT7986 that allocates only rx_ring[1]/tx_wdma[1].
>
> --
>
> net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
>
> This patch makes mtk_wed_start() set up WDMA_RING_TX(0) on WED v2 devices
> when rx_ring[0] was not allocated. This is the case on a non-DBDC MT7986,
> which only sets up ring index 1. If tx_wdma[0] is already allocated, it i=
s
> reset instead of being allocated again.
>
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index b8264435acbe5..3a7c2bb33691f 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -2355,6 +2355,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 ir=
q_mask)
> >               if (!dev->rx_wdma[i].desc)
> >                       mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> >
> > +     /*
> > +      * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] durin=
g setup
> > +      * but tx_wdma[0] is also needed for WED to function.
> > +      */
> > +     if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
>
> [Severity: Low]
> This isn't a bug, but the comment covers less than the condition does. Th=
e
> guard matches any WED v2 device where rx_ring[0] was not set up, and MT79=
81
> also has .version =3D 2. It is not limited to a non-DBDC MT7986.
>

This is incorrect. MT7981 is DBDC which means two rx_rings.
My condition check is correct.

> Could the comment describe the condition as it is implemented, the way th=
e
> commit message does?
>
> > +             mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE=
, !!dev->tx_wdma[0].desc);
>
> [Severity: Medium]
> Should the return value of mtk_wed_wdma_tx_ring_setup() be checked here?
>
> On the first start, tx_wdma[0].desc is NULL, so reset is false and the
> helper allocates the ring. If the allocation fails, the helper returns
> before it programs any WDMA or WED ring register:
>
> mtk_wed_wdma_tx_ring_setup() {
>         ...
>         if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZ=
E,
>                                          dev->hw->soc->wdma_desc_size, tr=
ue))
>                 return -ENOMEM;
>         ...
> }
>
> mtk_wed_start() keeps going anyway. It calls mtk_wed_hw_init() and then
> mtk_wed_dma_enable(), which does:
>
>         wed_set(dev, MTK_WED_WDMA_GLO_CFG,
>                 MTK_WED_WDMA_GLO_CFG_TX_DRV_EN |
>                 MTK_WED_WDMA_GLO_CFG_TX_DDONE_CHK);
>
> It then sets dev->running =3D true. At that point WDMA TX is enabled but =
the
> ring 0 base was never programmed.
>
> The other caller of this helper, mtk_wed_rx_ring_setup(), does pass the
> failure back:
>
>         if (mtk_wed_wdma_tx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
>                                        reset))
>                 return -ENOMEM;
>
> A later patch in this series, "net: ethernet: mtk_wed: bail out when
> failed to set up rings in wed_start", wraps this call with a dev_err()
> and a return. With that patch applied, the end of the series is fine. Can
> the check be added in this patch so it works on its own?

ACK. Will do.

Best regards,
Zhi-Jun
>
> [ ... ]
>
> [Severity: Medium]
> This code is not part of this hunk. It comes from the earlier patch in
> this series, "net: ethernet: mtk_wed: free up rings during detach". It is
> mentioned here because mtk_wed_free_rx_rings() is also what frees the
> tx_wdma[0] ring added above. Does the flag check test the right array?
>
> mtk_wed_free_rx_rings() {
>         ...
>         for (i =3D 0; i < ARRAY_SIZE(dev->rx_ring); i++)
>                 if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
>                         mtk_wed_free_ring(dev, &dev->rx_ring[i]);
>         ...
> }
>
> mtk_wed_rx_ring_setup() sets MTK_WED_RING_CONFIGURED on
> dev->rx_ring[idx].flags, not on tx_ring[idx]. So if rx_ring[i] is
> configured and tx_ring[i] is not, the coherent descriptor buffer for
> rx_ring[i] is not freed. After that, __mtk_wed_detach() calls
> memset(dev, 0, sizeof(*dev)) and the pointer is lost.
>
> One setup where this appears to happen is MT7988 with an MT7992 using
> hif2. mt7996_dma_init() registers the band1 rx queue on the primary WED
> as MT_WED_Q_RX(1). mt7996_register_phy() sends band1 tx to wed_hif2. The
> primary WED therefore has rx_ring[1] configured but not tx_ring[1].
>
> Does primary rx_ring[1] then leak on every detach, for example on a
> module reload? Should this check dev->rx_ring[i].flags instead?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com

