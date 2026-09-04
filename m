Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C57C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BSvwniIuvPykambzZsTGS1qYLPp0Fhc1QozAdLB/y0=; b=muC8B8tTrcymWSvRtSrga1seCv
	DCW4qK5/xxA3zYtMMQvMZN3W1QWhNtkXHHdXt6tW+jVfxYQGXfcUsjzrr/Hij6VbhFLWY+hKU7TH7
	xBlUSWZrnd+Vl/4SbSQzI/42Pyb4aLSbzuH8hXRcHmCD6++Tyozl70lzqPH25BJsrIpzlkzeA/mNm
	GyAZHwo61e4pcR3zYhgsI/vlFL7l21vZYrdt3QeFxGrRCMDhi37Y61DoeYZkHpz+9ogYM2x3XaPef
	rGAhV82Djc+l9wtCoupVgA9SPEE+08EbfVYlwGC94gB9T2x00cv5cwMPiz+SUW21gdOoCdKrA83GH
	qjxH22Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tzi-00000002Dhf-0uvj;
	Fri, 04 Sep 2026 13:30:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tzg-00000002DgD-31vv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Sep 2026 13:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+BSvwniIuvPykambzZsTGS1qYLPp0Fhc1QozAdLB/y0=; b=dYCaUKSPChbVOdVBCPiPoCeeQK
	glkIh/qtwH+73L3/kHHkq4WKHBZ7iJyPRKfGMcnH1s050UMHSSG2Yh9TYI60j+GdRdBWmPjZKkOsf
	Es9humCBPFW+EYAFz1fTROGobkF5X1b0JIHKwAAdmklQe//Fl8OFOP/kypqrh4sioXw93HYuWJd+X
	wvziHh2+gp7zvA/HOIN42vywmafw8JW+kjuUQBiUyb1nMMSlNbGYlbXlMYmdvvNrbYecjBdsaE0UK
	qtT+VTTV8lfdRokAWUFFvmkpiSpAnGWmkP96009X1rMGwAzQL09JwUlJuK1hj24UOwhPG8CNvi5tk
	ogzCTbBQ==;
Received: from mgamail.intel.com ([192.198.163.19])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2Tzc-0000000E8T2-2UyQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788528608; x=1820064608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=grhnvhyknET3B7IdJvQibXDzsJ5N/WqEsZ9s8sa9fm0=;
  b=hv4Oc9d3zOp1bZ7rvsWp8WDugFrGKKjDyH30SmjPgfCQdpnPYPDYlPyx
   eyXjzTMnP4UKMTZISEJLYXRyw2B9+jJnAZ2FtCLNpVQPejCU1dvVqWsPB
   k4/w/ycAHhT8q1vaje4rcoNSAI9RYsEDroB2MLc+PwhZP9THK0TnLPblU
   yiddFiFvlcmEln+s2FxVRVGFUrm6H2J3aXrSFMaXxl5VBDsxmDjrloNAd
   o/IiG8T/9x6/iN9wlxgMboa2S52jlB8tPEdO0024jgfOfEVX3ITdSYJrl
   1K2WEQ56/MGxOHucJPkP4vTNtOlqL67MbVZQ/ZurFKXTZjKTYQzow731T
   Q==;
X-CSE-ConnectionGUID: My9Wh4rgSoi1Qph4LjzOjA==
X-CSE-MsgGUID: cQUbTEXqS1mIlIKClzDQZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="87966976"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="87966976"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 06:30:00 -0700
X-CSE-ConnectionGUID: cguac88uTRmVD4kZTqMv8g==
X-CSE-MsgGUID: 1Xy87WaxQhialAHJ1iJzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="275319220"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.224])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 06:29:55 -0700
Date: Fri, 4 Sep 2026 16:29:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/13] pinctrl: ambarella: add CV75 pin controller
Message-ID: <aprH0EAx6PlQuoxq@ashevche-desk.local>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-10-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-cv75-v5-v6-10-e918514cb3b1@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_143009_042122_5DA55699 
X-CRM114-Status: GOOD (  25.22  )
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

On Fri, Sep 04, 2026 at 02:38:17PM +0800, Long Zhao via B4 Relay wrote:

> Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
> tables. GPIO is handled by the PL061 driver.

...

> +#include <linux/kernel.h>

Absolutely no. Follow IWYU principle in all your patches.

...

