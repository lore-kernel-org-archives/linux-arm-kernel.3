Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B728BC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRpv6T+siWNkBqHSEcPyaMCGolHAkyNsTUU37plUbXY=; b=MNFw+3esNa/RZucu8ZEPCDqVWU
	Dj5FeXZrnFHLEde70CGmYCJ7OzhnZGmmeBcxRhF/VwB1jnRlZGiEf8/4t9a2rtYw3+exu3eG6QYhR
	3B4nOtcfFS3SuI9IIFQ9pmAN3hhP3NDd6ZI2ebTJLd4wPU/oOqh/kJVUfOvISCMqW/0Fv+jS/B8Dg
	ava1AktyhREDuUOtEwVHvH2ZyGGv/0bljSKT+hHelgcUi5nJLxdtFybRNnPwiUck/6Z3Cxq0safj8
	NuXB0yti7GHzck0CDqPateKnsZV8V7IOXgQG40UedSNOM1GObZ28ufCJ+DgoRHs0xPBL25Tgjrz8v
	xAvyXKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9ER-0000000FaRu-0cip;
	Fri, 24 Jul 2026 06:18:03 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9EP-0000000FaRS-2T91
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:18:02 +0000
Received: from [10.94.177.11] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id DA37620B7167;
	Thu, 23 Jul 2026 23:17:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DA37620B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784873866;
	bh=VRpv6T+siWNkBqHSEcPyaMCGolHAkyNsTUU37plUbXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gBhaVe/Sk1p4a1zqY0SbQg8TLSuQnOjOB5KIeLVAOVZHYPYvKbPLmsaF8C2l0u20p
	 o46dth0yF+OnENkT91WMDrO/ynuDq5c4AOr4oUowOEdK50w3np62qsEOrGDdFooS75
	 tO6oQ8NG1vpBijXTdXIEvPVxmkcZzEbjRLa3UVRs=
Message-ID: <976333d5-01d5-433a-ad02-56d6b1249af3@linux.microsoft.com>
Date: Fri, 24 Jul 2026 11:47:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: xilinx: Release all peripheral devices from
 firmware
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-3-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260723124841.2567827-3-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_231801_668109_99635DE9 
X-CRM114-Status: GOOD (  24.94  )
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
> During a kexec restart, only the kernel is reloaded while devices
> allocated in firmware persist, causing state mismatches between the
> kernel and firmware.
> 
> Introduce PM_DEV_ALL_PERIPH node ID (0x18224FFFU) to release all
> peripheral devices during kexec. On graceful restarts, this happens in
> zynqmp_firmware_shutdown(). On crash kernel restarts, it happens in
> zynqmp_firmware_probe() of the reloaded kernel.
> 
> Releasing all peripherals depends on firmware support for the
> PM_DEV_ALL_PERIPH node ID. On firmware that does not implement it (the
> feature check reports a version below PM_API_VERSION_3) the release is
> skipped and a warning such as "Bulk device release is not supported by
> firmware" is logged, e.g. on Versal NET firmware that predates this API.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c     | 15 ++++++++++++++-
>   include/linux/firmware/xlnx-zynqmp.h |  4 ++++
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 95ffd8f33ce9..64d2109eefd2 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -2070,7 +2070,7 @@ ATTRIBUTE_GROUPS(zynqmp_firmware);
>    * zynqmp_clear_pm_state() - Clear subsystem state
>    * @dev: Device pointer used for logging
>    *
> - * Clears PM specific data in TF-A.
> + * Clears PM specific data in TF-A and firmware.
>    *
>    * Return: Returns status, either success or error
>    */
> @@ -2097,6 +2097,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported in TF-A: %d\n", ret);
>   			ret = 0;
>   		}
> +
> +		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> +		ret = do_feature_check_call(PM_RELEASE_NODE);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
> +			/* Attempt to release all peripheral devices via firmware */
> +			ret = zynqmp_pm_release_node(PM_DEV_ALL_PERIPH);
> +			if (ret)
> +				dev_err(dev, "Failed to release all peripheral devices: %d\n", ret);
> +		} else {
> +			dev_warn(dev,
> +				 "Bulk device release is not supported by firmware: %d\n", ret);
> +			ret = 0;
> +		}
>   	}
>   
>   	return ret;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index baaa88b0b197..ac39e5492961 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -50,6 +50,7 @@
>   /* PM API versions */
>   #define PM_API_VERSION_1	1
>   #define PM_API_VERSION_2	2
> +#define PM_API_VERSION_3	3
>   
>   #define PM_PINCTRL_PARAM_SET_VERSION	2
>   
> @@ -145,6 +146,9 @@
>   #define XPM_EVENT_ERROR_MASK_NOC_NCR		BIT(13)
>   #define XPM_EVENT_ERROR_MASK_NOC_CR		BIT(12)
>   
> +/* Node ID for all peripheral devices */
> +#define PM_DEV_ALL_PERIPH	0x18224FFFU
> +
>   enum pm_module_id {
>   	PM_MODULE_ID = 0x0,
>   	XPM_MODULE_ID = 0x2,

Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

