Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749D9CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMGrTHc19P4j44Fotni27VvsNwpNQXxVAR6ywnGSzS0=; b=JtcjiR3xizV1hgorrb/Z/QoGFB
	ft6hw12po9aR9RzsXR9qhjuQLrpk4xnofjPPQ7Tijd4gwoEwlT86kD8C/moh1HCy1VU5xwQA3JWZd
	V57QNEl1PNjsKY+AIYAmmqcM5INtyUcVk5rdf77OWahKKD5RtiqFIPZ3/DGegT4Tvp8j0KWTz0Zb0
	5Lba3PY8AeDhgIf9yrhB1jNU3RLK4lSc3w+mOqsavlmUuqpot5JrDfSPBFR/6hw1D/u/faExiXfYB
	BplxiZRJFXrEc19VoqxO6ypgAeKXiVmRX/YsE3fB3AdFYYT6dVRjAY3CKpAyAwShT2T3ffjUb/GBB
	y2KFoJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVOj-0000000BcGX-04sG;
	Mon, 24 Nov 2025 12:10:25 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVOd-0000000BcFM-3ax0;
	Mon, 24 Nov 2025 12:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986219; x=1795522219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=d5nNg3j4GXG9OHJ73JYH0c5+/jyYRN1qHBQffAJxf+Q=;
  b=GWMyEFDmDGJOoiu74hFfOqISzYEv++rZiImgk8EjolmE+6GVcX3SsIQw
   ywkJSgGS9piXqHVNQ93a222upUBeXAIIa4svGBrhIyx80g8tHzZzJjTJL
   Nyt6ks1bSTE1UPq6xVZcoJLCMlnRd6pl+UGg0Urn38f+TGytdxWzv1rBI
   WSrlMt9FErdcS7OtCwjKN5h7ZO1GyjMWADrh1X5zDz26UmKyRg7xUvKyR
   E+bjfgOT+sZuBY3W2LLPnh9LmGtwAtOrQr22D6I4p7nem3g7YcD53+5uu
   Co2BxwY+KTAtkFhaHNb8u34cv47Zrf5FRLnDS+wY3iCS2x9o0uqG9evEJ
   A==;
X-CSE-ConnectionGUID: gzBEpWnLQTi082dg8J1DsA==
X-CSE-MsgGUID: 9n+5KO71Q1aFQ/dvdSoT4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="64984411"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="64984411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:10:16 -0800
X-CSE-ConnectionGUID: kCgZIcdZRl+BizAz96HPnQ==
X-CSE-MsgGUID: ATl7n97tSL2Horct6YF6tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191986359"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:10:11 -0800
Date: Mon, 24 Nov 2025 14:10:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 07/13] dmaengine: lgm: use sg_nents_for_dma() helper
Message-ID: <aSRLIY4KmhAxePq1@smile.fi.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
 <20251110103805.3562136-8-andriy.shevchenko@linux.intel.com>
 <aSGCJQc152Y9V10E@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSGCJQc152Y9V10E@vaman>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041021_629906_29CCA542 
X-CRM114-Status: GOOD (  10.12  )
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

On Sat, Nov 22, 2025 at 02:58:05PM +0530, Vinod Koul wrote:
> On 10-11-25, 11:23, Andy Shevchenko wrote:
> > Instead of open coded variant let's use recently introduced helper.

...

> > +	num = sg_nents_for_dma(sgl, sg_len, DMA_MAX_SIZE);
> 
> drivers/dma/lgm/lgm-dma.c:1176:37: error: ‘sg_len’ undeclared (first use in this function); did you mean ‘sglen’?
>          num = sg_nents_for_dma(sgl, sg_len, DMA_MAX_SIZE);
> 
> I am getting the build failure, as well as few unused warning with this,
> pls fix

Indeed, sorry for that, in v4 should be fixed.
Thanks!

-- 
With Best Regards,
Andy Shevchenko



