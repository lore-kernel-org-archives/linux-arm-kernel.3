Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6660EEF312
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JW4XlQ0rV1IX8lkg3a43HdZ3oVVk49ezi6zsWKM/Ons=; b=z8KbFpZko1xc3V/+lUQbG9Yy4v
	rVT/6S5v32B7go+5d46z9CKV32Xuqn10JbrEZAicrM/X7sVpHCprFacsSigTRlhSVp9Vui1aTIF6m
	QJYGw9u51hfaCQlZNGSfLFWVpBvJYvz1bBZmHMp97rVsr5wZVnzS7CF2cd57AiYcjPr+V31ZCPRUJ
	Ap+Bp8yTsjLJgf6rTwKwL+pZpqnkP7i5i4TADy6mxokY+ZVV73yxB3EQp/iaH4B8/C0myf5X/uzsx
	dLougp/up2gsHO72vepo20USg4AM8C21H6mgGPIqcR92ELu783vKKKNWmb/fHjHstl5GKuOY0Qbnv
	lGDvEuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3QB-000000016vp-2Hbw;
	Thu, 05 Mar 2026 07:46:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Q9-000000016vH-0xDV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0122743F75;
	Thu,  5 Mar 2026 07:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777D2C116C6;
	Thu,  5 Mar 2026 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696815;
	bh=NaRIJK+9E3Xt1qmxieZYZj0jw25dQ/vq0Tp6eNlWHz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGPXzrEsSpxrCo30Nx3IkTPqMVPG4L2EGfnCeG91xBWKkBlmEosbSNuMBKw8cXhTD
	 fLxONRS7c8tDbFsFAxJsollNcDydST836ln6TQCJ0e/OvaDQRg9ydytTP/TFAWNiPq
	 K+mE4FJoM7TVoMcVcy2u+fxmsmF1bRKvEwRgzSsQONC9Ci4qNoQQ8+ma9vRI6vv6Rx
	 lLsotgReTWa9g+2XXXaJBhe8Y6NS+vOb9XHiQ6D8Q7Fw/udP/ou3CmIOv9S341Ma+/
	 Ydaa6TxF1lm1j0PM3JD69wWwbFz4w/HfVirnmuWQFWoGps7iZL/K0aM2HPy095paos
	 1Pfbo/obSe+gA==
Date: Thu, 5 Mar 2026 13:16:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 3/5] PCI: qcom: Add .get_ltssm() helper
Message-ID: <tesrw4icg2gnlxqfgigondqet4okvm3eokuw5phl3e5ozzzwxj@ktbka4nxsluc>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-3-89b322864043@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-3-89b322864043@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_234657_283495_5C6F3409 
X-CRM114-Status: GOOD (  14.83  )
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

On Tue, Feb 17, 2026 at 04:49:08PM +0530, Krishna Chaitanya Chundru wrote:
> For older targets like sc7280, we see reading DBI after sending PME
> turn off message is causing NOC error.
> 
> To avoid unsafe DBI accesses, introduce qcom_pcie_get_ltssm(), which
> retrieves the LTSSM state from the PARF_LTSSM register instead.
> 

You completely missed describing the helper here and where it is used.

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc75fca1b123e70715e692a91a9135..2c4dc7134e006d3530a809f1bcc1a6488d4632ad 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -131,6 +131,7 @@
>  
>  /* PARF_LTSSM register fields */
>  #define LTSSM_EN				BIT(8)
> +#define PARF_LTSSM_STATE_MASK			GENMASK(5, 0)
>  
>  /* PARF_NO_SNOOP_OVERRIDE register fields */
>  #define WR_NO_SNOOP_OVERRIDE_EN			BIT(1)
> @@ -1255,6 +1256,15 @@ static bool qcom_pcie_link_up(struct dw_pcie *pci)
>  	return val & PCI_EXP_LNKSTA_DLLLA;
>  }
>  
> +static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct dw_pcie *pci)
> +{
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	u32 val;
> +
> +	val = readl(pcie->parf + PARF_LTSSM);

Newline

- Mani

-- 
மணிவண்ணன் சதாசிவம்

