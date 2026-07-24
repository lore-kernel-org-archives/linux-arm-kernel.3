Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFB7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCvccBUeoX+oNuUl2AWHh4+obwjkgVsuQu28g3eZOAE=; b=TA8jPSuFwRhvz/bSZGS6JpsgTN
	bLx2xugh0jNRSlcB+78VKzmcrWRziDY3uRHvdKfgBK0NTg84SqOKHSOC4MIHE6gngSBXynLQWkJuQ
	qLqQEY0zHvdGrZ7cxp9theaJU0wzewy5VjU8JBqWHULP4j+d4deqRbJu/WEdRyvp1BUqmL1zXobrj
	GztokXPPsT+wbv2W259NbFbqy2GwAU0QYwPSnyrinZp7gK8UOjiwTQhU12grhZjtBVQUoG4prekqI
	JOCmuiGKEHdKoqikUFzQeg3FG5Zn6K+3y4uWmiHXCYl2w6lrMk0uqoU7bJgwJ2vrhzENUaJw9RhAz
	tvIQQlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9rv-0000000Fdyi-2zzc;
	Fri, 24 Jul 2026 06:58:51 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9rs-0000000FdyB-0mSO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:58:49 +0000
Received: from [10.94.177.11] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id BFA1A20B7167;
	Thu, 23 Jul 2026 23:58:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFA1A20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784876312;
	bh=XCvccBUeoX+oNuUl2AWHh4+obwjkgVsuQu28g3eZOAE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=MzoxcISBtFMSm6zP5y82pd91jg0T/9OVQh5+au/CzTWY/YTXfnC7e/TtzpBefbpoF
	 1Aui+MaNRkFSLqZviiJGTRl5KO2qMKTBalR1yY2POwHTXqy1E/uVQBdSeZrl8w00VD
	 UHsXOox8iQYc9vYZm+g7fkaUAIu9O7HZ1dMOsTe8=
Message-ID: <80e19216-46d1-495f-8e2e-85101df3b284@linux.microsoft.com>
Date: Fri, 24 Jul 2026 12:28:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: xilinx: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260723022857.627844-1-panchuang@vivo.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260723022857.627844-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_235848_262160_30B80091 
X-CRM114-Status: GOOD (  13.34  )
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


On 23-07-2026 07:58, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>
> ---
>   drivers/soc/xilinx/zynqmp_power.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
> index 370e61ac47d8..54c796afb89e 100644
> --- a/drivers/soc/xilinx/zynqmp_power.c
> +++ b/drivers/soc/xilinx/zynqmp_power.c
> @@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>   						IRQF_NO_SUSPEND | IRQF_ONESHOT,
>   						dev_name(&pdev->dev),
>   						&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with %d\n",
> -				irq, ret);
> +		if (ret)
>   			return ret;
> -		}
>   	} else {
>   		dev_err(&pdev->dev, "Required property not found in DT node\n");
>   		return -ENOENT;

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

