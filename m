Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D78C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7XeSNwUSyKsnPHjzguFYMm/+HQnjTgqG1Z3ie3pBlE=; b=itO5NgveCXGcoTYLr9itckhyQ4
	g9sMq8y4WiVcWT6cDfdzPXH6LR6cjYdR18agYvdqWCekbR9F2maWBfGYNf1sg4KzaEbj1IU0AbYV2
	nGUBkZLs+wkWXcmINVevrxNpmDwNUCetCwgFGJ6PHaHw/2gNH5aBU76QVuQtjrvyx1ILWZVi6mPSj
	WrhMIsekBFnMMOiG854SKqFIHjXZhUr5PRsgqOCB2MfAA6dpZG8SCRhlU1+9AvQOGwazZwlWmpUc/
	NkrXvg2XygZ50uCq3n+oExLhE+zOMBNKMyOqZ1+U53+ZQA+0ybRQEvKdJgO5FIQj6A4CmXlWY5Zyi
	d4EJ9y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ptM-0000000AByx-1dDV;
	Thu, 10 Apr 2025 11:16:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nwd-00000009tOs-2Ky6;
	Thu, 10 Apr 2025 09:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Q7XeSNwUSyKsnPHjzguFYMm/+HQnjTgqG1Z3ie3pBlE=; b=k64BKgH2UFkjxG4Hthfdq7uVRP
	bYAoS6CUmGYx7xXgn1+VVf3RjjrbUYW5fNq+bxp1uO7DMOzVLjhD6FYaPk0YxTdx70jFgt/FdbjKx
	hn+5ant+gddH2+aUdKnm/V2OuA5//nbVyiCAZGhWVaDgDRxuKvHMunrDItSeCYABqoFSYjgBKqiDx
	KEp5DEIJP6uv7jCnxMb5tpp7y42m/3Ku4sT7kHOIUuUyWXrv3XILCQlQerunqrS8gyXNIA0Wcuzv/
	OQBi7bQ/coxWxu1xfcqFezqhP/Tn1hNpUvr9oGhQjrg4MUFP8aOICuFzyJINEXKWfT3vHcL6l3+16
	fwff5YEw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nwY-0003XO-TF; Thu, 10 Apr 2025 11:11:30 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Frank Wang <frank.wang@rock-chips.com>,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Add missing "phy-supply" property
Date: Thu, 10 Apr 2025 11:11:30 +0200
Message-ID: <4668554.cEBGB3zze1@diego>
In-Reply-To: <20250407165607.2937088-1-robh@kernel.org>
References: <20250407165607.2937088-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_021135_598690_7C8591A2 
X-CRM114-Status: GOOD (  13.32  )
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

Am Montag, 7. April 2025, 18:56:06 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring (Arm):
> Several Rockchip PHYs use the "phy-supply" property, but don't
> document it. Add it to the current known users.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
> v2:
>  - Drop maxItems
> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
>  Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml  | 3 +++
>  Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml  | 3 +++
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-co=
mbphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-comb=
phy.yaml
> index 888e6b2aac5a..3e101c3c5ea9 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.y=
aml
> @@ -42,6 +42,9 @@ properties:
>        - const: phy
>        - const: apb
> =20
> +  phy-supply:
> +    description: Single PHY regulator
> +
>    rockchip,enable-ssc:
>      type: boolean
>      description:
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yam=
l b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> index b42f1272903d..8b7059d5b182 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
> @@ -47,6 +47,9 @@ properties:
>        - const: pcs_apb
>        - const: pma_apb
> =20
> +  phy-supply:
> +    description: Single PHY regulator
> +
>    rockchip,dp-lane-mux:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      minItems: 2
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yam=
l b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> index ba67dca5a446..d7de8b527c5c 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
> @@ -46,6 +46,9 @@ properties:
>    reset-names:
>      const: phy
> =20
> +  phy-supply:
> +    description: Single PHY regulator
> +
>    rockchip,phy-grf:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: phandle to the syscon managing the phy "general registe=
r files"
>=20





