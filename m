Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA88D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TE3NMLOz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h8ukNN09
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=; b=TE3NMLOz05ruC+
	m039dvmLibiBqmHnleBZOJE726VfA3EcNH+kc2HMDgKKL86V/iK1y7RH89UR7Ffkog6D5xJ9KW+v1
	LiFw3cAm/1RcE8ob+thUgGMU7rGdvklMgqI7SdcgCJsMrF9cTbFBYZ0rXGnxAra8fiUAW8Wky30nU
	7B+eHxzIDFJ9ysd8oIiKuAk+bG/gPblGor/NczKWZvMtwbY//2AzV6TO4BRybwoqETPK4HaZ/uQN2
	jkGEknaArzsVGuXne9mXpYZybIFOaOVBMnA8jplX+c0WJaeBoh+DTetROFUSs1CqZEbnmUn1Ht5+0
	vh3EWzyD6snVgteGPx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSSh-00000003J3s-27jM;
	Mon, 26 Oct 2026 21:42:35 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSSe-00000003J3N-0ZXw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:42:33 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so678778137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793050951; cv=none;
        d=google.com; s=arc-20260327;
        b=nkvItLV3tZa7NWn6/Z4p/Kom/1buc7t5EKyKUDUu/0svTLD/t5E53qJ6HTeAmhqEXp
         SItHx9vS9H7MO+4fUaV7WdSzYc2L0DCvXcSZby4MCYj5pZtSUBZSzgVeoVA0jdTgubxz
         b86cchHiSHnBxfP6cVkfLfgaiYxhfZ/tFaTxsh5nN441mkCt/E6TNbNLAQiF7er1BpH8
         2cEmScC6NKaLi94Xv7yjUkW+nY9hvjJ2eCSHtTZWSXxpPUiKu7/tIcyAiy0yVShWiGbG
         bVkXAYktQnbKSDtkBrJgEvMorVoncZlZZsagJdZ4lXth3ofxoLlPQCuYdJ5cPV3U4heV
         Qt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        fh=iitRN+yIjALwrwCFYaxoHLmy7a1oOq5lW8TneEE2oDY=;
        b=Hu1wH5wM8Jnl8aoP9c2Ng1PAyUYycD49n3bJb/AhH8bPFEtokTOdUxSoIaOZAo2T8g
         OCaQMj5Pgdmmbe2wMm5w1Gs2YnjiyhABJ5wlBdYzmXF1eOe8MFgO9TxTdjlsFszU+mfP
         8ypyO/tIXftspc2JsSc7k7TSQ1HtvXTN7wttXxyD40nYRUAw1oQOpEsCbguBT1YZAQD8
         pxIs0GBCpoeo/+IRjqg8KlypkTEEHHit/eo7MeURxYE2uAx7nQS7h6YjfIoIWoz8jYvO
         ASRn9bE1VGK3Wah+/WMCy06tiYRQSa8Q1Fv+vKRswbjPTdb9eebm0vX2E4IfpTKH53iG
         m2FQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793050951; x=1793655751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        b=h8ukNN09ErjhkFKCcRP4iw/3NldKRb1Uv6cS2z7D4MkXpvEiw6je69PSVXEYQxQavX
         /ByQac6/4uLfNGbVbDMn/cO6Qu+mbyLzpxAEZ4tnTF3XEjeKSDg7N8a71s/OSHGPmXac
         7Tc8B843P2n2wouWAFc1cCCKU80+di8wRocUbi8FhkyQvymPlffZrQPMg9f66LEyY70e
         u7aViHVOsSMsLTJocsuUFaeLvwFl+GqrnLu+sAaltRFefhCte4gjm2upcklq4JQbgNv5
         ECuAtYbnrpcV5RMWF6HvtN9ZEp0UN/zynSPJNQ01pI/e1rZoLolYby+7P6qmNCfUBpRv
         TmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050951; x=1793655751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjI2lcwuDm0dzr2macE/psmDs5xURkLGTFGCf/yYSiE=;
        b=zXf2OUmmdB5sCnOJwe8lB88WCAolbM4yFiPp/idAEAstRFdsywt8l7k/npnIoX9hTX
         2okqHh7ud35bsqQrCDmYhwvdQdOrVj09SEYyTTEzo3Vyv0xs0Yby1/3u0H71NpgAV9yS
         FIfxvrkQf+Gi1P/O4Vn+DDKHL1vdYVC5Vg2B0AkV/3OFU8npNdRQ8DtDne0xtp3HIS73
         H2I4oglHuyNC+gPV2EfLmFdlzhmMhkzh8BX7rfKgODBznN2C3n+6shcU4vxbcuzIleEx
         Nk21hwgXS8uz56VS0z1wRXgE16NAeV97dKhgu2vMkzchKXJLPUnBfMU6t7LjaIADtn9j
         5mMg==
