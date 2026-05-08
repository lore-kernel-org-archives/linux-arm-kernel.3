Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119CECD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5ufMvWo8efcJx/WLTwd6QzfshHSTnMmD5mG1ATfK6c=; b=r5L1NgpUK9+Aum/VktUq8Y4Ild
	BEYI9iml5tg0sklKunCzY1yhyuqYCGakaQ4JG/bF0FXZjyJ7QF8KsAACwFVyuLAWZA/idI9mkJbVu
	mE6Hon5m1hnEA/IbCaU4eI/49hTKybV3udyP7sEC+pUiKwdkB32LQOXUG531SakxAvc4cgdMzJcUp
	O4FTF8wJ+ImeitV5INX4WJPp7addA6mh+1fuQqD7wAs47o7RKDbUxvomVTiRc6a/AtVF5YlPuBwLT
	QfOZ5kno1SVvgkeme0iXBG3mBPJeKrOnT6VxzwCsPhqUgHsn4z2tCg7B3fQqFxTfCF1KpTTXSdXfs
	7fBKfarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ8i-00000007HMU-3BZX;
	Fri, 08 May 2026 18:41:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ8g-00000007HLs-0xYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:41:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 422F535C8;
	Fri,  8 May 2026 11:41:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94FC43F763;
	Fri,  8 May 2026 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778265687; bh=XINvWQU6IfXvVeoD9TNizFxqoQoUcr+yFMhFtPgaEBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpYKBeK+DS0RckzMNtF9Lqq1DjRKQfJqWbJLtkY6jssxDukuQ937nkw5Ya1RnKs8z
	 MKc7FZXAtK7FBjQZQDWeuXhHpAZK/WwDkcFkGRd0DsxtqErOIWEL3FVpnxnOyGEwn2
	 V0i55eSmnbfMUvaCUFfSKmydISiQtVEnE8t1QN6Y=
