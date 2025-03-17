Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gsv8Qc7UiYDeIZ2IpN9vTEPun/MAdbfewO7+8Sds62c=; b=tkzkqKmMaMbjJgtiorXy0MRqFF
	o0Uj1OjJzlCy7iWAjSqE3H+uf7BGReXV6K2lwPWCU2bFZwAJh6hRPS27bTF5uB+izelJf55D1y8y4
	xPqSOriMhHk1epOpZv+jqa+IdBoIjwzLSKp0sRzbdqx8jdTN75sZt6yBL0OE1P+q7ZwSkhZUHqNe1
	UbYP+yFAS82GqThfk4UkufDeYb9DZ+r7fwbRyHWvHJ7SVDS16kJODZo9dWhuRV2dlC0SFir/ww24p
	edKTGm/vGr49znNzBkOgb6AGss9cKTtO1yXrCy98H0FMSTeSA70VWmmBGM/LeUF/4+NTvi0PPU+R/
	68iQVBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCv5-00000003FUf-2JgF;
	Mon, 17 Mar 2025 16:02:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCtN-00000003F8y-0wrc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAFBBA4553F;
	Mon, 17 Mar 2025 15:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB868C4CEE3;
	Mon, 17 Mar 2025 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742227240;
	bh=6gCzBdireTSrb2J2K5TYgOMaQEFeUZq4N8TbdhjQzUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKaOvtderv0mRKnIyHN94Xe50MKGc3Na1bhk7ei9JUG5zy2yfXJndNmD73/RzH59O
	 0JlFX/EGA/b0eSKiELoIpZfsY/zZ/L+7D9lRdrkTbZ7EbwRSQDUKFyWPzSfMvOHNDY
	 mUsVu3Vo2jQueI0jHLzEQHSR9ksk8mWaPcXjJfifsHZYsmKOC/0kUd+e6YeidXWSIv
	 oquBJR3HyaHmjQuabsm8bVye/B+Wi20Tb6GZOeLjFzuvNuczah/H8tpgYeqyjMK59s
	 cobZzrCt6QITHVd/6VkAmhpLwQMFbJKnB3Ff+3vAwSVCAFffN/mT/XdDnVl6evNOXQ
	 GgjQmdukBgjRA==
Date: Mon, 17 Mar 2025 16:00:35 +0000
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	maz@kernel.org, rananta@google.com
Subject: Re: [GIT PULL] arm64 fixes for -rc7
Message-ID: <20250317160034.GA12267@willie-the-truck>
References: <20250314160458.GA9438@willie-the-truck>
 <CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090041_325735_728D7A79 
X-CRM114-Status: GOOD (  20.17  )
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

Hi Linus,

On Fri, Mar 14, 2025 at 10:34:57AM -1000, Linus Torvalds wrote:
> On Fri, 14 Mar 2025 at 06:05, Will Deacon <will@kernel.org> wrote:
> >
> > Summary in the tag, but the main one is a horrible macro fix for our
> > TLB flushing code which resulted in over-invalidation on the MMU
> > notifier path.
> 
> From a quick look, that macro is still quite broken. Maybe not in ways
> that matter, but still...
> 
> In particular, the 'stride' argument is used multiple times, and
> without parentheses.
> 
> The 'lpa' argument is also used multiple times, and the input to that
> is typically something like kvm_lpa2_is_enabled(), so I think it
> potentially generates lots of pointless duplicate code with that
> BUG_ON() in system_supports_lpa2() -> cpus_have_final_cap().
> 
> Maybe the compiler figures it out. But that macro is bad, bad, bad.
> When it looks like a function, it should act like a function, and not
> evaluate its arguments multiple times.
> 
> The most immediate bug may have been fixed, but not the actual real
> horror of that thing.

Yes, the minimal fix for -rc7 avoids explicitly mutating the macro
arguments but we still have the multiple-evaluation problem you point
out above.

Ideally, this function would be rewritten as a 'static inline' but it
was moved from C code into a macro as part of 360839027a6e ("arm64: tlb:
Refactor the core flush algorithm of __flush_tlb_range") because we need
to propagate the 'op' argument down to the low-level asm where it's
stringified as part of the instruction mnemonic.

I'll have a crack at reworking things to take a 'const char *' instead,
but it won't be for 6.14 as it'll be reasonably invasive.

Will

