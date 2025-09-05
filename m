Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2814BCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pLX9mNLE1Old2BsaUGh3Hjem0q5L//LE3ZX0hufywI=; b=GZc7qNKMwWaq0xbtafjsSR7iBx
	rVOJuk7tnnGNZ89DHWUauKiRLljbtDDcL4g/9mQfRMfCWoX/x17noeRAA5mkBdvmZEf9qgmPS8l3o
	rqgvawVDs2L3TVOOuPwvtVRzPLEQhw0lavFhf0KS/bYhYqdTT6QPKnt2bDn5q2dD5SabaqiGyXjJ4
	VU+bLcHdAtL1qz89W6RpoGR3/9/wN6uLiB6ODgpaLJwYP0bhT7I1VHicsqcvLQGQXiVL5HalA44Jg
	4ZV4v8I2CdxSJaxXtEXBXNGPgjF2Y1oNocca8BU2uo7nWzEWplHD+lj5duUHNn7rKnLyc+47nUzJT
	WUPJhPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZq-00000005ZA5-2KjG;
	Sat, 06 Sep 2025 00:14:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugJc-00000005OBG-0ogn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 23:58:01 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-772627dd50aso4202957b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 16:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757116674; x=1757721474; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pLX9mNLE1Old2BsaUGh3Hjem0q5L//LE3ZX0hufywI=;
        b=XF24soqjxgtdPcBeYvwJq8iROgMTz5vmKB2j1boIvAJa8/2LbPHZ2TJAyGp1hHdlLZ
         F9sv+UoFsFay4jc4XPYuDgCOEzFRcLf8CSsqntcsdC47O8cDA4Uyv4PBRrRJfV50D63r
         /LZASSN5F2jZCwo1gCTFvWkiAyZf4dt+zuEHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757116674; x=1757721474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pLX9mNLE1Old2BsaUGh3Hjem0q5L//LE3ZX0hufywI=;
        b=QpHsDMF8N4oSiCXOF0HfgBPrlWZxDnWPO/WQVOzQLUwmlrTNMAj+VO7KGNRPC+9XLu
         VyxtXl3W2XM9nc8JvI67Pbbk8qJwIiORElPexSL8CLyAbTTBp6ltZFhJrIHPUY+HVD/Q
         kseLEFtd+4btJbMl4w3x8+1eO3Mn141tEu1qUME7upNsd/DuuoEkyiaQVfEJYoXsxmpd
         +7I2LkCW3c4Fr19w0s8TYpDK2oZRE4xKJLJqBwzzTZKhrbhLyWa7Cs+wN4D/RvUntfIE
         PSUL/sfndsFtqyHQQAg9JOaYMbZHoAew8h9vOkNpzqZv4qkfTuHTetgc49uht7ccOcTX
         tdlw==
X-Forwarded-Encrypted: i=1; AJvYcCVjuwXZ7F0AlJlIMUr1WfUAacfcswDQX3jBNyzNvBpoVInx5Bfvfc9wH/fBEMC0Yiz6/tuUMlVGHL8M+FrbWeeM@lists.infradead.org
X-Gm-Message-State: AOJu0YxKd/sfJY/KHk/KlKFsQrbRSd2DpZ0hBy6y6AoKeYgqJ2466rnR
	/7r1hfapOObTh4U0u7WqbKq/mSRrFh6NIKkZROQHjBNARVOlozg8zChgAeKLYJ7LuPLlIwpVWlk
	otA8=
X-Gm-Gg: ASbGncu+opb/H/HbMnPuiotkdHKRbSg+5FfFQet/9/qNw8W42ByJYgzJZvlt+2AVrOq
	eQ8bYEbeLpeHoFmh7Al/IPNCgveN/ymciq+n9QGwQyqbrjXCJqHurFqPSdyvZZJI8T/G0GfVQvj
	oyWG+tnlCDksi4cibl3UhVkgsVooMjAMZceuyirPNVGuf1RBRRUOm2rVS/1HG9yrSJvlmmK3L5d
	wIPUz4Y0OOkLm6OSa7HcutjcuMFwYPM9X5PBkIU4BUTFy9aUUQgFa1KsWsrKBd+T+dV0VH5dUaN
	H8cdOZ9RFK17L1/myDOZ+Z5rxSML1OvmynPKk2dNnaHiIReMSk6/p6+rXkOOhrduRBFH0lUJxFp
	1/fxA/dpQbpE3H/MgF/0xK4//vohm8+VE0J8wtj2Yuc4Kr7xp0+86JE659zaZCITPCw==
