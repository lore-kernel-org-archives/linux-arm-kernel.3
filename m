Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387A4C3ABDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvEbnFA5SJymiVf6p71P4y57NL37+8iDwQSKTB3GBy8=; b=NP2m9iv681MGbOl9O7RPUV8gD9
	xtu+PWnpK2uy2SplPcAo7WKKc4srl1aJri4Xf8JLHgVzFE2hRhO8mWfo6HteryOp7gYj4kC5KjbQH
	vkauWSg9bd6NaTYLWfD4dFlE+pLExT8C1/3nzeJGmssgvtlnSjUw9f+t54yAr+Qkysr9wXTd5TrQw
	6krnve8SmVxENiHET1Fi/lOILeA/aHDAAkNWatvs9FBOspiDZTzGGtoj3EKT7kcy4ocy4fnp1S4Xf
	U/SMKQHnkKIxyuYHWSXU6DGLhNw4pDIGZ/eWGdRp5EJOwBJh69crF5RY7fErsrxatkxC3MpT7XMhU
	CgojiuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDef-0000000FVQq-3Elf;
	Wed, 14 May 2025 15:04:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBtD-0000000FAat-1Wrl;
	Wed, 14 May 2025 13:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB1E961155;
	Wed, 14 May 2025 13:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A83C4CEED;
	Wed, 14 May 2025 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747228274;
	bh=RMIUJ4PPQ4ztksuWTTjccEyOC4ctSkUxCvsZak+d20Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sPfVpSmehjedO3NMxNnnHSljQ3eOjEPchdLZMDEzAjQQs3sC2cqnoBx3HGziV63ww
	 gZC1R15YhL0bzL2gz4nZIspWlD757TdI9FJUZEpWNInpv0/u76BW5Wpygrt/gnrRJ/
	 6Xql+1APuuhfOYWmLN1TlQuzlWhKMDlSqIcWR17Ig+ZJX2NBPvYyLB40VFRqMffF3R
	 DnIMS0skU589z+LId7B3NAmnAFWRP7cVj8ExWbPJVT2viGjHTiAnlIOhh4SWQHh6eb
	 VvCEKFSrkW19j8CNINvCQr2XdxMZDFCzt5VBHVTVIO4F2rPRj9qYAszo5jhGyXb/Zi
	 B80zVGQtXtzVw==
Date: Wed, 14 May 2025 08:11:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
References: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
Message-Id: <174722778770.1826547.7211789941819434766.robh@kernel.org>
Subject: Re: [PATCH 0/8] Add support for Amlogic S7/S7D/S6 pinctrl
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


On Wed, 14 May 2025 15:01:27 +0800, Xianwei Zhao wrote:
> In some Amlogic SoCs, to save register space or due to some
> abnormal arrangements, two sets of pins share one mux register.
> A group starting from pin0 is the main pin group, which acquires
> the register address through DTS and has management permissions,
> but the register bit offset is undetermined.
> Another GPIO group as a subordinate group. Some pins mux use share
> register and bit offset from bit0 . But this group do not have
> register management permissions.
> 
> In SoC S7 and S7D, GPIOX(16~19) mux share with GPIOCC mux register.
> 
> In SoC S6, GPIOX(16~19) mux share with GPIOCC mux register, and GPIOD(6)
> mux share with GPIOF mux register.
> 
> Add S7/S7D/S6 pinctrl compatible string and device node.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Xianwei Zhao (8):
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7D
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S6
>       pinctrl: meson: a4: remove special data processing
>       pinctrl: meson: support amlogic S6/S7/S7D SoC
>       dts: arm64: amlogic: add S7 pinctrl node
>       dts: arm64: amlogic: add S7D pinctrl node
>       dts: arm64: amlogic: add S6 pinctrl node
> 
>  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |   9 +-
>  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 ++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  81 +++++++++++++++
>  arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  90 +++++++++++++++++
>  drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 111 ++++++++++++++++-----
>  5 files changed, 363 insertions(+), 25 deletions(-)
> ---
> base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
> change-id: 20250514-s6-s7-pinctrl-af1ebda88a4e
> 
> Best regards,
> --
> Xianwei Zhao <xianwei.zhao@amlogic.com>
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
 Base: using specified base-commit aa94665adc28f3fdc3de2979ac1e98bae961d6ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com:

arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: bus@fe000000 (simple-bus): pinctrl:ranges: [[0, 0, 0, 16384, 0, 832]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.dtb: bus@fe000000 (simple-bus): pinctrl:ranges: [[0, 0, 0, 16384, 0, 832]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.dtb: bus@fe000000 (simple-bus): pinctrl:ranges: [[0, 0, 0, 16384, 0, 832]] is not of type 'boolean'
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#






