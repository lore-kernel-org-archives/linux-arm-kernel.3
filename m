Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B879C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHUkNPa1B+MIEFu1iSNcYoT2Fbye/riPwVaoNSeK+O8=; b=KaGqBWBDKQFF/79BaxcrzR2YuS
	H+MVrqp7vYwIOSZeSnfF5Be/vxAi3lLpt2/GhmOqLgn6lhQ0zZKOErK1fGgwx2UU5tANKEzRrMFiT
	lazF/iCafnOwQZ592VtbDwhuA7ZXsdXM5nroMKFDIhkopWeYcdN1TLtj4NuBNcKHF+c/ULdhogijr
	gbCpehtZq5mDsI7RtRYYnGrqSQUvzvSpk2fkbUH1/zgv1Hy8Ld2Vc31KRRQm6bj1Jd37hSGsse+xA
	veqPi9yJ6ACaGagFwm/ptmDGb8oeAwfMwdkog0Kk1BfNxlWF8MsEbJ75mLY0/G18zQXpyr2US7gxJ
	hfpQv+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtrd-0000000HBA3-31j0;
	Tue, 25 Feb 2025 12:16:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt7I-0000000H2Cy-1GX1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:28:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A19BD1516;
	Tue, 25 Feb 2025 03:29:03 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24A463F673;
	Tue, 25 Feb 2025 03:28:45 -0800 (PST)
Date: Tue, 25 Feb 2025 11:28:42 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 6/7] firmware: imx: Add i.MX95 SCMI CPU driver
Message-ID: <Z72paopAu67kQCBC@pluto>
References: <20250212-imx-lmm-cpu-v2-0-3aee005968c1@nxp.com>
 <20250212-imx-lmm-cpu-v2-6-3aee005968c1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-imx-lmm-cpu-v2-6-3aee005968c1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_032848_434459_39124127 
X-CRM114-Status: GOOD (  27.48  )
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

On Wed, Feb 12, 2025 at 03:40:28PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX95 System manager exports SCMI CPU protocol for linux to manage
> cpu cores. The driver is to use the cpu Protocol interface to
> start, stop a cpu cores (eg, M7).
> 

Hi,

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/Kconfig    | 11 +++++
>  drivers/firmware/imx/Makefile   |  1 +
>  drivers/firmware/imx/sm-cpu.c   | 91 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/firmware/imx/sm.h | 29 +++++++++++++
>  4 files changed, 132 insertions(+)
> 
> diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> index c3e344d6ecc645df1f0e3ee8078934c47f347fd7..91c753921dffbe16ced8c10565d44c15b66b2797 100644
> --- a/drivers/firmware/imx/Kconfig
> +++ b/drivers/firmware/imx/Kconfig
> @@ -23,6 +23,17 @@ config IMX_SCU
>  	  This driver manages the IPC interface between host CPU and the
>  	  SCU firmware running on M4.
>  
> +config IMX_SCMI_CPU_DRV
> +	tristate "IMX SCMI CPU Protocol driver"
> +	depends on IMX_SCMI_CPU_EXT || COMPILE_TEST
> +	default y if ARCH_MXC
> +	help
> +	  The System Controller Management Interface firmware (SCMI FW) is
> +	  a low-level system function which runs on a dedicated Cortex-M
> +	  core that could provide cpu management features.
> +
> +	  This driver can also be built as a module.
> +
>  config IMX_SCMI_LMM_DRV
>  	tristate "IMX SCMI LMM Protocol driver"
>  	depends on IMX_SCMI_LMM_EXT || COMPILE_TEST
> diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
> index 7762855d2a771169d4f1867d27e0d51be7c9ad03..3bbaffa6e3478112638ed031375602389f18ef09 100644
> --- a/drivers/firmware/imx/Makefile
> +++ b/drivers/firmware/imx/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
>  obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
> +obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
>  obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
>  obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
> diff --git a/drivers/firmware/imx/sm-cpu.c b/drivers/firmware/imx/sm-cpu.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..1ce694a34b22843db5c1697ecb33c0479edb2ed9
> --- /dev/null
> +++ b/drivers/firmware/imx/sm-cpu.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/firmware/imx/sm.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/scmi_imx_protocol.h>
> +
> +static const struct scmi_imx_cpu_proto_ops *imx_cpu_ops;
> +static struct scmi_protocol_handle *ph;
> +
> +int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
> +				  bool resume)
> +{
> +	if (!ph)
> +		return -EPROBE_DEFER;
> +
> +	return imx_cpu_ops->cpu_reset_vector_set(ph, cpuid, vector, start,
> +						 boot, resume);
> +}
> +EXPORT_SYMBOL(scmi_imx_cpu_reset_vector_set);
> +
> +int scmi_imx_cpu_start(u32 cpuid)
> +{
> +	if (!ph)
> +		return -EPROBE_DEFER;
> +
> +	return imx_cpu_ops->cpu_start(ph, cpuid);
> +};
> +EXPORT_SYMBOL(scmi_imx_cpu_start);
> +

