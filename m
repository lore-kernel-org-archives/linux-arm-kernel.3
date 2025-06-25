Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E917DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTbzB/za1UQnn+kUpU46lafISnmXanpGM3OuDgiL6Vw=; b=Z/ISbUxMMvg0aL5ttVtyg4AhOE
	ZJ4h0sVGmCeu01NldpYjdaRf+F7qehw3JkVSaNvXarUOMWdfa1ZTKSB8Yq7BoF0fssCkGt7oUGUwe
	BRwvPWZ6YyAH+g44vgd8jJYJ3B4+3gVW12xFCcLaX9eR0mkZ8sMAHNIvT+1duYXG1u7bALM/j4QcK
	C2TOJOiIRC+6ypHlmAAS3zMlrOiLbtPJhtbYVNh6fs0M+/0P0dMQshsNexmwE3ds1t57IA1oQ/bx+
	WRniXL0+SVsVQ7gXSy8PboWVwvUw8ISKDpz+FWIuN3hAh21dPfF0nKuu3ZnRi33EopFKgIN1IAM1Q
	Mc4xOA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXNc-00000009wSW-2MVh;
	Wed, 25 Jun 2025 21:10:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV1I-00000009d30-37Or
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 18:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0497043F99;
	Wed, 25 Jun 2025 18:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC205C4CEEE;
	Wed, 25 Jun 2025 18:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876731;
	bh=V4icwH68waoexuc0mmtBEz2gMdcHNXDMILpxUOfQ1O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6Et6eypzNZPnzqhVij1b0Z1l7+8UhfT5ltLp664B5495JFelSrdHNreqHhXgyvK4
	 MX7zuLek+Ls02TdkUNwZhWIeQrxayIKaEDSsmb3OwxWW9jxRY3Fy2LYCJK8QRkg4mX
	 V8Uei6BeKd/PmoKalV7A0TrUmubbeAdmC+shE1QcxVsYxG6IIsqG09jWebwup2eHFf
	 pxFRXqFxW+KyHZWedGETo8hLk3N76tGfVRr2gQcLcOi7nZ78yTHYzXTN7QG2fpdYXD
	 Gn4GIzll2wMegj7jxfUkHhVKT7Ev3jhdkDAjruD+hBITaz+XAHGGfVBODt3FxcBait
	 yMl+s+nwRAfkQ==
Date: Wed, 25 Jun 2025 13:38:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH 1/3] dt-bindings: usb: add missed compatible string for
 arm64 layerscape
Message-ID: <175087673034.1996309.6332672675034782029.robh@kernel.org>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
 <20250602-ls_dma_coherence-v1-1-c67484d6ab64@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-ls_dma_coherence-v1-1-c67484d6ab64@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113852_809625_B5514319 
X-CRM114-Status: GOOD (  10.73  )
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


On Mon, 02 Jun 2025 18:01:01 -0400, Frank Li wrote:
> Add missed compatible string for arm64 layerscape platform. Allow these
> fallback to fsl,ls1028a-dwc3.
> 
> Remove fallback snps,dwc3 because layerscape dwc3 is not full compatible
> with common snps,dwc3 device, a special value gsburstcfg0 need be set when
> dma coherence enabled.
> 
> Allow iommus property.
> 
> Change ref to snps,dwc3-common.yaml to use dwc3 flatten library.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,ls1028a.yaml       | 33 ++++++++++++----------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


