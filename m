Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FA0C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jzPbEzbYsu0TNNJTZZ2+GnWC1qipBsRSlMWnpLdPDFI=; b=C1s10gleSOIgXd
	bc3Ja2sRNcdQ2Qis0nGywOQO9nCLzYDzLAA3fGrjUO3ktv8uDKWMq/fGGiDhtV2XVVdmBRkBKwdPg
	IHUE5ZLFnwB3kOx9CFnYJBHobW45uuIiTI210sVO2GWacqiId1ET7FfAt2yKAnaqdPS8+KWOt8lp1
	vum4v7j5xMdsG3L78WAIPION+Z3PE3N9bcvfJTdD2+/XB8dTsKq6q4ArDMe+mbNzS2YEZlz8d7nUf
	Cn3dFTa07xGX9J/wiWafXSo7R27JYVFhLt2Q0v/g71uD/pEOqlSTNbRCf321w+5Pjpx5oZUzc0bne
	jmwLliCwOIGKEsFizSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdug-0000000G1bT-4B5C;
	Fri, 20 Jun 2025 15:44:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdsT-0000000G1CL-0exg;
	Fri, 20 Jun 2025 15:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CC946250A;
	Fri, 20 Jun 2025 15:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BC2C4CEE3;
	Fri, 20 Jun 2025 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434124;
	bh=SHPTxnd4pbMYQOtiIQLzx9eD7HZDUt3+mEFmqV4gGBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=g5okcp6JBl2EOByxwdGhanD/oHlYvrWI0Ju/YEgHG3PVZv122YXGG65QLIySgjCma
	 EvWhT3unRjT77HoYGSlzUPV2HwmghNbhw7zb3sVVWlaXsf4xguDKGYXMERIg2YM9pX
	 gXDqosrULppL3gOfoy8ENwCQQq1pLft2MI/KDPXuKmovWBi50brnztquvRguMV/Kf/
	 Kw4lvcJCWsZB9ch0PkRu3OxocrNdJc6cypNlM7NJoZRv/PxZRISSIqPDff2kM0uGmK
	 dqHzCD9MspAjRyfIlWI3SkIGkwfQj+F+zUfHIg8ucU5RnCXhFOQJ2ysIWuRpDdKTof
	 Uu7jXcW0sVKdQ==
Date: Fri, 20 Jun 2025 10:42:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org,
	shawn.lin@rock-chips.com, heiko@sntech.de, robh@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: rockchip: Remove redundant PCIe message routing
 definitions
Message-ID: <20250620154202.GA1292011@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607154913.805027-3-18255117159@163.com>
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

On Sat, Jun 07, 2025 at 11:49:13PM +0800, Hans Zhang wrote:
> The Rockchip driver contained duplicated message routing and INTx code
> definitions (e.g., ROCKCHIP_PCIE_MSG_ROUTING_TO_RC,
> ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTA). These are already provided by the
> PCI core in drivers/pci/pci.h as PCIE_MSG_TYPE_R_RC and
> PCIE_MSG_CODE_ASSERT_INTA, respectively.
> 
> Remove the driver-specific definitions and use the common PCIe macros
> instead. This aligns the driver with the PCIe specification and reduces
> maintenance overhead.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/pcie-rockchip.h | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 5864a20323f2..12bc8da59d73 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -215,20 +215,6 @@
>  #define RC_REGION_0_TYPE_MASK			GENMASK(3, 0)
>  #define MAX_AXI_WRAPPER_REGION_NUM		33
>  
> -#define ROCKCHIP_PCIE_MSG_ROUTING_TO_RC		0x0
> -#define ROCKCHIP_PCIE_MSG_ROUTING_VIA_ADDR		0x1
> -#define ROCKCHIP_PCIE_MSG_ROUTING_VIA_ID		0x2
> -#define ROCKCHIP_PCIE_MSG_ROUTING_BROADCAST		0x3
> -#define ROCKCHIP_PCIE_MSG_ROUTING_LOCAL_INTX		0x4
> -#define ROCKCHIP_PCIE_MSG_ROUTING_PME_ACK		0x5
> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTA		0x20
> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTB		0x21
> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTC		0x22
> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTD		0x23
> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTA		0x24
> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTB		0x25
> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTC		0x26
> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTD		0x27

Thanks for doing this!  In fact, these definitions are not only
redundant, they're not even used at all.

>  #define ROCKCHIP_PCIE_MSG_ROUTING_MASK			GENMASK(7, 5)
>  #define ROCKCHIP_PCIE_MSG_ROUTING(route) \
>  	(((route) << 5) & ROCKCHIP_PCIE_MSG_ROUTING_MASK)

And neither are these ROUTING and CODE definitions.

