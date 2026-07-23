Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9BFC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEkPsxd9ZoXL5Uktup6RYxuzlqKMqrxumg3q9XyHNAM=; b=eAP2hwoYp9fdJCkbJ2EG+XfvWZ
	EowKnOZFlw54mlsNUDtl9Bl1U+ZgPrXm8GMLfHl10dXytTI4vNWY4sorW7A3WOlik2gEr5NmIYxv9
	KNXpprtmKERHviPm093TimEj2YZrb/RvOEhyQUF0F9rn3ZaL0IM1CAlXOyVyVbzXW0+DLDITFzEfN
	aIvEw6+goJNC+jSbJN2q2DUhc+Oy0iOP29AvfhVqHGdVV0Q/kaH6ssyyjrjTdsSntAlPMy1QqjHLa
	XDTquOcnrZXY7dA9bJI9en+BXB6u3eqDARFMn2ejeGjcDrgzJ7QOqdq+LRHMa7LPfA600rTImBcXF
	ceGRPw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuGY-0000000ETk5-319q;
	Thu, 23 Jul 2026 14:19:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuGS-0000000ETiJ-2xhj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:19:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E419960A62;
	Thu, 23 Jul 2026 14:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1901F000E9;
	Thu, 23 Jul 2026 14:19:07 +0000 (UTC)
Date: Thu, 23 Jul 2026 07:17:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <20260723141701.GA1900@sol>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au>
 <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
 <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
 <20260722162040.GC2794619@google.com>
 <CAMRc=McTUmyCNvW6qECR4rnVQNLAWLnOr8+fdcZEyDfKESifHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McTUmyCNvW6qECR4rnVQNLAWLnOr8+fdcZEyDfKESifHw@mail.gmail.com>
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

On Thu, Jul 23, 2026 at 02:44:27AM -0700, Bartosz Golaszewski wrote:
> On Wed, 22 Jul 2026 18:20:40 +0200, Eric Biggers <ebiggers@kernel.org> said:
> > On Wed, Jul 22, 2026 at 01:33:51AM -0700, Bartosz Golaszewski wrote:
> >> > Also, what can the current driver do that cannot be done better using
> >> > software crypto?  I understand that you have future plans to add more
> >> > features to the driver, but those are not relevant to this discussion.
> >> >
> >>
> >> We can offload crypto operations to the QCE saving CPU cycles but more
> >> importantly, the QCE provides HW based isolation which some vendors care
> >> about.
> >
> > Do you have any concrete proof of anyone using this with a specific
> > Linux kernel feature and actually getting a benefit from it?
> >
> 
> I'm not required to produce a proof of Qualcomm's clients using it. That's
> never been a requirement to keep a driver in mainline. I'm saying that Qualcomm
> wants to keep it and I've stepped up to fix and maintain it, which is what I'm
> doing.
> 
> But yes, I know about companies that do use this driver as is for whatever
> reasons. I'm not sure I can mention them so I won't.

I know that it's enabled in the defconfig and Qualcomm's BSP, so some
people have the module loaded on their systems.  That doesn't count as
use, let alone it being useful.

I'm not asking for a client name or any confidential information.  This
is a technical discussion, and I'm asking for proof that this driver can
actually provide a benefit for any specific Linux kernel feature over
the widely used and well-vetted alternatives (ICE and ARMv8 CE).

"We want this upstream for reasons that we refuse to disclose" is never
a reason for adding (or keeping) code in Linux.  There has to be a
technical justification.

Meanwhile, the strong technical arguments in favor of removal or marking
it BROKEN that have been presented remain unaddressed.

- Eric

