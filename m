Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56592D3EE95
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vs0J0OmrF0vBW4/xabK+Y2RxzbYluA80dV+Xe9eXSxk=; b=nIkNg5VmtGjHklG4mX0oF+2203
	bmpbgVFTcgh8fgKbFSWX+98oFSCMWBamb4oO+XrIjnqW4hAJdY4ZiwalkCk/vpjfilqLrJXgqJpVv
	rNRTQMGvFeQqgoR6HdY9k9ElvtLxIeMKvnw3/afVw+WPgcagbndqHDAgCaB6SjyDHXRstnTHhQXBb
	WGZmbFWk+JWb7+oqV2mQh2qGPz1d7NRlQs/1y3LeR8ANSCiI0lnXlB+WzFx2qzjL3WHZY4BstpR30
	wkgrz6XmHzmhw4xXDnneTOF5TPv/pOor2K81M4XxCCdWN0PYt9ahiO9i9oaKpzbUKz0kxzynQ5/pa
	YyW4H93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyHc-00000007XsV-0X1B;
	Thu, 22 Jan 2026 17:15:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyHV-00000007Xr5-02pX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 026C740205;
	Thu, 22 Jan 2026 17:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC466C116C6;
	Thu, 22 Jan 2026 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102139;
	bh=Y3D9E7japclI7UuExtcL6bPuCRUqGKopPtgcI3tpo7Y=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=jTQTg8Gu2G1yoe/UvGnuAwgLgBGxCYlqGnyfSceJG959OW2YlVwhPsA/PR0l2qA9w
	 8zdYytO9RmmHcwx7lGtPhbxjvtUszkOMmSk1gGd6xSGHTwNbK0/jXMHjM9ZgqksdNJ
	 zOoWhDmtS6HdKUpqyb4zk5SwropokIu3Y5vEX2eWIbg82ohHpB8RHiVQaa8qtSK7GG
	 OkB7ha3F1qdqLg2DlrHm76NbY4Guja+oBX3TWdgSnvlH2THT/rCgYDER3Kv3JSPVmX
	 vGrfH7RiYDRIWz5zden6QseDozqL/maNI66WE4Y73NorzzXTGu3KGnglxL4eU8yLgP
	 wg6bKKvp7MGgQ==
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 11:15:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, rosa.pila@samsung.com, 
 selvarasu.g@samsung.com, linux-samsung-soc@vger.kernel.org, 
 muhammed.ali@samsung.com, faraz.ata@samsung.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dev.tailor@samsung.com
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
In-Reply-To: <20260122130721.205664-1-pritam.sutar@samsung.com>
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>
 <20260122130721.205664-1-pritam.sutar@samsung.com>
Message-Id: <176910209177.2703219.7993114273484886473.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_091541_088889_3DB17566 
X-CRM114-Status: GOOD (  19.16  )
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


On Thu, 22 Jan 2026 18:37:18 +0530, Pritam Manohar Sutar wrote:
> This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
> controllers and among them, one single USB3.1 DRD combo phy and three
> USB2.0 only phy controllers. This patchset adds and enables USB and
> USB-PHY nodes in dts.
> 
> PMIC is not implemented yet, we rely on USB LDOs being enabled by the
> bootloader and used dummy regulators for now.
> 
> To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
> GPIO expander is present in the dts, we used it to enable the regulator
> using GPIO.
> 
> USB ports are configured as OTG, and default mode is configured as
> peripheral. It will be changed based on requirements.
> 
> changelog
> ----------
> Changes in v2:
> - As v1 was pushed 3 months back, resending this patchset.
> - Since dependencies are merged, removed links from coverletter.
>   link for v1: https://lore.kernel.org/linux-devicetree/20251024114845.2395166-1-pritam.sutar@samsung.com/
> 
> Pritam Manohar Sutar (3):
>   arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
>   arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
>   arm64: dts: exynos: ExynosAutov920: Enable USB nodes
> 
>  .../boot/dts/exynos/exynosautov920-sadk.dts   | 160 +++++++++++++++++
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
>  2 files changed, 322 insertions(+)
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20260121 (exact match)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20260122130721.205664-1-pritam.sutar@samsung.com:

arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy0 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy1 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy2 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy3 (usb-nop-xceiv): '#phy-cells' is a required property
	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml






