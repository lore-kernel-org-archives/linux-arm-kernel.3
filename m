Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82585CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVVeH203zAmGRP0DuVWqFAOGfqNL3SAM4RDa6jsxtz4=; b=m5P3ROtAQ47xzTsbUvWMeP94Mh
	r9Feyok2TK9a3WI4NoLefWqgaXAm0o/0iFhKkIDHZUyV2Ys5PGFdKJQQ8mww7EdmLYn9mwoLTy6uC
	PXtKVvNUVFkPEVrJIPmg/UVI6KoMdXKqjdbAMl0fVBJh8Qql5O3bxQ21uyaX9sSqdtMopIc6QkYX3
	rtmV/KglkfQf8CjZfglzVJBamqi3k/agoX324qZIUHFkisPCz0jMIV6VPVirjKGDULE1eOJ4er5st
	ybnAbw3Yj3piyRQ7m0+HnV7d4bZYmj72CX7kcytlCJFkk+UWBi2KmBkZRiYOOho1xJzOWuRDoOAtU
	GPxfTg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWGH-00000004WjT-1Hfw;
	Thu, 30 Oct 2025 17:16:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEWGG-00000004WjH-0Y2m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 17:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88D6861DB0;
	Thu, 30 Oct 2025 17:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFAFC4CEF1;
	Thu, 30 Oct 2025 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761844591;
	bh=4W6mLwI645saXzV/fLjJuWsB2SIdukbVmVT6B8Em+80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfF02DO6mfd7mOHj9apVUr1Fz9ikSY9AlhkEJ25UTT0VwD9d8AhNJlMJQ+zplNqzd
	 L4gpcAiDIKM9uUTFdGYb/A5l2sjUoUND2Uj/HhRSCRxDdznB6FXY553wARR05IMWGq
	 WHeIaqc5OrQD1mTslH68BLQgzY28pUbAb5bNAbgY9wHJCSjD3UN1Zx8T1Op7D5Se35
	 4mHK26DWpD42wsvrX3bjGUMOmn9Z53rVhSTdUy17C2UhJGi1Vo1dMMeegZbfAAey0L
	 ZRu034TWIEZUf8ky6LIe2k/28IcOr664DPVLDQsZvR2xZU+3H0mUuATSYm7dpwNpdo
	 /xjPOrSMg+DcQ==
Date: Thu, 30 Oct 2025 10:14:53 -0700
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
Message-ID: <20251030171453.GA1624@sol>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <ba3ff3d5183ab78b3d02d8db30223def@linux.ibm.com>
 <20251029163216.GA1603@sol>
 <fa8bc10f36b1aeb9ffe1abf6350adbc1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa8bc10f36b1aeb9ffe1abf6350adbc1@linux.ibm.com>
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

