Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PInYG2cGKTJojTGsiRmfJaGq3NsiCZWYAC8o4iUUwh4=; b=I8aUA81Pt/Lq1thCV0oYkQhzWC
	wiYLzs4mlSOMfH6CedljvWk7s8dSnwdCs6m8zCbbpHksSsJrpSqgMLlVrIeX62yum9TtjRHOWES8J
	EvCr1UR6iRbeB8yuqXzH7/iG6I7YCG1GIsGkyRCidBHND48I3rM4tqhQ1C2ZvnjwLqLRNCSPu41/E
	vNeiAEVjTSp9yycp/SYprjLkQv4inp5wA6cDf6zRwhaSMJJ5sDmuBBngJ+qySIsNw9+0TwEwK6/ox
	i9czTw2eQJQkn+bkZ2lWdyG8ZSC2rlKgj8fCOhC14RPgy+s5PX7VN04BOoZSiVsCyW8fUnYHpZouR
	L0tLgUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAW6j-0000000G6m3-48QF;
	Thu, 01 May 2025 15:45:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAW4p-0000000G6au-138u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 436C843863;
	Thu,  1 May 2025 15:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C95C4CEE3;
	Thu,  1 May 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746114234;
	bh=rclRLfb0mVFM6LGfRTiUi3L5pqq96BWlLwc0aM5tME4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loRdlrGRvOISKZe5aEUj5ZBjO1efahNrNAiHrv0PuIfdOyXd4J9Z9N3fOguV9iyOU
	 1qhvxpTq55XSRQntPQanNnWRECiujnA9Vb+gXnhtCDdaJ2H3BvQgOJNzRIFkSwUZu7
	 mskNcNDe7uGp+g20GkRYrUiLeIznLK1KofEqOvXE=
Date: Thu, 1 May 2025 17:43:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>,
	James Morse <james.morse@arm.com>,
	Doug Anderson <dianders@chromium.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: errata: Add missing sentinels to Spectre-BHB MIDR
 arrays
Message-ID: <2025050129-iron-promotion-a69f@gregkh>
References: <20250501104747.28431-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501104747.28431-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_084355_319740_45EFF2DD 
X-CRM114-Status: GOOD (  15.00  )
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

On Thu, May 01, 2025 at 11:47:47AM +0100, Will Deacon wrote:
> Commit a5951389e58d ("arm64: errata: Add newer ARM cores to the
> spectre_bhb_loop_affected() lists") added some additional CPUs to the
> Spectre-BHB workaround, including some new arrays for designs that
> require new 'k' values for the workaround to be effective.
> 
> Unfortunately, the new arrays omitted the sentinel entry and so
> is_midr_in_range_list() will walk off the end when it doesn't find a
> match. With UBSAN enabled, this leads to a crash during boot when
> is_midr_in_range_list() is inlined (which was more common prior to
> c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported
> function")):
> 
>  |  Internal error: aarch64 BRK: 00000000f2000001 [#1] PREEMPT SMP
>  |  pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  |  pc : spectre_bhb_loop_affected+0x28/0x30
>  |  lr : is_spectre_bhb_affected+0x170/0x190
>  | [...]
>  |  Call trace:
>  |   spectre_bhb_loop_affected+0x28/0x30
>  |   update_cpu_capabilities+0xc0/0x184
>  |   init_cpu_features+0x188/0x1a4
>  |   cpuinfo_store_boot_cpu+0x4c/0x60
>  |   smp_prepare_boot_cpu+0x38/0x54
>  |   start_kernel+0x8c/0x478
>  |   __primary_switched+0xc8/0xd4
>  |  Code: 6b09011f 54000061 52801080 d65f03c0 (d4200020)
>  |  ---[ end trace 0000000000000000 ]---
>  |  Kernel panic - not syncing: aarch64 BRK: Fatal exception
> 
> Add the missing sentinel entries.
> 
> Cc: Lee Jones <lee@kernel.org>
> Cc: James Morse <james.morse@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: a5951389e58d ("arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/proton-pack.c | 2 ++
>  1 file changed, 2 insertions(+)


Cc: stable <stable@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

