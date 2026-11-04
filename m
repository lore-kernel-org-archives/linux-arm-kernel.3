Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CE1606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivVjy7Xq;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=HprGKrTr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D6EynbrAyE4kBCRtfAuXRbcm+KrJUZjKmPIkF+rnkGE=; b=ivVjy7Xq/j/mNnyZCvYP5JpPJd
	npNbc32EbqZWZNwBwoJYcvXKB2//rIb4Gs5xrkSlsEJtBlPLOnqznwO3yMoH4XZU0ReY1wE5X3oUZ
	YlkUehYVu1eE5lAwMGdDTrq0uaLew3M+hi51j3sxiXvFYSo4bqkTyFa7/hG7/7vHzi0STaq9lHdkE
	jRYgwNTp5RUOfzn776a1PbbjJSYTJ/M3HJ17hzYsr+/lFNQKjY9IRp+q4BZ35WQ5J+7mxatkj3VBv
	82/pwWyu4IrW6IbSgBcJbA6B5NGH+yqXmL97pnW3Z3vzudzEgYVNrrPFlzF05JHvCtv9/FlUN1xs7
	gnqSEUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYlI-000000055Pg-2sa6;
	Wed, 04 Nov 2026 11:02:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYlF-000000055Oq-2NwJ;
	Wed, 04 Nov 2026 11:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=D6EynbrAyE4kBCRtfAuXRbcm+KrJUZjKmPIkF+rnkGE=; b=HprGKrTrwC+A6mzuC5DOgjQHfS
	9qs/Upv6aoKHG/RC8l/fMPvz6uAI9m6ULjaFh0EJqly5ovt/0VvP5KYdJRBwMz0rk+pft8OZzS+92
	849Q7YRLbD4aNTLZ2CkjJrhujXha78Xa/8NaNc92aWMrJpPvzMccTJwnDxg/nlhP+kwRw5G1H9Z+A
	Y4M9jo7W49Tk66EBbJDF8kT2pr7PJiZm5MPdKfgTeiH6C3Eu4ZnhChxCo5tiuZ7kkGPfu1Jtv0c4I
	UpzG9FmCH0IyiUCX+ggLidwZAWo4lmOqV8jNDjPiI+y5VRvll40JKas30nrfAh0tiUYPPtgj6/v5A
	7zta+zuw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: tomeu@tomeuvizoso.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 ulfh@kernel.org, p.zabel@pengutronix.de, ogabbay@kernel.org,
 zhangqing@rock-chips.com, Jiaxing Hu <gahing@gahingwoo.com>,
 chaoyi.chen@rock-chips.com
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 jeff.hugo@oss.qualcomm.com, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v15 08/15] dt-bindings: iommu: rockchip: describe the RK3576 NPU
 MMU
Date: Wed, 04 Nov 2026 12:02:02 +0100
Message-ID: <15606397.O6BkTfRZtg@diego>
In-Reply-To: <20261101082307.151957-9-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-9-gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_030233_674060_66C345CE 
X-CRM114-Status: GOOD (  12.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Sonntag, 1. November 2026, 09:23:00 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Jiaxing Hu:
> The RK3576 NPU MMUs are rk3568-iommu compatible but take five clocks
> instead of two. Give them their own compatible and pin both clock counts =
in
> allOf.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/iommu/rockchip,iommu.yaml        | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml =
b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> index 6ce41d11ff5e..83d7e7c8e0c2 100644
> --- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - rockchip,rk3576-iommu
> +              - rockchip,rk3576-npu-iommu
>                - rockchip,rk3588-iommu
>            - const: rockchip,rk3568-iommu
> =20
> @@ -42,14 +43,22 @@ properties:
>      minItems: 1
> =20
>    clocks:
> +    minItems: 2
>      items:
>        - description: Core clock
>        - description: Interface clock
> +      - description: Compute clock
> +      - description: Convolution buffer core clock
> +      - description: Convolution buffer interface clock
> =20
>    clock-names:
> +    minItems: 2
>      items:
>        - const: aclk
>        - const: iface
> +      - const: npu
> +      - const: aclk_cbuf
> +      - const: hclk_cbuf

I'd really like more justification in the commit message, why these
additional clocks are needed.

Not saying this is wrong, just should get a bit more explanation.


Heiko



