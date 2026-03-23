Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B52D58CD7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 05:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3TWGYyW8KDTrte31FhfEVEVVaJCQ8UpNi/ywekTLs4=; b=sQan7ZUMQXVCtqQF0P14fGQB/F
	N3eOsOPl24Buk6KC2E5Q5Uo+IBQqUvRxpoNLLPLJ64GeWJDly/1Yy7LphEn7JB0Zi9zFwkuyA3g9v
	5X+lO48ci9PGWDMBcOTQCH7Ba2nAbRAwwgD9RCC7AtD00Lumt4WSa/wUSgCSrOSAxQPgPHLnROteJ
	UNZAOQh/loSS92pDOwTVYg+u2bnWagihjjDsCXoE7xHtX3oRpeodKlw2PAUgWxBfoSNt2+MaY6R2e
	oOZxZAYBho5BT1HyVqt6wH4VcbuT1k9bK0gcaGmCIu660GxHOSg7w70g3IdWxouvTTk+Dned4+Scl
	Yc2SPl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Y5I-0000000G4Sy-1n4x;
	Mon, 23 Mar 2026 05:44:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Y5E-0000000G4SA-496S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 05:44:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08CAD401F1;
	Mon, 23 Mar 2026 05:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E54C4CEF7;
	Mon, 23 Mar 2026 05:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774244649;
	bh=Ir8hCmjyPf2Ze81ZaE3IWsYRpbwEsWy/ErIWhj8mOsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m39DqGfvrDfGdMll05g6haD4ZbZQ/mZgMPqVS1mUjOVIddG0gLO8oMBCs5+J9MkA9
	 B0StEfTEvIMQYlHgpN0GrbDtPGVIT65E9CriYl6rwh6rbc7osj/sd8QRAAsQZGwIQo
	 KKWuEE2obSPln8OPzTZInmKPXSIctRtGozAPDCdDe7GKoSfGixK/brC8Tsw378rWfz
	 dHfGZyeJYgmuJHzSNKi9kO0jEQVEzf0DW76Esv/+da4M+M8hm0FQd9EVdSTv+rwh7s
	 JRLbqFXrzVSNs0tRXDnmH2LfWAtPRANGxA9Qe7egLllaYElTMJs2KSvycl/M+iBsfu
	 Lf8FItyNR5mbQ==
Date: Mon, 23 Mar 2026 07:44:05 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Ethan Luna <trunixcodes@zohomail.com>
Cc: peterhuewe@gmx.de, jgg@ziepe.ca, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tpm: i2c: atmel: fix block comment formatting
Message-ID: <acDTJbHJOHIQRUsY@kernel.org>
References: <20260322193112.27010-1-trunixcodes@zohomail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322193112.27010-1-trunixcodes@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_224413_098713_D325BA3E 
X-CRM114-Status: GOOD (  29.01  )
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

On Sun, Mar 22, 2026 at 12:30:53PM -0700, Ethan Luna wrote:
> Multiple block comments in tpm_i2c_atmel.c placed the closing '*/' on the
> same line as the comment text. This violates the kernel's preferred
> comment style, which requires the closing delimiter to appear on it's
> line.
> 
> Fix the formatting to improve readability and resolve checkpatch
> warnings.
> 
> Signed-off-by: Ethan Luna <trunixcodes@zohomail.com>
> ---
>  drivers/char/tpm/tpm_i2c_atmel.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
> index 4f229656a8e2..702b3c9191dc 100644
> --- a/drivers/char/tpm/tpm_i2c_atmel.c
> +++ b/drivers/char/tpm/tpm_i2c_atmel.c
> @@ -33,7 +33,8 @@ struct priv_data {
>  	size_t len;
>  	/* This is the amount we read on the first try. 25 was chosen to fit a

If you fix this up here.

>  	 * fair number of read responses in the buffer so a 2nd retry can be
> -	 * avoided in small message cases. */
> +	 * avoided in small message cases.
> +	 */
>  	u8 buffer[sizeof(struct tpm_header) + 25];
>  };
>  
> @@ -58,7 +59,9 @@ static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>  	if (status < 0)
>  		return status;
>  
> -	/* The upper layer does not support incomplete sends. */
> +	/*
> +	 * The upper layer does not support incomplete sends.
> +	 */
>  	if (status != len)
>  		return -E2BIG;
>  
> @@ -78,7 +81,8 @@ static int i2c_atmel_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>  
>  	/* Get the message size from the message header, if we didn't get the
>  	 * whole message in read_status then we need to re-read the
> -	 * message. */
> +	 * message.
> +	 */
>  	expected_len = be32_to_cpu(hdr->length);
>  	if (expected_len > count)
>  		return -ENOMEM;
> @@ -113,13 +117,15 @@ static u8 i2c_atmel_read_status(struct tpm_chip *chip)
>  
>  	/* The TPM fails the I2C read until it is ready, so we do the entire
>  	 * transfer here and buffer it locally. This way the common code can
> -	 * properly handle the timeouts. */
> +	 * properly handle the timeouts.
> +	 */
>  	priv->len = 0;
>  	memset(priv->buffer, 0, sizeof(priv->buffer));
>  
>  
>  	/* Once the TPM has completed the command the command remains readable
> -	 * until another command is issued. */
> +	 * until another command is issued.
> +	 */
>  	rc = i2c_master_recv(client, priv->buffer, sizeof(priv->buffer));
>  	dev_dbg(&chip->dev,
>  		"%s: sts=%d", __func__, rc);
> @@ -174,7 +180,8 @@ static int i2c_atmel_probe(struct i2c_client *client)
>  
>  	/* There is no known way to probe for this device, and all version
>  	 * information seems to be read via TPM commands. Thus we rely on the
> -	 * TPM startup process in the common code to detect the device. */
> +	 * TPM startup process in the common code to detect the device.
> +	 */
>  
>  	return tpm_chip_register(chip);
>  }
> -- 
> 2.53.0
> 

The same comment applies for all.

BR, Jarkko

