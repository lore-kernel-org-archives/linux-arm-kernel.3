Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891A3CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 03:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssIN6/5S3OfebyIdpM7ih+DySVHt8wTbq0kw5qBaMFY=; b=wmlruTWhsUbAnwO3GvKgPyyu7Z
	v9Gdv5k41/pAi/k8BYE2BQgjk+JPoe94ZTDj/XBCzRFc5ghoiRAb7dI/rKyJ0woxGgX3uDJv8O4Wq
	mzktQOKHEE4HeO+PszwFFTvEknBHK0wE7Oq10m3x+fl06CCEo0U/wfd5vjmUWCY2cqob1eh53CcXd
	/uSTcNxQrfR5P2IBr0B5jCbH9R9wF93e5Pc+pvZUlCUeCX3JnmJdz9yng5uKM2YzMiBRRDZZsB4yw
	H6hxTrQ+B5W0dMIUH+nDVE9uwdk9mnqw/o30RKmhxZ025bbLrU2CnOAv2B7ZOl3hfOsqZCiMsEOJE
	3AoCUs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCIE-00000007NeC-4AZX;
	Sat, 30 Aug 2025 03:30:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usCFR-00000007NV6-1Slg;
	Sat, 30 Aug 2025 03:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91C3541A13;
	Sat, 30 Aug 2025 03:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8987C4CEF0;
	Sat, 30 Aug 2025 03:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756524444;
	bh=EeM6wlnVh/LaVPIABlVqVwrJnTHj5btsYvFNRr+o3EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTAFArBON0yO4GRK52P9RF2QBrxzNfdltDdA5zELoqtsVCQ8qiSO6pDUlks2ZZjEK
	 rzQyh3bjLI19GhDcj3+QqfT6AVed7T5PK/gdu9mq/PfFiUWq3Ji4tclqO5MdcUQqmE
	 ySIMTi1OyZVye6vts5e9F+Izv2qdvGyLjeAQKECltzDmsMd536rlLLAE2mxnj8I1aN
	 rYFzo6s9pJJHFJ8LQRCPsXESIvKeyFlVh0jgSu1MIsRS1vGNrMJpGP9sVTIxOTxVRl
	 B1Au4a4tvUyAIb3QmIDTbmabxrDQvssLhfIsQWbIKIAEJFTyx/LX7Cxc+s6M8LpvM+
	 O80tey/sz1fZQ==
Date: Sat, 30 Aug 2025 08:57:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de, 
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com
Subject: Re: [PATCH v3 07/12] dt-bindings: PCI: Add support for Tesla FSD SoC
Message-ID: <frnwfzh7j6x27evk6oo64cevpreq5s4tugewebcpropzmxpilf@trv2toljqptl>
References: <20250811154638.95732-1-shradha.t@samsung.com>
 <CGME20250811154725epcas5p428fa3370a32bc2b664a4fd8260078097@epcas5p4.samsung.com>
 <20250811154638.95732-8-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811154638.95732-8-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_202725_411705_7F43D1F1 
X-CRM114-Status: UNSURE (   9.54  )
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

On Mon, Aug 11, 2025 at 09:16:33PM GMT, Shradha Todi wrote:
> Add Tesla FSD SoC support for both RC and EP.

Add some info about the PCIe controller here. Like the data rate supported,
lanes, interrupts, any quirks etc...

> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  .../bindings/pci/tesla,fsd-pcie-ep.yaml       | 91 +++++++++++++++++++
>  .../bindings/pci/tesla,fsd-pcie.yaml          | 77 ++++++++++++++++
>  2 files changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/tesla,fsd-pcie.yaml
> 

[...]

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/fsd-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcierc1: pcie@16b00000 {
> +            compatible = "tesla,fsd-pcie";
> +            reg = <0x0 0x16b00000 0x0 0x2000>,
> +                  <0x0 0x168c0000 0x0 0x1000>,
> +                  <0x0 0x18000000 0x0 0x1000>;
> +            reg-names = "dbi", "elbi", "config";
> +            ranges =  <0x82000000 0x0 0x18001000 0x0 0x18001000 0x0 0xffefff>;
> +            clocks = <&clock_fsys1 PCIE_LINK1_IPCLKPORT_AUX_ACLK>,
> +                     <&clock_fsys1 PCIE_LINK1_IPCLKPORT_DBI_ACLK>,
> +                     <&clock_fsys1 PCIE_LINK1_IPCLKPORT_MSTR_ACLK>,
> +                     <&clock_fsys1 PCIE_LINK1_IPCLKPORT_SLV_ACLK>;
> +            clock-names = "aux", "dbi", "mstr", "slv";
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            dma-coherent;
> +            device_type = "pci";
> +            interrupts = <GIC_SPI 117 IRQ_TYPE_EDGE_RISING>;

Only one SPI interrupt? What about INTx? Don't you have any external/internal
MSI controller?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

