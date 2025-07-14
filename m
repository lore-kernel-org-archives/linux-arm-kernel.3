Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E319C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmaAPCnpKM12OhXSftoPM8o7d5B12MuO1V48bt8+YE8=; b=c1LIUdkoTq+UEsrEf+NltfcFbK
	zeTOZhvOQsFyhDIQc0Jlqq7Sf3Hkf3XEI8nFQVHbsCFuD6fOSnJtpnuT+AYehI1vWA+24oAMoKm1i
	yAp4xJBXpcuHqPuxbOWQP5VkiT9pAOXsqFJWGDvWeXkesHSXY24Mp/h47Jq0fDYl9ZszDLgAcON0c
	wvEhKTB8XI0+BFJbwu+RcyK5Wer79nIya6sbTM+C/qP1f3qhKkLOOoho+5e3zmBGvws0315GFfrPp
	8LtMCtF62a/8A+cBRd33JOPnp6hsZjy8tnBJu6ngVFxaJ1z8r+BUm3qEKqZv5M5VeWqCWD/Beiv6X
	GLTZ2bWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEDU-00000001ZXf-2rEe;
	Mon, 14 Jul 2025 08:07:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDbQ-00000001TFN-1rr6;
	Mon, 14 Jul 2025 07:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C755360EDF;
	Mon, 14 Jul 2025 07:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09F4C4CEED;
	Mon, 14 Jul 2025 07:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752478075;
	bh=l9FcnN3Nw017Y5jMw/hRFAK60tqYcHmO+80ILEr7bjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngJOi6bps7q2MoH8KD+x/OCUoGWmHrKwsJt0uiO0jeK+fTy4I+fZwawX4oEfxak2r
	 3zgZ2BT5ed2pg4NjE7pCCM5ZLAG30XmA0Q+9FrBR8DOOSNyXokxXNL8+yOo99yINCb
	 nPgWFplMQAHiLP/PZ3PaSMdrozNaloMWSbN/vHxBX0ZM/WvyViTkW2waWtfMU3Rs2S
	 aIRCSY6P+xiVnff8WPiJx89Fk3tKbTVvisetP+2dN6De+ba8vTou1irMP+qQB7Eq9M
	 /NkosTtfAoYlwTtIs9h6jfAMJdJLsWknWS6O/pNaCEM4NnhwV+RP009Nf9Q5xC52RM
	 CglfckzaVy5cg==
Date: Mon, 14 Jul 2025 09:27:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv4 wireless-next 7/7] dt-bindings: net: wireless: rt2800:
 add
Message-ID: <20250714-subtle-origami-gopher-c9099f@krzk-bin>
References: <20250712210448.429318-1-rosenp@gmail.com>
 <20250712210448.429318-8-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250712210448.429318-8-rosenp@gmail.com>
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

On Sat, Jul 12, 2025 at 02:04:48PM -0700, Rosen Penev wrote:
> Add device-tree bindings for the RT2800 SOC wifi device found in older
> Ralink/Mediatek devices.

Your subject was cut. Probably you wanted something like add "Realtek foo adapter" etc.


> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../bindings/net/wireless/ralink,rt2880.yaml  | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
> new file mode 100644
> index 000000000000..a92aedf6ba01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/ralink,rt2880.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ralink RT2880 wireless device
> +
> +maintainers:
> +  - Stanislaw Gruszka <stf_xl@wp.pl>
> +
> +description: |
> +  This node provides properties for configuring RT2880 SOC wifi devices.
> +  The node is expected to be specified as a root node of the device.
> +
> +allOf:
> +  - $ref: ieee80211.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ralink,rt2880-wifi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg

Why clocks are optional? SoC devices rarely work without a clock.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


