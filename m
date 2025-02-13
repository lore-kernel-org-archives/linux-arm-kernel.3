Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BC1C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBdecmRaKjJxoYJbG5076Xi0RKmSnY0MwpPJh2bpw2o=; b=nvfMRb9YnapNz3DWCVpx+NMWZu
	veRVZYKP3dXztacgoN5ZzgamSGrqc5UU6v22rBnR9SJlTP3ZrJ0J4e1sTyKquSyNgLeZumH9mD5CY
	jWm/nJvm76uMHQQ1NljbEu//D45qVHVtmDXoE5bsGSaFz3zTG2fMwjNLnzj4kqysIZdXEq4kW2gT1
	lys5CX04ca575OJKGxIt3QFbFHPNgJ6mvBoMHRr+z8FkJikSQO8L4bMMM2zi8RJL9/dVi9iauwv/u
	loHfdd0ZEJdQiVyfynn3KFVTtCP/c8vcMAzgdSVLERP5bE7DzD8rgFDJTdS11CJhGHxj7LGTbvWDl
	zGoILfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU6r-0000000ABjk-17YK;
	Thu, 13 Feb 2025 07:58:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU33-0000000AAuZ-21eY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78A795C041E;
	Thu, 13 Feb 2025 07:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B991C4CED1;
	Thu, 13 Feb 2025 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739433252;
	bh=56Ta27lSOpZW6WT1dfipytAfcqD14QNHO7m6Mo7UhBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkKfm+0z1/NQtvj5DekG7tlgJXv7KvTYjV7uBiZCErsGUfI88dj0z4vErZav2EL04
	 H9SIpabXaoUXbWxWg/s9f/pJaJW/ux2aWLSHp/Ud3SkJGU5QW91S2oY052y1q57ohM
	 TFw0DXIBakxQmtCdF4c/xrs3SGT0kHWTIl5NT1CaV9ycuzmTyO+WZVuHFD6BDLDHF7
	 DWnCV9GdRsg13axmldqBa1yZ5sx0bTnDw5syFgZYGB4/k71TZChpkQc2ieAJfaBfBZ
	 T5APTSqFiLrYNV4UFPgdPGmN8utVYIWp++nRPuYHcmeH1iTwpZn/E/YOFXWguOcKUj
	 RGy9TQHVMsG2Q==
Date: Thu, 13 Feb 2025 08:54:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swathi K S <swathi.ks@samsung.com>
Cc: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: net: Add FSD EQoS device tree
 bindings
Message-ID: <20250213-adorable-arboreal-degu-6bdcb8@krzk-bin>
References: <20250213044624.37334-1-swathi.ks@samsung.com>
 <CGME20250213044955epcas5p110d1e582c8ee02579ead73f9686819ff@epcas5p1.samsung.com>
 <20250213044624.37334-2-swathi.ks@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213044624.37334-2-swathi.ks@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_235413_625963_82AC852C 
X-CRM114-Status: UNSURE (   8.86  )
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

On Thu, Feb 13, 2025 at 10:16:23AM +0530, Swathi K S wrote:
> +  clock-names:
> +    minItems: 5
> +    maxItems: 10
> +    contains:
> +      enum:
> +        - ptp_ref
> +        - master_bus
> +        - slave_bus
> +        - tx
> +        - rx
> +        - master2_bus
> +        - slave2_bus
> +        - eqos_rxclk_mux
> +        - eqos_phyrxclk
> +        - dout_peric_rgmii_clk

This does not match the previous entry. It should be strictly ordered
with minItems: 5.


> +
> +  iommus:
> +    maxItems: 1
> +
> +  phy-mode:
> +    enum:
> +      - rgmii-id
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - phy-mode
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/fsd-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ethernet1: ethernet@14300000 {
> +            compatible = "tesla,fsd-ethqos";
> +            reg = <0x0 0x14300000 0x0 0x10000>;
> +            interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "macirq";
> +            clocks = <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_ACLK_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_HCLK_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I>,
> +                     <&clock_peric PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I>,
> +                     <&clock_peric PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK>,
> +                     <&clock_peric PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK>,
> +                     <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
> +                     <&clock_peric PERIC_EQOS_PHYRXCLK>,
> +                     <&clock_peric PERIC_DOUT_RGMII_CLK>;
> +            clock-names = "ptp_ref", "master_bus", "slave_bus","tx",
> +                          "rx", "master2_bus", "slave2_bus", "eqos_rxclk_mux",
> +                          "eqos_phyrxclk","dout_peric_rgmii_clk";
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
> +                        <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
> +                        <&eth1_rx_ctrl>, <&eth1_mdio>;
> +            iommus = <&smmu_peric 0x0 0x1>;
> +            phy-mode = "rgmii-id";
> +       };

Misaligned/misindented.

Best regards,
Krzysztof


