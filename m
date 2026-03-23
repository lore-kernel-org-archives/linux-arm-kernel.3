Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCB4EC01A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY3qNlH1WKa53nnyXIvLq7eORLnOXJlpqGy57p7bADI=; b=G3oMEEuR2DIKGkcP0Spkp7m+K8
	hIeDHVMVlPA3HWf5nGFBXXbJyK380IbTz4EyVPTaR0cH4Fdb4dqSMPcT9mTm2yS52yuqiATwHLZiP
	bjX0eW3jjePLBAqqw1GUIJ3fUi9/tfY9OC2PgoeU2SmfVuh8Z7dBxg1oc/cFzXsi77HdFM7RFWb5v
	D2sj5WEoKo8VfgJJjZGkScaTQPztJw0eTPpMoT7COk0LQ3V1e9cwqRXnUr5OcyeNiSl61FvH50tz1
	Z0yWHUf+B+Ae7dgj5kH1QtmD3CRhGFO+AwY8GBdoRDZKmztQ99Z3vXCzbw5x0ynIkGvKzrT8ed9zW
	P48OnQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a7H-0000000GF4f-3nUA;
	Mon, 23 Mar 2026 07:54:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a7F-0000000GF4J-1iJJ;
	Mon, 23 Mar 2026 07:54:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94CFE60103;
	Mon, 23 Mar 2026 07:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FFBC4CEF7;
	Mon, 23 Mar 2026 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252464;
	bh=4nI58+qRE2GtQ0izikLXOL0cpLBkhqpsV4mcS9D3lD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6p0VKN3yoPEvE4orghwUnJTvJEOytkhKlz8EFdpfxjAYOZiuKVsC4tHbcRwWqAQz
	 cWEsPnqklsXdI7DDvn3zcq8qPrm3jbKNgnlkefQ8hQ/DRQoUIuJsxViEaPztOoZdID
	 3GkqjSkU/1Z0ie8YLb3Z5aCf1H3Uu+0cDi8YAvEH3Q8ze/AHZSx3M/q3bPXHP3nnhK
	 9AwlD8ISq8CrrP3+Mbw0omPoSP84vAlOUx5bsthKksHjchWuW9qnqtPMjVDnkg1mNL
	 S7CO6haiQoQEoTcZMtOVZ4XelZm/L6iQPUYOGEv9LaSrmiIMe+PVv+bIVPckWEScF3
	 5WYEH3y0SuvZg==
Date: Mon, 23 Mar 2026 08:54:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] iio: adc: meson-saradc: add support for Meson S4
Message-ID: <20260323-quizzical-striped-husky-68e24e@quoll>
References: <20260323013408.429701-1-nick@khadas.com>
 <20260323013408.429701-3-nick@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323013408.429701-3-nick@khadas.com>
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

On Mon, Mar 23, 2026 at 09:34:06AM +0800, Nick Xie wrote:
> Add support for the SARADC found on the Amlogic Meson S4 SoC.
> According to the documentation and current testing, it is fully
> compatible with the G12A parameter set, so we reuse
> `meson_sar_adc_g12a_data` for this new compatible string.
> 
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  drivers/iio/adc/meson_saradc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 47cd350498a0d..3ac48b7842c4f 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -1313,6 +1313,11 @@ static const struct meson_sar_adc_data meson_sar_adc_g12a_data = {
>  	.name = "meson-g12a-saradc",
>  };
>  
> +static const struct meson_sar_adc_data meson_sar_adc_s4_data = {
> +	.param = &meson_sar_adc_g12a_param,
> +	.name = "meson-s4-saradc",
> +};
> +
>  static const struct of_device_id meson_sar_adc_of_match[] = {
>  	{
>  		.compatible = "amlogic,meson8-saradc",
> @@ -1341,6 +1346,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
>  	}, {
>  		.compatible = "amlogic,meson-g12a-saradc",
>  		.data = &meson_sar_adc_g12a_data,
> +	}, {
> +		.compatible = "amlogic,meson-s4-saradc",

The point of compatible devices is to not add such entries. Drop.

Best regards,
Krzysztof


