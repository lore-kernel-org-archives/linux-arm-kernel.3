Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2C0109B48F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4PSqneLUEeDkfVln3s0jyhbu/p+YZWIvMlwoMvls4c=; b=0nSpAR2kfZ6K7PaOELuQQMZkNU
	46c8TZC2DCjydm+5QM/QHKO0JT5meShwbbIa5tbb4obTlVQgdUZSQPIcb02FC8HNl7RX/PRL4UoIw
	IA6RjG2C6svJ6ETL9ctDzt9rRSJlhnBH0B8mfLXOuHl2mjI14wKgAB/4RnlE48TMysz4IPVbpfwY8
	/+sheLtJn6xOOzm1G/lulygeTXmkuEAnGZ/leIvemcZDkeQCBvOtn9dyxwvwBtOCwTYeYhjtOnvkB
	YPmf1/3bXNkPJfkGsCQGDnq+bKn0KWbmOsrZ88amZWNQF4l5yhiNtfO7sTKaDuhD6XEFWs0JO3ehB
	Q+mWAR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b6v-0000000DBtp-0WiF;
	Tue, 31 Mar 2026 15:34:33 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b6s-0000000DBtO-3DJP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:34:32 +0000
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id 7XvjwaQ6Hc7NE7b6rwMBqn; Tue, 31 Mar 2026 15:34:29 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 7b6lw9RQgHtqh7b6lwsFVE; Tue, 31 Mar 2026 15:34:23 +0000
X-Authority-Analysis: v=2.4 cv=AtXu3P9P c=1 sm=1 tr=0 ts=69cbe982
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=k5Y5iPg+dmTXVWgYE/XtfQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=_Wotqz80AAAA:8 a=pGLkceISAAAA:8 a=auZ1cPAoFAK5FwhZLi8A:9 a=QEXdDO2ut3YA:10
 a=buJP51TR1BpY-zbLSsyS:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y4PSqneLUEeDkfVln3s0jyhbu/p+YZWIvMlwoMvls4c=; b=rXbLle0oz15n47ZuK/Ep5LfG1u
	dcboqrirz2TozQ3a+ojvSI9eh6MqLSjy7+4Dv7lsJ8grfQN7dTya4KV0ILn5RR3LntJxTD7UnGnep
	1rAK/+57tP3dzCy5aSP7c67m3lWKb4B5F1bnOuT2oa+IVw5YVBspbb1BU+kumQo9F/LlIyNjuiimx
	j5PYOZP0EtaH6ZcXipf9KnjssRO9+oQR+fdHQqGo/xwTgFX1YZTO+zmR5zUBBelnmvG42wphe/MYI
	C2bY4coCqRTAR/hdEY2sjFRAf3eUtgtPMQHBxU6sd5JuYcMmknmAZUwu9MY+4dtq8hBqNKCcysg+Y
	GyftIu2w==;
Received: from [177.238.16.13] (port=53228 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1w7b6k-00000002IL2-1iz2;
	Tue, 31 Mar 2026 10:34:23 -0500
Message-ID: <5977a259-a7ae-43be-ad09-d09115268854@embeddedor.com>
Date: Tue, 31 Mar 2026 09:33:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: st_fdma: simplify allocation
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM/STI ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260330211555.13974-1-rosenp@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20260330211555.13974-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.13
X-Source-L: No
X-Exim-ID: 1w7b6k-00000002IL2-1iz2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.16.13]:53228
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 33
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCVsUnk51nm0TCzCZx4NgWTzGxvQdI8AQkwiK8+PwCSV7bnpMucNHAd31gR6JUOjzFkjPAbQ6HVJbyTWfTJ12k6Wbrd9POTfyUmAkuc9VRjQnyVisYxJ
 h1a/xQRNbm/rP8d8vZ4OrORKeplGcvqWBiwZGQpg3/mkW3Ho63AtBolbHFnT7cadOqFnoq9/mwdzMHWLykut2EaPVqk+KadloPQwAlwlKS+O4LpVaOR7XetD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_083430_832675_E42156C6 
