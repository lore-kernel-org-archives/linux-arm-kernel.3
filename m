Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D83CC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTaVTst+te6fxwk+vgG9xGn2H5FB//wgXtax395KZ+A=; b=gpHhLln9j/PlpYzfFE2S5aMOQM
	0fPSVt/bgE/wqlaODjMPmxHkOzh/Yga5OEWEY9zLfqIQL3h+yM6PRAszqjGOebKBAAj+A0SLTh/+F
	vJ6XTd9rA+gQo1iV7+YYt1NRDAc8NqqvyQAJ9JTexuQT1ZR9Ql3kiah8S8Jv3zU+cNO+9CkjAYOho
	L1uO8teAhbQPXeYdRcC+8kCqrmTGozu5IlAHU9zkt/IyHYG6boLyuRgRr5hhgYgXjPOsgg1R/tKRN
	ySPlqRaL+4O7uLqw9I68EAgjS63uYMCzBMYpG1GXJR/RYjdWDb0t0HfrtFR1A8vd75Bzwe+t2Awld
	RmcfTikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbEq-0000000EjOP-2Yzf;
	Fri, 21 Mar 2025 12:12:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbD8-0000000Ej6i-3iMa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 12:10:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56E60106F;
	Fri, 21 Mar 2025 05:10:57 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0A813F694;
	Fri, 21 Mar 2025 05:10:48 -0700 (PDT)
Message-ID: <40e30ec8-a7ea-46b9-b687-aa7efa8cf0e1@arm.com>
Date: Fri, 21 Mar 2025 12:10:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] coresight: Only check bottom two claim bits
To: James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250320-james-coresight-claim-tags-v3-2-d3145c153820@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_051050_971528_02972AAA 
X-CRM114-Status: GOOD (  16.93  )
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

On 20/03/2025 14:34, James Clark wrote:
> The use of the whole register and == could break the claim mechanism if
> any of the other bits are used in the future. The referenced doc "PSCI -
> ARM DEN 0022D" also says to only read and clear the bottom two bits.
> 
> Use FIELD_GET() to extract only the relevant part.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 3 ++-
>   drivers/hwtracing/coresight/coresight-priv.h | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 8471aefeac76..26d149a4c579 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -131,7 +131,8 @@ coresight_find_out_connection(struct coresight_device *csdev,
>   
>   static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
>   {
> -	return csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR);
> +	return FIELD_GET(CORESIGHT_CLAIM_MASK,
> +			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
>   }
>   
>   static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 82644aff8d2b..38bb4e8b50ef 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -35,6 +35,7 @@ extern const struct device_type coresight_dev_type[];
>    * Coresight device CLAIM protocol.
>    * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
>    */
> +#define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
>   #define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)

I am checking with the Arm CoreSight architects on this. This is
problematic, if another agent is assigned, say BIT(2) and we wouldn't
forward compatible.

Suzuki


>   
>   #define TIMEOUT_US		100
> 


