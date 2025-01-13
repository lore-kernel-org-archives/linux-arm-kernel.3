Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70967C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiF5y0DDtgXVijqOuwRVjG0SuXSO9AlYBROQogSphgg=; b=Ys+xFzPkOcgPCnxL/cTJ3pJddf
	wjau0pZw0kq6ISFg0cpdVd6grBqHcH7fcmKWznD2aMlLxfLvESNw0uTS4+s5Oe2juJ3hTcKwEbu/Z
	kTJi6B0whyhfv1oUJhsDt35+1lEHCzKREDcJ0IIPwUOVE5bS1wTzXUGYiF/7xbUAlEEh6sABsHjIJ
	HtFWagZXoexkH9Be2mWZsJVewndBAgUQ8LXELR5TK6dGkFnzChgN3882gE7INzYyJPXmoEuqRl2Mu
	2HHTqgd6JaIQLN7Cbhv1tauokS3tWKJw4m1MpN0nXcbbOeJsMzPCNCdX+IN4AzRc+jkZe1oO+PSJe
	oxtq0VSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMns-00000005kQK-1SWY;
	Mon, 13 Jan 2025 15:56:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMKM-00000005ci8-2V9v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 380D8A41043;
	Mon, 13 Jan 2025 15:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3F0C4CED6;
	Mon, 13 Jan 2025 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781965;
	bh=SsCpoMEeN0pR9CHnKptWUCXC0cbDKemvyCTlTImvvmI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DahZTjmwhI+qPyla/XXhJvbj9/7bv1nZGYlaBzwz+4vdaiIcUL1VrPLfDwfDJIZQj
	 aZToEHslHa0BWyEL5jTmUAQk6jxh1OcN3TnK3MY/pOqDi9l6i+A8jNGUqy0si0YMY+
	 95ZTFD81NRP1XyyKRoIa2FzQCcHFAUXr2KxhtvmXoxOZL0ObB9EmTVU9WzhXZfYz4p
	 b4WA0oERZFkDkUN2imFQBQ7bpNtCTrfswjl9Zycq9IsA3TSpi/UjkDAwVp6jU/eGXw
	 zB6ppLqq5pQCgeYFObSYSOBInJEdBICXGLhnrjh7m1hfDUgW7L8KF26lROEsvfFCQu
	 ZueZeJBwJhrHw==
Date: Mon, 13 Jan 2025 09:26:04 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 shawnguo@kernel.org, kernel@pengutronix.de, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 Fabio Estevam <festevam@denx.de>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112122939.988309-1-festevam@gmail.com>
References: <20250112122939.988309-1-festevam@gmail.com>
Message-Id: <173678159671.2153129.12543117264770999110.robh@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx5: Fix the CCM interrupts description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_072606_701033_11DE86C6 
X-CRM114-Status: GOOD (  14.81  )
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


On Sun, 12 Jan 2025 09:29:38 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> The CCM nodes are not following this format and cause the following
> dt-schema warnings:
> 
> ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long
> 
> Fix it by passing only the two interrupt numbers.
> 
> Run-time tested in on an imx53-qsb board.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  arch/arm/boot/dts/nxp/imx/imx50.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/nxp/' for 20250112122939.988309-1-festevam@gmail.com:

arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dtb: /soc/bus@40000000/iomuxc@40048000: failed to match any schema with compatible: ['fsl,vf610-iomuxc']
arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dtb: /soc/ethernet@2d90000: failed to match any schema with compatible: ['fsl,etsec2']
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/mdio@2d24000: failed to match any schema with compatible: ['gianfar']
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: /soc/ethernet@2d10000: failed to match any schema with compatible: ['fsl,etsec2']
arch/arm/boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']






