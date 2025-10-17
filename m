Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D37CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikNtldnSiUcpDgaP+TWXKLJJ0mTUmGGvhRvHoOOj/RE=; b=AgbPA4rvQJ8p7T21CVrU1WuD4v
	fTT2vnTYVN9N0JKsbyWrkf2hBY5CZTeQj8L2TmwGvtWvaJAKPQIA5cVfCbAINvwuXyQrCTXlRkVx2
	14XdlJBg3tvuig7mzOUiPYWfgOgzsS8IdUl0Akb0JkytAjYKdbH4HF1+uuJFpEwlyVRA6WYzbQX9p
	JsE7xRtzyhq2YZMSAZD5MYdIv9pbv/xJziKrja0oYGPzQ1UpuOoCRsOIjs2g8JGc/P47ZX53NuoUp
	YorEegcfc1XYjNKC4OJPIuS4rqZPI3f8Bm5fOjO71hD6zrh5nX8Ggb3oP485/u0k2Ay458y4vqV2U
	f1oL8xUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dwH-00000006mEh-2wgG;
	Fri, 17 Oct 2025 06:27:45 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dwE-00000006mCl-1DQb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:27:43 +0000
Received: from [192.168.0.5] (ip5f5af782.dynamic.kabel-deutschland.de [95.90.247.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id EA4F16028F341;
	Fri, 17 Oct 2025 08:26:57 +0200 (CEST)
Message-ID: <8fa346e3-308f-4ecb-af57-0fd643351765@molgen.mpg.de>
Date: Fri, 17 Oct 2025 08:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] spi: aspeed: fix spelling mistake "triming" ->
 "trimming"
To: Colin Ian King <coking@nvidia.com>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251016153000.9142-1-coking@nvidia.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251016153000.9142-1-coking@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_232742_477403_E626E278 
X-CRM114-Status: GOOD (  13.03  )
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

Dear Colin,


Thank you for the patch.

Am 16.10.25 um 17:30 schrieb Colin Ian King:
> There is a spelling mistake in a dev_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <coking@nvidia.com>
> ---
>   drivers/spi/spi-aspeed-smc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 0c3de371fd39..f3a7189afd51 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -539,7 +539,7 @@ static int aspeed_spi_trim_window_size(struct aspeed_spi *aspi)
>   	} while (total_sz > aspi->ahb_window_size);
>   
>   	if (trimmed) {
> -		dev_warn(aspi->dev, "Window size after triming:\n");
> +		dev_warn(aspi->dev, "Window size after trimming:\n");
>   		for (cs = 0; cs < aspi->data->max_cs; cs++) {
>   			dev_warn(aspi->dev, "CE%d: 0x%08x\n",
>   				 cs, chips[cs].ahb_window_size);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

