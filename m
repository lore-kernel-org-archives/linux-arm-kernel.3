Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E6CFA3748
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9/cyym+/DfK2OFFlTAuA/gYJ7fuinLT7BhZQPgGI3M=; b=lg1+LTvnM4tX355sFSfObnb+ke
	jWHNPc6O3hf6ULpLOLS6IKh5P1ZUji/bX73YhM5NBwPTD3D00Rqqa8x5AKttuhZr+Pqf3BaJR42er
	7PTm4qCA/SKUbX15/2lcaP2hm0CaNGLffH83NU8qBa+jaGVVAgBOYXEGiIjeeybMK8b9SH3pP1721
	P8vnHLHvcZWRMGRArC4T8sCT8g+AOUMuPSOKJ8tXkEZiTxUSqLLlxpl6kTFd9iYoo4qqB+8//4nxG
	3RvHCq9VWYlQRUlu7nfSgAFJOBceCKsyMPX/bfznVKBq27nZjKUyqMvIocNE9F81+G3EqK+oFwcUO
	0KAQklaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgNJ-00000008N7w-3Tc3;
	Fri, 02 Jan 2026 14:43:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgNJ-00000008N7l-0mYy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 443B860017;
	Fri,  2 Jan 2026 14:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85CAC116B1;
	Fri,  2 Jan 2026 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767365012;
	bh=A+8X0NBzr9TPRNyigMz6i3+r5a1fElrFiP6pdg32e2s=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=QrIZ2SJagVn0VER8RsCenBI2lwkRIcXI+ZiKV81NxH44DK+7uiWIJwem6zPmI5Atl
	 t69f6RLSCBYeokHmW7hU/a6HO5t9SWeqzC2JfpX2LoK1c+PsmEz9KcqcXpY86YiW+h
	 agel48jjUFxVfbiCLTVuacH5qIbw4UgYXy/mumBYD7PuU3wMCR4xc+N6O2eA6Pkn4z
	 rDvf2oFkAtnB9eaanp7ZOUSLSdaAEQmP+J6Jo0oZVvycF3qfeKTW3s1h1RaQV7Wabt
	 14HXkH8VLhu8ryESQM2nz7Hm/Mqf0HINzk33HYGxa98q+hWi1chjRcDIsVulAIzdzH
	 uNbw4pWDpcQJQ==
From: Rob Herring <robh@kernel.org>
Date: Fri, 02 Jan 2026 08:43:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, romain.perier@gmail.com
To: Daniel Palmer <daniel@0x0f.com>
In-Reply-To: <20251231025502.1139168-1-daniel@0x0f.com>
References: <20251231025502.1139168-1-daniel@0x0f.com>
Message-Id: <176736452633.3671396.18144388035733380364.robh@kernel.org>
Subject: Re: [PATCH 0/5] Sigmastar DT warnings fixing part 1.
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


On Wed, 31 Dec 2025 11:54:57 +0900, Daniel Palmer wrote:
> I saw a slide at LPC that had sigmastar in the "hall of shame"
> for DT warnings. I finally got some time to look at this so
> I have fixed the ones that are obvious and quick to fix.
> 
> I'll fix the rest but they might take a bit longer i.e. one
> of them is about the register shift for the UART registers,
> that'll need the binding to be updated I think?
> 
> FWIW this platform isn't dead and I have been rebasing all
> of the out of tree stuff that make it useful (Audio support,
> display, hardware video decoding etc) but its basically stuck
> on rewriting the clock driver so that it is mainline-able.
> 
> Some other people have taken the limited support in mainline
> and my out of tree stuff and made it run on old MStar MIPS
> machines too..
> 
> Daniel Palmer (5):
>   arm: dts: mstar: breadbee: Correct regulator names
>   arm: dts: mstar: breadbee: Correct LED names
>   arm: dts: mstar: infinity: Correct opp table name
>   arm: dts: mstar: v7: Move the reboot node
>   arm: dts: mstar: v7: Add sizes and ranges to sram
> 
>  .../mstar-infinity-breadbee-common.dtsi         | 10 +++++-----
>  arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi |  2 +-
>  arch/arm/boot/dts/sigmastar/mstar-v7.dtsi       | 17 ++++++++++-------
>  3 files changed, 16 insertions(+), 13 deletions(-)
> 
> --
> 2.51.0
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
 Base: tags/next-20251219 (exact match)
 Base: tags/next-20251219 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/sigmastar/' for 20251231025502.1139168-1-daniel@0x0f.com:

arch/arm/boot/dts/sigmastar/mstar-infinity-msc313-breadbee_crust.dtb: leds (gpio-leds): led-red:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
	'activity' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
	'activity' does not match '^cpu[0-9]*$'
	'activity' does not match '^hci[0-9]+-power$'
	'activity' does not match '^mmc[0-9]+$'
	'activity' does not match '^phy[0-9]+tx$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
arch/arm/boot/dts/sigmastar/mstar-infinity3-msc313e-breadbee.dtb: leds (gpio-leds): led-red:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
	'activity' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
	'activity' does not match '^cpu[0-9]*$'
	'activity' does not match '^hci[0-9]+-power$'
	'activity' does not match '^mmc[0-9]+$'
	'activity' does not match '^phy[0-9]+tx$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml






