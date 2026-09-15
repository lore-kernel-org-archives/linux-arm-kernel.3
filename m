Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A66FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EGAl6b0EwN37tb5Zeny4n4o+LJB8lMs0+wzi90ecpg=; b=gbwJsvRtmeO7W+s438uWsQvIvp
	WYTud0Q9oGqALJ39nLQ++QZVmp4EgZdaBBBDXORY2C4ceM6iQCXo8mHzzOal/HzOlVfoAcOcwphjf
	SnOtvueqYFImiJDtKuTMCL+xlN17eGz18sKDDKP469wE6A5dlEmGkXqq92jUifIym/tucSDDuyLLR
	5F4joDu+a+m2JVd2bLmQW9VLDFezCkba7Udo4B1zvysVUGShJv3PKU2sPa29muL13P2eCw7lmmtGY
	m7DKA3y6/ev6XYEPotSMm0Pcw6AN+J5VBNobLeTAUUgCPfeihydQQ7XtX8hp8/kgm5cdS81emEzgf
	DuwQa52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NeK-00000005TdK-0Rh9;
	Tue, 15 Sep 2026 07:32:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NeI-00000005Tct-1QNQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8EGAl6b0EwN37tb5Zeny4n4o+LJB8lMs0+wzi90ecpg=; b=SWgQJ8eY1cj4hXhbLlHCBA/ejX
	xWcgfGZK5NEeRYPd7kBTVt2+4cznu3m2j7Bp1Jd7yDlAhguITEmNDUoRlEIJR9MoosCEylU/fnCiK
	Mzw6ObXd1ZARTsNT3H/3LQs9JCW4atDMaS8bAWpKvp8GWJ+cV+bviVSmAd5vtADvUCkGPmB9TswGN
	ywVf0ulDSc+GvYpOf5Pe1S//2qX+XaApRR7cdHdZ7ruZyu7PdSy5TaVEzcDXxdMN0+VFuhTEZMlns
	D+xiD9J8iTUZgUWCHZL9pgehaWaA9RpcXTm9Ob2814RfEvrZw1lHoflx88D5fBvHsRAOm+kKr2utC
	ougrKyTQ==;
Received: from mgamail.intel.com ([198.175.65.13])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NeE-00000006NFC-3UoS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789457531; x=1820993531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hu4d0MW3Bf04FU74NUpVLNtB72nLl1SrcA3Swz/HQ8A=;
  b=Egpa4nd6Fw0itZ4MNZv3+Cdy8oAWl/LiLFj+3Wsvgt+3DUaEmVbZxugu
   2IIVawsNhT6H/xl/eKurlKWpJjgiyaB+uO4a6QDBX5+O+APgq1FeS+9xL
   Fi3+VWL8ZoIlJcpWTyZ4pTKBZJW36LVDUSXjSfwmD3g9IiaCCIFPZSCQA
   T+qEcQjisjVpVb9nThs4MgBtfOEvENr6/VeztSn4eyFWK7Ux4rD72QvmS
   PgxMiyF86iXgFYG8Lxug8tamILL9JEmKhMqg2ac8vezgV0s5iCcC+hASB
   ltz56+Lw6A/gK5eUOPcXOD/E/amtXZLg+EYaiXr6TOTqbNd5exk0VaZ50
   g==;
X-CSE-ConnectionGUID: VF0OPDAxTxu+xz0xMPIOFQ==
X-CSE-MsgGUID: 9J8LmSULQo2dSXgGeoNWDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100967380"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100967380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:32:02 -0700
X-CSE-ConnectionGUID: gcNLgQiYRZKOETkK+/DZpA==
X-CSE-MsgGUID: rfWMtsATQle5Hq81vExF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269199181"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:31:57 -0700
Date: Tue, 15 Sep 2026 10:31:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 08/10] ALSA: pcm_dmaengine: Use dma_slave_caps bus
 width helpers
Message-ID: <aqj0a2ttFTXdgGx5@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-8-72b8fd4cc78e@analog.com>
 <aqesWfdIsiR31sql@ashevche-desk.local>
 <aqgUo4-r0-TIKZLl@nsa>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqgUo4-r0-TIKZLl@nsa>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083211_394418_B2AF639C 
X-CRM114-Status: GOOD (  19.35  )
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

On Mon, Sep 14, 2026 at 04:39:38PM +0100, Nuno Sá wrote:
> On Mon, Sep 14, 2026 at 11:12:09AM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 11, 2026 at 06:25:43PM +0100, Nuno Sá wrote:

...

> > > int snd_dmaengine_pcm_refine_runtime_hwparams(
> > >  	struct snd_pcm_hardware *hw,
> > >  	struct dma_chan *chan)
> > >  {
> > > +	enum dma_slave_buswidth default_widths[] = {
> > > +		DMA_SLAVE_BUSWIDTH_1_BYTE,
> > > +		DMA_SLAVE_BUSWIDTH_2_BYTES,
> > > +		DMA_SLAVE_BUSWIDTH_4_BYTES,
> > > +	};
> > >  	struct dma_slave_caps dma_caps;
> > > -	u32 addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
> > > -			  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
> > > -			  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
> > 
> > > +	dma_buswidth_mask_t bus_widths = {};
> > 
> > Do you really need the zeroing?
> 
> I think so. dma_bus_width_set_many() just does __set_bit() under the
> hood so if we do not zero initialize I think we could be left with some
> random bits in the mask. Unless I'm missing something.

Hmm... Since it's a recipient, I would expect it will be filled correctly
independently on the garbage it might have had initially. So, perhaps call a
bitmap_zero() with the maximum size in there?

> > >  	snd_pcm_format_t i;
> > >  	int ret = 0;
> > 
> > >  	if (!hw || !chan || !dma_data)
> > >  		return -EINVAL;
> > >  
> > > +	ret = dma_bus_width_set_many(bus_widths, default_widths,
> > > +				     ARRAY_SIZE(default_widths));
> > > +	if (ret)
> > > +		return ret;
> > 
> > I assume that if ret == 0, bus_widths should be set accordingly.

As mentioned here, if no error, bus_widths should be fine to use.)

-- 
With Best Regards,
Andy Shevchenko



