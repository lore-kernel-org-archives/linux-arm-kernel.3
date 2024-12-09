Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3E8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6S/YnXmxTynyTmTzJ/0BREgfVrhchFOkuVUCem0Xlo=; b=G+IPGHHtPGWN35K79HjCQAq9Y9
	UEl3NRmwPkfmTTBJ7i0mQxi9/+PVOLzuNACItTgCljyk2PIHPLgIjH/dtUmrK6GM42W/dagL8a0+S
	khD0392THiK02qwZ7022bysPakbjJdyMS6jY1zIPauC9siSP5PY+bVwwnw2iZLDyHCrYeIJPmcWXs
	CvxtuhDXq08nFbYRiVdt+HW1sxYPAJHE3v57Ty/Yv2qet2kyuXzAwtXKWHMlfjXfgkz5kC7LbP/7V
	GIuuTCCPXT4ffQLmczan5eFGgiBKdztgEpqNm+v0faWJTI3Wu9yaEg9ViqBXzY4lG6oVxKN90F5jO
	8f+KpKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZtT-0000000749Y-16Sb;
	Mon, 09 Dec 2024 09:17:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZsQ-000000073gZ-2SQL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA2ECA40F17;
	Mon,  9 Dec 2024 09:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AF1C4CED1;
	Mon,  9 Dec 2024 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733735785;
	bh=uvgSr2AH5BgIAzyVifUQ70yRN9JiYiWXcBSaRIQCrlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBbYr/Szi89JPd/3hkggMgGl/RrPw0qNnKoFM9LyYc6cqp+4HAxokwGCjFOCu/rig
	 oZekTwOgsSU3AWHMP9/8FDM1szUW9TvG23sVNVDyh2CeW0pzI0NwRDUw3P/Pq/R+hd
	 haaSV56Ord+sTTqcn2NHiM6jYBvAzUqdFcNINbOrAtfHRIQRrcGyIYfYdZtPl212+J
	 vvBvCju3yVEBv9jmwlShp41YqLuh6NForLmBtkzD0OVzmEajKthRv076maodDewqWC
	 NpsGP44aTORMCDYlv1FWWQREP1TamujxAcsdBCXIUaAEJgqxiYymYHbRIOgf6+eqWk
	 /5+dv6TmiQH3Q==
Date: Mon, 9 Dec 2024 10:16:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
Message-ID: <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241207130433.30351-2-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_011626_759955_204E3366 
X-CRM114-Status: GOOD (  18.57  )
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

On Sat, Dec 07, 2024 at 09:03:14PM +0800, Nick Chan wrote:
> Add the device tree bindings for backlight controllers attached via Apple
> DWI 2-wire interface.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> new file mode 100644
> index 000000000000..9d4aa243f679
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple DWI 2-Wire Interface Backlight Controller
> +
> +maintainers:
> +  - Nick Chan <towinchenmi@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
> +  iPads and iPod touches with a LCD display, 1-2 backlight controllers
> +  are connected via DWI. Interfacing with DWI controls all backlight
> +  controllers at the same time. As such, the backlight controllers are
> +  treated as a single controller regardless of the underlying
> +  configuration.
> +


missing allOf: with $ref to common.yaml

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,s5l8960x-dwi-bl
> +          - apple,t7000-dwi-bl
> +          - apple,s8000-dwi-bl
> +          - apple,t8010-dwi-bl
> +          - apple,t8015-dwi-bl
> +      - const: apple,dwi-bl
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

(and this then becomes unevaluatedProperties: false)

> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      dwi_bl: backlight@20e200010 {
> +        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
> +        reg = <0x2 0x0e200010 0 8>;

Usual preference is to keep hex everywhere.

Best regards,
Krzysztof


