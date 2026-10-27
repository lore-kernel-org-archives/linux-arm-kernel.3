Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D78606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z+CVSFxF;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E99MNzy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l+oxUfMJg5eV+CJD17FHu7pJx+SYawZ0ncZOWsVGuog=; b=z+CVSFxF2SpbChSGQx4Rd6Z3qG
	J+wp/AVZjSPbkQCWl2QVRlhOfYRQII/LgVu4NENKbMm/Nl+3uEa5SlyY0Yc4+ov4yoQ88enR1Te+d
	0W+FzEPguFnY3Ks22e4VcAIDS8ngpFQMvXJlLyRJNpr2cU55YY1jfzyVH/poDts74P0h2WIXhJ66R
	KDO0xg1mkdrmGi/X9aKHSOEjibR/y64v0ZbbP8qiDmRAqbk6hkqpAal4MBQ7ibrp/ApWZk4tDeyj8
	2mLS0EAJAnaKi+217edqa4bInGngo9iulzXMYWiwe3RwhOdMPUorcOvC1+m+LuNbQx8hltv4zrFDT
	EekZ12XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk9i-00000005Nnp-3u0W;
	Tue, 27 Oct 2026 16:36:10 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk9h-00000005NnK-1YGw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793118970; x=1824654970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0npx0Foow+/UEvoNo/yJRWIrCYEDXYV8oP9hRaaHqlQ=;
  b=E99MNzy8Sub3bjggOPOOel1xizdcvO/T1tx09KRQxqcBw9B31F+z/d2/
   rIRLJiOiUEXoY9lZR3KkMtxmyYzn69VChdebcjc1U1GRp6/R9bmAnJvpH
   1yZdqmlFwU/7KBPjepDVvuYLwQOXERgt4pY2YtZWvyYf0kmQJjtO5kUeJ
   L2lqm8DbfpiJUiabgz3l14fQgItZxNiYpgMYGzT4B0EUgNL9Jo3H0DTcP
   51hqZ7jI8qZWsKSvz+rz4+U+E6NPBDByDE8SGeWUhuG9b+k0T3zTldFXc
   7ktF+iyOJY9KKhNRm8AJB/Q31sXYsPRWsXXnCZzjeTeL+IIMQfdqhjKtV
   Q==;
X-CSE-ConnectionGUID: Cfry46niQzSCijLTtJAFFA==
X-CSE-MsgGUID: IiLySQuOSmGio3nktm+n9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1701225"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1701225"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:36:09 -0700
X-CSE-ConnectionGUID: VoqCGL52RIG83ecyOWnq+g==
X-CSE-MsgGUID: WN7IMjxQSviqS3YmeY8qTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6461608"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:36:04 -0700
Date: Tue, 27 Oct 2026 18:36:01 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare
 'unsigned'
Message-ID: <auDS8cXSmKjW3sfJ@ashevche-desk.local>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_093609_457978_46853C1C 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 08:09:30PM +0800, Peng Fan (OSS) wrote:
> 
> The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
> Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



