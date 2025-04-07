Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682A1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuCXxemOwzi+daSzhgNPUWipNAarADZvuPuX9JnARXw=; b=MXg1HQESC+QL9Y9C6i3bbPfERz
	uOCrun2KDFOuAFs4AsOI28AyRzQmxb0fZ2MQN72aOL0p+3nHxZ0KEI5jaEEO9lFqKcUXIgDN3mKUv
	91TLn2tQfDMjhcFdPuEjSXZpLc5nEhm3oOcAVt0XBem2WQNe5th55z4e66/HqOSGcgAqF0tAqYxGU
	kZD/0UUK6ML74dmqUS+gnBTBkg0S4HrasUzkR8i31zIURrv2A7NL/A5YM7/8nJl8svFWaH1VgHsjC
	TeymmKOTnGYCJapEBfMZLLpaIxqaAzlTuft3ZUcNzX5TPpfbCPu7CD5Nw4c6K7S6TYcUqxHrZfvv7
	b/Zf59uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f66-0000000GSrO-1MQV;
	Mon, 07 Apr 2025 05:32:38 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f1X-0000000GS7R-0s8U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 05:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QuCXxemOwzi+daSzhgNPUWipNAarADZvuPuX9JnARXw=; b=TKJCRGVG2bB4Yr1Ejq+Rqc7o1w
	ZlloVXACk9ldkGz92nj6T4DjN/ATD8L0wihD0Ux5UvnmI4iQsNw5HZkEXnc586wDhLxU3ESYTn8vn
	St9/SmfcBGn6nIuntaKGOaet0Ok/CssBg2AgpPP9Gq+G3kaIsshtrciO3HWmazIbtgNNRj4HuIKpP
	FGrY40axzskgd5zAOO4O1OsO1q3gtBWCzcEjDazAmhQPZxfVeEV7mwcXyk2FhJ4R8j9h5ZbyoD/OV
	kC/rf6y6B0Hstz0YJVPK4FTuJjqYnXVj1UPz867jpLR4+a2QVelXyK7pXwWCuE4XZxzvbgjPF7rTw
	RfcghOOg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1f1P-00DNMd-0L;
	Mon, 07 Apr 2025 13:27:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 13:27:47 +0800
Date: Mon, 7 Apr 2025 13:27:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/3] crypto: arm - drop dependency on SIMD helper
Message-ID: <Z_NiU5dgIT3Wwvxe@gondor.apana.org.au>
References: <20250403071953.2296514-5-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403071953.2296514-5-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_222755_247019_02921B06 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, Apr 03, 2025 at 09:19:54AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The non-SIMD fallbacks in the ARM skcipher implementations have become
> dead code now that SIMD is always allowed in the contexts where
> skciphers may be used. So remove them.
> 
> While at it, remove the sync CTR helper function now that its last
> users have been dropped.
> 
> v2:
> - drop unnecessary includes
> - add patch #3
> 
> Ard Biesheuvel (3):
>   crypto: arm/aes-ce - stop using the SIMD helper
>   crypto: arm/aes-neonbs - stop using the SIMD helper
>   crypto: ctr - remove unused crypto_ctr_encrypt_walk()
> 
>  arch/arm/crypto/Kconfig           |   2 -
>  arch/arm/crypto/aes-ce-glue.c     | 104 ++----------------
>  arch/arm/crypto/aes-neonbs-glue.c | 116 ++------------------
>  include/crypto/ctr.h              |  47 --------
>  4 files changed, 20 insertions(+), 249 deletions(-)
> 
> 
> base-commit: 99585c2192cb1ce212876e82ef01d1c98c7f4699
> -- 
> 2.49.0.472.ge94155a9ec-goog

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

