Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C00CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBaqPKCN+VATxn9iGcUpM1W4c3oonUl5Ou/ltMwIKAs=; b=TRkdaYdowFaVdl6m6O04dsPi10
	SeGmX0vMVovX6s1rCN5mnQP+Q/zdOlHr5kwCrteCj37A2gXwloncghVaIJMJmBnJv2uLtd7O2/ugi
	oEXfAX9n7cStIdflEUEW1OtDxQjN7A7udM8xu4/CwU+l8hVTpU8AC9DwFjW2wpyPwv4J7CbtsWXcR
	LgNFpg88jvenJESQiJ1YzdM6Q4DsF5Pc6VleAD7WCAhZmHHQsZdxRAJFlfxeQ4hwI+zM1KJGuMfUZ
	cvb7s4sgol+lckx85D93ou6f/WGEjCHS/Oy4SwP/BhUjvflYnFaILzvsHlzd5bmY1Rf/fWM+lx9dx
	GjowSdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ9R-00000007HWq-1Kxn;
	Fri, 08 May 2026 18:42:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ9P-00000007HW5-0fTT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 18:42:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 253951682;
	Fri,  8 May 2026 11:42:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423B93F763;
	Fri,  8 May 2026 11:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778265733; bh=2R0fPqfrjruSXC8XwdopLbeaSYMX4IVp2H58vn6VBkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljqHJYSwdfOAM9rsQ3vQWOk0Wfhf5MM+bUcBFdFcJy6Q1x3r87sztE2yx/X9kQUC9
	 HX0JUX7MXxXpnL6rx2HVsMpRrbFBHtZj7EOMvygfG+UtEr0VozxhWkA7iGbCPg+j3r
	 cBTr5HIPEBgl/ANtHs2AGesYPhri1sRhgzoWcWHA=
Date: Fri, 8 May 2026 19:42:09 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 3/4] firmware: arm_ffa: Set the core device as FF-A
 device parent
Message-ID: <af4ugdkfaO3m2Ile@e129823.arm.com>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <20260508-b4-ffa_plat_dev-v1-3-c5a30f8cf7b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-3-c5a30f8cf7b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_114215_282642_472BF8EE 
X-CRM114-Status: GOOD (  20.74  )
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

> Pass a parent device into ffa_device_register() and use the synthetic
> arm-ffa platform device as the parent for each registered FF-A device.
> 
> This keeps the enumerated FF-A partition devices anchored below the FF-A
> core device in the driver model, matching the platform-driver conversion
> of the core transport.
> 
> Suggested-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_ffa/bus.c    | 3 ++-
>  drivers/firmware/arm_ffa/driver.c | 5 +++--
>  include/linux/arm_ffa.h           | 4 ++--
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
> index 9576862d89c4..e05fe0b6049c 100644
> --- a/drivers/firmware/arm_ffa/bus.c
> +++ b/drivers/firmware/arm_ffa/bus.c
> @@ -190,7 +190,7 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev)
>  
>  struct ffa_device *
>  ffa_device_register(const struct ffa_partition_info *part_info,
> -		    const struct ffa_ops *ops)
> +		    const struct ffa_ops *ops, struct device *parent)
>  {
>  	int id, ret;
>  	struct device *dev;
> @@ -210,6 +210,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
>  	}
>  
>  	dev = &ffa_dev->dev;
> +	dev->parent = parent;
>  	dev->bus = &ffa_bus_type;
>  	dev->release = ffa_release_device;
>  	dev->dma_mask = &dev->coherent_dma_mask;
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 97ecdb5dac09..e9d7dc71c06d 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1688,7 +1688,7 @@ static int ffa_setup_host_partition(int vm_id)
>  	int ret;
>  
>  	buf.id = vm_id;
> -	ffa_dev = ffa_device_register(&buf, &ffa_drv_ops);
> +	ffa_dev = ffa_device_register(&buf, &ffa_drv_ops, &ffa_pdev->dev);
>  	if (!ffa_dev) {
>  		pr_err("%s: failed to register host partition ID 0x%x\n",
>  		       __func__, vm_id);
> @@ -1758,7 +1758,8 @@ static int ffa_setup_partitions(void)
>  		 * provides UUID here for each partition as part of the
>  		 * discovery API and the same is passed.
>  		 */
> -		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops);
> +		ffa_dev = ffa_device_register(tpbuf, &ffa_drv_ops,
> +					      &ffa_pdev->dev);
>  		if (!ffa_dev) {
>  			pr_err("%s: failed to register partition ID 0x%x\n",
>  			       __func__, tpbuf->id);
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index 81e603839c4a..17eca3dfc59e 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -173,7 +173,7 @@ struct ffa_partition_info;
>  #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
>  struct ffa_device *
>  ffa_device_register(const struct ffa_partition_info *part_info,
> -		    const struct ffa_ops *ops);
> +		    const struct ffa_ops *ops, struct device *parent);
>  void ffa_device_unregister(struct ffa_device *ffa_dev);
>  int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
>  			const char *mod_name);
> @@ -184,7 +184,7 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev);
>  #else
>  static inline struct ffa_device *
>  ffa_device_register(const struct ffa_partition_info *part_info,
> -		    const struct ffa_ops *ops)
> +		    const struct ffa_ops *ops, struct device *parent)
>  {
>  	return NULL;
>  }
> 
> -- 
> 2.43.0
> 

-- 
Sincerely,
Yeoreum Yun

