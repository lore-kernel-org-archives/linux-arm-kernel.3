Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50594C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi51dpPgViUc7kNHpk+bG/Vw71wJkxDGEMjXY3rOv90=; b=kkJg2gZrtNC1PQ+3UYUDPHYK0t
	ZzkRfMCUr+KQHME5nK92NX91CIopY9EpLPk1W8wwgKsBp6lSLGscodYjUPzXEQ05Q6B3KnJj1F0uj
	rv5maFoxwPeZPi2EZM8SQPrIUnqUx7Uqky5nGI3DtDe5gmuGR0QZmyHQ12uLNX6rLYKRMcJerIyBK
	mvqwZO0AF4mtpozuMnFFfALCzoY4zrpojG+FrSRVgZ390rAeKn/n5TgwZ31EBTlLYyI/4Lk/nGq0r
	jFBZV5BcnSQvyEcJUApPh5VWI22INKPiC4W9c8OahIgccEpHvm5zzF7OOrCURk8sGZs+BbbmKBKQq
	wUVFyR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvX3-00000001oJZ-3YZ6;
	Sat, 07 Jun 2025 15:32:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvUt-00000001oEt-2bR8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 15:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0663B6111C;
	Sat,  7 Jun 2025 15:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FAEC4CEE4;
	Sat,  7 Jun 2025 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749310214;
	bh=sKLJ4kqThC0sq9tHJe28wjzBnsYeSUl8eVTtMw6w7Qo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JtKcuTqxNFkIqCZvcIgYM76jlOv/FOoHHN6heQKOFsV54aCDxtu4fbt6BuXM5fyZm
	 NEiEBaEG1EapV3JJhhRcVPbHYPO409vaatyvjwvoLK6Ai/j8KopoqdAVkfa0bM8cFY
	 zspq8OhpgBliZDx50vBOMJGqdGVldfL+AEbXl5wu7QSiU+Ype9AI5WyIkDGMkzUSfR
	 ytxWWxxvYTIkSkuu9Zgvo+GhqOtAQksKPwiJMo3bHnEUkFUzVclD/788bkocOmzyPK
	 qSXDi0x6oRwtATeqsR8qFNxRzCFO8/CbojlTjCHIf8kKVGzJdKCn/mfgl9UOHb/37x
	 ESz1tGgX1fc7A==
Date: Sat, 7 Jun 2025 16:30:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH] iio: adc: axp20x_adc: Add missing sentinel to AXP717
 ADC channel maps
Message-ID: <20250607163007.21da58c0@jic23-huawei>
In-Reply-To: <20250607135627.2086850-1-wens@kernel.org>
References: <20250607135627.2086850-1-wens@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat,  7 Jun 2025 21:56:27 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The AXP717 ADC channel maps is missing a sentinel entry at the end. This
> causes a KASAN warning.
> 
> Add the missing sentinel entry.
> 
> Fixes: 5ba0cb92584b ("iio: adc: axp20x_adc: add support for AXP717 ADC")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Applied to my temporary fixes tree.  I'll rebase that on rc1 in next few days.

J
> ---
>  drivers/iio/adc/axp20x_adc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/axp20x_adc.c b/drivers/iio/adc/axp20x_adc.c
> index 71584ffd3632..1b49325ec1ce 100644
> --- a/drivers/iio/adc/axp20x_adc.c
> +++ b/drivers/iio/adc/axp20x_adc.c
> @@ -187,6 +187,7 @@ static struct iio_map axp717_maps[] = {
>  		.consumer_channel = "batt_chrg_i",
>  		.adc_channel_label = "batt_chrg_i",
>  	},
> +	{ }
>  };
>  
>  /*


