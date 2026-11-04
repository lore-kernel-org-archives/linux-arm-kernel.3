Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XO/Uvt/7;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRDm9njm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q5EB9sWYexwM66oISVKEoWC7PirZef6I7jp1wtU1bZY=; b=XO/Uvt/7g4WJAHScqYBALH2YTZ
	7PJL6nTFSE5npfNUzdl7YemsQ/6NU5N05vszehFsmeSRdcXAwQU9wEDK124dM/t1a6FEl0c8bNw6o
	uQ+79FoMHzdxh8lImuz5MpDxwO6BzKQh+TjAIyToReAdQVr6BxdUUhXowYAL8U2rsU9nqIYNp36/g
	mXMppBM90+xRl5omnW99ATEPD1e2Fyoqr+HqE8tKYrpRryFeNTRm1FjefExDwp/tVf0CevwTieaLL
	HQ9bbxqcCyh0ALrx0qg+CDf5PND1Nk0FRQX/P7p9v7mqNacrxURndfuzsj1MPxRmi+Syzn8mcjp/9
	6LzW4vtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYeO-00000005434-00ka;
	Wed, 04 Nov 2026 10:55:28 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYeK-0000000542V-2QxY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793789725; x=1825325725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=y7denP/ndQ8Np+vR3riInyTK3v1TSZ+KMP6Au27fEBY=;
  b=XRDm9njmFroZ61SVF1nlOUeKh3uEV5B1OyDYXcZ4QXz58ovOxYzILuNI
   jGI84kSg9ghiXz+gZhZodf55+fm6Y12cRBA/GIjvcYYDAmu01lldWyW59
   swvWKmUVCDrcsfrV9hKJuXSLh/6HYA83cFk9cn73/k8k9BDe1+Syj4dGe
   hr3H9s/Us4zfzGKOb2NgfG1YSJ0xgdmLTfRdxvavu/Jg1Pq06S7MV7Bi4
   tj+9Wzh4y1hyLJmegpNd/hN1UBF3AQgW5zZMiGM6joVdmAkseZ7laKlPV
   b/ufpnfHd1VCVtyI9zTVTs8NrBfwBc9JWnYmL5VPGWVJ/Ku6Z3I/Lw2Pe
   A==;
X-CSE-ConnectionGUID: jRklB1i7Tx2O7cqR8L02Uw==
X-CSE-MsgGUID: fL/As/0IS3mEgtFTHbTPAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2415182"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2415182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:55:23 -0800
X-CSE-ConnectionGUID: BZVaxyjYQFOtcDxMqSdGUQ==
X-CSE-MsgGUID: nR8KF5bSSo65a20nMZftCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6845480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:55:19 -0800
Date: Wed, 4 Nov 2026 12:55:17 +0200
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
Message-ID: <ausPFWOj-usp084X@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
 <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_025524_728076_A20EC83D 
X-CRM114-Status: GOOD (  11.82  )
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

On Wed, Nov 04, 2026 at 10:38:11AM +0100, Clément Le Goffic wrote:
> On 11/3/26 12:41 PM, Andy Shevchenko wrote:
> > On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:

...

> >> +	int nr_functions, func, ret;
> >> +
> >> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> > 
> > Is nr_functions signed for a purpose? Can it hold an error code?
> 
> No indeed, will fix in v2.

> >> +	for (func = 0; func < nr_functions; func++) {
> > 
> > 	for (int func = 0; func < nr_functions; func++) {

With the above in mind, the type of func has to be adjusted accordingly.

-- 
With Best Regards,
Andy Shevchenko



