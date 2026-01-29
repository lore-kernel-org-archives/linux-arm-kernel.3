Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501E1D6B086
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyI3izbI18XwSvB+vOZlralZ8XYaLuCdHT9LA9QfNEQ=; b=HqwC8nDSS33fjGkd70qrWHe6yr
	c2EMun7kpEZTFSe5mZmAVisUxSa9EOCc+a15sI1ALrd9q860KPyYBEkXp/Q20DfpBkWUC21ps9Q2p
	HZQJcykCZDyCe2iyjLaGejkQTSkGG36YFkCV2SKhrF8RKYq7OJKgfaS0FbtNZM+LSqjFhfn3hiOBH
	DzalOdBwgppYAHHzB2Wd6gAlvYOHXQzp1bxfxnwWgkhODHx/HSk2rP951coe5ekNx/SeHJNHh3fbG
	rjAVds1p43jRgCZsry5YfXVvZbD5YNNu5/FR/3gb7BUC3jCwUUA0CJ/GZU+LiTYy1nIx+EpUtgti3
	SfNkABaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUVJ-00000000JZj-2QDc;
	Thu, 29 Jan 2026 16:04:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUVI-00000000JZa-3lhY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97DFB600C4;
	Thu, 29 Jan 2026 16:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26058C4CEF7;
	Thu, 29 Jan 2026 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702659;
	bh=Hsz8qVupp8+NBvqtE7ko8C6bGpcKwwmmGaTx6H1EiqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2Wf2Hxot7/wQdQ5EAONpILruPThqD+wOYp/fN1PpHt88KkuuorOZTojO7L5poDY8
	 METdail+riAgkkvuD0gAroqSaI8QQNjwz/qSOMvTVpNJokFQdPP7pnqkTHf5IvgeLO
	 UVvc+Q9ZrQ+GffeGowBZR5rL9JDiY8vHUXITndav8S+n6yoL0HqkaNmYyh/vz0TgGS
	 XSK5SLepAeymWT9vncwNV1IItUnWKrnyjv1a59Ccjy49lM9Mynt1g+H7SqRUoaHjDx
	 mObKP5HvV9nUMNzIF7NtYee/UVLTQGDBXucglYobu4YCggqM5edPDiq7F1cWJIbS/L
	 gxxnHFQm88yGg==
Date: Thu, 29 Jan 2026 10:04:18 -0600
From: Rob Herring <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/4] dt-bindings: backlight: Add max25014 support
Message-ID: <20260129160418.GA1100798-robh@kernel.org>
References: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
 <20260123-max25014-v7-1-15e504b9acc7@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-max25014-v7-1-15e504b9acc7@gocontroll.com>
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

On Fri, Jan 23, 2026 at 12:31:30PM +0100, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> 
> ---
> 
> In the current implementation the control registers for channel 1,
> control all channels. So only one led subnode with led-sources is
> supported right now. If at some point the driver functionality is
> expanded the bindings can be easily extended with it.
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 91 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 000000000000..c499e6224a8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

No child nodes (with addresses), so these should be dropped. And in the 
example.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

