Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1270FC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQgfd5GhWHik5LEPpZz+D67J5gQafIKVTwFAoFjZtcM=; b=IBLEBYrqDsbOZe+Rztf9uiBAtS
	y8CwFSxHoVXLYt6JaZf6x8eGzuOmSsPrDIgJV82bmjwKAlU+6M8Bc0X+EPrEeOq5efS5uki0ivWl2
	2f7+68oKJplpnlAc9W8tu7amRtrXBMGt4RWsGaj/iJZ6JJrXQ4LGbKb+k7pnHc4s/t9dafug7RGGf
	EJ8TEPvNVdFd7NNXUqwOojzCoGsjcXxLIGSjvcalip+M+t9YlZqJiRHmulSJpObEm2V7xKlCnV9RT
	O5qzB4TEwru8c4Z5E7s9qM9ZuPi5RUbG3lF4z705J8Coj3JAI2SkkCpR4jIPQ57nDVdA+Kq49yYGh
	JA7p2E1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZpV-00000007xav-1YEX;
	Tue, 17 Jun 2025 17:10:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXBR-00000007WmK-0tJp;
	Tue, 17 Jun 2025 14:21:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98A4662A1F;
	Tue, 17 Jun 2025 14:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D519C4CEF0;
	Tue, 17 Jun 2025 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170064;
	bh=c3Nwx6dBlajp+mjGLZ90FuNsLBoLj4+/vuSLqUu/Gg0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S1A3/Uu4p3W0fyPToYzwbJK8xmeoi4lI2f7v10F+6c5I3VuE2InNtwV8+aRpLCORP
	 HYVbC28DcbAEoErCJ9jtUKsPOvO5XREMnWksIl3/Op25wbOj4VrxbVfHCvKJLakgOA
	 gt7lHEw1UB54zDBoSBs8mJQ/99xTbz0zJRMz1jes7yemNA29kE96Wa1YuAfMemSNLm
	 wL/zJzgGg61kIWWtI4qAStmfxtP7OUixmScoFO6KOkrN9kmPZrELV0CNQdC6XiQ10H
	 m4H7AMgl8i1K22wAizWXkC/JrNHtO3sNOq04uUiCgjY7UxV/72tQYN8KBl83RJ5LDM
	 o8uTCnOHPShkA==
Date: Tue, 17 Jun 2025 09:20:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
Message-Id: <175016979717.2093508.10482380045650208426.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: mediatek: mt8186-corsola: Consolidate
 and add new devices
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


On Tue, 17 Jun 2025 16:19:57 +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v3 of my "component probe for Corsola devices" series.
> 
> Changes since v2:
> - Rebased onto next-20250616
> - Collected reviewed-by tags
> - Dropped driver changes that are already in v6.16-rc1
> 
> Changes since v1:
> - Reworded commit message for Elan I2C-HID binding change
> - Dropped I2C address constraint from Elan I2C-HID binding completely
> - Dropped enum from new compatible string entry in Elan I2C-HID binding
> - Picked up Rob's ack on two binding changes
> - Rebased onto next-20250417, resolving conflicts with "spherion
>   component prober" changes
> - Link to v1:
>   https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/
> 
> Here's a follow up series of the I2C component probers for Chromebooks.
> This series enables the component prober for the Corsola series of
> devices, combines the two existing Voltorb SKUs, and adds a new
> device, codename Squirtle.
> 
> Patch 1 adds a new entry for the Squirtle device to the bindings.
> 
> Patch 2 fixes up the existing device trees for the component prober to
> be active.
> 
> Patch 3 merges the device trees for the Voltorb device.
> 
> Patch 4 adds a device tree file for the Squirtle device, with I2C
> components ready to be probed by the prober.
> 
> Patch 5 enables the prober to probe trackpads on some devices in the
> Corsola family.
> 
> Patch 6 enables the prober to probe touchscreens on Squirtle.
> 
> 
> Everything has been reviewed. Dmitry, please give an Ack so we can merge
> everything through the soc tree.
> 
> 
> Thanks
> ChenYu
> 
> Chen-Yu Tsai (6):
>   dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
>   dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
>   dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
>   arm64: dts: mediatek: mt8186-steelix: Mark second source components
>     for probing
>   arm64: dts: mediatek: mt8186: Merge Voltorb device trees
>   arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
>  .../bindings/input/elan,ekth6915.yaml         |  12 +-
>  arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
>  .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
>  .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
>  .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
>  .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
>  .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
>  ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
>  10 files changed, 138 insertions(+), 33 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
>  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
>  rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)
> 
> --
> 2.50.0.rc2.692.g299adb8693-goog
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250617 (best guess, 8/9 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250617082004.1653492-1-wenst@chromium.org:

arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#






