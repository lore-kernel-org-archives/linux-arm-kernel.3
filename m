Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9DDC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT2yF0faTkPR5ST2LgRX7fG1uocE5gd79N8AzmJ0fhs=; b=ctVmJeSf+p0SIpWCIo/0xCIf/Y
	nNJrGBsWDL7oisCBt9UHHBYEffOkmTnVnTelfObV/GRJkyDfC9DEsu4o4vhP0fIY1/dyxRlPb/OQp
	XBBX79pNtidQw/YVqv1EtJNx3GZjKltu/2zrr6TReLYKy5OrsnPf+BDajSRUPQL+JfQDKjDS7FgXl
	eTtA5O4f7NUgpk6g9KnA3Tg/7g6aAD5xo9dOodFiOzqFufeeKxnvQps4DwipNe/tLZxVenKsMwQxT
	gwh71lTVYGN9NBPfzV+DCOzM0LZOCw6Vg6DcXLYvz+CyOLYtB4jfxpRQhvQwKnsu2kamG+Vz3CmMf
	7oc0NVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrzW-00000005aI3-3zKw;
	Mon, 17 Aug 2026 07:42:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrzT-00000005aHF-2H35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:42:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2AC3601FB;
	Mon, 17 Aug 2026 07:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B381F000E9;
	Mon, 17 Aug 2026 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786952558;
	bh=qT2yF0faTkPR5ST2LgRX7fG1uocE5gd79N8AzmJ0fhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D/dr3avspgTLyOXH3DNYNYYFRTZr97wbzFT0314TKUmqNdoNFX+chhYdkqg/htvqA
	 nJrSYrw4l9oFPX2ukSJrUct+yQMCKOBgDFr65Eck2EbBvMT989WTl7aZrl50D2P6jW
	 QXmF5f0f2BdsVdf0XaqpHqLcahBJPgcO034wM63bqQBt5dwxBKInHjnNCtCeilGPbs
	 eqaa3PIBq1U+LH11E+328Q3+kBARwanGIrqipuTi4nXsVyCjJzHYIfC8yrqhd3/cvp
	 Dn8wzfxHp19mTWNYTT2TqzlavbHxUMfU55YDVOtm3ql0wwmiCg317jLor3tHpVIvQi
	 iTMLAytSmj0NQ==
Date: Mon, 17 Aug 2026 09:42:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: Document 10" Raspberry
 Pi Touch Display 2
Message-ID: <20260817-whimsical-fictional-dove-89b3d6@quoll>
References: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
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

On Sun, Aug 09, 2026 at 09:58:50PM +0200, Marek Vasut wrote:
> Document the 10" Raspberry Pi Touch Display 2 MIPI-DSI TFT LCD panel.
> The panel is based on the Ilitek ILI79600A controller.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../display/panel/ilitek,ili79600a.yaml       | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
> new file mode 100644
> index 0000000000000..0a3baffef293e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili79600a.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili79600a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI79600A based MIPI-DSI panels
> +
> +maintainers:
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - raspberrypi,dsi-10inch
> +      - const: ilitek,ili79600a

Binding looks exactly like boe,tv101wum-nl6, so either properties are
copy-pasted without checking in datasheet or this does not need new
binding file.


Best regards,
Krzysztof


