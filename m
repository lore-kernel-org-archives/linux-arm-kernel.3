Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5C9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 21:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAt0lZqmjLML5ka5S4un8UpyJ/dJZA0b7EGBLZ2WRN0=; b=c6XF+22gz2KSlzct9FCS1mkZJ6
	4p84XvOMjiTuUXp3U0Jt+jXs07OvjfiNopbbE1q+bFpxMVRHYzrUDxqJ4nYmD3/Y3m1tzYGJdBn75
	tM29AzDBNKe6aw00KORTiPZy50jIVoYqdwZ3MXLC0qSO+gvfNgEsE6wWD846LUAwfSjfZMM4hAs3Z
	aa9peA5uM4l4AV+MKeG4ZNOXw5hSzZvHBUfgJ8pSqNYTyOGRsdJpw5INfWOgt6Z1oCjBlmwWwMgfz
	CuJF2H2ePd5iswxC8Dw6af8lj7E6f71pGNi1DDgKCsD8TAshOrRGHRhY/b+j3zRAh88j1MHQMeC+5
	bzXVdINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEB5-00000002yPk-43oJ;
	Thu, 20 Feb 2025 21:33:51 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE6g-00000002xB1-3fxu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 21:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D0D568307;
	Thu, 20 Feb 2025 21:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67874C4CED1;
	Thu, 20 Feb 2025 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740086957;
	bh=o4LaBJ1mlUFGKGc3X7gcmlB3bIu31yuYd8HE2LaaG4s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kYuEG6U9xkXVk681gFmum04PkrEJUuhvj8FrHHF9dTpRLk7IIa2bNZf1HjAb/BBc/
	 vMFRbzL2kHKCQ65eG6l1N7b4SCFIvEC52cllKwfpz2Ss1is1cmYr9Y/8lue3SDIjaL
	 04GB+GJ+XDG4trY1eZWZordlEYXvlyUMT7MVaYuawNg7tH8iv3NsVDKANOlXijnnu9
	 jNPnMsF9egazD9E298YfJBzwnWfL6QLY6IbiBXOZhz6VJgJNOhxmcTaT8BX/C4gWFz
	 xeg0PgwDtRuy7jk/5nRKQan5W8mxoTGdj4Pr8D3GU/Ik9TJ3J4cYcw1WWq9VXPUtu2
	 3jSIWj7h1U7oA==
Date: Thu, 20 Feb 2025 15:29:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
 Fabio Estevam <festevam@denx.de>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250220130345.2375204-1-festevam@gmail.com>
References: <20250220130345.2375204-1-festevam@gmail.com>
Message-Id: <174008661713.4046746.867347616355576496.robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx31: Use nand-controller as node name
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


On Thu, 20 Feb 2025 10:03:45 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> According to mxc-nand.yaml, the correct node name must be
> 'nand-controller'.
> 
> Change it accordingly to fix the following dt-schema warning:
> 
> $nodename:0: 'nand@b8000000' does not match '^nand-controller(@.*)?'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm/boot/dts/nxp/imx/imx31.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250220130345.2375204-1-festevam@gmail.com:

arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: compatible:0: 'fsl,imx27-nand' was expected
	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: compatible: ['fsl,imx31-nand', 'fsl,imx27-nand'] is too long
	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: nand-controller@b8000000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/nxp/imx/imx31-bug.dtb: /soc/emi@b8000000/nand-controller@b8000000: failed to match any schema with compatible: ['fsl,imx31-nand', 'fsl,imx27-nand']
arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: compatible:0: 'fsl,imx27-nand' was expected
	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: compatible: ['fsl,imx31-nand', 'fsl,imx27-nand'] is too long
	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'compatible', 'dma-names', 'dmas', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml#
arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: nand-controller@b8000000: #size-cells: 0 was expected
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
arch/arm/boot/dts/nxp/imx/imx31-lite.dtb: /soc/emi@b8000000/nand-controller@b8000000: failed to match any schema with compatible: ['fsl,imx31-nand', 'fsl,imx27-nand']






