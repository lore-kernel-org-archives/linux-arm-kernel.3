Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191D9CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+Qck0BDv7ZTXpJFYzm1NMiEfYWaCwEFZbxAeqU+Zn8=; b=XTs4ifDa0JBr4wwLpo5MyhRlAN
	HIGvi5vBSszv0ibyduk/G7ZfhQ2sMq5UYXQW2A9XqH4C9/Vm5yr+N6tAOeyBtxJWMZe9x5TnM7hS8
	VJbgVgyUh3kchpMlSJHXU67FL4xHZL2Hn6mNB4q5ZnlhLh/ZWirZwLFeymViDSKdXr2pWt13cxjV5
	2fMRRPT+e6vzjuRDOoZNJ6Qoyg0h8o4ovq2w6doxcovuWRWLn4u4IRyZ7HQpWayPW55AZqFaPFNLu
	/wq6uxqGeQjoS+rG1OdT+7m9DGQMTpEMi8ju9qjbODEwiBEHgx347R/QXqotiqqCByZUqWF1gZG9W
	lhZMF+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCWR-0000000A5RJ-0fZb;
	Mon, 12 Oct 2026 09:40:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCWN-0000000A5R1-3hoR;
	Mon, 12 Oct 2026 09:40:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53DB1600E2;
	Mon, 12 Oct 2026 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134BB1F0089B;
	Mon, 12 Oct 2026 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798039;
	bh=Y+Qck0BDv7ZTXpJFYzm1NMiEfYWaCwEFZbxAeqU+Zn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oxVwfPbWW4HWqQB5eVsRz66oS7TA8PnUW7DjBCTes+29KFtPu+5FV1FwCi8r/HFCC
	 RlO7d21TMxrPgATkXx6NCKSjuD+SrPTPezp79mVkElKwrBwZg81xjMrZnFab7qZ0en
	 OTiyg3LwKl0lZcEsnECif53YPojVmqyFT+IqtdyB4vcZ1SjKgSraWnjrvdwNbWtqU/
	 Hrhrlu21BuOHSCQPWfbvZWveeowof5xaGGyGvJJuHGXOLx7SEvCjp3r+hEgi6RUDX7
	 a5OfO47wpTRC7xULaUMODxkyO8+RvIEHBboXaQJNodZ+Unmmpwx1qjjGkHtoLiC9A3
	 dWYA9f9XvPxeA==
Date: Mon, 12 Oct 2026 11:40:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for
 mt8167
Message-ID: <20261012-quirky-emu-of-renovation-c217dc@quoll>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
 <20261010115539.9237-2-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010115539.9237-2-l.scorcia@gmail.com>
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

On Sat, Oct 10, 2026 at 01:54:01PM +0200, Luca Leonardo Scorcia wrote:
> The hdmi-phy for the MediaTek mt8167 SoC is not compatible with any of
> the existing hdmi-phy. Add a separate compatible to describe it.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> index ac93069f4801..f0c8ea2c72b1 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> @@ -31,6 +31,7 @@ properties:
>                - mediatek,mt8188-hdmi-phy
>            - const: mediatek,mt8195-hdmi-phy
>        - const: mediatek,mt2701-hdmi-phy
> +      - const: mediatek,mt8167-hdmi-phy

Why do you have flexible clocks?

Best regards,
Krzysztof


