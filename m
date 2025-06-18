Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D694AC71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ/BzZOPzT5KSxyMEMI2pQKokDXIaDGUe/G/fZ6UhJQ=; b=bq6otnSoaz1MaWSBeIjehbuX+O
	qF0AI8rtGwayqxkwBV7LMcevQq1QoX+CDMTlqhnnbiN5zjbp58n4S5C7AGcUM1Yx1L83DJHxYmRTp
	HeLLctGyuK2+NeZx2ggCksWzvFrsHdkDoqEhZxi+qQWF0vogvn3q8Gb/nFl1ok2qCyQhmXsFXQ1mQ
	O6kdcbDhSNz74XpBb0tCSbWcArXYZ9VimKuu6hhMHcie+a/WXS3YlF9YPislD6lXsDkFQtGEb1TBK
	v+nrs+45kngh+4bDNZs5mYOChmpo3PXv3qXPvIwMZa47wzUAexyldwC9Ro6MwO8AMcTq5bVkFWdu2
	BY3LDU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj5T-00000008ruP-3QEQ;
	Wed, 18 Jun 2025 03:03:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRiur-00000008rAw-2MD7;
	Wed, 18 Jun 2025 02:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95A3BA51528;
	Wed, 18 Jun 2025 02:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC05EC4CEE3;
	Wed, 18 Jun 2025 02:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750215164;
	bh=xibkBkl+LKRXep54JINrCcQx7QYwck9H1g7WJvKYXXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPFoctY2b4YRp0ICParubEBIZbOSf9Vk5KK8uS5PrU68/mm+Tz8vijYy669L9yxjm
	 Jsv6rP0LyKuxoI+O6bOEIwMiUBAvM0LFyxdmzqXTetuviDjXgL79zCa0MkNRe26UZJ
	 nmTPEi+nsnNBnQNcZVTMorAMhKugQ20v2b7tS7R4Wg/qgU1aCe1/KxTNGbXHZNp3s2
	 x1c6uvob6lNCYNLO/miSBxmUGAC6yCJweLgoMx1DbKIQB9lR06t0ghAy3rr9+u8lXf
	 Xpv9Fu6WPFd657Fqb98bOrRaq1+T2zwE7IyENAPdIk0Jvy78IS8GMNY23Rlo0baNFn
	 vSmEyoM6yt63A==
Date: Tue, 17 Jun 2025 19:52:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 8/9] lib/crypto/x86: move arch/x86/lib/crypto/ to
 lib/crypto/x86/
Message-ID: <20250618025213.GA426513@sol>
References: <20250617222726.365148-1-ebiggers@kernel.org>
 <20250617222726.365148-9-ebiggers@kernel.org>
 <983d7906-6510-4867-978f-4f937b29224b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <983d7906-6510-4867-978f-4f937b29224b@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_195245_673861_18735C6B 
X-CRM114-Status: GOOD (  22.30  )
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

On Tue, Jun 17, 2025 at 05:41:09PM -0700, Sohil Mehta wrote:
> On 6/17/2025 3:27 PM, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the contents of arch/x86/lib/crypto/ into lib/crypto/x86/.
> > 
> > The new code organization makes a lot more sense for how this code
> > actually works and is developed.  In particular, it makes it possible to
> > build each algorithm as a single module, with better inlining and dead
> > code elimination.  For a more detailed explanation, see the patchset
> > which did this for the CRC library code:
> > https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> > Also see the patchset which did this for SHA-512:
> > https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
> > 
> > This is just a preparatory commit, which does the move to get the files
> > into their new location but keeps them building the same way as before.
> > Later commits will make the actual improvements to the way the
> > arch-optimized code is integrated for each algorithm.
> > 
> > arch/x86/lib/crypto/.gitignore is intentionally kept for now.  See
> > https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
> > I'll remove it later after some time has passed.
> > 
> 
> After this change, arch/x86/lib/ has a lone empty directory crypto with
> the .gitignore file.
> 
> Instead, would it be cleaner to get rid of the crypto directory
> altogether and update the .gitignore of the parent?
> 
> As per the link above, commit 2df0c02dab82 ("x86 boot build: make git
> ignore stale 'tools' directory") says this:
> 
> "So when removing directories that had special .gitignore patterns, make
> sure to add a new gitignore entry in the parent directory for the no
> longer existing subdirectory."
> 
> With that change,
> 
> Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

Yes, that makes sense.  I'll do it that way.  Thanks!

- Eric

