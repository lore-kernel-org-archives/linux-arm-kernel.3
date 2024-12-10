Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EE0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utTTuCvuh3w8J6nQIZy3AvdY9OBVE0hycTiZtgTEi6Y=; b=IvHGlOt1XK/fkTXMx244F6xH97
	OUpjiFwOl+HgtDr70Zk/Ez6AOIfhdkT54xDwD8DS5nXLXvGLDemKxPHa0+ZZn9BbTTsMnd8EVMOvn
	PN0cczw3cUCT70WfNpTh9/ULJGnSOh+p2juRlvvXgpi4v2YvYbljs6dZ5M9vPAZkiMmyRgEg0xIIx
	kWSgK9f3SqLC6irIi8bBFzXc387YCfMvGg3FXi+xWRj9mi+c6zC+ud9LybE1rkZB+Lm268L3QFbUY
	es7RTprBxF7kC/URumQB2oemiyHcQ0SUmrPxtmDNyYCtluxbgy+7n2J5oN09YTFQVCi5GBsVCz0Bd
	mR3AUvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxla-0000000BBWm-3pkq;
	Tue, 10 Dec 2024 10:46:58 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxkX-0000000BBFt-0vRB;
	Tue, 10 Dec 2024 10:45:54 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733827551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utTTuCvuh3w8J6nQIZy3AvdY9OBVE0hycTiZtgTEi6Y=;
	b=XJbG1lW0Cdd/1WVz8664gHslMX0L0NGOdEauAEbidL2Gz+zZANyaa5m3Y7MF+Jwx1FK1wx
	pqqqBhccPr0qh6EnZzwULif0FUZQ66Kxwgzs8vQB8yte7weND74C9EaecXpmqCgEglz0BF
	qFpD2qwgBraLaXi75Xt3CbLWHoxlNT2gf2NBcVG0NPl8XRo0iAyxPXCf52e4vWk8401iYh
	o9JK+th0SkNNtJx9t8m+GcLRSdvklGZGjF5jzws2NlAZxVD+uvUfVCoZb28YVZ2bhaxxxB
	Ur1oPJd18Q8Rtn2REqhJNcictZvuw6q2QD1ubROxoc/dBFmPPYJzGwR097EJOg==
Date: Tue, 10 Dec 2024 11:45:49 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: Remove address aligned beats
 from rk3328-roc
In-Reply-To: <20241210013010.81257-7-pgwipeout@gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-7-pgwipeout@gmail.com>
Message-ID: <2b68c2dd3618e5904a4eac1ec87d29a7@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_024553_552536_DEEB1A67 
X-CRM114-Status: GOOD (  18.65  )
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

Hello Peter,

Thanks for the patch.  Please, see some comments below.

On 2024-12-10 02:30, Peter Geis wrote:
> Since commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node for
> RK3399/RK3328"), the snps,aal, snps,txpbl, and snps,rxpbl nodes have
> been unnecessary in the separate device trees. There is also a
> performance loss to using snps,aal. Remove these from the rk3328-roc
> device tree.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> 
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> index 6984387ff8b3..0d476cc2144d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> @@ -155,12 +155,9 @@ &gmac2io {
>  	phy-mode = "rgmii";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&rgmiim1_pins>;
> -	snps,aal;

Huh, I see that quite a few RK3328 board dts files specify
the snps,aal node.  I wonder was it a "cargo cult" approach
at play, :) or was there some real need for it?

Actually, I see now that you added snps,aal to rk3328-roc-
cc.dts in the commit 393f3875c385 ("arm64: dts: rockchip:
improve rk3328-roc-cc rgmii performance."), so I guess that
your further research and testing showed that it actually
isn't needed for Ethernet stability?

>  	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
>  	snps,reset-active-low;
>  	snps,reset-delays-us = <0 10000 50000>;
> -	snps,rxpbl = <0x4>;
> -	snps,txpbl = <0x4>;

Unless I'm missing something, the commit 8a469ee35606 ("arm64:
dts: rockchip: Add txpbl node for RK3399/RK3328") doesn't add
the snps,rxpbl node to the RK3328 SoC dtsi, and the respective
driver does nothing about it when the snps,txpbl node is found.

Though, I see that rk3328-rock-pi-e.dts is the only other
RK3328 board dts file that specifies the snps,rxpbl node, so
it seems that removing the snps,rxpbl node here should be safe,
especially because it was you who added it in the same commit
mentioned above.  If there were some SoC-level issues, all
RK3328 boards would've needed it.

>  	tx_delay = <0x24>;
>  	rx_delay = <0x18>;
>  	status = "okay";

