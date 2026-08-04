Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C349C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gYefvAyqnzn8QAHjERbxmBW19GFjgq4+owbZqEl8b0=; b=cA8xXXXID6k93TZyzKQm8Tv+Ir
	ToiuJ8lXIOPZCULPxnbSw/cU5+zGG81Dg/wRhUmUC3Tk4zNfelTqeNt9bTwN5KojMjE0IPt/v8l/y
	3VfRTkgpiqLHMqvys6/SUgmqW5znVV0oTtmYtEyVxnELa8ku0ebDSV157Dy3pHYTsK2cfI6riLOiM
	v5A4xHETtH9lZLyJ5SZlaH2i6ZKu3/zcasTp6Bn+3CTgM6nRzs8GoGzsTpKpYbpjxeHCl2Wj9iDhA
	nmRrm+hmWQ6mMsK+Fbbd+rv8imHKpo8Lr/AGYYM0Bro2r61dz72K0nkIwoCa/ZlV4GxIjmE4FmEPg
	dygwTVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHx4-00000002JsB-1T8t;
	Tue, 04 Aug 2026 16:25:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHx1-00000002Jqq-26Ri
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:25:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4957eefd361so24944675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785860709; x=1786465509; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gYefvAyqnzn8QAHjERbxmBW19GFjgq4+owbZqEl8b0=;
        b=ZvowjAXF1wCIPtu8Y9vm/ytcH8dRWTbMvHvF86Hi/hqcD8+3FnSLN5/dOQB5Sy82ho
         GOxQvOPknHQclq0HEEG/ExcU2kp7QdTPppwiWZ+iW+ymcR9K71WPFaiR4c5RNREFkPH1
         Kbz6Y774ryH9PuECw9KJhGD8vTbxY9A6/l4CDDeYwgPkB8yGJx+8LP0vVvoSnrlyRFK+
         eIXsrkizYAUWk24yDNQDlqqbMV+lprDzkyRtl29GirpR/udFyt6PNexTcQxD8bmXA239
         77S8BhPNqOVBZ308+wDpDFTrPHAMzjPbjdqamYLCCXVcwbieTVFC9BDzxo4fJT/Pxtg4
         HIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785860709; x=1786465509;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gYefvAyqnzn8QAHjERbxmBW19GFjgq4+owbZqEl8b0=;
        b=OXdnJebFxPzttzt74B6wKfR1/WpHh2enmADxqgHwnchIseO4JojJpnVBGBd1P8kRTN
         foykcoYB5XtQcBd7pPg+DFEpqmHKMu8fZQ5XGg8wSdg4hYPEdFAatj1c/qZPfHPdTgSG
         Ckd27AcbBovzDMmNGpraZrxp+2BAvGghiehoJ3GlwtkQFDObVShnmn9Vao86GORnWlGW
         P+bU6Ulv463wS0cBOxExrINFoUbsBg4AwsIarqL3oA3DnCsfiVpIOOt+YsbxpniouFzh
         EGg7YjLCRelYguk49a1iUm5Er7sOCdJF/lr+tkJf9TiRcKdxLQDMfUYsZUgAtsHoT95w
         /YSw==
X-Forwarded-Encrypted: i=1; AHgh+RpIu02k326zbuBKO922whiPlB0bTXZe8Wh7k81dGyFdCgHXyts6CVC4clixIpkJbGOEHeg6JxAbsBJAnE+e2Xkc@lists.infradead.org
X-Gm-Message-State: AOJu0YxTbLo35Yc0++UqR6q1eDX0cNmkFuoKo9jZt4dpLracKoLRP5Pt
	bvOn7pacygn2CpO2b2qgP8BZROnppJJcQWb+L2Xf15POsc8xjmb7S8Mp
X-Gm-Gg: AR+sD121eoo1LNJY27EWyo0RIW2gcXI+znmbR83sKqOoyi8f3Pn2J92lPI9WYoH22Ry
	S3UJfH1N2gdrkZdELhZdaf7xmxEoxk6obwnDl2lwM9Qi+X1b8NuX2RG76YqY4iheDsi3BsrSEb0
	oSSSsV5mNBVdLTc1p/QoLeIS9N+tWM7J9XcjoKfGqfe5urW7C9eK+ok4gmm+aFffwskeLKueuud
	+WBLGOEklNE25ci9uRBBGcQB9HAu97Ct0PrkEu4/wcSfdx11GNASQFfuANS0GNJnNDO2HDbxiWS
	lXKc0rm0qGhlC7fglIA4HQfsz4PSjeHce0Bb7iF4xfBO16p1Qn8yS3y6nKLZxzGWAddpPnZYiL9
	6d6RUlaRqEwaERh+fRrE54XXKoXS9CWZqcpn25gRBZDFCyEYyTlQZxLeSYBSnjFu+80MDU4pj+t
	VxAVJHlegGMZSVLFxc//CKVwHMGBmBnSElCQDJNnzJ2eOxZDcAPJH0Hf2/KqefoaffrjCpn/3WS
	hGM9DDyPUpL2WXjDW2OXxFvxmwpjBJbesotoeoO0UHE0DlPj9+Jz4nIbXRYjAbZhaZofiSd2qGO
	vGry2U9e09rXHRAKf2hBjKfE4oAVsaW58TYEEjIGKpDHPaRE7EVxnwJ5GAGCLRd5Bo8ubivYx+k
	gptETwA4zYPJFDBCv6y2++Hq/I4RtI9VmT26G+1WE4JrJYO6oH+zf/HGiscO111nr7YbuzYFMo2
	gl6KJ5nNYBFTK6Cw==
