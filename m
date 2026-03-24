Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EA0F532E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvzzUSpr+EbbnecMvm1F2VOXLbjzf1bq8YTw+uICp5w=; b=tzbTuJReTxwoQBI5gpfBeFk+3z
	hqc8L8oceD++VxTFPKASXDnWmRm+zbtn7Dio8VbwdVG4C7U9Eci8kVXRqp1YwcATZ6XGwXd3ivBre
	AECTWct/E9eX4LH+mmWe3+6J2klLEBYuH4WVpkxqNmfUAZGR23GFfj/dW4xQKsoLm+ngjXTcffzTP
	3tolpQmK4h5FKYQrlOpor4N3uHsTCW43/0xYzYSq0Gd+7zgwoeOeCMz0Px/uRvNIskrOSvPvNn788
	MGJBf7mjQzEZprStV7Y8VuW77Ya+/XfVY6mE39YDtPsEyQm6p2424v7V6cwqfzVpxOZYiYqJCh1mQ
	PPtqssCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5B9h-00000002M5m-0PoK;
	Tue, 24 Mar 2026 23:27:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5B9e-00000002M5O-3ikU;
	Tue, 24 Mar 2026 23:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8737643448;
	Tue, 24 Mar 2026 23:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233C6C19424;
	Tue, 24 Mar 2026 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774394842;
	bh=7Vksh/TZbAbO2ZdMTl4B7tAMqUDtCF8BMGNIcRTQQSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4Up3lKqsTJ3zA02PVZEJYOgzoUtGJISGUakPl4rAUImUrn+UgsknQlJHaRjt57lL
	 8JWg8RWsV4B0DKiXiKQj4ruMsCnTFfp2DZ6VPmpx+EVpkyylr4eNa2eBM1EB04qYbE
	 cgUn6EaeXjb8IRyke2xPHl48rwxIgKkfKqU7RMlyrwbLTcndVJ13JPflqV7/Q9kBL8
	 Vm7ml0IaPzD24ag4Th1J0lkTTd+t6EiJ8hI3W2P6VS9fu3o9c1BsUFkYxxsOLAioYB
	 fsrmsTXqx87TXptkHPy0kFW1xkhve7dVL93RwuLXwBU6feouEQQT6QFdwZ3ifla6q6
	 WFZPq95BI9Y/A==
Date: Tue, 24 Mar 2026 16:27:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 00/12] SM3 library
Message-ID: <20260324232720.GA3622@quark>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_162722_963620_E059729A 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, Mar 20, 2026 at 09:09:23PM -0700, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sm3-lib-v1
> 
> This series cleans up the kernel's existing SM3 hashing code:
> 
> - First, it updates lib/crypto/sm3.c to implement the full SM3 instead
>   of just SM3's compression function.
> 
> - Next, it adds a KUnit test suite for the new library API.
> 
> - Next, it replaces the "sm3-generic" crypto_shash with a wrapper around
>   the new library API.
> 
> - Finally, it accelerates the API using the existing SM3 assembly code
>   for arm64, riscv, and x86.  The architecture-specific crypto_shash
>   glue code for SM3 is no longer needed and is removed.
> 
> This should look quite boring.  It's the same cleanup that I've already
> done for the other hash functions.
> 
> Note: I don't recommend using SM3.  There also don't appear to be any
> immediate candidate users of the SM3 library other than crypto_shash.
> 
> Still, this seems like the clear way to go.  It's simpler, and it gets
> the hash algorithms integrated in a consistent way.  We won't have to
> keep track of two quite different ways of doing things.  With KUnit the
> code becomes much easier to test and benchmark, as well.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

