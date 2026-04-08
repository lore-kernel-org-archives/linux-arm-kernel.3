Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30BFFD5F88
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsh4UWNOaS4eWTQc6pohKYvgavIyTrpuDxRmK3Vhtgg=; b=tbFIkXozhepCMHvzKsmuQDdzMA
	Ea94UVq0plk9dMXWYIm+4tZqA3gn74m7NHPVVuZJa/yNC/4IvRUQG5FnLs+l7fNl9tbreSNxyGQ2X
	0IUvWoMLm7dl+N17dNmYAWJ6ne5DX88eq5W/THjIhXBltBFqJrl+g5AV9FtRYjZKALyj9mUat4psp
	R9lIAtQeaOXbFJ1vILfTmpcvPGmHyoZjApus/V6HuvhBm9nm4lSmMqagzWV6WNh7NEj0K5JOABGK/
	ZMTVp0yJR6xrsGaEv6+zwgZJAFLruXzLUfnQs7/rTDMzjB6v5z0A7AIhsdPLJTtrTpdRan9hf30kv
	JGBJS3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOQX-00000008WtZ-2WH2;
	Wed, 08 Apr 2026 08:38:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOQV-00000008Wt3-35za
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B22FF44479;
	Wed,  8 Apr 2026 08:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C203C19424;
	Wed,  8 Apr 2026 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775637498;
	bh=tFO2wz8+moG8jwhFOJAx5x+1L99MAA6vAsWauEqfC8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmHU4vQta41BCXG19fXqoa5tTQlJEl6WHONqU7CIzw/YpkiDljrlZPIravgBwwtXQ
	 EYMYZMKs8c/0GVDGXUQEC2sSMlB9/y01wj35boix4K9ORlZ2/e0rAZsCSq2vJDH/d5
	 crp40HkhXdnIILqqTqe9D2YbS8Za8D0nvzoYScDW9CX1TEb1YafPe2k9Y1D6GkF2m4
	 IVcVo9ZXmR+x0MmO3E4yACg2nFzr8OvkRE1PDCATHT6yk3nbsdHS82FddOq9EdvrBf
	 j6AFyf1NddimzzhMBhiahr6Mq/saYVBjZ/4l4SuVwD5Dw2RC+S54O6+EjSDhMLB2nR
	 m60qNuRTGtWbw==
Date: Wed, 8 Apr 2026 11:38:15 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Ethan Luna <trunixcodes@zohomail.com>
Cc: peterhuewe@gmx.de, jgg@ziepe.ca, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] tpm: i2c: atmel: fix block comment formatting
Message-ID: <adYT9yeJBO9PhMBM@kernel.org>
References: <20260324154354.6268-1-trunixcodes@zohomail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324154354.6268-1-trunixcodes@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_013819_814106_384A1293 
X-CRM114-Status: GOOD (  29.61  )
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

On Tue, Mar 24, 2026 at 08:39:49AM -0700, Ethan Luna wrote:
> Multiple block comments in tpm_i2c_atmel.c placed the closing '*/' on the
> same line as the comment text. This violates the kernel's preferred
> comment style, which requires the closing delimiter to appear on its
> line.
> 
> Fix the formatting to improve readability and resolve checkpatch
> warnings.
> 
> Signed-off-by: Ethan Luna <trunixcodes@zohomail.com>
> ---
> 
> V1 -> V2: Fixed block comment formatting consistently across all multi-line comments
> V2 -> V3: Fixed trailing whitespaces consistently across all multi-line comments
> 
> v1: https://lore.kernel.org/all/20260322193112.27010-1-trunixcodes@zohomail.com/
> v2: https://lore.kernel.org/all/20260323134200.7766-1-trunixcodes@zohomail.com/
> 
>  drivers/char/tpm/tpm_i2c_atmel.c | 34 +++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
> index 4f229656a8e2..9fd73049821f 100644
> --- a/drivers/char/tpm/tpm_i2c_atmel.c
> +++ b/drivers/char/tpm/tpm_i2c_atmel.c
> @@ -31,9 +31,11 @@
>  
>  struct priv_data {
>  	size_t len;
> -	/* This is the amount we read on the first try. 25 was chosen to fit a
> +	/*
> +	 * This is the amount we read on the first try. 25 was chosen to fit a
>  	 * fair number of read responses in the buffer so a 2nd retry can be
> -	 * avoided in small message cases. */
> +	 * avoided in small message cases.
> +	 */
>  	u8 buffer[sizeof(struct tpm_header) + 25];
>  };
>  
> @@ -58,7 +60,9 @@ static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
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
> @@ -76,9 +80,11 @@ static int i2c_atmel_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>  	if (priv->len == 0)
>  		return -EIO;
>  
> -	/* Get the message size from the message header, if we didn't get the
> +	/*
> +	 * Get the message size from the message header, if we didn't get the
>  	 * whole message in read_status then we need to re-read the
> -	 * message. */
> +	 * message.
> +	 */
>  	expected_len = be32_to_cpu(hdr->length);
>  	if (expected_len > count)
>  		return -ENOMEM;
> @@ -111,15 +117,19 @@ static u8 i2c_atmel_read_status(struct tpm_chip *chip)
>  	struct i2c_client *client = to_i2c_client(chip->dev.parent);
>  	int rc;
>  
> -	/* The TPM fails the I2C read until it is ready, so we do the entire
> +	/*
> +	 * The TPM fails the I2C read until it is ready, so we do the entire
>  	 * transfer here and buffer it locally. This way the common code can
> -	 * properly handle the timeouts. */
> +	 * properly handle the timeouts.
> +	 */
>  	priv->len = 0;
>  	memset(priv->buffer, 0, sizeof(priv->buffer));
>  
>  
> -	/* Once the TPM has completed the command the command remains readable
> -	 * until another command is issued. */
> +	/*
> +	 * Once the TPM has completed the command the command remains readable
> +	 * until another command is issued.
> +	 */
>  	rc = i2c_master_recv(client, priv->buffer, sizeof(priv->buffer));
>  	dev_dbg(&chip->dev,
>  		"%s: sts=%d", __func__, rc);
> @@ -172,9 +182,11 @@ static int i2c_atmel_probe(struct i2c_client *client)
>  
>  	dev_set_drvdata(&chip->dev, priv);
>  
> -	/* There is no known way to probe for this device, and all version
> +	/*
> +	 * There is no known way to probe for this device, and all version
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

Thank you.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied.

BR, Jarkko

