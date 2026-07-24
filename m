Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91484C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMI8dp4d8PY6sATbYk9KDFOebbCxDBHOK1s8U533Alo=; b=xtSGeuBkY0bz3q6LQeesEwKmoM
	r3wtUPfdmlsbGUktw0Cu72rBxzUklvvlCb3RxtgoKYrkISstNeR8gnGabOi/FCuNaA7pqkTyDSNg/
	4wFsWrph2ooIOUZNdih0BTP7a4AZewcYwrGRP/ShHhHDDwn0jeqhK7264taVa9TzbCeyRogkLg/rI
	4nbvg9KWNQgTeM2TAbwy/Pc5B0tOeZZ6WMXBH89xj1mreO/dzC7oHHkiY0/zSjpcYoAMUVZXkH91m
	xzi9SRiRwskP/dvTp91WkwMBOxPkzLNiUCWHlGddIXmsxexICShcSeARzOQN8uP2LYLAsVKFCkkDb
	eczFDNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHn5-0000000GhgM-01l8;
	Fri, 24 Jul 2026 15:26:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmg-0000000GhWw-0uKw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:25:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B40C4162A;
	Fri, 24 Jul 2026 15:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36621F00A3D;
	Fri, 24 Jul 2026 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784906757;
	bh=MMI8dp4d8PY6sATbYk9KDFOebbCxDBHOK1s8U533Alo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PhBbKBp2MjpNeojbrYeoPnv2MHKD1gIjmgzezQSDBWY8ZJmyUBzA4vzXLTYBd8h3J
	 t49APow/SP+0ho4zhhuDPQRefq06heR6IDK6XNtf8Cf21NQCE0V9oE+CAHQVIcovz1
	 SYBFzLl/Hq38+HRG3i0jNDcdxHSKQc7LB6Fq5J4A=
Date: Fri, 24 Jul 2026 17:25:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <2026072428-ungodly-outsource-b20c@gregkh>
References: <20260724050645.223799-1-ebiggers@kernel.org>
 <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
 <20260724150932.GA6763@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724150932.GA6763@sol>
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

On Fri, Jul 24, 2026 at 08:09:32AM -0700, Eric Biggers wrote:
> On Fri, Jul 24, 2026 at 05:04:46PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 24, 2026 at 02:47:48PM +0000, Bartosz Golaszewski wrote:
> > > On Fri, 24 Jul 2026 16:14:14 +0200, Eric Biggers <ebiggers@kernel.org> said:
> > > >
> > > > And with the defaults QCE is *never* used.
> > > >
> > > 
> > > It's almost EOD here and I'm going to disconnect for the weekend but I just
> > > wanted to say before I leave: this has never been a reason for an aggresive
> > > removal of any driver. We remove drivers when we stop supporting entire
> > > platforms, not mostly unused drivers on actively *supported* platforms where
> > > they can still be used for experimentation and testing. I'm fine with dropping
> > > this from arm64 defconfig but with fixes, the BROKEN tag should be removed
> > > and I definitely object to removing it from the tree. How many people still
> > > use greybus? Should we drop it from the kernel too? And I'm saying it as
> > > a project ARA alumni. :)
> > 
> > I agree, if someone is willing to maintain it, and there are actual
> > in-kernel uses of it (meaning not just a stand-alone library that can
> > never be called either by userspace or hardware), it should stay.
> 
> What would we be considering the in-kernel uses to be, then?  Just
> wiring it up to the framework is enough, regardless of actual use?

I was meaning that we just don't want to have code lying around that is
impossible to use.

I'll defer to the subsystem maintainer if they want to remove it or not
here, as that's their call, not mine.

But really, if someone wants to maintain it, no matter how slow it might
be, I don't see the harm in keeping it if it's not causing any other
problems.

thanks,

greg k-h