X-Received: by 2002:a05:600d:8492:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-4980c64b873mr280626065e9.5.1785860708981;
        Tue, 04 Aug 2026 09:25:08 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-102-118-gprs.simobil.net. [46.122.102.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec249a5fsm897076f8f.33.2026.08.04.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 09:25:08 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] drm/sun4i: Align VI buffer addresses for subsampled formats
Date: Tue, 04 Aug 2026 18:25:06 +0200
Message-ID: <ugAWjG4QTtSgFVIbk0BoGg@gmail.com>
In-Reply-To: <CAGb2v67ugarRQAB=yDiyGti4E_r=dF0G08-TiGgphQSefHs8zQ@mail.gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
 <CAGb2v66E95PwYhdPC4mkX1htF2VXECiGwUHfzLHV2ydOMiwxrg@mail.gmail.com>
 <CAGb2v67ugarRQAB=yDiyGti4E_r=dF0G08-TiGgphQSefHs8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_092511_571552_542FFDA4 
X-CRM114-Status: GOOD (  35.90  )
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

Dne torek, 4. avgust 2026 ob 13:14:38 Srednjeevropski poletni =C4=8Das je C=
hen-Yu Tsai napisal(a):
> On Tue, Aug 4, 2026 at 1:25=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
> >
> > On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@=
gmail.com> wrote:
> > >
> > > This is a partial revert of commit 79ac1c945ab8 ("drm/sun4i: layers:
> > > Use drm_fb_dma_get_gem_addr() to get display memory").
> > >
> > > Chroma must start at the beginning of a subsampling block, for example
> > > chroma start address for NV12 must be aligned to 2 pixels.
> > > drm_fb_dma_get_gem_addr() offsets luma by the exact source coordinates
> > > and chroma by the coordinates divided by the subsampling factor, so f=
or
> > > odd offsets both planes no longer describe the same pixel, which the
> > > Display Engine scaler can't handle.
> > >
> > > Align source coordinates down for all planes instead. Remaining shift
> > > of one pixel is already compensated with scaler phase shift in
> > > sun8i_vi_layer_update_coord().
> >
> > Well I think this applies to the format in general, and probably should
> > be fixed in drm_fb_dma_get_gem_addr() instead?
> >
> > > Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr(=
) to get display memory")
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 20 ++++++++++++++++++--
> > >  1 file changed, 18 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm=
/sun4i/sun8i_vi_layer.c
> > > index 09f668c8af24..ad036cb9d88e 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > @@ -197,15 +197,31 @@ static void sun8i_vi_layer_update_buffer(struct=
 sun8i_layer *layer,
> > >         struct drm_plane_state *state =3D plane->state;
> > >         struct drm_framebuffer *fb =3D state->fb;
> > >         const struct drm_format_info *format =3D fb->format;
> > > +       struct drm_gem_dma_object *gem;
> > > +       u32 dx, dy, src_x, src_y;
> > >         dma_addr_t dma_addr;
> > >         u32 ch_base;
> > >         int i;
> > >
> > >         ch_base =3D sun8i_channel_base(layer);
> > >
> > > +       /* Adjust x and y to be divisible by subsampling factor */
> > > +       src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
> > > +       src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);
> >
> > AFAICT the only difference compared to drm_fb_dma_get_gem_addr()
> > is the masking here, i.e. round_down().
> >
> > > +
> > >         for (i =3D 0; i < format->num_planes; i++) {
> > > -               /* Get the start of the displayed memory */
> > > -               dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> > > +               gem =3D drm_fb_dma_get_gem_obj(fb, i);
> > > +               dma_addr =3D gem->dma_addr + fb->offsets[i];
> > > +
> > > +               dx =3D src_x;
> > > +               dy =3D src_y;
> > > +               if (i > 0) {
> > > +                       dx /=3D format->hsub;
> > > +                       dy /=3D format->vsub;
> > > +               }
> > > +
> > > +               dma_addr +=3D dx * format->cpp[i];
> > > +               dma_addr +=3D dy * fb->pitches[i];
> >
> >
> > Where as the helper has (or used to have before the blocksize stuff):
> >
> >     paddr +=3D (format->cpp[plane] * (state->src_x >> 16)) / fb->format=
=2D>hsub;
> >     paddr +=3D (fb->pitches[plane] * (state->src_y >> 16)) / fb->format=
=2D>vsub;
> >
> > Am I missing something?
>=20
> After some headbanging on my end I see that the offset for the Y plane
> needs to be rounded down.
>=20
> But instead of reverting the whole thing and open-coding the helper
> again, could you adjust the address returned by the helper for odd
> offsets?

Yes, that's also an option. I'll do it in v2.

>=20
> And just a heads up, this also needs a clipped version of
> drm_fb_dma_get_gem_addr() as sun8i_ui_layer_update_coord() uses the
> clipped dimensions. I am currently working on this part.

Can you explain a bit more? I don't see why it needs any adjustement.

Best regards,
Jernej

>=20
>=20
> ChenYu
>=20
> > >
> > >                 /* Set the line width */
> > >                 DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
> > > --
> > > 2.43.0
> > >
>=20





