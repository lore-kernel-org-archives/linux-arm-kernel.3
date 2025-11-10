Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FA9CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeWmYlk8GMBLZA2CG9lmQ63y0T8rUi7yyjFgmjRq8yU=; b=mK11yA1LucH8CgxOEbTQyPkvau
	kd0/JR5dqPlE//NRQJbJILkprhH6FoJ/50ND1Ly5Zg8pEB+zdep+CIJGWLKTQXOJ+qMZSvYko0Yqv
	o6N9ZC5CuMCLKw1fIboQV9Ph2BaxD+S1d2DUvpUdvItpceZ9Cee5DlmudQausgFdwaXwuBlkoSe+X
	ZqIegRr1aAeKpEIGsT5N6mE15hQjfkNpvfIsRbyeED3BcbZG8MEHfAZ3+rNtzIC/75TnSObeqT23a
	l2zMslyGZdT3UI2fZU74VzqInZC/DxnahcKnpUVEz7WpkAmPAsrW+5gjThUEaFJcA4og96KGsRZdC
	T9L9rXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISya-00000005axb-2zTG;
	Mon, 10 Nov 2025 14:34:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISyZ-00000005aww-053b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75BC8601B4;
	Mon, 10 Nov 2025 14:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245E4C113D0;
	Mon, 10 Nov 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762785274;
	bh=ll1L30KbYHKUhO1b4cfOa+rewJpoZ0v1yvioiCyAD2k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=E8ZH2TZxLfcGQtOswmwWlIDHCoWtaO2s9leIhb1rNokZIWfFt9dKZ5yvmR1WOxCwL
	 XWlIRbEVOQXaDL4pJc5dtzKJutxZi+RkTNfgGI89ddWj3xnn/vXMQqjwgJ2E5+jevn
	 rLJUyaDnMDUNJPoTs8EC8WFGn5Pi7dk6AduTEQbKWAJNPOA8FsDMQhiRZQSAnssorm
	 AjF6RIAGYN7SAzRyU1xAfP9jV0bEnaxNAcMmWZBH2eTF4aQYUoJbmV4Lzp9X4ve8ZE
	 /j+ANtgN2VpTnOEUCYQmfkQNNOeW5HqCrn7GAc8jVgTEPON9BJxzQCoMMsE57S7mVE
	 z+4cPjEOGhsKQ==
Date: Mon, 10 Nov 2025 08:34:33 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Shawn Guo <shawnguo@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
In-Reply-To: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
References: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
Message-Id: <176278493286.154609.17548604407386943510.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add support for Skov Rev.C HDMI variant
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


On Fri, 07 Nov 2025 15:49:50 +0100, Marco Felsch wrote:
> Hi,
> 
> this small patchset adds the support for the Rev.C HDMI board variant.
> 
> Regards,
>   Marco
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Marco Felsch (2):
>       dt-bindings: arm: fsl: add Skov Rev.C HDMI support
>       arm64: dts: imx8mp-skov: add Rev.C HDMI support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml          | 1 +
>  arch/arm64/boot/dts/freescale/Makefile                  | 1 +
>  arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts | 8 ++++++++
>  3 files changed, 10 insertions(+)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251107-v6-18-skov-revc-hdmi-1e8d4bbac26a
> 
> Best regards,
> --
> Marco Felsch <m.felsch@pengutronix.de>
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


This patch series was applied (using b4) to base:
 Base: 3a8660878839faadb4f1a6dd72c3179c1df56787 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de:

arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml






