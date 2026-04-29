Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8967FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1jzGVpSZgc0zOr44FXn7aj5bViz+UH3ww4dijwsI7w=; b=BeHYqZEfxpMg37mqxFe/Dl8wFz
	n4km949/JX+mttOIHdUJPW5hclbQaYFPoFHrMIcy+d0ZgTPTl0DskbO0h38Kww/JDPHSPgkSfUN8b
	H04y7F3/uK9FqYU4629MyKwr39WMw4DRfmy22qNZncIvTYU7pMN3Ru5iiQ+VwB11R5O+5HKfJBQKZ
	Qlt1tmEv/EsjbO1EybvPZziM97KHKgjtNTCIR+fYsgQkcKoAgTg8GADHdy/OGvY9bXNkTSWoqq4Ei
	EdlSBU9wu0zfAat5a488qGXOKffiAk3oheWNdvARcwZqlTh0AaQ2kDosJzdz7ywO2wWNrjV6fvCY4
	CzBLPFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBVy-00000004C6p-1YVY;
	Wed, 29 Apr 2026 20:28:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIBVt-00000004C6O-26OS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 20:28:09 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B06C4BB;
	Wed, 29 Apr 2026 22:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777494379;
	bh=1WhgM7s9T8lW6CepEqkpok80KW4t2frLj0MmsJ97CGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvZv2WbPUcj8PXY4U2VeLOPhprcqJVhV0mf63yTHq3/7DHMi7MiAURSCj7kI4DwDb
	 PcSqqViBPLyq1gloP1XHV1zMaCeqyQWq1MIxGJlApnoQBu72uQrHe1IwT8eJYXygy/
	 aGIQUBrxyO2GZkwTFigfUPxYqi+WHZE/9odR2Elk=
Date: Wed, 29 Apr 2026 23:28:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH][next] media: xilinx: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <20260429202801.GB132396@killaraus.ideasonboard.com>
References: <afJiL-iZ4QbJ5v12@kspp>
 <20260429202449.GA132396@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429202449.GA132396@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_132805_684901_C5D24F62 
X-CRM114-Status: GOOD (  22.33  )
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

I forgot to ask, how do you want to get this merged? Will you collect
all similar patches and send a tree-wide pull request, or should they be
merged by individual subsystems ? In the latter case, Tomi, could you
please handle this with other Xilinx patches ?

On Wed, Apr 29, 2026 at 11:24:50PM +0300, Laurent Pinchart wrote:
> CC'ing Tomi Valkeinen.
> 
> On a side note, Tomi, can I send a patch to add you to the "XILINX VIDEO
> IP CORES" section of MAINTAINERS ?
> 
> On Wed, Apr 29, 2026 at 01:55:27PM -0600, Gustavo A. R. Silva wrote:
> > -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> > getting ready to enable it, globally.
> > 
> > Use the TRAILING_OVERLAP() helper to fix the following warning:
> > 
> > drivers/media/platform/xilinx/xilinx-dma.h:99:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > 
> > This helper creates a union between a flexible-array member (FAM)
> > and a set of members that would otherwise follow it. This overlays
> > the trailing members onto the FAM while preserving the original
> > memory layout.
> > 
> > Lastly, the static_assert() ensures the alignment between the FAM
> > and struct data_chunk sgl; is not inadvertently changed, and it's
> > intentionally placed inmediately after the related structure (that
> > is, no blank line in between).
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/platform/xilinx/xilinx-dma.h | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
> > index 18f77e1a7b39..65f6147ff6c6 100644
> > --- a/drivers/media/platform/xilinx/xilinx-dma.h
> > +++ b/drivers/media/platform/xilinx/xilinx-dma.h
> > @@ -96,9 +96,14 @@ struct xvip_dma {
> >  
> >  	struct dma_chan *dma;
> >  	unsigned int align;
> > -	struct dma_interleaved_template xt;
> > -	struct data_chunk sgl;
> > +
> > +	/* Must be last as it ends in a flexible-array member. */
> > +	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
> > +		struct data_chunk sgl;
> > +	);
> >  };
> > +static_assert(offsetof(struct xvip_dma, xt.sgl) ==
> > +	      offsetof(struct xvip_dma, sgl));
> >  
> >  #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)
> >  

-- 
Regards,

Laurent Pinchart

