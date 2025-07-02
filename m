Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EB4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCQ83PxPnhzM79jqwekLWTDw97Z3CedXUielu3/kW4Y=; b=QAYpeqacy0XC6EvORP89qfAOU2
	rkHYCTQtg2xdjx7uUICn1o49HejzfxINEe/v1yeXvYzUMOf7NJtUL38oBpq6ft+7zoyCwklC4CI+n
	hJf9gRJAtXkeYsDCnvkNmcihmX/AzI4R4bSOiSowi0TRbmIjgWKkmu53anjLlddezYt5DHt1i9NQ7
	/Kx0B+OP1QH1i19xrFUzImh6eFDEtjAlfmD05qIrAKqUpFBdcyn6XGFki9AB2e5Ir8LzOg6r3VxXi
	mcRtOu6y1FjhFghRpP4kkyX/rG7PcUlacf8ZPzN/lb/FuFWLEBsPghRDXrFb5slhBvW/A8b0DSCbf
	j7j/rhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyYI-00000008dno-1Ddq;
	Wed, 02 Jul 2025 14:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPu-00000008R7U-3Yji
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HCQ83PxPnhzM79jqwekLWTDw97Z3CedXUielu3/kW4Y=; b=J9FR7SH+vixijSNjnfkyIvLbAI
	Cyih8dX4tuWm7BppQjBWUucRjuTUPDq2EQLXNv3Y6bVmnVd/kOSq18onJTN0LCpGWHLRasutc/c3k
	iLeeiuxhPp+xAQAng99lC4XDZCznFmOK35YJe9HKTWsfIKiUZQEHowJ7XyGQLUQKd8AbP/0nLNNhT
	6pTNpJmyN43FxWz7lpCJlgmvc55G81aw3td4eLL//Ras/EJYeFq2/S4rQR+NV8lLqjeoF5peBU4gw
	wLWNGazda80Q1gCPpUwbqKCWeVIZ1AoS8e/9Q4GPjam/QeFXHVJE4mHuZLVS6cECK8HBKaqBADZ2M
	B9t1cVRA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPr-00000007PO6-2SNR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B000143509;
	Wed,  2 Jul 2025 13:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4762C4CEF2;
	Wed,  2 Jul 2025 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462541;
	bh=+F+WeI0oEJBGsbflJro9BGxIEygspR5aMMF725YqjYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2u8efaZ7FVf5+05KuTyWvyE/L3l04+Hwi6w2URjIz4j15idOzOBWyKp8DT1RESXw
	 VUoay1cpjze3DfM4cZ4e7ZpaZzYgcB4NCRsHO4ZXCyjm2prJ872S77wk3D4oB6Wk5O
	 n06ZmS5KDPRp6o/UExgePsja02Oad+EqfAe0s1u9X34esJIlXfcBUgCYPNF1ZqRAjJ
	 NWiXow+CodmA9L8ooyz+6yBASfC5VFmb+lR7Oi1+pdndNw5irQ+dPOShn13++Qe81h
	 ivsSvjRmgo8U9ijzFIoEGWImg6+huvTj3kcRpCGhPzDzt8dneygx2LbxjwaykP6t5C
	 FfmjZPv67/nvw==
Date: Wed, 2 Jul 2025 18:52:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 09/10] pci: imx6: Add LUT setting for MSI/IOMMU in
 Endpoint mode
Message-ID: <tovqcf6mjrajaie26t7gvl6uuoniqyturogzyaef6bksjm2nux@ggsmbgudgf7n>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-9-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-9-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142224_052214_8610C813 
X-CRM114-Status: GOOD (  21.95  )
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

On Mon, Jun 09, 2025 at 12:34:21PM GMT, Frank Li wrote:
> Support only one physical function, so call imx_pcie_add_lut_by_rid(0)
> to add a single LUT entry when operating in EP mode.
> 

So previously LUT config was not present and endpoint mode continued to work?
Please explain why this is necessary now.

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v14 to v16
> - none
> 
> change from v13 to v14
> - new patch
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 032b906c44dfa..3123bf49e209c 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1063,7 +1063,10 @@ static int imx_pcie_add_lut(struct imx_pcie *imx_pcie, u16 rid, u8 sid)
>  	data1 |= IMX95_PE0_LUT_VLD;
>  	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, data1);
>  
> -	data2 = IMX95_PE0_LUT_MASK; /* Match all bits of RID */
> +	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE)
> +		data2 = 0x7; /* EP side's RID from RC, only 'D' is meansful */
> +	else
> +		data2 = IMX95_PE0_LUT_MASK; /* Match all bits of RID */
>  	data2 |= FIELD_PREP(IMX95_PE0_LUT_REQID, rid);
>  	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, data2);
>  
> @@ -1767,6 +1770,9 @@ static int imx_pcie_probe(struct platform_device *pdev)
>  		ret = imx_add_pcie_ep(imx_pcie, pdev);
>  		if (ret < 0)
>  			return ret;
> +
> +		/* Only support one physical function */
> +		imx_pcie_add_lut_by_rid(imx_pcie, 0);
>  	} else {
>  		pci->pp.use_atu_msg = true;
>  		ret = dw_pcie_host_init(&pci->pp);
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

