Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0CFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKv+Hf+ub439Z0x1NvzluJ8OL8mf+lXudAeY6mkodDQ=; b=TnsOg3qswmFByEvM8k6zs9x7j6
	UOcDZLCXWszY5AyWLLvftAcO8dJn5j7AtaKfRuZETBvUEk7Sj1x3JSOdEcaoXYdFEgO09dp5qrzAV
	NcHYJllNRHwWuQTPfs51D/K3PK646c6pvs5RYBGVYZakiWRpkys6rDPJUvyiLDPfOZfp7e52II5IT
	+5hnF95bw0+Lu7urRqGMMUyENn1SwBkLP637XyAikpPgUK7zwTnVHUt6RSUK3+oJUx3Bylb2IrkRg
	KIjPJpmogU8Hh1RyCzTh699Zm9WFzrFpe2KEsmL6+plkNGoEzfnuCMvpjMV/3xgdIUeb52VGPJxuO
	YNv+bf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfd-0000000DgPt-42K8;
	Thu, 19 Jun 2025 17:03:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGen-0000000DKRs-2IkE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:54:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bNNrd1Fq0ztSkH;
	Thu, 19 Jun 2025 22:53:05 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 574EC14011F;
	Thu, 19 Jun 2025 22:54:15 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Jun 2025 22:54:14 +0800
Subject: Re: [PATCH 2/2] ACPI: Suppress misleading SPCR console message when
 SPCR table is absent
To: Li Chen <me@linux.beauty>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Liu Wei <liuwei09@cestc.cn>, Ryan Roberts
	<ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Li Chen <chenl311@chinatelecom.cn>,
	Sudeep Holla <sudeep.holla@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>
References: <20250606072802.191580-1-me@linux.beauty>
 <20250606072802.191580-3-me@linux.beauty>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <551bafb9-4a85-9339-8af3-ad0a4d267491@huawei.com>
Date: Thu, 19 Jun 2025 22:54:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20250606072802.191580-3-me@linux.beauty>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_075425_789466_03529C4A 
X-CRM114-Status: GOOD (  19.40  )
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

Hi Li Chen,

On 2025/6/6 15:27, Li Chen wrote:
> From: Li Chen<chenl311@chinatelecom.cn>
> 
> The kernel currently prints:
> "Use ACPI SPCR as default console: No/Yes"
> 
> even on systems that lack an SPCR table. This can
> mislead users into thinking the SPCR table exists
> on the machines without SPCR.
> 
> With this change, the message is only printed if
> acpi_parse_spcr() succeeds (i.e., if the SPCR table
> is present and parsed). This avoids user confusion
> on SPCR-less systems.
> 
> Signed-off-by: Li Chen<chenl311@chinatelecom.cn>
> ---
>   arch/arm64/kernel/acpi.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index b9a66fc146c9f..bf29e7b668f1d 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -197,6 +197,8 @@ static int __init acpi_fadt_sanity_check(void)
>    */
>   void __init acpi_boot_table_init(void)
>   {
> +	int ret;
> +
>   	/*
>   	 * Enable ACPI instead of device tree unless
>   	 * - ACPI has been disabled explicitly (acpi=off), or
> @@ -250,10 +252,11 @@ void __init acpi_boot_table_init(void)
>   		 * behaviour, use acpi=nospcr to disable console in ACPI SPCR
>   		 * table as default serial console.
>   		 */
> -		acpi_parse_spcr(earlycon_acpi_spcr_enable,
> +		ret = acpi_parse_spcr(earlycon_acpi_spcr_enable,
>   			!param_acpi_nospcr);
> -		pr_info("Use ACPI SPCR as default console: %s\n",
> -				param_acpi_nospcr ? "No" : "Yes");
> +		if (!ret)
> +			pr_info("Use ACPI SPCR as default console: %s\n",
> +					param_acpi_nospcr ? "No" : "Yes");

Print "No" for:
- CONFIG_ACPI_SPCR_TABLE is disabled
- ret != 0
- param_acpi_nospcr = 1

Only print "Yes" for ret = 0.

Thanks
Hanjun

