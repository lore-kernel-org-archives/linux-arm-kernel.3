Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FA8CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+tiMlOfLSmsPT5X5wVCidJgtk0/voc36EZ4EQh0kZQ=; b=f2ObonuWUwKCBoEu7ByfDl1ARo
	ZuRRmPhSe7POBpHKVvJdv20dTsg1jDXx9sTzpRULst++L+Ls69J3ONjo47p5wHYfFNbDcso+3JehZ
	Rxdmy9CI6lOJRYDN83z4NvtrSihqYk0YXL7COoAU9CpcZRTSb+eZ8yfkuCt0QsCSzg0naowOKVkO3
	OJFInzfyC3jwmykK80oFmIy+v7FInInV7En14IP20HReM2fERS5ipps8bX0sxQ4SWuKHKwWHapUdE
	Kr99zbzGf9Ry+s62WU+ovL+7xBV/oftNHceldGuzOG7epUyQVeLfnA4+UV8I+EpvyMHnkmxycI7uO
	8Syxmz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLmU-0000000COjO-0J2h;
	Tue, 04 Nov 2025 18:29:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLmS-0000000COjI-2ApQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41664601EF;
	Tue,  4 Nov 2025 18:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A13DC4CEF7;
	Tue,  4 Nov 2025 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762280958;
	bh=QOLIJdJXicTZA+aezH0oyKsN6n90p2SzQohPafNgStI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5bFng8Yxj1VH7quw6uNytqi/j7acNnD+AEHsw7XG3zCksx2e3osO/X/VBkDTXgOu
	 SMNwgYGok9yVCmFvAJRI87wPx3WHQ8Sbwdt+mCRCYcj/h4Ym0qxxkGkY1NXneYBova
	 F5cuH+sCeJxkiLhY0DoLOrcslJSZDe7vC/SeRmtyB3ZPyjJYqRch2XExq7wJhD4Wt3
	 K6QB89nopkLNxH9goli+RMVXvanjgG51ll4XQBSBJfSRTJZjt96cGBhhV1zEP7Q2cZ
	 Hf3yw3u7avczSKLEFi9GZGNmkwrgs83dTe+4auuj91udrleB2uyvFTjSLL9Y0qR/DD
	 VFsu2uJXQnNdA==
Date: Tue, 4 Nov 2025 10:27:38 -0800
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
Message-ID: <20251104182738.GA2419@sol>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <ba3ff3d5183ab78b3d02d8db30223def@linux.ibm.com>
 <20251029163216.GA1603@sol>
 <fa8bc10f36b1aeb9ffe1abf6350adbc1@linux.ibm.com>
 <20251030171453.GA1624@sol>
 <c39f6b6c110def0095e5da5becc12085@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c39f6b6c110def0095e5da5becc12085@linux.ibm.com>
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

