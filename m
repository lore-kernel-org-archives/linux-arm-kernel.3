Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55391CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 20:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyoiA3nX8H0bP8Ebw2fFkHIj6dbpVE1hFLubj90UyGQ=; b=SvFCn353zIc0l53F39GgA+93cg
	7VAqSYMp1FKAQHfH8YkkfP5xNZf3pqt95cCMJDAjX6s0ZWwfFaKUpPKIKUk/R6eZIvjCr+qBisz9m
	yOpqBhczvtYk7joLmSqo81ZAy05lZe+s9kV8dGNMJQ6W4NvAJtglnIM5MX40vKFHMq4eL7yXKridS
	VjWpzkZk9tx9Ygld+dSHs7agl73qhcj0nHpGCm/Vbf3wD8ol3cY3CAqpWp8AsL4PLyg1KMvHhKscO
	jGXNEWr2Fc/HRvTNh762EGH/NLdPzYe2CPkb1pqbvU2o3Nu0ygDDSj0nHiF58FgmYLOKt+0J5bfto
	5804Dcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECre-00000002oN7-1FlX;
	Wed, 29 Oct 2025 20:33:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECrc-00000002oMo-1hs5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 20:33:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87F556046B;
	Wed, 29 Oct 2025 20:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5CDC4CEF7;
	Wed, 29 Oct 2025 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761770027;
	bh=1YYHbGxitQpCKegAMWgROh9APSqbc/XP3P6OnMF3lYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/YomqmNZv9U436QyDn2L0CLJ3MWyFtp+BYSvTPSEMD1bESCtQVOc0Zcnb4jShy5I
	 5HxoAUg0W1hjky75dCBJJ739FiGnBtDbdPDiMLHGgWN0XU/inuOmxTCakOCFzm0ttE
	 6l+47dXhAPQzitQB+l7L7Yi3qTNB0yuxuiqDBpH2aFq/DrDoMBcGhhM90GCQDmU1b+
	 v7j7OpB/XgySFRM8gwVVP66ml8qCNDSrfPzR4n62Kzh8BOEvRYgUzpZinskpiiMLgf
	 o9zx+G7K+UFyHmvRZP4T3+BBwspVrCIaeB4GEOzfchkJpBLsfxL/QAfGcUSP7L/DrN
	 1IjUVcQwSkPIw==
Date: Wed, 29 Oct 2025 20:33:45 +0000
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
Message-ID: <20251029203345.GA3750798@google.com>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <ba3ff3d5183ab78b3d02d8db30223def@linux.ibm.com>
 <20251029163216.GA1603@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029163216.GA1603@sol>
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

On Wed, Oct 29, 2025 at 09:32:16AM -0700, Eric Biggers wrote:
> On Wed, Oct 29, 2025 at 10:30:40AM +0100, Harald Freudenberger wrote:
> > > If the s390 folks could re-test the s390 optimized SHA-3 code (by
> > > enabling CRYPTO_LIB_SHA3_KUNIT_TEST and CRYPTO_LIB_BENCHMARK), that
> > > would be helpful.  QEMU doesn't support the instructions it uses.  Also,
> > > it would be helpful to provide the benchmark output from just before
> > > "lib/crypto: s390/sha3: Add optimized Keccak function", just after it,
> > > and after "lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest
> > > functions".  Then we can verify that each change is useful.
> [...]
> > 
> > Picked this series from your ebiggers repo branch sha3-lib-v2.
> > Build on s390 runs without any complains, no warnings.
> > As recommended I enabled the KUNIT option and also CRYPTO_SELFTESTS_FULL.
> > With an "modprobe tcrypt" I enforced to run the selftests
> > and in parallel I checked that the s390 specific CPACF instructions
> > are really used (can be done with the pai command and check for
> > the KIMD_SHA3_* counters). Also ran some AF-alg tests to verify
> > all the the sha3 hashes and check for thread safety.
> > All this ran without any findings. However there are NO performance
> > related tests involved.
> 
> Thanks!  Just to confirm, did you actually run the sha3 KUnit test and
> verify that all its test cases passed?  That's the most important one.
> It also includes a benchmark, if CONFIG_CRYPTO_LIB_BENCHMARK=y is
> enabled, and I was hoping to see your results from that after each
> change.  The results get printed to the kernel log when the test runs.
> 

Also, can you confirm that you ran the test on a CPU that has
"facility 86", so that the one-shot digest functions get exercised?

(By the way, I recommend defining named constants somewhere in
arch/s390/ for the different facilities.  I borrowed the
"test_facility(86)" from the existing code, which does not say what 86
means.  After doing some research, it looks like it means MSA12.)

- Eric

