Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A1E9536A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNTddJkxJKsf8ALbyAl+KYyXaNnFgpo6Lwq4oT4gSjs=; b=21eks3Dj8McqTfJZsB/dcLFAfh
	9+5MKt8B/LLky01+RYp0bH0754+1/XDIHT77HiKT3cFbCX3NdPxiO+lN4xy0rnrR7ZM9CtSuAIKd/
	4DKhKdSVPZgJJOEuh+JbZzZls9STaJExc0mbUn4K5YscOTW2Yd0sBRET9uRFPBh8/ecahipQJ84s8
	16w86FcBEE5d6Qr0rPt3F3PNHi5YRPh468i49lP29fVNQi3NI8oL/SaJEAZg73K47z6hV1J2yKNY6
	KwxPX4PnAHVHVsb//ZsSEd1V6ZyZYxhB3ngYfH+yP4fWmRro64WdS426O6SAQnjIxLVC4osGaad9y
	yyrTkRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZYF-00000008FTZ-3B6J;
	Wed, 04 Feb 2026 09:51:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZYC-00000008FSp-1M7f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:51:58 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f5bFp56H3zJ46cs;
	Wed,  4 Feb 2026 17:50:54 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 88AE840569;
	Wed,  4 Feb 2026 17:51:43 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 09:51:42 +0000
Date: Wed, 4 Feb 2026 09:51:41 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Abdurrahman Hussain via B4 Relay
	<devnull+abdurrahman.nexthop.ai@kernel.org>
CC: <abdurrahman@nexthop.ai>, Mark Brown <broonie@kernel.org>, Michal Simek
	<michal.simek@amd.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] spi: xilinx: use device property accessors.
Message-ID: <20260204095141.0000479a@huawei.com>
In-Reply-To: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
References: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_015156_518658_0D819615 
X-CRM114-Status: GOOD (  15.48  )
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

On Tue, 03 Feb 2026 01:55:12 +0000
Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org> wrote:

> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> Switch to device property accessors.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
> Switch to generic device property accessors.
> 
> 2.52.0
> 
> base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
> ---
> Changes in v4:
> - Removed patches making the irq optional.
> - Link to v3: https://lore.kernel.org/r/20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai
> ---
>  drivers/spi/spi-xilinx.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
> index c86dc56f38b4..c4b70e95b695 100644
> --- a/drivers/spi/spi-xilinx.c
> +++ b/drivers/spi/spi-xilinx.c
> @@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
>  		bits_per_word = pdata->bits_per_word;
>  		force_irq = pdata->force_irq;
>  	} else {
> -		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
> -					  &num_cs);
> -		ret = of_property_read_u32(pdev->dev.of_node,
> -					   "xlnx,num-transfer-bits",
> -					   &bits_per_word);
> +		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
> +					 &num_cs);
> +		ret = device_property_read_u32(&pdev->dev,

Nothing useful is done with ret after this point, so could simplify to
the pattern of setting the default then overriding it if the property
can be successfully read.

		bits_per_word = 8;
		device_property_read_u32(&pdev->dev,
					 "xlnx,num-transfer-bits",
					 &bits_per_word);

> +					       "xlnx,num-transfer-bits",
> +					       &bits_per_word);
>  		if (ret)
>  			bits_per_word = 8;
>  	}
> 
> ---
> base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
> change-id: 20260118-spi-xilinx-1b884d5b6519
> 
> Best regards,


