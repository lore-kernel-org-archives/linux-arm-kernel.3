Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XxF+dbsu;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TrITuCri
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6ZOljdu8PCNHDLPQ7ccqFPbKaSthLFzVQZs1PlArnbM=; b=XxF+dbsujF8M6vutkhpaAuLZI8
	mm8KtRDYw4CNxymoWh6wlfKBBant2mBni+4wxYc+tTncxkOdx1x2CLptCaKvWHMOPkTewpX1vxaOF
	U3UrPKAntnWZdp4UFA0A7D5unye9v3Kb35D+g1pSqZ6BOse8WGd+DiHbEqhsM8g7X7k35YPJsxPt3
	i8mZdDNvStzyrB+zXX8mfOXPLFiiAzwPhkvcgDnGP0X09g4Q1TtgQMhl8AjB8l25Fbc/6ziFvru0+
	v8oFiOzfV8FempdajTeV14X8FQ4GFbiyx1/7fMMhooLkjUVrKKjqtJB1F76ghQ5zogrXhWNPb4aKP
	uU/VNFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjEY-0000000BHoj-3PmI;
	Fri, 30 Oct 2026 09:49:14 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjEV-0000000BHo5-3eSI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 09:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793353752; x=1824889752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOyskiLXbaCfkBWt175bxZvK8XJFZ16jsOxbYDqe0W0=;
  b=TrITuCri8Z4em6Yfjs/hGtMYuPbcHOanDY6b/EVqLWy+pa+KaLRKezbs
   X6cBy3tZCd8LHbd13jljTUiEOUzhrhkYCTVXUHr6cdt8+f1bfSc1Nb9NZ
   y8pncm3xBIm32NKuESlfDaQzDVxU8ry1/Tt3s7wGUTxFX2R3eyNsX9D0l
   Ss7WVXO0zV69KodQ4rrq0ixowWrBE2NWsF6LncJ3f2XEU3/8Zy4xfzWNE
   kbwf+tJOpZ1C4dH+CnDpyrMwfIU5xigUwCul8uNB8c9kRy+xPQkgarB8i
   9T9hMd6wW2AXUtWJVI1n/n2kizt/kftPNdz/uNeqBUzFW7vMHnq0z7O3Y
   g==;
X-CSE-ConnectionGUID: 46Yf+VrVSvWb/JFrlV7nwA==
X-CSE-MsgGUID: R2N4r5jeQ4aJIDWEY6lUIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2144614"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144614"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:49:10 -0700
X-CSE-ConnectionGUID: MM6DeHpZRfq954A8xK+Xlw==
X-CSE-MsgGUID: +7g8jGl5TraXtiM2AUHwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5733794"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:49:05 -0700
Date: Fri, 30 Oct 2026 11:49:02 +0200
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
	patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] mfd: cgbc: Allow compile testing
Message-ID: <auRoDuFUMLsjgIvo@ashevche-desk.local>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_024911_918515_93A544D9 
X-CRM114-Status: UNSURE (   7.68  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:11:39AM +0100, Krzysztof Kozlowski wrote:
> cgbc-core.c driver does not use any X86-specific headers, so looks like
> it can be build tested everywhere for increased build coverage.

Yep, good one.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



