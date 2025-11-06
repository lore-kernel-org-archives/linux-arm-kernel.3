Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC847CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 04:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYKn7lkOtQQNUQVhQwR8UaceIK0WNcT5tH8vbm6pxCo=; b=Vi5PKXYCxJUrmiba9QvCOtSjPi
	ytW4JzR2EwaU4y/z5zt9CsVN3RUIX6yvLwBoSXpak/6Y8E1UCSVx8bxcAMrpDWrUUzNLcUqH314B/
	MuNC/cP9EIBkDvhYE2dWWbZ+zANzI4c/nBJtJ1EJ69MfNa3BbwM8sBsU7XC11GwKW6jSEPmMFaq66
	Z1v5kw/EPoOH1CvEZQEH05jnaBOH+NeNq8UF4I0630TWr4g5umtz50AC3/NweXGGAIS1vSo0pOgqZ
	7THuxAnif/fPhD+V+Y9WrV6Hg15s9SYRNCtoaroRAvBILQqapdXPicM9tbCg+rSq7kwMWVEiS3KuO
	GXrrFbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGriV-0000000ErMh-1LFI;
	Thu, 06 Nov 2025 04:35:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGriU-0000000ErMW-1N5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 04:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BA1060051;
	Thu,  6 Nov 2025 04:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62ACC4CEF7;
	Thu,  6 Nov 2025 04:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762403721;
	bh=j/5/qmy4jIrHUj6xDBmoQ+We3edlP+5ky0U44w5itsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSyTqaRL5m/48V8JP5XBhTRXBYNS68W9KvpEZSFaFbYm15M+Hb+sCSxfiZwKpnh+4
	 i0XKur1Ak/atYZK8c/FXKaZcBqo/u4/GKPQ/c5/rYqEsqqmOqkPCry2o/IHeI2CVpv
	 OfPGSA2L9pFMlNMuQqJBciVr33bO4Fyem02acQ53anuvOz6DesgtxJbZbDFQ7gJbkt
	 lBHj6/XcnVJEP09JkmzjS4lGvqeFJCeI+LAdoAnqXw4dPKdHsX9vncpvNCb/kGOR65
	 uQKb5zoRWve7/auk+1mEj0RNfKzKYlBuCi+ltf0nN1hOWlsu5cOHhD3KsxLE/o0hgN
	 LK90v0+0TsnQw==
Date: Wed, 5 Nov 2025 20:33:40 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Harald Freudenberger <freude@linux.ibm.com>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/15] SHA-3 library
Message-ID: <20251106043340.GC1650@sol>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <20251103173404.GE1735@sol>
 <4188d18bfcc8a64941c5ebd8de10ede2@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4188d18bfcc8a64941c5ebd8de10ede2@linux.ibm.com>
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

On Wed, Nov 05, 2025 at 04:39:01PM +0100, Harald Freudenberger wrote:
> On 2025-11-03 18:34, Eric Biggers wrote:
> > On Sat, Oct 25, 2025 at 10:50:17PM -0700, Eric Biggers wrote:
> > > This series is targeting libcrypto-next.  It can also be retrieved
> > > from:
> > > 
> > >     git fetch
> > > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
> > > sha3-lib-v2
> > > 
> > > This series adds SHA-3 support to lib/crypto/.  This includes support
> > > for the digest algorithms SHA3-224, SHA3-256, SHA3-384, and SHA3-512,
> > > and also support for the extendable-output functions SHAKE128 and
> > > SHAKE256.  The SHAKE128 and SHAKE256 support will be needed by ML-DSA.
> > > 
> > > The architecture-optimized SHA-3 code for arm64 and s390 is migrated
> > > into lib/crypto/.  (The existing s390 code couldn't really be
> > > reused, so
> > > really I rewrote it from scratch.)  This makes the SHA-3 library
> > > functions be accelerated on these architectures.
> > > 
> > > Finally, the sha3-224, sha3-256, sha3-384, and sha3-512 crypto_shash
> > > algorithms are reimplemented on top of the library API.
> > 
> > I've applied this series to
> > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next,
> > excluding the following 2 patches which are waiting on benchmark results
> > from the s390 folks:
> > 
> >     lib/crypto: sha3: Support arch overrides of one-shot digest
> > functions
> >     lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest functions
> > 
> > I'd be glad to apply those too if they're shown to be worthwhile.
> > 
> > Note: I also reordered the commits in libcrypto-next to put the new
> > KUnit test suites (blake2b and sha3) last, and to put the AES-GCM
> > improvements on a separate branch that's merged in.  This will allow
> > making separate pull requests for the tests and the AES-GCM
> > improvements, which I think aligns with what Linus had requested before
> > (https://lore.kernel.org/linux-crypto/CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com/).
> > 
> > - Eric
> 
> Here are now some measurements on a LPAR with 500 runs once with
> sha3-lib-v2 branch full ("with") and once with reverting only the
> b2e169dd8ca5 lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest
> functions
> patch ("without"). With the help of gnuplot I generated distribution
> charts over the results of the len=16, 64, 256, 1024 and 4096 benchmark.
> See attached pictures - Sorry but I see no other way to provide this data
> than using an attachment.
> 
> Clearly the patch brings a boost - especially for the 256 byte case.
> 
> Harald Freudenberger

Thanks.  I applied "lib/crypto: sha3: Support arch overrides of one-shot
digest functions" and "lib/crypto: s390/sha3: Add optimized one-shot
SHA-3 digest functions" to libcrypto-next.  For the latter, I improved
the commit message to mention your benchmark results:

commit 862445d3b9e74f58360a7a89787da4dca783e6dd
Author: Eric Biggers <ebiggers@kernel.org>
Date:   Sat Oct 25 22:50:29 2025 -0700

    lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest functions
    
    Some z/Architecture processors can compute a SHA-3 digest in a single
    instruction.  arch/s390/crypto/ already uses this capability to optimize
    the SHA-3 crypto_shash algorithms.
    
    Use this capability to implement the sha3_224(), sha3_256(), sha3_384(),
    and sha3_512() library functions too.
    
    SHA3-256 benchmark results provided by Harald Freudenberger
    (https://lore.kernel.org/r/4188d18bfcc8a64941c5ebd8de10ede2@linux.ibm.com/)
    on a z/Architecture machine with "facility 86" (MSA level 12):
    
        Length (bytes)    Before (MB/s)   After (MB/s)
        ==============    =============   ============
              16                212             225
              64                820             915
             256               1850            3350
            1024               5400            8300
            4096              11200           11300
    
    Note: the original data from Harald was given in the form of a graph for
    each length, showing the distribution of throughputs from 500 runs.  I
    guesstimated the peak of each one.
    
    Harald also reported that the generic SHA-3 code was at most 259 MB/s
    (https://lore.kernel.org/r/c39f6b6c110def0095e5da5becc12085@linux.ibm.com/).
    So as expected, the earlier commit that optimized sha3_absorb_blocks()
    and sha3_keccakf() is the more important one; it optimized the Keccak
    permutation which is the most performance-critical part of SHA-3.
    Still, this additional commit does notably improve performance further
    on some lengths.
    
    Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
    Tested-by: Harald Freudenberger <freude@linux.ibm.com>
    Link: https://lore.kernel.org/r/20251026055032.1413733-13-ebiggers@kernel.org
    Signed-off-by: Eric Biggers <ebiggers@kernel.org>

