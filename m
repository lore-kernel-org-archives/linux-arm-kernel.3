Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5D8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2aPVJ1D22uqLVvmYEeIY+mwQqSDnACvgA18YoqZDfc=; b=wWqJHjhaTLvSNF/C6oCBbbYC8P
	fW+eJyi7dKSEagw2RO6dw6p5vQNaqQHCw0r/9QkFWvpp+JqZ07FzXeMwwrLcHyiVeorbf+fpLOLGA
	bHNa93yrgVtjquieHvGrWBAOxIx185qkw1HEmdp03Q/ue/Zb9OEoNLAiR49baxA8l26u0irmlkA1S
	zpKfQVuNmklOCuMTlGYPzDku3CXElu68MrUqb90b9vvNIKgpyMXhwLDQnJjR7k3k/txe6HRjb9WE/
	hA2lQay4hdOQ8mwKzp6go6Ey8eedct3wAnSGrk7SfYQ0UzY0uLs7BcScqYrPNZHYjHb+cn3z0TRir
	jLxeNiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuLx-0000000F0Id-1tJR;
	Thu, 06 Nov 2025 07:24:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuLv-0000000F0IH-3PPV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFEC860218;
	Thu,  6 Nov 2025 07:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545D5C4CEFB;
	Thu,  6 Nov 2025 07:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762413854;
	bh=EQIh4D6IlbvqscR4GqNU/8zxERgLPJ4GCKIjho5utAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PqVYDScyf2laH9yanLvCfPYB3oEZdbDvBk1Nlv94RwxblyYeNSBg84zYu3VVelNux
	 qoE+NVG/712HRyNrjkodwLqEkE9+gFEXxlbyZNjBp0DK4/ypwYX9XaIpNxxh6GG/YM
	 uqNVQQeiSRPSEssJZnqBdoTCA0bOjSWQyPyB1DJ7u6WQyO2YF889Z55ytzR18+jEOE
	 atq9IWZz9ewQSWuVh0qRol5GGvAOELX1F04jgpC3ruwyt4LTgXcHsttIJWY81P8MoQ
	 EAJXOv05FebmrLL8omgPNYCNZOgJFdu5WkecghRqQVC721+Q7v1WDUnP9ANgd0SlTj
	 MEg9wbpfP0u5w==
Date: Wed, 5 Nov 2025 23:22:33 -0800
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
Message-ID: <20251106072233.GA117499@sol>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <20251103173404.GE1735@sol>
 <4188d18bfcc8a64941c5ebd8de10ede2@linux.ibm.com>
 <20251106043340.GC1650@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106043340.GC1650@sol>
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

On Wed, Nov 05, 2025 at 08:33:40PM -0800, Eric Biggers wrote:
> On Wed, Nov 05, 2025 at 04:39:01PM +0100, Harald Freudenberger wrote:
> > On 2025-11-03 18:34, Eric Biggers wrote:
> > > On Sat, Oct 25, 2025 at 10:50:17PM -0700, Eric Biggers wrote:
> > > > This series is targeting libcrypto-next.  It can also be retrieved
> > > > from:
> > > > 
> > > >     git fetch
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
> > > > sha3-lib-v2
> > > > 
> > > > This series adds SHA-3 support to lib/crypto/.  This includes support
> > > > for the digest algorithms SHA3-224, SHA3-256, SHA3-384, and SHA3-512,
> > > > and also support for the extendable-output functions SHAKE128 and
> > > > SHAKE256.  The SHAKE128 and SHAKE256 support will be needed by ML-DSA.
> > > > 
> > > > The architecture-optimized SHA-3 code for arm64 and s390 is migrated
> > > > into lib/crypto/.  (The existing s390 code couldn't really be
> > > > reused, so
> > > > really I rewrote it from scratch.)  This makes the SHA-3 library
> > > > functions be accelerated on these architectures.
> > > > 
> > > > Finally, the sha3-224, sha3-256, sha3-384, and sha3-512 crypto_shash
> > > > algorithms are reimplemented on top of the library API.
> > > 
> > > I've applied this series to
> > > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next,
> > > excluding the following 2 patches which are waiting on benchmark results
> > > from the s390 folks:
> > > 
> > >     lib/crypto: sha3: Support arch overrides of one-shot digest
> > > functions
> > >     lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest functions
> > > 
> > > I'd be glad to apply those too if they're shown to be worthwhile.
> > > 
> > > Note: I also reordered the commits in libcrypto-next to put the new
> > > KUnit test suites (blake2b and sha3) last, and to put the AES-GCM
> > > improvements on a separate branch that's merged in.  This will allow
> > > making separate pull requests for the tests and the AES-GCM
> > > improvements, which I think aligns with what Linus had requested before
> > > (https://lore.kernel.org/linux-crypto/CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com/).
> > > 
> > > - Eric
> > 
> > Here are now some measurements on a LPAR with 500 runs once with
> > sha3-lib-v2 branch full ("with") and once with reverting only the
> > b2e169dd8ca5 lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest
> > functions
> > patch ("without"). With the help of gnuplot I generated distribution
> > charts over the results of the len=16, 64, 256, 1024 and 4096 benchmark.
> > See attached pictures - Sorry but I see no other way to provide this data
> > than using an attachment.
> > 
> > Clearly the patch brings a boost - especially for the 256 byte case.
> > 
> > Harald Freudenberger
> 
> Thanks.  I applied "lib/crypto: sha3: Support arch overrides of one-shot
> digest functions" and "lib/crypto: s390/sha3: Add optimized one-shot
> SHA-3 digest functions" to libcrypto-next.  For the latter, I improved
> the commit message to mention your benchmark results:

Also, I'm wondering what your plan to add support for these instructions
to QEMU is?  The status quo, where only people with an s390 mainframe
can test this code, isn't sustainable.

I already have s390 in my testing matrix; I run the crypto and CRC tests
on all architectures with optimized crypto or CRC code.  But most of the
s390 optimized crypto code isn't actually being executed.

- Eric

