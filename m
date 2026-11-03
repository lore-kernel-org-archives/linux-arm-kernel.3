Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12153606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MMm/xkxh;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mKtc8SeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9rRrksSImQxjgaCoOlcavqaTwPlSKHx5ylc9VpIQuFM=; b=MMm/xkxh4XReVJg5+Ir7f2si+z
	hd9CZLOMmvKTE52arrTyBcg3wB6r/AA7CNYualoFUs91Rn8I2bYoTg8t4rvo/KuXOlsxVbCf7IOpX
	MIGitGXDBgnmsQxUyo11JR0pcLGpWUPMlT44+wKCAkUBzAemCXAU1B6RLErSF0tFkLS5Xx4+QfjwD
	JEsvGuLXR30jhkXXlcPfL+wMQeDjQ95wMhNI7YnZKGMBwAAaeMhXhpXAtHKiEWszD50dlYT2VsSzu
	6DyxWwnUg2ky5t5Ajzs7PVYudltMtf4kWZmz5vwHMgulAFXjSUlR1HZ+ZBkgnQckETEqgd3CQQxHG
	RZ7/zy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCtH-00000002EsX-0Vu6;
	Tue, 03 Nov 2026 11:41:23 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCt9-00000002EqX-30Ls
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793706076; x=1825242076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IeFn5a9AdmVeg5IHSIJsjnU24bAycCXoaf0T4GZLG24=;
  b=mKtc8SeN1kckuZ657maHu/eJWVsvvJfX1FhxKlJfGLhkjZLbIfyah4r1
   FPWUzBt9mAStqZsXJrduLbvFEbH+xgvKo/aecDCfUUEdSnMN0bsHlVgaR
   NXGPLTHMoGuhtjcF5kgr5aOX6ke3r6iNHGtv3WZxAPEjr53cftgWUJTve
   KG6cxBJ8FJd/mStJYyawAIc1kpvG4hlgiSPo0aSCCbVsb0Ba2ymxF8mX1
   jVPTkronchPr4rO7HXtDCRSnwJbeeb08EvjdLWTBJShwp5zPDEiV/qfLt
   xi7EoFE/zIBSGu2mMlCoAG+6YlPeTzgUE/3XENjWRELVvrlDzfiX2R+uI
   Q==;
X-CSE-ConnectionGUID: jXzs//uJTuaT74m0PYJRjQ==
X-CSE-MsgGUID: BMfpPkpcSGisnXu4CazfUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2303565"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2303565"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:41:15 -0800
X-CSE-ConnectionGUID: DnQ4jqYmSHq02PTVWlnnGg==
X-CSE-MsgGUID: QMBqbzCZR0yjZh8s7mqmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6308191"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:41:11 -0800
Date: Tue, 3 Nov 2026 13:41:09 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
Message-ID: <aunIVW4JeM_P2WOa@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_034115_810037_F9F0AB2D 
X-CRM114-Status: GOOD (  15.64  )
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

On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> On a GPIO request, select the GPIO function of the pin, on the pin for a
> pin-only function or on its single-pin group. Without a GPIO function the
> mux is left as it is.

...

> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
> +{
> +	const unsigned int *elems, *pins;
> +	unsigned int nr_elems, nr_pins, i;
> +	bool pin_only, gpio;
> +	int nr_functions, func, ret;
> +
> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);

Is nr_functions signed for a purpose? Can it hold an error code?

> +	for (func = 0; func < nr_functions; func++) {

	for (int func = 0; func < nr_functions; func++) {

> +		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
> +						      &gpio);
> +		if (ret)
> +			return ret;
> +
> +		if (!gpio)
> +			continue;
> +
> +		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
> +						       &elems);
> +		if (ret)
> +			return ret;

> +		for (i = 0; i < nr_elems; i++) {

		for (unsigned int i = 0; i < nr_elems; i++) {

> +			if (pin_only) {
> +				if (elems[i] != pin)
> +					continue;
> +
> +				return pinctrl_ops->pin_mux_set(pmx->ph, func,
> +								pin);
> +			}
> +
> +			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
> +							  &pins, &nr_pins);
> +			if (ret)
> +				return ret;
> +
> +			if (nr_pins == 1 && pins[0] == pin)
> +				return pinctrl_ops->mux_set(pmx->ph, func,
> +							    elems[i]);
> +		}
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



