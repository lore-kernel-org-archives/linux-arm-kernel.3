Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAB7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUxwGglyF0xXiDVcHqrSX/bsBa9N4fsPzuAzKiu/cFw=; b=vdJU5EXMXhB2yhQP2mjVcuFlHh
	pPXgy8Xf6JAcvx6JDPgy5SyDd0carsjYE0IbdRWynZfMwk0CgvjLCd34CeeROrzFR8Dy+Y+6mme8A
	eQrDWQf4jCw0lEOCF+kAO8XzcBXSUHngzAi9XpUZdqz++DwiII9wRnekEJpvvsWPHY28Q+/0oGE3P
	lXyF+zuJDx5SVeVw77PKZX2FZlytdvpNHxbMElIhgCnbX4UPgKzgqIGcW39fpvnPESacSaCgFcKME
	QZk9gqJg6c3r4kDGN4oWIm2O64ONDVI4MvVXqxUh7AlfwZgM09S/kSthSDPuAS3zXLO2x2NXo4ige
	QwCSFhuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjOO-0000000CUAj-2L9y;
	Fri, 18 Jul 2025 11:36:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucj1G-0000000CPLv-1hga
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:12:51 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk6Vk6JhGz6L5Gj;
	Fri, 18 Jul 2025 19:09:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0953E140142;
	Fri, 18 Jul 2025 19:12:41 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 18 Jul
 2025 13:12:40 +0200
Date: Fri, 18 Jul 2025 12:12:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<coresight@lists.linaro.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 2/6] arch_topology: drop the use of cpu_node in the
 pr_info
Message-ID: <20250718121238.00005121@huawei.com>
In-Reply-To: <20250718094848.587-3-alireza.sanaee@huawei.com>
References: <20250718094848.587-1-alireza.sanaee@huawei.com>
	<20250718094848.587-3-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_041250_589274_04403DB2 
X-CRM114-Status: GOOD (  18.74  )
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

On Fri, 18 Jul 2025 10:48:44 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Remove the use of cpu_node in the pr_info. When of_cpu_node_to_id fails,
> it may set a pointer, cpu_node, and the get_cpu_for_node function uses that
> pointer to log further in the fail scenario.
> 
> Also, change the structure to exit early in fail scenarios which will
> help enabling code unification that follows in this series.

So this patch is the trade off to the unification.   Some small
amount of info in the info message is lost.  To me that looks
fine, but others may disagree!

I assume the motivation for not just leaving this one alone is
we ultimately need the flexible handler for the SMT series?

> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

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