X-Forwarded-Encrypted: i=1; AKwUvBzPFd4iGWvGulMJJSCMk9ToMWAXd0lJUwVfhYW9IooV+l70Pe6T9x/bkVIrydLeataCQbRjOF+oW5HZnaahFOVQ@lists.infradead.org
X-Gm-Message-State: AFq9FYK/yANN+M20r03EN0hHyi0gV7gWiiQArq7uMNmDF03bUuklYvNf
	ItqVwIozfUpw0uX541VI/V/F62UYZDaGEg0GEPG0z7vPxp8NG15VWRYN7r5fQr5ad+moEMxINou
	7fHk9ou6LPGbjYYbFDJAAG6FqBZaDEWM=
X-Gm-Gg: AYBFou0d1o22yzjrPsItv4dBtq3vw2QxSmnva4ilTm6IRgzRmYWcxBHWYRFoMdP7h0I
	ziFplJ1hvk0p2J3W5J5OVbLS3ACXlj3125VFbItWJeKssquf68I/5zRuAtomKX8DkjFRvVwkIRj
	vrCscKaoermxwchiZs/hhY1EjCMLVum3JDr+efXZryR04l00mwG072wwnrz9RLN7g128Gtqmbyd
	WPvjV1+cJsZefeTmLM4I/02oH3UHrQussUZ7owONnFyGFWt1Z25Usd6kBWQRmGpNCY+aOSgirGW
	qQAaydJbzGIkoWNpVFiAWNdLJqT9rZyuLcQ7B5L2oAGKDfQaVPRxe6bSc+8g2Vl96LgGjCBLbSq
	etvvwfiqQoIvZDuFhB6Rsp7xMpuG6KSpQUumwuZ7QqFTXybdNqsuQT08jpqKPPvdApU7RReCimO
	py/eu+T29r/6UIZ8xEgyGhiHaFHDvDmvePuEUbvriC+FNv7UHwU3xSFwC7oO0ydgNHBHitUOz4J
	u8QSBNGQzAAc3txZunJFJ9X/miaDQ==
X-Received: by 2002:a05:6102:334b:b0:7cc:33c9:b3d2 with SMTP id
 ada2fe7eead31-7ce5cdcaeecmr2526579137.25.1793050950510; Mon, 26 Oct 2026
 14:42:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com> <at_CpZrmQ986UEqv@SMW015318>
In-Reply-To: <at_CpZrmQ986UEqv@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 15:42:18 -0600
X-Gm-Features: AclHuK-4-WgnFSyD4HMuuPSJHkf08GLM_LN-zKGiCU3BeJkAlzKME5OQQIP7X_g
Message-ID: <CADvTj4ptPZeNsjrdB9Lr2aJe9FKJ+w1m0ATfwXhO=zEo0APtvA@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel ownership
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>, 
	Jens Kuske <jenskuske@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, 
	Hongling Zeng <zenghongling@kylinos.cn>, Chengfeng Ye <cyeaa@connect.ust.hk>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_144232_245874_38ABFC03 
X-CRM114-Status: GOOD (  32.28  )
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