On Tue, Nov 04, 2025 at 12:07:40PM +0100, Harald Freudenberger wrote:
> > Thanks!  Is this with the whole series applied?  Those numbers are
> > pretty fast, so probably at least the Keccak acceleration part is
> > worthwhile.  But just to reiterate what I asked for:
> > 
> >     Also, it would be helpful to provide the benchmark output from just
> >     before "lib/crypto: s390/sha3: Add optimized Keccak function", just
> >     after it, and after "lib/crypto: s390/sha3: Add optimized one-shot
> >     SHA-3 digest functions".
> > 
> > So I'd like to see how much each change helped, which isn't clear if you
> > show only the result at the end.
> > 
> > If there's still no evidence that "lib/crypto: s390/sha3: Add optimized
> > one-shot SHA-3 digest functions" actually helps significantly vs. simply
> > doing the Keccak acceleration, then we should drop it for simplicity.
[...]
> commit b2e169dd8ca5 lib/crypto: s390/sha3: Add optimized one-shot SHA-3
> digest functions:
> 
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # module: sha3_kunit
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     1..21
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 1 test_hash_test_vectors
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 2
> test_hash_all_lens_up_to_4096
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 3
> test_hash_incremental_updates
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 4
> test_hash_buffer_overruns
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 5 test_hash_overlaps
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 6
> test_hash_alignment_consistency
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 7
> test_hash_ctx_zeroization
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 8
> test_hash_interrupt_context_1
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 9
> test_hash_interrupt_context_2
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 10 test_sha3_224_basic
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 11 test_sha3_256_basic
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 12 test_sha3_384_basic
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 13 test_sha3_512_basic
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 14 test_shake128_basic
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 15 test_shake256_basic
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 16 test_shake128_nist
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 17 test_shake256_nist
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 18
> test_shake_all_lens_up_to_4096
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 19
> test_shake_multiple_squeezes
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 20
> test_shake_with_guarded_bufs
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=1: 12
> MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=16: 80
> MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=64: 785
> MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=127:
> 812 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=128:
> 1619 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=200:
> 2319 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=256:
> 2176 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=511:
> 4881 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=512:
> 4968 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=1024:
> 7565 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=3173:
> 11909 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=4096:
> 10378 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     # benchmark_hash: len=16384:
> 12273 MB/s
> Nov 04 10:50:50 b3545008.lnxne.boe kernel:     ok 21 benchmark_hash
> Nov 04 10:50:50 b3545008.lnxne.boe kernel: # sha3: pass:21 fail:0 skip:0
> total:21
> 
> commit 02266b8a383e lib/crypto: s390/sha3: Add optimized Keccak functions:
> 
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     # module: sha3_kunit
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     1..21
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     ok 1 test_hash_test_vectors
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     ok 2
> test_hash_all_lens_up_to_4096
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     ok 3
> test_hash_incremental_updates
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     ok 4
> test_hash_buffer_overruns
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     ok 5 test_hash_overlaps
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     ok 6
> test_hash_alignment_consistency
> Nov 04 10:55:37 b3545008.lnxne.boe kernel:     ok 7
> test_hash_ctx_zeroization
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 8
> test_hash_interrupt_context_1
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 9
> test_hash_interrupt_context_2
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 10 test_sha3_224_basic
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 11 test_sha3_256_basic
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 12 test_sha3_384_basic
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 13 test_sha3_512_basic
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 14 test_shake128_basic
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 15 test_shake256_basic
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 16 test_shake128_nist
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 17 test_shake256_nist
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 18
> test_shake_all_lens_up_to_4096
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 19
> test_shake_multiple_squeezes
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 20
> test_shake_with_guarded_bufs
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=1: 12
> MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=16: 211
> MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=64: 835
> MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=127:
> 1557 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=128:
> 1617 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=200:
> 1457 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=256:
> 1830 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=511:
> 3035 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=512:
> 3245 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=1024:
> 5319 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=3173:
> 9969 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=4096:
> 11123 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     # benchmark_hash: len=16384:
> 12767 MB/s
> Nov 04 10:55:38 b3545008.lnxne.boe kernel:     ok 21 benchmark_hash
> Nov 04 10:55:38 b3545008.lnxne.boe kernel: # sha3: pass:21 fail:0 skip:0
> total:21

Thanks.  So the results before and after "lib/crypto: s390/sha3: Add
optimized one-shot SHA-3 digest functions" are:

    Length (bytes)      Before            After
    ==============    ==========        ==========
         1               12 MB/s           12 MB/s
        16              211 MB/s           80 MB/s
        64              835 MB/s          785 MB/s
       127             1557 MB/s          812 MB/s
       128             1617 MB/s         1619 MB/s
       200             1457 MB/s         2319 MB/s
       256             1830 MB/s         2176 MB/s
       511             3035 MB/s         4881 MB/s
       512             3245 MB/s         4968 MB/s
      1024             5319 MB/s         7565 MB/s
      3173             9969 MB/s        11909 MB/s
      4096            11123 MB/s        10378 MB/s
     16384            12767 MB/s        12273 MB/s

Unfortunately that seems inconclusive.  len=200, 256, 511, 512, 1024,
3173 improved.  But len=16, 64, 127, 4096, 16384 regressed.

I expected the most improvement on short lengths.  The fact that some of
the short lengths actually regressed is concerning.

It's also clear the the Keccak acceleration itself matters far more than
this additional one-shot optimization, as expected.  The generic code
maxed out at only 259 MB/s for you.

I suggest we hold off on "lib/crypto: s390/sha3: Add optimized one-shot
SHA-3 digest functions" for now, to avoid the extra maintainence cost
and opportunity for bugs.

If you can provide more accurate numbers that show it's worthwhile, we
can reconsider.  Maybe set the CPU to a fixed frequency, and run
sha3_kunit multiple times (triggered via KUnit's debugfs interface)?

- Eric

