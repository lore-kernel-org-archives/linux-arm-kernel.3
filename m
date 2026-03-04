Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13850EF8FE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/5CjFN5DQLnwXu9X2kNfSbkWVbxCQkt3uDqFMTtaNk=; b=ZL236KWuhwJcmoVkv4N+0gCfxS
	zdmVfIoXFSbQTvWp9pDbhHR1MXO/guTRPqo6625N4O1U6QQZJdGMWXNyS7p98EDM2rUG8wSUgfCXh
	6U1aTRJ3d4M5qcfrTiQJpavnyrZ2CHfKvyvd7GEyTrjOlfST/KHVO8cD/4IAhKoBAZMXqbFc9bmIu
	WYq9rMFhv09oAYP1QbgRkLRZ5Dq8FSIlSTobUtcZh4VX1uSjt1/dqio7WJLUIppas51Q2XgSbUUNo
	KdMlZgzIkkUFeOGjf71aGMeiRX2LlWUwUkDcODyx7BY7vhXPBO1nSFH3QuuvJ7zEDlorgI3KiVzjF
	/Jjem02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmOw-0000000HFw4-01d1;
	Wed, 04 Mar 2026 13:36:34 +0000
Received: from mail-m49243.qiye.163.com ([45.254.49.243])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmOs-0000000HFv6-2tl0;
	Wed, 04 Mar 2026 13:36:32 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35bef961c;
	Wed, 4 Mar 2026 21:36:16 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Martin Filla <freebsd@sysctl.cz>,
 Charalampos Mitrodimas <charmitro@posteo.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v4 1/4] arm64: dts: rockchip: assign pipe clock to rk356x
 PCIe lanes
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, "elaine.zhang"
 <elaine.zhang@rock-chips.com>
References: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
 <20260304-rk3568-bri-r2-pro-fix-pcie-v4-1-37abd7ba29d0@ixit.cz>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <d981fa84-bd05-ac9d-98ca-89ee47177829@rock-chips.com>
Date: Wed, 4 Mar 2026 21:36:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-1-37abd7ba29d0@ixit.cz>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cb91043db09cckunm56444db0122910c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxgYQ1ZIQkxLHxhNSUweTB9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fx22D2kn242RR6kXvU/2drBjn1X7G1r4J6WP3RnZQe9shUfVHmlNHN60ywYZG39crbVuIKrwgDtFYU4oIbfReugUOmgXdVdgWDFlSsGQJbth/rPtmlUigRHhfyk4mNFvhSQ/F3n1Dk9z5rfkpYnAu08yC8Gs6u66zvNO7SXT20w=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=p/5CjFN5DQLnwXu9X2kNfSbkWVbxCQkt3uDqFMTtaNk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_053631_343769_7382C060 
X-CRM114-Status: GOOD (  17.41  )
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

+ Elaine

在 2026/03/04 星期三 19:05, David Heidelberg via B4 Relay 写道:
> From: David Heidelberg <david@ixit.cz>
> 
> These clocks are used by PCIe lanes, but we're missing from the
> definition.
>

These missing clocks are needed but PCIe still work fine，because
the clk code for rk3568 didn't actually define them as real clock
gates. So they are always enabled thanks to the default value and out
of the radar of clk_disable_unused().

It's a bit suboptimal and probably need to be improved in clk-rk3568.c

For $subject patch,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>


> Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 12 ++++++++----
>   arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  6 ++++--
>   2 files changed, 12 insertions(+), 6 deletions(-)
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
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> index 68b48606f6010..15741acac6274 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -1020,9 +1020,11 @@ pcie2x1: pcie@fe260000 {
>   		bus-range = <0x0 0xf>;
>   		clocks = <&cru ACLK_PCIE20_MST>, <&cru ACLK_PCIE20_SLV>,
>   			 <&cru ACLK_PCIE20_DBI>, <&cru PCLK_PCIE20>,
> -			 <&cru CLK_PCIE20_AUX_NDFT>;
> +			 <&cru CLK_PCIE20_AUX_NDFT>,
> +			 <&cru CLK_PCIE20_PIPE_DFT>;
>   		clock-names = "aclk_mst", "aclk_slv",
> -			      "aclk_dbi", "pclk", "aux";
> +			      "aclk_dbi", "pclk", "aux",
> +			      "pipe";
>   		device_type = "pci";
>   		#interrupt-cells = <1>;
>   		interrupt-map-mask = <0 0 0 7>;
> 

