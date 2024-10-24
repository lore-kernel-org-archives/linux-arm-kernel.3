Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C364DCE8E93
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nS8ggJ/ih2AL5fM3I3UbO4GAd6LxRBu+iWaSZ820XQ=; b=ai2hyXxlPN4eI5cJabHpNUX1iX
	RnbLBcMfYQCPPIO4Bdlc9GRNjZtAjkThh+gq6wS9gnUAUH/5rXL57nuky6EphZdQPf9WS7jtA6Wcm
	HdNy8U/GKX1bEt5LnXXXhei7idwP3kQIyOzriZRJVODsG4Tzo9w3FznDGdoKfbS/eOKfqD1e3y+yZ
	qbRoGTcWgti8I+f00hQrEZjlQK7crGul5TXhRwFAWaiy7sypyjGASwusW/AwKleWpipyLdT/YUU+r
	c3PfKCK6UrtnM9ygxsf1Hd+xJXyM2ZMWzXIZ4+eYTD/yd93nbs2ZFBKgLLBxivDbHd9i5dHjX4I0w
	Xw4XzlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40pB-000000017PN-1EIq;
	Thu, 24 Oct 2024 16:36:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40lr-000000016dF-2uWX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:33:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F133A456AF;
	Thu, 24 Oct 2024 16:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327CDC4CEC7;
	Thu, 24 Oct 2024 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787590;
	bh=5kxJTQW4XLnjK4PI9EbjL4QCTIY5IkCswPV0X0kgjXA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MvdA7kTJDan+helwSfB+pBk7ZfNqZXOtLsXsfW6yzTl3vRPFL/XxcwerzuTOZ1puK
	 2Mg7bNCdbyAkDIN2peeWX546T1I5XGBdfJO6zug+2IC42QeTEkyaofRS+CS89X35Hg
	 irnmfq5fVkK9Rq9qxnApgL8+X2iKcRgaz92/h0xKoQav5+U4ReeaB7G7vQGY4wksdb
	 Z3IiQh6lMOZ/+HVeB5J8cXda3FLHWloMj2JXV9z4bh0p+vCKqJgL704IdjVhQwvbpV
	 pX0kRNuSeP23oIkjfTLhvteyu/BUstgRXsNFYe3o1nwSuQ3B/+VeZ4VMG+Ri51Go/s
	 kdFEMbWUrw1kQ==
Date: Thu, 24 Oct 2024 11:33:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: shawnguo2@yeah.net, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, festevam@gmail.com, 
 imx@lists.linux.dev, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de
In-Reply-To: <20241021163437.1007507-1-Frank.Li@nxp.com>
References: <20241021163437.1007507-1-Frank.Li@nxp.com>
Message-Id: <172978739353.623341.4645836929476354717.robh@kernel.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: imx8qxp-mek: add bluetooth audio
 codec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_093311_823450_BD76A9ED 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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


On Mon, 21 Oct 2024 12:34:32 -0400, Frank Li wrote:
> Add bluetooth audio codec.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v2
> -none
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
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


New warnings running 'make CHECK_DTBS=y freescale/imx8qxp-mek.dtb' for 20241021163437.1007507-1-Frank.Li@nxp.com:

arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: esai@59010000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: usbphy@5b100000: 'nxp,sim' is a required property
	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#






