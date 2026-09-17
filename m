Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D50AC982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZdzYuoRw6DbXN5E4S4nDMgmkP2f/zl7+uZt8lI0X1c=; b=l8w/KTLpFFy19tlmF1tgFPOc5b
	gFAnqGUGurJUQP+N6CSAaHy8irazwXK6MXymfqgUpZgyp1WuQB0r6v3mpuwjyoPAQW2auhJHYvsLk
	3SEbXfWnqE+J0E8qyH2SQv8pXqJ1hgk2ycM1Bt4puelpV1AjXJornieRkw0DPqcauTK+8nGefR40K
	sc82P+FqFq4gPDqAQVTPwAuMy/WKpWSOUAi3uT0rPZX3iCqe2eeXgQ1bvNLlKHe3GYDTB0HFKUUtT
	5GUB97enSfnv19tPeVw9o551KSnR96M377p9XisRkVgQHzGkyVx9hGBnSaC4O665QuYaL9GaWalkI
	ni4/YJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BFM-0000000BIFW-1ZBc;
	Thu, 17 Sep 2026 12:29:48 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BFJ-0000000BIF1-2hYY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789648185; x=1821184185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Oqvk+Keh5+Ql737zReVMLDiTiT8AwvzkKVkDAtra2Vo=;
  b=n4DN//Di4HTMPFWZIlIHMcH4Bp8WIfKE+EudWrRLkgIALOmB1IgS1pmX
   VFJyKjnPY3kgkOY1pjEOIPGP+nB+YinMlCwyXXpFiF13blhopLbEaKUxr
   byT5qg9TqNVrHe/+uKfZPcaxymIQIfT+Ud46g2S+nQ/tSDV+aMAZv7GoN
   DHJ6ewTLW8UKup6x8jnF3h4jqMasHSTE7ri1S7ekfyPeJ7gVpON04kyQG
   GbfQ45iyBg8CincMtzp2e3LLS+SoBRjjLCVhrbAtg56eBntteSDsO9eLQ
   iBdMWMepBYT14VhZBODHTAaBqCINaf4bthHxVH1Y4X2SsgtAWoX97S62B
   w==;
X-CSE-ConnectionGUID: zEBBaCSGR32Rp/j6npnb8g==
X-CSE-MsgGUID: rK7GJhQ8Q+65CHk4DOqG1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92573766"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92573766"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:29:41 -0700
X-CSE-ConnectionGUID: q7wUCXPPQLuH38dTRGvSJw==
X-CSE-MsgGUID: 7wRmEb1xSZiTIN0GvTGGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270071211"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:29:36 -0700
Date: Thu, 17 Sep 2026 15:29:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <aqvdLr-VEUMAHese@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
 <aqlYOHIFU_dB72I3@SMW015318>
 <aqlb5iZQ07Xicq0m@ashevche-desk.local>
 <aqvF1aOtAiDrC_MW@nsa>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqvF1aOtAiDrC_MW@nsa>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052945_699313_64E14C3E 
X-CRM114-Status: GOOD (  29.51  )
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

On Thu, Sep 17, 2026 at 11:54:00AM +0100, Nuno Sá wrote:
> On Tue, Sep 15, 2026 at 05:53:26PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 15, 2026 at 09:37:44AM -0500, Frank Li wrote:
> > > On Tue, Sep 15, 2026 at 10:29:03AM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 14, 2026 at 09:18:42AM -0500, Frank Li wrote:
> > > > > On Fri, Sep 11, 2026 at 06:25:36PM +0100, Nuno Sá wrote:

...

> > > > > >  include/linux/dmaengine.h        | 20 +++-----------------
> > > > >
> > > > > I think it is good to split dmengine consumer and provider header files to
> > > > > hidden dmaengine's detail.
> > > >
> > > > It's indeed desirable change. but isn't it a bit out of scope of the series?
> > > > I suggest to do one step at a time. Would it work for you?
> > > 
> > > Yes, but I hope the file name is finial expected file name. it is okay
> > > just move enum dma_slave_buswidth to there now.
> > 
> > Hmm... The whole split as is in this series is due to bitmap.h and the whole
> > train wreck with headers we have. I haven't checked that particular enum, but
> > if it's possible to gather it in one of provider.h/consumer.h at the end, then
> > yes, we may name file accordingly from day 1.
> 
> Yeah, as I said to Frank that enum is used by both providers and
> consumers so leaving it in types.h makes sense to me. I also realized
> that the current series is relying on widthmask.h (or dmaengine.h to include
> types.h - for the enum). Might be acceptable (and needed for legacy code
> just including dmaengine.h) but I wonder if we should not explicitly include
> types.h for new (or converted) code.

I would take IIO example, id est guarantee engine/types.h to be included by
the headers that need it (by the end users). but it's still fine to include
explicitly in the DMA engine core.

> > > > > suggest name
> > > > > 	dma/engine.h
> > > > >
> > > > > so we can start move more API to this files.
> > > > >
> > > > > after all user include this consumer header file,  old
> > > > > include/linux/dmaengine.h rename to include/linux/dmaengine-provider.h,
> > > > > which only include by dmaengine drivers.
> > > >
> > > > Traditional naming would be
> > > > dma/engine/provider.h
> > > > dma/engine/consumer.h

-- 
With Best Regards,
Andy Shevchenko



