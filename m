Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155EACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn6EXEbMVZqq2skOaGnAHUXUm5yvdcEeIfkJMehKvD8=; b=CS0DhkrBjpc+xNW6BMWRZBTOKL
	t8En9r/ZBsDHkr6BsT+27pcFspJMcyp9yTU3ncrUOKj/CmTnMqDCnVrp/XuhZTQjlICjAtF5L5ND1
	jPAuvYzTYPpUKNK0nV6Gw4IkpH7SUkpNo+Mlu031LO75eL225LE9XqQSuUHLznuzAwSWvKOupSebp
	FVrXiLcVDswZR688LGJDQkKqXGNrdn+mJFrHjVhN08aBYKNUfao9UwTp5DJVMZBa5FayKYbtEpGRP
	6l7KnD56r33i+ABJjqAn0wr4E7rv85LONWtrvhO2I0cotS8OTVw5LVBsavzREXLZRgSgZFikIAFC4
	rmMbcVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNhA-0000000FUXl-1Zdl;
	Wed, 10 Sep 2025 16:29:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNh7-0000000FUW6-40AI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:29:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74A716F2;
	Wed, 10 Sep 2025 09:29:08 -0700 (PDT)
Received: from [10.57.5.181] (unknown [10.57.5.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E74773F63F;
	Wed, 10 Sep 2025 09:29:14 -0700 (PDT)
Message-ID: <ffa7968f-15da-4f59-aba5-43619d3f27d3@arm.com>
Date: Wed, 10 Sep 2025 17:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] coresight: Use of_cpu_phandle_to_id for grabbing
 CPU ID
Content-Language: en-GB
To: Alireza Sanaee <alireza.sanaee@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: coresight@lists.linaro.org, dianders@chromium.org,
 james.clark@linaro.org, jonathan.cameron@huawei.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linuxarm@huawei.com, mark.rutland@arm.com, mike.leach@linaro.org,
 robh@kernel.org, ruanjinjie@huawei.com, saravanak@google.com
References: <20250905161830.37-1-alireza.sanaee@huawei.com>
 <20250905161830.37-6-alireza.sanaee@huawei.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250905161830.37-6-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092918_034586_6802D818 
X-CRM114-Status: GOOD (  13.04  )
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

On 05/09/2025 17:18, Alireza Sanaee wrote:
> Use the newly created API (of_cpu_phandle_to_id) to grab CPU ID.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   drivers/hwtracing/coresight/coresight-platform.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 0db64c5f4995..95d46ea08936 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -167,20 +167,7 @@ of_coresight_get_output_ports_node(const struct device_node *node)
>   
>   static int of_coresight_get_cpu(struct device *dev)
>   {
> -	int cpu;
> -	struct device_node *dn;
> -
> -	if (!dev->of_node)
> -		return -ENODEV;
> -
> -	dn = of_parse_phandle(dev->of_node, "cpu", 0);
> -	if (!dn)
> -		return -ENODEV;
> -
> -	cpu = of_cpu_node_to_id(dn);
> -	of_node_put(dn);
> -
> -	return cpu;
> +	return of_cpu_phandle_to_id(dev->of_node, NULL, 0);
>   }
>   
>   /*

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


