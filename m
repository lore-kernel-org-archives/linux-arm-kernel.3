Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9453CCD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkmQTRplbsLlEClWTl73mtbbWAT8kZOj5ikRmo3uU40=; b=jqVBEi00XVijo0g6qbHh6C/k1m
	FPm+x2WsTpsXFPKJS+bplrVQw0S0WNjd3UNB7C2C47fBm1Leyb6qIOdfhy74FenCgltD3TE7E2uek
	V7xYQHFZ6fh5YLYGyhEHmLeoVHqbcxQr9RkCRu2MbCBakSTm7sw4tf8ZliEaPoJ8k0H4uyBbQ3n1X
	CwSktBRZ/nu9q9FQbHeI5IFeQhnlwcYshaTjVZWYcfgz1ScNcHEpdGvmntQG0ROElb7owsdoMnhw7
	UgecLOcRxLUh241v2oWR1GgSEnjHe+sPp9OuSn+vM0sUh0DSegzb0vubYmXmsAiiDcNoxEjg3cvmJ
	W+NwEoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSzf-0000000CTUu-0yMg;
	Sat, 13 Jun 2026 18:22:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSze-0000000CTUo-3OOS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 18:22:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4489F6008A;
	Sat, 13 Jun 2026 18:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A701F000E9;
	Sat, 13 Jun 2026 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781374926;
	bh=QkmQTRplbsLlEClWTl73mtbbWAT8kZOj5ikRmo3uU40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D2VRrt7nt9cNV/eOCD6SFCixxhe68HLs4uNnaooCtlfcHq+uQzsaWMH5MXXBEtuh+
	 Sr8qcIG7kGThYACBkulN5Tgyr44bvXncdSBwjS7ehOjQ6QOghey6Debzld98sCa5nI
	 UlidaHCmomY6ENn4AzLYHXqSFfEajAJUaxqV4SJpawaZqskSSXfRE2VZmNmu3i3wd5
	 o+tftEjg2JIFeWICJ4ntJMRF5/b6xYaVK554aBkGqqW+Ugt0G/RJV9SSUp/PEegc0H
	 raTpvbcdTPpag2kChOE3iWajrHjcAeqd/ACzooLR1Q2Q0XXlJimaLxUm2GP61OB6zc
	 Fvn0dVTFZcB+A==
Date: Sat, 13 Jun 2026 20:22:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 4/6] dt-bindings: sun6i-a31-mipi-dphy: Add V3s SoC
 compatible entry
Message-ID: <20260613-nondescript-sociable-goat-aee13a@quoll>
References: <20260613152655.212490-1-paulk@sys-base.io>
 <20260613152655.212490-5-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613152655.212490-5-paulk@sys-base.io>
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

On Sat, Jun 13, 2026 at 05:26:53PM +0200, Paul Kocialkowski wrote:
> The V3s/V3/S3 comes with a rx-only D-PHY paired with the MIPI CSI-2
> controller. It is compatible with the D-PHY found on the A31.
> 
> Add an entry with a new compatible and the A31 compatible as fallback.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> index 6a4fd4929959..3ca1a1c47032 100644
> --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> @@ -21,6 +21,9 @@ properties:
>        - items:
>            - const: allwinner,sun50i-a64-mipi-dphy
>            - const: allwinner,sun6i-a31-mipi-dphy
> +      - items:
> +          - const: allwinner,sun8i-v3s-mipi-dphy

So that's enum with previous first entry (50i-a64) - same fallback.

Best regards,
Krzysztof


