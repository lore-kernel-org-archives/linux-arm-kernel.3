Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DECC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsNs9dlzIsPw1n+dGjUVmTdA3V8aHtepoq7JGw3Pc2Q=; b=EssGBEhq0OtIqWbZklrcVPHbt/
	R3PK2qt9pMzPFY/pTZrTseBm3EFc0d8JM0F236r3CS+1FH3m58jWUR9PUuk5rjIaeazxx/H+uaiB8
	xPFVB4tc7a1xu7QJS5YAh+Mkq6iRHXQ7J36z/Xouj3+vH5f9xG3Sz83hJITqo+t//6ei50klcfYDW
	beg5FADUId891Ri81jPnz6XQPRPncQnDbYv1jTmUUTcuCXveHAApklLWWHjVvZcvRoEHE3fssbsqC
	oFexLNL/1jNFFmWD/XFtGYwxoLRcCa6jifLMB2E8e4qA6gSWsYI9fgdqvR1fksk+JThJ2k5s0AYJs
	1Bu2n5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x164A-0000000AEFc-0Hw6;
	Mon, 31 Aug 2026 17:45:06 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1646-0000000AECu-2ojg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788198300;
 bh=TsNs9dlzIsPw1n+dGjUVmTdA3V8aHtepoq7JGw3Pc2Q=;
 b=haYskUrSoGOQjabJbHw1CvMIkBJAjGgC3LpJY6TjfLEzyAEVNn/QrLzBji03QT3b7gNUx6Hk3
 +rTgV+hDoJdPlp9AGvPYd2brwuBHaM6bcUMcWWk0jdUM30XOHWqfrtvr7UrveKv75Hky2VzBF8e
 IUj2nON2IXY6HNvOo6o6Biq5kB093DEHN+Cs5ZNu9nWG+1Pt2NEg4uoQAXCcei4vtux7ejjgBnY
 f8ZtcSNJl0WKLDAayBQA27ev4D72eXcrYWQl9kxC5bHxQ32fBnEKUX/jYnN8y+5x9RMPTaeqptn
 9+DFX+VUloloNKrUtuDFf8nq216tMfQDj6ctoLLA3Rtg==
X-Forward-Email-ID: 6a95bd922e35a4d29984247e
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.14.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 31 Aug 2026 13:44:49 -0400
Message-Id: <DL3BE19I49N4.3AZNJMC0LVG6R@ubuntu.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/19] Initial USB4/Thunderbolt support for Apple
 M1/M2/M3 SoCs
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Janne Grunau"
 <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Andreas Noever"
 <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
X-Mailer: aerc 0.21.0
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_104503_035822_5A1D2CA2 
X-CRM114-Status: GOOD (  37.79  )
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

