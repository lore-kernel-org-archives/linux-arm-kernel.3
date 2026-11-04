Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517C1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cuHo9N1a;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBWzV8fO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rPktWRiI/JgjZXOK0VV9UihgCUHb9+RZLQKrRxQgIkQ=; b=cuHo9N1aslxzgd3IkA7QIOiDmV
	odSMdMmHkN1r/ahLzFCR6J36+V/vYAaV0KVUqdk9YFeh85mAq2DV8cWjDEKJ6jGg0FDqbBaAEu8Wq
	TRtrVVA+rAoaASMFpA5pPkjl3xluM/6ldC1cOocL0b+Ukz/uhFyxwyDDxteSfGZ8IqrI+xAm1jojc
	UUGQ8hjAtwnpOQ8O5xDpzOHAHWlo56eOtqhVr0TJocFmyrC0NYdxLJu/PrZhf1MkKd4TaWv8+ZSLk
	NrUEbaSA5tSUqycSb8bFTMGJxa3Etxf7lS6qEoAldmOMy6YwJNDIMZFrPWqT5Q35XgT0iqDjlTPgA
	yzjfi9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWdH-00000004kbi-2naX;
	Wed, 04 Nov 2026 08:46:11 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWdE-00000004kaR-2T7h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793781969; x=1825317969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyw4gM5AV8XJVm/D6q+MVFyu67HewixU8i9L8I15X1c=;
  b=cBWzV8fOmVJSc8RzRPBi2Au3XBKffPJNGMpRbqEUyT0md1CKV4e5RLnL
   ARLhHyTrqaBc1rVkP2lfyM7RVtfSOJc9kU2nuSpzN86rYrfXoWcSmhtYG
   hzELm3ro+eVAblYcBvgGOPFut9YZ9MfnX4hq+Gv5mekthg36Vwij2B1Em
   5FF0QIMMNUOB4P2kiZljbSuowq7HOxaRPN9H3rQUsjVAR8jx6xz93Oo11
   EZ+sgBcWVZDIrz9R25YAESu+M4WdXErrPdkvcQ1eEZOz74zVhGDHRpW4x
   C8g3M4rsvyYbisZbjgTLepoGXBTU57yaxRGmI6O0yn7hnvPf3woXhTao8
   Q==;
X-CSE-ConnectionGUID: FyVNVO2PQQCKRo349yYLow==
X-CSE-MsgGUID: PrYT3We+SgCWH89k6KNXSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2623320"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2623320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:46:08 -0800
X-CSE-ConnectionGUID: DY0+xHzSQB+42gN643B25Q==
X-CSE-MsgGUID: /SZ9wx83SOqE5CZm7dzfJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7219588"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:46:05 -0800
Date: Wed, 4 Nov 2026 10:46:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:PXA2xx/PXA3xx SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] spi: replace chan->device->dev with
 dmaengine_get_provider_device()
Message-ID: <aurwylnNpkKi_Bx-@ashevche-desk.local>
References: <20261103215824.1823272-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103215824.1823272-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004608_668868_640F47DD 
X-CRM114-Status: GOOD (  12.45  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 04:58:23PM -0500, Frank.Li@oss.nxp.com wrote:

> Use the dmaengine_get_provider_device() API instead of directly
> accessing chan->device->dev to get the DMA provider device.
> 
> No functional change. Prepare make to struct dma_device private to the DMA
> engine.

...

>  	struct dw_dma_slave *s = param;
>  
> -	if (s->dma_dev != chan->device->dev)
> +	if (s->dma_dev != dmaengine_get_provider_device(chan))
>  		return false;

It's obvious that we need another helper to match.

// void * and EXPORT to be able to use as filter function
bool dmaengine_match_provider_device(struct dma_chan *chan, void *dma_dev)
{
	return dmaengine_get_provider_device(chan) == dma_dev;
}
EXPORT_SYMBOL_GPL(dmaengine_match_provider_device);

...

>  static bool pxa2xx_spi_idma_filter(struct dma_chan *chan, void *param)
>  {
> -	return param == chan->device->dev;
> +	return param == dmaengine_get_provider_device(chan);
>  }

With that being done this function is gone.

-- 
With Best Regards,
Andy Shevchenko



