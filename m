Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE29C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 22:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TudjL3hD1ILzDEgs69vx8OP9lp02Rne81RdEJIvsDqs=; b=0jzl5NAcVmOFtkxzA8cjsb/hnv
	9vYxWQN+HSwgVH56mxEGtnU9IEx0ZWpfV44M4yj5Kk5LF7Ze1A8WEZA5VcNc+dT6+T1ZpCDWaXtjs
	Hc3TZnGPOEP6+m7i57XI37iL2SEaR9hVB6bdo/Jv9/V8LgBDDHFYLGQ8DeJSOVQ2XxLcjtBb4MfZr
	2QAdMd1sqv7z/MB7rNoM3goyRfwneYTxVVyBbl45mixb8bBBXB8gC5CcKgYKi7YFcjp3Kj8VRTeVP
	B/0M7ciffkX5+t0SvRDAp6z6aKkCqe1idUN/AM8/u2XkK9p2FOvrgmgBK3lpCOITVeiSxKfMSrvk/
	dABySRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udcgM-0000000FnHz-2eXp;
	Sun, 20 Jul 2025 22:38:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udccO-0000000Fmxc-2y1w;
	Sun, 20 Jul 2025 22:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09597450BB;
	Sun, 20 Jul 2025 22:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C165CC4CEE7;
	Sun, 20 Jul 2025 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753050891;
	bh=MRccUioWmEokYe39hVS4NwT8VcEut9wQ1VPK++J3drI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+0e0fqWFsyowkUGbh5SkDx49D4KIt/ItmgkDqjkcdcaGnrrm5wwUXc+ttKKyzjlp
	 qHTMiSzd0+IYOzLXIMJAJkyzFSQxp3/zFdpgSrstSGqb4+M8zvPAnncCH/eE5AmmF2
	 d6nqKdIhmOVVJGIHwBOB0pubiP0G+NSLwoh5j5O3lNQ+bEyeGXiTzA+p5ZpHPlGJlZ
	 lKVHW2bgfT2I/LSYqNOLssiX9S4xo94oBf9MgT3/OP1rN19few7MEM95UY3QdjaryG
	 tlueu7znlS6RS3E5lNXMRdqpBEZHrgyOJkGlucpWZDCKmWB/Ub1BwI9qeop+XLCbHV
	 +XLEfEgIq3uAQ==
Date: Sun, 20 Jul 2025 17:34:51 -0500
From: Rob Herring <robh@kernel.org>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Leilk Liu <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1] dt-bindings: spi: mt65xx: Add compatible for MT6789
Message-ID: <20250720223451.GA2915764-robh@kernel.org>
References: <20250715231921.4527-1-me@adomerle.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715231921.4527-1-me@adomerle.pw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_153452_768439_9238DBFB 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, Jul 16, 2025 at 03:19:21AM +0400, Arseniy Velikanov wrote:
> Add a SPI controller binding for the MT6789 SoC. As a note,
> MT6893 SPI is fully compatible with this SoC.

Then you should have a fallback compatible. Otherwise, there is no 
driver change here, so how would this even work?

> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 3bf3eb1f8728..0635aec29aae 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -49,6 +49,7 @@ properties:
>                - mediatek,mt2712-spi
>                - mediatek,mt6589-spi
>                - mediatek,mt6765-spi
> +              - mediatek,mt6789-spi
>                - mediatek,mt6893-spi
>                - mediatek,mt6991-spi
>                - mediatek,mt7622-spi
> -- 
> 2.50.0
> 

