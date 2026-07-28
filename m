Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D87C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcpGEwAi/2YnkfZAtIkUhwvZ4Xx1tA03i/JXF0Vvceg=; b=FzrNgBPyPTnvegL0yUpFQiC/Cs
	0UPX/Ltz1pXR0vbEQrZihD4bRtK0ZK4GvNCO4ut/2yrdzVAdorXJqXQiB/Z5If7Iv+dDI45u7OGQD
	LRZWxIQTCeT3X4er8YIH/y88Ptry13J7kA/xwyZ2FSINhQezRWVUUaar3/BmbSQ8ZfrS2fsszQSls
	1FcngyCja3VDLi0pi12elTnJpstPY25nhpMR4rbQvkVCMNkHoBC1Hd2daAUChX3SA+DEK0ctLH8/k
	s5cijkFWHj5xjZrzxlFuEMtBkYFnrgoxda4E7fw9TMXoLzmfsLqC7E3odnKKc2BEIM1GG/uelhs17
	15eiOx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeaw-00000004u8s-0hz6;
	Tue, 28 Jul 2026 09:59:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeav-00000004u8d-0z9g;
	Tue, 28 Jul 2026 09:59:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FCA44189F;
	Tue, 28 Jul 2026 09:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DC41F000E9;
	Tue, 28 Jul 2026 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232768;
	bh=XcpGEwAi/2YnkfZAtIkUhwvZ4Xx1tA03i/JXF0Vvceg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oNK++skCpKie7y91Mf4xhrJoE44OM2RCQgtjHIqx/mRp7w5oRQAJbeBu6uJ8wJNvV
	 sws0lWio7Bsuzhib5NY5fINLM/avUsuRaWKp7xRMBrbe0/6NVv+dG2BQSE/k7DLZfO
	 tPZlclunU96o0VdFCWsc2K0IdFmU/r0RtouWTm9dcLpnICdD7ynMyNl49e219kNwLv
	 j3RxuQbMSGMinDMJKwK1b5T6FC2cXFpWg7KH5NiNTlzzSh05FgJb7ehTMxqiLesG55
	 3vcQpTNxLOYb/moZIT3Y0m/pq8XlpUWeMPeStoldVzC5BmLrzLlWsJlXiHJPnqfN8E
	 gCakxy4UWzaVg==
Date: Tue, 28 Jul 2026 11:59:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, laura.nao@collabora.com, 
	fshao@chromium.org, wenst@chromium.org, jiapeng.chong@linux.alibaba.com, 
	frank-w@public-files.de, bchihi@baylibre.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Make resets
 optional for MT8196
Message-ID: <20260728-hopeful-phenomenal-stoat-3ec6e3@quoll>
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
 <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721105230.101906-2-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 21, 2026 at 12:52:29PM +0200, AngeloGioacchino Del Regno wrote:
> Both LVTS-AP and LVTS-MCU may be shared with SoC-internal MCUs
> running some sort of firmware that checks thermals in order to
> scale frequency, or to take action for critical SoC thermal
> protection - and this is seen on most MT8196 boards.
> 
> Make resets optional, as doing a HW reset on such boards will
> result in either an immediate thermal protect shutdown or in
> a rather important and usually permanent system slowdown.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/thermal/mediatek,lvts-thermal.yaml     | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


