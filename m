Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF54CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=HLJgClyekoxF/eGhdvzbr0u00Cz8g6gkXvaPX+jj+9A=; b=b8IZqzZ72KMw/t
	O0IwZk40FO7HGmC1BPL3ZfQlgME5YITPYcjgzfC7uZUoCy2AVsSTWk7fjXPTJbmj8Ip2hIsqUgyKm
	WCh+vTtX/UdFZT/Z4f78M8ACOrSqF+ekNJGxRbe2aS5KFavVGrop5UI5mn99AfLL4CqmW8Ow8kbaU
	/KWo0h6w2C7gOJnCTRR3LHXVLvyrDXI7hTYLFqXMqWkWPkgVeRievDKIXQutblx/n6BK+dfB81gaU
	boMez9HjvHbanDyEGVuNz6FQiiCkFCfo/OqH0nmYiKec1442YnaQ3SZugXbTdvYdPXDX0YJvbuH9j
	GNNlmuCuXQ3GYvbqSm/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KQ3-0000000AcJP-2Wuk;
	Thu, 02 Oct 2025 14:36:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KQ3-0000000AcJG-0H2a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D58961E46;
	Thu,  2 Oct 2025 14:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1FEC4CEF4;
	Thu,  2 Oct 2025 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759415790;
	bh=B3aUqt3yFL4cHWEvV1ArHNkFI5dahy1JTP0dauqet8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZxYLLKgpgek07MIpQs+oWR3QIZ/0+t6zS5HO7VL5SSUaky6Wqsoy6MYs0UJlG0qd/
	 KfSfck/b9VZhYxoHARfeiJ+XfMQTaYHgb74w/SjBgKEONHvWDJyXoG/HlaU8ztW1HT
	 OpAeKa+4TFTNbgdoI7bOuqRySqL281bRPtXbJEtTbgFrdsclVZPv2Li0I0xuBdvGiR
	 uE4AETG1j+75R7mXo0YFDE86MIpMhnAXETIE4NNkBbWPq7rvl0kKT/LCvYq/v7GEb9
	 7UrFoYgh4imcXqLY94kp07jKJoHvOzRQhqlc9CKvqEDfrRys5UxJtBN0TEppGL8WqJ
	 GyHfKVXCLxj2A==
Date: Thu, 2 Oct 2025 09:36:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, cassel@kernel.org,
	kishon@kernel.org, sergio.paracuellos@gmail.com,
	18255117159@163.com, jirislaby@kernel.org, m-karicheri2@ti.com,
	santosh.shilimkar@ti.com, stable@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH 2/2] PCI: keystone: Remove the __init macro for the
 ks_pcie_host_init() callback
Message-ID: <20251002143627.GA267439@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912100802.3136121-3-s-vadapalli@ti.com>
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

On Fri, Sep 12, 2025 at 03:37:59PM +0530, Siddharth Vadapalli wrote:
> The ks_pcie_host_init() callback registered by the driver is invoked by
> dw_pcie_host_init(). Since the driver probe is not guaranteed to finish
> before the kernel initialization phase, the memory associated with
> ks_pcie_host_init() may already be freed by free_initmem().
> 
> It is observed in practice that the print associated with free_initmem()
> which is:
> 	"Freeing unused kernel memory: ..."
> is displayed before the driver is probed, following which an exception is
> triggered when ks_pcie_host_init() is invoked which looks like:
> 
> 	Unable to handle kernel paging request at virtual address ...
> 	Mem abort info:
> 	...
> 	pc : ks_pcie_host_init+0x0/0x540
> 	lr : dw_pcie_host_init+0x170/0x498
> 	...
> 	ks_pcie_host_init+0x0/0x540 (P)
> 	ks_pcie_probe+0x728/0x84c
> 	platform_probe+0x5c/0x98
> 	really_probe+0xbc/0x29c
> 	__driver_probe_device+0x78/0x12c
> 	driver_probe_device+0xd8/0x15c
> 	...
> 
> Fix this by removing the "__init" macro associated with the
> ks_pcie_host_init() callback and the ks_pcie_init_id() function that it
> internally invokes.
> 
> Fixes: 0c4ffcfe1fbc ("PCI: keystone: Add TI Keystone PCIe driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

I dropped this from pci/controller/keystone because of the resulting
section mismatch:

  https://lore.kernel.org/r/202510010726.GPljD7FR-lkp@intel.com

ks_pcie_host_init() calls hook_fault_code(), which is __init, so we
can't make ks_pcie_host_init() non-__init.

Both are bad problems, but there's no point in just swapping one
problem for a different one.

> ---
>  drivers/pci/controller/dwc/pci-keystone.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 21808a9e5158..c6e082dcb3bc 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -799,7 +799,7 @@ static int ks_pcie_fault(unsigned long addr, unsigned int fsr,
>  }
>  #endif
>  
> -static int __init ks_pcie_init_id(struct keystone_pcie *ks_pcie)
> +static int ks_pcie_init_id(struct keystone_pcie *ks_pcie)
>  {
>  	int ret;
>  	unsigned int id;
> @@ -831,7 +831,7 @@ static int __init ks_pcie_init_id(struct keystone_pcie *ks_pcie)
>  	return 0;
>  }
>  
> -static int __init ks_pcie_host_init(struct dw_pcie_rp *pp)
> +static int ks_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
> -- 
> 2.43.0
> 