On Mon, Oct 26, 2026 at 3:14=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Oct 23, 2026 at 05:38:23PM -0600, James Hilliard wrote:
> > The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
> > termination reads the physical channel before taking either lock. The I=
RQ
> > handler also takes an unprotected owner snapshot. Termination can miss =
a
> > new assignment or detach an owner while an interrupt is about to comple=
te
> > its descriptor. A sampled IRQ can also be applied after reassignment.
> >
> > Protect physical-channel ownership with sdev->lock across allocation,
> > interrupt handling, pause, termination and residue queries. Read and
> > acknowledge IRQ status under that lock, and allocate and start each pen=
ding
> > channel in the same critical section. This also serializes updates to t=
he
> > shared interrupt-enable registers.
> >
> > Nest vc.lock inside the device lock when accessing descriptor lists or
> > updating cookies, including cyclic notifications. virt-dma takes vc.loc=
k
> > independently when preparing, submitting and completing descriptors, so
> > the device lock does not replace it. Client callbacks run outside both
> > locks in the virtual-channel tasklet.
> >
> > Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A3=
1 DMA controller")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kern=
el.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-----------------=
--------
> >  1 file changed, 33 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 435d7daa1c0f..d3a63c866645 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -217,6 +217,10 @@ struct sun6i_dma_dev {
> >       struct clk              *clk;
> >       struct clk              *clk_mbus;
> >       int                     irq;
> > +     /*
> > +      * Physical channels, pending list and registers; nests outside v=
c.lock.
> > +      * virt-dma also takes vc.lock independently for its lists and co=
okies.
> > +      */
> >       spinlock_t              lock;
> >       struct reset_control    *rstc;
> >       struct tasklet_struct   task;
> > @@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_stru=
ct *t)
> >       struct sun6i_dma_dev *sdev =3D from_tasklet(sdev, t, task);
> >       struct sun6i_vchan *vchan;
> >       struct sun6i_pchan *pchan;
> > -     unsigned int pchan_alloc =3D 0;
> >       unsigned int pchan_idx;
> >
> > +     spin_lock_irq(&sdev->lock);
> >       list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_=
node) {
> > -             spin_lock_irq(&vchan->vc.lock);
> > +             spin_lock(&vchan->vc.lock);
> >
> >               pchan =3D vchan->phy;
> >
> > @@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struc=
t *t)
> >                               pchan->vchan =3D NULL;
> >                       }
> >               }
> > -             spin_unlock_irq(&vchan->vc.lock);
> > +             spin_unlock(&vchan->vc.lock);
> >       }
> >
> > -     spin_lock_irq(&sdev->lock);
> >       for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) =
{
> >               pchan =3D &sdev->pchans[pchan_idx];
> >
> > @@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_stru=
ct *t)
> >
> >               vchan =3D list_first_entry(&sdev->pending,
> >                                        struct sun6i_vchan, node);
> > +             spin_lock(&vchan->vc.lock);
> >
> >               /* Remove from pending channels */
> >               list_del_init(&vchan->node);
> > -             pchan_alloc |=3D BIT(pchan_idx);
> >
> >               /* Mark this channel allocated */
> >               pchan->vchan =3D vchan;
> >               vchan->phy =3D pchan;
> >               dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
> >                       pchan->idx, &vchan->vc);
> > +             sun6i_dma_start_desc(vchan);
> > +             spin_unlock(&vchan->vc.lock);
> >       }
> >       spin_unlock_irq(&sdev->lock);
> > -
> > -     for (pchan_idx =3D 0; pchan_idx < sdev->num_pchans; pchan_idx++) =
{
> > -             if (!(pchan_alloc & BIT(pchan_idx)))
> > -                     continue;
> > -
> > -             pchan =3D sdev->pchans + pchan_idx;
> > -             vchan =3D pchan->vchan;
> > -             if (vchan) {
> > -                     spin_lock_irq(&vchan->vc.lock);
> > -                     sun6i_dma_start_desc(vchan);
> > -                     spin_unlock_irq(&vchan->vc.lock);
> > -             }
> > -     }
> >  }
> >
> >  static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
> > @@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, vo=
id *dev_id)
> >       u32 channels_per_reg =3D sdev->cfg->num_channels_per_reg;
> >       struct sun6i_vchan *vchan;
> >       struct sun6i_pchan *pchan;
> > +     unsigned long flags;
> >       int i, j, ret =3D IRQ_NONE;
> >       u32 status;
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> >       for (i =3D 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg=
); i++) {
> >               status =3D sun6i_read_irq_stat(sdev, i);
> >               if (!status)
> > @@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, v=
oid *dev_id)
> >                       pchan =3D sdev->pchans + i * channels_per_reg + j=
;
> >                       vchan =3D pchan->vchan;
> >                       if (vchan && (status & vchan->irq_type)) {
> > +                             spin_lock(&vchan->vc.lock);
> >                               if (vchan->cyclic) {
> >                                       vchan_cyclic_callback(&pchan->des=
c->vd);
> >                               } else {
> > -                                     spin_lock(&vchan->vc.lock);
> >                                       vchan_cookie_complete(&pchan->des=
c->vd);
> >                                       pchan->done =3D pchan->desc;
> > -                                     spin_unlock(&vchan->vc.lock);
> >                               }
> > +                             spin_unlock(&vchan->vc.lock);
> >                       }
> >
> >                       status =3D status >> DMA_IRQ_CHAN_WIDTH;
> > @@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, voi=
d *dev_id)
> >                       tasklet_schedule(&sdev->task);
> >               ret =3D IRQ_HANDLED;
> >       }
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return ret;
> >  }
> > @@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
> >  {
> >       struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       unsigned long flags;
> >
> >       dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc=
);
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> > +     pchan =3D vchan->phy;
> >       if (pchan) {
> >               writel(DMA_CHAN_PAUSE_PAUSE,
> >                      pchan->base + DMA_CHAN_PAUSE);
> >       } else {
> > -             spin_lock_irqsave(&sdev->lock, flags);
> >               list_del_init(&vchan->node);
>
> suppose need vchan lock here?

vchan->node links the channel into sdev->pending; it is separate from
virt-dma's descriptor-list nodes. All runtime accesses to that pending
list are protected by sdev->lock.

The same lock protects vchan->phy, so it also keeps the physical-channel
assignment stable while pause() checks it and either pauses the hardware
or removes the channel from the pending list.

resume() additionally needs vc.lock because it inspects vc.desc_issued,
and issue_pending() needs it to move descriptors between virt-dma lists.
pause() does not access those lists or cookies, so taking vc.lock here
would not protect any additional state.

>
> Frank
> > -             spin_unlock_irqrestore(&sdev->lock, flags);
> >       }
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return 0;
> >  }
> > @@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_cha=
n *chan)
> >  {
> >       struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       unsigned long flags;
> >       LIST_HEAD(head);
> >
> >       spin_lock_irqsave(&sdev->lock, flags);
> > +     spin_lock(&vchan->vc.lock);
> > +     pchan =3D vchan->phy;
> >       list_del_init(&vchan->node);
> > -     spin_unlock_irqrestore(&sdev->lock, flags);
> > -
> > -     spin_lock_irqsave(&vchan->vc.lock, flags);
> >
> >       if (pchan && pchan->desc && pchan->desc !=3D pchan->done) {
> >               struct virt_dma_desc *vd =3D &pchan->desc->vd;
> > @@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_cha=
n *chan)
> >               pchan->done =3D NULL;
> >       }
> >
> > -     spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > +     spin_unlock(&vchan->vc.lock);
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       vchan_dma_desc_free_list(&vchan->vc, &head);
> >
> > @@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct=
 dma_chan *chan,
