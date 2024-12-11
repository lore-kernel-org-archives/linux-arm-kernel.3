Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD91CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=970IYPSf/+JSlZzH0D0FgmfSU/u1z7o1WJTMRwGnFEE=; b=oMt+VDRuMUPdXv4BoIUoN+PLEE
	ebPV/Rshc1my7Vyqn2rNe35OK8e22vgT9vin6fBa9Rjr32UPhqfRLcgVlFujZc6ejcnRZzHX7sgZv
	mh1yqgMWmBfcX5+eB29SrUxdd1JBJjItEb4yrI9DkL+HhitPJvi/JksTfzv8aw1lsO5AgRFwV6tMq
	ITAoWnelDaQrRmFGIXWfdlkTYq2oasvaZRP6twqmp0TXPMRN8Ox/bzMZax7AFm0fO3YYQlzji8a8h
	Fa/d15cahVz27GX4ELDVRhgJPRuWp+EBkJou6KARxZn3ISocak804mGBE/ejqzCXeMUhfOf1dL8zq
	g4azI2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLN3v-0000000F2Dh-3cEW;
	Wed, 11 Dec 2024 13:47:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLN2K-0000000F1rg-1CMv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=970IYPSf/+JSlZzH0D0FgmfSU/u1z7o1WJTMRwGnFEE=; b=oHUpMDpSeptuYYndw5aK75LwhI
	rxAsOQKkfvbljRtAdBEsWAmL0NUV1hlzznUDEEQWb9jf7YD8wJ7EmrdEulGNm08Z/EpTzF7f0psJl
	4DG9WfSUS85tfAdVQ7qqE42bEXtetFTrsLMvTsMca5NTSLr8s037+/z4WBvqAfTqLaKw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tLN2A-0006Om-DP; Wed, 11 Dec 2024 14:45:46 +0100
Date: Wed, 11 Dec 2024 14:45:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 07/15] ARM: zynq: Add ethernet phy reset information to
 DT(zc702)
Message-ID: <8395fb6b-d7a5-4e2c-9eb3-4984b8c775c4@lunn.ch>
References: <cover.1733920873.git.michal.simek@amd.com>
 <9e18d59ca339804320d2a5e3c7362aefa3bb7c99.1733920873.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e18d59ca339804320d2a5e3c7362aefa3bb7c99.1733920873.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_054556_319738_F9C04E74 
X-CRM114-Status: GOOD (  12.27  )
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

On Wed, Dec 11, 2024 at 01:41:26PM +0100, Michal Simek wrote:
> Added phy reset gpio information for gem0.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  arch/arm/boot/dts/xilinx/zynq-zc702.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/xilinx/zynq-zc702.dts b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> index 424e78f6c148..975385f4ac01 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-zc702.dts
> @@ -79,6 +79,8 @@ &gem0 {
>  	phy-handle = <&ethernet_phy>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gem0_default>;
> +	phy-reset-gpio = <&gpio0 11 0>;
> +	phy-reset-active-low;

Hi Michal

Could you point me at code which actually implements these two
properties.

What is more normal is a reset-gpios property in the PHY node, or a
reset-gpios in the MDIO node.

	Andrew