On Thu, Oct 30, 2025 at 11:10:22AM +0100, Harald Freudenberger wrote:
> On 2025-10-29 17:32, Eric Biggers wrote:
> > On Wed, Oct 29, 2025 at 10:30:40AM +0100, Harald Freudenberger wrote:
> > > > If the s390 folks could re-test the s390 optimized SHA-3 code (by
> > > > enabling CRYPTO_LIB_SHA3_KUNIT_TEST and CRYPTO_LIB_BENCHMARK), that
> > > > would be helpful.  QEMU doesn't support the instructions it uses.  Also,
> > > > it would be helpful to provide the benchmark output from just before
> > > > "lib/crypto: s390/sha3: Add optimized Keccak function", just after it,
> > > > and after "lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest
> > > > functions".  Then we can verify that each change is useful.
> > [...]
> > > 
> > > Picked this series from your ebiggers repo branch sha3-lib-v2.
> > > Build on s390 runs without any complains, no warnings.
> > > As recommended I enabled the KUNIT option and also
> > > CRYPTO_SELFTESTS_FULL.
> > > With an "modprobe tcrypt" I enforced to run the selftests
> > > and in parallel I checked that the s390 specific CPACF instructions
> > > are really used (can be done with the pai command and check for
> > > the KIMD_SHA3_* counters). Also ran some AF-alg tests to verify
> > > all the the sha3 hashes and check for thread safety.
> > > All this ran without any findings. However there are NO performance
> > > related tests involved.
> > 
> > Thanks!  Just to confirm, did you actually run the sha3 KUnit test and
> > verify that all its test cases passed?  That's the most important one.
> > It also includes a benchmark, if CONFIG_CRYPTO_LIB_BENCHMARK=y is
> > enabled, and I was hoping to see your results from that after each
> > change.  The results get printed to the kernel log when the test runs.
> > 
> 
> Here it is - as this is a zVM system the benchmark values may show poor
> performance.
> 
> Oct 30 10:46:44 b3545008.lnxne.boe kernel: KTAP version 1
> Oct 30 10:46:44 b3545008.lnxne.boe kernel: 1..1
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     KTAP version 1
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # Subtest: sha3
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # module: sha3_kunit
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     1..21
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 1 test_hash_test_vectors
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 2
> test_hash_all_lens_up_to_4096
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 3
> test_hash_incremental_updates
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 4
> test_hash_buffer_overruns
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 5 test_hash_overlaps
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 6
> test_hash_alignment_consistency
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 7
> test_hash_ctx_zeroization
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 8
> test_hash_interrupt_context_1
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 9
> test_hash_interrupt_context_2
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 10 test_sha3_224_basic
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 11 test_sha3_256_basic
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 12 test_sha3_384_basic
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 13 test_sha3_512_basic
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 14 test_shake128_basic
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 15 test_shake256_basic
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 16 test_shake128_nist
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 17 test_shake256_nist
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 18
> test_shake_all_lens_up_to_4096
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 19
> test_shake_multiple_squeezes
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 20
> test_shake_with_guarded_bufs
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=1: 14
> MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=16: 109
> MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=64: 911
> MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=127:
> 1849 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=128:
> 1872 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=200:
> 2647 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=256:
> 3338 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=511:
> 5484 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=512:
> 5562 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=1024:
> 8297 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=3173:
> 12625 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=4096:
> 11242 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: len=16384:
> 12853 MB/s
> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 21 benchmark_hash
> Oct 30 10:46:44 b3545008.lnxne.boe kernel: # sha3: pass:21 fail:0 skip:0
> total:21
> Oct 30 10:46:44 b3545008.lnxne.boe kernel: # Totals: pass:21 fail:0 skip:0
> total:21
> Oct 30 10:46:44 b3545008.lnxne.boe kernel: ok 1 sha3

Thanks!  Is this with the whole series applied?  Those numbers are
pretty fast, so probably at least the Keccak acceleration part is
worthwhile.  But just to reiterate what I asked for:

    Also, it would be helpful to provide the benchmark output from just
    before "lib/crypto: s390/sha3: Add optimized Keccak function", just
    after it, and after "lib/crypto: s390/sha3: Add optimized one-shot
    SHA-3 digest functions".

So I'd like to see how much each change helped, which isn't clear if you
show only the result at the end.

If there's still no evidence that "lib/crypto: s390/sha3: Add optimized
one-shot SHA-3 digest functions" actually helps significantly vs. simply
doing the Keccak acceleration, then we should drop it for simplicity.

> > > What's a little bit tricky here is that the sha3 lib is statically
> > > build into the kernel. So no chance to unload/load this as a module.
> > > For sha1 and the sha2 stuff I can understand the need to have this
> > > statically enabled in the kernel. Sha3 is only supposed to be
> > > available
> > > as backup in case of sha2 deficiencies. So I can't see why this is
> > > really statically needed.
> > 
> > CONFIG_CRYPTO_LIB_SHA3 is a tristate option.  It can be either built-in
> > or a loadable module, depending on what other kconfig options select it.
> > Same as all the other crypto library modules.
> 
> I know and see this. However, I am unable to switch this to 'm'. It seems
> like the root cause is that CRYPTO_SHA3='y' and I can't change this to 'm'.
> And honestly I am unable to read these dependencies (forgive my ignorance):
> 
> CONFIG_CRYPTO_SHA3:
> SHA-3 secure hash algorithms (FIPS 202, ISO/IEC 10118-3)
>  Symbol: CRYPTO_SHA3 [=y]
>   Type  : tristate
>   Defined at crypto/Kconfig:1006
>     Prompt: SHA-3
>     Depends on: CRYPTO [=y]
>     Location:
>       -> Cryptographic API (CRYPTO [=y])
>         -> Hashes, digests, and MACs
>           -> SHA-3 (CRYPTO_SHA3 [=y])
>   Selects: CRYPTO_HASH [=y] && CRYPTO_LIB_SHA3 [=y]
>   Selected by [y]:
>     - CRYPTO_JITTERENTROPY [=y] && CRYPTO [=y]

Well, all that is saying is that there is a built-in option that selects
SHA-3, which causes it to be built-in.  So SHA-3 being built-in is
working as intended in that case.  (And it's also intended that we no
longer allow the architecture-optimized code to be built as a module
when the generic code is built-in.  That was always a huge footgun.)  If
you want to know why something that needs SHA-3 is being built-in, you'd
need to follow the chain of dependencies up to see how it gets selected.

- Eric

