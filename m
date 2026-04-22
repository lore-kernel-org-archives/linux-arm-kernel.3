Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B1BF9B5E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 08:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nzzWLRM14gCMo68Gw80lFQtpEDbPKU5oX4IPo99Eck=; b=YkKLPwsBDRlqX7Hdgl5lzIVK26
	lxMsWZkVG+s5Vf4IviAxcmNQkMpooGnbfWGVesFWVH5RD6aHAliJX0mtBbQQGRk5lVetY0R0YPfFF
	J1ke/rjWmqcxThLbejdXJjqlBqrPWvM99Vm+nLSAHcCa7o2BHEDf4SQcZ1KOPQU4rXctD5YFw1+gX
	fqRFxwDM7ufpL/Izkl1/fUsEpENWNwXXPmgbp7EJoR1Y7CA2L03l24zJy9xK3QIdJGBVSJEE3JLFO
	cEx8PmcNgo+mgJr5OnErJq2Y8Vrr09xN7mYdcK6WndRjuiBNLHHCRezWYSvAC7aUAcAEVijA48Fk/
	7mufBpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTD6-00000009nOH-2mBk;
	Wed, 22 Apr 2026 08:45:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTD3-00000009nNt-1ZtQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 08:45:26 +0000
Date: Wed, 22 Apr 2026 10:45:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776847522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5nzzWLRM14gCMo68Gw80lFQtpEDbPKU5oX4IPo99Eck=;
	b=MAD3is3Onv/bOoBKuHW1wjcyHz3hqI5+C8cujYrIRrVdVoiOk7KoPQDqeGdfS4jY4GsLsL
	5/NjXwT5Mrh7yksrlTvQ3PT/ZxGQ/OURO6/DesrngJ5MX7ca7B7Kg/AGCe64m5rlpQqjdz
	xi1VS870d+XZ7e4I+m2K0VS/L4cj+OvtThVrt1ny5H2u+H0vm9BaayokR/CiL7thy/fXVG
	kWxNmwlPTHHZe5jTDfkSPhYbrqHFd+ypj5okMZ83AptMUUuGygg+VRjBh9yCIXKbKx1pia
	oB8YQPpua44CNAZMcTstbqrHFPkwTCyWCC5pQC88/vzCL2+9Wm+Oo+Pyjqpvzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776847522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5nzzWLRM14gCMo68Gw80lFQtpEDbPKU5oX4IPo99Eck=;
	b=/Bhji4fIjCMF4t0dR952vgbdwty6z6aPQaHTJdOrpBjUy17nyVrWYVxSyPyGyzaKeRuBp9
	CZhbFmLv4gXeQLCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: New warning in linus/master
Message-ID: <20260422103218-1efdbb73-51fa-48c9-ae92-75306147d61f@linutronix.de>
References: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
 <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
 <CANiDSCviww1L1p2+MvF59Biqb6hc7WdL1J37kBjFd1NXz-Yt8A@mail.gmail.com>
 <20260422092713-4021a1a5-3a54-4260-878a-aec1bef3f8c7@linutronix.de>
 <CANiDSCtfiPDiqzhjZGoCJbLC0fRoH1HLKrvYUt7jLDYEBQHqgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCtfiPDiqzhjZGoCJbLC0fRoH1HLKrvYUt7jLDYEBQHqgg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_014525_561515_55DE8649 
X-CRM114-Status: GOOD (  36.39  )
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

