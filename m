Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A02C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RggIXQChyrd9PGRMbf+vMro4+L7wE747ABQYOAEiDL0=; b=jZMUXFDgDwqdazLFXp4BOhpKQw
	GPZVdYnQLVEncoNTMjblIk0OcW/73HfCWPa7Li4cVhkGoREBAGCIsM4TTPCzrMGtvA9g1C+PR2WP+
	ObldNaCGM0hj4G8OZ+kk5nbNWA2Aw8XL0WH0BlB3AA/pDg1Lqr08MN4Zdj4tWrc9hizg0cwSrXuuI
	tFkH58MaYpQ8WlF8objpfkONyTwRO2M8qVCnV05lpPByUtM2UkF5eGNU01RZNp+3cDsAhSjAvU+uc
	enPaoAe3V9WhlwToaCJAjB9kRaFl/kHHgFikIrGd5trUhwQAYjAIcTsGOO0+hfUhDUw7FDLXKJJAl
	zUiAcXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCEH-00000003mIg-3qeE;
	Thu, 02 Jul 2026 07:53:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCEH-00000003mIU-09Nc;
	Thu, 02 Jul 2026 07:53:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 250AE60120;
	Thu,  2 Jul 2026 07:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A267B1F000E9;
	Thu,  2 Jul 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978779;
	bh=RggIXQChyrd9PGRMbf+vMro4+L7wE747ABQYOAEiDL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=env7wj8wcJfIuCtiqo2vta7nC186527y80FragjdAc/RxQ5ScaDRP4J4T3DllIWsE
	 y/oCXXrMyyA10nC8qPxYSwd9jLj272kw1s9l2jnzrnuCSuw9xezvcyfbUTosfMLlrt
	 S0RLngLUyu20SuO6o4/xwJ1cmZzVnqkogmrOauVjic58rC30njyzut0demB8x2BXFK
	 J1t65ElN9x8747Pzzi0vsBEeTaC/dP3bearigkZWFXVZ/G1n9vct3IIDoW5etiX7B6
	 sS1h3pACCRoAzYaNqxDHEiq5ouMcX7h+rD6WjrFR+K2TVYP+60La/bQVogr1LPx8bX
	 uucpi7VH4ZLIw==
Date: Thu, 2 Jul 2026 09:52:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, matthias.bgg@gmail.com, 
	andi.shyti@kernel.org, djakov@kernel.org, broonie@kernel.org, jitao.shi@mediatek.com, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH 1/6] dt-bindings: soc: mediatek: mutex: Improve title and
 description
Message-ID: <20260702-congenial-honest-platypus-39d90a@quoll>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122043.19612-2-angelogioacchino.delregno@collabora.com>
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

On Wed, Jul 01, 2026 at 02:20:38PM +0200, AngeloGioacchino Del Regno wrote:
> Improve both the title and the description of this hardware to
> disambiguate its functionality from a hardware mutex and/or from
> a hwspinlock.
> 
> Though in datasheets this is called "DISP_MUTEX", the meaning is
> is "Mute-X" (where "X" means "any hardware trigger signal") really
> as this is what this piece of hardware does: muting or unmuting of
> signals in each sub-IP of the display or other multimedia related
> controllers.
> 
> Based on that, also clarify the description text, as to make sure
> that the information is actually accurate.
> 
> While at it, also avoid forcing literal blocks in the description
> as there is nothing in there needing that (no ascii graph or other
> stuff that needs a literal block anyway), and add myself in the
> list of maintainers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/soc/mediatek/mediatek,mutex.yaml   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


