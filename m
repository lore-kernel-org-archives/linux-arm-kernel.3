Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE0ACD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqVcGbH9wWwEBo3NBKFoaBwVVqPvH9y9tROxN8Pio5I=; b=mBhT/YQdlrmeFCKtnXS4RHhEi+
	0/zGv7bV7cadJ68nZgjP0n4osfaeS2U2FTHVGg12GaTj+ALXCpyc+mX56DQvvDzTt82wzsf73TxQe
	cfJ5vjmdUYvZrNsx39IHLV+vrkQiL8ntfeD4wYcyfjkIlNppHszyE5nOCERnYqhJrxZQz/C4yEHGA
	CnFqZ9YAJRhpPyfkWRSLS2w6h5EnD+DDHpCa/m8I/Y2/1Amgvpwu2ZW5/C7+ql6QRyK4Jd2f9EuWB
	0mBDOVM8LawtB4RIK7S6Nw0jPAjnmceVmNVg/Ay5lW6ZV5CaFk7fbalD3biOH1UNL0ToLiR/0PKfk
	SFOSXffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXzQ-00000008jh5-1zxI;
	Thu, 11 Jun 2026 05:30:04 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXzN-00000008jgF-18CP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=PqVcGbH9wWwEBo3NBKFoaBwVVqPvH9y9tROxN8Pio5I=; 
	b=PyzZkSqHrvTn30hmR8guFbfKcTKXfDP+a0nVvEOHmDLxPERAex/PvuqZe4MWZ1UNYfUDQLsonCN
	D6DKVr94xRJ1P1qrTePhfIalkyD2zeqL+2e2BP+AXVHqS5Hia1twuE+LQgfIP7waqNLwJQHEHSHg0
	QIYobKVv1Sl03U+w8ykUY59AOOPYWEwElgp/N1d8QSTTKfdXuaSDwcWnKR4VecVR7m2d8ur2GuAXH
	p2bo9zAIiKCUmMnj4Ii6M/bfvgOBm3wj43UsNm7T/4Va0bYYvsgK9cl/eHGuLAYfLa1ylrjobpCng
	DqD1HQE3974XCplmWUyukPPL7YKWGy1XQgmg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXXzE-00000004UDH-3vYu;
	Thu, 11 Jun 2026 13:29:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Jun 2026 13:29:52 +0800
Date: Thu, 11 Jun 2026 13:29:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - remove stale comments in
 atmel_ecc_remove
Message-ID: <aipH0NgL4Gbe7Oz1@gondor.apana.org.au>
References: <20260602165247.977197-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602165247.977197-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_223001_336164_7FBFA914 
X-CRM114-Status: GOOD (  23.22  )
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

On Tue, Jun 02, 2026 at 06:52:49PM +0200, Thorsten Blum wrote:
> atmel_ecc_remove() no longer returns -EBUSY since commit 7df7563b16aa
> ("crypto: atmel-ecc - Remove duplicated error reporting in .remove()")
> and is a void function since commit ed5c2f5fd10d ("i2c: Make remove
> callback return void").
> 
> Remove and update the outdated comments.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index 9c380351d2f9..e6068dc0a0c1 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -347,13 +347,11 @@ static void atmel_ecc_remove(struct i2c_client *client)
>  {
>  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
>  
> -	/* Return EBUSY if i2c client already allocated. */
>  	if (atomic_read(&i2c_priv->tfm_count)) {
>  		/*
>  		 * After we return here, the memory backing the device is freed.
> -		 * That happens no matter what the return value of this function
> -		 * is because in the Linux device model there is no error
> -		 * handling for unbinding a driver.
> +		 * That happens because in the Linux device model there is no
> +		 * error handling for unbinding a driver.
>  		 * If there is still some action pending, it probably involves
>  		 * accessing the freed memory.
>  		 */

Please fix this properly rather than fiddling with the comments.

Drivers should always fail gracefully if the hardware disappears.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

