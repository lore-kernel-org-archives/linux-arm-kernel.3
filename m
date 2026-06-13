Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33C4CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6Yfl0Uwg0BDUcS8cQ6OpAhkSkDfEgqDZ4hAaNO3jB4=; b=3vy40F2M6BF0htYKPdHlAR3ByC
	8yIPaehbSADacAWyLN/dZ0g5oL5fIjwDceCKRL8Fid1mKc2Vo7IQhTXxrm/MfCJIn6lSMvwkqt6Go
	vV/md09pPW4/bNoZE0slDFb0jEIKYp5AZfelTugyljKVsS9RhYhh+dz0OrVxqELL8mzwjIyQQmU7P
	l91k7sEGmufxFQjr63vwgEcr/gOPM5q7HdcRkCAsIqTnbwISlgpYQfzYaJfcsYd1I5RCMKPB827hD
	gEIuY36Tf0o34+pahVRLXnFisgBA0breh7317y4A50mqk+DzYizZV+e0wOeN/mDn7GdnxgZLMSjDH
	NlRtRb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYPHN-0000000CLwM-0vuq;
	Sat, 13 Jun 2026 14:24:09 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYPHJ-0000000CLvz-3svs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 14:24:07 +0000
Date: Sat, 13 Jun 2026 16:23:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781360643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v6Yfl0Uwg0BDUcS8cQ6OpAhkSkDfEgqDZ4hAaNO3jB4=;
	b=U37ReKluIKfFX2O9SyLBVovVvFsAjbn21u7eeb7/2LYmXsFmlnu+ZUuD9KcyUVJtiC0SB+
	iO3Bmk4hTxScH5rhpYx0Ulseuko7d8JRw/nEv5z8zeQa6s2M38q+Cz9cgbCPR6Q7pNvYox
	2s8t2zyY/zNdcfqLg64abgQ2JFk8FnI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - drop unused curve id from
 atmel_ecdh_ctx
Message-ID: <ai1n_1FbXrLIRZUt@linux.dev>
References: <20260611105159.460794-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611105159.460794-3-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_072406_133683_6D02511D 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, Jun 11, 2026 at 12:52:01PM +0200, Thorsten Blum wrote:
> ->curve_id is only set once, but never used - remove it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index 9da9dd6585df..93f219558c2f 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -33,7 +33,6 @@ static struct atmel_ecc_driver_data driver_data;
>   * @public_key : generated when calling set_secret(). It's the responsibility
>   *               of the user to not call set_secret() while
>   *               generate_public_key() or compute_shared_secret() are in flight.
> - * @curve_id   : elliptic curve id
>   * @do_fallback: true when the device doesn't support the curve or when the user
>   *               wants to use its own private key.
>   */
> @@ -41,7 +40,6 @@ struct atmel_ecdh_ctx {
>  	struct i2c_client *client;
>  	struct crypto_kpp *fallback;
>  	const u8 *public_key;
> -	unsigned int curve_id;
>  	bool do_fallback;
>  };
>  
> @@ -250,7 +248,6 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
>  	struct crypto_kpp *fallback;
>  	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
>  
> -	ctx->curve_id = ECC_CURVE_NIST_P256;
>  	ctx->client = atmel_ecc_i2c_client_alloc();
>  	if (IS_ERR(ctx->client)) {
>  		pr_err("tfm - i2c_client binding failed\n");

I'll need to rebase and resend this assuming [1] is applied first, as it
currently doesn't apply cleanly.

[1] https://lore.kernel.org/lkml/20260609100552.233494-3-thorsten.blum@linux.dev/

