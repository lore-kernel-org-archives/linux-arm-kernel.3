Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03470CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Bc1X/NnMh6JIzpgh7uq/jgkEpIGFmny+z9C05zPpng=; b=ika4Q7atziaG9NSpfjUgDQDk4m
	hJb1v2H5iMYCM4ETt+Nr+IErbC5Z5wj41wzFR/W1HrUE5seXGCd4Em3a/VeiXJi3aaFjq8XLLIU7I
	4rmmbbhqZjhen4fu8hysjOwMyv6nfPxYLIm0j02ZpjQfV1fMqAqyu1GEojJR+Q3MYoway49pR1tZc
	57XTeVM94x9h+SkrTjn9GGnhoizJSmY2dsqECBKmQ+GyuavXGSXamaLdCBbJPAX8BK6eXJMDiXwUY
	Tkvcx3qSKxVwcyub35MSEKiVruJjzTsoP2+ZpF/7v4aCZmsrE1mFQKdwS69wfYrrUwBCN2yWEh6iB
	DpvUvr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIYj-00000009wVQ-3joH;
	Tue, 19 Aug 2025 09:23:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHye-00000009qT7-3xVv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 08:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1D125C5B99;
	Tue, 19 Aug 2025 08:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9847DC116B1;
	Tue, 19 Aug 2025 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755593155;
	bh=GPOYK31qtoIEKqYJTIvUmVftyya/G7B893eokpWAOLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJ7QZoRY+YfkgplaAKdBhgdnZ1mgxJVxtoeFh9f3bYPMFNOfzgh8l6gbK7MtCpkeG
	 Wr/LnrFaJ3P8ksQcW5/C0LcSxTjm/wAP4AsSQ3Hv4wzc168nDosYbTwdqQZcNiGoA8
	 cQpuQVLv0XukgdDeaAjpr6tf4lZEzRuMa/D0BnEJ09qoT1xJD0roVHgXNBp6JNz3aV
	 D23fJfH3JFwey5lsuExBf5/qMJpnJEQzR1RXuvks/4KdgcdZgRHyyO9E+ABU4N/Ij2
	 /wjiCT8oH6+mHA+s3DlErVhfAAwh8gWqcRwwoDXnYhik+0QhPMhOlTaPE80daWJE4P
	 lwPcZq08bSBiQ==
Date: Tue, 19 Aug 2025 14:15:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: dwc: Add vaux regulator
Message-ID: <qnbwtgsl23we56tzdt2bih644uqrojwssa7d73a3s7hpsfc3v2@4653fhoitmpz>
References: <20250819071630.1813134-1-hongxing.zhu@nxp.com>
 <20250819071630.1813134-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819071630.1813134-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_014557_099766_E9F14D04 
X-CRM114-Status: GOOD (  17.73  )
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

On Tue, Aug 19, 2025 at 03:16:29PM GMT, Richard Zhu wrote:
> Refer to PCIe CEM r6.0, sec 2.3 WAKE# Signal, WAKE# signal is only
> asserted by the Add-in Card when all its functions are in D3Cold state
> and at least one of its functions is enabled for wakeup generation.
> 
> The 3.3V auxiliary power (+3.3Vaux) must be present and used for wakeup
> process. Since the main power supply would be gated off to let Add-in
> Card to be in D3Cold, add the vaux and keep it enabled to power up WAKE#
> circuit for the entire PCIe controller lifecycle when WAKE# is supported.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../devicetree/bindings/pci/snps,dw-pcie-common.yaml        | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> index 34594972d8dbe..5283f51388584 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml
> @@ -262,6 +262,12 @@ properties:
>  
>    dma-coherent: true
>  
> +  vaux-supply:
> +    description: Should specify the regulator in charge of power source
> +      of the WAKE# generation on the PCIe connector. When the WAKE# is
> +      enabled, this regualor would be always on and used to power up
> +      WAKE# circuit.

3.3Vaux supply is already documented in the dtschema:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml#L179

So you should use that instead.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

