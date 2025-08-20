Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93818CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzuJIHrLOatCif1mYOvPygXmFvxefs9LM1o3ex4/k/Q=; b=leZmnauBctvImPvJFlsnAUsgby
	1aXcrNTO5O/Pk9PHb68oTLIcy9qtzEhTvH/ECgNnDSnFmWWMV9z8iemIacjXKuUduORTUJa+wnOon
	IPa24ElmmRZ7QgbNZEk+5ULjxfm1E9kmAFq6DpuKi+Fqd/r75CmCFBELzDtZhqAZhK1zO6x+zQfnQ
	7uzTwOfxPMuyZL5SP2EvlZogelq9xIe4JAMRyLDpEh7Zv5Kvr4stY0HY86v5+GCBfHdQyXk7DtOh1
	DnyiL/ZLqCHCvUZjGu0VhVkYwcSII7w/7Gr4kYlAGzeGpVP/Fhy1sOINYHTsw3zduqVrjtgbPRFgy
	vn6+mZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokSH-0000000ECR8-1bjk;
	Wed, 20 Aug 2025 15:10:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojFk-0000000DuQf-09kn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:53:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDC031D31;
	Wed, 20 Aug 2025 06:53:14 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 040873F63F;
	Wed, 20 Aug 2025 06:53:20 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:53:18 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: imx: Add stub functions for SCMI CPU API
Message-ID: <aKXTTqoIBAMWbeCI@pluto>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
 <20250807-imx9-sm-v1-3-3489e41a6fda@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-imx9-sm-v1-3-3489e41a6fda@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_065324_114495_5D182A0A 
X-CRM114-Status: GOOD (  16.99  )
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

On Thu, Aug 07, 2025 at 09:47:44AM +0800, Peng Fan wrote:
> To ensure successful builds when CONFIG_IMX_SCMI_CPU_DRV is not enabled,
> this patch adds static inline stub implementations for the following
> functions:
> 
>   - scmi_imx_cpu_start()
>   - scmi_imx_cpu_started()
>   - scmi_imx_cpu_reset_vector_set()
> 
> These stubs return -EOPNOTSUPP to indicate that the functionality is not
> supported in the current configuration. This avoids potential build or
> link errors in code that conditionally calls these functions based on
> feature availability.
> 
> Fixes: 1055faa5d660 ("firmware: imx: Add i.MX95 SCMI CPU driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  include/linux/firmware/imx/sm.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
> index f2a72177bb37c1d46145a60710e3809641e0f5a2..a33b45027356751f4b8ad9b9136f0dd302a82520 100644
> --- a/include/linux/firmware/imx/sm.h
> +++ b/include/linux/firmware/imx/sm.h
> @@ -41,10 +41,28 @@ static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_IMX_SCMI_CPU_DRV)
>  int scmi_imx_cpu_start(u32 cpuid, bool start);
>  int scmi_imx_cpu_started(u32 cpuid, bool *started);
>  int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
>  				  bool resume);
> +#else
> +static inline int scmi_imx_cpu_start(u32 cpuid, bool start)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_cpu_started(u32 cpuid, bool *started)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start,
> +						bool boot, bool resume)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