X-CRM114-Status: GOOD (  14.05  )
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



On 3/30/26 15:15, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc to a single
> allocation.
> 
> Add __counted_by for extra runtime analysis. 

Assign counting variable
> after allocation as required by __counted_by.

This is misinformation and should be phrased differently[1]

-Gustavo

[1] https://lore.kernel.org/linux-hardening/37378f49-437f-438b-ad6c-d60480feb306@embeddedor.com/

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/dma/st_fdma.c | 27 ++++++++-------------------
>   drivers/dma/st_fdma.h |  4 ++--
>   2 files changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
> index d9547017f3bd..3ec0d6731b8d 100644
> --- a/drivers/dma/st_fdma.c
> +++ b/drivers/dma/st_fdma.c
> @@ -710,16 +710,6 @@ static const struct of_device_id st_fdma_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, st_fdma_match);
>   
> -static int st_fdma_parse_dt(struct platform_device *pdev,
> -			const struct st_fdma_driverdata *drvdata,
> -			struct st_fdma_dev *fdev)
> -{
> -	snprintf(fdev->fw_name, FW_NAME_SIZE, "fdma_%s_%d.elf",
> -		drvdata->name, drvdata->id);
> -
> -	return of_property_read_u32(pdev->dev.of_node, "dma-channels",
> -				    &fdev->nr_channels);
> -}
>   #define FDMA_DMA_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
>   				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
>   				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
> @@ -742,27 +732,26 @@ static int st_fdma_probe(struct platform_device *pdev)
>   	struct st_fdma_dev *fdev;
>   	struct device_node *np = pdev->dev.of_node;
>   	const struct st_fdma_driverdata *drvdata;
> +	u32 nr_channels;
>   	int ret, i;
>   
>   	drvdata = device_get_match_data(&pdev->dev);
>   
> -	fdev = devm_kzalloc(&pdev->dev, sizeof(*fdev), GFP_KERNEL);
> -	if (!fdev)
> -		return -ENOMEM;
> -
> -	ret = st_fdma_parse_dt(pdev, drvdata, fdev);
> +	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels", &nr_channels);
>   	if (ret) {
>   		dev_err(&pdev->dev, "unable to find platform data\n");
> -		goto err;
> +		return ret;
>   	}
>   
> -	fdev->chans = devm_kcalloc(&pdev->dev, fdev->nr_channels,
> -				   sizeof(struct st_fdma_chan), GFP_KERNEL);
> -	if (!fdev->chans)
> +	fdev = devm_kzalloc(&pdev->dev, struct_size(fdev, chans, nr_channels), GFP_KERNEL);
> +	if (!fdev)
>   		return -ENOMEM;
>   
> +	fdev->nr_channels = nr_channels;
>   	fdev->dev = &pdev->dev;
>   	fdev->drvdata = drvdata;
> +	snprintf(fdev->fw_name, FW_NAME_SIZE, "fdma_%s_%d.elf", drvdata->name, drvdata->id);
> +
>   	platform_set_drvdata(pdev, fdev);
>   
>   	fdev->irq = platform_get_irq(pdev, 0);
> diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
> index f1e746f7bc7d..27ded555879f 100644
> --- a/drivers/dma/st_fdma.h
> +++ b/drivers/dma/st_fdma.h
> @@ -136,13 +136,13 @@ struct st_fdma_dev {
>   
>   	int irq;
>   
> -	struct st_fdma_chan *chans;
> -
>   	spinlock_t dreq_lock;
>   	unsigned long dreq_mask;
>   
>   	u32 nr_channels;
>   	char fw_name[FW_NAME_SIZE];
> +
> +	struct st_fdma_chan chans[] __counted_by(nr_channels);
>   };
>   
>   /* Peripheral Registers*/


