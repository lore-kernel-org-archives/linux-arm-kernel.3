Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF1ED13587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKXnJ+3ZHZ/yTs9JtXhaDAQdob8C4v+k9MBr+9h2oR4=; b=3T7hvOKFjqxiZSTalBWGo7iUn/
	HyVjjiKgPlYcEZn/0/m0TDd/cOilPqUU4haOQ0lcrbKvGt8K+/Y9/mVEM+ao60usmm80BW7veBhB3
	YK3WyhfIl/WuCP/0ug17WfmKQ5Xt7UqPOGa8eCBV8w61wIYpKnuA79XgLzkIa4RbUly0k7DkBvn1t
	5GfpJYyp2NJOYavxXQkREHU+putsGAFzZRj3p6y5blzhOsWoN+YVG5tu1Gl2wuKVj6BywmXDDxgk+
	DNyp7iXQ9uTkSfxHJjL+YFufaQ/UVK082voIHoNd9Up43bIZJ9Ke7qbxYv17byY+aIjVs1g1sYibK
	eE/f1joA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ABo-00000008sfc-3Rfe;
	Sun, 27 Oct 2024 20:48:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AAE-00000008sTk-1YpP;
	Sun, 27 Oct 2024 20:47:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 730845C589B;
	Sun, 27 Oct 2024 20:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C81C4CEC3;
	Sun, 27 Oct 2024 20:47:04 +0000 (UTC)
Date: Sun, 27 Oct 2024 21:47:02 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Parthiban <parthiban@linumiz.com>, Yangtao Li <frank@allwinnertech.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 05/13] dt-bindings: usb: sunxi-musb: Add A100 compatible
 string
Message-ID: <cdfocja5u4jh6xh2jkouzyztsjinggep45ymbdwxc4zpscy376@i5voj36oqrrf>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
 <20241024170540.2721307-6-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024170540.2721307-6-masterr3c0rd@epochal.quest>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_134706_478386_914F0BF1 
X-CRM114-Status: GOOD (  12.93  )
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

On Thu, Oct 24, 2024 at 02:05:23PM -0300, Cody Eksal wrote:
> The A100 MUSB peripheral has 10 endpoints, and thus is compatible with
> the A33 version.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> index f972ce976e86..d4993336a29b 100644
> --- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> +++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
> @@ -24,6 +24,7 @@ properties:
>                - allwinner,sun8i-a83t-musb
>                - allwinner,sun20i-d1-musb
>                - allwinner,sun50i-h6-musb
> +              - allwinner,sun50i-a100-musb

List looked ordered, now doesn't.... are you sure you keep intented
ordering here?

Best regards,
Krzysztof


