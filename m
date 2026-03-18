Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5731A10775E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDAwQJj2qxMsL/d9PJ0qvtFLL5AKR6ekKJ98TYb6SLw=; b=A4ifmi0ZmLX60d
	RmKUPXQXkvfpKyWdoJHM0sjUgFgyICSBbnxHmlUhiQdblElIGRpNoNeo8BJNjAk/s19FAEozoV0pw
	dFhM2ZsD/uDWkg4F2PcgQ3qWh0YNPb94zTXqzRGQBtMbS9qvwvV0zustucPdStE6yXOFQ1aMmz/kB
	QeSnd7+9Rs7InZhr8NxvvkyD9zeVBk1OPe3a2lPgMv41WKhSCa0OtmsZRPvVj+Bh+KFSrbq9V83OF
	lWcZuNwuzKuSMs1CM6jnxxISCzDPa8UpVPzDI60UGlgUGi3swlchkPPW8SCWXCORFxdoGnGuKK88p
	VXrN1wwq+EsEE25myBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tew-00000008ubO-0soZ;
	Wed, 18 Mar 2026 16:22:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2teu-00000008ub6-3dco
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=sDAwQJj2qxMsL/d9PJ0qvtFLL5AKR6ekKJ98TYb6SLw=; b=olMEDUOSYXzA7KdYly/hLm2c9L
	5M6IQ4Y1L34WcEax2p1113gE1unDLdOFe0wZcqVjWw9Bq1KmovhT/Me8wXj0mrOGi84PvNxUenCfY
	K2uvqZDhMwEKuDghiYDyju577d4fp45qmrPv1QslDSuQfekmH5AuvU2awXQ0UkuYZX4yPmG9oNurc
	KwGi/saREg6uU4a/StECcB0FLAO9XBa01kSxrRbq4+V2jxdMAkPGYDum/vgTqBZC/lLEWLumZMl3Q
	vY/Y0suoWPVEcHWygaV8dbvlYk0cYRRQVTXN3s3wWW1IAcpvDc9NiL8dQOTlZM/CySJZiJji4TuoT
	ddGNB28w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ter-0000000BhfW-0KG1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76C38440C3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 16:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E37C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850923;
	bh=T97aoZ7NgVNK3bf7m5LjMK8b5ZisKHJvvvuGMXalsA0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ivPGCZx/qfMr6Q0pIxSJwtm9cV7ZMj6RhwAwtzAMIGLhIDs6k9KpdiHoyzWAx9U86
	 nSj6s6c8P0Jo+sIPgFcLGuW5NO79zpXmK4o2eAXQMekPZGOu8PjW9Y4L8ycOzo03dB
	 FJt5FpqXLGIE8ZSvY0t0q49Dg916nSE5AzdfLtTzgt3WZClc3vdnMhDgtBOwW9ULwJ
	 fCgLlwQ3u8Io4qSAPs7EGDKJbE80zQHeG93ZahKdlOxh/jOqQUkhRwNyZl/7dxtXfl
	 qcQKUYgbeJ7cHK/OqhB1vAzyJEBxoYu9b5sE6CTRBEK/otC6Stvyat2hYmEPCNuEbW
	 E0kUOjIRDCe0A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a43f1f978so682961fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:22:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6yXpagPzzKcgQadg96DOllaCzy1oDSM4JY7HUXiiIUKBJ995W+pgFJDzpnF9Zl/vE8jLBVgztsxDnUBPFrYNl@lists.infradead.org
X-Gm-Message-State: AOJu0YyByWMhMVKwScmgUfC7IS8t9GUMQ6FUcF0AVrYdg7cEPtliGWs1
	hZ2Dp378AfscLdDKwx/ceKQ5gCu8FCIYJrwSVFkFCUhRubqHkMJ4M4XS2xwVII4E+tq+2trVx4Z
	XBZpgDEU9ykCF3qk0r7wC3R10wQwofi0=
X-Received: by 2002:a05:651c:f02:b0:38a:6acc:8dd with SMTP id
 38308e7fff4ca-38bd57d16b4mr16195451fa.15.1773850921511; Wed, 18 Mar 2026
 09:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260317064049.696795-1-wenst@chromium.org> <20260317064049.696795-2-wenst@chromium.org>
 <20260318160239.GB633439@killaraus.ideasonboard.com>
