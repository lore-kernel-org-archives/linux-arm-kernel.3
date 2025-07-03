Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDA5C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BA/9Pe8XZQ/jID49Te+dgUeGLEGFsQ/bzJ60aah+lV8=; b=QpJqtY4U40Gl7GKPnZ9glXQN8T
	yu7I1tFy27cdmzy7CzCLkPlT/KhZVk6rqhefAX4Sokfgc3/QAIOS7HMSizJ9fwBFdC6r35OVxTdDC
	qFdSCIg6UmUCQZeAKxfBY7Fy+EtWdZmPrjerlLNl9U7ByDQiiWeD0coSKWjcfdpTfFkU/72YUw1wq
	MhAUVtiwhNeam4LbIWDb4MuxQM+voyxecn8qsM7CQrdWdywKo2akRxp72AdTx0PaR2ug1jf3FkAA2
	dP3+K+El8sfLxQKtaZ+VRZN0kX5+DAC8sHeU4B+pVffaan1iArNyz8O8Y3oSRtknlAISmY9yxSP20
	mQRky9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR94-0000000CaP0-0hZn;
	Thu, 03 Jul 2025 21:07:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNuE-0000000CAHR-1sSo;
	Thu, 03 Jul 2025 17:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 581475C4D09;
	Thu,  3 Jul 2025 17:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A728FC4CEEE;
	Thu,  3 Jul 2025 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751564369;
	bh=CjXapFJRn6jr02iNiY/fdYyplTrLIb9R/H97pjZWheY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0dZv+fn7ZOGn/n+ubYI9NUTtwxmvb9diBgsUdEhHae7Zutp0YZ/+WA2QVDvdceiE
	 O7nTHh2055ZVNVomkVuKLY51txoTK4sQYkxGKJLuNGWjgzMCqLrTSI5Zrmre6E3N9d
	 fCqJIJIrxGQVxECwKzwOsl0MmJKaXvuoOJBu7JvuajS+a7E5T7s6Jw4u0HPzn2fuBc
	 54A/tyxdEBU9TN8TDN+tWrXb6uTuzTklHPasl0pvtNY3Cpy1Z6/shg/mObJA41LApq
	 X+dBhsWzfe+qFZKn+tPjo/AztvrCYwi/805NTK1OeGQuHpPC0XEgAeQNLWLO7L2VOg
	 LRPocxpDJ4F5w==
Date: Thu, 3 Jul 2025 10:38:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/14] SHA-256 library improvements
Message-ID: <20250703173847.GB2284@sol>
References: <20250630160645.3198-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_103930_567780_6125A240 
X-CRM114-Status: GOOD (  21.24  )
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

On Mon, Jun 30, 2025 at 09:06:31AM -0700, Eric Biggers wrote:
> This series is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v2
> 
> This series improves the SHA-224 and SHA-256 library code to be
> consistent with what I did for SHA-384 and SHA-512.  This includes:
> 
> - Use stronger typing in the SHA-224 and SHA-256 functions.
> 
> - Add support for HMAC-SHA224 and HMAC-SHA256.  (I'll send a separate
>   patch with KUnit test cases for this.)
> 
> - Make the old-school crypto API's support for sha224 and sha256 just
>   use the actual library API, instead of unsafe low-level functions.
> 
> - Consolidate the CPU-based SHA-224 and SHA-256 code into a single
>   module, with better inlining and dead code elimination.
> 
> - Properly document the SHA-224 and SHA-256 functions.
> 
> - Other changes to synchronize the code with SHA-384 and SHA-512.
> 
> Changed in v2:
> - Dropped sha224_kunit.c changes; it will be added later in the history
> - Dropped some patches that I folded into the SHA-512 series
> - Removed redundant checks of IS_ENABLED(CONFIG_KERNEL_MODE_NEON)
> - Removed obsolete setting of -DARCH for sha256.o
> - Fixed a commit title to mention sha256 instead of sha512
> - Excluded HMAC-SHA{224,256} code from purgatory, where it isn't needed
> 
> Eric Biggers (14):
>   libceph: Rename hmac_sha256() to ceph_hmac_sha256()
>   cxl/test: Simplify fw_buf_checksum_show()
>   lib/crypto: sha256: Reorder some code
>   lib/crypto: sha256: Remove sha256_blocks_simd()
>   lib/crypto: sha256: Add sha224() and sha224_update()
>   lib/crypto: sha256: Make library API use strongly-typed contexts
>   lib/crypto: sha256: Propagate sha256_block_state type to
>     implementations
>   lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
>   crypto: sha256 - Wrap library and add HMAC support
>   crypto: sha256 - Use same state format as legacy drivers
>   lib/crypto: sha256: Remove sha256_is_arch_optimized()
>   lib/crypto: sha256: Consolidate into single module
>   lib/crypto: sha256: Sync sha256_update() with sha512_update()
>   lib/crypto: sha256: Document the SHA-224 and SHA-256 API

FYI, applied to libcrypto-next.  Reviews and acks would be greatly appreciated,
though!

To fix https://lore.kernel.org/r/202507010837.ERX7aWw7-lkp@intel.com/
I applied the following fixup to
"lib/crypto: sha256: Propagate sha256_block_state type to implementations".

diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.c
index c3f844ae0aceb..55f42403d572a 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.c
@@ -26,7 +26,8 @@
  */
 #define MAX_BYTES 1024
 
-extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
+extern void ppc_spe_sha256_transform(struct sha256_block_state *state,
+				     const u8 *src, u32 blocks);
 
 static void spe_begin(void)
 {

