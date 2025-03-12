Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03F6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 01:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z03ZTe80QxcSZpdq4slszoiS/+Er/iRhTf01LzOX8j8=; b=rmTVu2GOHfoIVQTCDmMAgTIMhP
	iC8GM1oEB4y0MG9h5hPkDL6BitN//lc6eor+YLIy+wlTIhf/0k/PQ9xaKlnslVzoRcS2EhcQuer8b
	Y+04v9GEaMn/MWMXn3cEuH4MPKS8lwtwVGGgf5CiPkF9MKPlWV+hpUm1p0D/5QoX2/bR3qvh5IYXH
	XUVMIJ670Y8eIPaLp1yW6XNUNo07/epFu5L6awiKCdPLQpRQD9dD8SLXAEjKBO5sctH/UHAFEKqZP
	pRNMVNqokP9EzxWjc5p9gDZxtWB3uF+dTce2+2AslQHoKoPGsOLiCEqw76FsqETCeVvvigluRsWsg
	sZhX7jhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsBDK-00000007KrB-3mEj;
	Wed, 12 Mar 2025 01:48:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsBBg-00000007KjA-3Zlr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 01:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60FB3A46518;
	Wed, 12 Mar 2025 01:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B1DC4CEE9;
	Wed, 12 Mar 2025 01:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741744031;
	bh=2PiPcKwe8hU1SLSkxJ19ZbCFbcTwG0fVISzDHAZRDhg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WqAwRXDDKFC4K1SfTyLzadROtE69ikIcMNLT2cAKhZWQgbUNN6yGpJMu2AN2w+8Sw
	 jP7vOfLmRC56paRFDBDLCK8TwNM5jkcWKDhHMacVFNL4MbetNqoAji2UCwcrwq6wYE
	 fzdPL0/v76YP2aiaChIKzMxxSGsnjwZIT7Oci/mkz9PY5UOBEfHfQNHFWve+OzjccJ
	 3t6jOtLRfQKdcrxMpvr/RxNsEVE16ThXNv2cZKEs53/OYkcj5PuRRUqUHV6jEgpjcm
	 K7n+La3KxorCl4sc+97J0+g6iG+g8rp8g0Kh8a37eUEm32TG/LhVDwor6CdI883hOb
	 uxhPDM38CEH5A==
Date: Tue, 11 Mar 2025 20:47:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.li@nxp.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Message-Id: <174174398131.182748.13049437230815741677.robh@kernel.org>
Subject: Re: [PATCH v5 0/3] add sof support on imx95
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_184713_023314_CCCBC3D6 
X-CRM114-Status: GOOD (  31.06  )
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


On Tue, 11 Mar 2025 12:32:52 -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add sof support on imx95. This series also includes some changes to
> the audio-graph-card2 binding required for the support.
> 
> ---
> Changes in v5:
> - added comment in the DTS regarding the reserved DMA channels.
> - addressed Frank's comment regarding the widgets/routing properties.
> - changed codec and CPU EP names to include SAI3/WM8962 in their naming.
> Previous naming was too generic.
> - picked up some more R-b's
> - change soundcard DT node name to the more generic "sof-sound" as the
> soundcard might support additional DAI-CODEC links in the future.
> - change the soundcard label to "audio". Same rationale as above. The
> SOF core will append to it the "sof-" prefix, thus the resulting name will
> be "sof-audio".
> - Link to v4: https://lore.kernel.org/lkml/20250211225808.3050-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v4:
> - addressed Frank's comments regarding the DTS.
> - squashed commits for common and imx95 bindings.
> - dropped patch introducing driver. This was already handled via
> https://lore.kernel.org/all/20250207162246.3104-1-laurentiumihalcea111@gmail.com/
> - introduced two new properties: 'reg-names' and 'memory-region-names',
> which are now needed by the driver to work properly. Because of this, 'reg'
> and 'memory-region' properties had to be moved from the common binding as
> 'reg-names' and 'memory-region-names' depend on them (you'd get a failure
> when running the binding check otherwise).
> - added missing 'bitclock-master' and 'frame-master' properties to codec EP.
> - addressed Krzysztof's comments regarding the imx95 binding
> - added Krzysztof's Acked-by
> - Link to v3: https://lore.kernel.org/lkml/20241216145039.3074-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v3:
> - Ordered DT nodes alphabetically
> - Removed 'cpu' and 'cpu_ep' labels from binding example
> - Some small changes to the binding commit messages/titles.
> - Link to v2: https://lore.kernel.org/lkml/20241113195240.3699-1-laurentiumihalcea111@gmail.com/
> 
> Changes in v2:
> - Added new binding for 95's CM7 core with SOF. fsl,dsp.yaml is no longer used.
> - "hp-det-gpios" and "widgets" properties now reference the definitions from audio-graph.yaml
> - Removed extra empty spaces from DTS as suggested by Frank
> - Ordered 'edma2', 'sai3', 'wm8962' DT nodes alphabetically. The order of the nodes
> placed inside / is kept the same for readability
> - Ordered driver header files includes alphabetically as suggested by Frank
> - Removed "reg-names" and changed the maximum size of the "reg" property to 1 to align
> with the other NXP CPUs sharing the same programming model (i.e: audio processing with SOF).
> The region described in the DTS is the SRAM and the mailbox region is now hardcoded in the
> driver as an offset to the start of the SRAM region.
> - Added new binding with properties required by all NXP CPUs sharing the same programming
> model (i.e: audio processing with SOF).
> - Various driver adjustments made to accomodate the DT changes + some bug fixing related
> to the mboxes not being requested/free'd on resume/suspend.
> - Fixed value passed to "dma-channel-mask". A set bit means the channel is masked, not the
> other way around.
> - Link to v1: https://lore.kernel.org/lkml/20241023162114.3354-1-laurentiumihalcea111@gmail.com/
> ---
> 
> Laurentiu Mihalcea (3):
>   ASoC: dt-bindings: support imx95's CM7 core
>   ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
>     support
>   arm64: dts: imx: add imx95 dts for sof
> 
>  .../bindings/sound/audio-graph-card2.yaml     |  4 +
>  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 ++++++++++++++
>  .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
>  5 files changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> 
> --
> 2.34.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250311163255.2664-1-laurentiumihalcea111@gmail.com:

arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#






