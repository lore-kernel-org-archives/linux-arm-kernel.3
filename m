Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BFA6074F99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s0K60Kk6;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flLLQg46
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qRsZY3xueLsYo81EeFYIjiC4t2ZfkCtOq22VvO5dYxA=; b=s0K60Kk6GdkFWyII8GB3tuVg6K
	9xEuy6bUohJdo5Rxm+Nw46+/hfIbtTLRm0dV0s2iSaNQXSEvc6PVubL7L+rLhuf9xxibX4QEdpxkP
	od1l8ICt/XMnWtoAhXd8nySMZoKSZ04LbQYVPV51etnRrjbLOwCA3ecL6Oiy/oM8nF1uD9PoDfOdD
	o9qwSOxQ0UJ5o7KxGWskEvhE+hAbFgqkWcGvd3IMpNe+6lobC7Di9UHJIhrPhadoxosyvby3nOUhr
	hCsMqlJ0QgN8K2+rUyyJOHHJ22rh1CXuXyyWzoRXMO+UfpNigSVqORwtYSJPTaGmOCHg8oMOUmhma
	Ifb6yLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhgr-00000006u7X-2Hui;
	Wed, 04 Nov 2026 20:34:37 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhgp-00000006u7D-1Sns
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 20:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793824475; x=1825360475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=StSSW5/xpW0MGVJqCQ72E4YsaavMQP4nt5umVauhYso=;
  b=flLLQg46O2M6J+ogWtr7H/PhnqpoImgqcs/izKeta51h0tYW8OYbtEg1
   w/vaj6rYDYoiaq7f7Jf8/+SawRJmBGjwOQiurRaKoIm6Et22V6bR7cqBK
   gPn7a5DvdCavOJ17ijfCvAZIqY7i14ORggAtOApCbo0krNLQo8hfA0RyL
   dDJCIDA/92Du1TY8czZhnyVBTPTCEG8CB7OpalKnSp+TPCDqHOzCnqyLU
   SGVux3/s/ghcmwUeVv8xV5Z3guv7k6YUzcdIIvmCzagkd2jHxYNeueI5D
   PlJz1ELxyATHZMRNuFGkUCJRp5HaduC0YMkrD2l1jhv0ShY1aJuJsk8ZN
   w==;
X-CSE-ConnectionGUID: g6jeEtvLQSmc9bXmLJpdHA==
X-CSE-MsgGUID: N/AWQb7OS2GvNM11C4X6eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2613580"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2613580"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:34:34 -0800
X-CSE-ConnectionGUID: rXnAXH6STZCbtlf11xATow==
X-CSE-MsgGUID: nn0XOPIDS0qODXMv7b+VxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7138628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:34:29 -0800
Date: Wed, 4 Nov 2026 22:34:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	T Pratham <t-pratham@ti.com>, Thorsten Blum <blum@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Pan Chuang <panchuang@vivo.com>,
	Maxime =?iso-8859-1?Q?M=E9r=E9?= <maxime.mere@foss.st.com>,
	"open list:CRYPTO API" <linux-crypto@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:QUALCOMM CRYPTO DRIVERS" <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] crypto: use dmaengine_desc_set_callback()
Message-ID: <auuW0safpswDmp13@ashevche-desk.local>
References: <20261102164538.3834039-1-Frank.Li@oss.nxp.com>
 <7b476c24-3185-49ff-9a72-fbd865dc0d65@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b476c24-3185-49ff-9a72-fbd865dc0d65@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_123435_397473_DEB75749 
X-CRM114-Status: GOOD (  13.89  )
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

On Wed, Nov 04, 2026 at 06:51:10PM +0100, Krzysztof Kozlowski wrote:
> On 02/11/2026 17:45, Frank.Li@oss.nxp.com wrote:

> > diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
> > index 84392411b98d8..49f1bf19747d8 100644
> > --- a/drivers/crypto/atmel-aes.c
> > +++ b/drivers/crypto/atmel-aes.c
> > @@ -824,8 +824,7 @@ static int atmel_aes_dma_transfer_start(struct atmel_aes_dev *dd,
> >  	if (!desc)
> >  		return -ENOMEM;
> >  
> > -	desc->callback = callback;
> > -	desc->callback_param = dd;
> > +	dmaengine_desc_set_callback(desc, callback, NULL, dd);
> >  	dmaengine_submit(desc);
> >  	dma_async_issue_pending(dma->chan);
> >  
> 
> Apparently reviewing only a few lines of entire patch is still reviewing:
> https://lore.kernel.org/all/9e39502a-dd17-4fa2-98a3-9019523cb5e8@kernel.org/
> 
> Therefore:
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Yep, in a form of

  Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-aes

or something that makes it clear what has been reviewed.

-- 
With Best Regards,
Andy Shevchenko



