Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F9EC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADx1gBJd+i0kQFNsWeKzJizPoigYcAbyJ2J0mmsvfAo=; b=RMPFQUHQU+moOWUcCgWGt5uo+g
	uIw5umGhZK0ppy6gqcqO6Ctv31JdYbS7iwVmWEdRC3ZHuL3ulVfojIqJzkZZ9KNsvsxGXcAn+ksQ3
	gsby9/idvWrOuc3ip/6hEp8Reuqp5EMvRmXwyW4+lefZ4cvrqXT7mId87xaNAmpeTZsBWY6Czp377
	JpAAW+OjA0Lxxr0olkc65JzWSyGscV5016volb0HGgQ3CxvKjCEkiLKk+O5r3+hSNprbCOK8yF1vs
	yVqb8+NYC7jgNNPsvjK3ihCBwz24Q3r8D7WcY2MikYxXtPdFpUA7KUFtzOoVbrRcYwVIk2JXiXwlg
	3YFleNXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K0c-0000000CavQ-04Ee;
	Thu, 17 Sep 2026 21:51:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7K0b-0000000CavH-1ptu;
	Thu, 17 Sep 2026 21:51:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1419743AB4;
	Thu, 17 Sep 2026 21:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7CB1F000FF;
	Thu, 17 Sep 2026 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789681869;
	bh=ADx1gBJd+i0kQFNsWeKzJizPoigYcAbyJ2J0mmsvfAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8ONJhXHxC+X/t24/AiGf5UNJe1DNBUoULGuS5RcwKM9CaNihbEHnweehLB5fAM3a
	 4pBl12Jdjyg6Cb/ghE1h2ZmpiRB8SvoUiBSYp9RlN+d1CJ1Du7YkkbSVgHDQ9doUwH
	 wB5BkDlkfq5IeCABocbIr7L4mpnGbaB9c/KatqkYsvLZ4RzVzq3BihUwVnvvWbTyze
	 D23EfsHIdmp8SaxCz2HsP/9Fxkq4Nq9a/sBoMDMSN8U/GT3nIqvPS4THu454PvmuZG
	 9XxOdec0CjDIeG8+CzZIO/N/yUseauC0t04877qKYjb8fCxvs8Jc5I/EcBR3xscijt
	 U5sgNLPBAaUmA==
Date: Thu, 17 Sep 2026 16:51:07 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
Message-ID: <20260917215107.GA3884839-robh@kernel.org>
References: <20260901125819.20378-1-ansuelsmth@gmail.com>
 <20260901125819.20378-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901125819.20378-2-ansuelsmth@gmail.com>
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

On Tue, Sep 01, 2026 at 02:58:17PM +0200, Christian Marangi wrote:
> Document support for AN7583 PCIe PHY used to make the Gen3 PCIe port
> work. Add the required register to configure the PCIe PHY and provide an
> example for it.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../phy/airoha,an7583-pcie-gen3-phy.yaml      | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> new file mode 100644
> index 000000000000..a8ec5ac781cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7583-pcie-gen3-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7583 PCI-Express PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  The PCIe PHY supports physical layer functionality for PCIe Gen2/Gen3 port.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7583-pcie-gen3-phy
> +
> +  reg:
> +    items:
> +      - description: PCIE G3 analog base address
> +      - description: PCIE G3 PMA base address
> +      - description: PCIE detection time base address
> +      - description: PCIE Rx AEQ base address
> +
> +  reg-names:
> +    items:
> +      - const: g3-ana
> +      - const: g3-pma
> +      - const: xr-dtime
> +      - const: rx-aeq
> +
> +  phys:
> +    items:
> +      - description: phandle to QPHY phy for Gen2 support

A phy for the phy... That's kind of odd. It there some reason the gen3 
and gen2 phys aren't both linked to the PCIe host and controlled from 
there? Doesn't look like there is any interleaved or cross 
initialization needed to handle these in one place.

Rob

