Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62894CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5fiATXuidJ60CvoDdPvwnRrwN5d6VT3jAzCpUmTPrM=; b=ILROCuDk6J7nD7f0x8D/2E3pdW
	1p0xU3IbBLfTXpfhbEIHKnhPeqgnH6sx//UubPFvLJo+CVSLoofn2Nq3oY4ZHr/NQyTbFHG2Q/3R0
	y1GApmwpOs/vZ81n+/JWfZbUOYOpCxYRBM+i22JWJSVIDnCIUzDg2S+0/SUA0DkPfsoUEi0PY3bkd
	e5l1NQF+e7iIeYgTCXrf4sfIvIXMyugCB0PlT9M6cYb794fUmBuQzdVWIfWqUV+dYweDdwuENH4MW
	C6ZiYWnjCEgBF981NzBAoOalM7xfRK6JA0OJw0sf1rTdujmaHUJ0lgLw+hT6oBVIwHGotgRROzdc8
	wVKJGx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKzl-00000009v8z-1N03;
	Thu, 01 Oct 2026 17:55:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKzi-00000009v8D-41Yb
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 17:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e5fiATXuidJ60CvoDdPvwnRrwN5d6VT3jAzCpUmTPrM=; b=SEed9/GnoYIFr8v6QgbmsJXei1
	C+y51tmu06iOXjfdSSYrg2gq+9MNDD+e9lx2IWU3tpq1WYmaIc/tmNyPvV7iO7rY9sD1+641kIsNm
	bU6bKlpr4D4ziFcoidb2dBQpACOrA9wIk2lHPPqUaOBF6HJRNBaRxTcxZBSQsSOBtjqXWRhjsYWyu
	t8WWHYw72l9jVzbRsK/3DRbncaqKzfiOJXjBGK3cZ9IFR2czf8oU/MwdEY7mRUdxU+5Rf2kLj0mCH
	G0RcP52ZTU2ZIJL4l7WXvhnbK7LbbJIhbcG8xIg44Lnn76Dq9spkMtEt7tH0KEGxi1Kt1zWiG4M8M
	v7T527/w==;
Received: from fanzine2.igalia.com ([213.97.179.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCKzb-00000005H3c-1prH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=e5fiATXuidJ60CvoDdPvwnRrwN5d6VT3jAzCpUmTPrM=; b=NeinwNRv+dXtKK93Tr1C+VYoTK
	i/vQ75nwE+VMdQ9SPgUnpUK6ErIbLdhjs4e9XOBo7HXPBWyirTV2NOuHlKph/VutUpSgyFOXkvopE
	rpTkV3Jt+DbgYz0krgb9BhHpMKI9MN18mMBohrt79WTpZUf/+Em95xDzoxlXl2s2Gd/66ZzipJgBb
	tbBHtF8lf1KhVO7oa0qUNk/hTch/5XCLHeJ5EjaBvVJ5onpjJ/jfVs40GTa370y93/+lwEp3htq46
	9s/x885ieTgavOnIJsCZv+PL5jQvSn3Ztp196AoC7eqShpOKQXYBUathD8wOhjpku2n3Zi6N7Lw0c
	YawpEJBA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCKzR-00AEdb-3U; Thu, 01 Oct 2026 19:54:41 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1xCKzQ-007yvO-0o;
	Thu, 01 Oct 2026 19:54:41 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <andrealmeid@igalia.com>)
	id 1xCKzQ-00000006IO9-0VFK;
	Thu, 01 Oct 2026 19:54:40 +0200
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 19:54:40 +0200
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Billy Laws
 <blaws05@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Mark Brown
 <broonie@kernel.org>, Ryan Houdek <sonicadvance1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
In-Reply-To: <ar0OyoPqGfmrkdH5@willie-the-truck>
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
 <ary-2rOs_b2IY6M1@willie-the-truck>
 <00227dc1-e01c-4de8-b3e3-3cd8de74cba9@igalia.com>
 <ar0OyoPqGfmrkdH5@willie-the-truck>
Message-ID: <3a7956e40289cb1f3224851947026907@igalia.com>
X-Sender: andrealmeid@igalia.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_185453_174113_09B6CF85 
X-CRM114-Status: GOOD (  29.04  )
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

On 2026-09-30 15:29, Will Deacon wrote:
> On Wed, Sep 30, 2026 at 07:29:22AM -0300, André Almeida wrote:
>> Em 30/09/2026 04:48, Will Deacon escreveu:
>> > On Tue, Sep 29, 2026 at 11:01:38PM -0300, André Almeida wrote:
>> > > Implement support for emulating unaligned atomic operations on arm64.
>> > > User applications that wish to enable support for this should use the
>> > > pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
>> > > 
>> > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> > > ---
>> > >   arch/arm64/Kconfig                   |   6 +
>> > >   arch/arm64/include/asm/exception.h   |   1 +
>> > >   arch/arm64/include/asm/processor.h   |   5 +
>> > >   arch/arm64/include/asm/rwonce.h      |  14 +-
>> > >   arch/arm64/include/asm/thread_info.h |   1 +
>> > >   arch/arm64/kernel/Makefile           |   3 +-
>> > >   arch/arm64/kernel/process.c          |  15 +
>> > >   arch/arm64/kernel/unaligned_atomic.c | 521 +++++++++++++++++++++++++++
>> > >   arch/arm64/mm/fault.c                |  10 +
>> > >   include/uapi/linux/prctl.h           |   5 +
>> > >   kernel/sys.c                         |   7 +-
>> > >   11 files changed, 579 insertions(+), 9 deletions(-)
>> > >   create mode 100644 arch/arm64/kernel/unaligned_atomic.c
>> > 
>> > No.
>> > 
>> > I already explained to you why this doesn't work:
>> > 
>> > https://lore.kernel.org/r/aV1YnOetDHhKe4hz@willie-the-truck
>> 
>> Indeed, last time you raised some points, and then Ryan replied them. Is
>> there any specific point that doesn't work? I couldn't find a reply for
>> Ryan's answers:
>> 
>> https://lore.kernel.org/all/CABnRqDf5EQUoXu=pJ6mj4-JfwAzEfcAE2cYrNzJANFycx7cMUA@mail.gmail.com/
> 
> So rather than get involved in the discussion, you did nothing for almost
> a year and then resent the exact same patch? Why?
> 
> I don't think the implementation is correct and I don't think we should
> be emulating this either. I hope I made that clear last year. Ryan
> thinks it's "fine" due to the locking, but I don't see how that helps
> with the example I gave.

Good, now we're talking. Now is clear that the most problematic part is
the split lock "emulation".

I agree that your example would cause tearing, and it would create a
memory state that would never happen with such instructions, or the
equivalent
of them in x86. Now I wonder which options do we have to have some sort
of bus
locking here. Giving that this instruction is already super expensive in
x86 anyways,
we don't need to be super quick as well, but we don't want a system
freeze as well:

- Somehow pause the other CPUs while the two instructions are happening.
I wonder if
we need to pause all of them or just the ones that share the specific
cache, or is the
LLC always shared amongst all cores?
- The kernel side lock doesn't serialize all users, so maybe there could
be a Giant Lock
in userspace for all threads sharing this resource. My cover letter is
outdated in that
regard, giving that the new set_robust_list2() will enable multiple
robust lists per process.
- Could flush instructions be useful somehow how?

While I try to test some of this ideas, any other ideas that you might
have
about locking two cache lines would be super useful.

Thanks again for your time!
    André

