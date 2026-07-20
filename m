Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D7C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 04:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:CC:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5U9Z07azIKoS+HmD20XRidZIG20eJu/X9DH5Wl67jM=; b=0PtrPJXWIZBuitfESaNnNGxxfG
	lJfW/QO4JkElYR3j7QTGIhsKodEJpExOQkJNB3bL9f03fNoe/77tvQoJgsCgzpzKopL8YDJYlQXMw
	BNrFb/N8mPVmm5xUtWgdqHZJYG0IqY3kdicZtkce3Q62YLW/DYkmobiSN4cRvLgt01DJG9JeFar7S
	8ixC4hU8UrEQRnERRgSGS/HWrm5+MhZw92wB3qqJF/ZUgLAkEU8TPx69f+Ohk0qiHqQMpjHToN4b1
	mYEwetYrHqYvriUd1K6ZCsnY2mMgAL5TBX7SkXSPyCntEX11XkuaDxXAuysjcWhb7Zpl2Kz5M7lVo
	APQ/jieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlfG8-00000005oI1-2gay;
	Mon, 20 Jul 2026 04:05:40 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlfG4-00000005oH7-2VkH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 04:05:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Y5U9Z07azIKoS+HmD20XRidZIG20eJu/X9DH5Wl67jM=;
	b=fXsgjlbGQMsOIrt7wXHLHx6x7cEhxJYQpo59tiKU05P9aPmkvbgQ/Tmok1Wi+9YYB8OC7l75e
	bh4Nq29MHSF/Mtv1ZVUqumuxAJ9MXxZJvc3Cm3H+kMshHRdgP5PtI5dNzEMaAMGzJrvA3gwQSxQ
	byPwAb9ALRxIsolJKi0fXt4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h3RWl6cvFzmV8f;
	Mon, 20 Jul 2026 11:56:03 +0800 (CST)
Received: from whupemo500002.china.huawei.com (unknown [7.152.185.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 63D4E40572;
	Mon, 20 Jul 2026 12:05:25 +0800 (CST)
Received: from [10.67.120.139] (10.67.120.139) by
 whupemo500002.china.huawei.com (7.152.185.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Jul 2026 12:05:24 +0800
Message-ID: <e59ac457-8ee8-4a10-93a2-ae80c124ecf4@huawei.com>
Date: Mon, 20 Jul 2026 12:05:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drivers/perf: hisi: Remove redundant
 dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
References: <20260717103123.34887-1-panchuang@vivo.com>
 <20260717103123.34887-4-panchuang@vivo.com>
Content-Language: en-US
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"moderated list:ARM PMU PROFILING AND DEBUGGING"
	<linux-arm-kernel@lists.infradead.org>, "open list:ARM PMU PROFILING AND
 DEBUGGING" <linux-perf-users@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
From: Yushan Wang <wangyushan12@huawei.com>
In-Reply-To: <20260717103123.34887-4-panchuang@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.139]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo500002.china.huawei.com (7.152.185.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_210537_147768_84C987D7 
X-CRM114-Status: GOOD (  13.26  )
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



On 7/17/2026 6:31 PM, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() and dev_err_probe() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 3 +--
>  drivers/perf/hisilicon/hisi_uncore_pmu.c     | 5 +----
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> index f963e4f9e552..56a88fb0d3c2 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
> @@ -604,8 +604,7 @@ static int hisi_l3c_pmu_init_ext(struct hisi_pmu *l3c_pmu, struct platform_devic
>  				       IRQF_NOBALANCING | IRQF_NO_THREAD,
>  				       irqname, l3c_pmu);
>  		if (ret < 0)
> -			return dev_err_probe(&pdev->dev, ret,
> -				"Fail to request EXT IRQ: %d.\n", irq);
> +			return ret;
>  
>  		hisi_l3c_pmu->ext_irq[i] = irq;
>  	}
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index 0ff2fdf4b3e2..77390d033d08 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> @@ -192,11 +192,8 @@ int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
>  	ret = devm_request_irq(&pdev->dev, irq, hisi_uncore_pmu_isr,
>  			       IRQF_NOBALANCING | IRQF_NO_THREAD,
>  			       dev_name(&pdev->dev), hisi_pmu);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev,
> -			"Fail to request IRQ: %d ret: %d.\n", irq, ret);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	hisi_pmu->irq = irq;
>  
Acked-by: Yushan Wang <wangyushan12@huawei.com>

Thanks!

