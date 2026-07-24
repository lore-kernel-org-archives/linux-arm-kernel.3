Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449F7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zdQgbqXxACDmr32xzFUqYuLmlqfobQFQNJHT7eLaFY=; b=LI1EVzXPtWqiJHV4g1wAnelK2T
	ty+l2JnlhRROENaGtXa9KVzVlnEL1nUN3Do5+uISA8cChcHFrL7RXErVyo36tE2WSZq55MJUsNasU
	2IKIcOHjqKchLsaYGvSruIn94wRpvrZ/cXtFHCYuvAT8kzQKal3vXDHKOArTSS8YnG44x/DImYawo
	Td8rboDit1UYTE3R7pEW1rOTeLh8UEwiNyXpMixQIZGR7KzNAMs4shAFxLT14jVj6YFRIHqAr8rtv
	L0bzUBO5NA2hfiQCDZG8iSvERfGPtxOju091kwE0HwDy1ZM+56qMJa6lfJejtMVSL4zB0jlbJx8aW
	9e6kNtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9E7-0000000FaOV-04Fo;
	Fri, 24 Jul 2026 06:17:43 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9E4-0000000FaO4-43XT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:17:42 +0000
Received: from [10.94.177.11] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id DA71220B7167;
	Thu, 23 Jul 2026 23:17:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DA71220B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784873845;
	bh=+zdQgbqXxACDmr32xzFUqYuLmlqfobQFQNJHT7eLaFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=siWZQREj97i+UVAMpjAIF1VgYLT4amSn7g7a7hOjo6IkdTHtPTPS6xuV+842TO+VI
	 p6llVgZErniddfrE5jt+OCjoGG4tW/RCF3DQ669F26GKFaGHRJPMg2+lfd/ViH1XIn
	 RxhSfuJB1MSST6jfkFElVQmPuHJnPrxNoM2wlTJo=
Message-ID: <63f3e979-80c4-44c1-b17b-7f5f12882425@linux.microsoft.com>
Date: Fri, 24 Jul 2026 11:47:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: xilinx: Add support to clear TF-A PM state
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-2-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260723124841.2567827-2-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_231741_043998_6EBCF6D8 
X-CRM114-Status: GOOD (  31.91  )
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



On 23-07-2026 18:18, Jay Buddhabhatti wrote:
> Currently, during a kexec restart, only the kernel is reloaded, while the
> TF-A specific data remain unchanged. This leads to a mismatch between the
> kernel state and the TF-A firmware state like SGI number and shutdown
> scope variable.
> 
> For example, the kernel registers an SGI number with TF-A so that TF-A can
> notify the kernel of events via that SGI. TF-A stores this SGI number in
> its internal state. After a kexec, the newly loaded kernel re-registers
> and may request a different SGI number, but the stale value programmed in
> TF-A remains, so event notifications are delivered on the old SGI and are
> missed by the new kernel. The shutdown scope variable has a similar stale
> state problem.
> 
> To resolve this, the TF_A_CLEAR_PM_STATE PM API is introduced to clear
> TF-A-specific state during kexec. On a graceful reboot, this API is
> triggered by zynqmp_firmware_shutdown(), while in a crash kernel scenario,
> it is invoked by zynqmp_firmware_probe() in the reloaded kernel.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c     | 48 +++++++++++++++++++++++++++-
>   include/linux/firmware/xlnx-zynqmp.h |  3 +-
>   2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index af838b2dc327..95ffd8f33ce9 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -3,7 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer
>    *
>    *  Copyright (C) 2014-2022 Xilinx, Inc.
> - *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -13,6 +13,7 @@
>   
>   #include <linux/arm-smccc.h>
>   #include <linux/compiler.h>
> +#include <linux/crash_dump.h>
>   #include <linux/device.h>
>   #include <linux/init.h>
>   #include <linux/mfd/core.h>
> @@ -2065,6 +2066,42 @@ static struct attribute *zynqmp_firmware_attrs[] = {
>   
>   ATTRIBUTE_GROUPS(zynqmp_firmware);
>   
> +/**
> + * zynqmp_clear_pm_state() - Clear subsystem state
> + * @dev: Device pointer used for logging
> + *
> + * Clears PM specific data in TF-A.
> + *
> + * Return: Returns status, either success or error
> + */
> +static int zynqmp_clear_pm_state(struct device *dev)
> +{
> +	u32 pm_family_code;
> +	int ret;
> +
> +	/* Get the Family code of platform */
> +	ret = zynqmp_pm_get_family_info(&pm_family_code);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE) {
> +		/* Check if the TF-A supports the TF_A_CLEAR_PM_STATE */
> +		ret = do_feature_check_call(TF_A_CLEAR_PM_STATE);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1)) {
> +			/* Clear PM specific data in TF-A */
> +			ret = zynqmp_pm_invoke_fn(TF_A_CLEAR_PM_STATE, NULL, 0);
> +			if (ret)
> +				dev_err(dev,
> +					"Failed to clear TF-A specific subsystem state: %d\n", ret);
> +		} else {
> +			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported in TF-A: %d\n", ret);
> +			ret = 0;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>   static int zynqmp_firmware_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -2118,6 +2155,9 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> +	if (is_kdump_kernel())
> +		zynqmp_clear_pm_state(dev);
> +
>   	/* Check trustzone version number */
>   	ret = zynqmp_pm_get_trustzone_version(&pm_tz_version);
>   	if (ret)
> @@ -2151,6 +2191,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
>   	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>   }
>   
> +static void zynqmp_firmware_shutdown(struct platform_device *pdev)
> +{
> +	zynqmp_clear_pm_state(&pdev->dev);
> +}
> +
>   static void zynqmp_firmware_remove(struct platform_device *pdev)
>   {
>   	struct pm_api_feature_data *feature_data;
> @@ -2210,5 +2255,6 @@ static struct platform_driver zynqmp_firmware_driver = {
>   	},
>   	.probe = zynqmp_firmware_probe,
>   	.remove = zynqmp_firmware_remove,
> +	.shutdown = zynqmp_firmware_shutdown,
>   };
>   module_platform_driver(zynqmp_firmware_driver);
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 7e27b0f7bf7e..baaa88b0b197 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -3,7 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer
>    *
>    *  Copyright (C) 2014-2021 Xilinx
> - *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -66,6 +66,7 @@
>   #define FIRMWARE_VERSION_MASK		0xFFFFU
>   
>   /* ATF only commands */
> +#define TF_A_CLEAR_PM_STATE		0xa05
>   #define TF_A_PM_REGISTER_SGI		0xa04
>   #define PM_GET_TRUSTZONE_VERSION	0xa03
>   #define PM_SET_SUSPEND_MODE		0xa02

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>


