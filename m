Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C77C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFG//7bup1oJnQeRub/sUk9cbTIYVYqT+3A2LafKEHc=; b=PeIb/26zOfEk7N0TCGECX7INbT
	IUrRjYOhjA+NaEil+ttvzvz48reuuMQJQprY3YahlP17aORcWMswVrhFhdQpn4aTpJZuuxN7hTF0y
	crRWYSD1/jdXTRpAFM6wq/15U7qFGMg7oCJqhhG1yOh6aqWn/A+azJTi57Rf1OgRMRSWnFR5lbKq2
	1orx5YBGmSOV5xLrBqwSiWGLzwIzeN9M4jaQ2AuSOVp/2GvBTuAIH4rCb8nf2a1a4zJ5xKRi53cHl
	tKgDeLb/cSDjRSPgQZw8qIGdRyXG51aQ3Him60tssSQzKFQhJGalB6BjuMhMgiewlYZj8pev/gddJ
	bqwFGjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwJc-00000006yLc-0WUI;
	Wed, 16 Jul 2025 07:12:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwCF-00000006xZ9-1BpH;
	Wed, 16 Jul 2025 07:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA3B06144D;
	Wed, 16 Jul 2025 07:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9143C4CEF0;
	Wed, 16 Jul 2025 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752649494;
	bh=n5jDS6P6Z09q/E7TBP2aC3Jqc7A6owgR1MsLzr1mN+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFG6zI2u3XoXatQkR4SlZo52it/lESL/DyhxEF0NS77I3sT4leBM8M05KCYXtTesu
	 BorGIFj7gurVfgONyWkOcyO1uw81eoyit106tHI6NsrirMjR3jB7QaItKM8FpP5IU6
	 zGkh4I9oq4dE+2M3sXxfyxJ9RwSBH01O36TTvMawiFRFPZnNr4TPEDpeLA5KYweCCy
	 qPY8RlIRorDHmHMLwKQK5eWp4XKMFSdHnAz8lC4YXzX39fVTMiqblPaX00Jkh8/U9L
	 A30BmTkcku0hSCFi7Bk+dtU9eJl2slthDeh1Gz7tZQt+ADY2YV2mTtuESR+O86LVkL
	 /1kJ73qVsWHlg==
Date: Wed, 16 Jul 2025 09:04:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: mediatek: Describe MT6789
 clock controllers
Message-ID: <20250716-manipulative-dormouse-of-current-9af4e6@krzk-bin>
References: <20250715222221.29406-1-me@adomerle.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715222221.29406-1-me@adomerle.pw>
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

On Wed, Jul 16, 2025 at 02:22:20AM +0400, Arseniy Velikanov wrote:
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6789-afe
> +          - mediatek,mt6789-camsys
> +          - mediatek,mt6789-camsys-rawa
> +          - mediatek,mt6789-camsys-rawb
> +          - mediatek,mt6789-imgsys
> +          - mediatek,mt6789-imp-iic-wrap-c
> +          - mediatek,mt6789-imp-iic-wrap-en
> +          - mediatek,mt6789-imp-iic-wrap-w
> +          - mediatek,mt6789-ipesys
> +          - mediatek,mt6789-mdpsys
> +          - mediatek,mt6789-mfgcfg
> +          - mediatek,mt6789-vdecsys
> +          - mediatek,mt6789-vencsys
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    afe: clock-controller@11210000 {
> +        compatible = "mediatek,mt6789-afe";
> +        reg = <0x11210000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +

Drop the rest of nodes. One example is enough. They are ALL THE SAME.

...

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
> new file mode 100644
> index 000000000000..d6f70ee918ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt6789-sys-clock.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mediatek,mt6789-sys-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek System Clock Controller for MT6789
> +
> +maintainers:
> +  - Arseniy Velikanov <me@adomerle.pw>
> +
> +description:
> +  The Mediatek system clock controller provides various clocks and system configuration
> +  like reset and bus protection on MT6789.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt6789-apmixedsys

Why this does not fit existing binding file? Or Mediatek maintainers
preference was to switch to one-binding-per-SoC?


> +          - mediatek,mt6789-topckgen
> +          - mediatek,mt6789-infracfg-ao
> +          - mediatek,mt6789-mcusys
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mcusys: syscon@c530000 {

Drop unused labels, everywhere.

Also, node name is supposed to be clock or reset controller, not syscon.

> +      compatible = "mediatek,mt6789-mcusys", "syscon";
> +      reg = <0xc530000 0x1000>;
> +      #clock-cells = <1>;
> +    };
> +

Drop the rest

Best regards,
Krzysztof


