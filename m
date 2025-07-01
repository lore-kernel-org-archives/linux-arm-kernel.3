Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D37FC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk6elp7+GNhOSfGgHSBskSrkAu5rtLm+QGtFYvJqEBk=; b=uWbq2RyOZQ4Gv7Bn0Y4tjYk0oB
	8O/njfL76Kto8+6e4ds+sbLmV5ToaypjAviTHqg/jSvMfPwrNLfUNJYciimZH8/Z9738HuYFuWyQt
	5bz/X0Nt2wpxTTq6L7MTvfazInJIOmZH+JxRziQ4AGh+XaNIqkRH2+lvtgJzrALG93s2xorp4d02j
	8A751yFumAtIQt75lHhx3GCab61c2wpLBxhLe0sAfQHZ6A5TwV0FNyzCYf58g1hrqJ16TjrodE4yV
	d6HwcvAkSXcROKe7ilMJRTsOVsBIU24S20kCoFZn0ltiFBIKHLb56ovwRzMYrdRnNvej6z5h+8c3/
	JRBpDTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDU-00000006PFw-1YGg;
	Tue, 01 Jul 2025 19:00:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWduk-000000063Mf-0QKx;
	Tue, 01 Jul 2025 16:32:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDDA143A8F;
	Tue,  1 Jul 2025 16:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759A9C4CEEB;
	Tue,  1 Jul 2025 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751387577;
	bh=DKU+hY2Pi8zMDGgIyWh0V+54nxG1K37l+J7KI53nCWY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KzHvv04Wn0A1brDCcoyn5UjpHQJF6OUINA3RUK+fdO2OVhy5EEjoxUwYnOhjS4pCB
	 JmDT0tmx21+fzo/fop3OHhS/5PmQgErX6Q2Tq48UZfWV6fCwu+g7jK76F46It89A2L
	 fKuxxQ0WFN9L2jM/ds8giXe0TACzG3+3ds/nqB+c0Nidvitj5T8HHzGcLCy86HBsaV
	 JAWXBWeF8Ny/roZYO9D6TNlkIIYzXt3moX4mow5JBy9uv1r5NNUvUB1CsvE0y2/dw9
	 CMCMSGx8av8q3tFegW0J/5XRPdsFqNTkeu4OYHyJRWw5/2t0GaY7hnKXcd3faSOZCz
	 oMEJ4KNxXXHzQ==
Date: Tue, 01 Jul 2025 11:32:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: laura.nao@collabora.com, matthias.bgg@gmail.com, 
 quic_hyiwei@quicinc.com, devicetree@vger.kernel.org, kabel@kernel.org, 
 kernel@collabora.com, arnd@arndb.de, ulf.hansson@linaro.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, khilman@baylibre.com, 
 pjp@fedoraproject.org, u.kleine-koenig@baylibre.com, 
 linux-mediatek@lists.infradead.org, nm@ti.com, tudor.ambarus@linaro.org, 
 m.wilczynski@samsung.com, drew@pdp7.com, krzk@kernel.org, 
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
 <20250701151149.136365-3-angelogioacchino.delregno@collabora.com>
Message-Id: <175138757651.1874576.12579481478499163218.robh@kernel.org>
Subject: Re: [RFC PATCH 2/3] dt-bindings: firmware: Document the MediaTek
 Hardware Voter (HWV)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_093258_178054_A96395E6 
X-CRM114-Status: GOOD (  10.77  )
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


On Tue, 01 Jul 2025 17:11:48 +0200, AngeloGioacchino Del Regno wrote:
> Add documentation for the new MediaTek Hardware Voter, found in
> MediaTek SoCs like the MT8196 Kompanio Ultra for Chromebooks and
> the MT6991 Dimensity 9400 for Smartphones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6991-hardware-voter.yaml       | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.yaml:44:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dts:39.35-43.11: Warning (unit_address_vs_reg): /example-0/clock-controller@16640000: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dtb: system-controller@14500000 (mediatek,mt6991-hardware-voter): power-controller:compatible:0: 'mediatek,mt8196-hwv-scp-power-controller' is not one of ['mediatek,mt6735-power-controller', 'mediatek,mt6795-power-controller', 'mediatek,mt6893-power-controller', 'mediatek,mt8167-power-controller', 'mediatek,mt8173-power-controller', 'mediatek,mt8183-power-controller', 'mediatek,mt8186-power-controller', 'mediatek,mt8188-power-controller', 'mediatek,mt8192-power-controller', 'mediatek,mt8195-power-controller', 'mediatek,mt8365-power-controller']
	from schema $id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dtb: system-controller@14500000 (mediatek,mt6991-hardware-voter): reg: [[0, 340787200], [0, 12288]] is too long
	from schema $id: http://devicetree.org/schemas/firmware/mediatek,mt6991-hardware-voter.yaml#
Documentation/devicetree/bindings/firmware/mediatek,mt6991-hardware-voter.example.dtb: /example-0/system-controller@14500000/power-controller: failed to match any schema with compatible: ['mediatek,mt8196-hwv-scp-power-controller']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701151149.136365-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


