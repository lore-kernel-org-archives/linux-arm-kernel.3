Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6542CCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra2QegA7D/dDAJ/hRxQQrP8IL6HCZeHrcVNE3yzAL8w=; b=NSD7squdJXtAXNSjfBgzuSJ2/g
	buJMK+Dh4g8iB3v0zkb/iAcJeZhxKdc7ocuPejKFqEFwholWw/Foh+sO/8fFwcPutxSntxa+Q9dkb
	yx3VLvmpYznIXSNdOG01FTKWHduJye3WJTVWR0MYrxBnYVcaixLo3/Bt9eWnIMaHAIzAxo2qH68n+
	m82SMV483ZVP0obyTUvr9WR/Coux2BXpqOIa2L535uv9qGiU7qE8GGpUX8TLinyBIcq6btDJNrFuN
	EyPQ8wFwb5SuX6JmfjBg48nEmKBoUEfHgiWGdHBzTZgsM5IMw2HvVRRa3YgZ7/be3pcnWkLUGijwP
	RzQFcV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKawl-0000000EZoL-3kgG;
	Sun, 16 Nov 2025 11:29:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKawk-0000000EZoF-40Pv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 11:29:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20C2A60183;
	Sun, 16 Nov 2025 11:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A557C4CEF1;
	Sun, 16 Nov 2025 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292569;
	bh=mnXvqYmImcinYneeN4zW9LnuvANHy8IWtl4d1UPxOE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wzunf4+Dqpm8I172TRzSWUXI6UzmdSlHBq8WRdCWcS94xCaQm+lKMWs54tSMmFeSu
	 0GmB/twTiwhYFSrxFAG1f3TYhJ7Gd42+wN5/tmmAJRuT3km0Uq2dRgy6vQDE+FSKSG
	 Ks6rda4N7Eam799dwq3KdZDNuxIqAwMe6/i4Iy++9UxUjxAMwD/tZB3XJCg9TygBmi
	 yYG3g3vk3adHL/vlhpDzM0UjZjNeiTH2SelYpRF+zwBb06K7yET+XUXd8Ftwiw67CA
	 p8+z0LYsDz/GVpjoHsbqJqVqSwlQXit2P5MxXdrnVIIAUvONjeYP4QsV9P4aJMlu3n
	 VoSpxAaT3fE+w==
Date: Sun, 16 Nov 2025 12:29:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Message-ID: <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115141347.13087-5-jernej.skrabec@gmail.com>
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

On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> Allwinner Display Engine 3.3 contains planes, which are shared resources
> between all mixers present in SoC. They can be assigned to specific
> mixer by using registers which reside in display clocks MMIO.
> 
> Add a binding for them.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> new file mode 100644
> index 000000000000..801e5068a6b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H616 Display Engine 3.3 planes
> +
> +maintainers:
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Display Engine 3.3 planes are independent of mixers, contrary to
> +  previous generations of Display Engine. Planes can be assigned to
> +  mixers independently and even dynamically during runtime.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h616-de33-planes
> +
> +  reg:
> +    maxItems: 1
> +
> +  allwinner,plane-mapping:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of Display Engine clock node

You description is almost duplicating property name. You need to explain
here how this device uses them.

Esxpecially that clocks do not go via custom properties.

Best regards,
Krzysztof


