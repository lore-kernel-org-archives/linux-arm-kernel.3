Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA9C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NbFmGRL+DFWpJhLrxNldLv/oXQ0zjLejhLY/pDKR2U=; b=dC0y+6YBgcIDrRfXdIJ87Xkf3c
	GwGpZ6ztQ9pC/9yDoemzTogfmBE9vl5WujsY0NphcRRklIvzUJFqbJQVcu7/hrhDol9Cc/J8RlMcG
	vCXSt+rPcUINle9Sr9EIGw3lwWX+O3UceaKCs2GyhrFEqgasrsDWpu+5vBwJM20sWJTG5uvGsDRxf
	myZp8TA5+DI7Hj0MF4nC9ZHfuL2VRgKQoUNNr1wAP9tVE15YeJaTNwZsqjrJqtRZ2yxKqtLfjASFP
	HThHE+50fyEBT54vG+IEVMrrHEe+Obe2Ha8uSaDyrPJiUyeVEVt6ZmpR0sSHCuovbRAKuafx5RKgk
	Frkzl+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnTV-00000006jsR-39qE;
	Mon, 20 Jul 2026 12:52:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnTU-00000006jsE-1vf7;
	Mon, 20 Jul 2026 12:52:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7C154192F;
	Mon, 20 Jul 2026 12:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8381F00A3A;
	Mon, 20 Jul 2026 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784551919;
	bh=7NbFmGRL+DFWpJhLrxNldLv/oXQ0zjLejhLY/pDKR2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTX3EbeHXY2kGexsywwF78WG7NqBTfzKJqMqDKHVVjZnH1EexAo7I4eDQG86iOrAX
	 mz5KzDBOBHms3gwIwzER4Z5y2Mi6h/65ywmrL55Ue6nZbxixoK8HSQE6dSbRyQfhA5
	 U8kV+t1MtkTjWiMC512cc4AeaBPaFOtfJKNEOxAIDQi6/8jAR1EIpmBAVFYKOGrF96
	 HSrTp3mrd+krZlCoIue4CKbKJDKyBSlh9GcbGNHDr0anjjKV8Z4q1O1p+ce8/MYxuk
	 faLdaSxd54O+cvOvc34RNu0jAdnF6sVmGA79YtkGC2izi9fVWtlou6YowFRUofOQkc
	 gEvSrnY1VbaXQ==
Date: Mon, 20 Jul 2026 14:51:52 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND] dt-bindings: PCI: mediatek-gen3: Allow
 memory-region for restricted DMA buffer
Message-ID: <fgnu3itbp5wpnh23i3qafvku64ny33rwrncpjwd3cuwh6ipvt6@vujjmoikotht>
References: <20260720092116.1823562-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720092116.1823562-1-wenst@chromium.org>
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

On Mon, Jul 20, 2026 at 05:21:15PM +0800, Chen-Yu Tsai wrote:
> On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> controller memory access could be limited to a small region by the
> firmware configuring a memory protection unit. This memory region
> must be assigned to the PCIe controller so that the OS knows to
> use that region. Otherwise PCIe devices would not work properly.
> 
> Allow the memory-region property with one item pointing to a
> restricted DMA buffer.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Can we get this merged for v7.2? A matching device tree change was
> already merged in v7.2-rc1.
> 

This is not a bug fix, so not sure if this patch can be applied for 7.2. But DTS
change getting applied before the binding change was a mistake first of all.

- Mani

> 
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index fbc0378392d4..b88717dec1fa 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -116,6 +116,10 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  memory-region:
> +    maxItems: 1
> +    description: phandle to restricted DMA buffer
> +
>    mediatek,pbus-csr:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
> -- 
> 2.55.0.229.g6434b31f56-goog
> 

-- 
மணிவண்ணன் சதாசிவம்

