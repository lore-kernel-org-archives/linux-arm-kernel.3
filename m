Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45176C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vlsxlh1AOW/QiXTampQxQJe/BaKBoGTXudbRio4oViU=; b=vs21CqDqtGl6ohjyy64+8qmnEy
	gWPeGLjkMwlOS36Fm5PVEeTye9hl1aIRbycCnwA5qi3iiAqiGOxdTVwxuGOiFdLdRewxSXf4mDHlt
	UsdmS4XmJj8+SDuPtlkPklGUhK37ySCqyamfo7TD6sXtGpQuA0Pr8n9CH8exZlGlNqMxWmwAu5/2i
	wfbM6xDAiJaWZT1G4AfHxofc/75T824dxIkZxPdFBfKHTHIB98QPIwq0DLzQWtGcp8cDLZKBhOqL2
	DLrp+c7IjbHYayGK6h5aPu0qnqL88SpKsCArle3FRWNFDVntL1QDgT4IxrpQg0ikPy3Avn19as3xk
	5drwHlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVPK-00000005lwi-2ChT;
	Tue, 18 Mar 2025 11:46:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVM2-00000005lKX-0glw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 11:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CEEE1A48F8E;
	Tue, 18 Mar 2025 11:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E17C4CEDD;
	Tue, 18 Mar 2025 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742298209;
	bh=Vlsxlh1AOW/QiXTampQxQJe/BaKBoGTXudbRio4oViU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvanpjKYLeX/AGVBpSR82hErBd5QXy8bzpNon4qzZ9e1PL1Ov61ah66m194iTnKe0
	 tt7Ug8izLxjHxMt0e5D3S8AN4p+3nniVafLKVX7T80TtLc+nV4v84EgIaj/3Ftklaj
	 t3o2Zwj3fe5szCpmEIcXTwCTMfQ5NBgt8uiYlUHTC8atyWfEHGcoViw77eGUnFeXvX
	 6m2i5uUYY3xeE9OQRlO4r6Smr0zyolJsCYjoHNNjaI6jrBAa4B3dPaS/N0RbZBfPhT
	 8DMLReM/yMnsjebI2Fa58W3P+tfBSd6T+gmldXPnrAb8VDjTMMhpgnXmjJsSqfMuxb
	 MPlc9sX80YY6w==
Date: Tue, 18 Mar 2025 11:43:24 +0000
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	maz@kernel.org, rananta@google.com
Subject: Re: [GIT PULL] arm64 fixes for -rc7
Message-ID: <20250318114323.GA13641@willie-the-truck>
References: <20250314160458.GA9438@willie-the-truck>
 <CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com>
 <20250317160034.GA12267@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317160034.GA12267@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_044330_261420_B5986C5D 
X-CRM114-Status: UNSURE (   8.78  )
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

On Mon, Mar 17, 2025 at 04:00:35PM +0000, Will Deacon wrote:
> I'll have a crack at reworking things to take a 'const char *' instead,
> but it won't be for 6.14 as it'll be reasonably invasive.

Bah, that doesn't work at all because we need a string literal for the
asm and I can't spot any constraints that allow you to pass in a string.

So a different flavour of surgery is required...

Will

