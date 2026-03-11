Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58F5FD88EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 03:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8BlhKZtIL0yk9V62trDAt6nLb8JWmfEbWSYVznbMRw=; b=o86jVRu34BzD1cmli2//a54BHn
	ddpw6QYx7S5mIo69XdhG7x0SrV4R9MncYc8ODogpiLC4hYMVe9Ui+hYFxHlp7C0bxbRZFwetii/xP
	nceadPPJd9AbAlZZcGOVmfzxO1bQrEofLTlzksFpxo8Ci2FFlESrVCx2YIr0qoz/+ht4WVKKlJgk4
	zLQIn42EZrRMsOf03Xgv5Ze9SyypAVMnw49Nwge3za/47ffORtYihRkGm670BbOBEQvm4B5ezsowO
	zMqKSww+8kjoe9MYnFfbOEwV1vakP9mY34KM4WRsCvPyogOJjCk64WwjLstSOt5jEtLWxm75ZIFh3
	knnQBbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AAi-0000000Abpn-1bgC;
	Wed, 11 Mar 2026 03:23:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0AAf-0000000AbpN-2NDx;
	Wed, 11 Mar 2026 03:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 434CF44580;
	Wed, 11 Mar 2026 03:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F23C19423;
	Wed, 11 Mar 2026 03:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773199420;
	bh=NBn0HGzyHP52LXSlQhHyifFtjrmW5H7f6XcjknWW90k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cxBlbMBIncnf930kfnUyfiTCT6c8YGOHfEzNbbA/Sse3vIypMbbZnmghAGNkxGmk1
	 SLjdijmFRuNjKe2NqKZ4x30fWpJ5sjU47shqIetjRYYD6HlGqwgFRugr0eUssv+KD0
	 JuFf8o4ATxkiGo9KgEX5mGw3VtW44lqCmJybtQ5YsBoq6jxIp9t0m2oP6u3m265TZp
	 LpJCFunonm6pQjUMvcZ01EhuzzLfDKzzDurJ/9Fz/1twjJWGUJqEQ+pjR5NRwbG+e3
	 6SnCmGcRziajGc0IYz4C7WrLCkrbgPGej7MkXm5QnYE2P+yZW4yr8RcGSHV6dhuxYf
	 dOT60RP92oOhw==
Date: Tue, 10 Mar 2026 22:23:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, jh.hsu@mediatek.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 sirius.wang@mediatek.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, 
 vince-wl.liu@mediatek.com, Bayi Cheng <bayi.cheng@mediatek.com>
To: Meiker Gao <ot_meiker.gao@mediatek.com>
In-Reply-To: <20260311015214.655555-1-ot_meiker.gao@mediatek.com>
References: <20260311015214.655555-1-ot_meiker.gao@mediatek.com>
Message-Id: <177319941914.1664906.9202491314151419048.robh@kernel.org>
Subject: Re: [PATCH] spi: dt-bindings: mediatek,spi-mtk-nor: Add clock
 bindings for mt8189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_202341_646123_091C18E4 
X-CRM114-Status: GOOD (  17.97  )
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


On Wed, 11 Mar 2026 09:51:27 +0800, Meiker Gao wrote:
> Update mediatek,spi-mtk-nor.yaml to add conditional clock and clock-names
> bindings for the mt8189-nor platform. The mt8189-nor controller requires
> five specific clocks and corresponding clock-names ("spi", "sf", "axi_f",
> "axi_h", "axi_p"). This change enforces these requirements in the device
> tree binding schema.
> 
> For other platforms, the minimum number of clocks and clock-names remains
> unchanged. The patch also adds an example for mt8189-nor, illustrating the
> new clock configuration.
> 
> This update ensures correct hardware description and validation for
> mt8189-nor, improving compatibility and reducing configuration errors.
> 
> Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
> (cherry picked from commit de637a2fea765a92d4b06efef34671c74f8bc109)
> ---
>  .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 71 +++++++++++++++----
>  1 file changed, 59 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml: allOf:1:then:properties:clock-names: {'maxItems': 5, 'items': [{'const': 'spi'}, {'const': 'sf'}, {'const': 'axi_f'}, {'const': 'axi_h'}, {'const': 'axi_p'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dts:69:18: fatal error: dt-bindings/clock/mediatek,mt8189-clk.h: No such file or directory
   69 |         #include <dt-bindings/clock/mediatek,mt8189-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1608: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260311015214.655555-1-ot_meiker.gao@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


