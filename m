Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD771CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLd8tadd6RgVQITSoROvnyWzRDgtw6k0fr0kVxewnoo=; b=Jx8Q3/HEm+NiCduXh535yWCAb7
	9FDxDHIEhSn8Qd9xmXyHRzbpZtnhFnYWWbLPgjL56gWJelVtwAhvSXYggS3PD/eusg/8rs0Mhb4GK
	YSp6cONLOA51DY1u52Xisptb07N0l3LMP26+e9oo3Eo1B/yP8iKCX522ujOHUB5tOQwFar5LMqorX
	Bys8MSWRY0t192OGunV9q21lt4CZiwcRuWpiLyUou7CH1fmzKE2iVUTXHYq5I9Ne+S6X/bsNgFY0N
	vFomdqWhOIoevHGOnrXuct9n/tzLORaEBMuBdFudoj3tO2W+dopWIW6btK7vziru3UBRWBs9nPVOq
	MbqniBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx60-00000003g3o-2LYU;
	Thu, 07 May 2026 11:40:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx5x-00000003g2b-0ymo;
	Thu, 07 May 2026 11:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WLd8tadd6RgVQITSoROvnyWzRDgtw6k0fr0kVxewnoo=; b=uZP5i3W2+KimMtmYaSf/uCvKZV
	KEyBd0w83gRrX+PTidaEPIilv/qhe62UYI2lAj/K0byTUqyJbwrGo2gCcbCK4LPkVtg6wPs5ftYjX
	ozIbvqSh9uiA3fJ7f0VEp4u7jKiOczy7T+68cEov9WxUeFFsjwT+ZB3nFSwLA6tOoN8tXLo6FVRtU
	QGTTbDH6fkRLN7I/FE/0hdXG3WlkRH5cabBBT6Ik3cyVaXKP2AIYfax4nTSUkKy3LdLnNDKF2StmK
	NdX1WdSgOYlF8/0gtt7OVnSyZ7jSgNyGIsqgHIa8XFIZ0Su/0YfPFQBRuI5NDdMq9IEmEASsswJYs
	o+u0eUSQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: display: rockchip: analogix-dp: Expand
 clock-names "hclk" for the third clock
Date: Thu, 07 May 2026 13:40:09 +0200
Message-ID: <6496645.8F6SAcFxjW@phil>
In-Reply-To: <20260507112948.1115003-2-damon.ding@rock-chips.com>
References: <20260507112948.1115003-1-damon.ding@rock-chips.com>
 <20260507112948.1115003-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_044045_270071_E699B198 
X-CRM114-Status: GOOD (  14.46  )
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

Hi Damon,

Am Donnerstag, 7. Mai 2026, 13:29:39 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Damon Ding:
> The RK3588 eDP controller needs the video datapath clock "hclk" to work
> well. Previously, it works without explicitly adding this clock because
> the 'rockchip,vo-grf =3D <&vo1_grf>' property implicitly enables HCLK_VO1.
>
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add su=
pport for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/display/rockchip/rockchip,analogix-dp.yaml       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc5..d2bc8636b626 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -26,7 +26,9 @@ properties:
>      items:
>        - const: dp
>        - const: pclk
> -      - const: grf
> +      - enum:
> +          - grf
> +          - hclk

are you sure about that?

The edp uses the vo1-grf - so what enables its clock?
=46or example the hdmi controllers on rk3588 also use the vo1-grf and
explicitly handle that clock.

So who does it for the eDP?


Heiko

> =20
>    power-domains:
>      maxItems: 1
>=20





