Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1077CC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 23:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8y4+FMqCruPIO6QVXu4Ws978J75FVFZbomNnv2riqY=; b=GyYp+lNnNtqA6XYRQ28MbKR0sN
	s6MMScSIm7u9HttjUgiWJH/R9PPGEnquOK0o0zuxn1BhWuhUYks/P98O+v3/7MeSKkIEHs/DPmdtv
	ETI9VNhxlN7lFUVPNbdXL4jzgPmDW5RFyBjg0mvYs0U+ciGhMe8NmW0FtJ6pxuXIG/ToIYw5GC8HT
	sIxQV+FpQ8xlmchJtGDbRysNMDjsbEeLR36vJsUldlQEKwDpPFixlDk2UVM9UKjav7X5GdJnk/gME
	FSUjhDF6NyZP4QE/UZgAJsz9bTU00Z/chAiX8Vu72wymRvn45o4Xs9swWp2eYNm49mzaAvKvjxSJ3
	8M3HbDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ztZ-00000004TtR-0TML;
	Sat, 05 Sep 2026 23:34:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ztW-00000004Tt5-22p1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 23:33:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EEE4F43DB2;
	Sat,  5 Sep 2026 23:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2041F00A3D;
	Sat,  5 Sep 2026 23:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788651237;
	bh=N8y4+FMqCruPIO6QVXu4Ws978J75FVFZbomNnv2riqY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HQ3D5V6BzZmucTMmDiwCKgyb7JXRqdR15yBPyJKHxljIgA/bIhskps0KgMn2SgUNc
	 EuOQXTUF2rWfi+JoMwGuSriRNIcn75wh2mop7zlipSERS483yhQt4u5jKvISuoELC5
	 n6IMyEbSiIIzYGpnKrP940emjw9/sVIIi6FsUPkrPfyDDAESbf8fmmQJ2CsYObbrEN
	 jO7+iDSvov7hcLyFjigAyLn1QmMRX+iCEGw/GRTDwUjc7O3GaDGWv0wGiO0p3WacrR
	 2GCjUqpq6iVXLYqdtfSlN48fJvbTiRe4Z2ZWHOAGPiOZJ0lsBYNMpDbw6aYQuOO8OQ
	 mW3PEgwgKErWw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 4/6] iio: adc: bcm_iproc_adc: use devm-managed ADC
 cleanup
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260905093631.48667-5-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
 <20260905093631.48667-5-mdshahid03@gmail.com>
Date: Sun, 06 Sep 2026 00:33:40 +0100
Message-Id: <178865122088.3402141.9570533772047711603.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787;
 i=jonathan.cameron@oss.qualcomm.com; h=from:subject:message-id;
 bh=UpXeAM+Jf/QAXeSARx3oI62WMkG4vVFQLuHpHi0cfLA=;
 b=kA0DAAoBVIU0mcT0FogByyZiAGqcpuTIHIiQQYf9HWl3AEW7GsQ1ROVngUBCqO/hNdNNzh6II
 YkCRQQAAQoALxYhBG4pZrOHhAZSkSaBsVSFNJnE9BaIBQJqnKbkERxqaWMyM0BrZXJuZWwub3Jn
 AAoJEFSFNJnE9BaIxEsP/1PZEvTFlkqS5Lj3dq6Q1ieGatyH9o8KvPkiYzybyAf9HcH39Df+wd+
 1jV9XOviqd78Hvgk3WDfXHaMKvHoRzlFOUtSv0qT1/5Z9/g+2i7LVaAi+2cPUlE/n3Nt/GEFZoZ
 opz/JOCH2B3ePM4lJXMLMm2u0Ag9sswLuSoG8ZQ83Maj6UaPGETIbOLxBgGctgLHZUQbO0Vfojh
 yrzLXh8/AcwfgxScNtbYB2UvLzDAX+AkldPXmdavMp0ihk3rPvckq3qTPxohlGNdzS9tgsVpXQP
 O9qZa9M37q2Jt8kk/hAHYW28ZlDxXs75g3PkijDktqZnvqKwKFCH1l+ZLVEpru4/eUsw8mkVnGS
 OK3OApBIT45eftljLXJstQmrvQL5VhWG2w9samNBh28MeUiRYPiNdIinFdZWhAnGRFJScyGPOGw
 1EARQoiJ4gcH10fB4WewXDh4o+cAARDhqzuneMJMDtzxMBqbbrBgiaQYN27BRlHUgh8HLU7zMOd
 8IHnvO3hcXSVS7u1XnFBU8qqndx69A8v1PH3reTAS1CO4aOHjP7+TTNP5CCOEOPTasLEerLr0st
 y1lJoLH+EGD4drttVFUFWWNFYL5hSK3QzhajQ9xsSWYB1IsSWx4RqFCxoTjBM0r9OUFPfj1iS+F
 vFZFxX6x3KmoaCsK1iRFQt8JmANqj
X-Developer-Key: i=jonathan.cameron@oss.qualcomm.com; a=openpgp;
 fpr=6E2966B387840652912681B154853499C4F41688
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

> Use devm_add_action_or_reset() to disable the ADC automatically when
> the device is detached or probe fails.
> 
> This removes the manual ADC cleanup from the remove and error paths
> and ties the ADC cleanup to the device lifetime.

Sashiko raised a bunch of pre existing issues whilst looking at this
one.  As far as I'm concerned whether correct or not they are out of
scope for this series.  Feel free to take a look if you like though
(for a potential follow up)  Note I haven't analysed any of them -
just noted there were a few comments - so they may or may not be correct.

https://sashiko.dev/#/patchset/20260905093631.48667-1-mdshahid03%40gmail.com

> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
>
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 3bbf814d4c8f..24fb41751e93 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -450,6 +450,13 @@ static void iproc_adc_disable(struct iio_dev *indio_dev)
>  	}
>  }
>  
> +static void iproc_adc_disable_action(void *data)
> +{
> +	struct iio_dev *indio_dev = data;
> +
> +	iproc_adc_disable(indio_dev);

For this it is fine and more compact to do

static void iproc_adc_disable_action(void *indio_dev)
{
	iproc_adc_disable(indio_dev);
}

Given we are going via a void * anyway, there is no additional
type safety or particular readability advantages to having the
intermediate given we have well known naming fo the struct iio_dev *


> +}
> +
>  static int iproc_adc_read_raw(struct iio_dev *indio_dev,
>  			  struct iio_chan_spec const *chan,
>  			  int *val,
> @@ -551,7 +558,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  	ret = iproc_adc_enable(indio_dev);
>  	if (ret)
> -		goto err_adc_enable;
> +		return ret;

This change belongs in the earlier patch as none of the other changes
in this patch have anything to do with enabling it.

> +
> +	ret = devm_add_action_or_reset(dev, iproc_adc_disable_action, indio_dev);
> +	if (ret)
> +		return ret;
>  
>  	indio_dev->name = "iproc-static-adc";
>  	indio_dev->info = &iproc_adc_iio_info;
> @@ -560,17 +571,11 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
>  
>  	ret = iio_device_register(indio_dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "iio_device_register failed:err %d\n", ret);
> -		goto err_clk;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "iio_device_register failed\n");
>  
>  	return 0;
>  
> -err_clk:
> -	iproc_adc_disable(indio_dev);
> -err_adc_enable:

This label should have gone in the earlier patch.

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

