Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972BDC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CosVwsX/luhEgGj6jXKdHBmajmmqIeNV8lEvVwyuJV8=; b=fMKNcOhbsO5xGE0+TlV2Tx33Qf
	ALiZEU7drsVnhjyuLTgpC5b1PvlTT0AFP/v8DQSnoBBdQC8//Qk1rMatyEnPwDuAABQmX2ZljAmnf
	ZaLnbsILui43Pi5wOEwqsYUjY1qAHJwEMYS3EWEKDO91qMPz+H5tUsUDFAeP0jf4KIMwsilZY+0fc
	+TCdh+NFBm6rZtNJJSjEQ0rrqjyPd2fhZ5UVEcJMy0CBgnu4+MyRFdw14HOxIO3ttAPG95u988Qp2
	iddAOXb+KXmbR32zOpC/8WzOeeqRUdPR5+KF0myyhCQAn8o3EEtTLbSKB4y9xF2ud/g56gV/D4xxG
	eVv44gVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjKS-00000003HXH-2bHw;
	Mon, 23 Jun 2025 15:43:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg5G-00000002dsY-19V0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 12:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 526E86112D;
	Mon, 23 Jun 2025 12:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB84C4CEEA;
	Mon, 23 Jun 2025 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750680933;
	bh=pr2/No/guItEEsZxzpUA7Zdi/FU0THWZwck2JGVadcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfP7CoTyA8fu1qCwlWVPh5R8i5EG5GKmtcq50mO0Txd7ASAKCgT7eI5eLmmW4JRCD
	 bT2rk641NFiTtFeOu4W2WwvmiuTe5RvfdJPMiGkB0iGPunuNBVKnKXiSzYFzuwEUmy
	 Y3ATCjQJcuWGHBBP3JgbuaGB1TAqvg/Z2rDwEUkXRclqscxwUgb0gq9qUk8++07THf
	 z4g7+5C0syh+uUqEuOnWnD+NiPOG72Zjl1xrMfOwPPNLdfWmCJTUK7RrnNhylGJWQQ
	 o/hpBLdgYSVSDm1wyfKRXs4mNNU/8yi+GWV6tvk0v8xC71ViUdvIZntzgzEHjJCe8U
	 4KN6vgL3PYNSA==
Date: Mon, 23 Jun 2025 06:15:31 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	johan+linaro@kernel.org, cassel@kernel.org, shradha.t@samsung.com, 
	thippeswamy.havalige@amd.com, quic_schintav@quicinc.com, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 7/9] arm64: dts: st: Add PCIe Root Complex mode on
 stm32mp251
Message-ID: <vhzu4e233bulwq3jwozctvxzg2ib5j7n6axfneltznnqi453np@npbx44uvccdd>
References: <20250610090714.3321129-1-christian.bruel@foss.st.com>
 <20250610090714.3321129-8-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610090714.3321129-8-christian.bruel@foss.st.com>
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

On Tue, Jun 10, 2025 at 11:07:12AM +0200, Christian Bruel wrote:
> Add pcie_rc node to support STM32 MP25 PCIe driver based on the
> DesignWare PCIe core configured as Root Complex mode
> 
> Supports Gen1/Gen2, single lane, MSI interrupts using the ARM GICv2m
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 8d87865850a7..781d0e43ab59 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -122,6 +122,15 @@ intc: interrupt-controller@4ac00000 {
>  		      <0x0 0x4ac20000 0x0 0x20000>,
>  		      <0x0 0x4ac40000 0x0 0x20000>,
>  		      <0x0 0x4ac60000 0x0 0x20000>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		v2m0: v2m@48090000 {
> +			compatible = "arm,gic-v2m-frame";
> +			reg = <0x0 0x48090000 0x0 0x1000>;
> +			msi-controller;
> +		};
>  	};
>  
>  	psci {
> @@ -1130,6 +1139,41 @@ stmmac_axi_config_1: stmmac-axi-config {
>  					snps,wr_osr_lmt = <0x7>;
>  				};
>  			};
> +
> +			pcie_rc: pcie@48400000 {
> +				compatible = "st,stm32mp25-pcie-rc";
> +				device_type = "pci";
> +				reg = <0x48400000 0x400000>,
> +				      <0x10000000 0x10000>;
> +				reg-names = "dbi", "config";
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 7>;
> +				interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> +						<0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +						<0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +						<0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
> +					 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
> +					 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
> +				dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
> +				clocks = <&rcc CK_BUS_PCIE>;
> +				resets = <&rcc PCIE_R>;
> +				msi-parent = <&v2m0>;
> +				access-controllers = <&rifsc 68>;
> +				power-domains = <&CLUSTER_PD>;
> +				status = "disabled";
> +
> +				pcie@0,0 {
> +					device_type = "pci";
> +					reg = <0x0 0x0 0x0 0x0 0x0>;
> +					phys = <&combophy PHY_TYPE_PCIE>;
> +					#address-cells = <3>;
> +					#size-cells = <2>;
> +					ranges;
> +				};
> +			};
>  		};
>  
>  		bsec: efuse@44000000 {
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

