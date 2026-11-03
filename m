Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033AD606C5EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wJrivshm;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fUgFd3BU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZHaluVN4QVG6zZ01mYkAS1E2kQ0Rb60RdvEd/xq8+1s=; b=wJrivshmpQtV+VoAIdPmvBKpDO
	LD2a6aplMVAER2adu/LXBhTKeFs6kE9VcSkjkilwb+2xgqvajBsGb0CF6+dgUXlLmiL6Tb828Tc5Z
	auYmsa1GpktDkCYXMnWs3Jx+NTwGplnIDXAS6Z6nh2WlCWlJ4PrYsqCrAJrwDSSFxBxx0uYeWUVGd
	JlG2qtgiXZDFlhW8qYrRpzH8vjYaJXgUnx6riABb4WK7fCSht2Y8EpItM1s6G3Lan13VIpSJBUGZZ
	Ney3p0Rti70hHGsamryqgtHJwJ9rzGdtpfrHoEUaNIv6x20ZlfM2WFc+/c669uLceD4+TFuXmBL1a
	tcueQmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCFa-000000027Pc-3vUe;
	Tue, 03 Nov 2026 11:00:22 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCFX-000000027Mo-20FO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703620; x=1825239620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A48PNQFXuCWaAUzwsonKXEuzgeRg37aflgFlNnBvsgY=;
  b=fUgFd3BUWplT3n4FZm1ip2TgRk/hmlylWrOQ9Fh5Sz/2K3mS8AsTEhAA
   ddOjgnwB1x/mgW3zbmIrKoyiqpPXG9ekTCCr8Dofiz9oyDEV4dyq8Ymhw
   dvksHjEf28b9Fh/IeCynA3D+pAECs98C/1YETZl7Ds3T1YJIOVE6OvoJM
   0PHsNazXXys+vCjeBhciYTjz0Qr9PMK4L71Hp3DfMrYSdRyrxYgOCwyZ1
   BZyxhuDe578hABeMmPEqmDXvixjkQBqtWR3jIgKWuFOT2bTPx7DXlGJuP
   1t+N8uyd4n6wcC37g5zpQU+rI29LwgEGioPvcf690PDE7yKtzldiaEOTT
   A==;
X-CSE-ConnectionGUID: +/LESSEPSBChFCXzQDCpfg==
X-CSE-MsgGUID: E6s5mI3OQMSW50yMX9zHeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2301517"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2301517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:00:19 -0800
X-CSE-ConnectionGUID: aQt+PnvgRQqhUUS7EoIt/A==
X-CSE-MsgGUID: ba8yQ2UHSCKJc0G0pnuv0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6238759"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:00:16 -0800
Date: Tue, 3 Nov 2026 13:00:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v3 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Message-ID: <aum-vUx5oFSocGc1@ashevche-desk.local>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-3-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030031501.130290-3-cwweng.linux@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_030019_578657_08109C00 
X-CRM114-Status: GOOD (  32.78  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:15:01AM +0800, Chi-Wen Weng wrote:

> Add an IIO driver for the Enhanced Analog-to-Digital Converter (EADC)
> found on Nuvoton MA35D1 SoCs.
> 
> The driver supports direct conversion and externally triggered buffered
> capture using sample module 0. Both single-ended inputs and the four
> fixed differential input pairs are supported.
> 
> Use the internal 1.6 V reference when no external reference supply is
> provided, and report the reference voltage through the IIO scale
> interface.
> 
> Use ADINT0 for conversion completion. Configure the interrupt source
> and end-of-conversion position explicitly, and recover from conversion
> timeouts by resetting the EADC control circuits, synchronizing the IRQ
> and clearing stale conversion state before another conversion is
> started.
> 
> Reset the EADC control circuits during hardware initialization and
> sanitize interrupt, compare and sample-module trigger configuration so
> the driver does not depend on state left by firmware when the external
> reset control is unavailable.
> 
> Provide firmware-node channel translation so DT IIO consumers select
> channels by the logical channel index described by the channel node's
> reg property rather than by the position of the channel in the driver's
> channel array.
> 
> Add clock, optional reset and system sleep handling, and restore the
> controller configuration after resume.

...

> +static const struct regmap_config ma35d1_adc_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = MA35D1_EADC_REFADJCTL,

> +	.cache_type = REGCACHE_NONE,

This has to be justified. If it's indeed necessary, explain in the comment
above why cache is disabled.

> +};

...

> +static int ma35d1_adc_reset_control(struct ma35d1_adc *adc)
> +{
> +	struct regmap *map = adc->regmap;
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_set_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_EADCRST);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_read_poll_timeout(map, MA35D1_EADC_CTL, val,
> +					!(val & MA35D1_EADC_CTL_EADCRST),
> +					1, USEC_PER_MSEC);

Use numbers with multipliers, id est 1 * USEC_PER_MSEC.

