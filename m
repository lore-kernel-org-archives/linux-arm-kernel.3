Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877DCC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pkg/l0Fg6KNScIDEKDJlmLyaPEVAH54Yt5weFxUR+A=; b=JsFEc/54SG0jWsGRLUAHfKU2lO
	ZPxtyHfoPDR+dJ2QYVVeA1aLciZO6lbVzt59cpWkqAyXJQg7rnT+A3yen3sNI4DllErfvNvzOwemd
	XGXr4BKT34kvUV3ARkzfQ1lyxPS5ZQtPABxIdeSRtRsLTi8olpvvctbny6shQFGXtLJ0kigLxGOC6
	hwYjdpgWAvC1v+q9ORVbH45Z89zYe9VeJ1HSczg5E7ixFsbdg1oFRTs/dn3Lyr1kQzInVljtI5ZpE
	a/25CGgSMW/Uq5697IWNvLQ2OpSqaCp926Mtmb/aj0loh02ctC3gGncp9CdiJuZ6earUbcOQ80jl8
	piH5oLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIDS-0000000GlLF-1wRg;
	Fri, 24 Jul 2026 15:53:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIDR-0000000GlL6-2it4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:53:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8FD3413C8;
	Fri, 24 Jul 2026 15:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714891F000E9;
	Fri, 24 Jul 2026 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784908416;
	bh=2pkg/l0Fg6KNScIDEKDJlmLyaPEVAH54Yt5weFxUR+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KDmoa1B+Gj6qoarRUqhbGgjYjd4YwbQOMHypVrttD5ZBcUzGoHr6EooKSSd6xFQoP
	 6s5yVuLB6QFB0fMpjUywcfAPXtTcEbnurC6PmYF3M7bofTN6DJaLHVuTgc4Qkw/mm+
	 9PrGDGSbYmxSjgqEp1UcLzhcusI74r/chB0aoU8Ldh5aXF8Zm+nysj3ruDV0GVV+m7
	 6LGj6EjygJNrNggV6LVwcTl9u1xH+FzluoIXOpvvTB/wsXDd1e4+XnQSB+sdbwGLvG
	 XiePFDIrbL5jIMwD6dVSXy46BWgvG13GxnyH0eAdMMyBQgs2IVO1W4lgQ6H6bjSnAa
	 ZavO9ULmYSLhw==
Date: Fri, 24 Jul 2026 08:51:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <20260724155144.GA2032@sol>
References: <20260724050645.223799-1-ebiggers@kernel.org>
 <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh>
 <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
 <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
 <2026072455-subtly-prayer-0a8a@gregkh>
 <20260724150932.GA6763@sol>
 <2026072428-ungodly-outsource-b20c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072428-ungodly-outsource-b20c@gregkh>
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

On Fri, Jul 24, 2026 at 05:25:46PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 24, 2026 at 08:09:32AM -0700, Eric Biggers wrote:
> > On Fri, Jul 24, 2026 at 05:04:46PM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Jul 24, 2026 at 02:47:48PM +0000, Bartosz Golaszewski wrote:
> > > > On Fri, 24 Jul 2026 16:14:14 +0200, Eric Biggers <ebiggers@kernel.org> said:
> > > > >
> > > > > And with the defaults QCE is *never* used.
> > > > >
> > > > 
> > > > It's almost EOD here and I'm going to disconnect for the weekend but I just
> > > > wanted to say before I leave: this has never been a reason for an aggresive
> > > > removal of any driver. We remove drivers when we stop supporting entire
> > > > platforms, not mostly unused drivers on actively *supported* platforms where
> > > > they can still be used for experimentation and testing. I'm fine with dropping
> > > > this from arm64 defconfig but with fixes, the BROKEN tag should be removed
> > > > and I definitely object to removing it from the tree. How many people still
> > > > use greybus? Should we drop it from the kernel too? And I'm saying it as
> > > > a project ARA alumni. :)
> > > 
> > > I agree, if someone is willing to maintain it, and there are actual
> > > in-kernel uses of it (meaning not just a stand-alone library that can
> > > never be called either by userspace or hardware), it should stay.
> > 
> > What would we be considering the in-kernel uses to be, then?  Just
> > wiring it up to the framework is enough, regardless of actual use?
> 
> I was meaning that we just don't want to have code lying around that is
> impossible to use.
> 
> I'll defer to the subsystem maintainer if they want to remove it or not
> here, as that's their call, not mine.
> 
> But really, if someone wants to maintain it, no matter how slow it might
> be, I don't see the harm in keeping it if it's not causing any other
> problems.

It is consuming a lot of the community's time to help maintain,
including dealing with LLM-found bugs, with no clear benefit to anyone.
Even considering *just today* we can see someone sent a bug fix:
https://lore.kernel.org/linux-crypto/20260724081537.191992-2-thorsten.blum@linux.dev/

It definitely *was* causing problems before it was disabled via the
crypto priority system (which made it unused in the kernel) and dropped
it from AF_ALG (which removed most of the unprivileged attack surface).
When anyone accidentally used it, it caused at least a huge performance
problem, and sometimes other problems too like filesystem hangs.  It was
an issue for years.

If the justification for keeping it is that it is disabled anyway, then
I hope there's not going to be a contradictory push to enable it again.

I don't think we should keep crypto drivers around just for
"experimentation and testing".

- Eric

