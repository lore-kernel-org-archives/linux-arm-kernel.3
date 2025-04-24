Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863E5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWIkITNULwbEhgyDuy1hBGsbbRolTaUyIbEjhTt1Pb0=; b=fyDpQV/O40VfJ3WZ1gQQuCVq2x
	S6LAvIKwgPQcwRK1Z4PiUckdQwBMUuGVAuxQPrAV0SRuKjhMzUbUVfhK3F7rcaTb9MzTm5ZEDahHj
	mYhcja9zdhVJcOwnK5B7WYLI588EbW07Ws7LwXCmgTvnoymrw3v6b622Yrd7MApPnpJAU4AWTTEvX
	J6kXX2Ou9Mz/XaXWluFbvjZ2WRD1a25jRtnlUPpOxExxpA6FUyI+a5PeK3FIGRDL5MrTxNcpJk7Tl
	vhPUko5mlVKKVd4i/8oKKiCbdqJZ0/tMWQ1MfEwtSDK3ZkT8KRoZXpsJSYnXetkNegdUv/yf36s5h
	+W83POxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rCV-0000000DDgA-16EJ;
	Thu, 24 Apr 2025 07:40:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r7Q-0000000DClS-3vYz;
	Thu, 24 Apr 2025 07:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95AB268455;
	Thu, 24 Apr 2025 07:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DD2C4CEE3;
	Thu, 24 Apr 2025 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480136;
	bh=sV/Yr3t57Hh/fnbj2+R1XyIyQYmRB7215HEEUpCxgYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELlU6AYusnI8ir3dVO55soTQNJSzVBOn/7GbD/RxuNat+/E45JAoE6sKxpq1PbBMU
	 itGPjl+465sDgV94/T4xi1geU3PT+VT4FvrPiapx7lVmnv94NsDyMXuNUDnh6rZRV7
	 QVv6cuYPx7O/HHrJie6gbNvZ8fhaAkTqMO9UXgwYqylF11+mCpIRbsXXi1y3OWM6RD
	 icfkLOJ/+1f+w5TV7+qm1bAj7goVryAtGeY+e4EQQMP7It/makIhEHnodHMgdqeCKl
	 n9w+OIKzh8VOE9OH7bxSg/jTCw259zNDWlOy0tr8Z0r//x0RV0RYGYoLKDIhQrlWkG
	 zOgABwaEMMYSg==
Date: Thu, 24 Apr 2025 09:35:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
Message-ID: <20250424-cornflower-waxbill-of-promotion-4e24a7@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-6-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-6-linux@fw-web.de>
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

On Tue, Apr 22, 2025 at 03:24:28PM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for Mediatek mt7988 topmisc syscon.
> This hardware block contains 2 functional blocks
> 
> - a powercontroller which is not needed (switched by atf)
> - a multiplexer for high-speed Combo-Phy
> 
> This compatible is only for the multiplexer part.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


