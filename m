Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB5ECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/bE+d5VSY+cf7ZgHRif9dw6SgLFB5EQIZMFFFDkmJw=; b=A6LzF0SA6/HSFe6+QCwYzeXmEp
	EKc9oqMeL+hhe3OysOvhfV0Ajn6P6Dqbhx0A/vUwEIuW/QOCCU0JHmdVS5kh8Cx3OkJHtC4/Jh8sz
	wTsXQpBgEg/+YfEU5uVuyCvDPByhyGSqoRzu31RByp+Qk2SS5FY420mnoT6Ph6jlX7bCYx02ZGbOq
	HhMdyoRbJd0FVe02zvx385dmWB029ea9R/p+GwcGHWTUvDye6JPhFhY5Zt0MHT/fQ9OWbBT3qX7FM
	6O7IHf9WOeDw6aI5xG+B+D7ov7N0N5ahdHQrldMlMg+waH3TFrhL9rnvqf7O8b/45YY4wD7/bDSMr
	PFM1BZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW6M-0000000FDAn-3nhJ;
	Mon, 08 Sep 2025 07:15:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW17-0000000FBkL-2z39
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:10:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cKyk42QfCztTbY;
	Mon,  8 Sep 2025 15:09:16 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id D4C3B18006C;
	Mon,  8 Sep 2025 15:10:11 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Sep 2025 15:10:11 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Sep 2025 15:10:10 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <wangyushan12@huawei.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v6 0/3] drivers/perf: hisi: Add support for HiSilicon NOC
 and MN PMU driver
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250814091622.23269-1-yangyicong@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5b727add-e48e-5857-42a4-97586e1e02e1@huawei.com>
Date: Mon, 8 Sep 2025 15:10:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20250814091622.23269-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_001021_919157_6CC8A39C 
X-CRM114-Status: GOOD (  11.76  )
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

a gentle ping...

On 2025/8/14 17:16, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Add support for two new Uncore PMUs to monitor the events of the system bus
> (by NoC PMU) and the DVM operations (by MN PMU).
> 
> Change since v5:
> - Rebase on 6.17-rc1 and update the maintainer entry
> Link: https://lore.kernel.org/linux-arm-kernel/20250717121727.61057-1-yangyicong@huawei.com/
> 
> Change since v4:
> - Rename ovflow_status to .overflow_status with Jonathan's Tag, thanks!
> Link: https://lore.kernel.org/linux-arm-kernel/20250717074138.39903-1-yangyicong@huawei.com/
> 
> Change since v3:
> - Use ACPI driver data to retrieve the hardware capabilities
> Link: https://lore.kernel.org/linux-arm-kernel/20250619125557.57372-1-yangyicong@huawei.com/
> 
> Junhao He (1):
>   drivers/perf: hisi: Add support for HiSilicon MN PMU driver
> 
> Yicong Yang (2):
>   drivers/perf: hisi: Add support for HiSilicon NoC PMU
>   MAINTAINERS: Remove myself from HiSilicon PMU maintainers
> 
>  Documentation/admin-guide/perf/hisi-pmu.rst  |  11 +
>  MAINTAINERS                                  |   1 -
>  drivers/perf/hisilicon/Makefile              |   3 +-
>  drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  | 411 +++++++++++++++++
>  drivers/perf/hisilicon/hisi_uncore_noc_pmu.c | 443 +++++++++++++++++++
>  5 files changed, 867 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c
>  create mode 100644 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c
> 