> >                                          dma_cookie_t cookie,
> >                                          struct dma_tx_state *state)
> >  {
> > +     struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(chan->device);
> >       struct sun6i_vchan *vchan =3D to_sun6i_vchan(chan);
> > -     struct sun6i_pchan *pchan =3D vchan->phy;
> > +     struct sun6i_pchan *pchan;
> >       struct sun6i_dma_lli *lli;
> >       struct virt_dma_desc *vd;
> >       struct sun6i_desc *txd;
> > @@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(stru=
ct dma_chan *chan,
> >       unsigned long flags;
> >       size_t bytes =3D 0;
> >
> > +     spin_lock_irqsave(&sdev->lock, flags);
> > +     spin_lock(&vchan->vc.lock);
> >       ret =3D dma_cookie_status(chan, cookie, state);
> >       if (ret =3D=3D DMA_COMPLETE || !state)
> > -             return ret;
> > -
> > -     spin_lock_irqsave(&vchan->vc.lock, flags);
> > +             goto out;
> > +     pchan =3D vchan->phy;
> >
> >       vd =3D vchan_find_desc(&vchan->vc, cookie);
> >       txd =3D to_sun6i_desc(&vd->tx);
> > @@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struc=
t dma_chan *chan,
> >               bytes =3D sun6i_get_chan_size(pchan);
> >       }
> >
> > -     spin_unlock_irqrestore(&vchan->vc.lock, flags);
> > -
> >       dma_set_residue(state, bytes);
> > +out:
> > +     spin_unlock(&vchan->vc.lock);
> > +     spin_unlock_irqrestore(&sdev->lock, flags);
> >
> >       return ret;
> >  }
> >
> > --
> > 2.53.0
> >

