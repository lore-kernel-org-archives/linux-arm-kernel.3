Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CB7C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgV1ZroxMXYVki1ry4maOGGGp2ymUYtIylQc8+tqJuw=; b=WJ9hT+mg8HPJ4w1oZodGxauaEX
	2vvSaMjUP7v54fZXQ9Kd4QPRxfjKne31wn9qFytvX/yM9C6gSIVAGcnrPrCrWPzDj2NZ/wuYfjQE3
	E8ak5KOBXGR3y43sdQv1mYhLWJx0Je0ITCrvD/xG4TM/jU4i5+BUjSvfn+o1HR7pfq+zcd+b1vVeX
	BRmFU3Dnc7nkm4sbAYXzAsHL9wHhR4GjW9O+Bqs9QUMVjz5bvh2BV7e9DBfW1fJXKR900bALWbtQD
	hHlL+PN+Yq4p3dDpaWC9fG6q3qcwtTz63JFm1zhdr5pc6EcDa78IgSJRMAaZf8aQ5/PtF7CnRAimc
	w6NUeRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5fr-00000000sOG-34MY;
	Mon, 03 Mar 2025 13:17:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5cn-00000000rzs-2Ko0;
	Mon, 03 Mar 2025 13:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC3465C596B;
	Mon,  3 Mar 2025 13:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA0CC4CED6;
	Mon,  3 Mar 2025 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741007664;
	bh=TGTA1E6JEST7UBAQ+YC8/fElACd4pLq8wkDwFN71lKM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l7rUk9Vqb4qD1HM4/PUliRlzDZ/RglRb255OV3YvFjgAjHtG1ynRKc4hn9dAG0naP
	 sL/paPEL/PrO3WDsLYOz9YTbIf0WCUf3B5pSf7Wl6jeyy9fcpoutAPhik25/K6Mz9F
	 hWy1bndkV+srqMjL/OuwAgFQmPnSTzpysi3SbiNwgPqAiCtL92RpIj5tqglqZw17t3
	 QYzhZxTZZYN1VdqfKTW1Xpyusy2wJMxxWD5JttC0dkfqFefBf1HmmutGxPKBDnv5U4
	 IeintIVWIVPI3cyoe8hnmnK9rwsMnWu6lmJpaEtvtTiO/NfnYeeI32RbLJh662Qy7V
	 Is9cRXcfqv/JA==
Date: Mon, 03 Mar 2025 07:14:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dragan Simic <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Ondrej Jirman <megi@xff.cz>, oren@taumoda.com
To: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <20250302-camera-v2-0-312b44b4a89c@bootlin.com>
References: <20250302-camera-v2-0-312b44b4a89c@bootlin.com>
Message-Id: <174100756342.1496432.13525001046589650436.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Describe the cameras in the PinePhone Pro dts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_051425_705427_CB65AE78 
X-CRM114-Status: GOOD (  18.55  )
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


On Sun, 02 Mar 2025 16:41:01 +0100, Olivier Benjamin wrote:
> This series adds support for the Pine64 PinePhone Pro's rear and front
> cameras in Device Tree.
> This is based on some of Ondrej Jirman's patches hosted in his tree at
> https://codeberg.org/megi/linux, but I have also fully reviewed and
> re-written the code from the RK3399 datasheet, the PinePhone Pro
> schematic, and the IMX258-0AQH5 software reference manual.
> 
> I have tested these changes on my PinePhone Pro and am able to take
> photos from both cameras using libcamera's cam.
> 
> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
> Changes in v2:
> - Rebase on mainline
> - Change patch subject to arm64: dts: rockchip
> - Rename new regulators to fit preferred form for fixed regulators
> - Link to v1: https://lore.kernel.org/r/20250228-camera-v1-0-c51869f94e97@bootlin.com
> 
> ---
> Olivier Benjamin (2):
>       arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
>       arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro
> 
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> ---
> --
> Olivier Benjamin <olivier.benjamin@bootlin.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250302-camera-v2-0-312b44b4a89c@bootlin.com:

arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@1a: port:endpoint: 'link-frequencies' is a required property
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#
arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@1a: 'clock-names', 'lens-focus', 'orientation', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx258.yaml#
arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: camera@36: 'orientation', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov8858.yaml#






