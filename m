Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5CCE9A75A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOaNXzVGuwH429Xp0cDVbUTlnPJwpqeEoX4QAvwXNnA=; b=Jx7MhEuUnHJ2XfPhdroUG91aCc
	qJHHTPi4Kou8wW5E0bgRXZe7S3ZzGQzskcD0f4Sd0Aeug9oBoXM5bFqc3HOfhrV4ZA0FyEXCI6dW7
	hgHgJmVSbt8FZAXhzfy9FJkgN7Aoe7/A7c3GvXwjw/nL586/R4rQrhkDxC9iA41yWL/wKcaqI+erK
	CMNzi383zREPZLUpPqt8tiiSY9hFHIuDHmpmLt4yHYN1GNg6q79QSK+e/bTh+6lHav9JGmT47gNYL
	xrzvJYqdfGVAkqBqeZi+zkTIWqnJx8+X7AS4LfZkkwVndNsV6U5JS0JD8pLO/0xF+7+MuIBz5s+8Z
	yCwvTH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4z9E-00000001DpX-2mWu;
	Tue, 24 Mar 2026 10:38:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4z9B-00000001DpB-3B1K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DD3940576;
	Tue, 24 Mar 2026 10:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA061C19424;
	Tue, 24 Mar 2026 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774348683;
	bh=vcAir2+YXNybyvB/oBcWm4qS6aRDqpLfvt3qrS1KdJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcVHWeffcJdbcc21GihRp9sele7i/Au1y9iiAADfdvwdpBjvllDi4imKP64haEO+x
	 /bTdwCHhr+hJCOjqX3ixXceovjo0pq3RfAuuU9Fp9sYzrK5MJyIkZsOx/Lhl8Kmwkj
	 mDY/Kp4hhkesIrrW12fe9qEkiqTxLf8em2AYjWsEMN7wBIem9ys2dI38S+f9jyYEUb
	 nEOiJIdPWNMxCxoGeIMip3qpsSCiZP5Xip0sWyRL8Z670SibJKQaQpcmsDwUylXXC6
	 w/2qvyu+iMtak0KWtqZFsVzmSmyQOj+dX9KJjtyxGL8ImmqNtJdexAJbpP5xZSbTgP
	 v9Mwu2FnywvvQ==
Date: Tue, 24 Mar 2026 12:37:59 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Ethan Luna <trunixcodes@zohomail.com>
Cc: peterhuewe@gmx.de, jgg@ziepe.ca, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tpm: i2c: atmel: fix block comment formatting
Message-ID: <acJph47mxNatFPC1@kernel.org>
References: <20260323134200.7766-1-trunixcodes@zohomail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323134200.7766-1-trunixcodes@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_033805_861559_37B40647 
X-CRM114-Status: GOOD (  31.39  )
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

On Mon, Mar 23, 2026 at 06:40:49AM -0700, Ethan Luna wrote:
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
> 
> v1: https://lore.kernel.org/all/20260322193112.27010-1-trunixcodes@zohomail.com/
> 
>  drivers/char/tpm/tpm_i2c_atmel.c | 34 +++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
> index 4f229656a8e2..c3cdc0d6e61c 100644
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

Almost there but when I applied it I spotted some trailing whitespace
errors:

❯ scripts/checkpatch.pl --strict -g HEAD
ERROR: trailing whitespace
#30: FILE: drivers/char/tpm/tpm_i2c_atmel.c:34:
+^I/* $

ERROR: trailing whitespace
#55: FILE: drivers/char/tpm/tpm_i2c_atmel.c:83:
+^I/* $

ERROR: trailing whitespace
#69: FILE: drivers/char/tpm/tpm_i2c_atmel.c:120:
+^I/* $

ERROR: trailing whitespace
#81: FILE: drivers/char/tpm/tpm_i2c_atmel.c:129:
+^I/* $

ERROR: trailing whitespace
#93: FILE: drivers/char/tpm/tpm_i2c_atmel.c:185:
+^I/* $

total: 5 errors, 0 warnings, 0 checks, 72 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

NOTE: Whitespace errors detected.
      You may wish to use scripts/cleanpatch or scripts/cleanfile

Commit fe31e9522c2c ("tpm: i2c: atmel: fix block comment formatting") has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

BR, Jarkko

