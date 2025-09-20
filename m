Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DA0CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6vQS7y0FnVGAEF8cRdMwpoZ/gcUWHq36HnVDQkOSno=; b=oushzXFuREWibg1GsW6JYoZPRH
	Ys38NdiLG65FdeDW06raX1x0ZWzW0KkPNXrrT+RLTqAclM+aP6dfIvlsqR+bsrpuKjq7I7UEHtGJP
	5MGZwTDP48memvfngcaEg6yrt5BOkxH5Zrw9DbFq3w9xRrpwfBTcWXmHcsOU5Pf8rRUJ1uZ72w2bv
	0oq3J9CvxszTqnnrajc1N3T7x/JiBTdnT6T07UtNr6bYVZo0/5/KWxfUpkJ05U1tvO8hCHPYG33QC
	qR8jfGHXqsXAytJ/9Yw6eU21pMpmXPS2c4d4aPM/qFCmUBxwtq35bZF+azDrMYPSqBlEdtqCxmuhl
	BAWpKElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzrv-00000005Z9l-1hWL;
	Sat, 20 Sep 2025 15:51:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzrt-00000005Z9V-3Lpx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 15:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 834BC6014D;
	Sat, 20 Sep 2025 15:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D414AC4CEEB;
	Sat, 20 Sep 2025 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758383480;
	bh=mR4v4EXQdRB/Jtk6fzE7auVcBUrgzQ2QkUJHyK5XQiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ci7RwxtLdmcq8ea/FVl1MeSshBDTUPr5jjyoL6uPwL903LIjwtn99Lgc6a69lWT32
	 31lFsYfk1St8N4y21j5v6BL3aqQPEpIZlyGhftp4KRZ5jKOUbwc9h8RH4Bmv6WPMDc
	 Xt8nqCUnqTvjDg+9uHdC4iml28UldaHZeWOaUAGF4nXy3FHFABIDjshctrG2JyIp2x
	 6s5h26Y3C8xOUvGX+CNMP771/g3T42MRXwTGA0pi5BnkhsThm2rTjV7eVLVQLh9Kti
	 NaWpksmxSr27f9thz/r58N8uNy6L53HnTHwS9GqS9jXcCdbC5PWZPipXXX0RNWA78l
	 1ARfBaqt5VAXA==
Date: Sat, 20 Sep 2025 21:21:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ravi Kumar Bandi <ravib@amazon.com>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: xilinx-xdma: Enable legacy interrupts
Message-ID: <472oclxowztq4zfvtqjdrn4whe2hpcecgmgmsrkw2gwfuvac7r@xrgouxxp3qva>
References: <20250919231330.886-1-ravib@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250919231330.886-1-ravib@amazon.com>
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

On Fri, Sep 19, 2025 at 11:13:30PM +0000, Ravi Kumar Bandi wrote:

+ Thippeswamy (author or 8d786149d78c)

> Starting with kernel 6.6.0, legacy interrupts from PCIe endpoints
> do not flow through the Xilinx XDMA root port bridge because
> interrupts are not enabled after initializing the port.
> 
> This issue is seen after XDMA driver received support for QDMA and
> underwent relevant code restructuring of old xdma-pl driver to
> xilinx-dma-pl (ref commit: 8d786149d78c).
> 

The above mentioned commmit added a new driver. So I don't see when the driver
restructuring happened.

> This patch re-enables legacy interrupts to use with PCIe endpoints
> with legacy interrupts.

s/legacy/INTx, here and everywhere.

> Tested the fix on a board with two endpoints
> generating legacy interrupts. Interrupts are properly detected and
> serviced. The /proc/interrupts output shows:
> [...]
> 32:        320          0  pl_dma:RC-Event  16 Level     400000000.axi-pcie, azdrv
> 52:        470          0  pl_dma:RC-Event  16 Level     500000000.axi-pcie, azdrv
> [...]
> 
> Signed-off-by: Ravi Kumar Bandi <ravib@amazon.com>

Missing Fixes tag and you should CC stable list for backporting.

- Mani

> ---
>  drivers/pci/controller/pcie-xilinx-dma-pl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> index b037c8f315e4..cc539292d10a 100644
> --- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
> +++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
> @@ -659,6 +659,12 @@ static int xilinx_pl_dma_pcie_setup_irq(struct pl_dma_pcie *port)
>  		return err;
>  	}
>  
> +	/* Enable interrupts */
> +	pcie_write(port, XILINX_PCIE_DMA_IMR_ALL_MASK,
> +		   XILINX_PCIE_DMA_REG_IMR);
> +	pcie_write(port, XILINX_PCIE_DMA_IDRN_MASK,
> +		   XILINX_PCIE_DMA_REG_IDRN_MASK);
> +
>  	return 0;
>  }
>  
> -- 
> 2.47.3
> 

-- 
மணிவண்ணன் சதாசிவம்

