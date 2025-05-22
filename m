Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F72C54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 03:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QabpljbplrGmMFEI6zH1wHFQW4RWBPNtTER+nmbPcdI=; b=z4i36lNl2ta6jl
	A07PZCcxD661QcDgjYZE/NTmvb01akgITmvXJ9UYuc0Y1RZKNZZM5s7CbHmBWszzgOK2/M2PuQeQF
	q4ADwHS/3stfp/7NmDdrffjzI1Ff4RWAXCviUkHTixEAMR6SPrEcR53f5F+SI8wL7AB4p6fU7wsDW
	fbWcHXj3kYI+w7vnN3T/qIBepX52DNC43hgulhaamAsDi3SM2vMBJx2JCA5MktENRMMehZ9KN0zgp
	CJDZDUedhUzVi7TPCPaGV3y0+A5TwwtK7PBR2eht+NxWXksOpU+ORk338wyhzXxE+YaltglL1gqmk
	Haj/rtN9KiRGBamSY32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHweA-0000000HLE5-0mwJ;
	Thu, 22 May 2025 03:31:06 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHwaP-0000000HKrx-1phx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 03:27:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4b2twB6sCsz1d1Bh;
	Thu, 22 May 2025 11:25:30 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 10ED5140132;
	Thu, 22 May 2025 11:27:07 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemo100006.china.huawei.com
 (7.202.195.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 May
 2025 11:27:06 +0800
Message-ID: <f69ff550-ec27-af8f-ac5c-b52eb7eb0a6f@hisilicon.com>
Date: Thu, 22 May 2025 11:27:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3] PM / devfreq: Add HiSilicon uncore frequency scaling
 driver
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>
References: <20250522031701.1912458-1-zhanjie9@hisilicon.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20250522031701.1912458-1-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_202713_632026_F53EEA4D 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: yubowen8@huawei.com, zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, liwei728@huawei.com, linuxarm@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Sorry, my bad.  Please ignore this one.

Keep onto this v3 thread: https://lore.kernel.org/linux-pm/20250521104956.2780150-1-zhanjie9@hisilicon.com/

Jie

On 22/05/2025 11:17, Jie Zhan wrote:
> Add the HiSilicon uncore frequency scaling driver for Kunpeng SoCs based on
> the devfreq framework.  The uncore domain contains shared computing
> resources, including system interconnects and L3 cache.  The uncore
> frequency significantly impacts the system-wide performance as well as
> power consumption.  This driver adds support for runtime management of
> uncore frequency from kernel and userspace.  The main function includes
> setting and getting frequencies, changing frequency scaling policies, and
> querying the list of CPUs whose performance is significantly related to
> this uncore frequency domain, etc.  The driver communicates with a platform
> controller through an ACPI PCC mailbox to take the actual actions of
> frequency scaling.
> 
> Co-developed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
> v3:
> - Remove redundant resource freeing processes when drv->probe() fails as
>   they're already handled by devm
> 
> v2:
> https://lore.kernel.org/linux-pm/20250520074120.4187096-1-zhanjie9@hisilicon.com/
> - Make devm manage the release sequence, remove drv->remove()
> - Warn on !uncore or !uncore->pchan as they're no longer expected
> - Remove ioremap of pcc shared memory because it's done by the pcc driver
> - Fix compiler warning of discarding 'const'
> - Minor trivial coding style changes
> 
> v1:
> https://lore.kernel.org/linux-pm/20250506021434.944386-1-zhanjie9@hisilicon.com/
> ---
>  drivers/devfreq/Kconfig            |  11 +
>  drivers/devfreq/Makefile           |   1 +
>  drivers/devfreq/hisi_uncore_freq.c | 722 +++++++++++++++++++++++++++++
>  3 files changed, 734 insertions(+)
>  create mode 100644 drivers/devfreq/hisi_uncore_freq.c

