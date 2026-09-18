Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3115EC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evwplLMAwECJHF4vfadONOqwuoBW61zgQ3sC3t0YxQ4=; b=Pa38JsMvUk56xJnsswcmvordGT
	zjtgvBRzArKVgxFVjdhntNRL99tSNhl4NG48klIuIXpkRr9asjG4AsxKNxwCLKtvwvAZ9D9cqVOqO
	nc6BXNI9gVW7qn9d2WTORznLh0AM1geuf1vm+0iWhaJlNDp3sGM1mGoXg1OC2/QF8Sm1RUiHs4/cp
	1o2hDPnfpN/qrk3bvnIImyQmT5J0AGSeBBTKMSOxEoayQwDn3sx3vaOHcXurc8c+b49u82widiSil
	rcFxXDKYf1muUF2KRDX13u4Zx7XievyKiJwT83cLDC+LIksyz+3jSlWFc/zRAay9SdpF/K2Gqp0Qi
	hN525Nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cw8-0000000FFTo-3mEa;
	Fri, 18 Sep 2026 18:03:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cw6-0000000FFTD-3pjN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:03:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D763602CC;
	Fri, 18 Sep 2026 18:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17371F00899;
	Fri, 18 Sep 2026 18:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754625;
	bh=evwplLMAwECJHF4vfadONOqwuoBW61zgQ3sC3t0YxQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQLy7IwmxHP4CwtCsFQsvtDqbpQbBbAk0FLYki7k7EbL3aWpZGlnagumVxIM536Vq
	 RjPF/73Ebw3mUrdYbjrNyix3YbHb2bq/3ChoXdTn7IsanIfYNOaDWpHcreNjakUTQ5
	 7tckYUtx157FJpGEt4MUEKBsvnpuHrhdurTHYCu8+BujAIWPnCJDh8nRj98y+mjfUf
	 6oydL4rnRtCqn+bUtqZLkJW5zTQzYech/8ZyKuMWjd+K2ulYM0mgfUr3LP8xF88zzq
	 nvnYG7g1lITZntkHHw/UdKfiivbOpXFh1IOdwf2iUwtLI0ga++xF2/9bPjV9hfyOTS
	 sxIu2swoofe/A==
Date: Fri, 18 Sep 2026 23:33:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
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
Message-ID: <aq18_TMNs4EJzgZO@parshuram>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
 <aqlpoBJJXfZgsMxT@parshuram>
 <aqlwRkNcs_UqKjWs@parshuram>
 <aql6u3T0nnSVr-FC@SMW015318>
 <aqws8pN2rfS9-dCC@parshuram>
 <aqz1-OzFobOROuBw@nsa>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqz1-OzFobOROuBw@nsa>
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

On 18-09-26, 09:39, Nuno Sá wrote:
> On Thu, Sep 17, 2026 at 11:39:54PM +0530, Vinod Koul wrote:
> > On 15-09-26, 12:04, Frank Li wrote:
> > > On Tue, Sep 15, 2026 at 09:50:22PM +0530, Vinod Koul wrote:
> > > > On 15-09-26, 21:22, Vinod Koul wrote:
> > 
> > > > > > Traditional naming would be
> > > > > > dma/engine/provider.h
> > > > > > dma/engine/consumer.h
> > > > >
> > > > > consumer and provider and good names.. I would retain the full dmaengine
> > > > > everywhere please. dma causes confusion already!
> > > >
> > > > Thinking about it again, drivers/dma/dmaengine.h should be the provider
> > > 
> > > There some dmaengine code outside drivers/dma directory, like
> > > drivers/crypto/ccp/ccp-dmaengine.c
> > 
> > They chose to be outside, their choice... They need to be updated as
> > well to point to ../../dma/dmaengine.h :-)
> 
> I tend to agree with Andy but anyways. I feel this is going a bit out of
> scope now. So what we have now in the series is:
> 
> 
> - include/linux/dmaengine.h (without enum dma_slave_buswidth)
> - include/linux/dma/types.h (with enum dma_slave_buswidth and new
>   dma_buswidth_t type) - A future one would be dma_cap_mask_t and we could
>   drop bitmap.h from dmaengine.h
> - include/linux/dma/widthmask.h - The new bitmap based API for bus_width
> 
> I kind like the separation (and the whole point was to avoid bitmap.h in
> the main dmaengine.h API) but tbh I'm not sure if a consumer driver
> will ever use dma/widthmask.h without needing the consumer API. But
> to sum things up, what do you suggest for vÛE?
> 
> * include/linux/dmaengine.h as the consumer API and includes the new
> the widthmask API
> * provider/private goes to drivers/dma/dmaengine.h and just includes
> include/linux/dmaengine.h as the starting point?
> 
> Let me know how do you want things for v5

Yes lets talk about dma_slave_buswidth, it is client type. This is
configured by users to set the width of peripheral.
So this needs to be in the include/linux/dmaengine.h

-- 
~Vinod

