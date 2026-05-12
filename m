Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E89CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVGJaRsPaWQvhBkp2c+5feFU2w28xNy7gZdEuN6mlRI=; b=fYshiHQonxCgytlIH3em8dsprr
	m28P03CwD12eoYuhT+2aodKjl24jn+1B7Jt5rXnF3lykPCNdd0jjfSKbc/JqKMchgSUTMYYk/Sf78
	L0b8TYSGQChix26CGyS99GxJYWMwS3WP6BXalGAje7/yzKrZI8uHt+EKay0p3DWaENY5/g/6q1sGQ
	DagkrRhD8heteJUf+I4f3cnPUelaPSNy7z5LdpB/3Ko450pOEhSTyNuQbgyer5SuUFF8p6MApCwqS
	uRdjoXtOsrfb3a3FAPGJWnFo4IbyGAVB3RV7B10wWM/YCRxd81Vsv0lPWPRYlNzMomp6pC/tawUGx
	35Dn1nCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqf5-0000000HVhK-0v1A;
	Tue, 12 May 2026 17:12:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqf4-0000000HVh8-3VEO;
	Tue, 12 May 2026 17:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0171860055;
	Tue, 12 May 2026 17:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6D8C2BCB0;
	Tue, 12 May 2026 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605969;
	bh=XYiPzpLygNAZ8LVk1NLSj512khlrWUZZeRiLupKTurk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvS8YEWVS+eRbweKu2UhBuJ39z2K3hW4igeeDM8AAtckOvm32E1MdHYnETwOSvO18
	 o2pz7VoyZwrNwEwjtr+ySDjdYpCnKuAyjW1tvBTJC4O4QKgKNTaeCilTVC6LlXD6T7
	 SsyyPUWo0cxz9t39oMwFI33RD2TLPtKJGmlVwkL9/pUEucRN5q+Ez/Rh2utTLtYf0L
	 MxpwLBAD5bPdiUlXW4BehXIJE+mBbqEvIr4rHOfADgNKElu3L8Wrk3fbiTBymjlRl3
	 MP4cAyJ/6++2YGBFBGyWa1/TchxGY+RjqWguIWSn9Hg3UrDA+MsEviMcver33Z5rdi
	 8A1EovEa8+dPw==
Date: Tue, 12 May 2026 18:12:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	nicolas.frattaroli@collabora.com, cristian.ciocaltea@collabora.com,
	sebastian.reichel@collabora.com, dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com, dianders@chromium.org,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: display: rockchip: analogix-dp:
 Allow hclk as third clock
Message-ID: <20260512-diabetic-ahead-dd36bc2d8be7@spud>
References: <20260512095644.1946084-1-damon.ding@rock-chips.com>
 <20260512095644.1946084-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GCWl3JYbBBSpU2el"
Content-Disposition: inline
In-Reply-To: <20260512095644.1946084-2-damon.ding@rock-chips.com>
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


--GCWl3JYbBBSpU2el
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 05:56:35PM +0800, Damon Ding wrote:
> RK3588 eDP controller requires HCLK_VO1 (video output bus clock)
> to access the VO1 GRF registers and enable the video datapath.
>=20
> Previously, the clock was enabled implicitly via the 'rockchip,vo-grf'
> phandle reference, which allowed the eDP to work without explicitly
> managing the hclk_vo1 clock. However, this is not safe or explicit.
>=20
> To align with other display controllers (HDMI) on RK3588 and make
> the clock requirement explicit, expand clock-names to support either
> "grf" (for older SoCs) or "hclk" (for RK3588) as the third clock.
>=20
> This makes the clock dependency clear and removes reliance on implicit
> clock enablement from GRF phandle.
>=20
> Fixes: f855146263b1 ("dt-bindings: display: rockchip: analogix-dp: Add su=
pport for RK3588")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> ---
>=20
> Changes in v4:
> - Modify the commit msg.
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

Could you also enforce the correct clock name on a per-compatible basis
please?

pw-bot: changes-requested

Cheers,
Conor.

> =20
>    power-domains:
>      maxItems: 1
> --=20
> 2.34.1
>=20

--GCWl3JYbBBSpU2el
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNfigAKCRB4tDGHoIJi
0tZJAP0W35XvDRqcoYGHpKWuxENPQgO0xXeFFAwEeudPh2923AEAk75EJGRt625l
yCmMZqWmhluPIQKm1SCrwiuqweX4Dw0=
=H1Kk
-----END PGP SIGNATURE-----

--GCWl3JYbBBSpU2el--

