Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB75C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmPloMVvcX9dIlMiMSorzmTWIn416gy3v5oANvmoi+U=; b=F/1w+Md5zUoXD8k5r9xJuwzjw3
	wGwPN10gGNZYUgahMrE5Lhpg1CIGfNv5VTy7Yg28IWpxHmL/w2FnOXuSG6SJGW6sqmOEuIa1lms5B
	d4yEdetAhOfCBXjc1FaTtml/0w7PJFxAot6FLciMWharLVlfeQYRqL5dwOSVpicN0AW6WpIolr91A
	7kvG720wB/MaIPPaphImvqCk4/gLhhgqY4T2EHsIAK51eocM831ZQt1ptPjmbGWwlgChmzfBEoVVD
	nN5QPuzZKEwsEeDmwWlef+9Jth/dqCl06NJPyLhVSLmVF/Kx8uoporX/RBeVX6kFgq+xQduD14a5p
	b66xcT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2t-0000000AgVs-0XXe;
	Thu, 10 Apr 2025 13:34:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rzy-0000000AfxC-2dll
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 13:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB3D6844D;
	Thu, 10 Apr 2025 13:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6940DC4CEDD;
	Thu, 10 Apr 2025 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291877;
	bh=Kdl0DUcFLmDnZW83B2cgZn3vkVospaz2redPCQGfiao=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EC9QCnIazZiRdAsg+uywSsOdSSb07TTH5+VyhiTQXjiMGNxZTJNrZy7vMS7VNeaeP
	 nJpPUfytqa8XPX6G2G+C9h6CTx4Hq61itsQ5yW42e8LjP1vqwT2TWFfmZz+nyqsOCf
	 CU1zj2Nc79UeYiq0PpiWV2LWYAsSCOFq1EVHZXr7MgCZAiTk1/uWcHKbKqtYelaTkY
	 gmS9TRIdRxUTlc7E6qDuFactnPgKkHBcEbmANbB3ZIVYTHXfdH7f1Z4/ahtFNZzbd+
	 fNy0EKcvL5uiRrR6/jTQDAnf49QN7uAQYEJx0NhLB03H7GLoBJUhnun+IDOURQcplD
	 PFEhfTHYWMHVw==
Date: Thu, 10 Apr 2025 08:31:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
References: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
Message-Id: <174429181469.3723423.3872724131863272335.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
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


On Thu, 10 Apr 2025 13:31:02 +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250410 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250410113107.2057426-1-alexander.stein@ew.tq-group.com:

arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('linux,code' was unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@81', 'protocol@84' were unexpected)
	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#






