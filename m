Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEEBCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j0oeCmIiSAFwr9DL/KvkPyFQd1vbYiwHlWOIRKgumQ=; b=Kq2Rc4WtJ7JvvJjmEHlhLaOXWB
	gEAxr/pgcQ+JIqlQz3AMGKiDbTdrcQm0XDScX1tqMeTSbMNLt73Yl9kf0wqmgxO8/Ox4Vp2zA2Rcw
	1H/qSmk3uPNBMqOp1w1dhzTVd7jPOTWXnVlJUJ4flXTbSQL1ECvveXxkloEnyX8NXTTgAru5Gnkba
	7IfZPr23pNqaOnAOH1yNHW7s3D/CZFm+rS5TjE8Nj3FI96C/XiDNQGt/+eN+RRs6MJVojMR2TYcXF
	v+52S0Dxhx0SOw/zc/mRd/9qlqn3p/3m5PW+lq1ytdWSI3xVlb1/AqaXk4pnmEBibrZZ3trvDtRz/
	Ad9OkH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrfo-00000005lwe-3MX0;
	Wed, 30 Sep 2026 10:36:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrfm-00000005lwG-2zcv;
	Wed, 30 Sep 2026 10:36:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D7F240777;
	Wed, 30 Sep 2026 10:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90B81F000FF;
	Wed, 30 Sep 2026 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790764586;
	bh=5j0oeCmIiSAFwr9DL/KvkPyFQd1vbYiwHlWOIRKgumQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n03GEu4bOIgD2UGI/ubYv4FxvTAXp0uBEGM8XQl7E0SET+txuGqCVkbUUC1eWkn6J
	 /UZfSCYsrS4/mIayFcVFnE/YhLHGaGNk+4/hBUWaH4+EMiesGQzp4ehJAlMlBV0e6y
	 Y2WzNIDIjQyP1J/5ILOXeuFB4iofDm/DIgH7NW6SGf1nuLHzQAO8SImjXDHyVv/J5E
	 Ax8UQ5mKS/mVsr1HCjyeV05kr9Gx0a+k8r3z6qRn/0BqchOeMTMn/q8hZAJJXkD+jQ
	 ncauGOX/8/P0WOxIgf9HzZARkZq459NnEKU5S4qws359NDvcD4P2SHVF4jnjLRZUk0
	 FNaDpdzNaalRQ==
Date: Wed, 30 Sep 2026 12:36:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tim Kuo <Tim.Kuo@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Steven Liu <Steven.Liu@mediatek.com>, 
	Sky Huang <Skylake.Huang@mediatek.com>
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: add SPI IPM v59 compatible for
 mt7987 and mt7989
Message-ID: <20260930-enchanted-phenomenal-cassowary-80cdfb@quoll>
References: <20260929062516.416368-1-Tim.Kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929062516.416368-1-Tim.Kuo@mediatek.com>
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

On Tue, Sep 29, 2026 at 02:25:15PM +0800, Tim Kuo wrote:
> MTK mt7987 and mt7989 SPI hardware has been updated to IPM v59 SPI IP and
> it differs from earlier IPM designs, most visibly in the tick delay field
> of SPI_CMD_REG, so it needs its own fallback compatible rather than reusing
> "mediatek,spi-ipm".
> 
> Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
> ---
> v2: Add mt7987 and mt7989 real device compatible
> 
>  .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 3bf3eb1f8728..d2c740572d85 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -39,6 +39,11 @@ properties:
>                - mediatek,mt7988-spi-single
>                - mediatek,mt8188-spi-ipm
>            - const: mediatek,spi-ipm
> +      - items:
> +          - enum:
> +              - mediatek,mt7987-spi
> +              - mediatek,mt7989-spi
> +          - const: mediatek,spi-ipm-v59

No, look at the binding and recent commits. This should be a specific
compatible. Git history easily tells you that.

Best regards,
Krzysztof


