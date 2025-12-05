Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD0D374B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLUO68YbEi7Atnd5/Vd/HVGndIMkdQwscTzjy6JB9ec=; b=UBU04Xhi9Mgj6AViE05BqJ0p2G
	46m5u9QevLDbtc0rtjN/gicvp1mc2x7/67pE7rez/UCgCHa1fzHnpBbLdXn/VIaVIeqNLgT4TlI/w
	0/nr+gY3mMh5urIkTaUPIZwVDglG/rA+Z6WCl2BSA1mTRZUpzetRgWTWiQtfAVjx2SE7fC/FQCPfI
	jQZgV/YdwXnTeHorZVWgQnM9T6WKLY6hRjsZN0l/iByTOO0FyX66GQsqetkeCzRalesYTr+aTmHvf
	j5RFW2FdPj+wAZ4xn0NDyoQzzcCBudfO2qz712mdDBx1XyfRGXwaL4glifzAJH5cNQU0KwCi/skvs
	ZzkQ44/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePw-0000000A9Rk-3dDB;
	Fri, 05 Dec 2025 22:36:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRePt-0000000A9OS-485m;
	Fri, 05 Dec 2025 22:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B7B43DA2;
	Fri,  5 Dec 2025 22:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887CEC4CEF1;
	Fri,  5 Dec 2025 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974202;
	bh=SlAK6xyJudQcjrejrHOJwdit6sCrE8s7ZDp+cOwhoFA=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=a7iICjNVsj6TudEqpKDnq2DS0Wi33ftlxsP5VGwc9swybPAdtYsjWUB1xpxsHXCpa
	 31wFW3PzwgwwHYL5XzSIIvXIlrRyT2rNQavYAL0QVUHWulEYDzEGhakRkLN4VMFNsa
	 +PT2qGPTBCBE/UiEMX4JbtNMDD191xAhJAa2tnfRsqRKR/gdlMT9Xzqmnng0ZvipQg
	 d5JyCbWX9YzxwZDjzcNKZlGHiNL8l0O2i0gUPmWpmNgKLy49Z55TUyJWMTPWplETe2
	 bO2X1AGk/E1rRHnTyKlm3GF+0pJsK8uW8aegSh1ID9K3IZCmg5TaYtxrWDZzMFyLkH
	 gsMdI7c3WtQeg==
From: Rob Herring <robh@kernel.org>
Date: Fri, 05 Dec 2025 16:36:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Gary Bisson <bisson.gary@gmail.com>
In-Reply-To: <20251203-review-v5-0-b26d5512c6af@gmail.com>
References: <20251203-review-v5-0-b26d5512c6af@gmail.com>
Message-Id: <176497381428.863411.12977178737118474815.robh@kernel.org>
Subject: Re: [PATCH v5 0/5] Add support for Ezurio MediaTek platforms
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_143646_070853_75A554DF 
X-CRM114-Status: GOOD (  20.62  )
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


On Wed, 03 Dec 2025 22:20:36 +0100, Gary Bisson wrote:
> This series adds support for Ezurio MediaTek platforms called
> "Tungsten". It includes support for MT8370-based Tungsten 510 and
> MT8390-based Tungsten 700 SOMs.
> 
> Changes in v2:
> - Use b4 to cc all maintainers properly
> - Squashed patches 2/3 together
> - Updated dts node names to be generic
> 
> Changes in v3:
> - Added per-commit changelog
> - Added missing Acked-by on 1st patch
> - Link to v2: https://lore.kernel.org/r/20251201-review-v2-0-dc2df44eec7e@gmail.com
> 
> Changes in v4:
> - Fixed remaining DTB warnings
> - Link to v3: https://lore.kernel.org/r/20251201-review-v3-0-07f9af7341fd@gmail.com
> 
> Changes in v5:
> - Fixed DTB per Angelo's comments
> - Added a MT8188 patch for easier mmc eint interrupt change
> - Link to v4: https://lore.kernel.org/r/20251202-review-v4-0-93f5cd2a0d4a@gmail.com
> 
> Regards,
> 
> Gary Bisson (5):
>   dt-bindings: vendor-prefixes: Add Ezurio LLC
>   dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
>   arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
>   arm64: dts: mediatek: add device tree for Tungsten 510 board
>   arm64: dts: mediatek: add device tree for Tungsten 700 board
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |    2 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  arch/arm64/boot/dts/mediatek/Makefile         |    2 +
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |    6 +-
>  .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
>  .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
>  .../dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 +++++++++++++++++
>  7 files changed, 1534 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> 
> --
> 2.43.0
> 
> ---
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Sean Wang <sean.wang@mediatek.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> 
> ---
> Gary Bisson (5):
>       dt-bindings: vendor-prefixes: Add Ezurio LLC
>       dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
>       arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
>       arm64: dts: mediatek: add device tree for Tungsten 510 board
>       arm64: dts: mediatek: add device tree for Tungsten 700 board
> 
>  .../devicetree/bindings/arm/mediatek.yaml          |    2 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  arch/arm64/boot/dts/mediatek/Makefile              |    2 +
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    6 +-
>  .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
>  .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
>  .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 ++++++++++++++++++++
>  7 files changed, 1534 insertions(+), 3 deletions(-)
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20251201-review-750072579991
> 
> Best regards,
> --
> Gary Bisson <bisson.gary@gmail.com>
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
 Base: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20251203-review-v5-0-b26d5512c6af@gmail.com:

arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml






