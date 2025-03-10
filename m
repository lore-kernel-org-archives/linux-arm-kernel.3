Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F42C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjokRclbHCV1JjvnBAqOGYOOlMcnFVYOnnSQYqG12Tk=; b=kYEGjRHNmZ8skE3i8xbUXvH8AU
	b+9FUXR0nI6NCVDuA7u7y8n1ViX2WPgvvfx/qRBF5MechM+1VhYwPQEtwn0n5LWvmZ2puVPm15+i7
	YzKXZUwBpZb5R5lz9BMlELTQ/pTEU8svOH9MTgivp2cl9/a5oDGOFhlVJox1KIcGSbJVdEucRumA4
	OsL5IAPHhu9bfTuOjpUm4Ae0YF0l69Ke+Nfaxaop/qiko9uitnIePTJE91l7829cTvQIJLEGFiE89
	bk0m5guWWcEUtMJRolsGn53HBx8c7FF/fSwv/65WPmT1cQXe5Wm+cBU55ShwfobtWeB3AlQlxJU+4
	r9mK8C3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trk3w-00000003v68-0IHi;
	Mon, 10 Mar 2025 20:49:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trk2C-00000003v1J-03nc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 20:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 236C6A4615B;
	Mon, 10 Mar 2025 20:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669ABC4CEE5;
	Mon, 10 Mar 2025 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741639655;
	bh=Zf01IC7iv4wbCJ+aR/Htct+Ew44gIeHiBJl2ieaEMok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGvSE7A42EbJnZRC1hj4/bjyygUZL4fmxWqVrW82nr1a43xeLEKBkaSzymJuwhzC4
	 q7SVWHZKkcaGlOhxtuKjYy0e9VDLfSCSL68uaid7zbT/14TQ+X7QxVCXHm26oQW0sZ
	 73EKYeMW0V6eJGlEsQMznD4aRvzDg2lGpTJwesXHxCtCGepNxW2tHJrazIXPqxkNmH
	 t5Cxruckx6/CCw1r6jLz+e3fFgO2Wm6e0wgA22g2RuxTROLw8i508aaTkKvpbOLTgl
	 H4NP0zQl/geIqNhmGkYWNItfZgMfYl0UtOa3pkuNiqcfUR5jj+dwa5kW0qUMlJY/Ol
	 QBly887wQlpdQ==
Date: Tue, 11 Mar 2025 02:17:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dmaengine: Add Arm DMA-350 driver
Message-ID: <Z89P461+Y6kQDOCX@vaman>
References: <cover.1740762136.git.robin.murphy@arm.com>
 <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e084dd2b5720bdddf503ffac560d111032aa96.1740762136.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_134736_114660_086A932D 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

On 28-02-25, 17:26, Robin Murphy wrote:

> +static u32 d350_get_residue(struct d350_chan *dch)
> +{
> +	u32 res, xsize, xsizehi, hi_new;
> +
> +	hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
> +	do {
> +		xsizehi = hi_new;
> +		xsize = readl_relaxed(dch->base + CH_XSIZE);
> +		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
> +	} while (xsizehi != hi_new);

This can go forever, lets have some limits to this loop please

> +static int d350_alloc_chan_resources(struct dma_chan *chan)
> +{
> +	struct d350_chan *dch = to_d350_chan(chan);
> +	int ret = request_irq(dch->irq, d350_irq, IRQF_SHARED,
> +			      dev_name(&dch->vc.chan.dev->device), dch);

This is interesting, any reason why the irq is allocated here? Would it
be not better to do that in probe...

-- 
~Vinod

