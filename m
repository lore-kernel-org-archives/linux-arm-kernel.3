Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969E6C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tM60QJ7E4OBI4EMQhd42gKqC03cYVCyPWj0WAqA808M=; b=qFoMMVYHhZNO2zb6Q2nLp9GBHK
	eHB+NRWhSa4mmKjZYUDda4LOQIaVStCn2kYQ34sVFXbOpjW2gUFhu1DnqYH9xNv6tSvWn9I/2TTip
	mOH9sT6jE++nnZ26K14dcK1lgzdCCRDYZwwdYW2ersk6DzLbegGQ/OAEqkMXpnnZ2WJ17wNvgm1nx
	Qz3FskwW/PTdBfZ1eEHGxBGcQzmgd1vkoP3wXxuwJjWgroMFg3G1Ja2TsbaorjYigaRygx9NhOGId
	/xzrKQhf5Jt4dZy/y0KFCzSMxiPVKCbk7tgS0P5qHhr3azLEh5zSQdJuV74pJPFw2ejc9e/X0iU2Q
	mud5i2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9J5h-00000005H2p-1a6l;
	Mon, 28 Apr 2025 07:39:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IoT-00000005EFr-1kPn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC76F5C5EA5;
	Mon, 28 Apr 2025 07:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48A9C4CEF1;
	Mon, 28 Apr 2025 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745824920;
	bh=lRQiEbQpx7U8/3WtfWFOwT8LyXiXIfna8PPJezfTB5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nn7zweaZPy8ychArCeB3fYc2ZUOl+4VZ4+gnyTnQq55xjOU29vKvT804qzRRf0lx3
	 qM3Rloz1QLn3Igy7DLLnabjLF/4GjJZHnYn2+abes1EdxjEk7jmA2QOo8vmijgOZf7
	 x1q/W13EOHSdgVAF6lfsG53w+9Ny8p/BpbpOaz94tg8/mGMxu2W5lWN2/AiQ6Hzmni
	 Mr7gZtURFX2OQrrY5gehZybWOYncZcfU95hvGWXVSpdGH/l2ekmUj6G0xt/IUiXkyT
	 HDcyfV3wHJVhesMwlI4FNiw+Culk1dLbYsvFgGLx9d3kAB2LaSdaaWB0WpQuWNe7vs
	 8RMxvFRpD4JvA==
Date: Mon, 28 Apr 2025 09:21:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
Message-ID: <20250428-vegan-stoic-flamingo-1d1a2a@kuoka>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-1-833f04d23e1d@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-01-sun55i-emac0-v2-1-833f04d23e1d@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_002201_496327_0BD0F891 
X-CRM114-Status: GOOD (  13.39  )
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

On Thu, Apr 24, 2025 at 06:08:39PM GMT, Yixun Lan wrote:
> The Allwinner A523 family of SoCs have their "system control" registers
> compatible to the A64 SoC, so add the new SoC specific compatible string.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> index a7236f7db4ec34d44c4e2268f76281ef8ed83189..e7f7cf72719ea884d48fff69620467ff2834913b 100644
> --- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> +++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
> @@ -50,6 +50,7 @@ properties:
>            - enum:
>                - allwinner,sun50i-a100-system-control
>                - allwinner,sun50i-h6-system-control
> +              - allwinner,sun55i-a523-system-control
>            - const: allwinner,sun50i-a64-system-control

No update for the children (sram)?

Best regards,
Krzysztof


