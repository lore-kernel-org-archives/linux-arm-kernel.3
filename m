Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3A606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l1bg0s7U;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XrDManDK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SM+ZxwXvkDJiP/IazHDrslWlgbwPpcEIJLtAEnj1Euw=; b=l1bg0s7USrp64ODOiPf9QzXCFS
	eoFAc69wNigLhjnN4GJvaZqTzjvI6SfEeAzuOTj7lS8cJPdJNHpVmA6rqJc0m4ADaklH3zXPEf6pu
	wJafIuSGoWKvp9ks4doJf0w+AOqo8+NHnjq17jqe7x9NLJLfwNeek6TOYVusfy759BRiFDYLF1ssM
	GiOnVRN59bM25iO4o2JC8RZNKTqpDeYRGczSmToKGomFEx1e2hTydrRO+33JYkdhlcKraingp+JD1
	qnUgNgAVglEpEMgDdNLvLf3cwM8dm636Z0DKsrxJkYOJuPAkgzdxghUHqn5qjOFZFitp//WYk/79D
	NwZ/5zJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCqH-00000002E8e-05o5;
	Tue, 03 Nov 2026 11:38:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCqE-00000002E7v-3Jqb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793705894; x=1825241894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=S8pdZwb2Y+CAAH6NyB1ZqP4ocDmydfr0MY9PK+DwCbE=;
  b=XrDManDKoQrrooE0z2X7MosrX6WI+vA6qACq6IMhC77Se1uitptQvpaC
   pguq9o0O5KD7tij2/+kel8AI4iarwuB1EZQo3qAJgI92R8WfvWXGoNQed
   iOmbNduFPPX+lJ1e/WEu6ktHpszybCoq1YofhbTOFtTH1kiLrsIj53mFy
   Q0KUL//a7j2r9OHRgDuzM1XCh2MIHVNj+F80Ox/3surT1NSRXmivvskFC
   73cNtGzGqHe+NvRi/AJbEZGnBpBqG+YfH3ruHVoljLbFP5TDdMnGToS6L
   qIWPwJHRtdSj78cMKTGXskF3YLHZ2VuU0brU/I8WcDuJ6RLinm+9flW35
   w==;
X-CSE-ConnectionGUID: 2hmLanoDSfiDQRyCBxYZ1Q==
X-CSE-MsgGUID: 2DUog3kqSte9ZXM1MF3zCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2317217"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2317217"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:38:14 -0800
X-CSE-ConnectionGUID: Wxh6HDosTJaT+CYyJsuZ8g==
X-CSE-MsgGUID: pIfaqHVkSvWewBwafQxGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6735611"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:38:11 -0800
Date: Tue, 3 Nov 2026 13:38:09 +0200
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
Subject: Re: [PATCH 04/11] pinctrl: scmi: report an off setting as not set
Message-ID: <aunHoe9PfumHp0Gh@ashevche-desk.local>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-4-52d92843ad97@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_033814_866530_7DC3AB67 
X-CRM114-Status: GOOD (  12.05  )
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

On Fri, Oct 30, 2026 at 04:58:35PM +0100, Clément Le Goffic wrote:
> A get of a setting that is on or off, the flags and the pulls, returned
> 0 as a value, so every one of them showed as set on every pin. Return
> -EINVAL when the platform answers 0, which is how pinconf reports a
> setting that is not active.

...

> +static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
> +					    u32 *value)

I would dare to keep it on a single line.

> +{
> +	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
> +		return -EINVAL;
> +
> +	if (param == PIN_CONFIG_DRIVE_STRENGTH)
> +		*value /= MILLI;

> +	return 0;
>  }

-- 
With Best Regards,
Andy Shevchenko



