Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DD1CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJdEubdEPkrCtUmTWXP4rP/EUUBtehUiCsqRE/M+n0s=; b=FU+gwDHPq5ri8aBGXUWiUl51MG
	n+jZwCdg/AYG/EpKG/l1GQtDRKoh8o8LvVRXXFHQQbvU2brK2CvuqP/D7v9eGlgtEMGrnFzQ88zWY
	FixtvI6Xu+/OMYi+gjDLt3B/hy/n4rcu2Dzpl40KtKXwkJ7/ZKTL23H//Hz01dA2N82M4IPtVd00O
	1cnRGATxsT0Bw+Cf3f4kPEGWRUo0NCU56XeY+OZHPUyWPS6fKHfim3IaUxhyGdRzUhQzeG8RV9lNS
	dQM/VA/pG0vhX/BsznX39FoNUs/TzObqV0wLmMw2XhQtsyj9DjObHhk5h/v0CDeN/fe4lVNIOJOk/
	yi+aCQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIprf-00000007LzO-460e;
	Tue, 11 Nov 2025 15:00:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIprY-00000007LyX-0sh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 15:00:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d5V863PSQzHnGhS;
	Tue, 11 Nov 2025 23:00:22 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id BB289140136;
	Tue, 11 Nov 2025 23:00:39 +0800 (CST)
Received: from localhost (10.203.177.99) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 11 Nov
 2025 15:00:38 +0000
Date: Tue, 11 Nov 2025 15:00:33 +0000
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <coresight@lists.linaro.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <jonathan.cameron@huawei.com>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<mark.rutland@arm.com>, <mike.leach@linaro.org>, <robh@kernel.org>,
	<ruanjinjie@huawei.com>, <saravanak@google.com>, <suzuki.poulose@arm.com>,
	<sudeep.holla@arm.com>
Subject: Re: [PATCH v4 2/6] arch_topology: drop the use of cpu_node in the
 pr_info
Message-ID: <20251111150033.00002254.alireza.sanaee@huawei.com>
In-Reply-To: <20250905161830.37-3-alireza.sanaee@huawei.com>
References: <20250905161830.37-1-alireza.sanaee@huawei.com>
	<20250905161830.37-3-alireza.sanaee@huawei.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_070052_400237_4A88166B 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, 5 Sep 2025 17:18:25 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

Hi everyone,

+CC Sudeep.

I checked the patchset related to this patch and it still applies.

Just a reminder if case you think it is ready.

Thanks,
Alireza

> Remove the use of cpu_node in the pr_info(). When of_cpu_node_to_id() fails,
> it may set a pointer, cpu_node, and the get_cpu_for_node() function uses that
> pointer to log further in the fail scenario.
> 
> Also, change the structure to exit early in fail scenarios which will
> help enabling code unification that follows in this series.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  drivers/base/arch_topology.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 1037169abb45..6fafd86f608a 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -481,12 +481,13 @@ static int __init get_cpu_for_node(struct device_node *node)
>  		return -1;
>  
>  	cpu = of_cpu_node_to_id(cpu_node);
> -	if (cpu >= 0)
> -		topology_parse_cpu_capacity(cpu_node, cpu);
> -	else
> -		pr_info("CPU node for %pOF exist but the possible cpu range is :%*pbl\n",
> -			cpu_node, cpumask_pr_args(cpu_possible_mask));
> +	if (cpu < 0) {
> +		pr_info("CPU node exist but the possible cpu range is :%*pbl\n",
> +			cpumask_pr_args(cpu_possible_mask));
> +		return cpu;
> +	}
>  
> +	topology_parse_cpu_capacity(cpu_node, cpu);
>  	return cpu;
>  }
>  


