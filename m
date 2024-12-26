Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998BBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 00:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVUOoOUpQeEBvO1qM1vAdUojdFi2eQVCv9h2wfb1gxI=; b=IWugv9vm0S2Sz0ldHtMpi84gP6
	r2m23797//oEwnCHDzusIhT0IOha1Y3o9qdTyYx1+dhFgT2Ve10WbExRNGY5UnMqiaazUwHKzc1yV
	FBmEeyK2A4nXYET3A9pUsbLZQ4ma2OhKXJ5xQTs0JnjoIzHmG8sf9SGStzzC0R+AjPVUAc4NpL2aw
	XG0Ugpq5TAmRAAXeH3o4NwrX3wdcx2qCNg446enzgTursxncdYUbMXSEc5VC0uX5POUPLMygC0qeA
	2ITKAJqjuSXDzrCuMV5VvygnzkIexn9G93k42YHJWJwtNGteBdLxBpaTU23kRkOq6WVRM8rjH3HlQ
	Bt/NUHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbu2-0000000EYDv-0bYJ;
	Thu, 26 Dec 2024 00:39:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQbsA-0000000EY0d-42Ca;
	Thu, 26 Dec 2024 00:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DVUOoOUpQeEBvO1qM1vAdUojdFi2eQVCv9h2wfb1gxI=; b=yVrgVqVtiEsk2Tkyc+rsnt/Hen
	yCi4FLQ8oVMgOiDPim2Il7tZiIz+qGghrhZPZYABpCU3oeaH00uEFpBEklmTr9kLZ60A0IHKlrSis
	4TmMs4TzoxHaMkWaKPRVpYqSINWhzEakQkhmKwqBIBwXFOGtu3v413WD3xKUbkGPwBAkEq3CjRVD5
	a85JxnpxJoOEZr7U6GwjRySPN3+nbAnSb2z64C7w+56YU3wujx1XP+A/mi6xPC8nINFDm77YvRxMI
	HnmoDls9+lGwH5OEc1pZERIzYDb9ZgRr3B/YogeFlYLV56ORknuu8srEkNOUkFMvuUdLUAFwvhJ7M
	qOb3JBPw==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tQbs4-0004IU-C9; Thu, 26 Dec 2024 01:37:00 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Finley Xiao <finley.xiao@rock-chips.com>,
 Rob Herring <robh@kernel.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 04/17] dt-bindings: power: rockchip: Add bindings for rk3562
Date: Thu, 26 Dec 2024 01:36:59 +0100
Message-ID: <2102620.tdWV9SEqCh@phil>
In-Reply-To: <20241224094920.3821861-5-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-5-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_163707_008406_965141C2 
X-CRM114-Status: GOOD (  13.48  )
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

Am Dienstag, 24. Dezember 2024, 10:49:07 CET schrieb Kever Yang:
> Add the compatible string for rk3562 SoC.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> 
> Changes in v2: None
> 
>  .../devicetree/bindings/power/rockchip,power-controller.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> index 650dc0aae6f5..79b948518f0c 100644
> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.yaml
> @@ -40,6 +40,7 @@ properties:
>        - rockchip,rk3366-power-controller
>        - rockchip,rk3368-power-controller
>        - rockchip,rk3399-power-controller
> +      - rockchip,rk3562-power-controller
>        - rockchip,rk3568-power-controller
>        - rockchip,rk3576-power-controller
>        - rockchip,rk3588-power-controller
> 





