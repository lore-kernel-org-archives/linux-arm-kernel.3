Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E4710A1E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP+2SOFYuuXmKkKk4h5++E5TTs+8Dra2A/iKcsn4gWE=; b=Tz+BfO7e5D2gtgY5uJ/onefTDH
	wsBFu60Mg5aOvOyrZ8AQeJ+xRclh885zS6xitU1GdxpTqAsj0OPjpyyudAweTCPoUDYPE2daP7Ad6
	zgtc7hLqeXRXvojwd8+QE1iGW3U1uaHwkRuO0AyB9YUhws7hirdC3+BI9H40Fw6WPm43nnGvb+ylr
	p0J8EeOSiNebAyGS0unv3Av+P8sdslhkqptpJ0XibhrpsiZLFtCaqmjbDWxcvK5B0cJmtM1wVqqhQ
	dyAhRlgIZpB7yOaNcEQ6sJj7v6unzlYXmUeiHSWT1hzmSld94MBxbxaUp6m4RP7yhgh4rKjuGJt7N
	MYmBq0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5i8i-00000005HUT-2kYT;
	Thu, 26 Mar 2026 10:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5i8S-00000005HTC-0IGX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:40:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF361175A;
	Thu, 26 Mar 2026 03:40:12 -0700 (PDT)
Received: from [10.57.76.165] (unknown [10.57.76.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DC6E3FB90;
	Thu, 26 Mar 2026 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774521618; bh=jCgA5Qoq0F1Yxd79EMxK5dXZ+XK/jWruv7LJw+fK3S0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3WnHrRdamLykfPTlVFokk/Uvzgsnhp0B4vw5wO2j37T78seG4zPV/MPjo/0tN2JX
	 TuJsRxhTv+sulyeAiSQq/dHHvQLPu0UE895yM16X98AHocoqdK9OoMwVsTw2PXhTmt
	 7B+kEnefTxcsOOoQEgl5pJYyNitQs7yHSW7eY4HM=
Message-ID: <45fbd3d2-4c46-49ce-9d19-38b247ad7388@arm.com>
Date: Thu, 26 Mar 2026 10:40:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix resource_size_t printk specifier in
 arm_cmn_init_dtc()
To: Nathan Chancellor <nathan@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260325-perf-arm-cmn-fix-resource_size_t-format-v1-1-e84d52ee3e81@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260325-perf-arm-cmn-fix-resource_size_t-format-v1-1-e84d52ee3e81@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_034020_243324_54F7EBA5 
X-CRM114-Status: GOOD (  18.04  )
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

On 2026-03-26 2:19 am, Nathan Chancellor wrote:
> When building for 32-bit ARM, there is a warning when using the %llx
> specifier to print a resource_size_t variable:
> 
>    drivers/perf/arm-cmn.c: In function 'arm_cmn_init_dtc':
>    drivers/perf/arm-cmn.c:2149:73: error: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Werror=format=]
>     2149 |                                      "Failed to request DTC region 0x%llx\n", base);
>          |                                                                      ~~~^     ~~~~
>          |                                                                         |     |
>          |                                                                         |     resource_size_t {aka unsigned int}
>          |                                                                         long long unsigned int
>          |                                                                      %x
> 
> Use the %pa specifier to handle the possible sizes of phys_addr_t
> properly. This requires passing the variable by reference.

Cheers Nathan! I had seen the kbuild robot reports last night, and was 
going to get to this today, but I'm more than happy to be beaten to it!

Reviewed-by: Robin murphy <robin.murphy@arm.com>

> Fixes: 5394396ff548 ("perf/arm-cmn: Stop claiming entire iomem region")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/perf/arm-cmn.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 1ac91cda6780..5c727c2abaf0 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2146,7 +2146,7 @@ static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *dn, int id
>   	size = cmn->part == PART_CMN600 ? SZ_16K : SZ_64K;
>   	if (!devm_request_mem_region(cmn->dev, base, size, dev_name(cmn->dev)))
>   		return dev_err_probe(cmn->dev, -EBUSY,
> -				     "Failed to request DTC region 0x%llx\n", base);
> +				     "Failed to request DTC region 0x%pa\n", &base);
>   
>   	writel_relaxed(CMN_DT_DTC_CTL_DT_EN, dtc->base + CMN_DT_DTC_CTL);
>   	writel_relaxed(CMN_DT_PMCR_PMU_EN | CMN_DT_PMCR_OVFL_INTR_EN, CMN_DT_PMCR(dtc));
> 
> ---
> base-commit: 2f89b7f78c50ca973ca035ceb30426f78d9e0996
> change-id: 20260325-perf-arm-cmn-fix-resource_size_t-format-b01795e36e60
> 
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
> 


