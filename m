Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQbBlkNyShZgl6jx6OlwULDQXonRARNTYcAllSQ/B9U=; b=d7Cu5cTqZC1tvlVnfwhwbPGaNd
	TABD4mC1pB44/m66JelPOLtm37dRlGg7+QgnUQR+u+nq5hNMsiCQKjqb2TCg0N4Mza1BAlmYA/4Ct
	N6yKNFkhCtQy/jouDKG+iAWvS02Mlx6D1KQlO4PsOQ7yTmbHbtBICR1TEofCaNRcLKbRCGf4mE0Uk
	HlHrTzo34BeSg5E+cJ4gT8Dn0piVu7RUCTFFnq73I94jKJtQNj4Euum6vrptoZAdQLnT8vk4RTMFC
	DSWcb4JyfEXeHtCrFdGIaALuXodhRUkgGn0MWVRA5jGP8U3x4xkxItTzHrCc94MaHOlTIjXPJCaGO
	Xjgz6m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexjg-00000002WoP-0SDw;
	Wed, 01 Jul 2026 16:24:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexje-00000002Wnq-49Pf;
	Wed, 01 Jul 2026 16:24:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0832060138;
	Wed,  1 Jul 2026 16:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A061F000E9;
	Wed,  1 Jul 2026 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782923065;
	bh=dQbBlkNyShZgl6jx6OlwULDQXonRARNTYcAllSQ/B9U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=SwtQnZ96zoZhDDv5bku1HcaOWLPPGhIElTYWLAl7g5ozDyFVuHrDxlCKsxe2tnFK1
	 84055kA9AfD+vRLgMAx/eq68Bl0h9UTkkY3GDMYVFrt8cQZsrB89h2ETyEuxbobAGg
	 bTVJz6mmEuAnTH0Z9MKTNzsnN54hwblnw4ewbCAIA6O/tllnvzKpX3UqQjgGjBMdAH
	 +hikVObjG2l4s3QR1I2P2VtTHWhI+YYD9WBgAwtBn5slQrY845Db3sJx73xcdIm57l
	 prk40ttbIjtqy8jNtkoBXaQQlkWYWoXV+YDTCWLk8dThdnyvXprJX9y06zxh3sOTxX
	 MjRr1bENc8HaQ==
Date: Wed, 01 Jul 2026 11:24:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, netdev@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com, 
 Michael Turquette <mturquette@baylibre.com>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-2-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-2-2b048feea50a@collabora.com>
Message-Id: <178292306474.849869.14658483953316030995.robh@kernel.org>
Subject: Re: [PATCH 02/15] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
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


On Wed, 01 Jul 2026 15:11:07 +0200, Louis-Alexis Eyraud wrote:
> Regroup the MT8188 clock and system clock dt-bindings into MT8186 ones
> to ease maintainability and have common files for several currently
> supported SoC or new future ones, that have the same kind of clock
> controller design.
> 
> Note:
> The `#clock-cells` property is a required property for all compatibles
> declared in MT8188 clock and system clock dt-bindings but not in MT8186
> ones.
> To avoid ABI breakage, conditional blocks to check this requirement
> for MT8188 compatibles are added, rather than enforcing it for MT8186
> compatibles.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt8186-clock.yaml      | 82 ++++++++++++++++++-
>  .../bindings/clock/mediatek,mt8186-sys-clock.yaml  | 20 ++++-
>  .../bindings/clock/mediatek,mt8188-clock.yaml      | 93 ----------------------
>  .../bindings/clock/mediatek,mt8188-sys-clock.yaml  | 58 --------------
>  4 files changed, 100 insertions(+), 153 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml:62:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260701-mt8189-clocks-system-base-v1-2-2b048feea50a@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


