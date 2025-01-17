Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C2FC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E97du1jBIpiCRokeFFeyg45GmkKa5zK/LBIBtq9IvI=; b=pbGiPor46MGfeXDVUTYsQ2Redu
	mKWrddeH63tsQsNL1FUjPTx+VyUvz1TlB1NF1K9TDeWfka9ffNnGUCrgnYhOGbg111UD8ZnURn9Hz
	7GZNWL4VnqrcIen4eLYX09GMnMW6r7GlolopkM/T5xesHzalTpKXDMxVzPfPxB3x2BsUtg1mtuySg
	c6/aGMdbS5fByAQzVw3k2AYA0lIMRp1rklV4oCyYU1FC0Dg56V7zeZ+MyfNbAOhqasQ/19OFO1S7Q
	KHz0JwUYIendlpBOQojUfvobzMdTPBSHyfJIh28KS/S7ZgwO6g7ea8v8qY/u5PiQfxBkETIXtJ3J0
	WInCuTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnPh-00000000Uwj-0KgS;
	Fri, 17 Jan 2025 14:33:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnOQ-00000000Uj9-1iZs;
	Fri, 17 Jan 2025 14:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE9F8A42BCA;
	Fri, 17 Jan 2025 14:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15454C4CEE2;
	Fri, 17 Jan 2025 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737124333;
	bh=T8PZajPEts8hiVvPkTDdvWpLe1pkhFePBotfq454ChY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LFqFrkFEVNscEv0YeH/sYXrvxMdJfFMAieYNA9i6pmPXd5QRzY9yu4XZfaN3AGxs8
	 G+iNr6qE6o1sRfc5gCjwUPkIwye8trsk/Cs9NUNL9XNCKcb3xzrfdVhF46tOXU3W41
	 6pLgLP2VN4QJCFsdjup8taPy0yvUFkfC1q7XOIwp2yLqAYCv9kSzg1yWiFos0170cQ
	 53U/W3W0Wan8pQOT1+o9rtr4NrzsUwCpXNdQ4x7+Esv8Amj3gt2vXRrKfj49xGNJau
	 jwIZo8tlX2NASe3CQYA6uSF/ohvcX5tz90ixxEhcnZlXXQw+fyXOnMHOOE3abk0ydD
	 bh+SYtZ9nE+Fw==
Date: Fri, 17 Jan 2025 08:32:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, linux-mediatek@lists.infradead.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Steven Price <steven.price@arm.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In-Reply-To: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
Message-Id: <173712392224.809745.9286641261845067078.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add Mali GPU support for Mediatek MT8370 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_063214_590941_61BFC509 
X-CRM114-Status: GOOD (  18.89  )
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


On Thu, 16 Jan 2025 15:25:56 +0100, Louis-Alexis Eyraud wrote:
> This patchset adds the support of the ARM Mali G57 MC2 GPU (Valhall-JM,
> dual core), integrated in the Mediatek MT8370 SoC, to the panfrost driver
> and to the mt8370.dtsi include file.
> 
> I've testing this patchset on a Mediatek Genio 510 EVK board,
> with a kernel based on linux-next (tag: next-20250113) plus [1] patchset.
> 
> The panfrost driver probed with the following messages:
> ```
> panfrost 13000000.gpu: clock rate = 390000000
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>   80000400
> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
> ```
> 
> [1] https://lore.kernel.org/linux-mediatek/20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com/
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> Louis-Alexis Eyraud (3):
>       dt-bindings: gpu: mali-bifrost: Add compatible for MT8370 SoC
>       drm/panfrost: Add support for Mali on the MT8370 SoC
>       arm64: dts: mediatek: mt8370: Enable gpu support
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml |  5 ++++-
>  arch/arm64/boot/dts/mediatek/mt8370.dtsi                    |  9 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_drv.c                     | 10 ++++++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250115-mt8370-enable-gpu-3b6f595fa63d
> prerequisite-change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9:v2
> prerequisite-patch-id: af53ae39240467340ac4c9cdbc8fdd949c5457a2
> prerequisite-patch-id: ca07485956f81c1a40029b48d2b4bcf00d74fc13
> prerequisite-patch-id: c34d9870b2c61d87ad8a6facba13d8970682e679
> prerequisite-patch-id: 48784acdcdd8b886fdec9f21c9cb88abb327e2e1
> 
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com:

arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pinctrl@10005000: 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: regulators: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic: '#sound-dai-cells', 'mt6359codec', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: jpeg-decoder@1a040000: iommus: [[123, 685], [123, 686], [123, 690], [123, 691], [123, 692], [123, 693]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#






