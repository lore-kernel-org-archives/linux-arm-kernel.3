Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8EDCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 07:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Rmulx5tWtZwNZ4srP1UM6NrLE00b/t8K2ZAJDxpNCg=; b=rjzHql4mIqxkJ9VEbsr7RyDnxY
	HvuetfsQJ6O+/OOH6/g/lT8I8qUMIl7dwpYpffsmi+WEC3XAwwcpyaNOtZ/N+WbQqHLSz4wKOUQJU
	M1orWVpN6SlaIMvR89iuOWCirm2yusHPIuL7tohOCK7S0wQFBSa4Miwo0G3FpDN2lGqYNyFA95KpF
	Ly9Epy7U8oYqgXn4fB+hebx385SHNrnt5T9j7U5CBpMLy58/a65Tf8K5BvaZAofO1F/7MBI4+GBp2
	3wbHfI9tbjDDyCfcPPOxslGDbAJaDyo/pqsr6lFPP7T/IX6BGj5AOM3x7QQel/tbaveyVxEPRxmng
	PKdBRmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGuX-0000000EU16-3kkN;
	Sun, 04 Oct 2026 07:45:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDGuW-0000000EU0v-2IU2;
	Sun, 04 Oct 2026 07:45:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7675860098;
	Sun,  4 Oct 2026 07:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A591F000FF;
	Sun,  4 Oct 2026 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791099927;
	bh=9Rmulx5tWtZwNZ4srP1UM6NrLE00b/t8K2ZAJDxpNCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=liiYdyZc/+jysn1D8TPlEHk+jjZ5GSvFJM8qFJWTumsm72ri3c7XNO1KXJeK7WZJR
	 b/2b/HH+CGvOmSE9h/4OSBzlZTw5FRuo0ivZp7fD2Rk4wsRLDsdiJKLahR74/if2rD
	 Kzj5jSQNglKtffgsWLTGnvP6iIhDVsjsABQALJRQaQc2w4gfkZvFMn5UsSvbG9HaZ2
	 NrmW7d1toY0d4lg61EeYXxDlfTs6xNwZoZWHkq2FqXNQdnq/fT3nLX/ZLHuO4qBA3+
	 frFON9bcXmeoXrChDVD8vBH5wI0DMJ3zJiaS/9abplLgdjOv1/HIXApTSIXB5uc8xp
	 rtxGGBZdYl4OQ==
Date: Sun, 4 Oct 2026 09:45:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Allen Lin <allencl_lin@hotmail.com>, 
	Tylor Yang <tylor_yang@himax.corp-partner.google.com>, Felix Kaechele <felix@kaechele.ca>, 
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: input: Add Himax HX83102J touchscreen
Message-ID: <20261004-terrific-lemon-hamster-2ab5cf@quoll>
References: <20261003142741.48634-1-michal@nozomi.space>
 <20261003142741.48634-2-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261003142741.48634-2-michal@nozomi.space>
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

On Sat, Oct 03, 2026 at 04:27:36PM +0200, Micha=C5=82 Kope=C4=87 wrote:
> From: Allen_Lin <allencl_lin@hotmail.com>
>=20
> Add the binding for the touch function of the Himax HX83102J, a touch
> and display driver integrated (TDDI) controller. The touch function is
> connected over SPI and shares the analog supplies and the reset of the
> display function, so it is powered and reset together with the panel
> and has to follow it.
>=20
> Signed-off-by: Allen_Lin <allencl_lin@hotmail.com>

Please use full name, not login or nickname. I see original patchset had
the same issue, but full name was provided in the maintainers entry. If
the original author does not want to fix that, you can takeover the
patchset.


> [michal@nozomi.space: rename ddreset-gpios to display-reset-gpios,
>  describe the shared supplies and the display reset, take over
>  maintainership, drop Rob's Reviewed-by because of these changes]
> Signed-off-by: Micha=C5=82 Kope=C4=87 <michal@nozomi.space>
> ---
>  .../input/touchscreen/himax,hx83102j.yaml     | 98 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/h=
imax,hx83102j.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx=
83102j.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx8=
3102j.yaml
> new file mode 100644
> index 0000000000000..c9f229bf9ca7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83102j.=
yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax hx83102j touchscreen
> +
> +maintainers:
> +  - Micha=C5=82 Kope=C4=87 <michal@nozomi.space>
> +
> +description:
> +  The Himax HX83102J is a touch and display driver integrated (TDDI)
> +  controller. Its touch function is connected over SPI and reports HID
> +  packets. The display and touch functions share the analog supplies and
> +  the display reset, so the touch function is powered and reset together
> +  with the panel it is part of.
> +
> +allOf:
> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: himax,hx83102j
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1

You need description to explain why this is different than
display-reset-gpios.

> +
> +  vccd-supply:
> +    description: Digital I/O supply of the touch function.
> +
> +  vsn-supply:
> +    description: Negative analog supply, shared with the display functio=
n.
> +
> +  vsp-supply:
> +    description: Positive analog supply, shared with the display functio=
n.

Best regards,
Krzysztof


