Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A031FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwSkz1RCIjFqZ0MMbiZFNAkVYzRIOM/tbTN2pNgGEv4=; b=PKz9Lc7kpY6lzBFE82RZfWjl24
	cTIOPB9Xo9+h7o750QWmnxNMsB6+xbHNaryrgfPjYtC/3eG1fGGgny2stbwM69G/U9gUpu0D5D50j
	KcgtnqN56FKg3hQR/yN2jLVQhhpZp2KQsGHuVXS/Pk9dhOLWjreK4yRROcDaiNcvhPhnxTwbKZvwS
	7CJMXrELbPaR0FzOOutf49FqcsBgQuiA17H8dMK3Csx4CM5aIOgMg6e3UdB+9ss/kiGUegrKVjkdQ
	5AvM/QKdUgelmVpy0rJAWXc2B2FFAhOUkY6cSWqFJlg6fbJJ0HqCl6jvIzm5Eurimv4UTu/aM6TYq
	ado48Pjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAxA-0000000FVG2-3D8t;
	Tue, 05 May 2026 08:16:28 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAx6-0000000FVFO-41BV;
	Tue, 05 May 2026 08:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777968985; x=1809504985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g+zxFimWOaIqhOyLpJlxgYGzOopzI118ke5hAnL5GcU=;
  b=lzyuZVFjagLVzAvKD394i/VDnslKEXjNxeW01o3wnAoNFNRpSw9YqYMY
   kH6M6RonOIVLq56bYjnoh/Ot4rNeuy88hBDW5PBx0uf5AsapnXtoytnUl
   OmUd1Fi0Y6lcJkvudAUjtE3mnQxzzQzRq8x0CDCyhdjh2eo7qDRSygUeE
   XJrWAvebPF34D9hujTM1lMReRz9Nh5c0OTKjfvcsaWp+m4l5h9mz1z8+S
   /rgL9fVjs/nn5SUUf26GsklZGB2TqwvALrKpa3J0GPOLPqMkENtb8z1Yi
   DbCUqCe/34cOb5Hankq1mOfqlUGgqWD6el9N+0fKrbn5dsHiu0ENES6/x
   g==;
X-CSE-ConnectionGUID: EpqwDGmoQL+98kohOt8odQ==
X-CSE-MsgGUID: L642Q+8dRau5waCQi5VDSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96260441"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="96260441"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:16:24 -0700
X-CSE-ConnectionGUID: 8IcJ58BYROusM7pCtr2zYg==
X-CSE-MsgGUID: 1HuvudfwSVqCuBtHxLSekg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259425562"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:16:19 -0700
Date: Tue, 5 May 2026 11:16:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 06/13] thermal: mediatek: add pmic thermal support
Message-ID: <afmnUG8dG0N0HpV6@ashevche-desk.local>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
 <20260504-mt6323-v1-6-799b58b355ff@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-mt6323-v1-6-799b58b355ff@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_011625_112008_48F7C09E 
X-CRM114-Status: GOOD (  30.32  )
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

On Mon, May 04, 2026 at 09:24:58PM +0300, Roman Vivchar via B4 Relay wrote:

> Add a new driver to support thermal monitoring on MediaTek PMICs.
> 
> The driver retrieves calibration data from EFUSE, calculates the
> temperature using a linear interpolation, and registers the device with
> the thermal framework.
> 
> Initial support is added for the mt6323 PMIC.

First of all, please take into account the comments given against previous
patches.

...

> +config MTK_PMIC_THERMAL
> +	tristate "AUXADC temperature sensor driver for MediaTek PMICs"
> +	depends on MFD_MT6397
> +	help
> +	  Enable this option if you want to get PMIC temperature
> +	  information for MediaTek platforms.
> +	  This driver configures thermal controllers to collect
> +	  temperature via AUXADC interface.

Don't we want to tell user how the module will be called in case of M choice?

...

> +#include <linux/err.h>
> +#include <linux/iio/consumer.h>

> +#include <linux/kernel.h>

No way your driver uses this header.

> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/thermal.h>

Please, follow IWYU.

> +#include <linux/mfd/mt6323/registers.h>

...

> +#define MT6323_TEMP_MIN			-20000
> +#define MT6323_TEMP_MAX			150000

Don't you want to use units.h multipliers?

...

> +/* Layout of the fuses providing the calibration data */
> +#define CALIB_BUF0_VTS(x)		(((x) >> 8) & 0xff)
> +#define CALIB_BUF0_DEGC_CALI(x)		(((x) >> 2) & 0x3f)
> +#define CALIB_BUF0_ADC_CALI_EN(x)	(((x) >> 1) & 0x1)
> +
> +#define CALIB_BUF1_ID_20(x)		(((x) >> 14) & 0x1)
> +#define CALIB_BUF1_ID_10(x)		(((x) >> 12) & 0x1)
> +#define CALIB_BUF1_O_SLOPE_20(x)	(((((x) >> 11) & 0x7) << 3) + (((x) >> 6) & 0x7))
> +#define CALIB_BUF1_O_SLOPE_10(x)	(((x) >> 6) & 0x3f)
> +#define CALIB_BUF1_O_SLOPE_SIGN(x)	(((x) >> 5) & 0x1)
> +#define CALIB_BUF1_VTS(x)		((((x) >> 0) & 0x1f) << 8)

Why not use BIT() and GENMASK() as appropriate? But better, why not use
bitfield.h APIs?

...

> +struct mtk_thermal_data {
> +	const char *const *sensors;
> +	s32 num_sensors;

> +	const int cali_val;

What exactly does 'const' benefit here with?

> +	int (*extract_efuse)(struct mtk_pmic_thermal *mt, u16 *buf);
> +	void (*precalc)(struct mtk_pmic_thermal *mt, s32 vts, s32 degc_cali,
> +			s32 o_slope, s32 o_slope_sign);
> +};

