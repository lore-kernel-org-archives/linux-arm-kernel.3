Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9570CCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpaNtOZ/byIV/f/TXpPkcpmZJH/cZvq+sT+/f8r70EI=; b=he7r9ZsIlohgw0FKbU+dbqzeLm
	iHYokKnXvOyV/3Ho9x3+8XwooIIliDphigivfnKEk6pnwZkFWR7UkEwjZc/zCyZos/sKOpnHMj/wg
	WASFtNSqaEW9a0087wtxPpvyXojxXqiylklBQ6ZFwLmebVQEw/wClKp7EoRwvYvBY4ThuUm2il6AH
	rApiAxhbijEQTr2q28PKXkdWYyqG8B2oNimEvqpF58LD/XEaoLPJsuALntQa98QamsCdVGJO1YFsJ
	EExF4JaO3KRFwHfiaWEy30nKreXJNnPHF/wxGDHND89bo+laJWiDNvnuD18+MxUBLKSzuf5/0UF86
	Xf7PJY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lb6-00000009CiH-2qU5;
	Thu, 25 Sep 2025 13:01:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lb4-00000009CgA-1zK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:01:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C9C5441FB;
	Thu, 25 Sep 2025 13:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A239BC4CEF0;
	Thu, 25 Sep 2025 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758805273;
	bh=Ejn+jXYsuwN2KMiTy9i/2i1LIyvkc8U+LXh052Sk+5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8VdYWQFoDZqGW3xaLiew0jQRAeYDTUBXdm+OAxNu+YifuPH+y6HbkScfo/UuW1oe
	 1C+Q/485jYTARK7umSzIoXYPRnQYqddfyGRgebO5VD9eV+d3h+32bihfy3x1pZdh1n
	 +pP2kVTS7wnij/oPX+tRR2EqaR29Hm6jqwAANyMUGyOBubxGINWIv0rjuxUixRk9E+
	 3474anTI9ZsG4McuAJqGJUaQ/nkvtvS8n+Yw1oUCdNCbBWgxTg7xHiWcYwA+5NCRov
	 lqhkrJS2HO19BMMhhbVGPDOJQSElqE78HHEc1bkfS5tDhlPmbrZkeagTxo4udcPSAQ
	 1FNHUm7Truc6A==
Date: Thu, 25 Sep 2025 14:01:08 +0100
From: Will Deacon <will@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Hanjun Guo <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
Message-ID: <aNU9FPYAUnBMMznn@willie-the-truck>
References: <20250919184025.15416-1-will@kernel.org>
 <778ccdfe-791c-4d67-a7f5-354ea84159dc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <778ccdfe-791c-4d67-a7f5-354ea84159dc@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_060118_538887_5A32C4B5 
X-CRM114-Status: GOOD (  21.69  )
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

On Wed, Sep 24, 2025 at 09:09:16AM -0700, Guenter Roeck wrote:
> On 9/19/25 11:40, Will Deacon wrote:
> > Big-endian arm64 configurations are vanishingly rare, yet we still claim
> > to support them in Linux despite very limited testing or visible
> > interest. Supporting big-endian adds unnecessary burden to reviewers and
> > contributors which, without any known active users, is hard to justify.
> > For example, recent work to improve our futex routines and to implement
> > nested virtualisation support is non-trivially complicated by having to
> > support both big- and little-endianness.
> > 
> > Back in 2019 [1], it was claimed that Huawei were using arm64 big-endian
> > machines in their telecommunication products but I don't know whether
> > that's still the case and certainly haven't seen any patch contributions
> > to help support or maintain it.
> > 
> > Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> > towards its removal.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Hanjun Guo <guohanjun@huawei.com>
> > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Link: https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171cd4@huawei.com/ [1]
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> > 
> > Cc'ing Guenter as a heads-up in case he needs to turn down his testing
> > to avoid this causing a false regression report.
> 
> Cool, one more architecture to drop. I wonder if I should drop arm64 big endian testing
> for all kernel releases. That would simplify my test infrastructure substantially,
> and it would avoid useless regressions due to bitrot for older kernel releases
> if no one is using it anyway. Thoughts ?

It's entirely up to you, but I'd suggest leaving it running until 6.18
is out and then turning it all off if nobody has chimed in to say
they're using this stuff.

Will

