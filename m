Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE3C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h5W4CZb41J9mEMMU6ZZk+XRq4XRRTtTn42DnFEFGEQ=; b=YlJiWrsWtd2SRrHigUWjQ7ToFF
	xlU0w+4pTLmK1mbpg0JyVAAw9QfyODjZ1yAJj/YWygDKxzHe2y6npOgpfZXkyTbIto3G9W0lxrXoA
	NyMPiQR1VIxkqCXOaUU+Dw6Nx5LmQ5eUXw/F6KHcDc/hwA/BFNkins87KsdX8Ey8PEygyJhxkeRhC
	Mz/CD/xYUifQV5nSmXlVAxX8UtSqdvV+X3qqR/YwQV+Jz1ZQT8D7y0baSTof3u0JHqFkqSP+O8kV1
	wdTrlIg44DXcnHOWcEGr5wgBUoDwjGYbTxFVSzNid7yjAtAaT9ggXswANjewPARCPDNLnq4NMrda/
	KsEK2t7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlHD-00000003bYs-1jdS;
	Mon, 23 Jun 2025 17:48:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi3m-000000031xi-0XZm;
	Mon, 23 Jun 2025 14:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B7A85C5DB6;
	Mon, 23 Jun 2025 14:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C01C4CEEA;
	Mon, 23 Jun 2025 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750688529;
	bh=M8/FB18nORJdfDyegU9zi8E3Z4snaCgnu0tkxZFO1MA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=imQ0wxZSqqpK9O+CKmtdYgA7zX444k0D+P/xGxcsMHNi0t5HHoQFbzfyUpLJ/INPy
	 Ae7mEAFxSUkYY7TIccBy1jdNxc84YLUSe4DaTp+gaUiPdx2P8814uacmsuv8OXzfwF
	 tX+tl7fkVGFELnjSKSrOh7LC5AGSgp+wVq5PyPGMrK8gK4PKyJZOsIXodHOBt4fWg0
	 1J4/qtxL7YIIBzj1bN012w/fC7s/DgLpgAcAphyKoWD04o255JAy+4aBYhKup2yAyV
	 ewmgZgb8vmG+e0QFViZ7udLfHuXHqYZGp2Ln5vwN+3tYLOfmWmuhjHtKMEuITO3GBL
	 LRbEDXQEX4lFA==
Date: Mon, 23 Jun 2025 09:22:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 kernel@collabora.com, devicetree@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
Message-Id: <175068852802.3230004.1923972457454728043.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek
 MT6363 series SPMI PMIC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_072210_247873_FD735085 
X-CRM114-Status: GOOD (  11.87  )
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


On Mon, 23 Jun 2025 14:00:37 +0200, AngeloGioacchino Del Regno wrote:
> Add a binding for the MediaTek MT6363/6373 (and similar) multi
> function PMICs connected over SPMI.
> 
> These PMICs are found on board designs using newer MediaTek SoCs,
> such as the Dimensity 9400 Smartphone chip, or the Chromebook
> MT8196 chip.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml:
	Error in referenced schema matching $id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml
	Tried these paths (check schema $id if path is wrong):
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
	/usr/local/lib/python3.11/dist-packages/dtschema/schemas/regulator/mediatek,mt6363-regulator.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): regulators: 'oneOf' conditional failed, one must be fixed:
	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#"}
	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#"}
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: /example-0/spmi/pmic@4/regulators: failed to match any schema with compatible: ['mediatek,mt6363-regulator']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250623120038.108891-2-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


