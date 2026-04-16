Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8158F8D75F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zU9BS6qfEs/eg08m+aUksd74WRGso6r69kxGKS2uZ4s=; b=OcgAHpskjZOWnu1Ban79RB8Ge0
	3HywFd2dzg16vy58OEucU2b1ke3qDVd6ydtDD+Wf2xzuX1V5Lq7ZvUHAr/MRp15VCh8S0clQnNrPf
	DagfabKw0995LV/RHGkjFbI2ESSzYSDm4Ff3n4ocCAv1EKQA63L9uS0nlPLSuqvIPaPG8/mSPuwta
	6z0TmiF8LHzsvjEEWc4uT/RikVp1Bdcgz67RWEl+sed4ubYhSSlnx1Sons8LdhPxcwcTeABEbjaSn
	J5dXF/7SBXdkFgxYlqK4l8tB0YHA/8QWQTVppsQdCUOP3JcDForWWDrB6M4+09XCjeSdGYjx/5t9Y
	18GcQSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOzz-00000002dow-2cyJ;
	Thu, 16 Apr 2026 15:51:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOzx-00000002doZ-3t7p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:51:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BBBB24E9;
	Thu, 16 Apr 2026 08:51:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD5553F7B4;
	Thu, 16 Apr 2026 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776354681; bh=Y7c2itZZk0yJbVxiNIb5WYgIJ3D/rwPEsUDF9KhgLHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcUCh4TqmPpiA5JpU4+jYMcZhi8oMusTTDVtX31e86/c7MkslZuONvihaqPx8y1+l
	 hKpf5slk0+FK/cKe/O5gTp0CQplJVIbjQ+qXzvOTRYLrwzMQgmmoXkTLJnoiMEjMM5
	 E2O6ZRVteIDvNwcM+tW6ttJCjibE0jt8mpi/cxjY=
Date: Thu, 16 Apr 2026 16:51:18 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
Message-ID: <20260416155118.GM356832@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415165528.3369607-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_085122_002477_F7E5EA65 
X-CRM114-Status: GOOD (  13.47  )
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

On Wed, Apr 15, 2026 at 05:55:20PM +0100, Yeoreum Yun wrote:

[...]

> @@ -573,11 +573,9 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>  		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>  
>  	for (i = 0; i < caps->nr_ss_cmp; i++) {
> -		/* always clear status bit on restart if using single-shot */
> -		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>  		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
> +		/* always clear status and pending bits on restart if using single-shot */
> +		etm4x_relaxed_write32(csa, 0x0, TRCSSCSRn(i));

In Arm ARM, D24.4.60 TRCSSCSR<n>, bits[0..3] are RO.  I think it is
fine for directly clear the regiser with zero (means it will only
clear status / pending bits).

[...]

> @@ -1841,10 +1839,11 @@ static ssize_t sshot_status_show(struct device *dev,
>  {
>  	unsigned long val;
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>  	struct etmv4_config *config = &drvdata->config;
>  
>  	raw_spin_lock(&drvdata->spinlock);
> -	val = config->ss_status[config->ss_idx];
> +	val = caps->ss_cmp[config->ss_idx];
>  	raw_spin_unlock(&drvdata->spinlock);
>  	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>  }

This sysfs knob never can print out a realtime status for sshot, I am
fine for only printing caps->ss_cmp, this can avoid any misleading.

@Suzuki, @Mike, do you agree with the change above?

If maintainers agree with this, as Jie suggested, it is good to add a
comment in the code and update the document:

  Documentation/trace/coresight/coresight-etm4x-reference.rst

Thanks,
Leo