In-Reply-To: <20260318160239.GB633439@killaraus.ideasonboard.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 00:21:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+OHbNOQLk1JojFapPDhSK6eqCySRWzQVYGkvAivqD4Q@mail.gmail.com>
X-Gm-Features: AaiRm503aLc_PUnOAbewqYGMjHBxRoTrFj-iNoSyc6onK3A0wGY85ZN-PahRSYQ
Message-ID: <CAGb2v66+OHbNOQLk1JojFapPDhSK6eqCySRWzQVYGkvAivqD4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/rcar-du: Use drm_gem_dma_get_sg_table() helper
 to get scatter gather table
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_162209_457302_4509F43D 
X-CRM114-Status: GOOD (  39.06  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 19, 2026 at 12:02=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Chen-Yu,
>
> Thank you for the patch.
>
> On Tue, Mar 17, 2026 at 02:40:43PM +0800, Chen-Yu Tsai wrote:
> > The rcar-du driver is directly calling dma_get_sgtable() on a
> > drm_gem_dma_object. Not passing the dma_attrs field in may cause
> > problems when DMA_ATTR_NO_KERNEL_MAPPING is added to the GEM DMA
> > helpers gain support later.
> >
> > Instead, use the drm_gem_dma_get_sg_table() helper to get the scatter
> > gather table.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - new patch
> >
> > Not sure if we should add a helper like drm_fb_dma_get_gem_addr(). This
> > seems to be the only driver that is using a scatter gather table to pas=
s
> > DMA addresses.
>
> The DU can't access memory directly (at least on Gen3 and newer), and
> goes through a separate device called VSP that acts as an external DMA
> engine (*) and compositor. This is why buffers need to be mapped
> manually to the VSP, the GEM helpers would otherwise use the DU struct
> device, which isn't correct. I can't use drm_device.dma_dev as the DMA
> initiator can be different per CRTC.
>
> I don't think a separate helper with a single user would be very useful
> here, especially given that part of the logic in
> drm_fb_dma_get_gem_addr() is in the separate vsp1 driver. Refactoring
> may get messy, for little benefit.
>
> * And in some cases the VSP further delegates memory access to the FCP,
> which is yet another DMA initiator from an IOMMU point of view.

I see. That's probably the most complicated hardware I've seen so far.

> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gp=
u/drm/renesas/rcar-du/rcar_du_vsp.c
> > index 94c22d2db197..6a62608ee3a9 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > @@ -291,10 +291,16 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, s=
truct drm_framebuffer *fb,
> >                               dst =3D sg_next(dst);
> >                       }
> >               } else {
> > -                     ret =3D dma_get_sgtable(rcdu->dev, sgt, gem->vadd=
r,
> > -                                           gem->dma_addr, gem->base.si=
ze);
>
> Did you compile the patch ? The rcdu variable is now unused. Apart from
> that, it compiles fine and seems to operate as expected.

I probably missed it in the logs. Thanks for catching it.

> > -                     if (ret)
> > +                     struct sg_table *ret_sgt;
> > +
> > +                     ret_sgt =3D drm_gem_dma_get_sg_table(gem);
> > +                     if (IS_ERR(ret_sgt)) {
> > +                             ret =3D PTR_ERR(ret_sgt);
> >                               goto fail;
> > +                     }
> > +
> > +                     memcpy(sgt, ret_sgt, sizeof(*sgt));
> > +                     kfree(ret_sgt);
>
> It's a bit of a shame to kmalloc() a new sg_table and free it right
> after :-/ Would it be that bad to switch to dma_get_sgtable_attrs()
> here, and pass gem->dma_attrs to the function ?

That's another option. I was trying to isolate the DMA API calls to
just the GEM DMA helpers, but as you said, it's a bit wasteful.

I'll just switch to dma_get_sgtable_attrs() and squash the change into
the other dma_*_attrs() conversion patch.


Thanks
ChenYu

> >               }
> >
> >               ret =3D vsp1_du_map_sg(vsp->vsp, sgt);
>
> --
> Regards,
>
> Laurent Pinchart

