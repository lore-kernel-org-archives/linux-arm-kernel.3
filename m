Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ob3kjUDP;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eCHwA28K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bnsrfRvGRM2qgoxDq8KtlUhs37rsslMeY4OUYqDf+Pc=; b=ob3kjUDPnvtyVRGqcVwr7Q3XAT
	Ahg2/Z0gSIY932rJb0I/PUfF8/aE8cP5C9DnHDzNyGruU2AyH3fR1ILAvTcWSdJKve0CkzTOeMXS2
	FiRhPYcO0SfDDPcIkOYRZxCpt/hOa2t35enNe/MmOfibvo4AMgHVLIf6bfKlosOJMuoWzH6Kgb8sq
	ZY28kEKLLXWNcR9u6V2KRHLvpxfYicc1KL06ykHkfNBWP0aY4ifffk+uAD0DhqNh+OPVm5rehKkLp
	UUrPTuUPoDnzIeVl+7eyFYm/heuvrOXrkGlr11HfqIXqRN4/apEf9fBWKRYSLTNglnRRWavzOOb8A
	/3CiGfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAED-0000000DPAV-33Ne;
	Sat, 31 Oct 2026 14:38:42 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAEB-0000000DPAA-0SXq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 14:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793457519; x=1824993519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mOGtJbZAYHQiSqbGrp4D+HVhIDhcTQHgl9gip1W8AZU=;
  b=eCHwA28KBVQ4aYfx1utjch5WltZXMTb/KQU+gcY/0wzQ+UkGjm0EEGue
   rTm27FtZK3R+TmxPFlZhGyftKV1Qi1vFjSR6U/r9Xh/Zo5gLrdhDpa/pq
   BayyCC7aeCfl0sFRGw4zSPXQ4O51o3iO+LyldZwWJJPL2e0G8GuT7sE42
   Me13Ug1IJ657MDqKHv1uwOEnq2X1NYVvPyGj2oNkCs2bZGBF0g7ewZCwa
   mC0uXmwzHAorRKxUwUUiMuygAkoy3J3N/sPCNK+q4czKkTz6g+DpFGcE8
   dAveJfjVchPwkvUE9zQD3y1Ib2XK/r8s99r5T/h06iAByl8gu15p4qwO6
   g==;
X-CSE-ConnectionGUID: V5x7RttcSbmoKn4i7LUQAg==
X-CSE-MsgGUID: SbMsVyyBR6aPABvAmEIRcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2308902"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2308902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 07:38:35 -0700
X-CSE-ConnectionGUID: EO4jmSpvTPKIPl3mo+BHxw==
X-CSE-MsgGUID: VGkjYBofTQioetwaJ3ILPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5759414"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 07:38:30 -0700
Date: Sat, 31 Oct 2026 16:38:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Message-ID: <auX9Yz0txOxbFSSf@ashevche-desk.local>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_073839_213871_14B008D0 
X-CRM114-Status: GOOD (  17.16  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 03:02:41PM +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

...

>  drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
>  drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
>  drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
>  drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---

> --- a/drivers/mfd/intel_soc_pmic_bxtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
> @@ -245,7 +245,7 @@ static const struct resource tmu_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(BXTWC_TMU_IRQ, "TMU"),
>  };
>  
> -static struct mfd_cell bxt_wc_dev[] = {
> +static const struct mfd_cell bxt_wc_dev[] = {
>  	{
>  		.name = "bxt_wcove_thermal",
>  		.num_resources = ARRAY_SIZE(thermal_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> index 6daf33e07ea0..8412a25d37ff 100644
> --- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> +++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> @@ -53,7 +53,7 @@ static const struct resource battery_resources[] = {
>  	DEFINE_RES_IRQ(CHTDC_TI_CCEOCAL),
>  };
>  
> -static struct mfd_cell chtdc_ti_dev[] = {
> +static const struct mfd_cell chtdc_ti_dev[] = {
>  	{
>  		.name = "chtdc_ti_pwrbtn",
>  		.num_resources = ARRAY_SIZE(power_button_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
> index aa71a7d83fcd..f27985a58c87 100644
> --- a/drivers/mfd/intel_soc_pmic_chtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_chtwc.c
> @@ -50,7 +50,7 @@ static const struct resource cht_wc_ext_charger_resources[] = {
>  	DEFINE_RES_IRQ(CHT_WC_EXT_CHGR_IRQ),
>  };
>  
> -static struct mfd_cell cht_wc_dev[] = {
> +static const struct mfd_cell cht_wc_dev[] = {
>  	{
>  		.name = "cht_wcove_pwrsrc",
>  		.num_resources = ARRAY_SIZE(cht_wc_pwrsrc_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
> index 627a89334908..ce4c9ef59198 100644
> --- a/drivers/mfd/intel_soc_pmic_crc.c
> +++ b/drivers/mfd/intel_soc_pmic_crc.c
> @@ -54,7 +54,7 @@ static const struct resource gpio_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(CRYSTAL_COVE_IRQ_GPIO, "GPIO"),
>  };
>  
> -static struct mfd_cell crystal_cove_byt_dev[] = {
> +static const struct mfd_cell crystal_cove_byt_dev[] = {
>  	{
>  		.name = "crystal_cove_pwrsrc",
>  		.num_resources = ARRAY_SIZE(pwrsrc_resources),
> @@ -93,7 +93,7 @@ static struct mfd_cell crystal_cove_byt_dev[] = {
>  	},
>  };
>  
> -static struct mfd_cell crystal_cove_cht_dev[] = {
> +static const struct mfd_cell crystal_cove_cht_dev[] = {
>  	{
>  		.name = "crystal_cove_gpio",
>  		.num_resources = ARRAY_SIZE(gpio_resources),
> @@ -142,7 +142,7 @@ static struct pwm_lookup crc_pwm_lookup[] = {
>  
>  struct crystal_cove_config {
>  	unsigned long irq_flags;
> -	struct mfd_cell *cell_dev;
> +	const struct mfd_cell *cell_dev;
>  	int n_cell_devs;
>  	const struct regmap_config *regmap_config;
>  	const struct regmap_irq_chip *irq_chip;

I haven't compiled, but I checked the code in the actual drivers and my reading
confirms that these structures may need to be marked with const qualifier.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com> # Intel SoC PMIC drivers

-- 
With Best Regards,
Andy Shevchenko



