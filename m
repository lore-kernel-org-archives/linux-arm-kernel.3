Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0A7EDEBF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcEJtq7Z/7TAceUs8G8nMrrfpHpG1Zk+02PHiyg3v4s=; b=e+lXr8vd4i/xRpbfrFGoP2o50E
	Q2l1aDTLPF4cgf09veV3PmIFOXHQ1t17zn0HLk5SAlSlcwkUeoaoh7MSQqftOOuLBFezJ/hv01vwg
	l6GeSmdrFNqWmTSIHo85IJlOudn2zTUxorVObOhu7ctLhD/A7/kbYzHjRPFU/nGojYQZfHclgTJRD
	1Z8PHPCKd106F3oaVwrRqbYTjSj0qn/jVhi0GzklTL7Wy6jsYFnzu2Oj5bmLns+lX1E45/O0V8j0U
	IrOBrstN/BobwZfRxO2dBtAM3XWgPfyVlF8oHIF2n006jt3uqni2a5pH40Wy2mRPcQm/oRBeht4nC
	JOTWI8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaPf-0000000GBXP-0Szg;
	Wed, 04 Mar 2026 00:48:31 +0000
Received: from mail-m8195.xmail.ntesmail.com ([156.224.81.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaPb-0000000GBUq-0A12;
	Wed, 04 Mar 2026 00:48:29 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35a5c15d4;
	Wed, 4 Mar 2026 08:48:13 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Martin Filla <freebsd@sysctl.cz>,
 Charalampos Mitrodimas <charmitro@posteo.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] arm64: dts: rockchip: assign pipe clock to rk3568
 PCIe lanes
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wunderlich <frank-w@public-files.de>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-0-af5a5207b0a1@ixit.cz>
 <20260303-rk3568-bri-r2-pro-fix-pcie-v3-1-af5a5207b0a1@ixit.cz>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <f46661cf-fc26-db4f-6161-e0e2734e796c@rock-chips.com>
Date: Wed, 4 Mar 2026 08:48:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-1-af5a5207b0a1@ixit.cz>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cb65117ae09cckunmf49cc13a1151d96
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxhNSlZPHkoZGUkYGU4YGEpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PRtRvhz6wGRr/itjTIq2BcGTEqdE5rluvLSsFHuK54Ko1NPmAae7MSeQkVTuYdFH7DMpBSKTFToPlWh71wnbjN3ilxdM+5QLJpg8Mpx+3/v1hHhkA5b5cgcekZ6Sl9tRs+VLz1sHAy8pN09pXPd7vNan18qfrjmbtOXIyqo7WVc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LcEJtq7Z/7TAceUs8G8nMrrfpHpG1Zk+02PHiyg3v4s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_164827_680737_2BD18846 
X-CRM114-Status: GOOD (  16.96  )
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

Hi David

在 2026/03/04 星期三 3:52, David Heidelberg via B4 Relay 写道:
> From: David Heidelberg <david@ixit.cz>
> 
> These clocks are used by PCIe lanes, but we're missing from the
> definition.
> 

Thanks for catching this.

Since you're already working on the PCIe clock definitions, would you
mind taking the opportunity to also add the missing pcie2x1 pipe clock
to the rk356x-base.dtsi in the same patch? This would keep the fixes 
complete and consistent.


> Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/rockchip/rk3568.dtsi | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> index 658097ed69714..3bc653f027f1f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -155,9 +155,11 @@ pcie3x1: pcie@fe270000 {
>   		bus-range = <0x10 0x1f>;
>   		clocks = <&cru ACLK_PCIE30X1_MST>, <&cru ACLK_PCIE30X1_SLV>,
>   			 <&cru ACLK_PCIE30X1_DBI>, <&cru PCLK_PCIE30X1>,
> -			 <&cru CLK_PCIE30X1_AUX_NDFT>;
> +			 <&cru CLK_PCIE30X1_AUX_NDFT>,
> +			 <&cru CLK_PCIE30X1_PIPE_DFT>;
>   		clock-names = "aclk_mst", "aclk_slv",
> -			      "aclk_dbi", "pclk", "aux";
> +			      "aclk_dbi", "pclk", "aux",
> +			      "pipe";
>   		device_type = "pci";
>   		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
>   			     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
> @@ -208,9 +210,11 @@ pcie3x2: pcie@fe280000 {
>   		bus-range = <0x20 0x2f>;
>   		clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
>   			 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
> -			 <&cru CLK_PCIE30X2_AUX_NDFT>;
> +			 <&cru CLK_PCIE30X2_AUX_NDFT>,
> +			 <&cru CLK_PCIE30X2_PIPE_DFT>;
>   		clock-names = "aclk_mst", "aclk_slv",
> -			      "aclk_dbi", "pclk", "aux";
> +			      "aclk_dbi", "pclk", "aux",
> +			      "pipe";
>   		device_type = "pci";
>   		interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
>   			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> 

