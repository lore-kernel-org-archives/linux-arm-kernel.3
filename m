Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA1CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp/8Ngm9YlrhXh7O1mcZa9RH66+4UTIMv2darPjP0wQ=; b=Y3MF046DrjTT5myLlGw3q/yoDy
	1OS+aYPb/coiwJIlwCNqQBHaTEyaBRlA2Wo5QHofHJ8ikSMHhjIsRgRlBc6VMKQpCcw/4Qy57uNIr
	VT51VbKKc+pn0BlCrG6R8JA1m70Pv1IqawKdFM9BerZvniZZQKL+gE6DxtijzFAi3J8KBayhl5znR
	NSai7GNrB0GfowyOI1VJJt4uyL9zxh3HZd1uIrHfcr1DEiGGQlYecjMU2ZXSUeAmOkZedWAOSnNpY
	6XDWEhtGUzNQtcllawEsJ+Hp1cir0MkdHNuZgkB0PwgUsCrItFITlLwWDHl+VnC4yUNi37uRv1L1c
	j4zPkbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpNj-00000001h3J-46sX;
	Tue, 26 May 2026 10:51:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpNg-00000001h2D-226i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 10:51:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92FEF169C;
	Tue, 26 May 2026 03:51:19 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82C123F7B4;
	Tue, 26 May 2026 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779792684; bh=ZxOUuceS2mxmDx2oNv6hCdsGaOdZS8PVj3M7iP62dbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6YMIO2N360Dwl1uu4plqdmpqgjBNP0wS6JklC5B/aLtkqSKVBxg+93v6VC+gfM9F
	 83lPoSShTY2rg6E4cxYx0Jjm3O0crKYxqOAVmcFUpEdpkhILGxQWRTQmfjCmzhkyER
	 WVd8dkNQ/SFUheW/uFNM62wiyfAfoakRFQhOrdhs=
Date: Tue, 26 May 2026 11:51:21 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: Treat missing FF-A feature on a
 platform as a probe miss
Message-ID: <ahV7KVX2jPhGELwF@e129823.arm.com>
References: <20260526103649.5684-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526103649.5684-1-sudeep.holla@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_035128_826045_430DC9C6 
X-CRM114-Status: GOOD (  20.67  )
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

On Tue, May 26, 2026 at 11:36:49AM +0100, Sudeep Holla wrote:
> When FF-A initialisation is driven from a platform device probe, systems
> that do not implement FF-A can return -EOPNOTSUPP from the early transport
> or version discovery paths. Driver core treats that as a matched probe
> failure and prints:
> 
>   |  arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95
> 
> That is noisy for a firmware interface that can be absent on otherwise
> valid systems. Driver core already treats -ENODEV and -ENXIO as quiet
> rejected matches, so translate only the early unsupported discovery cases
> to -ENODEV. Keep later setup failures unchanged so real FF-A
> initialisation problems are still reported as probe failures.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/all/20260523001148.GA1319283@ax162
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_ffa/driver.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 54984e1b9741..0f468362c288 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -2109,7 +2109,7 @@ static int ffa_probe(struct platform_device *pdev)
>  
>  	ret = ffa_transport_init(&invoke_ffa_fn);
>  	if (ret)
> -		return ret;
> +		return ret == -EOPNOTSUPP ? -ENODEV : ret;
>  
>  	drv_info = kzalloc_obj(*drv_info);
>  	if (!drv_info)
> @@ -2117,8 +2117,11 @@ static int ffa_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, drv_info);
>  
>  	ret = ffa_version_check(&drv_info->version);
> -	if (ret)
> +	if (ret) {
> +		if (ret == -EOPNOTSUPP)
> +			ret = -ENODEV;
>  		goto free_drv_info;
> +	}
>  
>  	if (ffa_id_get(&drv_info->vm_id)) {
>  		pr_err("failed to obtain VM id for self\n");
> -- 
> 2.43.0
> 

-- 
Sincerely,
Yeoreum Yun

