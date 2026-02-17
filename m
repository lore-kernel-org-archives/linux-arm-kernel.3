Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B758E909AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpJaCG6rgR+dtwhMZIdMvWIEcTcpriQt0GeVUMEmuns=; b=GKLI2K5RzwBbKjPCFgXxJn44af
	lErjVHUz8AYbzu218jDvDYND01mV8KF19UhJusbq+Qf3zLj0YN+dbNVzoZM50dPndEawQCcaR7cLx
	i7bZMH/SE2nbLPS57efZcDpxT733lmCaXeFQb4LxTCU4iYyAKs3SBjTJSAL7rJr5/fN2WBuOUZfvS
	H7z4ifSeRoi4m1BRpfSbwp9vA9jKl3YGzTCMMF9vehLB4R0rZDFA8SlhkXHbPYmEoqcnpudW8r7C1
	8n821OU8ZPuVeSWRN37WP5ajbP8CtyIdz/Okf4PpS8QH7/g7N3GHH3EeBsNtRJmR6JlvGr5ooBDY7
	kgTviFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMYw-00000008Tgf-0xMo;
	Tue, 17 Feb 2026 15:00:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMYu-00000008TgZ-20W6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92A1560128;
	Tue, 17 Feb 2026 15:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F859C4CEF7;
	Tue, 17 Feb 2026 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771340427;
	bh=mYlEGTrnI5a+ac/YZf3DtKWdXwxsXj53TyqIoLRWIzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khSwFnhaKqZ5o63eBjO0BzLXJRawh6pmStxVUPeTAIXZZlhUpuP+8YcjmjMN29hPl
	 Yl7K5CpRYSFIKjMqvNFAcQcLM3JtyH3v47JGgKix7BLh+AweL9xdx8A7YfagpEWPcy
	 WPZ8gldWsd1HAUchXt4wKOvRtrVLQWTuES1Friu7VhYqjPclFcwkCSCTF4ferGwzdl
	 y/On8mjRubMqmu5d9CDhKQOYznD33kNE/LYRTBUF9GANF2jwzhhXaqd5DB7fsREcCQ
	 fKFSsLE0u6XfBm+URlTQtKijNecsKbEBg6Ncw3myuhC3nkzklTRSO9p2lfVYcYaFXT
	 rj4ICINQ3lyBw==
Date: Tue, 17 Feb 2026 15:00:22 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, Jisheng Zhang <jszhang@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZSChrCVnoWSe7h0@willie-the-truck>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZL46z1UZkQlF3Dd@willie-the-truck>
 <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
 <aZRyzy0SJ8uF3K2J@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZRyzy0SJ8uF3K2J@arm.com>
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

On Tue, Feb 17, 2026 at 01:53:19PM +0000, Catalin Marinas wrote:
> On Mon, Feb 16, 2026 at 08:59:17PM +0530, Dev Jain wrote:
> > On 16/02/26 4:30 pm, Will Deacon wrote:
> > > On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> > >> It turns out the generic disable/enable irq this_cpu_cmpxchg
> > >> implementation is faster than LL/SC or lse implementation. Remove
> > >> HAVE_CMPXCHG_LOCAL for better performance on arm64.
> > >>
> > >> Tested on Quad 1.9GHZ CA55 platform:
> > >> average mod_node_page_state() cost decreases from 167ns to 103ns
> > >> the spawn (30 duration) benchmark in unixbench is improved
> > >> from 147494 lps to 150561 lps, improved by 2.1%
> > >>
> > >> Tested on Quad 2.1GHZ CA73 platform:
> > >> average mod_node_page_state() cost decreases from 113ns to 85ns
> > >> the spawn (30 duration) benchmark in unixbench is improved
> > >> from 209844 lps to 212581 lps, improved by 1.3%
> > >>
> > >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > >> ---
> > >>  arch/arm64/Kconfig              |  1 -
> > >>  arch/arm64/include/asm/percpu.h | 24 ------------------------
> > >>  2 files changed, 25 deletions(-)
> > > That is _entirely_ dependent on the system, so this isn't the right
> > > approach. I also don't think it's something we particularly want to
> > > micro-optimise to accomodate systems that suck at atomics.
> > 
> > Hi Will,
> > 
> > As I mention in the other email, the suspect is not the atomics, but
> > preempt_disable(). On Apple M3, the regression reported in [1] resolves
> > by removing preempt_disable/enable in _pcp_protect_return. To prove
> > this another way, I disabled CONFIG_ARM64_HAS_LSE_ATOMICS and the
> > regression worsened, indicating that at least on Apple M3 the
> > atomics are faster.
> 
> Then why don't we replace the preempt disabling with local_irq_save()
> in the arm64 code and still use the LSE atomics?

Even better, work on making preempt_disable() faster as it's used in many
other places. Of course, if people want to hack the .config, they could
also change the preemption mode...

Will

