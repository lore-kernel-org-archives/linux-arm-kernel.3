Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5707FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZzh9mBdmhE5Urajqv/ZTfilNnvYOwgh+F/3unwIIPs=; b=T5GU9w5UVxsfDBMjKCHApj3yJB
	wHSdDNYJT5Bc8KuCRrt1jBinLhSuBZd1WbXyj7H5rWxUE/fLWolydcfNbK3l4CEu6aGVrehBzg92t
	3FXwb2zGOw9X7DJXLqEf7lvZSOZxdXLhvQCb3+r7DLhHQze12JHr7IcTV2QQqGb5tThXMKFfCmHG4
	TlZSEp8RAAvEImzy4q90d+/Hdl817aeKlIyFBh9s7b5UPzeZ6sPyc/jNa8YB5SBg+prgWaPllVdf5
	yFZvp+fJfyEsVvCK1mJ2g/Up+yHTIpNWr0g1880NZKuDsyJa8lFfk6k2sb2LXTVnQMObP3Fxj450m
	zezIbUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL80f-0000000CqdR-3crP;
	Tue, 10 Dec 2024 21:43:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7zb-0000000CqNZ-3i77;
	Tue, 10 Dec 2024 21:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8838C5C631F;
	Tue, 10 Dec 2024 21:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FD7C4CED6;
	Tue, 10 Dec 2024 21:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733866926;
	bh=9qlaJJU5gDo5bAuPmvTR0FrAbcj50IZPIDpRze7PsRE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lwdYw6fX/UzDINS0WzcSNG4qwR4KxS518tnfSxkdS1wiU3HK2aTgUTVCIcxYckUwx
	 Nv+raN3nsb9s6DTvDNLhYni5Rmbn+lDrDQI+wwMux3kWkuS7cIyrbAjrHX9b/XAXFs
	 QLJWXCMGjpcJwuEaRKAo8fjwynI9JvtV6XIOS0sFR8/LJyDGCZAL0qVHBu9r0mE0/P
	 WyHB9D7luL16PhXsOVRuO9dFLAYT6LbyNFgyU7FIRScaDdhlzXF6ZjXaUa2rMTd/+O
	 8FmlimtO5sKqhDKgOLfbiyUbYJv4230M8+8cgvcg/aiNQ6QRtRzHJBk9nc4PF8zMdJ
	 1p6lND57gIEAQ==
Date: Tue, 10 Dec 2024 15:42:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20241210092614.3951748-1-wenst@chromium.org>
References: <20241210092614.3951748-1-wenst@chromium.org>
Message-Id: <173386568696.497617.3727087837255802552.robh@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC
 sub-node names
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_134208_011245_C0E26300 
X-CRM114-Status: GOOD (  11.86  )
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


On Tue, 10 Dec 2024 17:26:12 +0800, Chen-Yu Tsai wrote:
> The MT6397 PMIC bindings specify exact names for its sub-nodes. The
> names used in the current dts don't match, causing a validation error.
> 
> Fix up the names. Also drop the label for the regulators node, since
> any reference should be against the individual regulator sub-nodes.
> 
> Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
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


New warnings running 'make CHECK_DTBS=y mediatek/mt8173-evb.dtb' for 20241210092614.3951748-1-wenst@chromium.org:

arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vpca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vpca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vsramca15: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vsramca7: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vcore: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vgpu: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vdrm: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: buck_vio18: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vtcxo: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_va28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vio28: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vusb: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vcama: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vmc: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vmch: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vemc3v3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp1: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp2: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp3: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp4: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp5: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vgp6: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: regulators: ldo_vibr: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#






