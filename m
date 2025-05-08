Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF67C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 01:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW62iOPUC5gBFt1aqH+RWrFlUGzaF/8Z02g9y3LTJjQ=; b=F9eo3P7P8lbavzRgl7WB8iECYP
	L58FNbVuSzehlMzkphY73SK/fqzv1eSKKI5t7nW2+LntAaGo/WeRmoYZZsJenzxPtWnFVPqwhzJs8
	LR4pBdCAfMTTyosqWMbRnX2ZH7xYaIsJjXsMsHkcb8pZ13fN8pQckzo+K74wsBxQKrcZNDTNzihHy
	HgvWscW3BLnomBOAM6eP6UF0JqmLPGUkdiszBTFr+u1BbPwGBdhSuzBUQ1woLCuF4TFavUJFpXur9
	+g8rUxl5NJsqDfvK8kvQO1IA0XFUo6ZkAH6HTvsMXEJ73Q2nDO4JO7pK+t2TV3W/EUCNdyRn9eLNQ
	ybcjnnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCppg-0000000H5GU-1a8d;
	Thu, 08 May 2025 01:13:52 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCpnh-0000000H5C3-1Ul8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 01:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746666705; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tW62iOPUC5gBFt1aqH+RWrFlUGzaF/8Z02g9y3LTJjQ=;
	b=uXesBr/+2lSdZgMSShWRDNNkUmwvQT0zir/6DsCDFwjKVviUIFbc70SUIxP1nrh7IepBfS4V3UQ+XzvntiMAURkkxWlY4cieG7KZlzoZcbDxbuLjPU9QIxJ5urAVA2eNL0zBhjvby9hs6DmLLMtZIhsX2Thc3G33ameWnu8LYa8=
Received: from 30.246.160.110(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WZy-uMo_1746666700 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 May 2025 09:11:41 +0800
Message-ID: <750e66eb-f5c8-4127-8c02-14b8928f7a28@linux.alibaba.com>
Date: Thu, 8 May 2025 09:11:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: SDEI: Allow sdei initialization without
 ACPI_APEI_GHES
To: Huang Yiwei <quic_hyiwei@quicinc.com>, will@kernel.org,
 rafael@kernel.org, lenb@kernel.org, james.morse@arm.com,
 tony.luck@intel.com, bp@alien8.de
Cc: quic_aiquny@quicinc.com, quic_satyap@quicinc.com,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
 kernel@oss.qualcomm.com
References: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250507045757.2658795-1-quic_hyiwei@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_181149_871658_3FF32E73 
X-CRM114-Status: GOOD (  26.13  )
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



在 2025/5/7 12:57, Huang Yiwei 写道:
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
> 
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
> 
> This patch corrects the dependency in Kconfig and splits sdei_init()
> into two separate functions: sdei_init() and acpi_sdei_init().
> sdei_init() will be called by arch_initcall and will only initialize
> the platform driver, while acpi_sdei_init() will initialize the
> device from acpi_ghes_init() when ACPI is ready. This allows the
> initialization of SDEI without ACPI_APEI_GHES enabled.
> 
> Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_init()")
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---
>   drivers/acpi/apei/Kconfig   |  1 +
>   drivers/acpi/apei/ghes.c    |  2 +-
>   drivers/firmware/Kconfig    |  1 -
>   drivers/firmware/arm_sdei.c | 11 ++++++++---
>   include/linux/arm_sdei.h    |  4 ++--
>   5 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
> index 3cfe7e7475f2..070c07d68dfb 100644
> --- a/drivers/acpi/apei/Kconfig
> +++ b/drivers/acpi/apei/Kconfig
> @@ -23,6 +23,7 @@ config ACPI_APEI_GHES
>   	select ACPI_HED
>   	select IRQ_WORK
>   	select GENERIC_ALLOCATOR
> +	select ARM_SDE_INTERFACE if ARM64
>   	help
>   	  Generic Hardware Error Source provides a way to report
>   	  platform hardware errors (such as that from chipset). It
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 289e365f84b2..0f3c663c1b0a 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -1715,7 +1715,7 @@ void __init acpi_ghes_init(void)
>   {
>   	int rc;
>   
> -	sdei_init();
> +	acpi_sdei_init();
>   
>   	if (acpi_disabled)
>   		return;
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index aadc395ee168..7df19d82aa68 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -31,7 +31,6 @@ config ARM_SCPI_PROTOCOL
>   config ARM_SDE_INTERFACE
>   	bool "ARM Software Delegated Exception Interface (SDEI)"
>   	depends on ARM64
> -	depends on ACPI_APEI_GHES
>   	help
>   	  The Software Delegated Exception Interface (SDEI) is an ARM
>   	  standard for registering callbacks from the platform firmware
> diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
> index 3e8051fe8296..71e2a9a89f6a 100644
> --- a/drivers/firmware/arm_sdei.c
> +++ b/drivers/firmware/arm_sdei.c
> @@ -1062,13 +1062,12 @@ static bool __init sdei_present_acpi(void)
>   	return true;
>   }
>   
> -void __init sdei_init(void)
> +void __init acpi_sdei_init(void)
>   {
>   	struct platform_device *pdev;
>   	int ret;
>   
> -	ret = platform_driver_register(&sdei_driver);
> -	if (ret || !sdei_present_acpi())
> +	if (!sdei_present_acpi())
>   		return;
>   
>   	pdev = platform_device_register_simple(sdei_driver.driver.name,
> @@ -1081,6 +1080,12 @@ void __init sdei_init(void)
>   	}
>   }
>   
> +static int __init sdei_init(void)
> +{
> +	return platform_driver_register(&sdei_driver);
> +}
> +arch_initcall(sdei_init);
> +
>   int sdei_event_handler(struct pt_regs *regs,
>   		       struct sdei_registered_event *arg)
>   {
> diff --git a/include/linux/arm_sdei.h b/include/linux/arm_sdei.h
> index 255701e1251b..f652a5028b59 100644
> --- a/include/linux/arm_sdei.h
> +++ b/include/linux/arm_sdei.h
> @@ -46,12 +46,12 @@ int sdei_unregister_ghes(struct ghes *ghes);
>   /* For use by arch code when CPU hotplug notifiers are not appropriate. */
>   int sdei_mask_local_cpu(void);
>   int sdei_unmask_local_cpu(void);
> -void __init sdei_init(void);
> +void __init acpi_sdei_init(void);
>   void sdei_handler_abort(void);
>   #else
>   static inline int sdei_mask_local_cpu(void) { return 0; }
>   static inline int sdei_unmask_local_cpu(void) { return 0; }
> -static inline void sdei_init(void) { }
> +static inline void acpi_sdei_init(void) { }
>   static inline void sdei_handler_abort(void) { }
>   #endif /* CONFIG_ARM_SDE_INTERFACE */
>   

LGTM. Thanks.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Shuai