X-Google-Smtp-Source: AGHT+IHyjclkMXKpfvQB6q0WKi4BpBEnZTAPMTQNfFT5WMpZQnyQzVfnz6EuXyKuScfUvmJKXvEhUw==
X-Received: by 2002:a05:6a21:3287:b0:243:6f68:a2f6 with SMTP id adf61e73a8af0-24e852695demr6463737637.20.1757116673737;
        Fri, 05 Sep 2025 16:57:53 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb15f50d6sm7109257a12.0.2025.09.05.16.57.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 16:57:52 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so2673651a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 16:57:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvdMA04sF4A0NXzBFNu1tAdGtaOip2DUv4ytjOIWxBVsDiAMk7+N7tsMt6HhL/9fuM6NI8yF5ZJZ6qX3/Elqmb@lists.infradead.org
X-Received: by 2002:a17:90b:4fd0:b0:325:15bf:4dc2 with SMTP id
 98e67ed59e1d1-32d44f86e71mr623965a91.0.1757116669514; Fri, 05 Sep 2025
 16:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
 <CAEEQ3wmBvevbkP8XmwR0_q_1QWQsie5g0UUxTFm6ovS1m41pEQ@mail.gmail.com>
 <CAD=FV=UzUCPtwuQRFR0SkAkh63MbzMefxNYmiOBxCemL3P_+EQ@mail.gmail.com> <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
In-Reply-To: <CAEEQ3wmLOjZxVh_vBhmctH-u_ZSxnyg0GiN-_e_4v8_pfxcbSw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Sep 2025 16:57:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
X-Gm-Features: Ac12FXzUu2N-pcZbzJSHRvrPWYA7cVEhjyHs0eCe7xSTQbillcbYzLxLmPy77G0
Message-ID: <CAD=FV=XaSP2A7Dufrxt1DUUznF9Yk-qdBY3wbE03x4_L8HJLSQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_165800_263800_7F224E8D 
X-CRM114-Status: GOOD (  31.38  )
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

Hi,

On Wed, Sep 3, 2025 at 4:56=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.com>=
 wrote:
>
> Hi Doug=EF=BC=8C
>
> On Wed, Sep 3, 2025 at 1:04=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Sun, Aug 31, 2025 at 10:57=E2=80=AFPM yunhui cui <cuiyunhui@bytedanc=
e.com> wrote:
> > >
> > > Hi Doug,
> > >
> > > On Sat, Aug 30, 2025 at 5:34=E2=80=AFAM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Wed, Aug 27, 2025 at 3:10=E2=80=AFAM Yunhui Cui <cuiyunhui@byted=
ance.com> wrote:
> > > > >
> > > > > Move watchdog_hld.c to kernel/, and rename arm_pmu_irq_is_nmi()
> > > > > to arch_pmu_irq_is_nmi() for cross-arch reusability.
> > > > >
> > > > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > > > ---
> > > > >  arch/arm64/kernel/Makefile                   | 1 -
> > > > >  drivers/perf/arm_pmu.c                       | 2 +-
> > > > >  include/linux/nmi.h                          | 1 +
> > > > >  include/linux/perf/arm_pmu.h                 | 2 --
> > > > >  kernel/Makefile                              | 2 +-
> > > > >  {arch/arm64/kernel =3D> kernel}/watchdog_hld.c | 8 ++++++--
> > > > >  6 files changed, 9 insertions(+), 7 deletions(-)
> > > > >  rename {arch/arm64/kernel =3D> kernel}/watchdog_hld.c (97%)
> > > >
> > > > I'm not a huge fan of the perf hardlockup detector and IMO we shoul=
d
> > > > maybe just delete it. Thus spreading it to support a new architectu=
re
> > > > isn't my favorite thing to do. Can't you use the buddy hardlockup
> > > > detector?
> > >
> > > Why is there a plan to remove CONFIG_HARDLOCKUP_DETECTOR_PERF? Could
> > > you explain the specific reasons? Is the community's future plan to
> > > favor CONFIG_HARDLOCKUP_DETECTOR_BUDDY?
> >
> > I don't think there are any concrete plans, but there was some discussi=
on here:
> >
> > https://lore.kernel.org/all/CAD=3DFV=3DWWUiCi6bZCs_gseFpDDWNkuJMoL6XCft=
Eo6W7q6jRCkg@mail.gmail.com/
> >
> > -Doug
> >
>
> I=E2=80=99ve read your linked content, which details the pros and cons of=
 perf
> watchdog and buddy watchdog.
> I think everyone will agree on choosing one as the default.
> It seems there=E2=80=99s no kernel/watchdog entry in MAINTAINERS=E2=80=94=
what=E2=80=99s next
> for these two approaches?

I guess to start, someone (you?) should send some patches to the list.
Maybe one patch to make buddy the default and one to change the
description of the "perf" lockup detector say that its usage is
discouraged, that it might be removed, that people should use the
"buddy" detector instead, and that if there's a reason someone needs
the "perf" detector instead of the buddy one then they should make
some loud noises.

You'd want to CC folks who were involved in recent watchdog changes
and make sure to CC Andrew (akpm). If folks react positive and Andrew
agrees then he'll likely land the the patches and we'll have made
forward progress. :-)

-Doug

