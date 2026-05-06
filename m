Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEA7CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulyP7ADu2BSwXDSuFyyD2l6/0HJtlIJFL1sFzeCyW14=; b=qWGbtlcqUNJW48ShdnwloiRDKF
	Rh0F/f8PFwy0wYiG+lVMHqn13VWWBmVyL2sxVb4KSrT4M8JL70eHgrMrc+o3qhXu3DliZIYGCxNr7
	gk7pbP0dYZvR54POWs5Ly7TY4MpIs/x8kVH/MDjQyPwAGzo2e96d5v9Vn7BYX4xEQffM5VSaXsT4r
	pjGf3s4BGmy65ko3oy/WKnxM9M8cA53DCvHjCd71G6YJqGTWKyYVcfqHvf1fVn+p8/+yLa2zxL4WV
	wAVswKJN3fuiHimE6xPIJqUw+rnJ/+1q/Vqq21yk2I6nmkiKDp8JKqRZ7Bs5bsdqQgcDGDvBZR43+
	CR1X9eFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcGg-00000000tOU-2X2c;
	Wed, 06 May 2026 13:26:26 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcGf-00000000tNg-0JOd;
	Wed, 06 May 2026 13:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778073985; x=1809609985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xaKcmCC+I9v/E09bRdoBMaTkVzosR8rUiWNrEUV6lAg=;
  b=a8I6/ZHQDWGZQ0Z1fIGrADIXKkSAR/wfx28ZD6ffkFqL45cIUB4p1x5N
   CDdIxvpj6rS3ZP0g3nrKLmppBeeMPMUsIW/xe4rIcwEKIlKpp2bmgymP7
   bVpQctR2qdwsLIZo4CgMwYBln/qqLHzeaqjTgtCpqjMli1oNRLz4TFGCg
   qCUw0H4f5VRYTzgvL9SgytnwNn2GnqdTk3tzb9OVohUt/wtfUFxFu+FCM
   k3hvMqklEG+zip+fIY5MHUgyDyvXD/KbrSDiu2Vdflq3Ljc5urhhKCFuy
   7xSSZZeYkqBxSPWkSzFcY6Ct9UVdgTV4vVllXJuvTGSkc2aLHWWkkAmId
   A==;
X-CSE-ConnectionGUID: XfhOVfx0TB2w/MdFvIzcWw==
X-CSE-MsgGUID: TS/ydS+LQoKSo5sBiW/2PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89312835"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="89312835"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:26:23 -0700
X-CSE-ConnectionGUID: 1H3000o9TMadDzDQXXLY9Q==
X-CSE-MsgGUID: tL+QbN0HRuqstpiz/lB/YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="235306952"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:26:19 -0700
Date: Wed, 6 May 2026 16:26:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
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
Message-ID: <aftBeFbVIap59FFS@ashevche-desk.local>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
 <20260504-mt6323-v1-6-799b58b355ff@protonmail.com>
 <afmnUG8dG0N0HpV6@ashevche-desk.local>
 <cgsML96DsJh_Ow9XsSnyrZ3NhlCnNj1rKegzYNR3eQzkWoF5xQB5-aU6Zi7pKcT8GfUnO3B-D71je60APUtorB7p_A3GtUCp2oer3KYLn6k=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cgsML96DsJh_Ow9XsSnyrZ3NhlCnNj1rKegzYNR3eQzkWoF5xQB5-aU6Zi7pKcT8GfUnO3B-D71je60APUtorB7p_A3GtUCp2oer3KYLn6k=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_062625_257318_6BE39B28 
X-CRM114-Status: GOOD (  19.04  )
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

On Wed, May 06, 2026 at 11:22:15AM +0000, Roman Vivchar wrote:
> On Tuesday, May 5th, 2026 at 11:16 AM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Mon, May 04, 2026 at 09:24:58PM +0300, Roman Vivchar via B4 Relay wrote:

...

> > > +struct mtk_pmic_sensor {
> > > +	struct mtk_pmic_thermal *mt;
> > > +	int id;
> > > +	struct iio_channel *adc_channel;
> > > +	struct thermal_zone_device *tzdev;
> > > +};
> > 
> > Can you confirm with `pahole` that this is the best layout (taking into account
> > the use in the below data structure)?
> > 
> > > +struct mtk_pmic_thermal {
> > > +	struct device *dev;
> > > +	struct regmap *regmap;
> > > +	struct mtk_pmic_sensor sensors[MAX_SENSORS];
> > > +
> > > +	s32 t_slope1;
> > > +	s32 t_slope2;
> > > +	s32 t_intercept;
> > > +
> > > +	const struct mtk_thermal_data *data;
> > > +};
> 
> On the ARMv7 it shouldn't be an issue, because pointer size equals to
> the s32 or int. However, I've reordered the fields to group pointers
> and integers together.
> 
> struct mtk_pmic_sensor {
> 	struct mtk_pmic_thermal *  mt;                   /*     0     4 */
> 	struct iio_channel *       adc_channel;          /*     4     4 */
> 	struct thermal_zone_device * tzdev;              /*     8     4 */
> 	int                        id;                   /*    12     4 */
> 
> 	/* size: 16, cachelines: 1, members: 4 */
> 	/* last cacheline: 16 bytes */
> };
> 
> struct mtk_pmic_thermal {
> 	struct device *            dev;                  /*     0     4 */
> 	struct regmap *            regmap;               /*     4     4 */
> 	const struct mtk_thermal_data  * data;           /*     8     4 */
> 	s32                        t_slope1;             /*    12     4 */
> 	s32                        t_slope2;             /*    16     4 */
> 	s32                        t_intercept;          /*    20     4 */
> 	struct mtk_pmic_sensor     sensors[1];           /*    24    16 */
> 
> 	/* size: 40, cachelines: 1, members: 7 */
> 	/* last cacheline: 40 bytes */
> };
> 
> The compiler will still add some padding on the AArch64 though.
> 
> struct mtk_pmic_sensor {
> 	struct mtk_pmic_thermal *  mt;                   /*     0     8 */
> 	struct iio_channel *       adc_channel;          /*     8     8 */
> 	struct thermal_zone_device * tzdev;              /*    16     8 */
> 	int                        id;                   /*    24     4 */
> 
> 	/* size: 32, cachelines: 1, members: 4 */
> 	/* padding: 4 */
> 	/* last cacheline: 32 bytes */
> };
> 
> struct mtk_pmic_thermal {
> 	struct device *            dev;                  /*     0     8 */
> 	struct regmap *            regmap;               /*     8     8 */
> 	const struct mtk_thermal_data  * data;           /*    16     8 */
> 	s32                        t_slope1;             /*    24     4 */
> 	s32                        t_slope2;             /*    28     4 */
> 	s32                        t_intercept;          /*    32     4 */
> 
> 	/* XXX 4 bytes hole, try to pack */

^^^^

> 	struct mtk_pmic_sensor     sensors[1];           /*    40    32 */
> 
> 	/* size: 72, cachelines: 2, members: 7 */
> 	/* sum members: 68, holes: 1, sum holes: 4 */
> 	/* last cacheline: 8 bytes */
> };
> 
> Is this good enough?

In the last it seems moving the s32 members to be the last will removes
the 4-byte hole.


-- 
With Best Regards,
Andy Shevchenko



