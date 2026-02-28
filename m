Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD4BFEE4E5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSVUCWSIM1flG2TV3EjouGAyJrnTt2LzL+TdvWqo8aQ=; b=wU/nPpIcLnbF1pSK6llQQzedt7
	FSf+wq1bXrIhJkq7s9c8FTOHveoOpZHM43NLrk9ihD3fSYL6sQdm9bZq3R/rdLYUkjpHjgsn6+oMY
	/f2NMK+TOQE0hzuKg+ZbpJg3ghHtK8nabkp3F2IfW9nZfQbUsntjLGyUYnvgWj/6nnu9aAtzPwvyF
	saWgyShlCmZCsjfDu8pRG94KBDHTxbbljdKSt8MDhB+xhlg42Pv42DfuZ9yrgJMdgwxmXez4RwT78
	8PQzEvIyf6bYRWAHaFgErF/1vNbpkeYrOgy0INFqh021zupzB3hXKGkxGiIyBZWM/oTLn8RGMtehH
	NIOyeoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwH9N-00000009iKz-0LMH;
	Sat, 28 Feb 2026 10:02:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwH9K-00000009iKe-2fEn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 10:02:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69E081516;
	Sat, 28 Feb 2026 02:02:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24DCF3F73B;
	Sat, 28 Feb 2026 02:02:07 -0800 (PST)
Date: Sat, 28 Feb 2026 10:02:04 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Message-ID: <aaK9HOMWNCb0wzq_@pluto>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
 <20251231-clk-ssc-v7-1-v7-6-380e8b58f9e3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-clk-ssc-v7-1-v7-6-380e8b58f9e3@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_020214_767164_FE519018 
X-CRM114-Status: GOOD (  32.89  )
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

On Wed, Dec 31, 2025 at 06:12:53PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
>  - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
>    for the SCMI clock driver, allows clean integration of vendor-specific
>    features without impacting the core SCMI clock driver logic.
>  - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related
>    declarations.
>  - Initialize OEM extensions via 'scmi_clk_oem_init()'.
>  - Support querying OEM-specific features and setting spread spectrum.
>  - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.

Hi,