...same as in LMM...this...

> +int scmi_imx_cpu_started(u32 cpuid, bool *started)
> +{
> +	if (!ph)
> +		return -EPROBE_DEFER;
> +
> +	if (!started)
> +		return -EINVAL;
> +
> +	return imx_cpu_ops->cpu_started(ph, cpuid, started);
> +};
> +EXPORT_SYMBOL(scmi_imx_cpu_started);
> +
> +int scmi_imx_cpu_stop(u32 cpuid)
> +{
> +	if (!ph)
> +		return -EPROBE_DEFER;
> +
> +	return imx_cpu_ops->cpu_stop(ph, cpuid);
> +};
> +EXPORT_SYMBOL(scmi_imx_cpu_stop);
> +

...and this can be just one with ONLY one symbol exported...

> +static int scmi_imx_cpu_probe(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (imx_cpu_ops) {
> +		dev_err(&sdev->dev, "sm cpu already initialized\n");
> +		return -EEXIST;
> +	}
> +
> +	imx_cpu_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_CPU, &ph);
> +	if (IS_ERR(imx_cpu_ops))
> +		return PTR_ERR(imx_cpu_ops);
> +
> +	return 0;
> +}
> +
> +static const struct scmi_device_id scmi_id_table[] = {
> +	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
> +
> +static struct scmi_driver scmi_imx_cpu_driver = {
> +	.name = "scmi-imx-cpu",
> +	.probe = scmi_imx_cpu_probe,
> +	.id_table = scmi_id_table,
> +};
> +module_scmi_driver(scmi_imx_cpu_driver);
> +
> +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> +MODULE_DESCRIPTION("IMX SM CPU driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
> index e02b7b558afb6f430f6fbeeaf3ee1f59feea3c1b..0eff427e5ba2cb3f93c26f7d055c346a1d1433f0 100644
> --- a/include/linux/firmware/imx/sm.h
> +++ b/include/linux/firmware/imx/sm.h
> @@ -21,6 +21,35 @@
>  int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
>  int scmi_imx_misc_ctrl_set(u32 id, u32 val);
>  

Same kind of heads up here too..

> +#if IS_ENABLED(CONFIG_IMX_SCMI_CPU_DRV) || IS_ENABLED(CONFIG_COMPILE_TEST)
> +int scmi_imx_cpu_start(u32 cpuid);
> +int scmi_imx_cpu_started(u32 cpuid, bool *started);
> +int scmi_imx_cpu_stop(u32 cpuid);
> +int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
> +				  bool resume);
> +#else
> +static inline int scmi_imx_cpu_start(u32 cpuid)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_cpu_started(u32 cpuid, bool *started)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_cpu_stop(u32 cpuid)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector,
> +						bool start, bool boot, bool resume)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  #if IS_ENABLED(CONFIG_IMX_SCMI_LMM_DRV) || IS_ENABLED(CONFIG_COMPILE_TEST)
>  int scmi_imx_lmm_boot(u32 lmid);
>  int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info);
> 

Other than this:

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

