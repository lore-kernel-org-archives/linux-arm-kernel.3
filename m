Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27993106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+u9n72407HbV0/IU3KyWpaUKVrk3dZ7F6zx2JET5Ag=; b=OqJbi6XTG1sfnUk9MzTHZS5OUW
	FV6lfolXkXlBMmby7dJAj4qaJOBVyY2XuNioQjAbFqprNmmSHfhL/y87C14Zo5Ao6KHpUGgwW0U3I
	aUZFnzJizIUMUlHZtlZF+E2xmWvMLmToU5ucXJ40RQM1bpa9bBPnGx45F8hG8xRZBB7HndaM4Wf8E
	ab1OyBxYoyXa/Xi5vlx1Pud22nfqfgvL4Zo4Lckg0eZxFZPCb36wT+ejVxmdPvd4Vxqup1GrKq8Bz
	9DmXPcM0NP3Jl2xclakffHaXMnCRGSZTr5BoFPQziUYhgak4K4frqQRQt5ZttGFwHJy0J/PV9ojq4
	kxXZpQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xBt-0000000H5kN-1NTx;
	Fri, 13 Mar 2026 07:44:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xBj-0000000H5i0-1lkB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2248F41ACB;
	Fri, 13 Mar 2026 07:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E673C19421;
	Fri, 13 Mar 2026 07:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773387843;
	bh=SuuVqegA/33poKUIo+8Piflrjkh8l82BMylhQkbrQMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVN9dK2Wt6gzqtAbWFZfFShdlD0JySopPcnvWeXDzIAzdMEiVT8h5r63zkebb0WYS
	 6E3x6FrrevN7U1P5wAu4yxPdH5b9enBMuS6qugsxiKdFUNVOt2agQ/na+m2zEcdF0/
	 G3Lk6LMXD6vTSo20e4f/Bh1w7FnjgbuAKhU4JXTQS57Cvfz+iF34teVz0180bXQ51H
	 S5ABSN4+lfgLQmD3urPD8zu1/8eZQ/BWQGSwKAO/hVTSMQcrmMiqNnDnrcGZvf7Gan
	 q4z0z5b6cDQLY30EpWalU0ThWUt1ZV33KBNyvM6zjjGTn88GARALIwnEqy464zPC+w
	 EGp876XlQTYzQ==
Date: Fri, 13 Mar 2026 08:44:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] dt-bindings: PCI: imx6q-pcie: Add i.MX94 and
 i.MX943 PCIe compatible strings
Message-ID: <20260313-real-dangerous-dove-46cdca@quoll>
References: <20260313051718.1931375-1-hongxing.zhu@nxp.com>
 <20260313051718.1931375-3-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313051718.1931375-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_004403_480824_BFDD7DAF 
X-CRM114-Status: GOOD (  12.13  )
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

On Fri, Mar 13, 2026 at 01:17:15PM +0800, Richard Zhu wrote:
> Add i.MX94 and i.MX943 PCIe compatible strings and fallback to
> i.MX95 PCIe compatible string.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie-ep.yaml       | 24 ++++++++++++----
>  .../bindings/pci/fsl,imx6q-pcie.yaml          | 28 ++++++++++++-------
>  2 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> index 0b3526de1d62..f404b36f8915 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> @@ -18,12 +18,20 @@ description: |+
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mm-pcie-ep
> -      - fsl,imx8mq-pcie-ep
> -      - fsl,imx8mp-pcie-ep
> -      - fsl,imx8q-pcie-ep
> -      - fsl,imx95-pcie-ep
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mm-pcie-ep
> +          - fsl,imx8mq-pcie-ep
> +          - fsl,imx8mp-pcie-ep
> +          - fsl,imx8q-pcie-ep
> +          - fsl,imx95-pcie-ep
> +          - fsl,imx94-pcie-ep

Why random order?

Best regards,
Krzysztof


