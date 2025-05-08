Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91287C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+ZizUotZK/18JQ4QX3F6gdp6ns7bch/VC6ViFwIDYA=; b=RsBvpT5Iam3/pDUnMoMrzvxHnD
	eD5mPplMWw/upeHRoMEOnPcTmAbhg82zQP+JIm6UIKla6WjTpKWOyxMdagDhRLZHNQY+JtZw5ZvC6
	FdnVVPLzQIg+/LjDrQlGIIzrSLTeh/VqC5DKfk57L7Ub+vUtyVNlwOexqCU2PMorLfJ67oaluXBQ4
	PMCj1d9Y9qSOJOlZBcUDGE1Wkig33CH/F0YCymoo36GnlTQ2lcbMKP92z3rF6kYSk4B1vYmyxYAdt
	mpCmkz8S3FZus0nz23VYSWuMEJMpHbklj2oqRI0jH1BxN5K4C8xp4W90RoY9sgu4rPy/u7zr0yoKb
	jtrVBTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4wG-00000001NyS-48SY;
	Thu, 08 May 2025 17:21:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4qr-00000001MA4-0YRt;
	Thu, 08 May 2025 17:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b+ZizUotZK/18JQ4QX3F6gdp6ns7bch/VC6ViFwIDYA=; b=x/vmDNAvCAAs+eu7Ag26+PGRjQ
	uPnX3w4LUrTOG4lTqzHXTl2DnEQ2rXTVVDiWHPeIjepWDFpsiKAzrXHv4T+P4c+6fID8zNtKRM1G6
	djVR6xBgD6v4fD6Xqt7LynBWNJgy0Mx1i9FCBKL/L4EZSw6PK8SQBe0xPyIIWGIXtfD25io88xL+Z
	c0MHOadpyo/aBsrjTe2pu9l/4gXpif2I6v2jaEiEtBfMJWWw5po2ImxFJllX6KlfvPxtpv8nT2dqI
	pUEOxephowVfF+I0PWQQg5orL9tTaFyO89uaoirRY6qY02TTQTc9mbgyzMxLFFQWUeZhSoXpPlERD
	rjK/Hrkg==;
Received: from [61.8.144.177] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD4qg-0007uM-1c; Thu, 08 May 2025 19:15:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add RK3528
 variant
Date: Thu, 08 May 2025 19:15:52 +0200
Message-ID: <6254524.DvuYhMxLoT@phil>
In-Reply-To: <20250508134332.14668-4-ziyao@disroot.org>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508134332.14668-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_101605_186756_F5E7CF47 
X-CRM114-Status: GOOD (  12.13  )
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

Am Donnerstag, 8. Mai 2025, 15:43:30 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Yao Zi:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 888e6b2aac5a..bd064754e537 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - rockchip,rk3528-naneng-combphy
>        - rockchip,rk3562-naneng-combphy
>        - rockchip,rk3568-naneng-combphy
>        - rockchip,rk3576-naneng-combphy
> @@ -102,7 +103,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-naneng-combphy
> +            enum:
> +             - rockchip,rk3528-naneng-combphy
> +             - rockchip,rk3588-naneng-combphy
>      then:
>        properties:
>          resets:
>=20





