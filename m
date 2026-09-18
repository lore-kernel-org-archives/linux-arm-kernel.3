Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B319DC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFGUmsZtJrd4ua8ceUYxUso1QIbX+17a+Wb/M6n30Bs=; b=ony0PmJSy6Jn9ac81tPd8+22kH
	beopf7iJYF6g8Nkuc3XifU/wgM0KVIbthegL7wIhUqz5Rs8pIOP0m6i5Asb+00N/f6OQ9pglV+WVT
	162rr2ygoDtoNOwBV/WjAaL5VC4DFD5ukNqxT5qmYk1vbvxkrmWMMpUUFa1LHpQRa6jU32aNajvf9
	wl6R12JQ3EqeO9MPFpdwdslDlIxa1axy+wCMiwI8HkwexfC/m9lfYQpPhOxSWgwJV/lQxorZtNSBs
	ataNmHzdmIWmt+17K3XI3kLsJ9/P7cH+4B+yr/hbDRe2lIhWCHiac8LUcFWgUrIxLTY/zFaJ3/Ize
	JnMQ4g/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ctY-0000000FF6c-2Ly3;
	Fri, 18 Sep 2026 18:01:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ctX-0000000FF6T-20Io
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:01:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4AB1602CC;
	Fri, 18 Sep 2026 18:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C811F000FF;
	Fri, 18 Sep 2026 18:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789754466;
	bh=JFGUmsZtJrd4ua8ceUYxUso1QIbX+17a+Wb/M6n30Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ui0WeFB36ooFsNAEOXhsf78kjdmkzW+qCWLnTsOVTo/7Lle+ToNp5ogBFrd15KsUH
	 1KJzCcvfw/m/CtJpdEuV1w9W3Vx4Ep2yJehXTAMvI2jpoIPfLotaZ32NDZjwg6wlmh
	 c7+ziURsMqN99wXtwbSG2bSe2RvnL+08zofACb0uxTXK7IcZ3a4/hRcZahVlD76Mi2
	 05D4EMn1ZxgJoZmsWKvOYNEGVKWEQd2RP/HexrPM1hUVYOkTIf605EFZ6WPBxR5Xlb
	 igtvUyx56jKeKgY3ddt/D8LQuStKmYBoGiDWfWuwkBBnndQACkJwhS6Jf5sJf+zVFj
	 vFomtcK1ON37Q==
Date: Fri, 18 Sep 2026 23:31:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
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
Message-ID: <aq18XoWmys6RmRGj@parshuram>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
 <aqlpoBJJXfZgsMxT@parshuram>
 <aqlwRkNcs_UqKjWs@parshuram>
 <aql6u3T0nnSVr-FC@SMW015318>
 <aqws8pN2rfS9-dCC@parshuram>
 <aqzZOZ2ovBc6affP@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqzZOZ2ovBc6affP@ashevche-desk.local>
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

On 18-09-26, 09:24, Andy Shevchenko wrote:
> On Thu, Sep 17, 2026 at 11:39:54PM +0530, Vinod Koul wrote:
> > On 15-09-26, 12:04, Frank Li wrote:
> > > On Tue, Sep 15, 2026 at 09:50:22PM +0530, Vinod Koul wrote:
> > > > On 15-09-26, 21:22, Vinod Koul wrote:
> 
> ...
> 
> > > > > > Traditional naming would be
> > > > > > dma/engine/provider.h
> 
> (Actually majority of the subsystems use driver.h.)
> 
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
> Hmm... It's rare to make such a requirement in the kernel for the resources
> like this. All I know about (GPIO, regulator, pwrseq, IIO), they split and
> provide the interfaces to the whole kernel.

Resources for kernel are in include/ no debate on that
If there is a valid justification on why driver need to live outside
subsystem we can provide. Unless I see that, I am inclined to not agree

-- 
~Vinod

