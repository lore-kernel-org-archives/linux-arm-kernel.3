Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A294C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAXr76kjMcOJq8oq8iOJabzJIAPYat7XYYLVIXIuJd8=; b=DCqlePNqRiGmkrtPiMD6buG6r3
	vS1adsZNemUs4HRtZatfh7sHEs+4YbsO8TZLVLlPqaELGoB0gpktpRyb0bSGw+ScqOwRScquHm2MS
	V8YqpWbJ0e5evU/bM+6tPs93ACsJJUJBbpd7sP5rZmgIYdDO7hChFS+q2m9L2QsBSH0yIrdECHmcF
	TwDxnaguMkx3btuxLDSvghlVB2VUW7FlvFFBkcHS+88MmIlyB8omUcJqNWDya4L2uoNrSvJqIVt/V
	6G6GOepsSPZsl9JO1YCKcZdGZTCWnmJZ812b6RFpAnKtXxBVyfKJ2xpGKhjhegzaf0ojeBGFh/929
	IApk/EXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATTu-0000000FWrn-0amG;
	Sat, 26 Sep 2026 14:34:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATTr-0000000FWrE-2FfC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:34:25 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1636B5;
	Sat, 26 Sep 2026 16:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790433149;
	bh=sioWM7zU7orAq0yWu48tuqAz3z5o3yMX3T83TcxxaaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIrF0ZoNTmP2Lh34cBXH+NEf2YlnDeyBWP/Y0GNoZpcBxs2nnT62H9yJ+rx7CmJNy
	 GPxUH9pFck4AZvcVIMnsYulGkG4gW6OTZ8QvUMogQAqsL/MKaLB0W2Dwy8q95I//TD
	 VGNszo1ZO0NmkV40TweHYccyULWmYDLulOK6yqmQ=
Date: Sat, 26 Sep 2026 17:34:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: xilinx: dpdma: Reserve space for a string
 terminator
Message-ID: <20260926143415.GA764757@killaraus.ideasonboard.com>
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-4-yaojiale02@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260926121250.3258285-4-yaojiale02@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_073424_018581_BC6EA435 
X-CRM114-Status: GOOD (  16.27  )
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

On Sat, Sep 26, 2026 at 08:12:50PM +0800, Jiale Yao wrote:
> xilinx_dpdma_debugfs_write() allocates a buffer of size bytes, and
> strncpy_from_user() can fill it without a terminating NUL when the input
> has no NUL in the copied range. strsep() and strcasecmp() then read
> beyond the buffer.

strncpy() has long been considered unsafe, and has finally been removed
from the kernel in v7.2. A better fix would be to similarly replace
strncpy_from_user() with a safe equivalent.

> Allocate an extra byte and keep that byte zero-initialized, so the input
> copied remains unchanged and the buffer is always terminated.
> 
> Fixes: 1d220435cab3 ("dmaengine: xilinx: dpdma: Add debugfs support")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4531..b61ef3062d84 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -410,7 +410,7 @@ static ssize_t xilinx_dpdma_debugfs_write(struct file *f,
>  	if (dpdma_debugfs.testcase != DPDMA_TC_NONE)
>  		return -EBUSY;
>  
> -	kern_buff = kzalloc(size, GFP_KERNEL);
> +	kern_buff = kzalloc(size + 1, GFP_KERNEL);
>  	if (!kern_buff)
>  		return -ENOMEM;
>  	kern_buff_start = kern_buff;

-- 
Regards,

Laurent Pinchart

