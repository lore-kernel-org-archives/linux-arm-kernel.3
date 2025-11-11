Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C01CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DPsHWx6jPinfRtb3w5NImsRtHilZg/C4866XyYtI5U=; b=0K++Oq/KUkqXVJHD5lDd+xJsxD
	efaACEpOKcPCtkT/OhEOrNsArj5DFqO0P+OfPQ+O08dkncfkHxbtAkQcmVl2S+5q9OwOVNhgR/zD+
	VF13KSrXxhewfGv0Oc1ewaVEmAzepbiJyw2k27p5+NFhEJX89g7ej2A7ZUfP89ZO4jfIoV3BlHiYj
	j3Tv3cV2EVCk+v77zOSDBSb8O8pjjbzvXAAshC6H0Et2bi9rWVwNb/I8Htug8FvsvQb71PpLfagYd
	ztkpwepfu5Nqhh1hruhFXVvWzjB+eIZ5I9X7IVWKGKXV5YPfkqnGZ8LcMnHAaHGQx8fN2YWKVI3w5
	dIkmR6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu3y-00000007h05-0Wkh;
	Tue, 11 Nov 2025 19:29:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu3x-00000007gzr-1jxA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 842C560202;
	Tue, 11 Nov 2025 19:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAC0C4CEF7;
	Tue, 11 Nov 2025 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762889396;
	bh=QEQRyRtbWV2VK7CgqH0yvvXph5ozEnh5UmyQPeLfVak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIO2W4OtgKY8Tu7AnSbQwCcBHruQkERn9khHXG5ZP9BkFDGtNiLrOEt8qgyIIiS7a
	 Q16FiKtsbrCwHX4c6inNBoli/nGF3K6U6ryZF3NIk9W8U1qYo0T1YPfshZZ2QqU55q
	 ctougBfuUO26wUOAEkGD+cvECce2Qv4IaLwvlKNUFbtS0oZnkAx13sdupkf+VvVEUA
	 0dxzWNpdDA26tHFOfz2apRmUjhcPUkqmpkuV64/xyVFdd7+LHkKJpBKSSKTaSllMEe
	 OuLl0gVinFmgCF44b6Db5HkTbX9yBV4Y7lTY63mi5MTmcVncvrgHL3hS3GjWnBcAtr
	 O8cu7OLX4j1AQ==
Date: Tue, 11 Nov 2025 11:28:15 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 0/9] POLYVAL library
Message-ID: <20251111192815.GA1748@sol>
References: <20251109234726.638437-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109234726.638437-1-ebiggers@kernel.org>
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

On Sun, Nov 09, 2025 at 03:47:15PM -0800, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git polyval-lib-v1
> 
> This series migrates the POLYVAL code to lib/crypto/.  It turns out that
> just like Poly1305, the library is a much better fit for it.
> 
> This series also replaces the generic implementation of POLYVAL with a
> much better one.
> 
> Notably, this series improves the performance of HCTR2, since it
> eliminates unnecessary overhead that was being incurred by accessing
> POLYVAL via the crypto_shash API.  I see a 45% increase in throughput
> with 64-byte messages, 53% with 128-byte, or 6% with 4096-byte.
> 
> It also eliminates the need to explicitly enable the optimized POLYVAL
> code, as it's now enabled automatically when HCTR2 support is enabled.
> 
> Eric Biggers (9):
>   crypto: polyval - Rename conflicting functions
>   lib/crypto: polyval: Add POLYVAL library
>   lib/crypto: tests: Add KUnit tests for POLYVAL
>   lib/crypto: arm64/polyval: Migrate optimized code into library
>   lib/crypto: x86/polyval: Migrate optimized code into library
>   crypto: hctr2 - Convert to use POLYVAL library
>   crypto: polyval - Remove the polyval crypto_shash
>   crypto: testmgr - Remove polyval tests
>   fscrypt: Drop obsolete recommendation to enable optimized POLYVAL
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

