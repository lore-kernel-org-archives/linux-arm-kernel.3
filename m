Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952C0C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynUIE+OmGITuTnDcYm4pdy5E15n1t8RviFFzWHgFPBQ=; b=ouEm6Zy930rgS1y9eGlHwkHnv0
	sfU+IWxweEVxEfrLKHbwgyccwU+QDg4j1l3a261AQsQgVsogR0pVuIAouK3NptBEKIlWmTO6LxeY5
	t+XELt6DfdyUTUhwQE4fAUFTI0QqlDQJsEU+/grKIVhqV7YDXJEwUbEhigmksuS8V+q8w2SE54D2J
	I72coU28WltDTsZxFpakE8hMG6vq3zP9Ezn2uEy3RrTx7YN9TL/2aS5TEmKNP+xOzpDuwKXfNXXoW
	gHu4jSdX4qPDQMsR6pj6s3btgtNZVooVBCrqZpp4O8KD+QZSmQLPM40srVXWmYhdjeCooq1yShCE8
	E7eyDeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM6q-00000009rPU-13lz;
	Thu, 30 Jul 2026 08:27:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpM6o-00000009rOx-2qaM;
	Thu, 30 Jul 2026 08:27:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7992C600B0;
	Thu, 30 Jul 2026 08:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093921F000E9;
	Thu, 30 Jul 2026 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785400036;
	bh=ynUIE+OmGITuTnDcYm4pdy5E15n1t8RviFFzWHgFPBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YGORvmoonkdoewLciDAteO2KJ+3ljKDoXhdVceRx1MQblS/hxzAlNumE6DegrAgoM
	 Zcgtg9bNa35V4lD6OvtC/bJa4Z7nda/TOHETtITwT7n6yrGNGehZdcG1sB+o47Y9e1
	 OS086oRjJUHJWz4uPDrgOA1ayuR6dtb055dWa2CBfO+4mFHchvXsZ/BFuvaEOyTSc4
	 R+rItOGG9z9ZbrYGU9AAdwtKpigwvUn3L43zXnIYTqaImXFcOQjfA2wA/qd53xC92n
	 0SGAoJVhIS/hrew2ODhgZWXv3Por6U7OXARoHqlz94+wVqdycwyeJNVrolpawBJV4B
	 GGgtCRyXc2A0A==
Date: Thu, 30 Jul 2026 10:27:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gavin Gao <attinagaoxu@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, richardcochran@gmail.com, nicolas.frattaroli@collabora.com, 
	sebastian.reichel@collabora.com, sashal@kernel.org, alchark@gmail.com, chaoyi.chen@rock-chips.com, 
	amadeus@jmu.edu.cn, rmk+kernel@armlinux.org.uk, horms@kernel.org, 
	alok.a.tiwari@oracle.com, david.wu@rock-chips.com, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: rockchip-dwmac: Add 25M
 refout clock
Message-ID: <20260730-lucky-strict-oryx-9ce8de@quoll>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
 <20260727021048.3375444-2-attinagaoxu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727021048.3375444-2-attinagaoxu@gmail.com>
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

On Mon, Jul 27, 2026 at 10:10:45AM +0800, Gavin Gao wrote:
> Some Rockchip GMAC instances can provide a 25 MHz reference clock output
> for an external RGMII PHY.
> 
> Add a clock name for this 25 MHz reference output so SoC dtsi files can
> describe it separately from the existing MAC reference clocks.
> 
> Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 0ac7c4b47d6b..074ac274f2e0 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -81,6 +81,7 @@ properties:
>          - pclk_mac
>          - clk_mac_ref
>          - clk_mac_refout
> +        - clk_mac_25m_refout

That's the same as clk_mac_ref and clk_mac_refout. clocks are not
outputs but inputs, so explain how does the device take three SAME
clocks: clk_mac_ref, clk_mac_refout and clk_mac_25m_refout?

Best regards,
Krzysztof