> +}

...

> +	/* Drain an interrupt which may already have been latched by the GIC. */
> +	synchronize_irq(adc->irq);
> +
> +	err = regmap_write(map, MA35D1_EADC_STATUS2,
> +			   MA35D1_EADC_STATUS2_ADIF0);

It's perfectly a single line precisely with 80 characters in it.

> +	if (!ret)
> +		ret = err;
> +
> +	reinit_completion(&adc->completion);

...

> +static irqreturn_t ma35d1_adc_isr(int irq, void *data)
> +{
> +	struct iio_dev *indio_dev = data;
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	unsigned int status;
> +	int ret;

> +	ret = regmap_read(adc->regmap, MA35D1_EADC_STATUS2, &status);
> +	if (ret || !(status & MA35D1_EADC_STATUS2_ADIF0))
> +		return IRQ_NONE;

Split this to two conditions, it will be better to maintain in a long term.

> +	regmap_write(adc->regmap, MA35D1_EADC_STATUS2,
> +		     MA35D1_EADC_STATUS2_ADIF0);

Use local variable and make this a single line.
Btw, no return check here because...?

> +	complete(&adc->completion);
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int ma35d1_adc_read_raw(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       int *val, int *val2, long mask)
> +{
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	u16 raw;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +
> +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> +			return -EBUSY;
> +
> +		guard(mutex)(&adc->lock);

+ blank line. Make guard()() to be visible in the code at a glance.

> +		if (adc->suspended)
> +			return -EBUSY;
> +
> +		ret = ma35d1_adc_read_conversion(adc, chan, &raw);
> +		if (ret)
> +			return ret;
> +
> +		if (chan->differential)
> +			*val = ma35d1_adc_sign_extend(raw);
> +		else
> +			*val = raw & MA35D1_EADC_DAT_RESULT_12BIT;
> +
> +		return IIO_VAL_INT;
> +	}
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = adc->vref_mV;
> +		/* Differential mode has a VREF / 2048 LSB; single-ended uses /4096. */
> +		*val2 = chan->differential ? 11 : 12;

Perhaps make two definitions? 11 already second time appears in the code.

> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +}

...

> +static int ma35d1_adc_update_scan_mode(struct iio_dev *indio_dev,
> +				       const unsigned long *scan_mask)
> +{
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	const struct iio_chan_spec *scan_chan = NULL;
> +	unsigned long bit;
> +
> +	for_each_set_bit(bit, scan_mask, iio_get_masklength(indio_dev)) {
> +		const struct iio_chan_spec *chan = &indio_dev->channels[bit];

IIRC we have a for_each macro for this.

> +
> +		if (chan->type == IIO_TIMESTAMP)
> +			continue;
> +
> +		if (chan->type != IIO_VOLTAGE || scan_chan)
> +			return -EINVAL;
> +
> +		scan_chan = chan;
> +	}
> +
> +	if (!scan_chan)
> +		return -EINVAL;
> +
> +	adc->scan_chan = scan_chan;
> +
> +	return 0;
> +}

...

> +static int ma35d1_adc_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +
> +	guard(mutex)(&adc->lock);
> +
> +	if (adc->suspended)
> +		return -EBUSY;
> +
> +	return adc->scan_chan ? 0 : -EINVAL;

Unroll to if return; return. As it's done just in above function.

> +}

...

> +static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf = p;
> +	struct iio_dev *indio_dev = pf->indio_dev;
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);
> +	IIO_DECLARE_BUFFER_WITH_TS(u16, scan, 1) = { };
> +	u16 raw;
> +	int ret;
> +
> +	mutex_lock(&adc->lock);

Use guard()(). This might require to split the content into the helper
function.

