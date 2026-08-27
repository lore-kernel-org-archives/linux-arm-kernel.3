Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA9DC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hAFo1rIdC3agJMCmmn/YuX832v7qzt/wzjEOyHEoqM=; b=kQQj7gBvDegMZLzusv5qZ1B33w
	Z+zJlcFAOnAB3KMyLsg66xoF718atPBZSCWap/cQ8HiCudsFsrTlSwPkIV4WTF+7Gj8dLLBlpqMY/
	4EAjJWl/r0UHS7TEw6yOl9qPBmZURMrlDff95pVIcFTtE96qt7IIYZrs0TEA4lN5uIMqKjf6s3468
	9fHs2Vgm+yrXgZY1A3H6HlsnTlh9GJwNIwnnjPYvVu3fn2cbWE5kRECS7nTlEVcMn3V2Lc9QntGfI
	YZfeBKV/N7L4ifzuZTy6GvuKk51qTpfL+IpbNElU8LQfmiRwV5vKghoCO1S/6xHt1fMHWYEQMRLIJ
	jiutG4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYYa-00000003uGd-0sCU;
	Thu, 27 Aug 2026 11:46:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYYW-00000003uGD-2L7L;
	Thu, 27 Aug 2026 11:46:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C7AB600D2;
	Thu, 27 Aug 2026 11:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3620B1F000E9;
	Thu, 27 Aug 2026 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787831163;
	bh=3hAFo1rIdC3agJMCmmn/YuX832v7qzt/wzjEOyHEoqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M5vc8wrpHzFOUTNBu00KgjoyXKJr1qmKCRQs0sIzSetk2k3grLN0i5IO6nivL324t
	 RgV7Z7wp4vIfWKwlCbxsG06aykfD+um8TfU4dSuiaeVCMsXKH4AVfwMypUbUL2xIXn
	 6nrXQ5kV21nxhcYAe+k+FzKPopwSONnvdU9N/zTzzM/mgv6AUprA82MJZsMnrnKWPu
	 T06cyHPvR9g4mX396zWHDyzxhu7c1pNX1yiXFC1cvpKQEsSMe5m+zQ3xtQLHIuYI2B
	 H0kx/uEQilZMsSeVxAbatuM/HE7xQnk+qB2+T2as2rSHoIkC4jWRiBbEnRlLVg5B2M
	 ArHH1oU7ZFRXg==
Date: Thu, 27 Aug 2026 13:45:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
Message-ID: <20260827-thundering-cream-saluki-dd05df@quoll>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
 <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-dcphy-rx-v1-v4-1-f1797634233d@gmail.com>
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

On Fri, Aug 21, 2026 at 08:02:29PM +0800, Jason Yang wrote:
> A MIPI D-PHY or C-PHY can be a transmitter (DSI) or a receiver (CSI),
> and in some PHY blocks both work at the same time. The existing
> PHY_TYPE_DPHY and PHY_TYPE_CPHY cannot tell whether a consumer wants
> the transmitter or the receiver.

The consumer knows this already, no? Imagine consumer of the phy is some
ISP receiving data over CSI for given port, thus consumer cannot
transmit over that link.

All this seems redundant.

> 
> Add PHY_TYPE_DSI and PHY_TYPE_CSI, so that a binding can select both
> D-PHY or C-PHY and transmitter or receiver. They do not replace
> PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice where a cell
> selects the mode. The first user is the Rockchip RK3588 MIPI DC-PHY
> binding.
> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Link: https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Where is any DTS using it? I did a search and no results of upstream
posting.

> ---
>  include/dt-bindings/phy/phy.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 979b5dfd8353..8ee3f88e6d80 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -24,6 +24,8 @@
>  #define PHY_TYPE_CPHY		11
>  #define PHY_TYPE_USXGMII	12
>  #define PHY_TYPE_XAUI		13
> +#define PHY_TYPE_DSI		14
> +#define PHY_TYPE_CSI		15

DSI and CSI does not look like types of PHY...

Best regards,
Krzysztof


