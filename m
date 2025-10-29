Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509AACCF9F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/I55R7wlWmhLgahb9PbgXZzswf4aRtxIP5PXnxcKRGY=; b=r2MUanaAFmDfbMFyv38QRh3Amt
	k2tsVyUfZ0kTYfMHoHrK6jtEp1KRLCgNhNR16+tTiFNX1WJap9/LVR/DSpT7bATKn+WrYWvTLjn5W
	ZCRpl9jeaA3NE/Ct3tMyDgSZPyNmkDRRMJ/gRIK3pJEvcvRyAcBFRr0KIBq0201v+9OJwGWX8pmp2
	7ErL34sLbnQ5lO2tZ2b+5lc2VwIchh6miTcXji2AWJcU2foJEfhQFJQDiqnu7hzWTPWyyhDAPXNOM
	87QOlIo2ahx0nVKTyit03AXvxCTLiv2ZwrV2N6k+OfUmBFVj1/WpG6icmyZVjFP1N9TDQzPNgIn9Z
	+VlNhUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97V-000000021UF-0FFZ;
	Wed, 29 Oct 2025 16:33:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97S-000000021RA-3Wkt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB63861D0F;
	Wed, 29 Oct 2025 16:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EC0C16AAE;
	Wed, 29 Oct 2025 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761755633;
	bh=LGi6MODFZls9CrCr3ugh6OSlLYqrlRDsSAt7naei7ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpph1lWvH6yRtjf9i40827+1RXbebmo0ZQWcr6DIT77YMPZCdi4ps4po0VbwMQ8Oz
	 4aB1MPG2mSm36IlhKds/vByYFqOcBRNwk/GkoNAa/C+CNMa6nBDbZ0hFzsoPT3YjaJ
	 uS2Lt/xh/wtdYrQTefRp+zbWSsko8rYBwh6cQPi6MAGwn8ZT0Eq8MX8yo9gfpNJdUn
	 qLFPEfZpTqjPEgH0s23N+XfgvIgx4wNeFqtElawFj/cC7RFbDIDXGclQxv6vT2an4M
	 aJ1PZJaSoPFOexHriqJ1Gtxb1Gz6M2PLxfVihJMcqJVHy5iE9nJRb23tF+8jRaHFKK
	 71FwYULh1jhaw==
Date: Wed, 29 Oct 2025 09:32:16 -0700
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
Message-ID: <20251029163216.GA1603@sol>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <ba3ff3d5183ab78b3d02d8db30223def@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba3ff3d5183ab78b3d02d8db30223def@linux.ibm.com>
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

On Wed, Oct 29, 2025 at 10:30:40AM +0100, Harald Freudenberger wrote:
> > If the s390 folks could re-test the s390 optimized SHA-3 code (by
> > enabling CRYPTO_LIB_SHA3_KUNIT_TEST and CRYPTO_LIB_BENCHMARK), that
> > would be helpful.  QEMU doesn't support the instructions it uses.  Also,
> > it would be helpful to provide the benchmark output from just before
> > "lib/crypto: s390/sha3: Add optimized Keccak function", just after it,
> > and after "lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest
> > functions".  Then we can verify that each change is useful.
[...]
> 
> Picked this series from your ebiggers repo branch sha3-lib-v2.
> Build on s390 runs without any complains, no warnings.
> As recommended I enabled the KUNIT option and also CRYPTO_SELFTESTS_FULL.
> With an "modprobe tcrypt" I enforced to run the selftests
> and in parallel I checked that the s390 specific CPACF instructions
> are really used (can be done with the pai command and check for
> the KIMD_SHA3_* counters). Also ran some AF-alg tests to verify
> all the the sha3 hashes and check for thread safety.
> All this ran without any findings. However there are NO performance
> related tests involved.

Thanks!  Just to confirm, did you actually run the sha3 KUnit test and
verify that all its test cases passed?  That's the most important one.
It also includes a benchmark, if CONFIG_CRYPTO_LIB_BENCHMARK=y is
enabled, and I was hoping to see your results from that after each
change.  The results get printed to the kernel log when the test runs.

> What's a little bit tricky here is that the sha3 lib is statically
> build into the kernel. So no chance to unload/load this as a module.
> For sha1 and the sha2 stuff I can understand the need to have this
> statically enabled in the kernel. Sha3 is only supposed to be available
> as backup in case of sha2 deficiencies. So I can't see why this is
> really statically needed.

CONFIG_CRYPTO_LIB_SHA3 is a tristate option.  It can be either built-in
or a loadable module, depending on what other kconfig options select it.
Same as all the other crypto library modules.

- Eric

