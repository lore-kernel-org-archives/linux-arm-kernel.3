Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAB8C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKnI1H6bH4Cdf0+aRcBE2xV6xY9vSuXcbUzXoEYfRuc=; b=Girh6KYo39/lkWdpsZtU3ZrWJA
	BSGIWg66VLYwBxlNulf66SrtHfNKTdo8QlL4kZWf8CPMmfEG6kz+W4IB0rmN+KGaQqJNDkGToWwAD
	YbjR3SFXdWbq2Ej5DwpdLxiZ6Wl/8ychBnfEhbVxqcbhEzlROYm2AAjqsPy/Euk+emmAk9t0egiZA
	YAhYh5o7AixsHUK1kLH2e+y83hBN0b7PulRToBoMJbA2ZPJhUZ+gI3Sw1+YnPyc++JWIZKs8sTRP/
	y4C0l3hj8vlS40uoZkS1anM7EKf1TFuXdTfBk1EcytMSbaA2iaLQHm9K1G3GckKAOO+VOZy3ziEqW
	Vf2GeeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevi1-0000000FOQo-00A7;
	Mon, 03 Feb 2025 12:37:49 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevXm-0000000FMxf-14U3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:27:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F6CF14830BD;
	Mon,  3 Feb 2025 13:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1738585624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKnI1H6bH4Cdf0+aRcBE2xV6xY9vSuXcbUzXoEYfRuc=;
	b=dcFHh2thNZzdlG/h8AL7zj5T96WsL+ZwTrkv5rpW0fA/Kbb4iKWfX1iy4NXnl+IExfYHop
	OM2xWT4w4gmASbcQBsWPh5kUdKj34Oe3rPrXk3ylNGsjiWjeVDagfe3x8y4tQpyr3i1Qs3
	z61tW7ik4TKnPj7QLFWnn/A9T6xJ+vX/LY4j8RGwXTXs5R60oK9Oyt05jvFYV4MQ7Cgq0B
	+T1VU0dr5xPXc/7tRVI7CYFm5tcrP7pi7DGNXeSlJdY4e6kLkddZv/ucgIso/5dGdkCWff
	aXLMZjF3FNIwnkApjt/Q9ykr97zmzLKwRjPYP7JXmdTtTrWuE2j2K3k7BAySwQ==
Date: Mon, 3 Feb 2025 13:27:02 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dma: Add devm_dma_request_chan()
Message-ID: <20250203-chalice-ninth-8235590e29d2@thorsis.com>
Mail-Followup-To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
 <20250124085221.766303-8-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124085221.766303-8-csokas.bence@prolan.hu>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_042714_455934_3A37B847 
X-CRM114-Status: GOOD (  21.42  )
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

Hello,

Am Fri, Jan 24, 2025 at 09:52:20AM +0100 schrieb Bence Csókás:
> Expand the arsenal of devm functions for DMA
> devices, this time for requesting channels.
> 
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
>  drivers/dma/dmaengine.c   | 30 ++++++++++++++++++++++++++++++
>  include/linux/dmaengine.h |  7 +++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index c1357d7f3dc6..02c29d26ac85 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -926,6 +926,36 @@ void dma_release_channel(struct dma_chan *chan)
>  }
>  EXPORT_SYMBOL_GPL(dma_release_channel);
>  
> +static void dmaenginem_release_channel(void *chan)
> +{
> +	dma_release_channel(chan);
> +}
> +
> +/**
> + * devm_dma_request_chan - try to allocate an exclusive slave channel
> + * @dev:	pointer to client device structure
> + * @name:	slave channel name
> + *
> + * Returns pointer to appropriate DMA channel on success or an error pointer.
> + *
> + * The operation is managed and will be undone on driver detach.
> + */
> +
> +struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name)
> +{
> +	struct dma_chan *chan = dma_request_chan(dev, name);
> +	int ret = 0;
> +
> +	if (!IS_ERR(chan))
> +		ret = devm_add_action_or_reset(dev, dmaenginem_release_channel, chan);

Why not using dma_release_channel() directly here?  What's the point
of introducing dmaenginem_release_channel() further above?

Greets
Alex

> +
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return chan;
> +}
> +EXPORT_SYMBOL_GPL(devm_dma_request_chan);
> +
>  /**
>   * dmaengine_get - register interest in dma_channels
>   */
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 346251bf1026..ffb54b52ef0c 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -1528,6 +1528,7 @@ struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
>  
>  struct dma_chan *dma_request_chan(struct device *dev, const char *name);
>  struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask);
> +struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name);
>  
>  void dma_release_channel(struct dma_chan *chan);
>  int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
> @@ -1564,6 +1565,12 @@ static inline struct dma_chan *dma_request_chan_by_mask(
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> +
> +static inline struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
>  static inline void dma_release_channel(struct dma_chan *chan)
>  {
>  }
> -- 
> 2.48.1
> 
> 
> 

