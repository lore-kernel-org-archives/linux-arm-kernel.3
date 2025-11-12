Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803A1CD3440
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn5+v+YRqPOYKMI70V7Ug9OJMW8jYzYaM1zPOOBe5vE=; b=TLgCg6QhBkc9BCs7fty1wTgewQ
	KE75RuRlbK5b52ncb08QeZgSHEKqGyC14PEZx7VhHsWm+R5UpPx64KHI5t+OTBbFWCRN3ZA0Uu26V
	Is1jzKz9aEzUlaG3sHsVa3SEmt4UuXHKq8FRAV40rokth8UGGAzEJIepOwvIoqbDDSpryqdRuIUXO
	GpxDKRYZr03hWW0sV1o+zprQ4EJ0qebh3TtpftalG9C2/rb4zsiMc+22w/WJAfpwhHtkHyPYMHJfQ
	PBi81L5n3zYlRQWuG0okC86/UkbQnYqqa0ft8Sh70MQnvgN8n3x2SnW5pnneRvhc48viO9vyonHgy
	UeplPgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJG8v-00000009Ony-1pgR;
	Wed, 12 Nov 2025 19:04:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJG8u-00000009Ono-1Jrx;
	Wed, 12 Nov 2025 19:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67FE3601A5;
	Wed, 12 Nov 2025 19:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDD9C4CEF5;
	Wed, 12 Nov 2025 19:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762974271;
	bh=OsZBDvzHWBseg3Knx1k9apRw+CVUYMUDRIxIjk6M13w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EN1ilMGgWW8T6uXzRy1PpJ6wHDNYjkIgRF8C2S09QM6Pp9dTc64ppdgUJytGHFD9f
	 c18leiGKUMZKJ6nA+8vHY5Ux8zQ45jfQRox2kXQo9HqKLBBfqVLTYI26r3GR6a4sFV
	 rYtq0SqLkeF9ihQdQJycAlh16u09SIbV7B9cRgo4HINTUnsnUNzm2oe2ftrT+mJ3TH
	 xaia2aPceqtEnq/hZryp5jnqH+9Gcr4IWlACvomiq48jDKc1xGXkkqHvv/PAgJI5kR
	 Ys4Hk0KGfofvnbp9rP5+1Qqq+UfsNw8M4ABS7k6okOZPJduSN3NEyJp1qmnpPj0qr5
	 cn7FxoPbcD0og==
Date: Wed, 12 Nov 2025 19:04:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mkl@pengutronix.de, kernel@pengutronix.de, mailhol.vincent@wanadoo.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, cl@rock-chips.com, linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v8 1/4] dt-bindings: can: rockchip_canfd: add
 rk3576 CAN controller
Message-ID: <20251112-surely-enroll-02a3a3646084@spud>
References: <20251112015940.3695638-1-zhangqing@rock-chips.com>
 <20251112015940.3695638-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EQbl/SQeCGRxcKF0"
Content-Disposition: inline
In-Reply-To: <20251112015940.3695638-2-zhangqing@rock-chips.com>
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


--EQbl/SQeCGRxcKF0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 09:59:37AM +0800, Elaine Zhang wrote:
> Add documentation for the rockchip rk3576 CAN controller.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/net/can/rockchip,rk3568v2-canfd.yaml  | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-=
canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-ca=
nfd.yaml
> index a077c0330013..22e10494e7d1 100644
> --- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> +++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.y=
aml
> @@ -10,13 +10,12 @@ title:
>  maintainers:
>    - Marc Kleine-Budde <mkl@pengutronix.de>
> =20
> -allOf:
> -  - $ref: can-controller.yaml#

Since in the other mail it was stated that this was removed in error
pw-bot: changes-requested

--EQbl/SQeCGRxcKF0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTaOgAKCRB4tDGHoIJi
0qoVAP4ySdGjjDkARJ7pR6fmuWavLo9sUrf8lfFCP/JEOD1eUgEApqQ3+nwlh4ab
e8WwfeqUajB1sRAcrjGqY5QGC287OQY=
=K1Vm
-----END PGP SIGNATURE-----

--EQbl/SQeCGRxcKF0--

