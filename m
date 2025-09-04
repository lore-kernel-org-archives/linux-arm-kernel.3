Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B2FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQoA71SAHLiH62hCxmhWSU0mb2Z9p2nFQZWzZ0FN5Bo=; b=JlOtJ/UKs7wLJSk6w+/8oUp3fq
	UsEvih7KiYlM0EEWmYHeIz7Uh7AbWjEt7u97ltZD/LQ5zmTqnrq3MRAnW/qPPzankHwrmeMiy2wG8
	wdAg6zBY6XfAbz9uCl5Et+H4NUSlYYi9dYhg8Wv8Up33vBav8ONxySfOespcnHOSCg1tFzMiS5yLW
	7oG8EShoqY6DeWi2f9gL1tmPUY9cpH3w7bo8EhDGmRu9lYSkrbpQnaAkL2JK/stfSZiQ70roz/X0I
	J5K8elxLoKo0U19c9oYM++BVgLfbhN2wlckYRcxmavTqpEGjItjSd9Ob6tO0puSnNmt4V5+RiAve3
	D0lMYNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4l8-0000000A0TE-07O4;
	Thu, 04 Sep 2025 07:51:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4Pq-00000009s45-35za;
	Thu, 04 Sep 2025 07:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC0276026D;
	Thu,  4 Sep 2025 07:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5A1C4CEF0;
	Thu,  4 Sep 2025 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756970993;
	bh=eH8cDvd3H9MNJ1WHvOF2gG+uBWrtr7bwcPe6463npC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBzro54aaf5Bkj6Fbxh6cMvQqaTCuRaTOGYkgsZjs88yn5wB0CP/pUhDUewAQquvd
	 uvzDDDTu5+jqiPTGMR/wCNUPGiE6s6Ej6SLK7DHuh1JRphufwJde9wvPtscdqRlesz
	 XmwfWzkokpHts8S1ILk/97skW1ut5htRsl5FfL1O30ArsSzKgRsfS5HZjGkUfCDPy+
	 XelhXSCb6vQXwcyLZR0PuscvNABDMUOJ5hyQDZXh50KU0vku4FSiOQo3FfBgjVNhoi
	 TBtjXLVuN+ZZ4YUO/eW4DNYygkHgBlh2zwb+FwVnNgMRL5LGmdCG0SAycA8Dqldc8a
	 ouwRBhY9WmHOg==
Date: Thu, 4 Sep 2025 09:29:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Collabora Kernel Team <kernel@collabora.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 3/7] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3588 variant
Message-ID: <20250904-space-swift-of-acumen-2fa4dc@kuoka>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
 <20250616-rk3588-csi-dphy-v4-3-a4f340a7f0cf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-rk3588-csi-dphy-v4-3-a4f340a7f0cf@collabora.com>
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

On Wed, Sep 03, 2025 at 07:04:51PM +0200, Michael Riesch wrote:
> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> Add the variant and allow for the additional reset.
> 
> While at it, fix the description of the first reset in order to avoid
> confusion.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 50 +++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


