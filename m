Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B1C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0uBCwRaBE2x5ESICSaRvmcxNJ0uFcNEBOpanN+P4sY=; b=eEqyS1b4lEaYPLSeT5x6vbupG+
	UngtL5Z+UBUJ9hNbWyzuTpA0a3oh8+qV39tpmk1+ZhLaoGiLOCein7A8b6wAZM5PXfXUYwQwVx8Gm
	C0jEiFfD/HpZ6vSe+iPJrtC+Ja5aoqU0rHsjG5nwXQAsLshHFaZ7NFjp+kgVZhLJSybX0enQ6wBgR
	25Z1H0571D5REiVwh3A4/gen3nLjEomZGZQDrZDrSy7wXB6Uv388La4REpdhbqGrl3GmG9nNy0Jic
	S4hJFfknl5GiTqJEV/tfqBptNbfKuQaC6DbOqxWrrV32cMprQhAp9/n9C7DXx8Ct33X5AdSvkgVy+
	hPhkNDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMH1-00000009vC6-1lVn;
	Thu, 17 Jul 2025 10:55:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLyZ-00000009rb1-3IR3;
	Thu, 17 Jul 2025 10:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752748590;
	bh=xqQlXd0lb1r+JYcGwIbgeT/oRINSjbiPGiuQzE3If+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ntDdZyBHOgKnPOdEGQw/I5EL8KR2PXe6U3DisRLzypC795hgqWv+OLRQf+cWqSflJ
	 2YeI3EMt87mUa5Cg0s575h9jR8fm13kTDSxreIvCvw/lVco+wq4FdPBTk7yC0DHQqm
	 gV2pFTBonGcj0SPoICTLc4SrvRHRhgikxbb/HVonr+dl7pj+GKyMBnoUjd90nQcvkA
	 y6W+3henmYDkJKk4A6F/HhMNTa13xyIjYIN1RFNzhAMBiKoEKwnkrAW2xdC5FHB9I2
	 EpKeLcPsKbpTntbNSjiXw/dM72FLmBCfJJf96r9gbbpDTISuXkU8npuvY43xaSAOUa
	 /G34kMeufYjng==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FAD317E0B72;
	Thu, 17 Jul 2025 12:36:29 +0200 (CEST)
Message-ID: <0089a5e5-4e16-4d30-8b56-3811a6d7af88@collabora.com>
Date: Thu, 17 Jul 2025 12:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: mediatek: Describe MT6789
 clock controllers
To: Krzysztof Kozlowski <krzk@kernel.org>, Arseniy Velikanov <me@adomerle.pw>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250715222221.29406-1-me@adomerle.pw>
 <20250716-manipulative-dormouse-of-current-9af4e6@krzk-bin>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250716-manipulative-dormouse-of-current-9af4e6@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033631_987763_97A4A8BC 
X-CRM114-Status: GOOD (  15.01  )
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

Il 16/07/25 09:04, Krzysztof Kozlowski ha scritto:
> On Wed, Jul 16, 2025 at 02:22:20AM +0400, Arseniy Velikanov wrote:
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - mediatek,mt6789-afe
>> +          - mediatek,mt6789-camsys
>> +          - mediatek,mt6789-camsys-rawa
>> +          - mediatek,mt6789-camsys-rawb
>> +          - mediatek,mt6789-imgsys
>> +          - mediatek,mt6789-imp-iic-wrap-c
>> +          - mediatek,mt6789-imp-iic-wrap-en
>> +          - mediatek,mt6789-imp-iic-wrap-w
>> +          - mediatek,mt6789-ipesys
>> +          - mediatek,mt6789-mdpsys
>> +          - mediatek,mt6789-mfgcfg
>> +          - mediatek,mt6789-vdecsys
>> +          - mediatek,mt6789-vencsys
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    afe: clock-controller@11210000 {
>> +        compatible = "mediatek,mt6789-afe";
>> +        reg = <0x11210000 0x1000>;
>> +        #clock-cells = <1>;
>> +    };
>> +
> 
> Drop the rest of nodes. One example is enough. They are ALL THE SAME.
> 
> ...
> 
>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
>> new file mode 100644
>> index 000000000000..d6f70ee918ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/mediatek,mt6789-sys-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek System Clock Controller for MT6789
>> +
>> +maintainers:
>> +  - Arseniy Velikanov <me@adomerle.pw>
>> +
>> +description:
>> +  The Mediatek system clock controller provides various clocks and system configuration
>> +  like reset and bus protection on MT6789.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - mediatek,mt6789-apmixedsys
> 
> Why this does not fit existing binding file? Or Mediatek maintainers
> preference was to switch to one-binding-per-SoC?
> 

We have been using one binding per soc for sys-clock and multimedia clocks because
the sys-clock has multiple clock controllers in one macro-block, while all of the
multimedia (and peripheral, depending on the soc) are in different macro-blocks.
There are also some historical reasons which aren't really relevant anymore.

So, we do have mt{soc}-sys-clock.yaml, mt{soc}-clock.yaml - that's right.

> 
>> +          - mediatek,mt6789-topckgen
>> +          - mediatek,mt6789-infracfg-ao
>> +          - mediatek,mt6789-mcusys
>> +      - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    mcusys: syscon@c530000 {
> 
> Drop unused labels, everywhere.
> 
> Also, node name is supposed to be clock or reset controller, not syscon.
> 

MCUSYS is all three - but please use clock-controller.

Cheers,
Angelo



