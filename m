Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F077FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vyq9LsaKRB6gfboV0Kj4MLcDiGDYHMdZH9ONtCsXtqY=; b=gXcRerPFZNGZCOqEAlb7vZM4HM
	OfYQBVmZM2anVprNesSo9e+BGXdOYtVsjtcIVxpI7Mx3B6YAYAcrw9HCcrKWDvpJF15pa9vF21U/B
	CwKgh6VnYlnIysa47cjggiaXiNg9qf/w9flNlZFKcYq4JXExlQwA/UJDY+RE6GkNd/nXH7vEBYtpD
	/Fu1N/SAw0CeqYGw2twYLh/QN+J7va8sX5tZBGhO5AOPlFjnD74cMPNGGkH6ItGO3swSJuC1/4vAt
	pe6YC55gazwPo+IYhErMLN5fFRRWQ5PiB6LaPbLNY7UZA6OEviWv0WL8z5ZfRIMSewHuIWjCqYWCa
	pwByXQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPc7-0000000HRyv-1VZX;
	Mon, 27 Apr 2026 17:19:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPc2-0000000HRsL-0JmC;
	Mon, 27 Apr 2026 17:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vyq9LsaKRB6gfboV0Kj4MLcDiGDYHMdZH9ONtCsXtqY=; b=Mtd00NnWpRYNvm20r5Ria8JTn4
	obEnKSrMlBWBO9QpjSZBrCMB8CCst0ycW/9/T7djksxpHwWtFFZFOaFioHFSY47UnKvGFCwmI66m7
	7op3FuJmvoE1TMF+1HEZ0W4sP7nx7Okp544rztHRxulg81ygNr+l/iQL6EXhA8fWNsLJYCQ9Aq9Ve
	j+w3T6Mig0fuCwsLiSElbCAAZuTfG8d7KwlIC/+us/8jgZ/uuYA1WeeVHyEkuSb7we7fOt4sCM8kw
	uJrXD9C27pKFasMbVCc7AVmDdkMHj6lbXtXKsyTbPhH/PqNNfwCLbt2302y535emSGBJXh7KIEeRP
	hQRHldAA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPby-00000001Ddg-21uT;
	Mon, 27 Apr 2026 17:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E54405A3;
	Mon, 27 Apr 2026 17:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CADC2BCB5;
	Mon, 27 Apr 2026 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777310346;
	bh=mepkGGhsNTUJswO/3b4246rhiRDTDWXlZZW2YA/w71w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VK1GySpR/+ruwGR+XpTEZu6x0iADUCf91xLH8L3bhPIdG+pvpT9ssxCS0989Sew7V
	 L7hsSv7HFAeLG57GPDHtbc+Az66WYRGam54gYYGs1Y9t4MD1fMZE4Lhtr/NiLBIW1b
	 PD3YBfH6p5hE+/y2kzPZGf7XbdwB7VsRx2GNTay4hRZnlwZIuRVQhI4DR0X05i/g1N
	 ZUMuJna6+WQDOyhIs0D20LSta/kt0AaTzbBEb12ICwZ5WVog5bQD7JJHHzVQn359Eo
	 q1RNCDItCIXw2+r/eUeA/JkM8dtXm/tWjfad4wuQYztW85SAZUCxjkbt4rRec0k7v+
	 /Abd13yBi3Pog==
Date: Mon, 27 Apr 2026 18:18:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Salah Triki <salah.triki@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] iio: adc: mt6359: fix unchecked return value in
 mt6358_read_imp
Message-ID: <20260427181856.613a22ee@jic23-huawei>
In-Reply-To: <20260427165759.5756-1-salah.triki@gmail.com>
References: <20260427165759.5756-1-salah.triki@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_181910_842545_4769A445 
X-CRM114-Status: GOOD (  27.04  )
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

On Mon, 27 Apr 2026 17:57:59 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> In mt6358_read_imp(), the return value of regmap_read() is currently
> ignored. This is problematic because if the bus read fails the variable
> val_v remains uninitialized.
> 
> The function subsequently assigns this uninitialized stack value to
> *vbat, leading to incorrect measurement results being reported to
> the IIO subsystem without any error indication.
> 
> Update the function to check the return value of regmap_read(). Ensure
> that mt6358_stop_imp_conv() is still called to clean up the hardware
> state before returning the error code.
> 
> Fixes: 3587914bf61 ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
> Changes in v2:
> - Added Fixes tag.
> - Re-examined the entire driver for unchecked regmap operations.
>   While several regmap_write() and regmap_set_bits() calls also ignore
>   return values, I focused on this specific regmap_read() in 
>   mt6358_read_imp() because it leads to an uninitialized variable usage
>   (val_v). This makes this fix critical for reporting correct data 
>   to userspace.

I'd be more concerned about what it might otherwise report.. Will expose
something random that was on the stack previously.

Ok on this one having a fixes tag given the uninitialized, though as I mentioned
I'd have been tempted to take the approach of just initialising it.

Even with the code as you have it here a static analyzer may not be able
to see far enough to tell it is initialized and so throw false positive warnings.

Still, let's see what Andy thinks before you change anything.

J
> 
>  drivers/iio/adc/mt6359-auxadc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
> index 6b9ed9b1fde2..f927bff4a26a 100644
> --- a/drivers/iio/adc/mt6359-auxadc.c
> +++ b/drivers/iio/adc/mt6359-auxadc.c
> @@ -497,10 +497,13 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
>  		return ret;
>  
>  	/* Read the params before stopping */
> -	regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
> +	ret = regmap_read(regmap, reg_adc0 + (cinfo->imp_adc_num << 1), &val_v);
>  
>  	mt6358_stop_imp_conv(adc_dev);
>  
> +	if (ret)
> +		return ret;
> +
>  	if (vbat)
>  		*vbat = val_v;
>  	if (ibat)