On Wed, Apr 22, 2026 at 04:06:45PM +0800, Ricardo Ribalda wrote:
> On Wed, 22 Apr 2026 at 15:32, Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > On Wed, Apr 22, 2026 at 03:00:11PM +0800, Ricardo Ribalda wrote:
> > > On Wed, 22 Apr 2026 at 13:57, Thomas Weißschuh
> > > <thomas.weissschuh@linutronix.de> wrote:
> > > > On Wed, Apr 22, 2026 at 11:51:45AM +0800, Ricardo Ribalda wrote:
> > > > > Media-CI has found a couple of new warnings in the latest kernel
> > > > > version for aarch64 and powerpc. They get fixed with this patch and
> > > > > before moving I wanted to know if this was under your radar.
> > > >
> > > > Thanks for the report. I was not aware of these so far.
> > > >
> > > > > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> > > > > index 7dec05dd33b7..65914842fae0 100644
> > > > > --- a/arch/arm64/kernel/vdso/Makefile
> > > > > +++ b/arch/arm64/kernel/vdso/Makefile
> > > > > @@ -50,7 +50,7 @@ CFLAGS_vgettimeofday.o = $(CC_FLAGS_ADD_VDSO)
> > > > >  CFLAGS_vgetrandom.o = $(CC_FLAGS_ADD_VDSO)
> > > > >
> > > > >  ifneq ($(c-gettimeofday-y),)
> > > > > -  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> > > > > +  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> > > > > -Wno-maybe-uninitialized
> > > > >  endif
> > > >
> > > > (...)
> > > >
> > > > I'd like to know exactly what is going on before suppressing the warning.
> > > > It is a non-standard warning, only enabled by *some* of the vDSO builds
> > > > for some reason.
> > > >
> > > > > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/pipelines/1649144/test_report?job_name=cross-gcc
> > > >
> > > > While I was able to download a configuration from this job and also use the
> > > > same container image, I can not reproduce the issue. Is the configuration the
> > > > full one or only the template?
> > > >
> > > > Could you provide full reproduction steps?
> > >
> > > You can try repro with:
> > >
> > > work/linux $ podman run -v .:/workdir/ --rm -it
> > > registry.freedesktop.org/linux-media/media-ci/build:latest
> > > $ cd /workdir
> > > $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make allyesconfig
> > > $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make
> > > arch/arm64/kernel/vdso/vgettimeofday.o
> > >
> > > The gcc version discrepancy is because I the error was due to old gcc
> > > version and I was playing around with that... but it fails in both
> > > gcc14 and gcc15
> >
> > Ack.
> >
> > > You can try with debian testing with
> > > work/linux$ podman run -v .:/workdir/ --rm -it debian:testing
> > > $ apt-get update
> > > $ apt-get install gcc-aarch64-linux-gnu build-essential flex bison libssl-dev bc
> > > $ cd /workdir
> > > $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make allyesconfig
> > > $ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make
> > > arch/arm64/kernel/vdso/vgettimeofday.o
> >
> > Both reproducers do *not* reproduce the issue for me.
> > (It is more or less exactly what I tried before)
> 
> 
> Ok, I think I found what is going on. media-ci was forcing
> KCFLAGS=-Wmaybe-uninitialized
> 
> https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-build.sh?ref_type=heads#L29
> 
> And something has changed in the kernel in the last version that
> triggers a (hopefully) false positive.
> 
> can you try with:
> 
> CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make
> KCFLAGS=-Wmaybe-uninitialized  allyesconfig
> CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make
> KCFLAGS=-Wmaybe-uninitialized  prepare

That works!

The warning was introduced in ed78b7b2c5ae ("vdso/gettimeofday: Add a helper to
read the sequence lock of a time namespace aware clock").

It is *not* a false-positive, specifically:

do {
	if (vdso_read_begin_timens(vc, &seq)) {
		vd = __arch_get_vdso_u_timens_data(vd);
		vc = &vd->aux_clock_data[idx];
		/* Re-read from the real time data page */
		continue;

This 'continue' jumps to the end of the loop body and if the real vDSO datapage
by chance has a sequence counter of '1' will exit the loop, leaving 'sec' and
'nsec' uninitialized. My believe was that the 'continue' would jump to the
*beginning* of the loop body, which is cleary wrong. Previously there was an
inner while loop() which would make the 'continue' effectively start at the
beginning of the outer do-while loop.

	}

	/* Auxclock disabled? */
	if (vc->clock_mode == VDSO_CLOCKMODE_NONE)
		return false;

	if (!vdso_get_timestamp(vd, vc, VDSO_BASE_AUX, &sec, &ns))
		return false;

} while (vdso_read_retry(vc, seq));

vdso_set_timespec(ts, sec, ns);


I'm working on a fix.


Thomas