Date: Fri, 8 May 2026 19:41:24 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/4] firmware: arm_ffa: Register core as a platform driver
Message-ID: <af4uVBqhJW+4vug6@e129823.arm.com>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <20260508-b4-ffa_plat_dev-v1-2-c5a30f8cf7b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-2-c5a30f8cf7b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_114130_457326_CC164ED8 
X-CRM114-Status: GOOD (  27.65  )
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

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Fri, May 08, 2026 at 06:54:16PM +0100, Sudeep Holla wrote:
> Move the FF-A core bring-up and teardown paths into platform driver
> probe and remove callbacks, and register a synthetic arm-ffa platform
> device to bind the driver.
> 
> This makes the FF-A core lifetime follow the driver model while keeping
> the device creation internal to the FF-A core. Use normal platform driver
> registration so the probe path has standard driver-core semantics.
> 
> The synthetic platform device is a temporary bridge until ACPI and
> devicetree describe the FF-A core device or object. Once those firmware
> description paths are defined, the internal platform device creation can
> be dropped and the driver can bind to the firmware-described device
> directly.
> 
> Since the transport selection now happens from the platform probe path,
> drop the __init annotation from ffa_transport_init().
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_ffa/common.h |  4 +--
>  drivers/firmware/arm_ffa/driver.c | 53 ++++++++++++++++++++++++++++++++++-----
>  drivers/firmware/arm_ffa/smccc.c  |  2 +-
>  3 files changed, 50 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ffa/common.h
> index 9c6425a81d0d..5cdf4bd222c6 100644
> --- a/drivers/firmware/arm_ffa/common.h
> +++ b/drivers/firmware/arm_ffa/common.h
> @@ -18,9 +18,9 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev);
>  void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uuid);
>  
>  #ifdef CONFIG_ARM_FFA_SMCCC
> -int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
> +int ffa_transport_init(ffa_fn **invoke_ffa_fn);
>  #else
> -static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
> +static inline int ffa_transport_init(ffa_fn **invoke_ffa_fn)
>  {
>  	return -EOPNOTSUPP;
>  }
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 6efb85787e6e..97ecdb5dac09 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -36,6 +36,7 @@
>  #include <linux/mm.h>
>  #include <linux/mutex.h>
>  #include <linux/of_irq.h>
> +#include <linux/platform_device.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/smp.h>
> @@ -46,6 +47,7 @@
>  
>  #define FFA_DRIVER_VERSION	FFA_VERSION_1_2
>  #define FFA_MIN_VERSION		FFA_VERSION_1_0
> +#define FFA_PLATFORM_NAME	"arm-ffa"
>  
>  #define SENDER_ID_MASK		GENMASK(31, 16)
>  #define RECEIVER_ID_MASK	GENMASK(15, 0)
> @@ -114,6 +116,7 @@ struct ffa_drv_info {
>  };
>  
>  static struct ffa_drv_info *drv_info;
> +static struct platform_device *ffa_pdev;
>  
>  /*
>   * The driver must be able to support all the versions from the earliest
> @@ -2029,7 +2032,7 @@ static void ffa_notifications_setup(void)
>  	ffa_notifications_cleanup();
>  }
>  
> -static int __init ffa_init(void)
> +static int ffa_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  	u32 buf_sz;
> @@ -2042,6 +2045,7 @@ static int __init ffa_init(void)
>  	drv_info = kzalloc_obj(*drv_info);
>  	if (!drv_info)
>  		return -ENOMEM;
> +	platform_set_drvdata(pdev, drv_info);
>  
>  	ret = ffa_version_check(&drv_info->version);
>  	if (ret)
> @@ -2103,19 +2107,56 @@ static int __init ffa_init(void)
>  		free_pages_exact(drv_info->tx_buffer, rxtx_bufsz);
>  	free_pages_exact(drv_info->rx_buffer, rxtx_bufsz);
>  free_drv_info:
> +	platform_set_drvdata(pdev, NULL);
>  	kfree(drv_info);
> +	drv_info = NULL;
>  	return ret;
>  }
> -module_init(ffa_init);
>  
> -static void __exit ffa_exit(void)
> +static void ffa_remove(struct platform_device *pdev)
>  {
> +	struct ffa_drv_info *info = platform_get_drvdata(pdev);
> +
>  	ffa_notifications_cleanup();
>  	ffa_partitions_cleanup();
>  	ffa_rxtx_unmap();
> -	free_pages_exact(drv_info->tx_buffer, drv_info->rxtx_bufsz);
> -	free_pages_exact(drv_info->rx_buffer, drv_info->rxtx_bufsz);
> -	kfree(drv_info);
> +	free_pages_exact(info->tx_buffer, info->rxtx_bufsz);
> +	free_pages_exact(info->rx_buffer, info->rxtx_bufsz);
> +	kfree(info);
> +	platform_set_drvdata(pdev, NULL);
> +	drv_info = NULL;
> +}
> +
> +static struct platform_driver ffa_driver = {
> +	.probe = ffa_probe,
> +	.remove = ffa_remove,
> +	.driver = {
> +		.name = FFA_PLATFORM_NAME,
> +	},
> +};
> +
> +static int __init ffa_init(void)
> +{
> +	int ret;
> +
> +	ffa_pdev = platform_device_register_simple(FFA_PLATFORM_NAME,
> +						   PLATFORM_DEVID_NONE,
> +						   NULL, 0);
> +	if (IS_ERR(ffa_pdev))
> +		return PTR_ERR(ffa_pdev);
> +
> +	ret = platform_driver_register(&ffa_driver);
> +	if (ret)
> +		platform_device_unregister(ffa_pdev);
> +
> +	return ret;
> +}
> +module_init(ffa_init);
> +
> +static void __exit ffa_exit(void)
> +{
> +	platform_device_unregister(ffa_pdev);
> +	platform_driver_unregister(&ffa_driver);
>  }
>  module_exit(ffa_exit);
>  
> diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm_ffa/smccc.c
> index 4d85bfff0a4e..e6125dd9f58f 100644
> --- a/drivers/firmware/arm_ffa/smccc.c
> +++ b/drivers/firmware/arm_ffa/smccc.c
> @@ -17,7 +17,7 @@ static void __arm_ffa_fn_hvc(ffa_value_t args, ffa_value_t *res)
>  	arm_smccc_1_2_hvc(&args, res);
>  }
>  
> -int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
> +int ffa_transport_init(ffa_fn **invoke_ffa_fn)
>  {
>  	enum arm_smccc_conduit conduit;
>  
> 
> -- 
> 2.43.0
> 

-- 
Sincerely,
Yeoreum Yun

