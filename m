Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE36C6075DCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 20:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z2ZSx6dn;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OEO9ypB0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1jWPBK680B87Pwa40LJBUzBrzbRi+IENeD01muXYKMs=; b=Z2ZSx6dniXEYlneI+8dyiCXCpG
	vrvpFGYFwP1YXweskqNh4ftW3/8SD8Pt/bWVla7pBd9ao/ezkRMmCNDJK6GL/W+m6HNYD+6eWC80K
	v7utOoHSMzIGFQ2k4YGAP4ygWyi7LuL0TcnUIYbpqq9ix8xxr+ryQDGJF7H9ZDE8qMk8QxB+kah3u
	+Kc/a47Gw1Zz0tit6T5mN2OvwMEyITsr4oA/f81E700NrRofkCTBLJFgyNlfAjwxNMk2sU/0l65dz
	cwsewbUs+x1gvp2D3yhnONGTPsulpoPUzAYzekUTvy0NlTszI2vni8ZR0lvZvrDiSj4OpvFHIdTEZ
	AR5X6t/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhkA-00000006uke-2ch1;
	Wed, 04 Nov 2026 20:38:02 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhk8-00000006uj8-05nA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 20:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793824680; x=1825360680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6MX9XH/QnJ8xvT9Bkrl0MdVDxms69I0ydfDn2qNE8rI=;
  b=OEO9ypB0eU+dN4vByffxHJtK4KZtIsoLCYl+Ga1WMsSD55Na7WigKzMJ
   +h2wDi2n9OUUgPQMjz5MiSCDOZPgGtq+trt430ahfBKRQi+xcOQ4w/tyj
   xRPBdooix8BgaDNtrpdMJ/jB+kuydfpltE1EKe+jxnfG0Tg8z+7fFrlzN
   BbR5OnmN2XfP/bywX40C2KDVFrsNs3zVZoniFBYRYRfIheHGj2nbvuiG8
   SoCW9hS7UFYz0TPjxXegsg0eSXBtRzACFY8Xxq+QCFamQXZCKmNeVV0/K
   mfV9/j1gRztNNMMdjLf/xNWpGEoQ5JAIiRzUVZI7mPCctElhboJEIhpZ6
   w==;
X-CSE-ConnectionGUID: 5hEUaCpXR9+cVWx6Ux9UAw==
X-CSE-MsgGUID: DPxNtKHiS7W/NUosVagQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2634718"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2634718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:37:59 -0800
X-CSE-ConnectionGUID: 5O+tnyHnSOKwltP88zBZRg==
X-CSE-MsgGUID: QweoI2egTtKb4djJtQGSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7213141"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:37:52 -0800
Date: Wed, 4 Nov 2026 22:37:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vignesh R <vigneshr@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linusw@kernel.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: Convert to subsys_platform_driver()
Message-ID: <auuXnndiQOkEaOsj@ashevche-desk.local>
References: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
 <93534aaf-00f3-45f4-982e-7fd44ab3799c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93534aaf-00f3-45f4-982e-7fd44ab3799c@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_123800_075091_29B1D70E 
X-CRM114-Status: GOOD (  18.74  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 06:38:40PM +0100, Krzysztof Kozlowski wrote:
> On 04/11/2026 12:33, Peng Fan (OSS) wrote:
> > 
> > Replace the open-coded subsys_initcall()/module_exit() platform driver
> > registration with subsys_platform_driver().
> > 
> > No functional change.

...

> > -subsys_initcall(i2c_adap_pxa_init);
> > -module_exit(i2c_adap_pxa_exit);
> > +subsys_platform_driver(i2c_pxa_driver);
> > diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> > index 15e14a6fe6dc..dd1f6f854a32 100644
> > --- a/drivers/i2c/busses/i2c-s3c2410.c
> > +++ b/drivers/i2c/busses/i2c-s3c2410.c
> > @@ -1188,18 +1188,7 @@ static struct platform_driver s3c24xx_i2c_driver = {
> >  		.of_match_table = of_match_ptr(s3c24xx_i2c_match),
> >  	},
> >  };
> > -
> > -static int __init i2c_adap_s3c_init(void)
> > -{
> > -	return platform_driver_register(&s3c24xx_i2c_driver);
> > -}
> > -subsys_initcall(i2c_adap_s3c_init);
> > -
> > -static void __exit i2c_adap_s3c_exit(void)
> > -{
> > -	platform_driver_unregister(&s3c24xx_i2c_driver);
> > -}
> > -module_exit(i2c_adap_s3c_exit);
> > +subsys_platform_driver(s3c24xx_i2c_driver);
> 
> Apparently reviewing only a few lines out of 300 is still reviewing:
> 
> https://lore.kernel.org/all/9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org/
> 
> Therefore:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

In the similar way

  Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # s3c24xx

(Note, I specifically put double space in front to make this as an example and not overwrite your tags)

And to others, the problem with partial reviews are lying on the side of the
sender as it's not reviewer's fault that unrelated things are going in a bundle
and not in the proper per-driver series (where each of the driver may have
distinct maintainer).

-- 
With Best Regards,
Andy Shevchenko



