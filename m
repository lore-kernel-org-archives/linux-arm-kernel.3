Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D2F9934F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNarZHX7up/TphmE4tnOmXqiHsHnPUPO/i+h900x9do=; b=WhdnXs079cEBWSedF0wWghBa4M
	0dQPM2S5CBZdNjhZkFRqNubJ/5Zs6GJuofzyGyixl6dkA1AiZ6RPI/q9e09Pm3cf7k+rUwwrl6reL
	WqSGHO3dsrfFmXk+5EvesUiU2ijw/0ZIXnkplrCS4Dec0P1xWgX7vz4lRHzmCNFucW5/1ulqj7xP2
	d/+eDFanYzxfZkdHBdV9nMRevIMSAA7cTZwV3BU3nXhVWPDgFPefbExAvAzk3el9q3YPHozBUo/OT
	eRhfXVEKJ42LgGQknJGTEdehZ02Ui+7Ew3AoSUaIxGjexjcAphgKz7y1ULwunw3UvWFkdSqNH6y5x
	CSfaVTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFovt-0000000BByh-15S1;
	Thu, 23 Apr 2026 07:57:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFovq-0000000BBy1-36p2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:57:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18FB94096B;
	Thu, 23 Apr 2026 07:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC8EC4AF09;
	Thu, 23 Apr 2026 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776931026;
	bh=rde83I2Ib+S3G9tlWBa7R9Z2TIsgb5yXSMuw/2Hc87w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=cycOqC3MxQO5a9vy9aFVxJRXie2CvuUQe6gqXcDhpygndIVs4BmlKevQguio4/0MO
	 61Kxq5jXxcSN/qTrIvQObH3OSgXBvDKKOQG/j3a8J06tnj+IqmgOYwa5h8WYW+iIuc
	 gvEJuX6lWZEX6B/Pmw95rN3rqGw8HurscsA9Xt+yzPk2lNgX4qof5gkSssmCKTo3Nu
	 e1MfL3GYSpBFSox/W/8Vru5a5Fo4BQ4cMjJAR70tfV2cQSO/BWBksZIvkWiVcpsozd
	 4IBtSCDKG3hjCkvtD0mAcacgm/H4hynYgkqBW6FJe1yAWlKLqWTuRmdWtrET4HXHkn
	 N58HhJnmJBQPw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id A888BF4006B;
	Thu, 23 Apr 2026 03:57:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 23 Apr 2026 03:57:04 -0400
X-ME-Sender: <xms:0NDpadyaSdXjeciFtxGcgN3T5_3xlLrtCaDch4N-CZRrvYFqpsHthg>
    <xme:0NDpaYFr11coyxe4jSxYa_HPwJlVMf20azMZJ3Nr88_Sejy2b16EkxOBn85Q52fZv
    Jdr6-G-LDaEgcy4C_wrgBnOqq1QL2WSpgLRY23aZDkrDUcJ_N4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiieeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtg
    hpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehlrdhr
    uhgsuhhstghhsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgvrhgsvghrthesghhonh
    guohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehlihhnuhhsfieskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidrug
    gvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmih
    gtrhhotghhihhprdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrseht
    uhigohhnrdguvghv
X-ME-Proxy: <xmx:0NDpaVqnhChLo-R4wQt5RnnKclckhH2Gt74Q9QV87PheWkUx9zDchQ>
    <xmx:0NDpafzuzOxDrNkqYLHKTXx33I-2j3KbpjkaysSRAVfOTAoUQ83Sgw>
    <xmx:0NDpaRs34ZOWJJ2WF2tIBqEQSIO4jev80Y8o3rLaHkfEK2guNZXwXA>
    <xmx:0NDpaQ03tddDwDT-xwonfl8Pb4QWJ5yqhg7_6YvgHlPcdEjbiAC17Q>
    <xmx:0NDpaRBAiird2vxrcV4sUmRK-9c9st0TT6cTJIF6xaX8etpWaHvPHjK9>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7DFE570006B; Thu, 23 Apr 2026 03:57:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 09:56:44 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Lothar Rubusch" <l.rubusch@gmail.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Thorsten Blum" <thorsten.blum@linux.dev>, davem@davemloft.net,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, "Linus Walleij" <linusw@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <9fe57e89-ca52-4062-976f-5a91a9617680@app.fastmail.com>
