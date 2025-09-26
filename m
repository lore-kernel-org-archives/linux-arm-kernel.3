Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE44CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lvqOX7K3pxnXUNSGNoCGRqsawY65lsfr8y51TadcBc0=; b=hSCFhCykoz7/di
	ZkHTH8dp+qmsNM/JKWajeAIFKQ58iyO+8MymdjMIFgYLLnKfcRIHVmLCyC3tpEb6+1b2XYr12M/Y/
	1/zvhr8ZjQlGfJ4Jyo/1WFuKCqQIPqkrdEwLUCunEEeXwvNhousxlgX94YDS395+hz4rSRTSB2pph
	IgwZiv+5biGgTPqV6sERyGehOPrCWivMDA+S2KqVKy97+l5+38WPVwgUijaaZiLn2E5hsDXx8NJTa
	ZJyJdzcf1iSlyAgYsV5wtuqU4HYkH3HoAeovnff2N0E/y5pbH5OLTrebjhx/kcznfRj7VJtijXaP3
	NUyJvFArIGAUiMnIg1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FS3-00000004SLF-1f2s;
	Fri, 26 Sep 2025 20:53:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FRz-00000004SGU-0ntX;
	Fri, 26 Sep 2025 20:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9533361F74;
	Fri, 26 Sep 2025 20:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A17C113CF;
	Fri, 26 Sep 2025 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758920034;
	bh=i45xzC7yA1PYW8/tIOpUf6+frrJsG6ExocWAVAZkri8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=E4OhCUsGZLnOGQzGap8V0RvGV/q7cB1oUFGaQK06dzU7yCeO7oKvIz7cbaJBoWqwf
	 s5HzYqQOTrZkFlnbxV5OcgfDzwuBygEod8Sd9rbUoMDWML7oAEOKeo3pCzB0ITsILt
	 iAY5aNmisBkcmfhgmFFL321klL/mXxPC0OhwHZoaNlBnKhgy7wCrd0PVQ3e4/nHuu+
	 cS5rR5TrEVd3jXBKEWLydBGnZwUeCYA/ATHIcCN62ogZm9fu+UsqONSGHWaNfwkKHa
	 lpo7Oa7O+OOkTXowrpk9C6G2+5G3kv5N14nRKnjm91yzlt2tn/sjo7o39/ndOhMLwd
	 wfIQGGj6g8XiA==
Date: Fri, 26 Sep 2025 15:53:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v3 1/4] ARM: dts: mediatek: drop wrong syscon hifsys
 compatible for MT2701/7623
Message-ID: <20250926205352.GA2266604@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925162332.9794-2-ansuelsmth@gmail.com>
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

On Thu, Sep 25, 2025 at 06:23:15PM +0200, Christian Marangi wrote:
> The syscon compatible for the hifsys node for Mediatek MT2701/MT7623 SoC
> was wrongly added following the pattern of other clock node but it's
> actually not needed as the register are not used by other device on the
> SoC.
> 
> On top of this it does against the schema for hifsys amnd cause
> dtbs_check warning.

s/does/<something else, not sure what you mean>/
s/amnd/and/ ?
s/cause/causes a/

> Drop the "syscon" compatible to mute the warning and reflect the
> compatible property described in the mediatek,mt2701-hifsys.yaml schema.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/mediatek/mt2701.dtsi | 2 +-
>  arch/arm/boot/dts/mediatek/mt7623.dtsi | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
> index ce6a4015fed5..128b87229f3d 100644
> --- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
> @@ -597,7 +597,7 @@ larb1: larb@16010000 {
>  	};
>  
>  	hifsys: syscon@1a000000 {
> -		compatible = "mediatek,mt2701-hifsys", "syscon";
> +		compatible = "mediatek,mt2701-hifsys";
>  		reg = <0 0x1a000000 0 0x1000>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
> diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
> index fd7a89cc337d..4b1685b93989 100644
> --- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
> @@ -744,8 +744,7 @@ vdecsys: syscon@16000000 {
>  
>  	hifsys: syscon@1a000000 {
>  		compatible = "mediatek,mt7623-hifsys",
> -			     "mediatek,mt2701-hifsys",
> -			     "syscon";
> +			     "mediatek,mt2701-hifsys";
>  		reg = <0 0x1a000000 0 0x1000>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
> -- 
> 2.51.0
> 

