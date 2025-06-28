Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387B5C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/COtCi/ygmrBQbM8PwGATnVi1scWNjAcJWhwEdlWfM=; b=cXJNXkXKeJhzpMb0bwfAsbvBlq
	O//uC38AEtqkj819bIxwKFNrkzbIBevnR7zXv90oaYsyFgwTM0+LP1kuKFZv26xfPm98irfUM+tQi
	SMgiITF0EsN+Q0QI37cmGKZD4o/JnF9FID1NgWfunp6Jdop7ZhelZeVQvmYWwU0hVDw2vE6dbK0V2
	X55r5PkqrabmM065aFbrRUViPBUVVG50KJdnQhQobG0BFvc8unPGoeJ3Yit/zKqPy/lRLYZXlOr7e
	jBquVQ/OuYuzNNUgiMj99HtIS4HCHshZxm5ZgEukf1NH9QJSvy9G8DtR4NcRGRfD4UyZnpL4qlzJG
	tWa4W6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUM8-0000000GlXM-0vTt;
	Sat, 28 Jun 2025 12:08:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUHm-0000000GlFr-0Dd7;
	Sat, 28 Jun 2025 12:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43E175C4B1D;
	Sat, 28 Jun 2025 12:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B26C4CEEA;
	Sat, 28 Jun 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751112236;
	bh=fnTY0f4SyP2i7YILQaJH30PaDnbGJFQ6OxX01r/0/MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBMoTRFA6pPl0c6hPCTLjoXP2bT4O/iPyM656V2DrsOTIBoHcAYggBn2E/sMUgQB9
	 xyEaZNWd1Lp2Oj/FmFUHPXSezukDjrKXZglA6jHvs8Ty9V35USUje0VIAlDRFkz4r8
	 EoRMokoHYx+S/vEv12Ke58DQiNRFKqYLYKpT+f5tvWFfVXTKPQaw90z/Gb/cB8eGhE
	 SReqzme1145OXv9x4MU4IxqjyvcKvSq/A2A51HkOid09SlOKvsPUW/G0a9GeGVtHX5
	 4gJJIYScN0Ku9y7E7Oc1x+5DxhahGwJT7m3VosOOgLVf9+hX6VvY6CmlcwpSraAe1c
	 2aJBbZU1OyoOg==
Date: Sat, 28 Jun 2025 14:03:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Jiande Lu <jiande.lu@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Hao Qin <Hao.qin@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: net: mediatek,mt7925-bluetooth.yaml
Message-ID: <25t3jzrqcdko5z5udbbcctaqldcrbycryazumw6mfj2c4qihmr@jcubfbuhikvp>
References: <20250627055924.7716-1-ot_zhangchao.zhang@mediatek.com>
 <20250627055924.7716-3-ot_zhangchao.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627055924.7716-3-ot_zhangchao.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_050358_177610_0A54D41F 
X-CRM114-Status: GOOD (  24.93  )
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


How did you manage to make mistake in my email is beyond my understand.
Tools should generate address list, not humans.

Where is the changelog?

On Fri, Jun 27, 2025 at 01:59:24PM +0800, Zhangchao Zhang wrote:
> Add hardware pins and compatible strings.

I don't see any pins here.

 
> As a binding file for the MTK Bluetooth driver code,
> it provides a set of compatible fields and hardware
> pins for the driver to use.

All this is not relevant. Describe the hardware here.

> 
> Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
> ---


>  .../bluetooth/mediatek,mt7925-bluetooth.yaml  | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
> new file mode 100644
> index 000000000000..230c24ada3b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7925-bluetooth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bluetooth mediatek add gpio pin to reset bt

Not relevant. This is the title describing this specific hardware.

> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +description:
> +  7925 uses the USB bus to communicate with the host.

Waht is 7925?

> +  Two methods are used to reset Bluetooth.
> +  Provide hardware pin, when an exception occurs,
> +  resetting Bluetooth by hardware pin is more stable
> +  than resetting Bluetooth by software.
> +  If the corresponding pin is not found in dts,
> +  bluetooth can also be reset successfully.

Wrap this properly. The same commit msg.

> +
> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,usb-bluetooth

NAK, you cannot have such compatible. I already said at v1 or v2 that it
will be rejected!

Why are you pushing this all the time, without reading the feedback?

You need SoC and device specific compatibles. There is no such hardware
as "usb-bluetooth". If there is, point me to datasheet for it.


> +
> +  gpio-controller:
> +    description:
> +      Marks the device node as s GPIO controller.

Irrelevant. Drop. See other schemas.

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  reset-gpios:
> +    maxItems: 1
> +

Drop blank line. Look how other files are doing this.


> +    description:
> +      An active-high reset pin for the Bluetooth core; on typical M.2

active-high? Really? I have doubts.

> +      key E modules this is the W_DISABLE2# pin.
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - reset-gpios
> +
> +unevaluatedProperties: false

This is random style. Why doing something completely different than
every other file? Missing blank line.

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +      bluetooth {

Messed indentation.

To summarize:
Except writing something entirely different than every other binding
(why?), this does not represent hardware. Your commit msg explains ZERO
about the hardware. Binding description says nothing and is actually not
correct.

So again, if you send the same it will be rejected.

I expect answers UNDER EACH OF MY COMMENTS, because you keep ignoring
entire feedback given to you.

Best regards,
Krzysztof


