Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2660C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TMAtAxaZlVFnmI+kVQF25xT/SS/PfYs97MUHzdfJtg=; b=MyiG68delgKgPVHzFfe8dYGMbO
	sQSL46uz1ygcSEdZnOwa9/G/I0OqB2BgazMJtFF+Jj0G071fJNtLg+vNk47BqlAPVv/1DzwR/gOBb
	b8woiAoHZY6NtnuIULViCdGWmzy1Uecekn84QWpdexQ/1+UOqukTAdgbZqI3VTe7gqX5R4VDhAHZX
	k3xr6pBvYgPhuA4wR3oo2dScUCxX9wHJy2qkNIBlJJoTrG7ISeQdMPRiL2CfngGcXN4dxJotQGR5m
	ViSS7Sn37RlHku/pksFK1kRwVnVjUqaqssHZCKrp3r6zdKlE28oFAhjtFwylz53yNPgVVVPDhZFd8
	ivZUrYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjI8-00000003H5H-3jti;
	Mon, 23 Jun 2025 15:41:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg4w-00000002dni-3El9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 12:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C32735C5660;
	Mon, 23 Jun 2025 12:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14247C4CEEA;
	Mon, 23 Jun 2025 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750680914;
	bh=e99veYZUy79gCMXBdhcBd8vV/Ca+YIYh9vr/jO7tfPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDPRAB8x+L31MY/qA3EPZ/FsPe6E2LBHxsMfdHLpdaY9n1XFZRtyJBHYiW9RbRkcw
	 kt3nTgv4WTwMg1LQZ/wVpsbsRM1V4C1ibRrLhIlyVypVleKAhgYbakE6NzYT8cVJ9h
	 NB9TkI45eC+fxRHLIME/Sca94oRKSxuADXO0z8yIITHsWcjikKJuk/SOq1texRQtU8
	 QnNLBieQM7tKdYlhuNSkdJ0zDF4/5emPgaGe4u144tzUTGoPQAqpnsekIuauSEMaTa
	 hrWALF12f9AiP6XJKNMGeGzb2Bj8r7fr6QicvBJmFsA7wWRS6SUCGVORSsjyODlhve
	 B+h6cu+xb/sLA==
Date: Mon, 23 Jun 2025 06:15:12 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	johan+linaro@kernel.org, cassel@kernel.org, shradha.t@samsung.com, 
	thippeswamy.havalige@amd.com, quic_schintav@quicinc.com, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 8/9] arm64: dts: st: Add PCIe Endpoint mode on
 stm32mp251
Message-ID: <de275zjaafymohqbcao5tvk2bul5f3fvqgsla4yjfvvueg75yz@dpqh2vs3t6kg>
References: <20250610090714.3321129-1-christian.bruel@foss.st.com>
 <20250610090714.3321129-9-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610090714.3321129-9-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_051514_870053_0DEEA43F 
X-CRM114-Status: GOOD (  14.49  )
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

On Tue, Jun 10, 2025 at 11:07:13AM +0200, Christian Bruel wrote:
> Add pcie_ep node to support STM32 MP25 PCIe driver based on the
> DesignWare PCIe core configured as Endpoint mode
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 781d0e43ab59..23dcc889c3e8 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1140,6 +1140,21 @@ stmmac_axi_config_1: stmmac-axi-config {
>  				};
>  			};
>  
> +			pcie_ep: pcie-ep@48400000 {
> +				compatible = "st,stm32mp25-pcie-ep";
> +				reg = <0x48400000 0x100000>,
> +				      <0x48500000 0x100000>,
> +				      <0x48700000 0x80000>,
> +				      <0x10000000 0x10000000>;
> +				reg-names = "dbi", "dbi2", "atu", "addr_space";
> +				clocks = <&rcc CK_BUS_PCIE>;
> +				resets = <&rcc PCIE_R>;
> +				phys = <&combophy PHY_TYPE_PCIE>;
> +				access-controllers = <&rifsc 68>;
> +				power-domains = <&CLUSTER_PD>;
> +				status = "disabled";
> +			};
> +
>  			pcie_rc: pcie@48400000 {
>  				compatible = "st,stm32mp25-pcie-rc";
>  				device_type = "pci";
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

