Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA90CC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66KrctpaKAENddfolI2colguGv6YJMeqdaZgaNhD1U0=; b=OzqYeUdUsev5Ir69GvxFXx38iu
	A/RIUWnMgw1PxQL51v5szy/u0rJI0Dg75sacxYJjgKH70Rhf5WyS0s7Hpt9lzPIJG8m9qGtjJ5n//
	gD7mYq5K+6yVyeTsOvqllmdjnHR7/0JCyicZ8hJAWpavqEcIk/2qrPQH4xirwcErjB7GfPlncHB/K
	9uCkbnqT+vy3uQbyc91Y71ck7uScXxi+109nKkvg4qdxv2LNGuy4lBvr7IqMlU2r7Xs2c8h+O1F9W
	of/wmk7w/xTI5+2VJ+kN/teFe54s57QdyaMZH5rMKUqwAvYuCDqF4Fix1NIXFfxkc0S7oTa6jarmx
	Yg5x/E6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSV9-00000004a7B-2s8m;
	Fri, 09 May 2025 18:31:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQQA-00000004Fvv-2NiY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 16:17:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00A026111F;
	Fri,  9 May 2025 16:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F54DC4CEE4;
	Fri,  9 May 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807477;
	bh=I3FQcqDoCcpXNgtGOu4TBQ/5BVpCPFEoDvuQhwL0NDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9rRNZer0SZ+VWi+gr0xN3LRWYR2kjlWR1u9/4YK0RrX7WUQDbJhT2n/qaqIh79Ku
	 RjihsxPY0QdwxJ2YBBuLHPG5/m+lCoVbYftUuepvtBiqwyIl/pzrneTUctRyzqRjzm
	 WGsvKG3sqQtRJWjjOow/hmD4Ntcg2wYQ0dARt2L5SkogglhlcvP7olsJ8HmwY2w7UY
	 wz2+35trVXZBWP+vzzt7KlcWuVlClUCSeRJK59ABcaf/MaTXKFny7VuvcCgBbRFTHe
	 gHLgWAp9ntjyy8YCkTYsVz167rOvA5a7LNZg2yAICN0oicojc93M/w04s+IIsJ7soB
	 RydBOJdVyfmQw==
Date: Fri, 9 May 2025 17:17:53 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Message-ID: <20250509161752.GC5984@willie-the-truck>
References: <20250508044752.234543-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508044752.234543-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, May 08, 2025 at 10:17:52AM +0530, Anshuman Khandual wrote:
> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc5
> 
> Changes in V2:
> 
> - Changed reg, val width to u64 in cortex_a76_erratum_1463225_svc_handler() per Ada
> - Changed mdscr register width to uint64_t in enable_monitor_debug_exceptions() and
>   install_ss() per Ada
>     
> Changes in V1:
> 
> https://lore.kernel.org/all/20250417105253.3188976-1-anshuman.khandual@arm.com/
> 
>  arch/arm64/include/asm/assembler.h            |  4 ++--
>  arch/arm64/include/asm/debug-monitors.h       |  6 -----
>  arch/arm64/kernel/debug-monitors.c            | 22 +++++++++----------
>  arch/arm64/kernel/entry-common.c              |  4 ++--
>  .../selftests/kvm/arm64/debug-exceptions.c    |  4 ++--
>  5 files changed, 17 insertions(+), 23 deletions(-)

Can you post the selftest change as a separate patch, please?

Will

