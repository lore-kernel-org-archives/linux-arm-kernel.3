Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF55CF31E24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+JxQh76wlh3DwSn75VfeKXvfkjXxNnrM6s8RMYbFXk=; b=m84ilZ8yyKV24SDWa6w/nDJHtK
	FjD48RQaVbPghUONNgs9rv0+Rq2e4V3BOlJ5oarUrK0yJkEH18XCJxNGRqRB2l+6itKppx3jLYQ8/
	LkfPP7H+oB2dR5894JdVO0siCSBqx7meN8vAfM0g4b3Wcsg1ZHGddgfNC4J04lWVMzbgmd670o4Nv
	MwsUrlMXLAPrIk7XdR5vz22NboDE4rgnlDQFKiEabxP3/WQ5jCg/E55PefTv8nE3LOGSLL9h49ZjI
	bPrndwPCPZ2buT2VWfikD/1Wr062S7OctnAR4yDdYkO5sVoXY2ip10BILlVpZSg2Aj0yyyHuMhEia
	m/AP5wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAr4t-0000000Am6h-3qAP;
	Thu, 09 Apr 2026 15:13:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAr4r-0000000Am6Z-3wva
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65C4060123;
	Thu,  9 Apr 2026 15:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C35C4CEF7;
	Thu,  9 Apr 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775747633;
	bh=aUbgZw7dA8jv4vpUf4Nf8KyWibYIl9xbNH07Y9ty3mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hef8DwhPQrLV1ZVZMGuUv+BMom2DjWCDE2uJwGGjz4NKv9Boe6tK+mwSr6FRdApqq
	 18+LSH0uCuMniZAbNXx/11hkQiMzezSYzRJLp8K56+WKolcds+CzzwwdVo+2rrL4eY
	 SU/zUWVJ093xblL6mOFVVGM9H05WOM+ECzvycjdBwzK17vdMRRp9nH49+sSWYQ3toe
	 VI/ZcUkzwCg/2pWY3Rzq9gK7phUhWFxzqFY+xSZyj1Y9CqBFBTs3LVXodCtrDP4APo
	 Dwqs2rIge8ZmJm57vCv4ogsjf/oEP+gpZ/24HdOr5+IXEjtQqAEdEgeRlZCCMaN4dO
	 7gezgodKo4uCA==
Date: Thu, 9 Apr 2026 16:13:47 +0100
From: Will Deacon <will@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of
 firmware mitigation
Message-ID: <adfCKyzq_R5OSBaY@willie-the-truck>
References: <20250317212611.GA12724@willie-the-truck>
 <3c9c567f7a6e926e8ec24913d564ec55e8f450d2.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c9c567f7a6e926e8ec24913d564ec55e8f450d2.camel@infradead.org>
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

On Wed, Apr 08, 2026 at 10:26:10PM +0100, David Woodhouse wrote:
> On Mon, 17 Mar 2025 at 21:26:12 +0000, Will Deacon wrote:
> > I'm really not comfortable with this series and would prefer to see it
> > dropped while we continue the discussion, especially as it's causing
> > minor conflicts with the KVM/arm64 tree in -next.
> > 
> > ...
> > 
> > To be clear: I'm not at all against mitigating this problem and
> > advertising the status of that mitigation. I *am* against quietly
> > handling it like a CPU erratum whilst simultaneously telling userspace
> > that meltdown is not a problem regardless of the mitigation state.
> 
> Was there a conclusion? KVM still isn't even exposing
> SMCCC_ARCH_WORKAROUND_4 to guests...

I didn't see another version, so I think my comments (from a year ago!)
still stand.

Will

