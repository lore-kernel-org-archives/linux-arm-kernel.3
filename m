Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A15C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9trnwHXFljnlbXmvCavvXySgGPUlwMTdfQV4Sx3JwFI=; b=azRGRdr4RTudi0Bol/Q3h8avJP
	aDe/PguznHUJsT+BdE9/ZZ9Shy/AEMLME+GXa2tjW/62e77jK/ZtngO/fw6jm6ToiKU2T4lkKwMnm
	WlmiRZ+HlVBlNlY+o9gQd0BsUcoCzarULbO+rIfyB42+qsIJAcz4ahHlW3EDv1gDnu5mC+J2m45Nq
	Wz/4znpG7znUK2q2MZpwKUV1B7IAq7fifVze6QMsyNYsEEvVlTt9+/kM4WUt/kyQwZdzlYwRvbvH8
	1UBhS8HVvISWaZJ+ItBbuQXGYtTvkarXC22K0PQif6ZbkSv4eB2WmEPPAu88iwZd+XLrpt+rsxZPF
	pL+Iripw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivdf-00000007Y6c-0Aj9;
	Sun, 12 Jul 2026 14:58:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivdd-00000007Y6H-3Hvy;
	Sun, 12 Jul 2026 14:58:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FEC741452;
	Sun, 12 Jul 2026 14:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670B11F000E9;
	Sun, 12 Jul 2026 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783868317;
	bh=9trnwHXFljnlbXmvCavvXySgGPUlwMTdfQV4Sx3JwFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fuzKfWnKArXWqfKU/m0sahnW9IZ3PzNKwQb745Y+T8JyjkBzq9ddSbPm1S6EdOlIW
	 +v6RS8iq8otPP7tL439h+uMO073tcFnAZUQ2+9CfqEXhllk9Gz+gDdl/+L36a3WJC+
	 obNEfalnZD6hKrWgFR9a/XXO+rkNwEFjVKqcKH7ZxG8xbq2gupA4+wXfq4g8arSwtr
	 4lQ02aFoIDcJpeQums0owh9JY1uBNoWUxOWxIAvjOnIbMWu+FkTpMXDDySVDz6ufan
	 Qgidcodq4B3gyx8t4uUERGix3gP84fHW3uSsjix+ja5y3+SG4E4WCBI6W1tCuEKj3y
	 W5zXMdBc02e0w==
Date: Sun, 12 Jul 2026 16:58:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com
Subject: Re: [PATCH 09/10] dt-bindings: display: mediatek: wdma: Add
 compatibles for more SoCs
Message-ID: <20260712-mottled-prodigious-hummingbird-a7b72e@quoll>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
 <20260701121950.19454-10-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701121950.19454-10-angelogioacchino.delregno@collabora.com>
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

On Wed, Jul 01, 2026 at 02:19:49PM +0200, AngeloGioacchino Del Regno wrote:
> Multiple MediaTek SoCs have the Write DMA hardware in their Display
> Controller: add the missing compatibles for Dimensity 1200 (MT6893)
> and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


