Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFE5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BScecOlitLDYz10/Pf4DyteBIAZlmTyE+E+GTseRLyI=; b=vMelmXZepQ1RuE6BYSFkSb+FAO
	FAmWO9p7W8T33tMJY9caun/Amk0XKOtWWzLbjV5VnfgSE9MBvqsDp8EAjz9bngvuM0cFNgMiIDo8x
	g/5umAV5bRa1IkNkOJYy9mfUKQA7PcHofY/CO8zmiWfu0c8BlpdPEnG6uwcKsx2y9l59LX9XFgHgg
	aSJNAp+59FsLtxu6Qx41cjZJ0ib0ISqiZNj+bRecyc2JZhxlilY271Qq497U7JAZ0p9JuFuCITkgi
	yN/86Z5Zw1H3aEnyGhKjGjMOQoIa3HFMmzFOCFEIZUboUzF4mCOqNxTjf8oiB3XUt7/8YyPXXPi/f
	eXG4FTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZpR-00000006fFh-3dNl;
	Sat, 11 Jul 2026 15:41:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZpQ-00000006fFV-2xIz;
	Sat, 11 Jul 2026 15:41:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DCC8140F89;
	Sat, 11 Jul 2026 15:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05CD1F000E9;
	Sat, 11 Jul 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783784479;
	bh=BScecOlitLDYz10/Pf4DyteBIAZlmTyE+E+GTseRLyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JIIKj/4Z/c0vfipK5zYFpxj1IzCMO+3hbKqyDa5e+9Ge3sh08vK5zkM1n4Xx1fFB7
	 r65JP9oAi+j6RLofHTRFShoffxbzRbQpUabAhtDsOZrm+YkECMPbSP7XRYDzehA+Si
	 SsiRc7wajwOOgq4I6SpNaWZPm0U3mjabRPsrthqPjaWnf5v0O5gumzQr6KQ3445j8c
	 jDQGKHYj3w4kwCabyRdwV4lbDUt1n3qcmIQgcpSpHQMzQ7i8vXHEa0RIEDgTMXLGga
	 355wp/6EnWrJ0odjl89DWq4cSptNQ5m6uQLf3fqtf9hNC5eBG8pTaYNgs+b3ytQQzz
	 zqDk0cNwM4xcg==
Date: Sat, 11 Jul 2026 17:41:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: Document MT8195 and MT8196
 DisplayPort PHYs
Message-ID: <20260711-spiritual-wildebeest-from-uranus-0fce41@quoll>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:34PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the DisplayPort and Embedded DisplayPort

"Add binding"


> PHYs found in the MediaTek MT8195 SoC (and variants of) and for
> the Embedded DisplayPort found in the MT8196 SoC (and variants).
> 
> This PHY supports varying impedance calibrations for the various
> signals to reach an optimal EYE signal pattern for any specific
> board(s), especially useful for very high bitrates such as HBR3
> and higher, depending on board design.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/phy/mediatek,mt8195-dp-phy.yaml  | 77 +++++++++++++++++++

I guess this answers my question about deprecated nvmem which I sent
some minutes ago. I did not see any lore link in that cover letter,
which would be nice in that case.

Anyway,

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


