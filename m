Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637D2CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r957v2CWrz1MjIvRcsu269D9FVC83NzhoDB9LUW/yek=; b=CNp1DmGacVGemHX51fVisr3C4W
	2r1U6M6KRa9FU+fZOXKW1hrRsmjWcV5DyMGp0kTf/C14KTJS97CgFLfDVZAUpmEsXzzq9pa3gZcvL
	Y2SkyEgG5uMdk0h5fJAHMIbcuRiPlXFVpfpcL+sP3IlMf+MDJ4tkPaGwRelxpoZObcaE5csQB/ti4
	5t9ekEeH11hf+80r0wc1SCrvCNRSnrxrtPhOF283fDyP7rDGJDwuH1PkAZ4Z3LlgTifzrzGq0eszc
	RAGKwhvbUG4dVhUzVLY4r4i+T2M5qwQrOjFx9knd6fFCvu88QBTeAhQteAKAF0jXgskDxstZIv9LS
	jufzGluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0J0-00000007usB-1EqK;
	Fri, 29 May 2026 16:43:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0Iy-00000007uru-3Und;
	Fri, 29 May 2026 16:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 081E46022D;
	Fri, 29 May 2026 16:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB111F00898;
	Fri, 29 May 2026 16:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073007;
	bh=r957v2CWrz1MjIvRcsu269D9FVC83NzhoDB9LUW/yek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eSi9kAZXupGxFPLy4ASfu+n36iRVBcamZ6fRqO8A5ZbTueEu4FXeAUjsrq/S9oQjd
	 dIWHg53c6IqAnk732NmRuFNnq3KWRtAmBQ4DVhTKf4YX9oSau0/+c1EOcnvBB6sPYN
	 mHvkZdq6+CaNH5PPsSYEln9oGOA4hBJfthYGNjk4gW4p/Q651oM4yuUUcyBQ8KjV0O
	 fMQeTKArAwX7f6Nwfv0SHKdowN8ZVaQ+IcrsN9dXgOphz8ckUjzrTrVkD1F1hn6IVB
	 zvlTX/+ByKxMQ2mXKL75mxb0QT/IdTHqfTqH1/ue/rSGqVYqeQWwNZpSKjghIFbsYk
	 V0eMJ7oYmML/A==
Date: Fri, 29 May 2026 17:43:20 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: display: bridge: analogix-dp: Add
 data-lanes support for endpoint
Message-ID: <20260529-concur-grandly-745bb08c1d3f@spud>
References: <20260529040530.741336-1-damon.ding@rock-chips.com>
 <20260529040530.741336-2-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5luu5ycDxMPs2Thy"
Content-Disposition: inline
In-Reply-To: <20260529040530.741336-2-damon.ding@rock-chips.com>
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


--5luu5ycDxMPs2Thy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 12:05:28PM +0800, Damon Ding wrote:
> Add data-lanes property support to the port@1 endpoint for physical
> lane mapping configuration.
>=20
> Lane mapping is mainly used for below scenarios:
> 1. Correct PCB lane swap and differential line routing crossover
>    without hardware changes;
> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
> 3. Support multiple panel hardware variants on the same board
>    by configuring data-lanes in device tree only.
>=20
> Additionally, add data-lanes setting in Rockchip eDP DT node example
> to show actual lane mapping usage.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Not entirely sure if this is correct, but I'll leave that decision up to
the display folks who know the hardware.
pw-bot: not-applicable
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> ---
>=20
> Changes in v2:
> - Add lane mapping application scenarios in commit message.
> - Remove redundant deprecated property 'data-lanes' for eDP node.
> - Update port@1 $ref to /schemas/graph.yaml#/$defs/port-base.
>=20
> Changes in v3:
> - Squash data-lanes adjustment of Rockchip eDP DT example into this
>   commit.
> - Add unevaluatedProperties: false to both the port@1 and endpoint
>   nodes.
> ---
>  .../bindings/display/bridge/analogix,dp.yaml  | 19 ++++++++++++++-----
>  .../rockchip/rockchip,analogix-dp.yaml        |  1 +
>  2 files changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,dp=
=2Eyaml b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> index 62f0521b0924..ecf206871cdd 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
> @@ -42,13 +42,22 @@ properties:
>      properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Input node to receive pixel data.
> +        description: Input node to receive pixel data.
> =20
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description:
> -          Port node with one endpoint connected to a dp-connector node.
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Port node with one endpoint connected to sink devic=
e node.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> =20
>      required:
>        - port@0
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc5..f690ee393fdb 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -117,6 +117,7 @@ examples:
>            reg =3D <1>;
> =20
>            edp_out_panel: endpoint {
> +            data-lanes =3D <0 1>;
>              remote-endpoint =3D <&panel_in_edp>;
>            };
>          };
> --=20
> 2.34.1
>=20
>=20

--5luu5ycDxMPs2Thy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnCKAAKCRB4tDGHoIJi
0krpAP9zkNijMkKB+OlQAVfE8qu8J6APtlizk/cPwZuBFwjGmQEA1qzuR9AdmjN2
NDIExP/FQCGHdc3jKLG6nIP56dmsvAQ=
=Mv2x
-----END PGP SIGNATURE-----

--5luu5ycDxMPs2Thy--

