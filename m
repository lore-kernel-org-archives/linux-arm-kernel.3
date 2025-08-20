Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFD3CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcAm9yTTKvqNJOXNP8pEqbZUIKYNqPig/u1OHo43/AU=; b=AzKInhEUWWsaSNbEDN5PUNJgdZ
	PI9E3t/JU69pr7sTa/mKt074LV9/es8xZ+5ya7ensm3MwH6bz5N9p8r8qYjmlIvr/F5GdRpMcrXyK
	ESKKkWU/vFsRtRXIomcwC7dkWaH5OPoLMaLpQQRQSEYRRPqehRv8lAiQq0Rx8Qn6EcSE6QPqzDEWH
	t7xCz9IAnmMOOFsuDtbztID1iMGrbdQrHj4aDs8q56ovhs+1hyDDeVd4d9Hbw7ibzJtF3pAiNqPJm
	ipG0XEYEVW0UvwXBnPcsw8Nl9sNVTI8+pXDBDLT2n6VIGayONBKJeFhUpb5+UBhIPNJL9O5/djPCa
	L89YaZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoesT-0000000CrpV-00h7;
	Wed, 20 Aug 2025 09:13:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoe59-0000000Cihz-0DZc;
	Wed, 20 Aug 2025 08:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JcAm9yTTKvqNJOXNP8pEqbZUIKYNqPig/u1OHo43/AU=; b=cwIb+PwC9yFnPRQfveAMrK7LZo
	ree++Om7C7EhWBUGYfmLWFqIDBHm7X5pzJzjkXp5EjX0mPx1jts/jgcMMtG1ALBfeL6In6e/blUjr
	pJtVUJ9CQTkw0PgshK2hw/Zg04XH3tiSMv/BeZLr4eCQyuaiUXZas3OiYSOkWY7tnR48wi/FxAjQO
	i+kwMO8ihycvStlkduzclhDSB0d9u2us0nPdZ0JkQJDBgYFywEkm6mVN4lo0UMo8Xpa6KBZPy6zxT
	egkUxAt46xi97doBFnmuuiulLVRkeODq43eiaYHVS/z/Jf0vUR5oqSstSHwtmySvPp5p6zaw8oDsJ
	njdWopcA==;
Received: from i53875a0d.versanet.de ([83.135.90.13] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uoe4b-0003a0-N1; Wed, 20 Aug 2025 10:21:33 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings: display: rockchip,dw-mipi-ds: Narrow clocks for
 rockchip,rk3288-mipi-dsi
Date: Wed, 20 Aug 2025 10:21:32 +0200
Message-ID: <1829992.7aRn1RRit1@diego>
In-Reply-To: <20250820-dt-bindings-display-v1-3-d5b2555df51f@linaro.org>
References: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
 <20250820-dt-bindings-display-v1-3-d5b2555df51f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_012207_085404_1F41E1C1 
X-CRM114-Status: GOOD (  12.67  )
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

Hi,


Am Mittwoch, 20. August 2025, 09:02:42 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Krzysztof Kozlowski:
> The binding allows in top-level from one to four clocks and each variant
> narrows the choice, but rockchip,rk3288-mipi-dsi missed the minItems.

subject is missing an "i" in rockchip,dw-mipi-ds(i)

Other than that
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml      =
| 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,dw-mipi-dsi.yaml
> index 0881e82deb1105e4f92843380c0183569f688f08..c59df3c1a3f78ae0d345dc725=
f4dfb3eedb3de22 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi=
=2Ddsi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi=
=2Ddsi.yaml
> @@ -97,9 +97,11 @@ allOf:
>      then:
>        properties:
>          clocks:
> +          minItems: 2
>            maxItems: 2
> =20
>          clock-names:
> +          minItems: 2
>            maxItems: 2
> =20
>    - if:
>=20
>=20





