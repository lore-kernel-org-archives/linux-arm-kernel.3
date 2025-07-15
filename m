Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1AAC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PBGepCzoY7P/f08Fg12Jnrv5/4eDmos1XjS6yGb0EI=; b=k1D4Aek7JVXFNpr6/FSV0SpoNA
	1zZF68MOVjOsl5fyyERbc+C+c8eheTm58jNqJ7A/ZkgZFJGrLQLVc+uG5xGg2P7SGbUE3WQl7t7Mc
	u+KjirW6sXqDXjxYMB6pWz5U2a3rRN6x2y9Ai28C2mvuNpKZwNuoLMXC9hB8J082Jh26kq2Zvtafd
	bN/uMcLpMAF+aT1B4w+BneXiOditNbIBvzCHTMVoK4Ul1nH8eAbM80H6a4O+ZL87Hp34NKfGKj2sO
	LrdqpnEuh1Yz+7WIY3Zq3GXD5RWoKOR5Sn4ehBmca+dedEpP5kl4Q/LV03pq4X8TtDOZUPeDRR+nj
	2BtpuGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhUX-00000005a3Y-1qnn;
	Tue, 15 Jul 2025 15:22:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg8P-00000005HUe-0hwy;
	Tue, 15 Jul 2025 13:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E1816145B;
	Tue, 15 Jul 2025 13:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C196C4CEE3;
	Tue, 15 Jul 2025 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752587752;
	bh=3ngcOIaOr9/kn0rm9Ep+Y5YgUFsEHXd3c3S/Dc4U5dA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pcZTnaijwnzxsqNvjW31Zb/n4Zn1KlEf4LpAz8yjo/tmZ2LlVlrWeg5tEyHIkSXTO
	 MzLaStAI+DuPken0YzpgxcGJW5+wnyS4Jg0oakKJWBs+MA1a5XQ1NFB6J9enJUQk+f
	 UbjawoubJuNasGZyQpn5iM0jakFoKZkgyBp7Tf873GGX9hoLuNhF4QKuwW8Uq44USf
	 tcIYS30jlZmJ5fWc/y1+nF1cV/hTfysuofJSvUyzURPvpilnQMwfrLAb39x34LycbT
	 vKhAKDiqABo4yzuI8fjW1cpjMMMg+LT6/uaACrTm5bLTO7/876lX86cLrr5zhZBWLK
	 O2w0mCnlWyzqA==
Date: Tue, 15 Jul 2025 08:55:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: broonie@kernel.org, lee@kernel.org, 
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, 
 conor+dt@kernel.org, wenst@chromium.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 krzk+dt@kernel.org, lgirdwood@gmail.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715115718.176495-8-angelogioacchino.delregno@collabora.com>
References: <20250715115718.176495-1-angelogioacchino.delregno@collabora.com>
 <20250715115718.176495-8-angelogioacchino.delregno@collabora.com>
Message-Id: <175258775126.1133153.9935401889666941502.robh@kernel.org>
Subject: Re: [PATCH v4 7/8] dt-bindings: mfd: Add binding for MediaTek
 MT6363 series SPMI PMIC
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


On Tue, 15 Jul 2025 13:57:17 +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Link: https://lore.kernel.org/r/20250623120038.108891-2-angelogioacchino.delregno@collabora.com
> Link: https://lore.kernel.org/r/20250707134451.154346-8-angelogioacchino.delregno@collabora.com
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): adc@1000: 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): regulators@30: 'oneOf' conditional failed, one must be fixed:
	'reg' does not match any of the regexes: '^buck-(sshub[124]|vb[1-7]|vs[1-3])$', '^ldo-v(aux|m|rf-io|tref)18$', '^ldo-va(12-1|12-2|15)$', '^ldo-vcn(13|15)$', '^ldo-vio(0p75|18)$', '^ldo-vrf(0p9|12|13|18)$', '^ldo-vsram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$', '^ldo-vufs(12|18)$', '^pinctrl-[0-9]+$'
	'reg' does not match any of the regexes: '^pinctrl-[0-9]+$', '^v(ant|aud|aux)18$', '^v(cn18io|efuse|ibr|io28|sram-digrf-aif|usb)', '^v(f|t)p', '^vbuck([0123456789]|4-ufs)$', '^vbuck4(-ufs)?$', '^vcn33-[123]$', '^vmc(h)?$', '^vmch-(eint-low|eint-high)?$', '^vrf(09|12|13|18|io18)-aif$', '^vsim[12]$'
	'mediatek,mt6373-regulator' was expected
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: regulators@30 (mediatek,mt6363-regulator): 'reg' does not match any of the regexes: '^buck-(sshub[124]|vb[1-7]|vs[1-3])$', '^ldo-v(aux|m|rf-io|tref)18$', '^ldo-va(12-1|12-2|15)$', '^ldo-vcn(13|15)$', '^ldo-vio(0p75|18)$', '^ldo-vrf(0p9|12|13|18)$', '^ldo-vsram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$', '^ldo-vufs(12|18)$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: adc@1000 (mediatek,mt6363-auxadc): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250715115718.176495-8-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


