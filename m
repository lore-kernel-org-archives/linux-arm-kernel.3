Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A8EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6krpAZ29TaOvueJS8JhAcnvO/BxnT8qS3rDyN9mWmw=; b=d6yMdukmjU94xergEfE5I6nX5U
	qjvHY9maF6ZBBEVnCdeFCGH0a3Z/qJ93zAqpYXquE61p5OLovpShaTNsvEaVO8WvghDM6+vGO/RJw
	2zO6jP1QFUM95+OG4TH9xLX+2okFcWXuoA/+PN5a6Pi8os/Kefpz8MC5jjByYcJ0/D+FuWM2zh/bW
	E6t+J1ZYKbprUa0BPtg6JiTwZBnnvFAKPtMYlTFb+GFBa3WWnpUXhzSvMIQPnFNDwqo1tfyuvmuda
	3El4v+ziXffr1JfV7urm8a6XCYffzTzO76SwMnGnbgQT6u8hykrCXeFia0tg+UDw62qWQrSlltJlA
	Irza/edA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNF2J-0000000AnS0-3CSW;
	Mon, 16 Dec 2024 17:37:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNF1C-0000000AnAJ-0NOi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:36:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A148106F;
	Mon, 16 Dec 2024 09:36:57 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B1E73F528;
	Mon, 16 Dec 2024 09:36:28 -0800 (PST)
Date: Mon, 16 Dec 2024 17:36:22 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64 fixes for 6.13-rc3
Message-ID: <Z2BlFtmP4QP3XyLe@J2N7QTR9R3.cambridge.arm.com>
References: <Z1xx0ha7lbKkdhRC@arm.com>
 <Z18MixiGByAqDYLC@lappy>
 <Z1_6ukG_Lc5leG1o@J2N7QTR9R3>
 <Z2BAQEuXJg01qWDp@lappy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2BAQEuXJg01qWDp@lappy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_093630_172234_60B320E2 
X-CRM114-Status: GOOD (  17.73  )
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

On Mon, Dec 16, 2024 at 09:59:12AM -0500, Sasha Levin wrote:
> On Mon, Dec 16, 2024 at 10:02:34AM +0000, Mark Rutland wrote:
> > On Sun, Dec 15, 2024 at 12:06:19PM -0500, Sasha Levin wrote:
> > > On Fri, Dec 13, 2024 at 05:41:38PM +0000, Catalin Marinas wrote:
> > > > - arm64 stacktrace: address some fallout from the recent changes to
> > > >  unwinding across exception boundaries
> > > 
> > > Hi Catalin, Mark,
> > > 
> > > It seems that kselftests can hit a warning that was addressed in the
> > > commit above:
> > 
> > I assume you're referring to commit:
> > 
> >  32ed1205682ec42a ("arm64: stacktrace: Skip reporting LR at exception boundaries")
> > 
> > ... ?
> 
> I was actually thinking 65ac33bed8b9 ("arm64: stacktrace: Don't WARN
> when unwinding other tasks"), sorry for the confusion

That commit should have no impact the case you report, which is seen
when unwinding the current task, not another task.

The commit immediately before that (32ed1205682ec42a) *should* fix the
issue triggered by the ftrace kselftests.

> > That was intended to fix this specific issue, as explained in the commit
> > message (with a very similar splat from running the ftrace kselftests).
> > 
> > Am I missing something? i.e. are you saying it *doesn't* fix that?
> 
> Right - LKFT is able to trigger the warning I copied on Linus's tree.

Is that "Right" as in "Right, that commit fixes it", or "Right, that
commit does not fix it"?

The warning you reported says:

	Not tainted 6.13.0-rc2 #1

... which is *before* either of the two fixes above, since the arm64
for-next/fixes branch is based on v6.13-rc2.

Are you seeing the warning with those applied? e.g. do you see this in
v6.13-rc3? I cannot reproduce the issue on v6.13-rc3 so far.

Mark.

