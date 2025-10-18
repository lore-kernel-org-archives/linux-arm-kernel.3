Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8EACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkaCz6QqL8OZMUg5UjNBWr38rK9WXmvMsbf2Ke1GoJA=; b=oSkfkFu2ooL2n6Zddicv/QmCDO
	n8SHsvsAHKg7GLzyBYw93bYEZpb+XIyheDGB5ZRrz/+o8a4LH9FFRlprv/3K1FA942vVzPg4hrxsB
	FFBarSuerxEryN7N/yVYOzdhEcRJL1xeRgWuzzSVS5UpCXfB3J8FIrT7Q0OhuEy2EUveHeTyEWnbb
	3loIJl2Dz8IWXFOtB0caR2O9MBhZtcFaJb6DvT0nWSlvJn0zNtfLbOsuPDCRQN/KEOsWe96xVK135
	1nnxhsxjuQR69Cvn9FjvpbTMIN7JnkGs0X+L5FFAwAR5yQ37nMvHrXP9Uz/y892jzxkOlKOblQKps
	rXF1Bdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA36e-00000009jOg-2JtF;
	Sat, 18 Oct 2025 09:20:08 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA36b-00000009jOA-3PmK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 09:20:07 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cpbJ13kd9z9sSC;
	Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJxa1yDcQJwG; Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cpbJ12blgz9sS8;
	Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 468C38B765;
	Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0rhQCqUhMXYB; Sat, 18 Oct 2025 11:00:33 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BD6D8B764;
	Sat, 18 Oct 2025 11:00:32 +0200 (CEST)
Message-ID: <f2e43e3f-b4fc-4ebd-b6ae-7e610b2ea164@csgroup.eu>
Date: Sat, 18 Oct 2025 11:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/17] arm64/sha3: Rename conflicting functions
To: David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel
 <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>,
 Ignat Korchagin <ignat@cloudflare.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20251017144311.817771-1-dhowells@redhat.com>
 <20251017144311.817771-3-dhowells@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251017144311.817771-3-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_022006_015342_E1BB7587 
X-CRM114-Status: GOOD (  14.66  )
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



Le 17/10/2025 à 16:42, David Howells a écrit :
> Rename the arm64 sha3_* functions to have an "arm64_" prefix to avoid
> conflict with generic code.

Same comment as previous patch, the functions are static, why would they 
conflict with generic code ?

Also generic code doesn't have such functions at the moment, are they 
added by a follow patch ?

Christophe


> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Jason A. Donenfeld <Jason@zx2c4.com>
> cc: Ard Biesheuvel <ardb@kernel.org>
> cc: Catalin Marinas <catalin.marinas@arm.com>
> cc: Will Deacon <will@kernel.org>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: linux-crypto@vger.kernel.org
> cc: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm64/crypto/sha3-ce-glue.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
> index b4f1001046c9..426d8044535a 100644
> --- a/arch/arm64/crypto/sha3-ce-glue.c
> +++ b/arch/arm64/crypto/sha3-ce-glue.c
> @@ -31,7 +31,7 @@ MODULE_ALIAS_CRYPTO("sha3-512");
>   asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
>   				 int md_len);
>   
> -static int sha3_update(struct shash_desc *desc, const u8 *data,
> +static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
>   		       unsigned int len)
>   {
>   	struct sha3_state *sctx = shash_desc_ctx(desc);
> @@ -55,8 +55,8 @@ static int sha3_update(struct shash_desc *desc, const u8 *data,
>   	return len;
>   }
>   
> -static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
> -		      u8 *out)
> +static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
> +			    u8 *out)
>   {
>   	struct sha3_state *sctx = shash_desc_ctx(desc);
>   	struct crypto_shash *tfm = desc->tfm;
> @@ -90,8 +90,8 @@ static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
>   static struct shash_alg algs[] = { {
>   	.digestsize		= SHA3_224_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-224",
>   	.base.cra_driver_name	= "sha3-224-ce",
> @@ -102,8 +102,8 @@ static struct shash_alg algs[] = { {
>   }, {
>   	.digestsize		= SHA3_256_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-256",
>   	.base.cra_driver_name	= "sha3-256-ce",
> @@ -114,8 +114,8 @@ static struct shash_alg algs[] = { {
>   }, {
>   	.digestsize		= SHA3_384_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-384",
>   	.base.cra_driver_name	= "sha3-384-ce",
> @@ -126,8 +126,8 @@ static struct shash_alg algs[] = { {
>   }, {
>   	.digestsize		= SHA3_512_DIGEST_SIZE,
>   	.init			= crypto_sha3_init,
> -	.update			= sha3_update,
> -	.finup			= sha3_finup,
> +	.update			= arm64_sha3_update,
> +	.finup			= arm64_sha3_finup,
>   	.descsize		= SHA3_STATE_SIZE,
>   	.base.cra_name		= "sha3-512",
>   	.base.cra_driver_name	= "sha3-512-ce",
> 
> 


