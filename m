Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5CAF8E4BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYGvKR169qobRnTdQfak1Kyzy8QQtDe/iStEp2kI73Y=; b=hSO865isicJj5017Gw+v6Sf4eE
	DcUA5wpE6hSGcba+1yIrQbe0Eq8Ikz90DvMKkXxp9Y8xqKe97CIJge+FCcIzAsJzdsk/uDO02wQtq
	yo1k51fqV1rdoTEd1IzM+jEg3I+3uscCn7TGo9kwgza10uG6AO41YgaU6DgW2oMd9LeXGWaCZvj1Z
	0xmV2Pct6/tDpLi/wLIQRGAamehBiYeBMnGo2acaDvyYSIXkwrxC+/fD8X73HMWQzVZtA6beEqLpj
	lGWvpEJK08z/pUL9TMuo7IXHoQnkVZ1bqdkTq0AdHA37qKp/ejyDnwLK1GLe7TTZcxDAc3F22liAk
	Zy5F19Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDe3Q-00000003daN-3AXU;
	Fri, 17 Apr 2026 07:55:56 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDe3N-00000003dZg-2529
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:55:55 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso237538241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776412552; x=1777017352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYGvKR169qobRnTdQfak1Kyzy8QQtDe/iStEp2kI73Y=;
        b=n8nA/8e640So8makRu/J67HnqTzMjXTSw7Exyr/xQT7yQbPm0eTwVY0KtVXd/jJfc8
         u2s7QB1GjXRmz3TTIo+EZC/xQGiRsTamaPRN23i5QgBal0kYy9r6UxJ9yiT4YoBq0SE9
         W2MPnFwl7D+8Gq89G02swb5B3rYxTovGYzA3H+5FK3aTZGV+JSYblWXQaV6hJ6Hn9ud+
         dJV8nGtWrGNaiZQjWjKPewjAFxLyeVOqRdOLEGy8NXYlDLgUHnbzvVUgE4BIcBu1tMsY
         EXahbBWKXv6XNJ2wPyfmNf/1rVSQ6hd7x1e2fIIw+DOKW7WMn8qZgwHYSqAniiIZDAKN
         uvew==
X-Forwarded-Encrypted: i=1; AFNElJ9ByaNNmS5w/W32OdbpDpScjCU/lpVjW/gRQFGx3X6/e986eSc91JUMaNEVMO3v13sjl0o7ZcCsJXGqw0rfrEMl@lists.infradead.org
X-Gm-Message-State: AOJu0YyhB90hT+TO+aUVia6zLEE7ydo0yOQ/5MiwKoaBaDoq09VF4hd7
	gKGkz5jh2PDelknzM9i5zvuxUj7s7TO1tFmfb7hS49fXU5X7pCVZCJ5HHG3MaKat
X-Gm-Gg: AeBDieuCtRAV6ycZ78fylsHUtNV0cY9CRz9853WLABoNwsxHGq4qzVl0OLlAKLsSM3T
	EurnF8OjQ+I6gpSN5I7s8uiBX9eYbNbcz2yrmi0QMcAsR5D6zpemdXxTCgpg2LOvemJSmvXu/+I
	lFsyCun2Q7oyTSNq8xNNsoa1mMafcppbaNBIeEDKTKcY7I8nCZVCwExS+vhMj7bYO32FgzPoUSI
	XQbyaXS4Anz07dQ0ZraFmgtt4n1wV59Z9W94m0UaRz+2MB1gz+5Fpw/DWdil4qlI98DUYfHLV/Z
	eLH7xT82/bqaPoYAAiYxSTYsRaCioA9pH8Ui5ye+BNsV1DgULFtMp+lmVkXYAMmg17EtAs80DmF
	tQTqEiAu/AxzV+sszX+2gCU+q5H2wjXrcHf1+pGXj5R0rfMTtGXnmBlvKbQ41aC3xjAOR2h/e3q
	ifFB7uCuJ1igM66ndBLxAd05bxyR9sw6FAojiz5XaVyzrLy+/s50oGLI6XXYqiPPXdt5/YwwU=
X-Received: by 2002:a05:6102:50a7:b0:601:f85b:efeb with SMTP id ada2fe7eead31-616f518b494mr643701137.9.1776412551756;
        Fri, 17 Apr 2026 00:55:51 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61747cb501asm306749137.7.2026.04.17.00.55.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 00:55:51 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6058ac0ebceso276657137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:55:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UpqNRX1WGRZWkQY+X6Two/wKQ+f/6nA1Q500pPRKWE/nIb6hrW6Ynd9tQtOqvKyp9yiB4ZhXFmkv6Z4dTfNDX@lists.infradead.org
X-Received: by 2002:a05:6102:4a84:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-616f4b50373mr742219137.3.1776412551117; Fri, 17 Apr 2026
 00:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260416131810.3116408-1-thierry.reding@kernel.org> <aeEm5DavehkPmSgl@darkstar.musicnaut.iki.fi>
In-Reply-To: <aeEm5DavehkPmSgl@darkstar.musicnaut.iki.fi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2026 09:55:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxkOeAZqPsVRecOmQV+n=+ey=nFcdduiXvs9LBj-nNQQ@mail.gmail.com>
X-Gm-Features: AQROBzAxAj1dJZMvY5l2s199UA8tSOX5OgUQyonlFdS__wBHgEBXO25Dv2sGHpo
Message-ID: <CAMuHMdVxkOeAZqPsVRecOmQV+n=+ey=nFcdduiXvs9LBj-nNQQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Move Peter De Schrijver to CREDITS
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Thierry Reding <thierry.reding@kernel.org>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_005553_593425_C57806CD 
X-CRM114-Status: GOOD (  22.36  )
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

On Thu, 16 Apr 2026 at 20:14, Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> On Thu, Apr 16, 2026 at 03:18:10PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Peter sadly passed away a while back. Paul did a much better job at
> > finding the right words to mourn this loss than I ever could, so I will
> > leave this link here:
> >
> >   https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u
> >
> > Co-developed-by: Paul Walmsley <pjw@kernel.org>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>
> Thanks for doing this. I think also the m68k work should be mentioned?

Indeed: Apollo Domain workstations, and Ariadne and Hydra Amiga
Ethernet.

Also: IBM PS/2, Microchannel, and Token Ring support.

Peter is also still listed as the contact info in
Documentation/ABI/testing/sysfs-driver-tegra-fuse
and as DT bindings maintainer in
Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml

Thanks!

> > --- a/CREDITS
> > +++ b/CREDITS
> > @@ -3645,7 +3645,13 @@ D: Macintosh IDE Driver
> >
> >  N: Peter De Schrijver
> >  E: stud11@cc4.kuleuven.ac.be
> > +E: p2@mind.be
> > +E: peter.de-schrijver@nokia.com
> > +E: pdeschrijver@nvidia.com
> > +E: p2@psychaos.be
> >  D: Mitsumi CD-ROM driver patches March version
> > +D: OMAP power management
> > +D: NVIDIA Tegra clock and BPMP drivers, among many other things
> >  S: Molenbaan 29
> >  S: B2240 Zandhoven
> >  S: Belgium
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ef978bfca514..ffe20d770249 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26145,7 +26145,6 @@ T:    git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
> >  N:   [^a-z]tegra
> >
> >  TEGRA CLOCK DRIVER
> > -M:   Peter De Schrijver <pdeschrijver@nvidia.com>
> >  M:   Prashant Gaikwad <pgaikwad@nvidia.com>
> >  S:   Supported
> >  F:   drivers/clk/tegra/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