In-Reply-To: <20260422210936.20095-4-l.rubusch@gmail.com>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
 <20260422210936.20095-4-l.rubusch@gmail.com>
Subject: Re: [PATCH v3 3/3] crypto: atmel-sha204a - fix non-blocking read logic
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_005706_824408_B61C1321 
X-CRM114-Status: GOOD (  23.45  )
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



On Wed, 22 Apr 2026, at 23:09, Lothar Rubusch wrote:
> The non-blocking path was (also) failing to provide valid entropy
> due to improper buffer management and a lack of hardware execution
> time.
>
> Ensure cmd.msecs (30ms) and cmd.rxsize (35ms) are initialized before
> enqueuing the background work. Fix the data offset to skip the
> 1-byte hardware count header when copying bits to the caller. Correctly
> return 0 (busy) to the hwrng core while hardware execution is in
> progress, preventing zero-filled buffers, which was the situation
> before.
>
> With this fix applied, tests will look similar to this:
> $ socat -u OPEN:/dev/hwrng,nonblock - | head -c 32 | hexdump -C
> 00000000  23 cc 42 3c 90 b1 38 fc  54 37 35 4b 09 c5 e1 0d  
> |#.B<..8.T75K....|
> 2026/03/23 14:30:18 socat[858] E read(5, 0x55be363000, 8192): Resource 
> temporarily unavailable
> 00000010  73 3b af d9 02 70 76 bd  2d 59 4b 12 01 ac ae 2b  
> |s;...pv.-YK....+|
> 00000020
>
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A 
> random number generator")
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/crypto/atmel-sha204a.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/crypto/atmel-sha204a.c 
> b/drivers/crypto/atmel-sha204a.c
> index f7dc00d0f4cd..04cbf80c1411 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -33,7 +33,6 @@ static void atmel_sha204a_rng_done(struct 
> atmel_i2c_work_data *work_data,
>  				     "i2c transaction failed (%d)\n",
>  				     status);
>  		kfree(work_data);
> -		rng->priv = 0;
>  		atomic_dec(&i2c_priv->tfm_count);
>  		return;
>  	}
> @@ -49,20 +48,19 @@ static int 
> atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
> 
>  	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
> 
> -	/* Verify if data available from last run */
>  	if (rng->priv) {
>  		work_data = (struct atmel_i2c_work_data *)rng->priv;
> -		max = min(sizeof(work_data->cmd.data), max);
> -		memcpy(data, &work_data->cmd.data, max);
> +		max = min_t(size_t, ATMEL_RNG_BLOCK_SIZE, max);
> +		memcpy(data, &work_data->cmd.data[1], max);
> 

Please combine this with the buffer size fix in the previous patch.

> -		/* Now, free memory */
> +		/* Free memory and clear the in-flight flag */
>  		kfree(work_data);
>  		rng->priv = 0;
>  		atomic_dec(&i2c_priv->tfm_count);
>  		return max;
>  	}
> 
> -	/* When a request is still in-flight but not processed */
> +	/* If a request is still in-flight, return 0 (busy) */
>  	if (atomic_read(&i2c_priv->tfm_count) > 0)
>  		return 0;
> 
> @@ -76,8 +74,14 @@ static int atmel_sha204a_rng_read_nonblocking(struct 
> hwrng *rng, void *data,
>  	work_data->client = i2c_priv->client;
> 
>  	atmel_i2c_init_random_cmd(&work_data->cmd);
> +
> +	/* Set the execution time for the RNG command (from datasheet) */
> +	work_data->cmd.msecs = ATMEL_RNG_EXEC_TIME;
> +	work_data->cmd.rxsize = RANDOM_RSP_SIZE;
> +

Again, this is either redundant or wrong.

>  	atmel_i2c_enqueue(work_data, atmel_sha204a_rng_done, rng);
> 
> +	/* Return 0 to indicate 'busy', data will be ready on next call */
>  	return 0;
>  }
> 
> -- 
> 2.53.0

