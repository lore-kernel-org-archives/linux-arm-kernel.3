Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B2BD149C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq3fXe6qq3ix8jve6B/lCKB6fSeKNV8aFXZ8E3BzHv4=; b=I/BZATYdqU2SpKHsQeqTZhL9uZ
	vv0bNOvDVfXfc7YKrYeZrVPjojQ2CgKyMhKmvyBN/22FWDWd2LprGwhnrjirbmznldsjxeVSZflg7
	hsxH+WoAweAYbG8HmPNZWWSO28tHxK/SCqCgSbU2HjcUx60aQOOORhKPz8PbErst3NcKCeycP0MzA
	nCiAEZsKMS4lfCURXngeSY+DtTWuG3kWBp4p3L/KGjzQVeGetFyrDdvOPMj+/uMh7z3rpVvOQpNyV
	PJZdTfnFb+7+CHeMVScpRfdxNmW6HI1DwerRB3wupImMLS2SdyHzzrHxowcsXyX4vstuv4Mr2GaPj
	aK8t/gEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NJT-00000004SZv-09KY;
	Fri, 25 Oct 2024 16:37:23 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NHr-00000004SLS-0ivf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:35:45 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so22004731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729874139; x=1730478939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq3fXe6qq3ix8jve6B/lCKB6fSeKNV8aFXZ8E3BzHv4=;
        b=Sov3ror+RwtFbBaxDabQSu9bTALFJiHu6zuRsvwNz6g3q86BE2oePucb7Weaa0dj8t
         29We6yPXCGWT8TQEcQhD2xMlCjYcb4hO0U27yRgh6kNhCfaYfXGh4/2M5EAY1zWk2dwR
         XPE8bW4fRSvJM/3/Y7zw0UDQwiR4RS6FD+f6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874139; x=1730478939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq3fXe6qq3ix8jve6B/lCKB6fSeKNV8aFXZ8E3BzHv4=;
        b=NW2MSwbMmklVSoqPg0S90+SFx+7yMdk8/Zfl9e+to3qPxXtYW8wpT62LRCiFbCPzFz
         k2CJKc4UYn4zSFrnvXFd+sRPOXAvelvLxUx10X4aRBsMsdWMe3RvmT7FIxQk+Bb6JP3U
         gfprALM+Tbzv8fShZqaeKLzk4H+EBlRkbPxBsBtmf+OwTl++XbdR9eoJ8P/IX3/c+SWQ
         M7cHoGIBI6bGx/y0Fh8sEbpSUfrY84VLovSBQ7P34n676l4zD+j9SwCo9MCyjWPdfrDU
         pSNJIpKf+LJwneQctMBk8PcxnKVPJRwMUmkZDLzoTfjbyHtvICN3V0snioP1xN3fDybe
         uM1A==
X-Gm-Message-State: AOJu0YzkWUf+7QtXqxIBnL+kr1mu4QZEBfZQOhjHcJFQAMS76VbsN6zj
	KCApePCgja+aCDDKCexyZ27vw9S34NR85wliVMfL3Z3ka0Lh7NojWNFxDSsdDdk1h4gVFj2ohUs
	EKExy
X-Google-Smtp-Source: AGHT+IHscKa9cwZ4cec+yKurN59/y7+ThuGIOiwtmTA03/kXGe+5A1fo8lJ+nb9WhG/F67+xtTD9kw==
X-Received: by 2002:a2e:b8ca:0:b0:2fb:b59:8167 with SMTP id 38308e7fff4ca-2fc9d5828d0mr62220761fa.39.1729874139258;
        Fri, 25 Oct 2024 09:35:39 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb453e78csm2317291fa.69.2024.10.25.09.35.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 09:35:38 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so19199741fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 09:35:37 -0700 (PDT)
X-Received: by 2002:a05:651c:2210:b0:2fa:beb5:11cc with SMTP id
 38308e7fff4ca-2fc9d582d71mr53240501fa.40.1729874137392; Fri, 25 Oct 2024
 09:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com> <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
 <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com> <b75276ff8dc2f73818ccd132530c0d3825e17888.camel@mediatek.com>
In-Reply-To: <b75276ff8dc2f73818ccd132530c0d3825e17888.camel@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 09:35:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSD9p61ePKXVOcUBGktRJkUx+KbiJXF-9QUtWE8zDt0A@mail.gmail.com>
Message-ID: <CAD=FV=WSD9p61ePKXVOcUBGktRJkUx+KbiJXF-9QUtWE8zDt0A@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	=?UTF-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "djkurtz@chromium.org" <djkurtz@chromium.org>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	=?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	=?UTF-8?B?WVQgU2hlbiAo5rKI5bKz6ZyGKQ==?= <Yt.Shen@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "littlecvr@chromium.org" <littlecvr@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, "zwisler@chromium.org" <zwisler@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_093543_445713_6E4BDC69 
X-CRM114-Status: GOOD (  32.04  )
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

Hi Shawn,

On Thu, Oct 24, 2024 at 6:32=E2=80=AFPM Shawn Sung (=E5=AE=8B=E5=AD=9D=E8=
=AC=99)
<Shawn.Sung@mediatek.com> wrote:
>
> Hi Doug,
>
> On Thu, 2024-10-24 at 13:47 -0700, Doug Anderson wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi,
> >
> > On Wed, Jun 19, 2024 at 9:39=E2=80=AFAM Hsiao Chien Sung via B4 Relay
> > <devnull+shawn.sung.mediatek.com@kernel.org> wrote:
> > >
> > > From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > >
> > > Always add DRM_MODE_ROTATE_0 to rotation property to meet
> > > IGT's (Intel GPU Tools) requirement.
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
> > MT8173.")
> > > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  6 +++++-
> > >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++------------
> > >  drivers/gpu/drm/mediatek/mtk_plane.c    |  2 +-
> > >  3 files changed, 11 insertions(+), 14 deletions(-)
> >
> > FWIW, this patch got into ChromeOS's 5.15 branch via stable merge and
> > apparently broke things. As a short term fix we've reverted it there:
> >
> > https://crrev.com/c/5960799
>
> Thank you for reporting this issue. We are currently investigating the
> bug.
>
> Since I am unable to access the Google issue tracker [1], could you
> please provide more details about this bug? The message in the revert
> commit mentions "hana/sycamore360" (MT8173) and it appears that there
> is a rotation issue in tablet mode.

Thanks for the followup. I've only been peripherally involved in the
problem, but I can at least copy the relevant bits over.

It looks as if the problem is somehow only showing up when running
Android apps on those devices, so whatever the problem is it's subtle.
The report says that the apps work OK when the device is in tablet
mode and in one rotation but the problem shows up when rotated 90
degrees. The report says that "Screen content appears inverted". To me
it also sounds _possible_ that the problem is somewhere in our
userspace.

I think Hsin-Yi and Ross are continuing to dig a bit more. Maybe once
they've dug they can add any details they find or can loop in others
as it makes sense?


> > ...apparently the patch is fine on newer kernels so maybe there is a
> > missing dependency? Hopefully someone on this list can dig into this
> > and either post the revert to stable 5.15 kernels or suggest
> > additional backports.
> >
>
> There are known issues [2] regarding forward compatibility. Could you
> confirm whether this patch is unable to resolve the mentioned problem?
> Thanks.
>
> [1] https://issuetracker.google.com/issues/369688659
> [2]
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D896964

The patches in [2] look related to alpha blending but I think they are
seeing issues related to rotation. ...so I'm going to assume it's
different? I don't have this hardware in front of me, so I'm just
going by the report.

-Doug

