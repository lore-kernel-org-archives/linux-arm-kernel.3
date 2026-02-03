Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34EDE87823
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HTsXkVNnFwulZq7/Mzu85XDAt0kGwDI4fDwb3UTvCI=; b=JPUja9JbZYjOxrjrJbJzOPLQrF
	koBHluGnHaRXcW3BqKoP/Lt91GP/xt2aEwkxHtvOVo41y7pUCHXPkS8mxSAjXNMT7zWe8x/y3tV04
	d5lq/psupPs2+4ZVN27Vy3HFurGj4q+6GY5kd/dLAeRDnGGzeDIpb+CLc3RLK5bwMOx1489jwihC5
	fD+12D5b3+GjyVNCfv4OdcEBfFclIoKuOfhbKdvW/mqgk77hZQfj9cugBPVjvtbQHVmec3sYXxP9R
	TEUIzhhYR+I8rH8Rcy7WtWRK0k63d9EY6HZLKSs09ZM8SgJrc27naQvD4Mg3mZid1IZxsb9llyqhr
	kfA+/D2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG9e-00000006ePb-3ZO4;
	Tue, 03 Feb 2026 13:09:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG9d-00000006ePQ-1qlt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CB6360132;
	Tue,  3 Feb 2026 13:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1A9C116D0;
	Tue,  3 Feb 2026 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770124156;
	bh=MSFiS/LmupV3YopiS8HKbsx3Kh/IjnAnq0VI5uK+094=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpl4q72CKM72QleOVs/y4d6Jr3g8fwYGdg8pMbFc5YKO0fDoWLxXx6xvuUpGWALjk
	 L6rYCMUN5y8sSyPqmfCBk3A5KhvI2afw1pNQYi9jBPeQ76WEQroLPdn3nQRdHqgcEP
	 Dbj5cdomtSt8ORq1W75qZaGhpYjiMBurxv/+I927aFbT08VSgL5aTVMmKpzaONSgE+
	 nFGdckTuwKGKIWLkxYdd70reXJ9izP7Z0O4iySe7c2kBQylg/b8LRh/CcW3RtPzNgM
	 n4oaxsZ0zTtRHXHzfmUYSrzUklSaARJK+fahiTYUurqjLK8OQXnMcHxPEOIgjGFrfL
	 MF0pYABAi2j3A==
Date: Tue, 3 Feb 2026 18:39:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 03/10] arm: dts: imx6qdl: Add Root Port node and PERST
 property
Message-ID: <mp25jwvoimpesfwtpmyeltdpbu7aznahxvkcn6jxg5jqzxck4i@pium66rnpdd3>
References: <20260203015614.2957479-1-sherry.sun@nxp.com>
 <20260203015614.2957479-4-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203015614.2957479-4-sherry.sun@nxp.com>
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

On Tue, Feb 03, 2026 at 09:56:07AM +0800, Sherry Sun wrote:
> Since describing the PCIe PERST# property under Host Bridge node is now
> deprecated, it is recommended to add it to the Root Port node, so
> creating the Root Port node and add the reset-gpios property in Root
> Port.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 +++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 +++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> index ba29720e3f72..fe9046c03ddd 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> @@ -754,11 +754,16 @@ lvds0_out: endpoint {
>  &pcie {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pcie>;
> +	/* This property is deprecated, use reset-gpios from the Root Port node. */
>  	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;

You should just remove this property.

- Mani

>  	vpcie-supply = <&reg_pcie>;
>  	status = "okay";
>  };
>  
> +&pcie_port0 {
> +	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pwm1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_pwm1>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> index 76e6043e1f91..eeb376193398 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> @@ -289,6 +289,17 @@ pcie: pcie@1ffc000 {
>  				 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
>  			clock-names = "pcie", "pcie_bus", "pcie_phy";
>  			status = "disabled";
> +
> +			pcie_port0: pcie@0 {
> +				compatible = "pciclass,0604";
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>  		};
>  
>  		aips1: bus@2000000 { /* AIPS1 */
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> index c5b220aeaefd..6b12cab7175f 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> @@ -45,10 +45,15 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
>  };
>  
>  &pcie {
> +	/* This property is deprecated, use reset-gpios from the Root Port node. */
>  	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
>  
> +&pcie_port0 {
> +	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>;
> +};
> +
>  &sata {
>  	status = "okay";
>  };
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

