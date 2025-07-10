Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148A9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqsAZLGhFuNxn7FEmeaLa9mYFTex/7gLFWe6hyGIPKg=; b=GCF2+PS1X/tmX4ozPVGITAOLuT
	y7mAue43jmbfgQ8Q9ItBI+ht5C0MIOVJpqiH5y1suSss5oqCqmZST+kJaScdwNdf/bPqGs0fV5yzo
	8S6iqQ3Jhh4a8RouqmBzxneRjJaMidxoOpFRLxvE85GwxYzxN1ek9hHOrW8bkO4G0kEWK6w3v4y9A
	j9e/UxZ3WEVgxYgbZiPs5j6NE0KBeLN3aLSQBjW/o5CjejXVvLsHFq24Kyqe1yQTShu29vCA9C9z/
	ATDIWqOB4GCABbxae8aVbKt1sgk/q4UOnF7Rm3oSNEUi38rMPnH2xH8E70NXUW1rKt9c6Q9eCRZd8
	0SjQy60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpkj-0000000BfgA-2J0d;
	Thu, 10 Jul 2025 11:48:01 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoRf-0000000BTKi-1p08
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 10:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rqsAZLGhFuNxn7FEmeaLa9mYFTex/7gLFWe6hyGIPKg=; b=jKqujF+X2Dw/rtWVGBaKfu3a2c
	0sZYm8fqmDUF6PRcNTVEg03N2Vx4GSBjyRPAWFsnXEDmJII6K3P74CTupU8W/43I2XYARDDOwW6es
	0mOvatHxA/RNFPNe41Y/dN8ftUx+fYtI2bEoLljz/iDnQUURpNmpWxdxHFbbIl10Pg8zc4qpookFQ
	pQZwrjo3P5+pXBiJsoRy0ezcVjkMMR1z+N0auJNcNh8iH7WkVSYkMfk0/BkP8eCQzYye2I1hd5h15
	r+XU0k+eHVek857nvRAydXiEGHsPbYq6R8VlX+RL2KSGTRjneHabEVVlZa+Kzo9d4SkOesfbSATgH
	PH0q47Yw==;
Received: from [89.212.21.243] (port=48522 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uZoRc-006kdW-1b;
	Thu, 10 Jul 2025 12:24:00 +0200
Message-ID: <42dd658e-555a-43f7-a7bf-e5365d508f4a@norik.com>
Date: Thu, 10 Jul 2025 12:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: imx93: Make calibration parameters
 configurable
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de, andrej.picej@norik.com
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
 <20250710073905.1105417-3-primoz.fiser@norik.com>
 <aG-GZqhABwErcEyM@smile.fi.intel.com>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <aG-GZqhABwErcEyM@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_032403_939676_61ED7A0F 
X-CRM114-Status: GOOD (  15.04  )
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

Hi Andy,

On 10. 07. 25 11:22, Andy Shevchenko wrote:
> On Thu, Jul 10, 2025 at 09:39:04AM +0200, Primoz Fiser wrote:
>>
>> Make i.MX93 ADC calibration parameters:
>>  - AVGEN: Enable calibration averaging function,
>>  - NRSMPL: Select number of calibration samples,
>>  - TSAMP: Select sample time of calibration conversions,
>>
>> in the MCR register configurable with the corresponding device-tree
>> properties:
>>  - nxp,calib-avg-en,
>>  - nxp,calib-nr-samples and
>>  - nxp,calib-t-sample.
> 
> ...
> 
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/regulator/consumer.h>
>> +#include <linux/property.h>
> 
> Keep it in order.

OK. Will fix for v2.

> 
> ...
> 
>> +	ret = device_property_read_u32(adc->dev, "nxp,calib-avg-en", &val);
>> +	if (!ret) {
>> +		if (val != 0 && val != 1) {
>> +			dev_err(adc->dev, "invalid nxp,calib-avg-en: %d\n", val);
>> +			return -EINVAL;
>> +		}
>> +		reg = val;
>> +		mcr &= ~IMX93_ADC_MCR_AVGEN_MASK;
>> +		mcr |= FIELD_PREP(IMX93_ADC_MCR_AVGEN_MASK, reg);
>> +	}
> 
> Please, since it's optional, do other way around.
> 
> 	val = $DEFAUTL;
> 	device_property_read_u32(adc->dev, "nxp,calib-avg-en", &val);
> 	FIELD_MODIFY(...)
> 
> Similar approach may be used for the other properties.

OK, I guess I could implement it like you suggested to explicitly set
the default parameter values.

But in current implementation MCR values are read at the beginning of
imx93_adc_calibration(), meaning calibration parameters are register POR
defaults. With you suggestion, we put defaults in software rather than
reading them from the hw directly.

> 
> ...
> 
>> +	/* write calibration settings to MCR */
>> +	writel(mcr, adc->regs + IMX93_ADC_MCR);
> 
> Please, factor out this to the function, so we won't see the direct IO in the
> ->probe().

Sorry I don't understand this part.

What do you mean by factoring out this writel()?

Do you perhaps suggest to implement function
imx93_adc_configure_calibration() and put all our changes into it?

But we are already in imx93_adc_calibration() which is separate from
probe().

Please explain.

BR,
Primoz