> +	if (!adc->suspended && adc->scan_chan) {
> +		ret = ma35d1_adc_read_conversion(adc, adc->scan_chan, &raw);
> +		if (!ret) {
> +			scan[0] = raw & MA35D1_EADC_DAT_RESULT_12BIT;
> +			iio_push_to_buffers_with_ts(indio_dev, scan, sizeof(scan),
> +						    pf->timestamp);
> +		}
> +	}
> +
> +	mutex_unlock(&adc->lock);
> +
> +	iio_trigger_notify_done(indio_dev->trig);
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int ma35d1_adc_fwnode_xlate(struct iio_dev *indio_dev,
> +				   const struct fwnode_reference_args *iiospec)
> +{
> +	unsigned int i;

Not used outside the loop.

> +	if (iiospec->nargs != 1)
> +		return -EINVAL;
> +
> +	for (i = 0; i < indio_dev->num_channels; i++) {

	for (unsigned int i = 0; i < indio_dev->num_channels; i++) {


> +		const struct iio_chan_spec *chan = &indio_dev->channels[i];
> +
> +		if (chan->type == IIO_VOLTAGE &&
> +		    chan->channel == iiospec->args[0])
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}

...

> +static int ma35d1_adc_parse_channels(struct iio_dev *indio_dev,
> +				     struct device *dev)
> +{
> +	DECLARE_BITMAP(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
> +	struct iio_chan_spec *channels;
> +	unsigned int scan_index;
> +	int num_channels;
> +	int ret;
> +
> +	bitmap_zero(used_regs, MA35D1_EADC_MAX_EXT_CHANNELS);
> +
> +	num_channels = device_get_child_node_count(dev);
> +	if (!num_channels)
> +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
> +
> +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
> +		return dev_err_probe(dev, -EINVAL, "too many ADC channels\n");

-ENOSPC

> +
> +	channels = devm_kcalloc(dev, size_add(num_channels, 1),
> +				sizeof(*channels), GFP_KERNEL);
> +	if (!channels)
> +		return -ENOMEM;
> +
> +	scan_index = 0;
> +	device_for_each_child_node_scoped(dev, child) {
> +		bool differential;
> +		u32 reg;
> +		u32 vinp;
> +		u32 vinn;
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "missing channel reg property\n");
> +
> +		if (reg >= MA35D1_EADC_MAX_EXT_CHANNELS)
> +			return dev_err_probe(dev, -EINVAL,

-ENOSPC

> +					     "invalid ADC channel index %u\n", reg);
> +
> +		if (test_and_set_bit(reg, used_regs))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "duplicate ADC channel index %u\n", reg);

-EEXIST

> +		if (fwnode_property_present(child, "single-channel")) {
> +			ret = fwnode_property_read_u32(child, "single-channel",
> +						       &vinp);
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +						     "invalid single-channel for index %u\n",
> +						     reg);
> +
> +			if (vinp >= MA35D1_EADC_MAX_EXT_CHANNELS)
> +				return dev_err_probe(dev, -EINVAL,
> +						     "invalid ADC input %u\n", vinp);

-ECHRNG

> +			vinn = 0;
> +			differential = false;
> +		} else {
> +			if (reg >= 4)
> +				return dev_err_probe(dev, -EINVAL,

Ditto.

> +						     "invalid differential pair %u\n", reg);
> +
> +			vinp = reg;
> +			vinn = reg + 4;
> +			differential = true;
> +		}
> +
> +		ma35d1_adc_init_channel(&channels[scan_index], reg, vinp, vinn,
> +					scan_index, differential);
> +		scan_index++;
> +	}
> +
> +	channels[scan_index] = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
> +
> +	indio_dev->channels = channels;
> +	indio_dev->num_channels = scan_index + 1;
> +
> +	return 0;
> +}

...

> +static int ma35d1_adc_init_vref(struct ma35d1_adc *adc, struct device *dev)
> +{
> +	int ret;
> +
> +	adc->vref = devm_regulator_get_optional(dev, "vref");
> +	ret = PTR_ERR_OR_ZERO(adc->vref);
> +	if (ret == -ENODEV) {
> +		adc->vref = NULL;
> +		adc->vref_mV = MA35D1_EADC_INTERNAL_VREF_mV;
> +		return 0;
> +	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get VREF supply\n");
> +
> +	ret = regulator_enable(adc->vref);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable VREF supply\n");
> +
> +	ret = devm_add_action_or_reset(dev, ma35d1_adc_vref_disable, adc->vref);
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_get_voltage(adc->vref);
> +	if (ret <= 0)

Too many nested branches. Unroll it

> +		return dev_err_probe(dev, ret ?: -EINVAL,
> +				     "failed to get VREF voltage\n");

	if (ret < 0)
		return dev_err_probe(dev, ret, "failed to get VREF voltage\n");
	if (ret == 0)
		return dev_err_probe(dev, -EINVAL, "wrong VREF voltage\n");

> +	adc->vref_mV = ret / (MICRO / MILLI);
> +
> +	return 0;
> +}

...

> +static int ma35d1_adc_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct ma35d1_adc *adc = iio_priv(indio_dev);

	struct regmap *map = adc->regmap;

> +	int ret;
> +
> +	ret = iio_device_suspend_triggering(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&adc->lock);
> +
> +	ret = ma35d1_adc_disable_irq(adc);
> +	if (ret)
> +		goto resume_triggering;
> +
> +	synchronize_irq(adc->irq);
> +
> +	ret = regmap_clear_bits(adc->regmap, MA35D1_EADC_CTL,
> +				MA35D1_EADC_CTL_ADCEN);

	ret = regmap_clear_bits(map, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCEN);

> +	if (ret)
> +		goto resume_triggering;
> +
> +	adc->suspended = true;
> +	clk_disable_unprepare(adc->clk);
> +	mutex_unlock(&adc->lock);
> +
> +	return 0;
> +
> +resume_triggering:
> +	mutex_unlock(&adc->lock);
> +	iio_device_resume_triggering(indio_dev);
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko



