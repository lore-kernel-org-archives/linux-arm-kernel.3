Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFE1CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjrPPBq+iR4nnSkwtllKiL42WjmcB34JK/l+415Ki0c=; b=O9/4rfblfX9cZdbNkUM78t36va
	Un6D7aXToLQYKLUNw6N3h3B4VrQ1PG3tmroCjTCuSbwaE48pS92y6Qtcjca+0LsdxjOni8RgnLbOD
	yZgu61Z55zYmVbWTte1wWL788rTe7oUznabYZWyl4XlHFyG8E62jUrCu2x+i2RA5zeSweQP/GTTUD
	NcdaOS9jEsmup8s9x90RvBh3vjC1WcZKFtkw3cRxEs40+cj8lPSuIpPD8ct9buQxYATCnldmD8q2p
	z+96kai7+K9sEMqODGjX3ep5EkOHCp9/pE7/x6oZCQqMgMonLrg+L/uYdn5m0oyfZljGOggS1Efab
	mCQIR1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb6V-0000000932h-2QWy;
	Thu, 11 Jun 2026 08:49:35 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb6T-0000000931y-3WK4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=mjrPPBq+iR4nnSkwtllKiL42WjmcB34JK/l+415Ki0c=; 
	b=D+zVFGlYVBiAlCc+qMJqwMjeeX27SaN7ui+bRf5XgLO1qdr5xH3LJ3PpF13CZDsMDT7cWQB4Yay
	PMcfuIrOC9tOyZzO4g74R52TPN9cWtkMi4Y6HpxITewMspw4xOVKyi4f0oS8dMXmjryrEKtJ8mwnN
	L96by4VuAvPAyIO+xzFFyVMn6Ynp/EBdq/dwUrv3mMejw1OEZgeZYbxcmMJ0EFO3wuqdZA+QehUwA
	M7nKdbxyMzkz3J0bJeXkUzhFu/w33VCFxD1goHWWxNN/6ujoIhxShyyksnwrt/6GFcxXXTaa9d+Df
	ig6MF0/i53VK2V9A6gS5fPN+rdqPp6FSppLg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXb6N-00000004XVq-0UA2;
	Thu, 11 Jun 2026 16:49:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Jun 2026 16:49:27 +0800
Date: Thu, 11 Jun 2026 16:49:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mounika Botcha <mounika.botcha@amd.com>,
	Harsh Jain <h.jain@amd.com>, Olivia Mackall <olivia@selenic.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] Xilinx TRNG fix and simplification
Message-ID: <aip2l1pwMY4UDBdA@gondor.apana.org.au>
References: <20260531191738.55843-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531191738.55843-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_014933_879452_62BD8E9B 
X-CRM114-Status: GOOD (  13.23  )
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

On Sun, May 31, 2026 at 12:17:34PM -0700, Eric Biggers wrote:
> This series fixes and greatly simplifies the Xilinx TRNG driver by:
> 
> - Removing the gratuitous crypto_rng interface, leaving just hwrng which
>   is the one that actually matters.
> 
> - Replacing the really complicated AES based entropy extraction
>   algorithm with a much simpler one.
> 
> Note that this mirrors similar changes in other drivers.
> 
> Eric Biggers (4):
>   crypto: xilinx-trng - Remove crypto_rng interface
>   crypto: xilinx-trng - Fix return value of xtrng_hwrng_trng_read()
>   crypto: xilinx-trng - Replace crypto_drbg_ctr_df() with HMAC-SHA512
>   hwrng: xilinx - Move xilinx-rng into drivers/char/hw_random/
> 
>  MAINTAINERS                                   |   2 +-
>  arch/arm64/configs/defconfig                  |   2 +-
>  crypto/Kconfig                                |   5 -
>  crypto/Makefile                               |   2 -
>  crypto/df_sp80090a.c                          | 222 ------------------
>  drivers/char/hw_random/Kconfig                |  11 +
>  drivers/char/hw_random/Makefile               |   1 +
>  .../xilinx => char/hw_random}/xilinx-trng.c   | 134 ++---------
>  drivers/crypto/Kconfig                        |  13 -
>  drivers/crypto/xilinx/Makefile                |   1 -
>  include/crypto/df_sp80090a.h                  |  53 -----
>  11 files changed, 37 insertions(+), 409 deletions(-)
>  delete mode 100644 crypto/df_sp80090a.c
>  rename drivers/{crypto/xilinx => char/hw_random}/xilinx-trng.c (75%)
>  delete mode 100644 include/crypto/df_sp80090a.h
> 
> 
> base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
> prerequisite-patch-id: 07e982b663ac3f8312ca524f6b91b5b38661df5e
> prerequisite-patch-id: 72064361a8f36e015ab0b7e1fa4d364b40d90506
> prerequisite-patch-id: 8978b8e0db7f47935e5f6f0aff14a97f55d3073c
> prerequisite-patch-id: 6aa0e3e93a008279d71e535a3d0cf48643f55e19
> -- 
> 2.54.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

