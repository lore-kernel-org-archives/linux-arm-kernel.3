Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B08C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 09:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR8/XvZpu6CEn400z/4mVVRkUpepYVnx7Lvac3s0vvM=; b=z7JF9XQ28/m2iEh5TxNVyd2yjr
	GnmC7t7D7fyOcu90uZaUoYGVi7nL4H9sKZwyqjwuoKk35s603plHUj2bKYKDo2otX9ER3jIJSqMqm
	BXsT5qbqcxj8ikq/uGuEjFtbJh5TfUdsOPJlfIKrOYQ1JQzNMh/ZYvJTqevhGbEC1I8zM8KCYqF7J
	xpB1JP3gQjXDUUXdZCRDVb75IUg+w6tW2d1lkPTu1lH0Jz62jvFGENPlfFyb2KEDNyOKKKGXOU7fA
	dNraNcKRpAq8V39hF6vXOJnnPwTHOafhWw0DUk1aVa3etFwW0JFTzHoaM78RDMgbsEmsJBrmCGmJL
	a7HyxcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gfd-00000001YVR-1bNB;
	Sun, 13 Sep 2026 09:38:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gfc-00000001YV7-03Py;
	Sun, 13 Sep 2026 09:38:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 361D160AAB;
	Sun, 13 Sep 2026 09:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243121F000FF;
	Sun, 13 Sep 2026 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789292322;
	bh=ZR8/XvZpu6CEn400z/4mVVRkUpepYVnx7Lvac3s0vvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QJmaS8OG0bH7S2h3wqWn9dtxr8SOpQ/+1/1NLiaXS2NWnK2JrqYGm2rbzaifGM8p5
	 iX4acB3B6f96E/kHzvxLTZJD7Gao4XLu/MNKF5CYD7CH2xdHFO5Z58Lwpf0kb02sSE
	 Pe+QHtniBCzc/2I/P99ibYawHmkFl4CIdX4Wihu0/g9JuzJ4LsWL+tmLl5uF6SsIsY
	 i0mBzLGuyYUDkzMk58xCwN2Q03TJ6VT0pqYvDQHQL4rG1efuamOMNB+Bzo69DzOqvo
	 bGUBJLI5zjiSoBwzRSTkCfa+OzrgFUU0t1W9AknLtxT7i24RhUT0QuVqYLSXnv0Xhr
	 swPWCjDGoFxhA==
Date: Sun, 13 Sep 2026 11:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: sound: amlogic: add schemas for audin
 components
Message-ID: <20260913-sophisticated-musical-grebe-6e7e42@quoll>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-1-7fbefe928711@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912-audin-v1-1-7fbefe928711@baylibre.com>
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

On Sat, Sep 12, 2026 at 12:14:31AM +0200, Valerio Setti wrote:
> Add schemas for "amlogic,meson-gx-audin" and "amlogic,meson-gx-audin-fifo".
> They provide I2S audio input support to the Meson GX platforms (GXBB/GXL).
> 

A nit, subject: drop second/last, redundant "schemas for". The
"dt-bindings" prefix is already stating that these are bindings so
schemas.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

OTOH, subject prefix is incorrect.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../sound/amlogic,meson-gx-audin-fifo.yaml         | 52 ++++++++++++
>  .../bindings/sound/amlogic,meson-gx-audin.yaml     | 96 ++++++++++++++++++++++
>  2 files changed, 148 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
> new file mode 100644
> index 000000000000..a01fe22b9786
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,meson-gx-audin-fifo.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,meson-gx-audin-fifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GX AUDIN FIFO controller
> +
> +maintainers:
> +  - Valerio Setti <vsetti@baylibre.com>
> +
> +description: |-

Drop |-

> +  AUDIN FIFO receives audio data from backend interfaces (ex: I2S, SPDIF),
> +  stores them into a FIFO in a configurable way and then bulk copies all the
> +  data in RAM when the FIFO is full.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - amlogic,meson-gxbb-audin-fifo
> +          - amlogic,meson-gxl-audin-fifo
> +      - const: amlogic,meson-gx-audin-fifo
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    audio-controller@80 {
> +      compatible = "amlogic,meson-gxbb-audin-fifo",
> +                   "amlogic,meson-gx-audin-fifo";

What sort of Spc is amlogic,meson-gx? git grep gives me zero (and family
names are not allowed, see writing bindings).

> +      reg = <0x80 0x1c>;

Are you sure a few registers are a separate device? No other resources
here and this is child of audin, so really does not look like a
separate device.


Best regards,
Krzysztof


