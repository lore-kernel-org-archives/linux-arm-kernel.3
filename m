Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B037DCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgJMEQyqLfGPgX4qhVj/B7aZ7t04e1dMSjt048C7fYA=; b=Y6rnRC9wpKTCceS0OdXWCCMOP3
	0kPtwfwWgvbtgHJn8uCMWSkqZubRmQ4YWm2QIR4zZh773qB7EV6DIEKlm/FQ1e+ph1n/NLPyOtJ+h
	nejW+GbIgHYa1FIKlULPWRioMTi8D3GH1pX0voqbXCxxGx7foHTUnzVNGJ25Q5FpKI1Hql8mPHWYs
	2B9V288ap121bwjh/WxsAVNngEKRKiUuQ+QubpTnAnHegPHrlWhdVOej17vyuq0Tqb6H8nMa9vQ5g
	5BxRFGTWOG9N7ILzuR1kvJs4oFuzrypGok0TbAxEzY/DZ8KWn4nuXWGv3wnUVNqLo3SO0KG9qZ6On
	b/gdGr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsBY-00000004x43-0Gbi;
	Sat, 20 Sep 2025 07:39:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsBW-00000004x3g-0jPA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 07:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21FAA4034F;
	Sat, 20 Sep 2025 07:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BC5C4CEEB;
	Sat, 20 Sep 2025 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758353944;
	bh=sj+tflV0kHMCbQri64zoVlUok5g2vfYMLDu5l5fnDk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcWCpoIdBnJQP1EH8pDFEfVUpO/FjhF+HkJ6O5IJjnMvPZpbw/6ALA7oZgM2IgqlA
	 7V/8MT0+ouzOobywMaXGXSdNC+YrDHREXR8uJ2AjMboT16AlMbHqATmNoA2azJLhJW
	 3eXdKBNACPQmZoRA9gYoo5bZ5L8uUTZMyZJG4ftt6TOPFpklyIDUZlZo4Xt17KsRlJ
	 TiSu11AysiAlG0uzUUik760u6vwF/olDV8647+ev2povbq70vDIPzSBku2dlQArjXz
	 LFaAjMDPWWVilbt/imqXyFgy3rFT2A+m+RDHLUrK+XFaXOyQoKNID5n0wKRCaGAoAj
	 oyd84F0gPK7ZQ==
Date: Sat, 20 Sep 2025 13:08:54 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] PCI: imx6: Add external reference clock mode
 support
Message-ID: <o3pajmedldkgpmqrnnnoz5nrbx6dz7vnodlpuc6tivbxvln6lf@nxuvdtqoixdx>
References: <20250918032555.3987157-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918032555.3987157-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_003906_253605_1D879AF4 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, Sep 18, 2025 at 11:25:52AM +0800, Richard Zhu wrote:
> i.MX95 PCIes have two reference clock inputs: one from internal PLL, the
> other from off chip crystal oscillator. The "extref" clock refers to a
> reference clock from an external crystal oscillator.
> 
> Add external reference clock input mode support for i.MX95 PCIes.
> 

Driver change looks good to me (except a nitpick that I reported, but I could
fix it while applying), but the binding patches need to be reviewed by the DT
binding maintainers.

- Mani

> Main change in v7:
> - Refine the subjects and commit message refer to Bjorn's comments.
> 
> Main change in v6:
> - Refer to Krzysztof's comments, let i.MX95 PCIes has the "ref" clock
>   since it is wired actually, and add one more optional "extref" clock
>   for i.MX95 PCIes.
> https://lore.kernel.org/imx/20250917045238.1048484-1-hongxing.zhu@nxp.com/
> 
> Main change in v5:
> - Update the commit message of first patch refer to Bejorn's comments.
> - Correct the typo error and update the description of property in the
>   first patch.
> https://lore.kernel.org/imx/20250915035348.3252353-1-hongxing.zhu@nxp.com/
> 
> Main change in v4:
> - Add one more reference clock "extref" to be onhalf the reference clock
>   that comes from external crystal oscillator.
> https://lore.kernel.org/imx/20250626073804.3113757-1-hongxing.zhu@nxp.com/
> 
> Main change in v3:
> - Update the logic check external reference clock mode is enabled or
>   not in the driver codes.
> https://lore.kernel.org/imx/20250620031350.674442-1-hongxing.zhu@nxp.com/
> 
> Main change in v2:
> - Fix yamllint warning.
> - Refine the driver codes.
> https://lore.kernel.org/imx/20250619091004.338419-1-hongxing.zhu@nxp.com/
> 
> [PATCH v7 1/3] dt-bindings: PCI: dwc: Add external reference clock
> [PATCH v7 2/3] dt-bindings: PCI: pci-imx6: Add external reference
> [PATCH v7 3/3] PCI: imx6: Add external reference clock input mode
> 
> Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml      |  3 +++
> Documentation/devicetree/bindings/pci/snps,dw-pcie-common.yaml |  6 ++++++
> drivers/pci/controller/dwc/pci-imx6.c                          | 20 +++++++++++++-------
> 3 files changed, 22 insertions(+), 7 deletions(-)
> 

-- 
மணிவண்ணன் சதாசிவம்

