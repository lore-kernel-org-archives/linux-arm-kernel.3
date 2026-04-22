Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF80FF94CDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7FPVHJoaG3puv6XWup3ZPoz+GkNPFrTTayyBuc9srY=; b=td+V6j09Z526Pp0uKev34Bc4Mo
	6zax3EGvBThts41Ryo7Hdcr+Uabhp3RP03+dkiD5BFoQtV4XeN8GNRatJX76BzkeaM1k8qiDubdMI
	tMbpuI4VbHAtSaOhLskHT1yzq3wgmKgEXn5AeWxXxfdMkGev0Iz06Eb1jF4Jdo+ZjVIIIQHs47RoD
	nHK0H2aYU0O90B4hc5lKJXl6xvii60fU7XXVf7epkDH1JnJZ1hk0WtFhHYABTqQ/V7Jf2ieqmJHHw
	/SZ82wsUjDhO7NxVWAS4w6c/3B9CfF8ELtG+3i1pjyraZGqrGDxLXSftQCkCXO9ou6kx/BSRovQre
	LVI7AH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRZY-00000009gzr-3ZmI;
	Wed, 22 Apr 2026 07:00:32 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRZV-00000009gzM-1Lwa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:00:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ba9ad0fbc3aso210963766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 00:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776841227; x=1777446027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7FPVHJoaG3puv6XWup3ZPoz+GkNPFrTTayyBuc9srY=;
        b=hlAUAuHsZb0wViHLHyA43WTWk0pZv0iEBWMuRc3T72zsp0XdXsTM/41v9RvFaIEOO8
         ogGM8eDTsG+02iKWv6jcO4uOpk5lICxwuNSCRBwakV337N+7fLWM36h21c/tx5SYLx+8
         OSgjSXoPKh+DUrn6lnrLmmdAz2cxYv09zt6FQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841227; x=1777446027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7FPVHJoaG3puv6XWup3ZPoz+GkNPFrTTayyBuc9srY=;
        b=kQamYFmLXIZ7XKoICt+yM0YRa5HjmOFE7wcebpfMFRbMW3M8W7VAE5LNJ8XUyPkNI2
         Izh/Lb09KGgMocDNaQmStTh5hYYvfT2oxsAsGegaJCS5fcSjo0WEB1J6eo1cjW4OAq8T
         YVyoSpSnnDjb0QA1gx2+TeN1W2RVQALz2MMDPpj+fsXkQcv+sC7mzNHk6BIMcXoIyO6d
         LGoHFBWqUA8RwWESHicvXj0NIJewctRpWy1e6C9Vw1Bhp4fnlAAYpzHBM2QQ2vAgIdfj
         lJx6l/NYx21EeZjFmMQutYIvCvLEEoUR10RDvKPpdrcD+xGSmZ+7TIMv6LLXkytUbO0N
         BNqg==
X-Gm-Message-State: AOJu0YwrpClzijblOl1buZ/On4mWZ0kVImtXiL/XSH0afWIW2YzM2c3v
	0Wpru2vjcZyCXJfQJ/JLfD9iHRfh4gZKy83kmibubnyTmQCzBHPX4pQcfIQVfd635hl8mLJ2+ru
	DhcevdQ==
X-Gm-Gg: AeBDiesXO0u9zKjdoFuUtfBrzr9iVCkmMMrTIUCFkPzNNHW6MzW09RmLVttEvQqZZ0a
	dBUivuzIO6jSJCdebfUlq/SIZ4dQ327+FIdefulXuCFYQ/d8sHK00iTbjtH18RrOx8T1UTmjpOV
	ydGUQQ4HcvbzOPuz8R3t5XBcIOzJupcIYErgBr60fo7rr4nO11YB9h6eUo9+i3Ya9rzSV/DhSgQ
	zx+aIlml69RmiyKtwUoSgNsGp7T1/HAZsuePZj0abjk9LHa097WDhgI+Lp5BDKd77V58Z5E7u6O
	RbP04zlhkmE9Hk8xLyunV/T0cS67FwLB4rGFv4YWyynmX3NCqcMdIj/SW9lhgHEl1S+MpLATcAU
	IYYue9RbzlS8ySPJf9nyN/n3Aj3EmLs5UtsQd+sgqkAQ3y6VxOuBUKDazjtXMnOVDJGgBPJzac6
	jsFnS6zh4jqenJbLW5KIGdhhC/kK02fsGwUwHCCMq6n6nFk1ggD0d6JL8UrvdU6RK0dN514c8=
X-Received: by 2002:a17:907:6a11:b0:b9c:9594:e00 with SMTP id a640c23a62f3a-ba418982bd2mr1137510166b.1.1776841226581;
        Wed, 22 Apr 2026 00:00:26 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1c38csm506646066b.41.2026.04.22.00.00.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:00:26 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba9ad0fbc3aso210954166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 00:00:26 -0700 (PDT)
X-Received: by 2002:a17:907:72c6:b0:ba6:1412:9339 with SMTP id
 a640c23a62f3a-ba6141295bfmr736745866b.20.1776841224135; Wed, 22 Apr 2026
 00:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
 <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
