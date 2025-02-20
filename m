Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED097C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 21:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hv9WnUy3hHZ8KAoar5k9Il38vdxpmU9M9G9/x1BIb7w=; b=XGgixBhirREjw8tWZSwkHIENdW
	xkRu6x8jarXXKbCNocmlFOi7J7/rEP2+/Q6PKyaFa0DWi26JAk0HHZYtGACnadwpaHnTR9I4TiY4G
	hPhb2mYKIe7NxAiJG60NeB0sA3vEfl3fl2cacyrjH5J9U5R4dRQMXM8WlYdIxJsZ1du5X/xji7H/M
	W9gUGh+DfqijrhMqPbkRR6aoBb18pqOP3exzRRLywHsOpGBEnwjakQgb/tJaquTtkW4J9Eesde7qI
	/z8Qf1XPg7Na2gyZMOHbOV1wPs6XKnqe+Lgt+JGJkWPXiM5evEFkGyEC2igQmpv7pfnsz/kx830Py
	UTCJM0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEFj-00000002ziN-1SnT;
	Thu, 20 Feb 2025 21:38:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlE6j-00000002xCI-441V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 21:29:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44FBA5C5C0C;
	Thu, 20 Feb 2025 21:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77EAC4CED1;
	Thu, 20 Feb 2025 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740086961;
	bh=kfvzeMKrGQuu+01M2Wgm2/ThWI4eKODKRyAcGfYZ6CQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FcuzNLQ5WVZKv5WbLvImuWazV+d2CjJj4FpNf2RmqYN5Pbk75kP9Ya65yAVAbjKZa
	 gxHuAWlMv74eZZ7ppU+Covz7UaFB8yPn9Ct56a2D/umtfcSGwW1Y9PNgmScip66FIi
	 +Xnmq//rBAfzsMy34TuL8OjC7cXjSt9YEJMEElTBdzij3aWIpIRq7bwU31hjD44K0z
	 f40deeAqSSHnw5oW/SfU1VLyrB6TFNNWN85Ui0atgu4Giap4uUN6uJdaPZ72v+Rdph
	 +sYOCJVDNG5xNOGP9dd3/YUUbUWZzYVm0eKQgUgk1FOHI/4aauIuLvmDZDmep0eaGK
	 WBLFoUJYHtXvQ==
Date: Thu, 20 Feb 2025 15:29:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250220-imx95_15x15-v3-0-247777ed91c4@nxp.com>
References: <20250220-imx95_15x15-v3-0-247777ed91c4@nxp.com>
Message-Id: <174008661875.4046844.10682813158644154393.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] arm64: dts: add imx95_15x15_evk boards support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_132922_122224_F76FAF47 
X-CRM114-Status: GOOD (  15.41  )
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


On Thu, 20 Feb 2025 11:11:15 -0500, Frank Li wrote:
> Add related binding doc.
> 
> Add imx95_15x15_evk boards, which have big difference with imx95_19x19_evk
> boards.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v3:
> - Add Rob and Conor's ack tags
> - Remove undocument property (need doube check why dtb-check have not
> report warning).
> 
> - Link to v2: https://lore.kernel.org/r/20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com
> 
> Changes in v2:
> - fixed typo 'inctrl-names'.
> - Link to v1: https://lore.kernel.org/r/20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com
> 
> ---
> Frank Li (4):
>       dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
>       arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
>       arm64: dts: imx95: Add i3c1 and i3c2
>       arm64: dts: imx95: Add imx95-15x15-evk support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml    |    1 +
>  arch/arm64/boot/dts/freescale/Makefile            |    1 +
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1062 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi          |   27 +
>  4 files changed, 1091 insertions(+)
> ---
> base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> change-id: 20250110-imx95_15x15-6a64db8c0187
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
> 
> 
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250220-imx95_15x15-v3-0-247777ed91c4@nxp.com:

arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#






