Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DF2CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BBGNjXlqJx8x8JoiCr0EsqMkSfxctkg8QMThijRVj8=; b=e8Ne6le/TvMmcv2sP3aH12sjz/
	FiaYv3HvH2e8alN+yswAfoOQRBFtXl7Ti7zMJ/zcc2AXYpVtR+sXd3VcQI4QuajwP+VePGiFEFGab
	nA+ZhLUpJnho/MGWu2hNjmc3R4WRuFmDeT6QzC4o95Az1DqxJ/uLzWHNV9waFH+JVg7U99Vf36oee
	IeGpYKGVA0S7OmGwiQdtBi6XXK8heoEoj5Lx1kbIhEA1PqgrNPhlQHqytTh2IGDPrJE1Sgw1HGZTm
	hFKOmY6dLL4P81N6/4uQ3gppvyfIOD35om47n6R120eTOJHG/biGEGNClS53GlSisI91fOLlNL4o5
	NuiQTqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFxk-00000000CyM-3qS2;
	Thu, 18 Sep 2025 14:50:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFxh-00000000CwW-3pTe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BBAE40A68;
	Thu, 18 Sep 2025 14:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC12C4CEE7;
	Thu, 18 Sep 2025 14:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758207016;
	bh=rdKpK3nchvp/w38h4f46KmCsTfhjjVcybQBpTUeTe9Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Z67xktK32N/0SPPgxilFoJF1XbCI1YMq7szYokGU2rekjwG2KEwCkHufVLC4FF48s
	 1wuVqPA/hK97kJcLZOdyMzO4zd7fKcJ0D31BzcmRYuwr7TuCqo46bnQ6vg4D/jj8qN
	 /c1KWRYRfOAWZOLcNpw0ojkJPffXQZhr9w1zG/s4eRsRwnX55JNBHaqa4WQ8IBbGLC
	 9Pc3alfWtNYoTtW0Q0rDzpilTxsrnKQYyHsVmMP+yvS8yEuASGdI2Iz955TrIn6e9M
	 fB/ed7yGOAkZLdr8OsBhJqIJ6M9SzNkdK7brA3wOJPtCU/UEJQ22Dx09g9qXG237ZK
	 2Pa6QSJBGzwGQ==
Date: Thu, 18 Sep 2025 09:50:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, josua@solid-run.com, Markus.Niebel@tq-group.com, 
 frieder.schrempf@kontron.de, s.hauer@pengutronix.de, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, francesco.dolcini@toradex.com, 
 linux-arm-kernel@lists.infradead.org, alexander.stein@ew.tq-group.com, 
 kernel@pengutronix.de, marex@denx.de, dario.binacchi@amarulasolutions.com, 
 joao.goncalves@toradex.com, y.moog@phytec.de, linux-kernel@vger.kernel.org, 
 primoz.fiser@norik.com, imx@lists.linux.dev, festevam@gmail.com, 
 shawnguo@kernel.org
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
In-Reply-To: <20250918014053.696710-1-rpimentel.silva@gmail.com>
References: <20250918014053.696710-1-rpimentel.silva@gmail.com>
Message-Id: <175820686275.1653785.13196624699524860361.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_075017_970906_F40CE434 
X-CRM114-Status: GOOD (  11.68  )
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


On Wed, 17 Sep 2025 21:40:52 -0400, Rogerio Pimentel wrote:
> Add device tree compatible string for the i.MX8MP FRDM board.
> 
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: remotes/next/fs-next-7200-gdcb597fa814c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250918014053.696710-1-rpimentel.silva@gmail.com:

arch/arm64/boot/dts/freescale/imx8mp-frdm.dtb: gpio-leds (gpio-leds): 'blue', 'green', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#






