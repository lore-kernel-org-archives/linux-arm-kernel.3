Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB86EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m35O9uD/U+TaQ848Y04SAAFcQbtyJ5oGcy3AMnA+LCM=; b=KcP/jJ6A/d6jP+qxIIQlxdSEQd
	n4IX++V2rJt445fDgyAW4XQFPza/RpzmriJNC+Zxma6Ejcr+LqQsR2sLCe4NmPysOssP/hofZG+Pt
	ZTLNzHQMWJooQGK9GOvyS3laWvPO860Q+C1Dp177PGOOH3lvizsGzi3BY97Bhwcg+VyRuLHVqsyC7
	mKKrZQrv+k2n+BIupLqdjTXCNj8n6L33iLWqF38mIyFT0GlXQ+GigHcxfRVBqWdQfEdGhW51K3cYM
	gitmax9VPyuMJeJpSCig+I3Muc9tuXK4dYGqHDYxS5tUQKRkYv/Soip5K7NF3IuCg6D8GDceN1NS5
	npYAcYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZJO-00000006dK6-2lyN;
	Sat, 11 Jul 2026 15:08:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZJO-00000006dJx-0MvN;
	Sat, 11 Jul 2026 15:08:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D347660052;
	Sat, 11 Jul 2026 15:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C2F1F000E9;
	Sat, 11 Jul 2026 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782492;
	bh=m35O9uD/U+TaQ848Y04SAAFcQbtyJ5oGcy3AMnA+LCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RogktxIt1oUimSNaB2eJ/JBshJZ6HswdELFaAY6mRo5VtRBA/1zIn0NHfYbFlvIYU
	 M4WsYVO+2jR8QPbpk8703X4cr8YImO3/UUWKPfjiPcd6rtyZDjlvcFxEg6hgJJVUlu
	 vDJweMWJC007cT5r06hSgpIfYJpxhRk03UePx02tzusX9ZYcE0qCSS+CMtOCUYpDDA
	 Bx27+bhosBrBkShgSzHTZiGwUaoljoN8R98iifTzUVpFVEJNyqQZa7QaNKIYKxgoCG
	 TMD2sic22TDce/JT0kHNLi7Ni0XzQ+LyPGpfH/EwHn/R4xMW/kjDBJBsk1hEpzvhJP
	 WuKkKlUTj5bIQ==
Date: Sat, 11 Jul 2026 17:08:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, granquet@baylibre.com, 
	rex-bc.chen@mediatek.com, dmitry.osipenko@collabora.com, ck.hu@mediatek.com, 
	amergnat@baylibre.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 01/12] dt-bindings: display: mediatek: dp: Deprecate
 nvmem efuse data
Message-ID: <20260711-heavy-neat-armadillo-c0f493@quoll>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
 <20260709113148.49090-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709113148.49090-2-angelogioacchino.delregno@collabora.com>
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

On Thu, Jul 09, 2026 at 01:31:37PM +0200, AngeloGioacchino Del Regno wrote:
> Deprecate nvmem-cells and nvmem-cell-names and clarify their
> purpose, as those are for PHY calibration data, not for the DP
> IP itself, and that data shall go in the PHY binding instead.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

That phy binding should be posted somewhere and maybe even squashed
here, so we do not end up with deprecated property alone.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


