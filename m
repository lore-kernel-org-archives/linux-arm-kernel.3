Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CACC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1/aC09ALOupd8pDTvROpyOLbulu3HVd8lVqFPnBvk8=; b=SgmhvkZDNF9HkWk3ydy2k296cn
	pAR1vjSqf+KrYre929pt9ZF6AoyrjCieiQlkkvnS9fncNibCan9CBMtM31Ro9409Qz8PdbQxCBMgy
	DqyQw0LRDJWN6k8DKPRPTsVBHihRu+ymbjprJq8ip8y3U/p3UYqVCzjDTzbcL9v4iNWy4ofq5180M
	8tzXWhCTuKnGBw3Lik+i7HTxTJpMZVmQBveqOyP/wRls0exZL82gra1HfybGpZ4UqkBwFTQTYX4p4
	oHEYj61Jp7SESkcXNxY2ym7sM1oEYldnReGekyHyoP8C7ySwXCt4AqbLGecP5Iv8KnOl8+rL4d99I
	w5RhjAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5caa-0000000F00b-1dEu;
	Fri, 18 Apr 2025 03:40:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cYj-0000000EzhN-2uq3;
	Fri, 18 Apr 2025 03:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2542E61120;
	Fri, 18 Apr 2025 03:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC94C4CEE2;
	Fri, 18 Apr 2025 03:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744947512;
	bh=JIccxkbUkJv2mhfcvak7GTlHD8kRGQhmDGq2CC/2MlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbV/7d47vHOJChB47qhZmb0CfoN/a3qx2MFQWBgheSbIGzLw0f2MlJ5Ku660xMDdN
	 T4loJYW/hWRNd0mew7guTwfHnu2tM8xDIubGn1ERQsyKxMx5ar2zFZUJ2Lrwbz6r98
	 yNZwbC1RlV+RdXfe82WOaIXpLWfmd2tlKB3jl32SbbQuj8P+fcZHE8UE6qTKi/BRn7
	 rRIzvkx8PAQGfQK9vD+DANxt4gQtM8rY6YozQ2Af70zxW9lO+cSmZlU7C5/oCMGSPk
	 yR8h1YTR/Hx45pr9O8JqluF6gUxSJfqBiXPtG8LY8J46QrYMhVbT8pMdKsD5QHusBf
	 izokyk+75mmyA==
Date: Thu, 17 Apr 2025 20:38:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <20250418033829.GC38960@quark.localdomain>
References: <20250405182609.404216-9-ebiggers@kernel.org>
 <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
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

On Fri, Apr 18, 2025 at 11:24:01AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > -static void __exit chacha_simd_mod_fini(void)
> > -{
> > -       if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
> > -               crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
> > -}
> > -
> > arch_initcall(chacha_simd_mod_init);
> > -module_exit(chacha_simd_mod_fini);
> 
> Why did you remove the ability to remove the module?
> 

Well, I forgot that an empty module_exit needs to be kept around for the module
to be removable.  I'll send a patch that adds these back in, though I'm doubtful
that anyone ever removes these modules in practice.

- Eric