...

> +struct mtk_pmic_sensor {
> +	struct mtk_pmic_thermal *mt;
> +	int id;
> +	struct iio_channel *adc_channel;
> +	struct thermal_zone_device *tzdev;
> +};

Can you confirm with `pahole` that this is the best layout (taking into account
the use in the below data structure)?

> +struct mtk_pmic_thermal {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mtk_pmic_sensor sensors[MAX_SENSORS];
> +
> +	s32 t_slope1;
> +	s32 t_slope2;
> +	s32 t_intercept;
> +
> +	const struct mtk_thermal_data *data;
> +};

...

> +static int mtk_pmic_read_temp(struct thermal_zone_device *tz, int *temperature)
> +{
> +	struct mtk_pmic_sensor *sensor = thermal_zone_device_priv(tz);
> +	int ret, raw, temp;
> +
> +	ret = iio_read_channel_processed(sensor->adc_channel, &raw);
> +	if (ret < 0) {
> +		dev_err(sensor->mt->dev, "failed to read iio channel: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	temp = sensor->mt->t_intercept +
> +	       ((sensor->mt->t_slope1 * raw) / sensor->mt->t_slope2);

Too many parentheses.

> +	if (!mtk_pmic_thermal_temp_is_valid(temp))
> +		return -EINVAL;
> +
> +	*temperature = temp;
> +	return 0;
> +}

...

> +static void mtk_pmic_thermal_precalc_mt6323(struct mtk_pmic_thermal *mt,
> +					    s32 vts, s32 degc_cali, s32 o_slope,
> +					    s32 o_slope_sign)
> +{
> +	s32 vbe_t;
> +
> +	mt->t_slope1 = 100 * 1000;

magic1 * magic2...

> +	if (o_slope_sign == 0)
> +		mt->t_slope2 = -(mt->data->cali_val + o_slope);
> +	else
> +		mt->t_slope2 = -(mt->data->cali_val - o_slope);
> +
> +	vbe_t = -1 * (((vts + 9102) * 1800) / 32768) * 1000;

More magics...

> +	if (o_slope_sign == 0)
> +		mt->t_intercept =
> +			(vbe_t * 100) / -(mt->data->cali_val + o_slope);
> +	else
> +		mt->t_intercept =
> +			(vbe_t * 100) / -(mt->data->cali_val - o_slope);
> +
> +	mt->t_intercept += (degc_cali * (1000 / 2));

Too many parentheses.

> +}

This entire function misses a lot of comments and formulas with the references
to the datasheet.

...

> +{
> +	struct nvmem_cell *cell;
> +	void *buf;
> +	size_t len;
> +	int ret;
> +
> +	cell = nvmem_cell_get(dev, "calibration-data");
> +	if (IS_ERR(cell))
> +		return PTR_ERR(cell);
> +
> +	buf = nvmem_cell_read(cell, &len);
> +	nvmem_cell_put(cell);
> +
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	if (len < 2 * sizeof(u16)) {
> +		dev_warn(dev, "invalid calibration data length\n");

And? Is it fatal error or not?

> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ret = mt->data->extract_efuse(mt, buf);
> +	if (ret) {
> +		dev_info(dev, "device not calibrated, using default values\n");
> +		mt->data->precalc(mt, 3698, 50, 0, 0);
> +		ret = 0;
> +	}

> +out:
> +	kfree(buf);
> +	return ret;

Why not use __free() from cleanup.h?

> +}

...

> +static int mtk_pmic_thermal_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_pmic_thermal *mt;
> +	int i, ret;
> +
> +	mt = devm_kzalloc(dev, sizeof(*mt), GFP_KERNEL);
> +	if (!mt)
> +		return -ENOMEM;
> +
> +	mt->regmap = dev_get_regmap(dev->parent->parent, NULL);
> +	if (!mt->regmap)
> +		return dev_err_probe(dev, -ENODEV, "failed to get regmap");
> +
> +	mt->dev = dev;
> +	mt->data = of_device_get_match_data(dev);

property.h instead of of.h and use just device_get_match_data().

> +	ret = mtk_pmic_thermal_get_calib_data(dev, mt);
> +	if (ret)
> +		return ret;

> +	for (i = 0; i < mt->data->num_sensors; i++) {

'i' is not used outside the loop:

	for (unsigned int i = 0; i < mt->data->num_sensors; i++) {

> +		struct mtk_pmic_sensor *sensor = &mt->sensors[i];
> +
> +		sensor->id = i;
> +		sensor->mt = mt;
> +
> +		sensor->adc_channel =
> +			devm_iio_channel_get(dev, mt->data->sensors[i]);
> +		if (IS_ERR(sensor->adc_channel))
> +			return dev_err_probe(dev, PTR_ERR(sensor->adc_channel),
> +					     "failed to get channel %s\n",
> +					     mt->data->sensors[i]);

> +		sensor->tzdev = devm_thermal_of_zone_register(
> +			dev, i, sensor, &mtk_pmic_thermal_ops);
> +		if (IS_ERR(sensor->tzdev))

> +			return dev_err_probe(
> +				dev, PTR_ERR(sensor->tzdev),

What a broken indentation in the whole stanza...

> +				"failed to register thermal zone %d\n", i);
> +	}

> +	return 0;
> +}

...

> +static const struct of_device_id mtk_pmic_thermal_of_match[] = {
> +	{ .compatible = "mediatek,mt6323-thermal",
> +	  .data = &mt6323_thermal_data },

> +	{ /* sentinel */ },

Nonsense trailing comma.

> +};

-- 
With Best Regards,
Andy Shevchenko