> 
> Reviewed-by: Sebin Francis <sebin.francis@ti.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/Makefile       |   2 +-
>  drivers/clk/clk-scmi-oem.c | 103 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/clk-scmi.c     |  19 +++++++--
>  drivers/clk/clk-scmi.h     |  11 +++++
>  4 files changed, 131 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cb10156db2a37e1956d84113d1711e23d9d864ab..8e0e03a79f793ffab6c8636b7796c067287e1712 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -95,7 +95,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
>  obj-$(CONFIG_COMMON_CLK_RPMI)		+= clk-rpmi.o
>  obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
>  obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
> -obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
> +obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o clk-scmi-oem.o
>  obj-$(CONFIG_COMMON_CLK_SCPI)           += clk-scpi.o
>  obj-$(CONFIG_COMMON_CLK_SI5341)		+= clk-si5341.o
>  obj-$(CONFIG_COMMON_CLK_SI5351)		+= clk-si5351.o
> diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fd81aca7bfca254669ee117ebd51e481a74cdcb4
> --- /dev/null
> +++ b/drivers/clk/clk-scmi-oem.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Vendor OEM extension for System Control and Power Interface (SCMI)
> + * Protocol based clock driver
> + *
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/scmi_imx_protocol.h>
> +#include <linux/scmi_protocol.h>
> +
> +#include "clk-scmi.h"
> +
> +#define SCMI_CLOCK_CFG_IMX_SSC			0x80
> +#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK	GENMASK(7, 0)
> +#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK		GENMASK(23, 8)
> +#define SCMI_CLOCK_IMX_SS_ENABLE_MASK		BIT(24)
> +
> +struct scmi_clk_oem_info {
> +	char *vendor_id;
> +	char *sub_vendor_id;
> +	char *compatible;

I suppose different OEM per impl_ver is overkill...and maybe better
to be trated as a bug if it happens leveraging the Quirk framework..

> +	const void *data;
> +};
> +
> +static int
> +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
> +				 const struct clk_spread_spectrum *ss_conf)
> +{
> +	struct scmi_clk *clk = to_scmi_clk(hw);
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * extConfigValue[7:0]   - spread percentage (%)
> +	 * extConfigValue[23:8]  - Modulation Frequency
> +	 * extConfigValue[24]    - Enable/Disable
> +	 * extConfigValue[31:25] - Reserved
> +	 */
> +	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
> +	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
> +	if (ss_conf->method != CLK_SPREAD_NO)
> +		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
> +	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
> +						 SCMI_CLOCK_CFG_IMX_SSC,
> +						 val, false);
> +	if (ret)
> +		dev_warn(clk->dev,
> +			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
> +			 ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
> +			 clk->id);
> +
> +	return ret;
> +}
> +
> +static int
> +scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *ph, u32 id,
> +			     unsigned int *feats_key)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = scmi_proto_clk_ops->config_oem_get(ph, id,
> +						 SCMI_CLOCK_CFG_IMX_SSC,
> +						 &val, NULL, false);
> +	if (!ret)
> +		*feats_key |= BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED);
> +
> +	return 0;
> +}
> +
> +static const struct scmi_clk_oem scmi_clk_oem_imx = {
> +	.query_ext_oem_feats = scmi_clk_imx_query_oem_feats,
> +	.set_spread_spectrum = scmi_clk_imx_set_spread_spectrum,
> +};
> +
> +const struct scmi_clk_oem_info info[] = {

Any reason why this cannot be made static too ?
Given that you just embed it with set_drvdata and then get_drvdata
back from the main clk driver...

> +	{ SCMI_IMX_VENDOR, SCMI_IMX_SUBVENDOR, NULL, &scmi_clk_oem_imx },
> +};
> +
> +int scmi_clk_oem_init(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	int i, size = ARRAY_SIZE(info);
> +
> +	for (i = 0; i < size; i++) {
> +		if (strcmp(handle->version->vendor_id, info[i].vendor_id) ||
> +		    strcmp(handle->version->sub_vendor_id, info[i].sub_vendor_id))
> +			continue;
> +		if (info[i].compatible &&
> +		    !of_machine_is_compatible(info[i].compatible))
> +			continue;
> +
> +		break;
> +	}
> +
> +	if (i < size)
> +		dev_set_drvdata(&sdev->dev, (void *)info[i].data);
> +
> +	return 0;
> +}
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index bf85924d61985eb9e596419349eb883e3817de73..1ed2091e3d4a951c8662db4c94dee4b9c98b8326 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -14,6 +14,8 @@
>  #include <linux/scmi_protocol.h>
>  #include <asm/div64.h>
>  
> +#include "clk-scmi.h"
> +
>  const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
>  
>  static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> @@ -242,6 +244,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
>  static const struct clk_ops *
>  scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>  {
> +	struct scmi_clk_oem *oem_data = dev_get_drvdata(dev);
>  	struct clk_ops *ops;
>  
>  	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
> @@ -288,11 +291,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>  		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
>  	}
>  
> +	if (oem_data && (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED)))
> +		ops->set_spread_spectrum = oem_data->set_spread_spectrum;
> +
>  	return ops;
>  }
>  
>  /**
>   * scmi_clk_ops_select() - Select a proper set of clock operations
> + * @sdev: pointer to the SCMI device
>   * @sclk: A reference to an SCMI clock descriptor
>   * @atomic_capable: A flag to indicate if atomic mode is supported by the
>   *		    transport
> @@ -317,8 +324,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>   *	   NULL otherwise.
>   */
>  static const struct clk_ops *
> -scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
> -		    unsigned int atomic_threshold_us,
> +scmi_clk_ops_select(struct scmi_device *sdev, struct scmi_clk *sclk,
> +		    bool atomic_capable, unsigned int atomic_threshold_us,
>  		    const struct clk_ops **clk_ops_db, size_t db_size)
>  {
>  	int ret;
> @@ -326,6 +333,7 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>  	const struct scmi_clock_info *ci = sclk->info;
>  	unsigned int feats_key = 0;
>  	const struct clk_ops *ops;
> +	struct scmi_clk_oem *oem_data = dev_get_drvdata(&sdev->dev);
>  
>  	/*
>  	 * Note that when transport is atomic but SCMI protocol did not
> @@ -350,6 +358,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>  						 &val, NULL, false);
>  		if (!ret)
>  			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
> +
> +		if (oem_data && oem_data->query_ext_oem_feats)
> +			oem_data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
>  	}
>  
>  	if (WARN_ON(feats_key >= db_size))
> @@ -407,6 +418,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  	clk_data->num = count;
>  	hws = clk_data->hws;
>  
> +	scmi_clk_oem_init(sdev);
> +
>  	transport_is_atomic = handle->is_transport_atomic(handle,
>  							  &atomic_threshold_us);
>  
> @@ -438,7 +451,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>  		 * to avoid sharing the devm_ allocated clk_ops between multiple
>  		 * SCMI clk driver instances.
>  		 */
> -		scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
> +		scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
>  					       atomic_threshold_us,
>  					       scmi_clk_ops_db,
>  					       ARRAY_SIZE(scmi_clk_ops_db));
> diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
> index 6ef6adc77c836dc2d599ff852cdc941f217ee388..d7f63f36c56d155f728325efd6bcf7fe2585b170 100644
> --- a/drivers/clk/clk-scmi.h
> +++ b/drivers/clk/clk-scmi.h
> @@ -7,6 +7,7 @@
>  #define __SCMI_CLK_H
>  
>  #include <linux/bits.h>
> +#include <linux/clk-provider.h>
>  #include <linux/scmi_protocol.h>
>  #include <linux/types.h>
>  
> @@ -19,6 +20,7 @@ enum scmi_clk_feats {
>  	SCMI_CLK_RATE_CTRL_SUPPORTED,
>  	SCMI_CLK_PARENT_CTRL_SUPPORTED,
>  	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
> +	SCMI_CLK_EXT_OEM_SSC_SUPPORTED,
>  	SCMI_CLK_FEATS_COUNT
>  };
>  
> @@ -37,4 +39,13 @@ struct scmi_clk {
>  
>  extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
>  
> +struct scmi_clk_oem {
> +	int (*query_ext_oem_feats)(const struct scmi_protocol_handle *ph,
> +				   u32 id, unsigned int *feats_key);
> +	int (*set_spread_spectrum)(struct clk_hw *hw,
> +				   const struct clk_spread_spectrum *ss_conf);
> +};
> +
> +int scmi_clk_oem_init(struct scmi_device *dev);
> +
>  #endif
>

Other than the above, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

