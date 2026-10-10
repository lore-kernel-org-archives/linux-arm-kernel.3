Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C0CCA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wl2/daiGTCHI/E9Od6s6bD8KLBELQavn1LG73eGvZe8=; b=iZvZuFPlJqF6x7wlqWjtMqtaCv
	ep7oztrhOXLc4ktmfB9FxjZhJxJZosnAgnDn7Po42OZv1d/djNcPXvCfOa6OSb/jxtxILA0pPjCCw
	AeAedFIo2TTh7hgdy3Fi2BGSQeAUiXOj/7gr12iVCiJK2Fme4U0f7swNrNChjkaFDZm/Y7peEgmhE
	sRxnfGDE/0Ngyn4ofS2VO8l2/Kbh0HvNSz23z7O2g33XxlYeAmo+o9UrsQPdxc52qpa7h4grVH7EE
	buhp7VWZ49g8qICkhfl740Ar91gGB4MDLMlVXQol7bMTeRKkEVYcPiSs1I+8Kl4C+Dg8QJdt+KxBT
	WGDqz+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFR8b-00000007axV-0WEL;
	Sat, 10 Oct 2026 07:04:57 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFR8Y-00000007awd-1Frh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 07:04:56 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4j1vYK04Y6zRhXL;
	Sat, 10 Oct 2026 14:52:20 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id F2CC14056E;
	Sat, 10 Oct 2026 15:04:32 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemf200017.china.huawei.com
 (7.202.181.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 10 Oct
 2026 15:04:31 +0800
Message-ID: <67593620-1049-4ce1-9436-f7110f1e263e@hisilicon.com>
Date: Sat, 10 Oct 2026 15:04:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: cpufreq: Replace CPPC reviewer
To: Christian Loehle <christian.loehle@arm.com>, <rafael@kernel.org>
CC: <zhenglifeng1@huawei.com>, <zhongqiu.han@oss.qualcomm.com>,
	<viresh.kumar@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Mario
 Limonciello <mario.limonciello@amd.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Huang Rui <ray.huang@amd.com>, Perry Yuan
	<perry.yuan@amd.com>, Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Shubhang Kaushik <sh@gentwo.org>, Pierre Gondois <pierre.gondois@arm.com>,
	Beata Michalska <beata.michalska@arm.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Ionela Voinescu <ionela.voinescu@arm.com>, Sudeep
 Holla <sudeep.holla@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, Jeremy
 Linton <jeremy.linton@arm.com>, <jonathanh@nvidia.com>
References: <20261008212832.354382-1-christian.loehle@arm.com>
 <20261008212832.354382-2-christian.loehle@arm.com>
Content-Language: en-US
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20261008212832.354382-2-christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_000454_526122_290CA193 
X-CRM114-Status: GOOD (  10.08  )
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



On 10/9/2026 5:28 AM, Christian Loehle wrote:
> Take over CPPC cpufreq review duties from Pierre Gondois. Thanks to
> Pierre for his reviews and contributions to the driver.
> 
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
Thanks for the great work of Pierre.
Thanks for getting involved, Christian.

Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e8a4b5c90b..3064942ef05c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6765,7 +6765,7 @@ M:	"Rafael J. Wysocki" <rafael@kernel.org>
>  M:	Viresh Kumar <viresh.kumar@linaro.org>
>  R:	Jie Zhan <zhanjie9@hisilicon.com>
>  R:	Lifeng Zheng <zhenglifeng1@huawei.com>
> -R:	Pierre Gondois <pierre.gondois@arm.com>
> +R:	Christian Loehle <christian.loehle@arm.com>
>  R:	Sumit Gupta <sumitg@nvidia.com>
>  L:	linux-pm@vger.kernel.org
>  S:	Maintained
> 