On Sun Aug 30, 2026 at 4:19 PM EDT, Sven Peter wrote:
> Hi,
>
> This series adds initial USB4/Thunderbolt support for Apple Silicon
> M1, M2 and M3 SoCs. Each USB4 capable Type-C port comes with an ACIO
> ("Apple Converged I/O") block which contains a Cortex-M3 co-processor
> and the hardware implementing the USB4 router.
>
> The NHI and DART IOMMU are part of this ACIO block as well. Instead of
> being exposed as independent always-accessible devices the main SoC bus
> only gets a 16 MiB window into ACIO's MMIO space while its co-processor
> is running. It is not entirely clear whether this is ACIO's own address
> space or a window into the co-processor's address space.
>
> This is why the device tree represents the NHI and DART as children of
> ACIO with addresses relative to that window. The driver only populates
> these children after booting the co-processor and removes them again
> before powering ACIO down. This setup is slightly unusual but matches
> both the MMIO layout and the lifetime of the devices.
>
> ACIO also has rather strict ordering requirements: it can only be
> started after the Type-C PHY has been configured for USB4/Thunderbolt
> and has to be stopped again before the PHY is powered down. It also
> needs cable details which are only known to the Type-C port controller.
> The existing Type-C mode switch cannot express the required reverse
> teardown order, so the first three patches add a separate Thunderbolt
> switch and hook it up to the CD321x port controller.
>
> The next two patches add the bindings for the NHI and ACIO. The
> following patches then prepare the Thunderbolt core for the slightly
> different NHI register layout and interrupt handling, read the USB4
> router DROM from the device tree and add quirks for functionality not
> implemented by the Apple hardware.
>
> The main driver powers up ACIO, boots the co-processor, populates
> the DART and NHI children once their MMIO regions are accessible and
> registers the NHI with the software connection manager. The last three
> patches add the device tree nodes for the M1 and M2. M3 nodes will follow
> once the rest of the stack is upstream, but the current Thunderbolt/USB4
> code has already been successfully tested on those.
>
> Right now only XDomain connections and USB3-via-USB4 tunnels are
> supported. Both PCIe and DisplayPort tunnels will come later since those
> require additional work and reverse engineering that is not done yet.
> Suspend is also not supported yet and we actually have to prevent
> suspending whenever an active connection is present because we would
> otherwise resume into an SError.
>
> This series depends on the Apple CIO reset controller [1], the ATCPHY
> USB3-via-4 pipehandler support [2] and support for specifying the DART DM=
A
> aperture in the device tree [3], a fix for CD321x Thunderbolt
> altmode VDOs [4], and fixes for making the DPTX capabilities read fail
> gracefully [5]. I couldn't split it any further since the remaining
> patches now directly depend upon each other.
> Except for the dts changes the series applies cleanly without these
> dependencies though.
>
> For merging it probably makes most sense if all of this (except for the
> DTS changes) is taken through the thunderbolt tree once everything's been
> reviewed.
>
> Best,
>
> Sven
>
> [1] https://patch.msgid.link/20260821-b4-cio-reset-v2-0-2d045f80a424@kern=
el.org
> [2] https://patch.msgid.link/20260821-b4-atcphy-usb4-v1-0-45c0b741e0c0@ke=
rnel.org
> [3] https://patch.msgid.link/20260819-iommu-apple-dart-aperture-v1-0-2527=
03f381aa@jannau.net
> [4] https://patch.msgid.link/20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@k=
ernel.org
> [5] https://patch.msgid.link/20260829-b4-tbt-fixes-v3-0-e1fab6ac54fe@kern=
el.org
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (19):
>       dt-bindings: usb: Add thunderbolt-switch property
>       usb: typec: Add thunderbolt switch
>       usb: typec: tipd: Hook up Thunderbolt switch for CD321x
>       dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt NHI
>       dt-bindings: thunderbolt: Add Apple USB4/Thunderbolt ACIO block
>       thunderbolt: Try reading host DROM from device tree first
>       thunderbolt: Don't read the UID if we already know it
>       thunderbolt: Allocate ring HopID before requesting the ring interru=
pt
>       thunderbolt: Add ring_interrupt_active to tb_nhi_ops
>       thunderbolt: Make the ring register layout configurable
>       thunderbolt: Add ring_interrupt_mask to tb_nhi_ops
>       thunderbolt: Add ring_configure to tb_nhi_ops
>       thunderbolt: Add QUIRK_NO_DMA_PORT
>       thunderbolt: Add QUIRK_NO_USB3_BW_ALLOC
>       thunderbolt: Export symbols required by the Apple Silicon driver
>       thunderbolt: Add Apple Silicon support
>       arm64: dts: apple: t8103: Add USB4 ACIO and NHI
>       arm64: dts: apple: t8112: Add USB4 ACIO and NHI
>       arm64: dts: apple: t60xx: Add USB4 ACIO and NHI
>
>  .../thunderbolt/apple,t8103-usb4-acio.yaml         |  218 +++++
>  .../bindings/thunderbolt/apple,t8103-usb4-nhi.yaml |  151 +++
>  .../devicetree/bindings/usb/usb-switch.yaml        |    6 +
>  MAINTAINERS                                        |    4 +
>  arch/arm64/boot/dts/apple/t6002-j375d.dts          |   67 ++
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |  384 ++++++++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi     |  107 ++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi          |  137 +++
>  arch/arm64/boot/dts/apple/t6022-j180d.dts          |  202 ++++
>  arch/arm64/boot/dts/apple/t6022-j475d.dts          |   10 +
>  arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi         |   57 ++
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |  384 ++++++++
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi          |   61 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  188 ++++
>  arch/arm64/boot/dts/apple/t8112-jxxx.dtsi          |   61 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  190 ++++
>  drivers/thunderbolt/Kconfig                        |   13 +
>  drivers/thunderbolt/Makefile                       |    3 +
>  drivers/thunderbolt/apple.c                        | 1028 ++++++++++++++=
++++++
>  drivers/thunderbolt/cap.c                          |    2 +
>  drivers/thunderbolt/ctl.c                          |    2 +
>  drivers/thunderbolt/domain.c                       |    2 +
>  drivers/thunderbolt/eeprom.c                       |   32 +-
>  drivers/thunderbolt/nhi.c                          |  132 ++-
>  drivers/thunderbolt/nhi.h                          |   32 +
>  drivers/thunderbolt/switch.c                       |   19 +-
>  drivers/thunderbolt/tb.c                           |   18 +
>  drivers/thunderbolt/tb.h                           |    5 +
>  drivers/thunderbolt/tunnel.c                       |   59 +-
>  drivers/usb/typec/mux.c                            |  201 ++++
>  drivers/usb/typec/mux.h                            |   12 +
>  drivers/usb/typec/tipd/core.c                      |   37 +
>  include/linux/thunderbolt.h                        |    3 +
>  include/linux/usb/typec_mux.h                      |  114 +++
>  34 files changed, 3872 insertions(+), 69 deletions(-)
> ---
> base-commit: 78bb208b99e7d3314f670710fa9ee0a793682bca
> change-id: 20260829-b4-apple-soc-tbt-a00e873a52db
>
> Best regards,
> -- =20
> Sven Peter <sven@kernel.org>

I unfortunately cannot test (afaik I do not have the devices) but a
glance over everything seems reasonable :)

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

