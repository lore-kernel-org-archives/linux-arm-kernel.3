Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C42C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzweluziVE+nXppIY3tQG+1kclvmLaL+PJ795RBjHww=; b=ireAliyFwf84rzVAJcq2rQdnyw
	JE8xeK5G4cgoIucAQzAEiboWef5V5/nWeNLZGvkCDBdypki29I3vJ+5gkkl3zuq56HJG/TqWFdbin
	4l70NyrTn4nMhBzLSIs4oQcfmqNpWNrjBS8JJYeIKTTUFfsMrAlFGoozzl8Sk+VDLXwdCXe5ysCWG
	S/jNWzzcz4lQq/aXIABvPi166Fb0iiMPxHWp8doB5rUCcvfJnvfHJWyz9SRZh17XHRtPhGeWKEhht
	zk9bSFEZi4wfKdozAmiYV90LPP52+1HxHT3jN42RY3WwEbvZgS1sDRZU79yTU0+nqPyUGw7QYJ/fd
	1Jfq1iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4x5-0000000CaEB-1fxf;
	Wed, 30 Apr 2025 10:46:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4af-0000000CVwx-2J7w;
	Wed, 30 Apr 2025 10:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED5F96111C;
	Wed, 30 Apr 2025 10:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AC0C4CEE9;
	Wed, 30 Apr 2025 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746008576;
	bh=3Yw9ztdY5WEc4kBWw0QPEtWQp8inoc+qPFkV13xi6rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHtxCrlVKQ/c7Di3/EPrP4Klw2sjrcpp0ng93iIQd0JjoHnRQLbGXkbhx0Ujz2zAV
	 HD9gcP5h6jiGU6nFPnu3w7h7kdZuCma8f8/q4OSJYysgOnWqOdrhoHDd0495PHeNjl
	 Wf5/QpHW0IamoyeZrvBi3oBvlEOs0Hsmjp0WpzDEDF+NT8WAR0eVsVuT/ZX2ddHB+r
	 YyDeS/9KFYdtYvMrBPY+yNzmYbHTTV0bacwcDYUgTc/8rvkxXsm7VFLdaTmJshfgfv
	 kP5mio1gMtnGEA3czsFJiYTbseAmQAhUsUcGN+xcN6TdurME3r26bA3Iqzm/Zv8LKU
	 mz+b/rVpnf0mw==
Date: Wed, 30 Apr 2025 12:22:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Kever Yang <kever.yang@rock-chips.com>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>, 
	Jimmy Hon <honyuenkwun@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Alexey Charkov <alchark@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add rk3399 industry
 evaluation board
Message-ID: <20250430-light-chital-of-cookies-b8f2ab@kuoka>
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427094211.246-2-kernel@airkyi.com>
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

On Sun, Apr 27, 2025 at 05:42:10PM GMT, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add devicetree binding for the rk3399 industry evaluation board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


