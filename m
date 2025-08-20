Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D91FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wsy0M6T461IomW2yZyMKTA6lfX7YAUbA9IgRhmhrxJs=; b=Pdsxa6fqBRCEm3ZblJXupxLbq0
	J1egqpio28oCgVk/uaN2pv6lEUY8IRMrNo8qQNNVL/NXQ7njOcG1Yeq3+Pkq309jLeXPwrI3A0VXj
	pZO+hkm/ZcyloadrAXDgj4Iq8mqEMMThL6UOTjqb3UHWPRLa9xQiWbJsNW1iPBL0TbXz8P49j916w
	DBYLWegqVZq37KCwXqF0QkAi6+wNkJQYOaT4KWSF69As1ifSaoDPecLOI8GUS1WpQLtmkPR0smECZ
	ahOLCjqeGROKW5uvbNeCIhCunEZ6Guutr0EqvKlPYRcZ0qPX9qPRhQX7UDKZcmxWHnirUvAiirUh4
	8W3DHXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokN8-0000000EBYC-2txS;
	Wed, 20 Aug 2025 15:05:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojEe-0000000DuEj-0Ygf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:52:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 650381D31;
	Wed, 20 Aug 2025 06:52:07 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7780D3F63F;
	Wed, 20 Aug 2025 06:52:13 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:52:10 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] firmware: imx: Add stub functions for SCMI LMM API
Message-ID: <aKXTChnYGUgJzCD1@pluto>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
 <20250807-imx9-sm-v1-2-3489e41a6fda@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-imx9-sm-v1-2-3489e41a6fda@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_065216_212763_B1E70116 
X-CRM114-Status: GOOD (  16.95  )
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

On Thu, Aug 07, 2025 at 09:47:43AM +0800, Peng Fan wrote:
> To ensure successful builds when CONFIG_IMX_SCMI_LMM_DRV is not enabled,
> this patch adds static inline stub implementations for the following
> functions:
> 
>   - scmi_imx_lmm_operation()
>   - scmi_imx_lmm_info()
>   - scmi_imx_lmm_reset_vector_set()
> 
> These stubs return -EOPNOTSUPP to indicate that the functionality is not
> supported in the current configuration. This avoids potential build or
> link errors in code that conditionally calls these functions based on
> feature availability.
> 
> Fixes: 7242bbf418f0 ("firmware: imx: Add i.MX95 SCMI LMM driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/linux/firmware/imx/sm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
> index 99c15bbb46aa8329b5aa8e03017e152074cdf492..f2a72177bb37c1d46145a60710e3809641e0f5a2 100644
> --- a/include/linux/firmware/imx/sm.h
> +++ b/include/linux/firmware/imx/sm.h
> @@ -56,7 +56,24 @@ enum scmi_imx_lmm_op {
>  #define SCMI_IMX_LMM_OP_FORCEFUL	0
>  #define SCMI_IMX_LMM_OP_GRACEFUL	BIT(0)
>  
> +#if IS_ENABLED(CONFIG_IMX_SCMI_LMM_DRV)
>  int scmi_imx_lmm_operation(u32 lmid, enum scmi_imx_lmm_op op, u32 flags);
>  int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info);
>  int scmi_imx_lmm_reset_vector_set(u32 lmid, u32 cpuid, u32 flags, u64 vector);
> +#else
> +static inline int scmi_imx_lmm_operation(u32 lmid, enum scmi_imx_lmm_op op, u32 flags)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_lmm_reset_vector_set(u32 lmid, u32 cpuid, u32 flags, u64 vector)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
>  #endif

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian


