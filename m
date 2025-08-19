Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4379CA0EFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1qvlXg8DsVAJN08O0NE0q6A8gMNQiG5QeP11hOQaZA=; b=zIn6oQprYcguUwLHdkibyhx3mj
	7/GJLdqZpuPgMMKu2NUg827EG2fuqNfiStPqE74QAEX8iSFzDkPYCkfY0XYpoj9ZTNsANaBbyOqio
	2vrCVC9qGrrOHhKbUQA3JIADVYccjMBL3oMZUOxU21MPAaI8ixU7DIKevbjaRioGzxyFIXSPthcan
	p6vcc3j9gFzIaIDLZPb+GBIQQupHP3bE7dUI2sqmf4sw/GdgFKqVehliW/wSHmComckiHm1fHrES/
	TARjl6PUk9z5ITVbc8FOZ5EdOs+NSyTMXT9/eZt64rj8+oW/n3Gw5/+iE1PnvXYwBODX4lauMBH7y
	Tnw4TkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpT-0000000BByI-2au8;
	Tue, 19 Aug 2025 18:13:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoM6C-0000000AXcK-466o;
	Tue, 19 Aug 2025 13:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26DF661432;
	Tue, 19 Aug 2025 13:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9997FC4CEF1;
	Tue, 19 Aug 2025 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755609000;
	bh=hD9tklixCimPO7j0d38+GrqpKU9DTflGHV5ucMi/2rs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HULyFZFoPK2W5GWcnJ3grCjr5a/JJDnhvW76IKKsUMfq47E10kHpXoz9KbxUnWmL/
	 Iik8wL0rd7DJ5N4TSoObFEIwTn/MvKYzfnna6ztqZjdGkM5o1VBSlimIWUAL71MkDL
	 Dz3hEG7lRJVm5UL1tLGGJbq6DrLifVZvHcXDStQg+JHDahpxZ1+JwLvYrUpVc84WSc
	 JQnChPr6TefUtfPcFMHgv3gGdodpnWZOfxylw9cmOtW8PifF3PnZcoVxQ/jSmav26t
	 TnvB8bjdtO+PddVCeFJH4EQLCP+SyQp4Qa6Ae0psxjZV5LI5CAjEzuDSymH4ZydlwW
	 rZnx+ugfwI7ng==
Date: Tue, 19 Aug 2025 08:09:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
In-Reply-To: <20250818-rock5bp-for-upstream-v3-1-d13f3cdec86c@kernel.org>
References: <20250818-rock5bp-for-upstream-v3-1-d13f3cdec86c@kernel.org>
Message-Id: <175560761722.43635.9593798407318901845.robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add USB-C support for ROCK
 5B/5B+/5T
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


On Mon, 18 Aug 2025 20:13:44 +0200, Sebastian Reichel wrote:
> Add hardware description for the USB-C port in the Radxa ROCK 5 Model B
> family. This describes the OHCI, EHCI and XHCI USB parts. The DisplayPort
> AltMode is only partially described, as bindings for the necessary
> DisplayPort controller are still being reviewed.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> This series adds USB-C support for the ROCK 5B, ROCK 5B+ and ROCK 5T.
> 
> Now that [0] has been merged, this should finally work reasonably
> stable. Note, that there is a regression in 6.17-rc1, which breaks
> stable operation again. I've send a revert of that in [1]. I think
> it's time to enable the USB-C interface, so that we can claim further
> breaks as proper regressions :)
> 
> [0] https://lore.kernel.org/all/20250704-fusb302-race-condition-fix-v1-1-239012c0e27a@kernel.org/
> [1] https://lore.kernel.org/linux-usb/20250818-fusb302-unthreaded-irq-v1-1-3a9a11a9f56f@kernel.org/
> 
> Changes in PATCHv3:
>  - Link to v2: https://lore.kernel.org/r/20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org
>  - Rebased to latest for-next branch from Heiko
>    - Dropped merged patches for initial ROCK 5B+ support
>  - Renamed series, since it just adds USB-C support now
>  - Fix pinctrl for Rock 5B SBU DC pins
>  - Also handle ROCK 5T
> 
> Changes in PATCHv2:
>  - Link to v1: https://lore.kernel.org/r/20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org
>  - Replaced DT binding patch with the version from NAOKI
>  - Dropped unused pinctrl for vcc5v0_host_en from the shared DT
>  - Moved USB-C SBU DC pins to board specific files, since they differ
>    between Rock 5B and Rock 5B+
>  - Added pinmux for SBU DC pins
>  - Rebased to latest version of Heiko's for-next branch
>  - Disable USB-C on Rock 5B for now
> ---
>  .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 136 +++++++++++++++++++++
>  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  12 ++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  12 ++
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  12 ++
>  4 files changed, 172 insertions(+)
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
 Base: using specified base-commit 7f0817eee7ba40b48e956955d6fd8ba14750168c

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250818-rock5bp-for-upstream-v3-1-d13f3cdec86c@kernel.org:

arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: pinctrl (rockchip,rk3588-pinctrl): usbc-sbu-dc:rockchip,pins: [[0, 20, 0, 268], [0, 21, 0, 268]] is not of type 'object'
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#






