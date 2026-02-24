Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718EEF4BB62
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4jNIzatVrtMgWJBfSmaGgWhvgVjZBLgbs+9hhJpJW4=; b=iGizHUlq/Z7Zecg9aEa2ZIY/gP
	f+PlmZuLDWSdJoU0IuO3lX3TzpCdMk24pPyRzucFk+2WV6CilkUGwU/SDA02HUGfTDk1C/sC1GgSr
	dLvRVCe6G6im/o9j5BF1ooPcBPdz0QmBxL6vCsTn6nMR7cnfQcpl0chgst3MvCkjKA6VRqagN6BmE
	aJdglpKfEL4E46McC3dpZQsKTEJLhd3IknVHjke7/dt1oAtB84Mrv//PuM89y9OJpWLwmSOySAmse
	YftzBlBhE2Ti7k7vZiZSPxRW4/J13flpUX/7n/X+s0jJDHje6Hzdr55gynFFHkuKFiJQrrAouljL6
	md6fCSXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw4J-00000002U51-01XT;
	Tue, 24 Feb 2026 17:19:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuw4G-00000002U4F-1ECN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:19:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09693339;
	Tue, 24 Feb 2026 09:19:20 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECBA43F59E;
	Tue, 24 Feb 2026 09:19:24 -0800 (PST)
Date: Tue, 24 Feb 2026 17:19:22 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christoph Hellwig <hch@lst.de>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted
 blk_status_t
Message-ID: <aZ3dmvNZnJYxL8vA@arm.com>
References: <202602230947.uNRsPyBn-lkp@intel.com>
 <20260224145528.GA13793@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224145528.GA13793@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_091928_458301_E84D67B1 
X-CRM114-Status: GOOD (  21.08  )
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

On Tue, Feb 24, 2026 at 03:55:28PM +0100, Christoph Hellwig wrote:
> On Mon, Feb 23, 2026 at 09:23:07AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> > commit: bc26e2efa2c5bb9289fa894834446840dea0bc31 fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
> > date:   6 weeks ago
> > config: arm64-randconfig-r134-20260223 (https://download.01.org/0day-ci/archive/20260223/202602230947.uNRsPyBn-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project d8f778935a5bf8a173a3c1d886fd736a4ef6cf05)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230947.uNRsPyBn-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202602230947.uNRsPyBn-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> >    fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
> > >> fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t
> > 
> > vim +67 fs/crypto/bio.c
> > 
> >     61	
> >     62	static void fscrypt_zeroout_range_end_io(struct bio *bio)
> >     63	{
> >     64		struct fscrypt_zero_done *done = bio->bi_private;
> >     65	
> >     66		if (bio->bi_status)
> >   > 67			cmpxchg(&done->status, 0, bio->bi_status);
> >     68		fscrypt_zeroout_range_done(done);
> >     69		bio_put(bio);
> >     70	}
> >     71	
> 
> It looks like some arm64 configs generate sparse warnings when using
> cmpxchg on __bitwise types.  Any chance I could prod the arm64 maintainers
> into looking into this?

It looks like sparse doesn't like the __bitwise cast to unsigned long in
the arm64 cmxchg code. We could force the type cast, not sure whether it
hides any real issues. Another option is to do the force cast in bio.c
but I don't think that code is doing anything wrong:

diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index d7a540736741..6cf3cd6873f5 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -91,8 +91,9 @@ __XCHG_GEN(_mb)
 #define __xchg_wrapper(sfx, ptr, x)					\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__ret = (__typeof__(*(ptr)))					\
-		__arch_xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
+	__ret = (__force __typeof__(*(ptr)))				\
+		__arch_xchg##sfx((__force unsigned long)(x), (ptr),	\
+				  sizeof(*(ptr)));			\
 	__ret;								\
 })
 
@@ -175,9 +176,10 @@ __CMPXCHG_GEN(_mb)
 #define __cmpxchg_wrapper(sfx, ptr, o, n)				\
 ({									\
 	__typeof__(*(ptr)) __ret;					\
-	__ret = (__typeof__(*(ptr)))					\
-		__cmpxchg##sfx((ptr), (unsigned long)(o),		\
-				(unsigned long)(n), sizeof(*(ptr)));	\
+	__ret = (__force __typeof__(*(ptr)))				\
+		__cmpxchg##sfx((ptr), (__force unsigned long)(o),	\
+				(__force unsigned long)(n),		\
+				sizeof(*(ptr)));			\
 	__ret;								\
 })
 

-- 
Catalin

