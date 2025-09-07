Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC0ACAC581
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPkY5brtyZTaAJRQxj7XiLZBCqqpedM3SSB3yFRmieE=; b=YC4jgh6/K6O916qDKasw8Ba7uG
	MPYvivYix5Xk0wmwwiHTo5zxaoFhwNsVoQspBZ3rH6eXfakQW20DOzH53yjNjlHr18uIy9L9sqah7
	PogNyDgzuslAK1rHD4I2oi0v4Uo53IRdmtCWLaphtFKsaBBlwIlS1zm5d6I4uaMJMKJBI6iUgwCbl
	8dSDF61+Ggk0MxrJiA7f8PJtRJU293ehaUxgV4Q2xpZYkgIdSZK5/Z50QpEq2hgnCLbYZzJbDuaL3
	APnjT7Nwh6R3cUZhx6oK3Fbg4iruobi+ikkez43g8IhVVpaRLX8HQlzlwusQAiYif/TMpNTXE9HOz
	XXjwbRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvEqJ-0000000B8qM-07Nh;
	Sun, 07 Sep 2025 12:50:03 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvEnQ-0000000B7VT-0mPZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 12:47:06 +0000
Date: Sun, 7 Sep 2025 08:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1757249221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPkY5brtyZTaAJRQxj7XiLZBCqqpedM3SSB3yFRmieE=;
	b=WavTSsXewKXW5uEGtXiSc88XDQlJREjSF28FfFHu2UjFKSfnQU3DAFfzHvp6meHBOMPRMo
	A7UgvUsxMPTOOHgtZMvfTP0v+fNkQ1vEfk8mPyS7xKjao3BmW1VHwGnjyGDkPhznq7cFEr
	CVkexOe1G0W2qaFYCtzhjSqLMY7OrtQfseBZD/4E45jcNL2Q2ywPe5cKZPPAID2UuE5RWo
	9KubcjJsZvBA42jZxHpmI5R/bM45GFrWBc/7U1ciMJmhswSxO4h8VkrLjzvLv3IzDhiPy4
	GML/aTyUmx5zI751Vo3gH8I1rHhRrnJoE7FpcNldC/0/bSQAdPpnVqn4uI/Eug==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 17/22] soc: apple: Add hardware tunable support
