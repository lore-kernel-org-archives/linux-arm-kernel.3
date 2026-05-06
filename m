Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA6BCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMnYomw7wkM/4yGc5Bu3qyGXNBMc4omZ0x90cKOmQrc=; b=e/EIIlnZUfVo9b5kCRy+zXlm/N
	9g2SXcbwwz3JhkWcGJ9nwnmNXH2a+qKewvwILNne8nZs2p8/PMDoB4HTkllc8gMKn2vKG3w8Eoyc2
	YVBoSkUBsjESA0+QIoPywWsbN8Yr64IXFoRbMxa6Ji/4LB+Ay2209ZXnCVjHsimjDv2sR18rQM1IF
	TPB1REMtZznf7DkUwI60qBfbVyFuPOnlVPZq6OQtr9yThZW/UEW6q2odN5A7BqscUulbKUg56J9jv
	Z67yLntgdHq6GdFx4wkm5rjYdgXHFPwo5/jy8CibJdnuR3GKHCSalTdZ18yqaSY1TZMvQF83Es3ne
	pGu2xjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeja-00000001ROn-0ZpP;
	Wed, 06 May 2026 16:04:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKejZ-00000001ROY-0ZP7;
	Wed, 06 May 2026 16:04:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 562B36014B;
	Wed,  6 May 2026 16:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C581C2BCB0;
	Wed,  6 May 2026 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778083464;
	bh=6FVEWNBCSGLEKdFaLuHudNfHQjAUWParHoWV/FsZ0nY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6VD1Djs+ELVFmhOF0ioeTY8/DahRm6ZRoCGweQFimAHuF1bmhpEmvZmi9o5DG9yq
	 /87bwBvuuWRV7apF9HB8NGiBO8F4mLdb/S4YvfuNkV/EgSHNP/Q8OwjI4O26oW3J+S
	 EHhKrXX+/LY+AWNsYkwiQw0nXPhaumq0wuvQP5YWPY5zXv1IXCYMUiACmT6fTVnqmA
	 r0IEm0u/ml9HwI/WCvnxOwHikxK7IAaBD2K13w2ZGb1yVxo7oxdHarISmdXH12YY9H
	 WmBtCQE92qijSN64OJDYRBnAP/nwgfNLQeeUu6kTKdiOZVAib+Zopr1CC9fXsS3wk4
	 RIkU+e3baqU8Q==
Date: Wed, 6 May 2026 21:34:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] PCI: j721e: Set max_link_speed to enable 100 ms
 delay after link up
Message-ID: <rlsvpbo4gcix3mmbfsxvmfebnnn4bqm3cv34x4qkxuv3zwydnm@ehi3el63z664>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-5-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506152346.166056-5-18255117159@163.com>
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

On Wed, May 06, 2026 at 11:23:42PM +0800, Hans Zhang wrote:
> Set cdns_pcie.max_link_speed to the maximum supported link speed
> (obtained from the device tree property "max-link-speed") in
> j721e_pcie_set_link_speed(). This activates the post-link delay logic
> added in cdns_pcie_host_start_link() when the controller supports
> speeds greater than 5 GT/s.
> 
> As required by PCIe r6.0 sec 6.6.1, and following the same approach as
> commit 80dc18a0cba8d ("PCI: dwc: Ensure that dw_pcie_wait_for_link()
> waits 100 ms after link up"), this ensures a 100 ms delay after link
> training completes before any Configuration Request is sent.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index bfdfe98d5aba..ee85b8e04f5b 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
>  	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
>  		link_speed = 2;
>  
> +	pcie->cdns_pcie.max_link_speed = link_speed;

What about other glue drivers?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

