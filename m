Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D89D10F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 04:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9sKziGR3TZpBp7b/F6XHqFldEOtSekAzRl8RDtx+wU=; b=TdHdwQGa4WDcAfpS7L7iNhTRZE
	vWmm/AjvWEdYH4PlSuEywwfG5bElon2BN6Xp9UNlTqmnFvJrJzTgF+1bwUbxCEMnu8oZltcKCY/eS
	Y/401o1IUh1AMqAh2Gbk3EFTcUxnjYh5rxd5lXVNZD7zGhLoXkrzTCH7WcPLQofd2m3f6V2icxWD/
	E9nucLL6PnBsRR7ELejqhyTz4X7TM908fS9qqKKf/niPguQrMcsgF8urPtOFTVZ1TC24jXgBMMIK/
	RMIAnjWBVGai4DSrQMz151eVyGt26EM74ucEYAV9/wWacM1obT3+ulGZacn3K8Nkw5BOQQzyH3SFi
	LiTUrjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsxA-00000008HFr-0sy4;
	Mon, 18 Nov 2024 04:01:32 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCswC-00000008HAC-1MVb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 04:00:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XsDPS6rbQz1k06Y;
	Mon, 18 Nov 2024 11:58:20 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id D1A771A016C;
	Mon, 18 Nov 2024 12:00:16 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Nov 2024 12:00:16 +0800
Subject: Re: [PATCH] ACPI/IORT: Add PMCG platform information for HiSilicon
 HIP09A
To: Qinxin Xia <xiaqinxin@huawei.com>, <lpieralisi@kernel.org>,
	<sudeep.holla@arm.com>
CC: <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<fanghao11@huawei.com>, <prime.zeng@hisilicon.com>, <yangyicong@huawei.com>,
	<linuxarm@huawei.com>
References: <20241107094036.2398983-1-xiaqinxin@huawei.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <7b52e89f-2afa-a5f3-3634-4916693076ad@huawei.com>
Date: Mon, 18 Nov 2024 12:00:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20241107094036.2398983-1-xiaqinxin@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_200032_731036_A87C6E3D 
X-CRM114-Status: GOOD (  15.73  )
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

On 2024/11/7 17:40, Qinxin Xia wrote:
> HiSilicon HIP09A platforms using the same SMMU PMCG with HIP09
> and thus suffers the same erratum. List them in the PMCG platform
> information list without introducing a new SMMU PMCG Model.
> 
> Update the silicon-errata.rst as well.
> 
> Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
> ---
>   Documentation/arch/arm64/silicon-errata.rst | 4 ++--
>   drivers/acpi/arm64/iort.c                   | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 65bfab1b1861..b21c0b1ed567 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -255,8 +255,8 @@ stable kernels.
>   +----------------+-----------------+-----------------+-----------------------------+
>   | Hisilicon      | Hip08 SMMU PMCG | #162001800      | N/A                         |
>   +----------------+-----------------+-----------------+-----------------------------+
> -| Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
> -|                | ,11} SMMU PMCG  |                 |                             |
> +| Hisilicon      | Hip{08,09x,10x, | #162001900      | N/A                         |

Since x is also a letter, I think it's better to add 09A after 09, with
no confusion.

> +|                | 11} SMMU PMCG   |                 |                             |
>   +----------------+-----------------+-----------------+-----------------------------+
>   +----------------+-----------------+-----------------+-----------------------------+
>   | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 4c745a26226b..bf3be532e089 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1703,6 +1703,8 @@ static struct acpi_platform_list pmcg_plat_info[] __initdata = {
>   	/* HiSilicon Hip09 Platform */
>   	{"HISI  ", "HIP09   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
>   	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
> +	{"HISI  ", "HIP09A  ", 0, ACPI_SIG_IORT, greater_than_or_equal,
> +	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
>   	/* HiSilicon Hip10/11 Platform uses the same SMMU IP with Hip09 */
>   	{"HISI  ", "HIP10   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
>   	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},

Please update the patch, and resend with Catalin and Will CCed.

Thanks
Hanjun

