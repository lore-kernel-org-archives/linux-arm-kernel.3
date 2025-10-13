Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21666CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0clX0gshyYIdjL3JFCjc5GksZgSQHQcZ7ChRC/NoKzU=; b=ngq1G/ZWPuR2tl53Zyi4evnbhK
	WygElG/HTgq8ad+pH/q1Z3aKYkwjRarG+jk62YGnkioVmbcx1jIiYznqbfZfPD5V5j+9gaNcDt7yQ
	JEns21IC23tyHE4c+OtHWRjqI5/SN3lV8tRf43Qb0GkThx1GRWH6GHcMLNc+BaQUIr5FK59eVAenX
	daNqZ02LY2bzg9Od26NGhcmT1cmVJhfJAPW/FIDqKoJDIE9XUSrlYogf0djFnRO+yzLS/8pndTRhu
	33EuFwG2xZ2hjIfIjlQSotL3vUTY8NsEEqRn9UYAiR6JTx3KA54FHUVs/cNgocYEoNiVY/gCk2ftz
	V1f6kw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F3d-0000000Cltm-20FT;
	Mon, 13 Oct 2025 09:41:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F3a-0000000Clt2-3awY;
	Mon, 13 Oct 2025 09:41:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4225E439FF;
	Mon, 13 Oct 2025 09:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3123C4CEE7;
	Mon, 13 Oct 2025 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760348490;
	bh=JBGlttPgEcGlkaapqMF5MSjaQ9HOMIlfMMQ6JxCDE5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ghOvtoQEypW4ImDFAnvNW097AJNEiEI/mn84ZnGrE7duaFTXttFY6ynUP93zxgcoN
	 UVSCSBCgW6w5yEA15RO2jl1IKoot9Brls/zcCsAM/URqQE+M1fvIkglh516Nu6BhFF
	 9qLJ+Nl/qjjbbJkx0ibduyp0LAOwDbWKaTboOc8LekZCPQN4oN28yCNe6tZJ+39u9a
	 RJCI7tL0xK6TBhCQfiE8689ET2H3LItOVUqHvX6W6f2uVcILc6CisSIKQ3b+rsAVrN
	 A+XRIVhG+HweZs2RCCu1hcWiwxX9J5nqBQuiz+Oi8ccvAnBefn8qfon8Xp4DnZ9Y8e
	 tbq3D6U5syqFA==
Message-ID: <4c974736-f257-42a5-9d39-801a579d9771@kernel.org>
Date: Mon, 13 Oct 2025 11:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] Add support for Grinn GenioSBC-510/700 boards
To: Mateusz Koza <mateusz.koza@grinn-global.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com, andrew@lunn.ch,
 robh@kernel.org
References: <20250909163052.446723-1-mateusz.koza@grinn-global.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <20250909163052.446723-1-mateusz.koza@grinn-global.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_024130_938572_09E8DB88 
X-CRM114-Status: GOOD (  15.69  )
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

Il 09/09/25 18:30, Mateusz Koza ha scritto:
> This patch series adds support for Grinn GenioSBC-510 and GenioSBC-700
> boards based on MediaTek MT8370 and MT8390 SoCs, respectively. It
> includes device tree files for both boards, updates to the device tree
> bindings, and necessary modifications to the Makefile.
> 
> As far as I know, <angelogioacchino.delregno@collabora.com> has access
> to the schematics for these boards, as we've shared them under NDA with
> Collabora.
> 
> Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>
> ---
> v2:	Fixed the subject prefixes,
> 	Fixed alignment in dts files,
> 	Added missing SPDX-License-Identifier,
> 	Fixed the ordering in dt-bindings,
> 	Dropped redundant info from commit messages,
> 	Run checkpatch.pl on the patchset and fixed the issues,
> 	as suggested by Krzysztof Kozlowski <krzk@kernel.org>.
> 
> v3:	Changed eth phy-mode to 'rgmii-id',
> 	Changed eth mediatek,tx-delay-ps to 30,
> 	as suggested by Andrew Lunn <andrew@lunn.ch>.
> 
> v4:	Removed the nodes that are not present in upstream,
> 	as suggested by Louis-Alexis <angelogioacchino.delregno@collabora.com>.
> 
> 	Added default pinctrl to ssusb0,
> 	Enabled the scp_cluster node,
> 	as suggested by Bartosz Biłas <b.bilas@grinn-global.com>.
> 
> v5:	Did NOT move the chasis-type - Error: Properties must precede subnodes,
> 	Swapped underscores to commas in regulator names,
> 	Reordered properties (generic -> vendor -> status),
> 	Dropped the firmware property from the scp_c0 node,
> 	Added interrupts-extended to the pmic node,
> 	Dropped the mt6359key handle,
> 	Added blank spaces before the memory nodes,
> 	as suggested by AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> Bartosz Bilas (1):
>    arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn
>      GenioSBC-510
> 
> Mateusz Koza (3):
>    arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700
>    dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
>    dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |   2 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>   .../mediatek/mt8370-grinn-genio-510-sbc.dts   |  20 +
>   .../mediatek/mt8390-grinn-genio-700-sbc.dts   |  20 +
>   .../dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 538 ++++++++++++++++++
>   .../dts/mediatek/mt8390-grinn-genio-som.dtsi  | 210 +++++++
>   6 files changed, 792 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
> 

Patches 1, 3 applied to v6.18-next/dts64

Thanks!

