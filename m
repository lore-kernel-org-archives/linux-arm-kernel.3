Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE2EE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uti47nxIlujfO/RLB6rLQKovjAamYSW9jMRrqa7O1Dw=; b=ld3PXoUKBjPOlzsQ+hnBcKTR6O
	tuqr5rMc7wDWGqLXU72/ef8uMErm2IcHywJ0lLoWTMala/uGdiK4Ftea5Xrn/FxdMRlf9bEnx4xJw
	TabECHoVa2RM3JLuBA7/5gxV53pegj4YeNN6RLhZ1IhsU0DAmRYFMB4Trc3IyuYVFAFy5QTT4+eM3
	9qV652gUb2n33S4Rfq1P/pZVHbIH7+0npP4IPY2pr7Md8Y//3V6nm36OgD4i6SGMs49184pMqW1Y3
	2Fn7pt1YhezdETnCaOpOfWwVg8ceBQKankMK/OcQ0by1Sb2/obLXPFTGaMtvV0RlBKrUBSC70clvV
	jeyNovug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbst-0000000EY5m-0LMI;
	Thu, 26 Dec 2024 00:37:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbrf-0000000EXv1-1eVd;
	Thu, 26 Dec 2024 00:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uti47nxIlujfO/RLB6rLQKovjAamYSW9jMRrqa7O1Dw=; b=B9+KZqp4Z2WMWTE6mL9ngpeskF
	a46Im25nzzZkNfnZplEZHQCfmLTBXMJg9phtBuMETPuwvdvD75N2j0KAHVljp8xJA+nFzxMNb5Pr7
	kMPMnq21vGCjunZMcuqvIT7dLcSK21mBBHAD8Ac2cFERi4w3NZJm9ggGNpJmfnDXsQunxsbFyS5U8
	Z+8OeF0etDH3QSCGuxqbtlux42q4HG6o8/G1kBkL0J0H40SLyLBhZ/uTQL9VkDKfWZK6DxgE+BWNk
	4lclilv6JiDbfvoenKcXOBzhQRK+6ZpgE3M58tTPhQw78mJZRbTCZn6BcMNuQBuVzdwhQYDc5KGgo
	U0BUP2uA==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQbrb-0004Hq-27; Thu, 26 Dec 2024 01:36:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 05/17] dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
Date: Thu, 26 Dec 2024 01:36:30 +0100
Message-ID: <2545931.ElGaqSPkdT@phil>
In-Reply-To: <20241224094920.3821861-6-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-6-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_163635_439498_014170DF 
X-CRM114-Status: GOOD (  13.25  )
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

Am Dienstag, 24. Dezember 2024, 10:49:08 CET schrieb Kever Yang:
> rk3562 i2c compatible to the existing rk3399 binding.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> index a9dae5b52f28..8101afa6f146 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
> @@ -37,6 +37,7 @@ properties:
>                - rockchip,px30-i2c
>                - rockchip,rk3308-i2c
>                - rockchip,rk3328-i2c
> +              - rockchip,rk3562-i2c
>                - rockchip,rk3568-i2c
>                - rockchip,rk3576-i2c
>                - rockchip,rk3588-i2c
> 





