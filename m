Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5F2F94CDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqWPSH9orhqk1QAO9hwmlkYDMAf9Dazei8dWQ2yLik0=; b=FxZVU8aqx0dxJHkBHIrv1W1Dbt
	WLVz149/RL/gMWs/4gXxjtYH0muedhDmSo0Nom8iXyIg9X/oso1Dr4+PH5py2bd8h5jzNy9GjiX4Y
	GeX32scIot6S++GCc+h0hBgAJoQvEEOSK/sOvaD3b7Y3N5/ZH/+grJbKQd15TGUvci1ho9dA2KFiO
	3qNCNuLIDhqOOMoS4lKd8cAhpx+LMbYfJlwVKGkDod1GauQxUsyyd5YRSp2fivTnwA4sSjDdt7qV1
	Mj+CHXiAzymGe7oxtHSlUWNMMrdChgHhZybvcphiYLmiYDRqlUI3bcSVRQgSK+rU/KO64zVPwYhMi
	DC1N0l4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFS4H-00000009jKM-0E5Q;
	Wed, 22 Apr 2026 07:32:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFS4E-00000009jJy-1OhM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:32:15 +0000
Date: Wed, 22 Apr 2026 09:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776843131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqWPSH9orhqk1QAO9hwmlkYDMAf9Dazei8dWQ2yLik0=;
	b=HGuqX591fOx4yUoKbPFM3AFnEj4TNUtdJlqS+09QNrk+lg6EdJ54hu0hlVKN9TC//Dlb/B
	z9yH4pYM6L62+z/gkWjipQflovPh3Oa/xEF1N+j+y2xTjOTqMOEPbWaxmniMSiLlXtsfX/
	HZuudN0IQpcRD+DnLrzVQ/ZoSoDVwstsv8/LLrZFEsO+A7ZdG2/HtljUDkAgkwcdW9jHa6
	bLRPitpEl2B+or7HlfZHV2Xh6UWQFOLA264zEm+aoj1RtROfTLHu9eZ/4HIK09RNlygdDp
	E4sAlAMH/7rgRYiKYn9gW2QvyiRzgJxilh7GS8AVmz0tkai8d7+IuH3xssRiMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776843131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqWPSH9orhqk1QAO9hwmlkYDMAf9Dazei8dWQ2yLik0=;
	b=vA6bVzJf/I9G8QEzLBWv5aZcIXcu70EFV/3tqET1xHv2nKF+Jj51HQlj7efTfkGBhadOmY
	b/J/+85f8+H7QcDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: New warning in linus/master
Message-ID: <20260422092713-4021a1a5-3a54-4260-878a-aec1bef3f8c7@linutronix.de>
References: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
 <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
 <CANiDSCviww1L1p2+MvF59Biqb6hc7WdL1J37kBjFd1NXz-Yt8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCviww1L1p2+MvF59Biqb6hc7WdL1J37kBjFd1NXz-Yt8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_003214_542162_3B221AA1 
X-CRM114-Status: GOOD (  27.21  )
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

On Wed, Apr 22, 2026 at 03:00:11PM +0800, Ricardo Ribalda wrote:
> On Wed, 22 Apr 2026 at 13:57, Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> > On Wed, Apr 22, 2026 at 11:51:45AM +0800, Ricardo Ribalda wrote:
> > > Media-CI has found a couple of new warnings in the latest kernel
> > > version for aarch64 and powerpc. They get fixed with this patch and
> > > before moving I wanted to know if this was under your radar.
> >
> > Thanks for the report. I was not aware of these so far.
> >
> > > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> > > index 7dec05dd33b7..65914842fae0 100644
> > > --- a/arch/arm64/kernel/vdso/Makefile
> > > +++ b/arch/arm64/kernel/vdso/Makefile
> > > @@ -50,7 +50,7 @@ CFLAGS_vgettimeofday.o = $(CC_FLAGS_ADD_VDSO)
> > >  CFLAGS_vgetrandom.o = $(CC_FLAGS_ADD_VDSO)
> > >
> > >  ifneq ($(c-gettimeofday-y),)
> > > -  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> > > +  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> > > -Wno-maybe-uninitialized
> > >  endif
> >
> > (...)
> >
> > I'd like to know exactly what is going on before suppressing the warning.
> > It is a non-standard warning, only enabled by *some* of the vDSO builds
> > for some reason.
> >
> > > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/pipelines/1649144/test_report?job_name=cross-gcc
> >
> > While I was able to download a configuration from this job and also use the
> > same container image, I can not reproduce the issue. Is the configuration the
> > full one or only the template?
> >
> > Could you provide full reproduction steps?
> 
> You can try repro with:
> 
> work/linux $ podman run -v .:/workdir/ --rm -it
> registry.freedesktop.org/linux-media/media-ci/build:latest
> $ cd /workdir
> $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make allyesconfig
> $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make
> arch/arm64/kernel/vdso/vgettimeofday.o
> 
> The gcc version discrepancy is because I the error was due to old gcc
> version and I was playing around with that... but it fails in both
> gcc14 and gcc15

Ack.

> You can try with debian testing with
> work/linux$ podman run -v .:/workdir/ --rm -it debian:testing
> $ apt-get update
> $ apt-get install gcc-aarch64-linux-gnu build-essential flex bison libssl-dev bc
> $ cd /workdir
> $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make allyesconfig
> $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make
> arch/arm64/kernel/vdso/vgettimeofday.o

Both reproducers do *not* reproduce the issue for me.
(It is more or less exactly what I tried before)

Please note that this line does not work in general:
$ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make arch/arm64/kernel/vdso/vgettimeofday.o

The vDSO object files can not be built in this way like regular kernel object
files and will produce a compiler error, but not the one under discussion.
Instead the vDSO on arm64 is built during the 'make prepare' phase.
(Other architectures work differently, of course...)

(...)


Thomas

