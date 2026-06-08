Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A89CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOnV9Nyke9Eq832xs7Gq6zdpN0nFnRMF0XzlVrudAyk=; b=tmjCSBPvobJIIN9iqpFBHne9Ph
	QZH4NL92RrIkFFOvclTPYrKnGORFe9yBN4siq/68ODJfWlaB0zjUjz+OMXXZd3uVLJi96DI6KqAhk
	LyiRaMv64MU9j4qf6KMLnpoqj0llHsMCO7LUm2Nk3h7hOsHHvxK5c4CbuH3P7K7PZKd5ccavmtHgJ
	QA+z5kTW11f3YmYq2fmXgC/kDhJmlMIBkXLQUbw0G8+ClIbnA6qBCNG/0JifnAsTfUdpzRucA5/Xh
	JcFxXPCe9ygE9HBspEXbCkPAcA8Hw7+lHzoYW8TZvlijYGod+fxHJ7YDDHCEVfNR1IDWMYWkNV7j9
	8joupHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWsm-00000003HFw-1fey;
	Mon, 08 Jun 2026 10:07:00 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWsi-00000003HF1-3FYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:06:59 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.15])
	by APP-05 (Coremail) with SMTP id zQCowAC3F9szlCZqCWuyEg--.3647S2;
	Mon, 08 Jun 2026 18:06:44 +0800 (CST)
Message-ID: <340c213ca47dabb8bc3d260311e2fd4818bd8001.camel@iscas.ac.cn>
Subject: Re: [PATCH v3 3/5] drm/verisilicon: introduce per-variant hardware
 ops table
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 08 Jun 2026 18:06:43 +0800
In-Reply-To: <98eb7772-257f-4fa7-8e9b-51a635cb12dd@gmail.com>
References: <20260608023237.305036-1-a0987203069@gmail.com>
	 <20260608023237.305036-4-a0987203069@gmail.com>
	 <399cd127b56b4a2fb3161865a681606e04e6b2c6.camel@iscas.ac.cn>
	 <98eb7772-257f-4fa7-8e9b-51a635cb12dd@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3F9szlCZqCWuyEg--.3647S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWUXrWDtF4xAF1DJr4xWFg_yoWrGFW8pr
	1qkFy8Kr4rXrykJFy8tryvqFsxWw1xKw1Igr1UGa9Yqr1DtrnIgFW0qr93uF4kXrZ7G3Wf
	Xw4SyanIvrWrAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2wIDUUUUU
X-Originating-IP: [112.94.101.15]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030657_194699_35542268 
X-CRM114-Status: GOOD (  13.87  )
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

=E5=9C=A8 2026-06-08=E4=B8=80=E7=9A=84 17:45 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > index 1f2be41ae496..75bc36a078f7 100644
> > > --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> > > @@ -53,12 +53,6 @@ static int
> > > vs_primary_plane_atomic_check(struct
> > > drm_plane *plane,
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static void vs_primary_plane_commit(struct vs_dc *dc, unsigned
> > > int
> > > output)
> > > -{
> > > -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> > > -			VSDC_FB_CONFIG_EX_COMMIT);
> > > -}
> > > -
> > > =C2=A0=C2=A0static void vs_primary_plane_atomic_enable(struct drm_pla=
ne
> > > *plane,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0 struct
> > > drm_atomic_commit
> > > *atomic_state)
> > > =C2=A0=C2=A0{
> > > @@ -69,13 +63,8 @@ static void
> > > vs_primary_plane_atomic_enable(struct
> > > drm_plane *plane,
> > > =C2=A0=C2=A0	unsigned int output =3D vcrtc->id;
> > > =C2=A0=C2=A0	struct vs_dc *dc =3D vcrtc->dc;
> > > =C2=A0=20
> > > -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> > > -			VSDC_FB_CONFIG_EX_FB_EN);
> > > -	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> > > -			=C2=A0=C2=A0 VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
> > > -			=C2=A0=C2=A0
> > > VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
> > > -
> > > -	vs_primary_plane_commit(dc, output);
> > > +	if (dc->funcs->plane_enable_ex)
> > > +		dc->funcs->plane_enable_ex(dc, output);
> > Please note that all theae codes are for primary planes, maybe the
> > helper should be named mentioning primary. Overlay planes will need
> > a
> > different codepath because they change different registers.
> >=20
> > Thanks,
> > Icenowy
> Understood. To avoid confusion, I will rename `plane_enable_ex`,=20
> `plane_disable_ex`, and `plane_update_ex` to `primary_plane_enable`,=20
> `primary_plane_disable`, and `primary_plane_update` in `vs_dc_funcs`,
> `vs_dc8200.c`, and `vs_primary_plane.c`.

Maybe keep the `_ex` here as some operations is still on the common
codepath?

Thanks,
Icenowy

> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0static void vs_primary_plane_atomic_disable(struct drm_pl=
ane
> > > *plane,
> > > @@ -88,10 +77,8 @@ static void
> > > vs_primary_plane_atomic_disable(struct
> > > drm_plane *plane,
> > > =C2=A0=C2=A0	unsigned int output =3D vcrtc->id;
> > > =C2=A0=C2=A0	struct vs_dc *dc =3D vcrtc->dc;
> > > =C2=A0=20
> > > -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> > > -			VSDC_FB_CONFIG_EX_FB_EN);
> > > -
> > > -	vs_primary_plane_commit(dc, output);
> > > +	if (dc->funcs->plane_disable_ex)
> > > +		dc->funcs->plane_disable_ex(dc, output);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0static void vs_primary_plane_atomic_update(struct drm_pla=
ne
> > > *plane,
> > > @@ -133,18 +120,11 @@ static void
> > > vs_primary_plane_atomic_update(struct drm_plane *plane,
> > > =C2=A0=C2=A0	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
> > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 fb->pitches[0]);
> > > =C2=A0=20
> > > -	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_MAKE_PLANE_POS(state->crtc_x, state-
> > > > crtc_y));
> > > -	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_MAKE_PLANE_POS(state->crtc_x + state=
-
> > > > crtc_w,
> > > -					 state->crtc_y + state-
> > > > crtc_h));
> > > =C2=A0=C2=A0	regmap_write(dc->regs, VSDC_FB_SIZE(output),
> > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_MAKE_PLANE_SIZE(state->cr=
tc_w, state-
> > > > crtc_h));
> > > =C2=A0=20
> > > -	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
> > > -
> > > -	vs_primary_plane_commit(dc, output);
> > > +	if (dc->funcs->plane_update_ex)
> > > +		dc->funcs->plane_update_ex(dc, output, state);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0static const struct drm_plane_helper_funcs
> > > vs_primary_plane_helper_funcs =3D {


