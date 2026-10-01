Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBAFCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5NsAM9nSVtA2GkRrXYxyaaUaDLH0bm60UyVF2aq5+I=; b=JR6Fsh2tWMjoNXhHgMPqE6xvLs
	Nqiw6ZKsg6RPymoWlMmPvxyLLl5DGBRIZJo7UQz1fSHW9L05826inMULxk6rsVjtOEOaYzt3z1Rfl
	UBTfAwIQIktoJOzCaKdKwTN5zd7IdfdEmXXNftJig343MwcJlZHEp1DrRUVaOQ9KZ5Tt3FgGusXfQ
	60Ys9O2244/G+bTmgwj/nq4Orl1QfgQkcto9jIINDD+mF9v8wfMEDWY7h4s2p7pJP0Va5U+x8TKN+
	KfJSQ4XlPQ3xY7Nw538MRJx8sAizOSzCfpTcbV9vkG+XgKpv7viYnDXX/QzZJEuaxKBkS6C8Lm/UF
	YeN830fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNtK-0000000ACA3-11FU;
	Thu, 01 Oct 2026 21:00:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNtE-0000000AC9Y-1W96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:00:30 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78532593;
	Thu,  1 Oct 2026 22:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790888309;
	bh=xH0u8C5iqbgx1k8NmWvyHlZXUFkitoJMZ2/QXJho17E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/bxI5qhZCm5GHy3VGESwHbAINU5xKrCtPL2g9PAw8WMitKPJ+2pqD9F7Ur7KUUpM
	 bPYXUCtEFj8jXF2JeRoEVcNOTpk5jZy5eXHqO4R0GlZjokEMmGtcWzgsOpLMmlb54j
	 tG1QqPC9iTqjkxHtXQ8lcVMSG/BOsn+QSzNRZ3ck=
Date: Fri, 2 Oct 2026 00:00:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Jiale Yao <yaojiale02@163.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a string
 terminator
Message-ID: <20261001210021.GQ944070@killaraus.ideasonboard.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
 <20260926143415.GA764757@killaraus.ideasonboard.com>
 <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ar7Hj-BQW7xPtjaC@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_140028_893240_7CEDB506 
X-CRM114-Status: GOOD (  23.03  )
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

On Thu, Oct 01, 2026 at 04:50:23PM -0400, Frank Li wrote:
> On Sat, Sep 26, 2026 at 05:34:15PM +0300, Laurent Pinchart wrote:
> > On Sat, Sep 26, 2026 at 08:12:50PM +0800, Jiale Yao wrote:
> > > xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
> > > strncpy_from_user() can fill it without a terminating NUL when the input
> > > has no NUL in the copied range. strsep() and strcasecmp() then read
> > > beyond the buffer.
> >
> > strncpy() has long been considered unsafe, and has finally been removed
> > from the kernel in v7.2. A better fix would be to similarly replace
> > strncpy_from_user() with a safe equivalent.
> 
> Do you means use strndup_user()?

I was thinking about adding a strscpy_user(), but a dup version could
possibly be interesting too if there are enough users that call
k[zm]alloc + strncpy_from_user.

> > > Allocate an extra byte and keep that byte zero-initialized, so the input
> > > copied remains unchanged and the buffer is always terminated.
> > >
> > > Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
> > > Signed-off-by: Jiale Yao <yaojiale02@163.com>
> > > ---
> > >  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> > > index d9a3542c4531..b61ef3062d84 100644
> > > --- a/drivers/dma/xilinx/xilinx_dpdma.c
> > > +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> > > @@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
> > >  	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
> > >  		return -EBUSY;
> > >
> > > -	kern_buff = kzalloc(size, GFP_KERNEL);
> > > +	kern_buff = kzalloc(size + 1, GFP_KERNEL);
> > >  	if (!kern_buff)
> > >  		return -ENOMEM;
> > >  	kern_buff_start = kern_buff;

-- 
Regards,

Laurent Pinchart

