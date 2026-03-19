Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0491090236
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0Idu+L8axZ8Rak0r2VBtpwhFuoOBBHSxqQk50LsrEU=; b=vUy/7A5bwGi08jf/Yv7Kjpc576
	Z15bZmnBlWty98BFzU2+0yQHvD0gO/yQw9UJVXfwa4Ymvag1W1zlFOJHqmaX1ON7E/7IcS4i0YcGg
	j1MrXTY35AYiA/Kz4qO3X/YFT4Yaiopc9mVCB/xxROC6d8+rzrfAL61IGcivWMP7WJd3BarYDc9Eu
	dSdO0xPHX2lRmWU2cK1eXq4U9mWWb1rYJ3sdLZDSGb2k/IumAldEDrPpRTyLLmsx6mp8Q31QVITqd
	3qeUuF8QeF24uzZv+iABUkxs1GNnSneqoSDHlzCCNZ89STFcbGFqCFkvcaEg2OGHPf1I9gfp+FTZb
	09dtd6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ek3-0000000AqAu-2Fqs;
	Thu, 19 Mar 2026 14:52:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ek0-0000000AqAM-3nri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 190C6436F6;
	Thu, 19 Mar 2026 14:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99655C19424;
	Thu, 19 Mar 2026 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931972;
	bh=QQwB89gb4izvIOCxDjl4eeppBwj3MyfA1wpkYnHwvlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3mV/lwcjOwNFWnJdS5D2jnG+CrPmyv8He02F44zXCJOhZnhi18d8PXACqHFPYpwY
	 GdtamTUPW6V/pBRgoGoWzoRS3rhXjeDBnTX5gOFXXJMkj3EHHYF8UZBsheBwT07r+0
	 rEHQvwckfiEUeS6f+O3qWhO7p+Rb+JNsylA6iU75Sro0ANsGlHkTTN94j4ZX5+ji/X
	 nh3tv+OGsLgOgdrklydD9cdSBaCheVKh00+M6bvQ4M0fQP9SuVNDvPEjMFI/WcbQiQ
	 TYNR7Qke6i2xI4zY/8dZwehBVWpjrKi3V3320z7pl4RAnOIRADgat4e10ocNW4ZVJx
	 Oc7v78s5l98Ag==
Date: Thu, 19 Mar 2026 14:52:47 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, daizhiyuan@phytium.com.cn
Subject: Re: [PATCH 3/3] arm64: errata: Sort Arm entries
Message-ID: <abwNv0Gx00fXnQ3x@willie-the-truck>
References: <cover.1772125743.git.robin.murphy@arm.com>
 <e2af5db2f1f41d052cce68bf4518f3cc1c4ea81e.1772125743.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2af5db2f1f41d052cce68bf4518f3cc1c4ea81e.1772125743.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_075252_963710_4265DC67 
X-CRM114-Status: GOOD (  10.46  )
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

On Thu, Feb 26, 2026 at 06:10:22PM +0000, Robin Murphy wrote:
> The Arm errata entries are in a messy sort-of-consistent-but-not order
> that's awkward for actual reading, rather than specifically searching.
> For the sake of sanity, order them consistently by Component (but
> keeping the distinction of CPU vs. system IP) and Erratum ID.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst | 64 ++++++++++-----------
>  1 file changed, 32 insertions(+), 32 deletions(-)

I don't think this is worth the hassle. It's just going to create
unnecessary friction when backporting errata workarounds.

Will

