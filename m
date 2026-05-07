Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70583CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9Gr6Q0uw3RTSizSYDcmK4n12KMJ9B4RCF7XSCBCJkk=; b=v2ed6Fdqxgww0UgQ1+LQ6BTg9p
	OFEWn8JVCukPak/C9kb0wRV3YiHWLq4y6hWvbN8IZFivrONnhqiHDYJr5O/uznxET0DE8r7CBfCMM
	bgVC5IuIBuCX47P2PYqeB2qOLjlXkprWUzUhKlTMxTtk18eZ5mm6sxVN3ZJr9b91TzPIr41xj2fTH
	iixpUCc508qO9BeBR3MxTYAWVcuKT2ML0l/MSjsefUuVZRY+BKe1mE31HOcP51Kl1h9k5ITvvoWEe
	UKH2oRH/Ye/Lc6LoNWkZ8raMn8fWgXLa2cDaZ6GvBwxuP4EspOGkA7Up9RzEwCjpWCdLJGHUi/7mA
	IQ8YDNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1CT-00000004HTo-3rbf;
	Thu, 07 May 2026 16:03:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1CQ-00000004HSa-3k4q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:03:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01B9F3558;
	Thu,  7 May 2026 09:03:36 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4559A3F763;
	Thu,  7 May 2026 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778169821; bh=tiS1CF4xwZtTPzaUlNB7YfKrijbiOLCs8ErKVDBsQrs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=riOfFVv6C6yVxErR2wjQwnAzJHlaUXH/xcDnhM7+B7xdNZkaSLYDQJcZZ4sLGY6fs
	 neHgwUlx/AJ5xYCN0tcZlPmxQUPRa7i5MsYKPyq9R8WKWhKnK6TyenLJFCrhn/vZ2c
	 2BGOpJTytYPMljyFRBL1A5eGX5a5rrbMhdJJcPXc=
Message-ID: <b9900d7a-eaaf-4f1a-b79e-aa968a7b6e29@arm.com>
Date: Thu, 7 May 2026 17:03:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH v2 2/2] arm_mpam: Update architecture version check for
 MPAM MSC
To: Zeng Heng <zengheng4@huawei.com>, xry111@xry111.site,
 catalin.marinas@arm.com, maz@kernel.org, ardb@kernel.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 reinette.chatre@intel.com, miko.lenczewski@arm.com, will@kernel.org,
 suzuki.poulose@arm.com, thuth@redhat.com, ben.horgan@arm.com,
 james.clark@linaro.org, lpieralisi@kernel.org, broonie@kernel.org,
 oupton@kernel.org, anshuman.khandual@arm.com, yeoreum.yun@arm.com,
 leo.yan@arm.com, mrigendra.chaubey@gmail.com, fenghuay@nvidia.com,
 ahmed.genidi@arm.com, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wangkefeng.wang@huawei.com
References: <20260203095406.6437-1-zengheng4@huawei.com>
 <20260203095406.6437-3-zengheng4@huawei.com>
Content-Language: en-GB
In-Reply-To: <20260203095406.6437-3-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_090343_096534_6ACA70B1 
X-CRM114-Status: GOOD (  17.78  )
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

Hi Zeng,

On 03/02/2026 09:54, Zeng Heng wrote:
> In addition to updating the CPU MPAM version check, the MPAM MSC version
> check also need to be updated. mpam_msc_check_aidr() is added to check
> the MSC AIDR register, ensuring that both the major and minor version
> numbers fall within the supported range of the MPAM architecture version.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 744df3a6a078..a58031f0a280 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -202,6 +202,17 @@ static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val
>  
>  #define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
>  
> +static bool mpam_msc_check_aidr(struct mpam_msc *msc)
> +{
> +	u32 rev;
> +
> +	rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
> +
> +	return rev == MPAM_ARCHITECTURE_V0_1 ||
> +	       rev == MPAM_ARCHITECTURE_V1_0 ||
> +	       rev == MPAM_ARCHITECTURE_V1_1;
> +}
> +
>  static u64 mpam_msc_read_idr(struct mpam_msc *msc)
>  {
>  	u64 idr_high = 0, idr_low;
> @@ -842,9 +853,8 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>  
>  	lockdep_assert_held(&msc->probe_lock);
>  
> -	idr = __mpam_read_reg(msc, MPAMF_AIDR);
> -	if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
> -		dev_err_once(dev, "MSC does not match MPAM architecture v1.x\n");

This deliberately only checks the major number. (The MSC architecture always had a
major and minor number). Before your change, MPAM v1.2 is supported, after we'd
get an error for a MPAM v1.2 MSC. (if such a thing exists)

I think its simpler to rule out the unsupported combinations, something like:
| static bool mpam_msc_check_aidr(struct mpam_msc *msc)
| {
| 	u32 rev;
|
| 	rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
|
| 	 /*
| 	 * v0.0 and >v2.x aren't supported, but anything else should be backward
|	 * compatible to v0.1 or v1.0.
|	 */
| 	if (!rev)
| 		return false;
| 	if (rev & MPAMF_AIDR_ARCH_MAJOR_REV > MPAM_ARCHITECTURE_V1)
| 		return false;
|
| 	return true;
| }

> +	if (!mpam_msc_check_aidr(msc)) {
> +		dev_err_once(dev, "MSC does not match MPAM architecture\n");
>  		return -EIO;
>  	}

I'd like to keep the 'v1.x' in this message - this should help folk with old stable
kernels running on new hardware work out why the feature isn't available.
(assuming they have some documentation that says v2.0 in it!)

I've rebased this with the above changes, which I'll post shortly for fixes.


Thanks,

James


