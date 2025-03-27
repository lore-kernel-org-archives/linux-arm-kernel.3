Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BECBC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibdtL0f3H8DnAPyEw/T+T3QYX14z3U6slG7wOxVtOcQ=; b=WZQKicUciKuNh8CTLe3wxBoYNw
	FJ1YT0oFIExixtCq4DJSMk08U0MB9f1DvgnMXNflpGArue1qAk9v20QNX0MYIdQKbgNX93i9zotfA
	R1E79WpzxbJR30AuwNF68LuiRGC4wiWhPPcjnm2ohLoBS386qg98v6sActUskzLg7p1Om2vSlpEhl
	DDZej6RM4ObZ70aWi191hLd+67DJH1ZKZc7s1kmRaCvB36RXop5TGKfD+Q5B9iSgmZqtpe5jxOGF2
	PTUFeq7RvRiQQo2PQakM4tmFmlfVBpil3nLTBKHe5F9bHtRJTtK/J3gK0lW3eM4YeFTpZeHmX0JAP
	DnEOdjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqEg-0000000BXFS-1oD0;
	Thu, 27 Mar 2025 16:37:42 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqCv-0000000BWtv-43YQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:35:55 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86d69774081so589965241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 09:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093352; x=1743698152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibdtL0f3H8DnAPyEw/T+T3QYX14z3U6slG7wOxVtOcQ=;
        b=AiuXPJ9NTT5AjLa6n4CBqMptX344HScXpFsxtF1JSG1WD3Lp+N0GOGQ4LGoet229kd
         wv5wc9bGjcaJ1F7gyYqHVSnSac1+lPH5F7d9P5qRyK6rTNsSEWoSKMUEy4au4eitEM0j
         89UsRafDnX2/Ax1B9l961OZ865dPB54VL22kXALKwNbULRi/aDS5QYlHiLBdhtXLcHBd
         TtdHBPGN7tFeXBR599sk29bKyw7NcP5T0btbo9L06ty4+vWHcl2fR2gZ4gFcykzquG0S
         sYIg6uFIgmaIJllnfrPtJFJN3uvsl7CjDG3kG2zE9DacVmEwyB/hoRMKmojyoMD9dwBB
         3yQg==
X-Forwarded-Encrypted: i=1; AJvYcCVl4CkcITq48LKoZDNgsK1AlHIJEXEYGJUwVXtlu/zaTZ+DR5w95ytK/CYhHBCdiD/svsKo82cqkpzIrctm9Azl@lists.infradead.org
X-Gm-Message-State: AOJu0YxHbDfrFdVCJxbLKt4yWrcQUW8M6gUeFbirD1r1mCDLNyK13dUl
	DS+GTT117flB+v63aupLadZ5saGuXz8a6mmc59KA95uvxMflccqgHWduarxnO4Q=
X-Gm-Gg: ASbGncuMHFtF+PYThv4sT2WO/8Us/U2/umvw+v3lHQ6L6S159cIV7hU1QY4nWTErK1B
	aWSAyCCz94n7n8XAzx45TSlW7MW+TyiILMDEygsjR+gV1dZnmSA/fMeNchhwY8s7WR8n4gV1KgI
	x617w5/QwHa++u2FSN7n5NjdSRiT4nNa7GrSR3/bG8HZ3GTOIS9098OG81OUegyScRUawcLwovP
	P12vTZHkjMKgK0OBkbuCYKM8sgFUqnQ0lY3kUscM4oMa9ykfgvLzFnsPjgJqFOaCtwoNw2L1In/
	mVOiwQ6iqrw0lCgCOL93WIRBXbMvrZANrfIC7S8hbYUphI8U7SAt2fuLp9weWsoS01iwkNUS8WW
	sqJXabiz/Pys=
X-Google-Smtp-Source: AGHT+IFZjxnK+h/L0CxSmfLFHAQ0sOcgS3Og8PB1FDbklJDWdCHTdBMDL0nGMs5YkaOCuxoAUpZRTw==
X-Received: by 2002:a05:6122:8d3:b0:526:483:95fd with SMTP id 71dfb90a1353d-52604839b0dmr2014196e0c.10.1743093351936;
        Thu, 27 Mar 2025 09:35:51 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e7e06a2sm29540e0c.11.2025.03.27.09.35.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:35:51 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523edc385caso606608e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 09:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK9mYaSKXJQFClUjt2XVN2R3t+LPb4HPQlsh/N4tBWpZx0Zzlp2d+reiaxQlqblLN+3CYMij9JUf9NTFOKIuxM@lists.infradead.org
X-Received: by 2002:a05:6122:1d48:b0:520:5a87:6708 with SMTP id
 71dfb90a1353d-5260071fe18mr3630874e0c.0.1743093351421; Thu, 27 Mar 2025
 09:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com> <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com> <20250327175842.130c0386@eldfell>
In-Reply-To: <20250327175842.130c0386@eldfell>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Mar 2025 17:35:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
X-Gm-Features: AQ5f1JpeqSn4PpS1s7kqwyEJE-2D6rFE_STOfuC_nMbBosIVwkbb55ssK1rcc48
Message-ID: <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_093554_004500_BEFA4DEA 
X-CRM114-Status: GOOD (  39.78  )
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

Hi Pekka,

On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
<pekka.paalanen@haloniitty.fi> wrote:
> On Thu, 27 Mar 2025 16:21:16 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> > On 27/03/2025 11:20, Pekka Paalanen wrote:
> > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:
> > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > >>> <tomi.valkeinen@ideasonboard.com> wrote:
> > >>>> Add greyscale Y8 format.
> > >>>>
> > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > >>>
> > >>> Thanks for your patch!
> > >>>
> > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > >>>>
> > >>>> +/* Greyscale formats */
> > >>>> +
> > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> > >>>
> > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > >>> the number of bits in the FOURCC format. What do you envision
> > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?
> > >>
> > >> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > >> not required, but different fourccs for the same formats do confuse.
> > >>
> > >> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > >> possible, and if not, invent a new one.
> > >
> > > what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > >
> > > Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > > defined by MatrixCoefficients (H.273 terminology)?
> > >
> > > That would be my intuitive assumption following how YCbCr is handled.
> > > Is it obvious enough, or should there be a comment to that effect?
> >
> > You raise an interesting point. Is it defined how a display driver, that
> > supports R8 as a format, shows R8 on screen? I came into this in the
> > context of grayscale formats, so I thought R8 would be handled as (R, R,
> > R) in RGB. But you say (R, 0, 0), which... also makes sense.
>
> That is a good question too. I based my assumption on OpenGL behavior
> of R8.
>
> Single channel displays do exist I believe, but being single-channel,
> expansion on the other channels is likely meaningless. Hm, but for the
> KMS color pipeline, it would be meaningful, like with a CTM.
> Interesting.
>
> I don't know. Maybe Geert does?

I did some digging, and was a bit surprised that it was you who told
me to use R8 instead of Y8?
https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

