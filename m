Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFBACF6AB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xw0NwZCrR0WSJW93hxw8/ZUBh2voqqzop5Iy/IpI4c8=; b=n3xD7EF3vXVZ3NwebvnlN59Nu4
	i6MSgVdQbce9QqM1Mt05fL3BmotCJLALGyHOJOnEy/2Za7mCRXZjx+WC4103ox671cvYjd6crVXkT
	TSMbOH3gWyuFfdw2bjtqK2Tx1ZpnLHqRUdz3pRmrjdTdmyw8kG+bgN0iy67QkTePneKLuiN3eu9FL
	dpTvJ1GjzseAyU62gGA2V2Zf/1FMLRQ/LerbJvkHi2JmiyYZ+wydWLJhIReRbrHPZh4lws8CFczzZ
	0RmIV/NopZfaR28kXTQY4O1pvIvzDRc4CsMjrVVkmnfIiIqsSUW28MmcONo3zCyeObvu004lomV5u
	dgvwLftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmmy-0000000GXbL-0AW2;
	Thu, 08 Jan 2026 09:58:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmmu-0000000GXZs-1GkO;
	Thu, 08 Jan 2026 09:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767866316;
	bh=1HLus0gTh6HnY5z+TPOce04w/1dZcg2TITZXXvEJlVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1FXVa++Qs4BCQAij0CNaHgFbcCTZNl9Vc0FcUIJ9Nl0DLkY+LgT6We4i1cd+rVbk
	 wKV+FLM+EWFf1h3oFDjw5Xa2wj9M7p9SphujPZ1Rc+ukrLKCwX+3n7DjblSqhkbnUk
	 IBYbkT1ovSbsc7/CrFvpteMuw8SSmqvco0z9uFuN13qMYfBe8g8KwhJIIefwRXUYOo
	 hidffgXI8S0IW8tn6o+sE287/vb7pMi10So8rEg+xogb8pfP4bsYxRNLRtlFDxQ/vi
	 lDI1oyNXdLkcH+k5deXK28sTa+ScoHsiTh9/InnH1jKi8scxrZegWs8jp2HZTKKusU
	 hhlgjxj4j+N+g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B95917E0181;
	Thu,  8 Jan 2026 10:58:36 +0100 (CET)
Message-ID: <a952746a-89f9-494e-bbb0-e4aed5c1cedc@collabora.com>
Date: Thu, 8 Jan 2026 10:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for Ezurio MediaTek platforms
To: Gary Bisson <bisson.gary@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251203-review-v5-0-b26d5512c6af@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251203-review-v5-0-b26d5512c6af@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_015840_503896_83CD87BE 
X-CRM114-Status: GOOD (  16.35  )
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

Il 03/12/25 22:20, Gary Bisson ha scritto:
> This series adds support for Ezurio MediaTek platforms called
> "Tungsten". It includes support for MT8370-based Tungsten 510 and
> MT8390-based Tungsten 700 SOMs.
> 

All patches applied to v6.19-next/dts64 after fixing a merge issue in Makefile.

Thanks!


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
>    dt-bindings: vendor-prefixes: Add Ezurio LLC
>    dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
>    arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
>    arm64: dts: mediatek: add device tree for Tungsten 510 board
>    arm64: dts: mediatek: add device tree for Tungsten 700 board
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |    2 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>   arch/arm64/boot/dts/mediatek/Makefile         |    2 +
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      |    6 +-
>   .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
>   .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
>   .../dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 +++++++++++++++++
>   7 files changed, 1534 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
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
>        dt-bindings: vendor-prefixes: Add Ezurio LLC
>        dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
>        arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
>        arm64: dts: mediatek: add device tree for Tungsten 510 board
>        arm64: dts: mediatek: add device tree for Tungsten 700 board
> 
>   .../devicetree/bindings/arm/mediatek.yaml          |    2 +
>   .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>   arch/arm64/boot/dts/mediatek/Makefile              |    2 +
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    6 +-
>   .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
>   .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
>   .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 ++++++++++++++++++++
>   7 files changed, 1534 insertions(+), 3 deletions(-)
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20251201-review-750072579991
> 
> Best regards,



