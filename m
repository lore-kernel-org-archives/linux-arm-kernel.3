Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5766FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/K9hBM1ahbCox43xtF1LZVqi9LX5rDK4epEjlbtsY0=; b=GoeIw6Qul9sPJnLonKBjwwoI8a
	mGI85ZU7SovlS9i6tFIJyn06WOXbMnPMqk79Vz5eyceKWSLNUN267pv5KWgBLRIfG0PbmaQLwsCiW
	+lUqpTFFJmGa23fNskCsf4U6TRDy4aTtWvTx6VG5Vm5Ouz7nVZPNpQJavcjEzKdwlQ5w4ZRGbqpvb
	uZY6vE+StUNRCcZ54z3QQ+Cl8W9X0vxzOoqPVquSrOWoX3gKbSp2LQt0ESQawvC2+a8hqweujDxta
	WY2CBxMyz5NzD5cmADTEm7+ryENsIxMHF/Tk1CUeJyljmM2aoYUr3y9mc0x69iu3hPQ8Y7rvyUGrl
	MHn1TaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepRx-00000000uYF-2PTO;
	Wed, 01 Jul 2026 07:33:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepRw-00000000uY3-08vz;
	Wed, 01 Jul 2026 07:33:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B4FF600AB;
	Wed,  1 Jul 2026 07:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0885E1F000E9;
	Wed,  1 Jul 2026 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782891215;
	bh=k/K9hBM1ahbCox43xtF1LZVqi9LX5rDK4epEjlbtsY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UVyGlBp0oHITYtLgXPffpOmwMSWfODSRCnpN4fuVUdT2CiJQhIKDTXTwovisFiENs
	 YwaxyAG9g8q4wIbS2D3cAIOaXYnkgRuGehymbiHWtkRzFwVpHi/H3WxLil8gM9rJ7n
	 qDie/7vFFKeWoqFsqfJvUn1yjWPeKWLjXjNykwZfAblPW3FuqfZ7N4DmNCYnFGS5AC
	 EOpkGt7B8/2MlCDZzmkprgEPzEjRdaqvvSqSGzHFEblf4IZpapyWEQr8gHsx9z5ZrW
	 vyRiiaMls6fjmZOG0ugsO7Ps99PmAmdISxVRPOh5m001F9rEKgA9LHuImf2jsnMPJr
	 zIYWM03F5TNeA==
Date: Wed, 1 Jul 2026 09:33:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mkl@pengutronix.de, mailhol@kernel.org, kernel@pengutronix.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawn.lin@rock-chips.com, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	quentin.schulz@cherry.de, zhangqing@rock-chips.com, 
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/6] dt-bindings: can: rockchip_canfd: add compatible for
 the RK3588 variant
Message-ID: <20260701-sensible-cryptic-ocelot-58035b@quoll>
References: <20260630164336.3444550-1-heiko@sntech.de>
 <20260630164336.3444550-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630164336.3444550-2-heiko@sntech.de>
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

On Tue, Jun 30, 2026 at 06:43:31PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The RK3588 uses a variant of the CAN(-FD) controller introduced at first
> with the RK3568 SoC.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
> index a077c0330013..02211ea3ec41 100644
> --- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
> @@ -20,6 +20,7 @@ properties:
>        - items:
>            - const: rockchip,rk3568v3-canfd
>            - const: rockchip,rk3568v2-canfd
> +      - const: rockchip,rk3588-canfd

So this is just an enum with the first entry.

Best regards,
Krzysztof


