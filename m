Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E84EEF316
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgZ+RIWY3eB9qYzhsZqkcwzK6/MpvbcTMTMZUCtLcNc=; b=4nJ3c62FNtd8QloMekXh0KCSrC
	A9rIWrhQ5nlic9usZGv9qbGYvlryBkrAl5n0eOr+Q9oWBYDZo8p1zM8n4pQu+mAPVf6Is/ijS6NQb
	xs6IeVL+E2DH7FqHSSUacWhTaWpOO8duI+W6LkMnzX2WMSs1CX/qtrptIEwNy5N23x9BMYoz396Uo
	56Iu8V/yZS34N7jjZBTDKrEutk/X0BC5fl8l07eGLSAO/lIxt2tQu/tXBHxcumTnT1+ZMTD0Hbo+Y
	nhl1KXDkNkCWtVCyboBOe5F1uaRMJN4KEqnrqfQ3qE6voi14NNs4VH7tyHuPlibS3IYgDhssIrUUf
	SQDvTL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3c3-000000018xD-2cmJ;
	Thu, 05 Mar 2026 07:59:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3c0-000000018wq-483C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76E77445B1;
	Thu,  5 Mar 2026 07:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6616C116C6;
	Thu,  5 Mar 2026 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697552;
	bh=mM3OjQ33S9TQppKsWWyKBLl8eCLt4XCfC08emeBfuqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjssJ6aLg8dT7xUstr9c/ZnzaYyKi7sI/j7A0qr8qZHrKwFfrZvtf2Xfb+6UN3nhU
	 q1m+lNAt/BUmY4C+UV9GIOylGVrXbgQLWZf395SV7xk1xW8vi/Hho1sB+McNeSwAFb
	 F8OkJfROXIq/Z+liGDyZK07vsG+NQ2CWGY1w8rKnWAVUS1SrxpVKTj3XOEW7grgCyP
	 CisCZDfUEwBQuvs89Ol1dgUR3Mil53vH7zUH919FFdDVxOCWVUAE7JZqJB1InlXdol
	 jGrhlwu6VPUZkoTvspMPKLfixAX0Agkth+auQxoKcNIO0Sx/HWb74C8aQRYBC2qePe
	 81BZ0DzM8CWTA==
Date: Thu, 5 Mar 2026 13:28:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add D3cold support
Message-ID: <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_235913_089051_EE3D0D1E 
X-CRM114-Status: GOOD (  21.59  )
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

On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
> Add support for transitioning Qcom PCIe controllers into D3cold by

You cannot transition a 'PCIe controller' to D3Cold state, but only the
endpoints and bridges.

> integrating with the DWC core suspend/resume helpers.
> 
> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
> into the DWC host operations so the controller follows the standard
> PME_TurnOff-based power-down sequence before entering D3cold.
> 
> When the link is suspended into D3cold, fully tear down interconnect

You cannot suspend a link into D3Cold. Link and D-State are different.

> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
> by keeping the required interconnect and OPP votes.
> 
> Drop the qcom_pcie::suspended flag and rely on the existing
> dw_pcie::suspended state, which now drives both the power-management
> flow and the interconnect/OPP handling.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
>  1 file changed, 74 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -145,6 +145,7 @@

[...]

> -	if (pcie->suspended) {
> -		ret = qcom_pcie_host_init(&pcie->pci->pp);
> -		if (ret)
> -			return ret;
> +		ret = icc_enable(pcie->icc_mem);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
> +			goto disable_icc_cpu;
> +		}
>  
> -		pcie->suspended = false;
> +		/*
> +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
> +		 * connected to the PCIe link.
> +		 */
> +		ret = dw_pcie_resume_noirq(pcie->pci);
> +		if (ret && (ret != -ETIMEDOUT))

No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
failure. If the device is not found, it will return -ENODEV. So you should
fail the resume if -ETIMEDOUT is returned.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

