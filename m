Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLfLHXB6XVnWPAXACR2GqBUMy1yDBcitTcqXrCAOdq0=; b=CncUv099LvB16DdS7r39wJ/vvU
	U3wR53eP+6zNDZ/t83+VkPZriIduxLD14a3KJh/QlgY5LBQk629S74WVp+8tjgKXKtMfi+AuvKQDn
	UMi0Lht1fl8BJ2yuf+0C08Gofxteq438xtY8kIWEIfcRiiiaiC8s/nA65p7I4HpMNDYszq2igSEpq
	e9ANqA+8EtC5Ap8sQx+K2kuARViFLSuCTBRU3uN3LRZo1WhEq/V5lcPBRzayvJDnDEHa+G6pE90qo
	XUxgQ1HSGnh9KromR7DdyP5wjc1vqa8oYnTCg2aq4rr5SW5UCb64z2RSogd0pHGCCnmawn527PhCX
	VvB3FDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBg6-00000003hpm-1iW7;
	Thu, 02 Jul 2026 07:17:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBg4-00000003hpf-3K2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:17:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B42D4060D;
	Thu,  2 Jul 2026 07:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03E01F000E9;
	Thu,  2 Jul 2026 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976660;
	bh=FLfLHXB6XVnWPAXACR2GqBUMy1yDBcitTcqXrCAOdq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ea4vUYTX3wUakbg66YR5woPZX3N32vcgYgxn8ziX3MVs3kdw9eHLfFxHAffvA2dRn
	 cQnteDyEQiFEP23wofK62YFT9QjFrhpLc5RN8AyQth+sboFgch/ph7UQ9neEUVX07X
	 Mdg6SC5onZvhEslmJ96bEgAtOD/KId+4B7ov8daikBPq0FKuuufUTAbYgHv7tgeTUN
	 nDUIuHbYqWYIA9oT18hpw49uRSywadgbhQapaV0XaCfxJJH0R/+sOgfP5080L9D1+U
	 gXWhupXDn9gYZyj3zjUQhFBXpOnIkC3TeOiK1/JonB7vrUrwLs6BnY5C9kFHljCWvy
	 re4/7JUPFNpsQ==
Date: Thu, 2 Jul 2026 09:17:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2
 board
Message-ID: <20260702-heretic-fractal-jackdaw-70681b@quoll>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630133108.27244-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Tue, Jun 30, 2026 at 06:31:07AM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Add device tree for the Intel SoCFPGA Agilex5 SoCDK TSN Config2 board
> variant. This configuration enables gmac1 as a TSN port alongside
> the standard gmac2 Ethernet port.
> 
> The TSN port (gmac1) uses GMII internally in the MAC but connects to an
> RGMII PHY. The mac-mode property is set to "gmii" to reflect the
> MAC-side interface, while phy-mode is set to "rgmii" for the PHY-side
> interface.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>  arch/arm64/boot/dts/intel/Makefile            |   3 +-
>  .../intel/socfpga_agilex5_socdk_tsn_cfg2.dts  | 133 ++++++++++++++++++
>  2 files changed, 135 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts
> 
> diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
> index 270c70fdf084..fc7ba2c6384b 100644
> --- a/arch/arm64/boot/dts/intel/Makefile
> +++ b/arch/arm64/boot/dts/intel/Makefile
> @@ -4,10 +4,11 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
>  				socfpga_agilex_socdk_emmc.dtb \
>  				socfpga_agilex_socdk_nand.dtb \
>  				socfpga_agilex3_socdk.dtb \
> -				socfpga_agilex5_socdk.dtb \
> +			socfpga_agilex5_socdk.dtb \

Why are you making this change?

>  				socfpga_agilex5_socdk_013b.dtb \
>  				socfpga_agilex5_socdk_modular.dtb \
>  				socfpga_agilex5_socdk_nand.dtb \
> +				socfpga_agilex5_socdk_tsn_cfg2.dtb \
>  				socfpga_agilex72_socdk.dtb \
>  				socfpga_agilex7m_socdk.dtb \
>  				socfpga_n5x_socdk.dtb

Best regards,
Krzysztof


