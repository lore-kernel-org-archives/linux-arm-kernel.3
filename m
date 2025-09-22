Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19304CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqswoQ/SW++SzOASNIsNm5sMpLVuxYt53hj6+u9n0W4=; b=uqY6CqzbQnFL9ZkDCAq4CZ3fnd
	9JkC/huj17IjXH6RBGM53m3nF1PAkjCgeVfirAkPMZgRUi8o8d2o8SsyweO6KsIasKoKCJeJZxLaB
	Tai0wmeALjJu1qW5Lhu+JXTeJczCeHHmD0ByEiciRYaRf6lY61jzq7u/3HeL6+jRL/zYloNSyMc8h
	XzK7hkLnYV8Waj1gY6qpVl3JL/Gd/kxkD6PcOKnZ78KJJ10RzLXhKmAxhqNEqZjudnbMBtbY70Uet
	ZgoqAfXrEdfEon5CX4O/BE2Crl9gjW6VTx3GfNvHjFjUsC9CHIvhlYf+JLobbu3B/+KblnAcR21Cv
	i2XUOMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ZvM-00000008wbX-3ivB;
	Mon, 22 Sep 2025 06:21:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ZvL-00000008wbN-3bwP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 06:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E38360147;
	Mon, 22 Sep 2025 06:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0344CC4CEF5;
	Mon, 22 Sep 2025 06:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758522079;
	bh=eoFLH+PsSdyp4SGdZ6FacLOobyF33z0eyFcT731wQJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5bk4DNTrF+fVQt7Y4vSJDQSLniwAcB1wt81kInI24cqVmOK8zXroa7j4dVWfcwVl
	 v5WQjcnGafariu5UTDAmyjc31ph71NhaoGpdtNNOry+j7rWUUOf2mlv1nCiAknwJes
	 2VvcDleMFWUAAs3lP0LCjILv8DxMaKZmKy/HDnM6N3ux1bVsi8ZRviCN7qX8jbF7Uj
	 8PCwZDBR0/9vLvw3zKvBiQ9bCzIc67+j4gByspw2cSXwpZS8Nm/vu/AaTcS6YINWRX
	 hcEBY4IW9mNIZcju+o3X672Xe3cnVPMc7Xl2gmSm/w2Y6zmFrEkxA3RQHYQ6fFsyAO
	 Iv0rWyUzUMQjg==
Date: Mon, 22 Sep 2025 11:51:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	Frank.li@nxp.com, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250919155821.95334-2-vincent.guittot@linaro.org>
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

On Fri, Sep 19, 2025 at 05:58:19PM +0200, Vincent Guittot wrote:
> Describe the PCIe controller available on the S32G platforms.
> 

You should mention that this binding is for the controller operating in 'Root
Complex' mode.

> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> new file mode 100644
> index 000000000000..cabb8b86c042
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/nxp,s32-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2xx/S32G3xx PCIe controller
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ionut Vicovan <ionut.vicovan@nxp.com>
> +
> +description:
> +  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
> +  The S32G SoC family has two PCIe controllers, which can be configured as
> +  either Root Complex or Endpoint.
> +

But this binding is going to cover only the 'Root Complex' mode, isn't it?

> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-pcie     # S32G2 SoCs RC mode
> +      - items:
> +          - const: nxp,s32g3-pcie
> +          - const: nxp,s32g2-pcie
> +
> +  reg:
> +    maxItems: 7
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: dbi2
> +      - const: atu
> +      - const: dma
> +      - const: ctrl
> +      - const: config
> +      - const: addr_space
> +
> +  interrupts:
> +    maxItems: 8
> +
> +  interrupt-names:
> +    items:
> +      - const: link-req-stat
> +      - const: dma
> +      - const: msi
> +      - const: phy-link-down
> +      - const: phy-link-up
> +      - const: misc
> +      - const: pcs
> +      - const: tlp-req-no-comp
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - ranges
> +  - phys
> +
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/phy/phy.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pcie@40400000 {
> +            compatible = "nxp,s32g3-pcie",
> +                         "nxp,s32g2-pcie";
> +            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
> +                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
> +                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
> +                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
> +                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
> +                  /*
> +                   * RC configuration space, 4KB each for cfg0 and cfg1
> +                   * at the end of the outbound memory map
> +                   */
> +                  <0x5f 0xffffe000 0x0 0x00002000>,
> +                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
> +            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
> +                        "config", "addr_space";
> +            dma-coherent;
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            device_type = "pci";
> +            ranges =
> +                  /*
> +                   * downstream I/O, 64KB and aligned naturally just
> +                   * before the config space to minimize fragmentation
> +                   */
> +                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,

s/0x81000000/0x01000000

since the 'relocatable' is irrelevant.

> +                  /*
> +                   * non-prefetchable memory, with best case size and
> +                   * alignment
> +                   */
> +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;

s/0x82000000/0x02000000

And the PCI address really starts from 0x00000000? I don't think so.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

