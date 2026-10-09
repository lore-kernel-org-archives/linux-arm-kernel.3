Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB671CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NN/hoihGlgYOQ3g+HiDIFNp0hvlK2XY1wVVhjZreZc=; b=SEEVZwKyzymcmVtT12Kur2y0Hg
	PHebQhNZbGlV97ZjDlBkKfToplh+XieQxiNF3hw2c5PFEfAv7mEOOYhqD57I6xT7afAj35p/kzjy7
	/Ja6tprtkuSEArgsnXPbDNYWq0s1Wn0uglPl5GBo2ljq9MSCoDsN0nvSbPPtsyITBDHIkK/yJK7kM
	X0+hWqFS2vw9mOQuYUw09fW+f4Brfgz/BQ7jFYBUNtLmNGl3124qKzpChU9Rcg1oXlbDe7E0U+gTb
	v2WMmQO3sCA/IFcwwwpvZneO0eiQA9muYTWI5cmuoiOgRDMjzj/MUDZrdCVFYtj9z4leIbeuwmj9R
	x3VeW9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6h0-00000005tdM-3BYt;
	Fri, 09 Oct 2026 09:15:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6gz-00000005tcw-1daA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:15:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82B05601F9;
	Fri,  9 Oct 2026 09:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A801F00893;
	Fri,  9 Oct 2026 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537304;
	bh=3NN/hoihGlgYOQ3g+HiDIFNp0hvlK2XY1wVVhjZreZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1iSR24MZdZWLG3gs/fGUx1COZO0uDBytxmc7byfdGwfxukLFU1e7EbY2cNKo7da9
	 wJV/BYTBVVqPrNK1dqQtr1aMOkEfw+0EXwnbCUht7gHZfOzKGGdvcujEsZ5wzeT1FO
	 hMkI0NSd3ktIUnGjTbD4HS1Uua/oS52qIxUy5U3Dx9I7NVAvFOonQ1BC8vwyucZmr5
	 TPIszck4cljr0ATfW6EYHdNQmEl6iHJOOTRFJfGpObmA4aevizSLnjzW//xNXnnBE+
	 oGa21Vz071e6QkRUnWX9iWa1v3xnR5qTFgN5OBBGLIPKaqi3fIsGYN4pCorq7+szF9
	 kUKFO6ON9BRag==
Date: Fri, 9 Oct 2026 11:15:00 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
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
Message-ID: <asiwlNB2GMhmBlk8@parshuram>
References: <aq18_TMNs4EJzgZO@parshuram>
 <arDtEB0na9DxDWAS@nsa>
 <arFXc0LqEpgWSS6m@SMW015318>
 <ar-Il2qP_Qms3Qw1@nsa>
 <ar-13p3a7ENGfMOF@SMW015318>
 <asEWwIfO0LB27wj9@ashevche-desk.local>
 <asGk4fj_HQ5HupB4@SMW015318>
 <6f5dd1c1622adbaf0174a949ca91cb11872087ff.camel@gmail.com>
 <asSqVEHe8EjkbcwW@SMW015318>
 <asTDTxneqrpFlZi-@nsa>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asTDTxneqrpFlZi-@nsa>
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

On 06-10-26, 10:47, Nuno Sá wrote:
> On Tue, Oct 06, 2026 at 02:59:16AM -0500, Frank Li wrote:
> > On Tue, Oct 06, 2026 at 07:36:06AM +0100, Nuno Sá wrote:
> > > On Sat, 2026-10-03 at 19:59 -0500, Frank Li wrote:
> > ...
> > > >
> > > > There are already include bitmap.h, and use
> > > >
> > > > typedef struct { DECLARE_BITMAP(bits, DMA_TX_TYPE_END); } dma_cap_mask_t;
> > > >
> > > > Suppose all DMA Engine consumer will use it to do some check. So I think
> > > > needn't split it as indivial version.
> > >
> > > Are we sure all consumers are making use of dma_cap_mask?
> > 
> > Some legacy user check it. Supposed needn't check it after get channel.
> > I am working new API to check it to avoid direct access it.
> > 
> > > In fact the only function
> > > depending on bitmap.h is the one clearing the cap_mask. But stepping a bit back,
> > > bitmap.h was the original proposal from Andy so the idea was to have the new
> > > widthmask (this one indeed heavily uses bitmaps) already as a split. And with it,
> > > came types.h given that the DMA enum needs to be used from both consumers and
> > > providers.
> > 
> > Supposed provider is super set, which can include consume part.
> 
> Yes but also look the below note on the consumers.
> 
> > 
> > > And note that consumers might want the header without actually needing the
> > > bus width API so the separation kind of made sense to me.
> > > Then, as a follow up the idea was to also split the cap_mask API into it's own header
> > > with a backing include in the main consumer header.
> > >
> > > So if we all agree with the above, I guess the current series does not really has to
> > > change. I see 3 ways:
> > >
> > > * Just go back some versions before and have all of it in dmaengine.h
> > > * The current form
> > > * s/engine/consumer on the current proposal include/linux/dma/engine/*
> > 
> > I think we can put include/linux/dmaengine.h now. The split/move need more
> > work. I already sent some patches.
> > 
> 
> Ok, to be sure we're 100% on the same side, plan for now is to add the
> bus width API directly in include/linux/dmaengine.h?

Agreed, we have two headers one global: include/linux/dmaengine.h which
will be moved as a consumer API Header and local header
drivers/dma/dmaengine.h which will be provider header (i am okay to
rename as such as well).

So this one is used by both so lets keep in global header.

Thanks
-- 
~Vinod