In-Reply-To: <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Apr 2026 15:00:11 +0800
X-Gmail-Original-Message-ID: <CANiDSCviww1L1p2+MvF59Biqb6hc7WdL1J37kBjFd1NXz-Yt8A@mail.gmail.com>
X-Gm-Features: AQROBzBGVi8LEvYMOBvlvkNfmwMd-5JBUrvgcCu22OEXpA-bBMJrHFL2pdRz-k8
Message-ID: <CANiDSCviww1L1p2+MvF59Biqb6hc7WdL1J37kBjFd1NXz-Yt8A@mail.gmail.com>
Subject: Re: New warning in linus/master
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_000029_432432_35883DC1 
X-CRM114-Status: GOOD (  30.08  )
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

Hi Thomas

Thanks for the prompt reply

On Wed, 22 Apr 2026 at 13:57, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Hi Ricardo,
>
> On Wed, Apr 22, 2026 at 11:51:45AM +0800, Ricardo Ribalda wrote:
> > Media-CI has found a couple of new warnings in the latest kernel
> > version for aarch64 and powerpc. They get fixed with this patch and
> > before moving I wanted to know if this was under your radar.
>
> Thanks for the report. I was not aware of these so far.
>
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/M=
akefile
> > index 7dec05dd33b7..65914842fae0 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -50,7 +50,7 @@ CFLAGS_vgettimeofday.o =3D $(CC_FLAGS_ADD_VDSO)
> >  CFLAGS_vgetrandom.o =3D $(CC_FLAGS_ADD_VDSO)
> >
> >  ifneq ($(c-gettimeofday-y),)
> > -  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
> > +  CFLAGS_vgettimeofday.o +=3D -include $(c-gettimeofday-y)
> > -Wno-maybe-uninitialized
> >  endif
>
> (...)
>
> I'd like to know exactly what is going on before suppressing the warning.
> It is a non-standard warning, only enabled by *some* of the vDSO builds
> for some reason.
>
> > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/pipelines/16=
49144/test_report?job_name=3Dcross-gcc
>
> While I was able to download a configuration from this job and also use t=
he
> same container image, I can not reproduce the issue. Is the configuration=
 the
> full one or only the template?
>
> Could you provide full reproduction steps?

You can try repro with:

work/linux $ podman run -v .:/workdir/ --rm -it
registry.freedesktop.org/linux-media/media-ci/build:latest
$ cd /workdir
$ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make allyesconfig
$ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
arch/arm64/kernel/vdso/vgettimeofday.o

The gcc version discrepancy is because I the error was due to old gcc
version and I was playing around with that... but it fails in both
gcc14 and gcc15

You can try with debian testing with
work/linux$ podman run -v .:/workdir/ --rm -it debian:testing
$ apt-get update
$ apt-get install gcc-aarch64-linux-gnu build-essential flex bison libssl-d=
ev bc
$ cd /workdir
$ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make allyesconfig
$ CROSS_COMPILE=3Daarch64-linux-gnu- ARCH=3Darm64 make
arch/arm64/kernel/vdso/vgettimeofday.o

Regards!

>
> > CONFIG_CC_VERSION_TEXT=3D"aarch64-linux-gnu-gcc (Debian 15.2.0-16) 15.2=
.0"
>
> The linked test log shows GCC 14.2, not 15.2.
> Not that I could reproduce it with either one...
>
> >   SYNC    include/config/auto.conf
> >   CC      arch/arm64/kernel/vdso/vgettimeofday.o
> > In file included from <command-line>:
> > In function =E2=80=98vdso_set_timespec=E2=80=99,
> >     inlined from =E2=80=98do_aux=E2=80=99 at /workdir/lib/vdso/gettimeo=
fday.c:266:2,
> >     inlined from =E2=80=98__cvdso_clock_gettime_common=E2=80=99 at
> > /workdir/lib/vdso/gettimeofday.c:293:10,
> >     inlined from =E2=80=98__cvdso_clock_gettime_data.constprop=E2=80=99=
 at
> > /workdir/lib/vdso/gettimeofday.c:306:7:
> > /workdir/lib/vdso/gettimeofday.c:104:26: warning: =E2=80=98sec=E2=80=99=
 may be used
> > uninitialized [-Wmaybe-uninitialized]
> >   104 |         ts->tv_sec =3D sec + __iter_div_u64_rem(ns, NSEC_PER_SE=
C, &ns);
> >       |                      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> > /workdir/lib/vdso/gettimeofday.c: In function
> > =E2=80=98__cvdso_clock_gettime_data.constprop=E2=80=99:
> > /workdir/lib/vdso/gettimeofday.c:242:13: note: =E2=80=98sec=E2=80=99 wa=
s declared here
> >   242 |         u64 sec, ns;
> >       |             ^~~
>
> The same pattern is used in some other do_ handlers, which do not generat=
e this
> warning. I also can't immediately see what is wrong.
>
> (...)
>
>
> Thomas



--=20
Ricardo Ribalda

