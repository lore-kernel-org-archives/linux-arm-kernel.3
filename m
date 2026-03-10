Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F87FD4F13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zlB6lkG5A4CEiZnfyqysEmAbPrlwjM/OlCoO8MRc1o=; b=WmoBWID35sG8Oq1q86E47TNMEh
	AuldOYUYszIoVzTCMbtR7GRcTVHykzxbyy/inyHHynfAvv8cggeOTCHZlytW6g8SW5d0OCWGGqEeo
	FLlHOFJnjHTltiD7AtDPDbRVV0fv72035OitQlDiU2E6YoX5sQFtZto/SXIaPvHYfNFIcFP6EMST9
	U2ILHlQhsdgTNLHSVauL2Wh4UldZy7Fh52DYvVvOkQJActhb0y+C3YQWtBvbtWZg5XY3T0AwUns+h
	GpIZEVOHTkI+/A7flc4b5yslhIz/y7yQq1iiwVsKXblNz+juhAcNOxuADKjQxAdNAfBlXjHrYcIHq
	IzHGfC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01V5-0000000A2qo-24HN;
	Tue, 10 Mar 2026 18:08:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01V3-0000000A2pR-0R1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:08:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883B11596;
	Tue, 10 Mar 2026 11:08:00 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A1E33F7BD;
	Tue, 10 Mar 2026 11:08:05 -0700 (PDT)
Date: Tue, 10 Mar 2026 18:08:03 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: remove ARCH_INLINE_*
Message-ID: <177316606756.3839012.6602344567834052814.b4-ty@arm.com>
References: <20260220091228.1545-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220091228.1545-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_110809_184131_B019402D 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

On Fri, 20 Feb 2026 17:12:28 +0800, Jisheng Zhang wrote:
> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
> modes"), arm64 only has two preemption models: full and lazy. Both
> implies PREEMPTION, so !PREEMPTION is always false for arm64, it's
> time to remove ARCH_INLINE_*.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: remove ARCH_INLINE_*
      https://git.kernel.org/arm64/c/6712fcde003f

-- 
Catalin