Message-ID: <aL1-v_cRXkchDpOC@fedora>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-17-52c348623ef6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250906-atcphy-6-17-v2-17-52c348623ef6@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_054704_385366_DCB93128 
X-CRM114-Status: GOOD (  28.94  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat, Sep 06, 2025 at 03:43:30PM +0000, Sven Peter a écrit :
> Various hardware, like the Type-C PHY or the Thunderbolt/USB4 NHI,
> present on Apple SoCs need machine-specific tunables passed from our
> bootloader m1n1 to the device tree. Add generic helpers so that we
> don't have to duplicate this across multiple drivers.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/soc/apple/Kconfig         |  4 +++
>  drivers/soc/apple/Makefile        |  3 ++
>  drivers/soc/apple/tunable.c       | 71 +++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/apple/tunable.h | 60 +++++++++++++++++++++++++++++++++
>  4 files changed, 138 insertions(+)
> 
> diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
> index 6388cbe1e56b5a9d90acad3ee2377ed6ac0d207d..f266b70fd9620cc940dc685f7eb2972c21a361df 100644
> --- a/drivers/soc/apple/Kconfig
> +++ b/drivers/soc/apple/Kconfig
> @@ -41,6 +41,10 @@ config APPLE_SART
>  
>  	  Say 'y' here if you have an Apple SoC.
>  
> +config APPLE_TUNABLE
> +	tristate
> +	depends on ARCH_APPLE || COMPILE_TEST
> +
>  endmenu
>  
>  endif
> diff --git a/drivers/soc/apple/Makefile b/drivers/soc/apple/Makefile
> index 4d9ab8f3037b7159771d8817fa507ba29f99ae10..0b85ab61aefe131349a67d0aa80204edd8e89925 100644
> --- a/drivers/soc/apple/Makefile
> +++ b/drivers/soc/apple/Makefile
> @@ -8,3 +8,6 @@ apple-rtkit-y = rtkit.o rtkit-crashlog.o
>  
>  obj-$(CONFIG_APPLE_SART) += apple-sart.o
>  apple-sart-y = sart.o
> +
> +obj-$(CONFIG_APPLE_TUNABLE) += apple-tunable.o
> +apple-tunable-y = tunable.o
> diff --git a/drivers/soc/apple/tunable.c b/drivers/soc/apple/tunable.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c54da8ef28cef16118c518c761f95e8dd9f78002
> --- /dev/null
> +++ b/drivers/soc/apple/tunable.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple Silicon hardware tunable support
> + *
> + * Each tunable is a list with each entry containing a offset into the MMIO
> + * region, a mask of bits to be cleared and a set of bits to be set. These
> + * tunables are passed along by the previous boot stages and vary from device
> + * to device such that they cannot be hardcoded in the individual drivers.
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/soc/apple/tunable.h>
> +
> +struct apple_tunable *devm_apple_tunable_parse(struct device *dev,
> +					       struct device_node *np,
> +					       const char *name)
> +{
> +	struct apple_tunable *tunable;
> +	struct property *prop;
> +	const __be32 *p;
> +	size_t sz;
> +	int i;
> +
> +	prop = of_find_property(np, name, NULL);
> +	if (!prop)
> +		return ERR_PTR(-ENOENT);
> +
> +	if (prop->length % (3 * sizeof(u32)))
> +		return ERR_PTR(-EINVAL);
> +	sz = prop->length / (3 * sizeof(u32));
> +
> +	tunable = devm_kzalloc(dev,
> +			       sizeof(*tunable) + sz * sizeof(*tunable->values),
> +			       GFP_KERNEL);
> +	if (!tunable)
> +		return ERR_PTR(-ENOMEM);
> +	tunable->sz = sz;
> +
> +	for (i = 0, p = NULL; i < tunable->sz; ++i) {
> +		p = of_prop_next_u32(prop, p, &tunable->values[i].offset);
> +		p = of_prop_next_u32(prop, p, &tunable->values[i].mask);
> +		p = of_prop_next_u32(prop, p, &tunable->values[i].value);
> +	}
> +
> +	return tunable;
> +}
> +EXPORT_SYMBOL(devm_apple_tunable_parse);
> +
> +void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < tunable->sz; ++i) {
> +		u32 val, old_val;
> +
> +		val = old_val = readl_relaxed(regs + tunable->values[i].offset);
> +		val &= ~tunable->values[i].mask;
> +		val |= tunable->values[i].value;
> +		if (val != old_val)
> +			writel_relaxed(val, regs + tunable->values[i].offset);
> +	}
> +}
> +EXPORT_SYMBOL(apple_tunable_apply);
> +
> +MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
> +MODULE_DESCRIPTION("Apple Silicon hardware tunable support");
> diff --git a/include/linux/soc/apple/tunable.h b/include/linux/soc/apple/tunable.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..3785ee2c898993328356005b63682f4848fc2f22
> --- /dev/null
> +++ b/include/linux/soc/apple/tunable.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Apple Silicon hardware tunable support
> + *
> + * Each tunable is a list with each entry containing a offset into the MMIO
> + * region, a mask of bits to be cleared and a set of bits to be set. These
> + * tunables are passed along by the previous boot stages and vary from device
> + * to device such that they cannot be hardcoded in the individual drivers.
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#ifndef _LINUX_SOC_APPLE_TUNABLE_H_
> +#define _LINUX_SOC_APPLE_TUNABLE_H_
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +/**
> + * Struct to store an Apple Silicon hardware tunable.
> + *
> + * Each tunable is a list with each entry containing a offset into the MMIO
> + * region, a mask of bits to be cleared and a set of bits to be set. These
> + * tunables are passed along by the previous boot stages and vary from device
> + * to device such that they cannot be hardcoded in the individual drivers.
> + *
> + * @param sz Number of [offset, mask, value] tuples stored in values.
> + * @param values [offset, mask, value] array.
> + */
> +struct apple_tunable {
> +	size_t sz;
> +	struct {
> +		u32 offset;
> +		u32 mask;
> +		u32 value;
> +	} values[];
> +};
> +
> +/**
> + * Parse an array of hardware tunables from the device tree.
> + *
> + * @dev: Device node used for devm_kzalloc internally.
> + * @np: Device node which contains the tunable array.
> + * @name: Name of the device tree property which contains the tunables.
> + *
> + * @return: devres allocated struct on success or PTR_ERR on failure.
> + */
> +struct apple_tunable *devm_apple_tunable_parse(struct device *dev,
> +					       struct device_node *np,
> +					       const char *name);
> +
> +/**
> + * Apply a previously loaded hardware tunable.
> + *
> + * @param regs: MMIO to which the tunable will be applied.
> + * @param tunable: Pointer to the tunable.
> + */
> +void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable);
> +
> +#endif
> 
> -- 
> 2.34.1
> 
> 