> +#define CV75_GROUP(_name)						\
> +	{								\
> +		.name = #_name,						\
> +		.pinmux = cv75_##_name##_pinmux,				\
> +		.num_pins = ARRAY_SIZE(cv75_##_name##_pinmux),		\
> +	}
> +
> +#define CV75_FUNCTION(_name)						\
> +	{								\
> +		.name = #_name,						\
> +		.groups = cv75_##_name##_groups,				\
> +		.num_groups = ARRAY_SIZE(cv75_##_name##_groups),		\
> +	}

Don't we have respective macros in linux/pinctrl/pinctrl.h

...

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/bitmap.h>
> +#include <linux/io.h>

> +#include <linux/of.h>
> +#include <linux/of_device.h>



> +#include <linux/slab.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/seq_file.h>

Make it ordered, group linux/pinctrl/ separately after generic linux/*.h

> +#include "pinconf.h"
> +#include "pinctrl-ambarella.h"

...

> +struct amb_pinctrl_soc_data {
> +	struct device			*dev;
> +	const struct amb_pinctrl_data	*data;
> +	void __iomem			*iomux_base;
> +	struct regmap			*ds_regmap;
> +	struct regmap			*pull_regmap;
> +	unsigned int			npins;
> +	unsigned long			used[BITS_TO_LONGS(AMBA_MAX_PINS)];
> +	raw_spinlock_t lock;
> +
> +	struct pinctrl_dev		*pctl;

> +	const struct ambpin_function	*functions;
> +	unsigned int			nr_functions;
> +	struct ambpin_group		*groups;
> +	unsigned int			nr_groups;

Check what linux/pinctrl/pinctrl.h and drivers/pinctrl/core.h provide.

> +};

...

> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static void amb_pin_dbg_show(struct pinctrl_dev *pctldev,
> +			     struct seq_file *s, unsigned int pin)
> +{
> +	seq_printf(s, " %s", pinctrl_dev_get_devname(pctldev));
> +}
> +#endif

Does this bring any new information?

...

> +/* check if the selector is a valid pin function selector */
> +static int amb_pinmux_request(struct pinctrl_dev *pctldev, unsigned int pin)
> +{
> +	struct amb_pinctrl_soc_data *soc = pinctrl_dev_get_drvdata(pctldev);
> +
> +	if (test_and_set_bit(pin, soc->used))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +/* check if the selector is a valid pin function selector */
> +static int amb_pinmux_free(struct pinctrl_dev *pctldev, unsigned int pin)
> +{
> +	struct amb_pinctrl_soc_data *soc = pinctrl_dev_get_drvdata(pctldev);
> +
> +	clear_bit(pin, soc->used);
> +
> +	return 0;
> +}

Why? Isn't internal pinctrl tracking is not enough?

...

> +static void amb_pinmux_set_altfunc(struct amb_pinctrl_soc_data *soc,
> +				   u32 bank, u32 offset, u32 altfunc)
> +{
> +	u32 i, data;
> +
> +	if (!amb_iomux_accessible(soc))
> +		return;
> +
> +	for (i = 0; i < 3; i++) {

	for (unsigned int i...

> +		data = readl_relaxed(soc->iomux_base + IOMUX_OFFSET(bank, i));
> +		data &= ~BIT(offset);
> +		data |= ((altfunc >> i) & 1U) << offset;
> +		writel_relaxed(data, soc->iomux_base + IOMUX_OFFSET(bank, i));
> +	}
> +}

...

> +static int amb_drive_strength_to_reg(struct amb_pinctrl_soc_data *soc,
> +				     u32 strength)
> +{
> +	if (soc->data->have_ds2) {
> +		switch (strength) {
> +		case 3:
> +			return 0;
> +		case 4:
> +		case 5:
> +			return 1;
> +		case 6:
> +			return 2;
> +		case 7:
> +		case 8:
> +			return 3;
> +		case 9:
> +			return 4;
> +		case 12:
> +			return 5;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	switch (strength) {
> +	case 2:
> +		return 0;
> +	case 4:
> +		return 1;
> +	case 8:
> +		return 2;
> +	case 12:
> +		return 3;
> +	default:
> +		return -EINVAL;
> +	}
> +}

I would look better in three functions

static int amb_drive_strength_to_reg(struct amb_pinctrl_soc_data *soc,
				     u32 strength)
{
	if (soc->data->have_ds2)
		return amb_drive_strength_to_reg_ds2(soc, strength);

	return amb_drive_strength_to_reg_ds1(soc, strength);

}

> +static int amb_reg_to_drive_strength(struct amb_pinctrl_soc_data *soc, u32 ds)
> +{
> +	static const int ds2_ma[] = { 3, 4, 6, 8, 9, 12 };
> +	static const int ds_ma[] = { 2, 4, 8, 12 };

You have switch cases that use the same arrays, use them for both.

> +	if (soc->data->have_ds2) {
> +		if (ds >= ARRAY_SIZE(ds2_ma))
> +			return -EINVAL;
> +
> +		return ds2_ma[ds];
> +	}
> +
> +	if (ds >= ARRAY_SIZE(ds_ma))
> +		return -EINVAL;
> +
> +	return ds_ma[ds];
> +}

...

I stopped here, this driver is quite far from the modern pin control standards,
please look around, you find a lot of new drivers there, that are written in
more-or-less compact ways, using better APIs and approaches.

When creating a driver, use also helper tools, like `pahole`,
scripts/bloat-o-meter, et cetera. Compile with `make W=1 C=1 ...`
using both compilers (GCC and clang).

...

> +static const struct of_device_id amb_pinctrl_dt_match[] = {
> +	{
> +		.compatible = "ambarella,cv75-pinctrl",
> +		.data = &ambarella_cv75_pinctrl_data,
> +	},
> +	{},

No trailing comma for the terminator entry.

> +};

...

> +static struct platform_driver amb_pinctrl_driver = {
> +	.probe	= amb_pinctrl_probe,
> +	.driver	= {
> +		.name	= "ambarella-pinctrl",
> +		.of_match_table = of_match_ptr(amb_pinctrl_dt_match),

Why of_match_ptr()?!

> +	},
> +};

-- 
With Best Regards,
Andy Shevchenko



