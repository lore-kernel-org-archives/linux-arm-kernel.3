Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F391C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QOJa+OyKJWzd4aZRb1BxyatkcKmdjh3f0d5oTO7t3w=; b=EXg+57weY2laTXi2eMUzho5qsb
	KAgb1UehMhafT8ooQ3Tmqx1mY4JN/UI82EL5xbGHtINV0WghAK6ryd0ZSPgFeHEYCnP8Lej/ZBNnA
	+QIURGTaWVbak6kHA8b+FOUqMp7e3ANrOjmtZgIw4BG5aTnYa8kqhvhJvdA7bS+LQEwj0vQBIxIaO
	ELcbhf8EbSqfXSQH+CEcfXMLDFL5Av+ZFYmZuY5WSj+BPPd4cwc89WwsaFFOPLIBJShyG4pPlWZxD
	47GSxgZ8fIs9aIardgch0WZr0hDagJ7GzawVy8eyRs80IMgL6tJ4U6BDQwjAU3X6EKAxnaqHhwyvU
	ozF8qbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NbP-00000005TGF-2RwI;
	Tue, 15 Sep 2026 07:29:15 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NbM-00000005TFa-45G6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789457353; x=1820993353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lblm+duqrIKOSpchtCRVtTa6szJIWB3TTaSd5w1skBE=;
  b=g9b3RUUStmHmGD0ATybemfTeI9EXELlGGeo4Xm/FMsHZGX5fn/EjC57H
   LXoEc6TGH5LpS8P1YWMUzWLF0CfQwss/w5WrMp2DwOX5LLq6+YMHlDRSP
   vHtZLOA+Aq4bCeyjfhjlixLlGWzYmOsg647PWYDJ7xJK6KfKLmG5jKLMZ
   m/FO2YMgmKG/eTQCMF+if0ZXPxBwYAangi2kLndfe4RwDn408Mr0Xm5fD
   u/faiVWXCqkNUtFn3bHpBiHcmqjDtVKvfH//B1S+y5a79yR6SLCRvFTXQ
   zBbdSpPgfV8ot/H0TVEIXCTh3IoBayPKKpeVTBOo+Ez4bQs+uFsMn7fFb
   A==;
X-CSE-ConnectionGUID: Up2YIxbYQQGDjd5CuOCKOA==
X-CSE-MsgGUID: vk5hls5VRNyWlgqHNE91bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88949061"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88949061"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:29:11 -0700
X-CSE-ConnectionGUID: PDk0ELz7ScSPdw85lzMxbA==
X-CSE-MsgGUID: 3YeBiet9Q3mnjwAAhfSuvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271061383"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:29:06 -0700
Date: Tue, 15 Sep 2026 10:29:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
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
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <aqjzvxI4ecoFvRLT@ashevche-desk.local>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqgCQvRw9fns__0d@SMW015318>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_002913_050095_435E8A80 
X-CRM114-Status: GOOD (  23.17  )
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

On Mon, Sep 14, 2026 at 09:18:42AM -0500, Frank Li wrote:
> On Fri, Sep 11, 2026 at 06:25:36PM +0100, Nuno Sá wrote:
> > In preparation for the bitmap based bus width capabilities, move
> > enum dma_slave_buswidth out of linux/dmaengine.h into a new
> > include/linux/dma/engine/types.h.
> >
> > linux/dmaengine.h is included nearly everywhere, so growing it with the
> > new interface would make every one of its users pay for it. Keeping the
> > basic types in a separate header lets the new interface live next to it
> > without that cost. linux/dmaengine.h includes the new header, so its
> > users are unaffected.
> >
> > While at it, add the missing kernel-doc for the enum members. The block
> > already opened with /**, so kernel-doc expected every member to be
> > described and warned about each one of them. Describe the UNDEFINED case
> > in particular, as its meaning depends on where the value is used.

...

> >  include/linux/dmaengine.h        | 20 +++-----------------
> 
> I think it is good to split dmengine consumer and provider header files to
> hidden dmaengine's detail.

It's indeed desirable change. but isn't it a bit out of scope of the series?
I suggest to do one step at a time. Would it work for you?

> suggest name
> 	dma/engine.h
> 
> so we can start move more API to this files.
> 
> after all user include this consumer header file,  old
> include/linux/dmaengine.h rename to include/linux/dmaengine-provider.h,
> which only include by dmaengine drivers.

Traditional naming would be
dma/engine/provider.h
dma/engine/consumer.h

-- 
With Best Regards,
Andy Shevchenko



