Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F015FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 05:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tPjm9Uf3NKJvMMBbxCFfneSEMJK6XWxv+xS1+nI6cg=; b=R0gvvi5DJfLAt93Wg0qiDkhJRb
	UbVBy5YnDhLYfqTvkKl6FdAJg8ni3w6uOabJrP/81700XG0XWjF7BYZk3DMUZIKvsKfGHI8DkZ1pr
	E2aBKggMv+UHJmeJYDDk5Xiozcq2o0DNW5YruO/3UMY41Mr0TYb9wLQ8jjVxov1BElNGQ/5e/6/tS
	FuTEvQtZmAxJw8huZmDTceu7csS0TB7YkFrp6QUIXWU2fC4kFdaaH7j1Nfmxk5qQk+ivDdObuM0vz
	oO+oY+WNHfpurWKZjVSRMtATfQS0DxRzhIGKEx56ocSUushKwuhsM0Xh/CnM9WuwRPT4N49c7PZNh
	LUYzwnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbTV-00000000bWk-0Yko;
	Tue, 28 Apr 2026 05:59:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHbTT-00000000bWW-42ks
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 05:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E41AC60008;
	Tue, 28 Apr 2026 05:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E92FC4AF0B;
	Tue, 28 Apr 2026 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777355950;
	bh=Z131pWvCBWP164teAh+JpB+9PtGkpkZGiO3EcZg8kQQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Spzh9/hAjSAOGFD5knYwVWy6QKd40o+Y0RRQA+hx0aEy1UPUWGoCnLWAdm2mAi3kq
	 p+0bVyn3zhFv73SlnDPHJeDMozDvoqJr8qv41ChZc68NGzI48GYaH+6KYlPVtY+/IK
	 g63RclO8V2p4IcgaLWzpb4ICUVHB9f0WGbmEnvAIxvrDx27BQo+6Fbz4kMncNMLhRW
	 25DAP3dXtl7c7DBFSmjdMaMvd6dZQqdJ/80oe3/v8iLRopWTNZEhvyOCldUQrDpfy6
	 1jWWlBsduBjWnf4Z9Knlzk+d++c2r+OFfVyvLnr1OfLMl4i3eGRRf7pjaU6PEk9TM7
	 vc5eU8xXooY7w==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5C6D7F4007A;
	Tue, 28 Apr 2026 01:59:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 28 Apr 2026 01:59:09 -0400
X-ME-Sender: <xms:rUzwaXFzuizy1XFX83i-oqJxB8BJXX68pyGUpyrctQp6qfZ2B1-oPQ>
    <xme:rUzwafKA1dS2FEuYvzls3OBwYibCMi-MBuQifp7kk83w7UjXJrqFf7AtWlFjcnbYS
    FaU9j0J_uZKQEast2WUbosP5sVWw9Rw8a61SrRpB26c4LAC_YavDi8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdektdejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepkeevteduteehkeekteeugfdvvdekudevffejvddtueehuedvueegudfhtdet
    hfdunecuffhomhgrihhnpehmvghtiiguohifugdrtghomhdpmhhitghrohgthhhiphdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegr
    rhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqd
    effedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgu
    rdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgt
    phhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrh
    gsvghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehkrggs
    vghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhho
    tghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigoh
    hnrdguvghv
X-ME-Proxy: <xmx:rUzwafU5KOBfn_KqisZuPK60_2neVLsLyi5eIGRZ7Y-o5NWpckPESA>
    <xmx:rUzwabS-1Bbg_ktbOA-sEBgOhG01T9g4lzczZoj58yVwo1PbS6y2Rw>
    <xmx:rUzwaUA4UonvYoYl2cPE3oDpFSLsKOAm3BwB7pmJdYm1UMUg9wQhUQ>
    <xmx:rUzwabu6C-Imp5MeJ52Pgv8SC_Itk29uXFuHcY_H5WvvXcfwovxlYg>
    <xmx:rUzwaa8LkTbS-zh_qwvjl71zU2TeG2I1A0SerHcptyy3yp9MFd7RxHMK>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3275B700065; Tue, 28 Apr 2026 01:59:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AW4IFdmKBNXF
Date: Tue, 28 Apr 2026 07:58:39 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Thorsten Blum" <thorsten.blum@linux.dev>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>
Cc: stable@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <2d42b1fc-b5d5-4dcb-8dc8-62580502f586@app.fastmail.com>
In-Reply-To: <20260427124030.315590-3-thorsten.blum@linux.dev>
References: <20260427124030.315590-3-thorsten.blum@linux.dev>
Subject: Re: [PATCH] crypto: atmel-sha204a - drop hwrng quality reduction for ATSHA204A
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Thorsten,

