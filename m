Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE684EB362A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K26va+N4ND1DIsRWMHvLFRBdNCSyWupC+0wE+3Ocry4=; b=UDHdND9Bpsz6UIrnqzH3270h0I
	oEV5zamcgXY0VILhSQjLVwM6IlDr7K+xb+5RzmwoaLE5bIPctdtVuBYc8RM/p+dP3qpwBUxGx1okp
	kg7qFfxKD57EiF/ElQ9FE5uB61cLbUIJdYGqLWrc7GWWzWMZth6j0M7Ne4imzSM0qCxBABTb0gJ+d
	4flt5ASb5jcFApHEmaB7FELV7xynfTLWRNF6Z4RlyGW1DjHfqaULgVCvmDN0/2ePt1vrUlRZtUGck
	4bz5x8yPeoiIIfQFzFzuikFcOdQoY7SyqUnehNTqy5FhUrkaOaUxCGRpme9ubrj+AU1B0rfoFsUTY
	OZbj2PVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7h9-0000000Dee7-1Asm;
	Mon, 02 Mar 2026 18:08:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7h1-0000000Dect-1qkz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 18:08:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2663A14BF;
	Mon,  2 Mar 2026 10:08:23 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B7B43F694;
	Mon,  2 Mar 2026 10:08:28 -0800 (PST)
Date: Mon, 2 Mar 2026 18:08:25 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Josh Law <objecting@objecting.org>
Subject: Re: [PATCH 4/4] arm64: kernel: Fix style in io.c macro
Message-ID: <aaXSGSEY_3WQvjYS@J2N7QTR9R3>
References: <20260301003407.2493781-1-objecting@objecting.org>
 <20260301003407.2493781-4-objecting@objecting.org>
 <aaWj4uIIiv_kwsFo@J2N7QTR9R3>
 <3fe578cc-07b3-442b-8eca-1f94c1975e85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fe578cc-07b3-442b-8eca-1f94c1975e85@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_100831_527953_7107405E 
X-CRM114-Status: GOOD (  19.19  )
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

On Mon, Mar 02, 2026 at 03:45:16PM +0000, Josh Law wrote:
> 2 Mar 2026 14:51:19 Mark Rutland <mark.rutland@arm.com>:
> 
> > On Sun, Mar 01, 2026 at 12:34:07AM +0000, Josh Law wrote:
> >> Signed-off-by: Josh Law <objecting@objecting.org>
> >> ---
> >> arch/arm64/kernel/io.c | 6 +++---
> >> 1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
> >> index fe86ada23c7d..ce27fa5d2e37 100644
> >> --- a/arch/arm64/kernel/io.c
> >> +++ b/arch/arm64/kernel/io.c
> >> @@ -17,10 +17,10 @@
> >> #define memcpy_toio_aligned(to, from, count, bits)                        \
> >>     ({                                                                \
> >>         volatile u##bits __iomem *_to = to;                       \
> >> -       const u##bits *_from = from;                              \
> >> +       const u##bits * _from = from;                             \
> >>         size_t _count = count;                                    \
> >> -       const u##bits *_end_from = _from + ALIGN_DOWN(_count, 8); \
> >> -                                                                          \
> >> +       const u##bits * _end_from = _from + ALIGN_DOWN(_count, 8);\
> >> +\
> >
> > There is no style violation here. There's no need to add a space between
> > '*' and the variable name.
> >
> > Mark.
> 
> I used checkpatch.pl... it detected that

So? Tools can be wrong.

In general, checkpatch.pl shouldn't be applied to existing files to find
issues, since there are many deliberate violations, and cases it cannot
parse correctly.

I checked out v7.0-rc2, and ran:

  ./scripts/checkpatch.pl -f arch/arm64/kernel/io.c

... and the warning you see seems to be:

| ERROR: need consistent spacing around '*' (ctx:WxV)
| #20: FILE: arch/arm64/kernel/io.c:20:
| +               const u##bits *_from = from;                              \
|                               ^

From a quick scan of checkpatch.pl, that's because it has mis-parsed
this as a binary operator, where we *do* want consistent space around
the '*'.

For types that's not the case, e.g.

| [mark@lakrids:~/src/linux]% cat test.c                               
| int *foo = 1;
| 
| int * bar = 1;
| [mark@lakrids:~/src/linux]% ./scripts/checkpatch.pl -f test.c        
| WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
| #1: FILE: test.c:1:
| +int *foo = 1;
| 
| ERROR: "foo * bar" should be "foo *bar"
| #3: FILE: test.c:3:
| +int * bar = 1;

Mark.