On Mon, 27 Apr 2026, at 14:40, Thorsten Blum wrote:
> Commit 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to
> lowest possible") reduced the hwrng quality to 1 based on a review by
> Bill Cox [1]. However, despite its title, the review only tested the
> ATSHA204, not the ATSHA204A.
>
> In the same thread, Atmel engineer Landon Cox wrote "this behavior has
> been eliminated entirely"[2] in the ATSHA204A and "this problem does not
> affect the ATECC108 or the ATECC108A (or the ATSHA204A)"[3].
>
> According to the official ATSHA204A datasheet [4], the device contains a
> high-quality hardware RNG that combines its output with an internal seed
> value stored in EEPROM or SRAM to generate random numbers. The device
> also implements all security functions using SHA-256, and the driver
> uses the chip's Random command in seed-update mode.
>
> Keep 'quality = 1' for ATSHA204, but drop the explicit hwrng quality
> reduction for ATSHA204A and fall back to the hwrng core default.
>

Interesting! Thanks for digging this up.

> [1] 
> https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
> [2] 
> https://www.metzdowd.com/pipermail/cryptography/2014-December/023852.html
> [3] 
> https://www.metzdowd.com/pipermail/cryptography/2014-December/023886.html
> [4] 
> https://ww1.microchip.com/downloads/en/DeviceDoc/ATSHA204A-Data-Sheet-40002025A.pdf
>
> Fixes: 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to 
> lowest possible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 40 ++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> index dbb39ed0cea1..df69fb190e52 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -19,6 +19,25 @@
>  #include <linux/workqueue.h>
>  #include "atmel-i2c.h"
> 
> +enum atmel_sha204a_variant {
> +	ATSHA204 = 1,
> +	ATSHA204A,
> +};
> +

I agree that setting quality to '1' is only appropriate for the ATSHA204
but this looks a bit clunky to me.

Can we retain the comment here that you deleted below, and add
something like

static const unsigned short atsha204_quality = 1;

> +static const struct of_device_id atmel_sha204a_dt_ids[] __maybe_unused = {
> +	{ .compatible = "atmel,atsha204",  .data = (void *)ATSHA204 },
> +	{ .compatible = "atmel,atsha204a", .data = (void *)ATSHA204A },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
> +
> +static const struct i2c_device_id atmel_sha204a_id[] = {
> +	{ .name = "atsha204",  .driver_data = ATSHA204 },
> +	{ .name = "atsha204a", .driver_data = ATSHA204A },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, atmel_sha204a_id);
> +

Then, move these back to the old location, and point .data /
.driver_data to &atsha204_quality for atsha204 only.


>  static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
>  				   void *areq, int status)
>  {
> @@ -171,11 +190,8 @@ static int atmel_sha204a_probe(struct i2c_client *client)
>  	i2c_priv->hwrng.name = dev_name(&client->dev);
>  	i2c_priv->hwrng.read = atmel_sha204a_rng_read;
> 
> -	/*
> -	 * According to review by Bill Cox [1], this HWRNG has very low 
> entropy.
> -	 * [1] 
> https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
> -	 */
> -	i2c_priv->hwrng.quality = 1;
> +	if ((uintptr_t)i2c_get_match_data(client) == ATSHA204)
> +		i2c_priv->hwrng.quality = 1;
> 

Here you can override the field by dereferencing the match data if it
is non-NULL.

Alternatively, you could store the quality in the device_id structs
directly, but I think this is slightly more idiomatic.


>  	ret = devm_hwrng_register(&client->dev, &i2c_priv->hwrng);
>  	if (ret)
> @@ -202,20 +218,6 @@ static void atmel_sha204a_remove(struct i2c_client *client)
>  	kfree((void *)i2c_priv->hwrng.priv);
>  }
> 
> -static const struct of_device_id atmel_sha204a_dt_ids[] __maybe_unused = {
> -	{ .compatible = "atmel,atsha204", },
> -	{ .compatible = "atmel,atsha204a", },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
> -
> -static const struct i2c_device_id atmel_sha204a_id[] = {
> -	{ "atsha204" },
> -	{ "atsha204a" },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(i2c, atmel_sha204a_id);
> -
>  static struct i2c_driver atmel_sha204a_driver = {
>  	.probe			= atmel_sha204a_probe,
>  	.remove			= atmel_sha204a_remove,

